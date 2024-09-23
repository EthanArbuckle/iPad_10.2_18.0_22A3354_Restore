@implementation SBAppLayout

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (id)leafAppLayoutForRole:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout leafAppLayoutForItem:](self, "leafAppLayoutForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemForLayoutRole:(int64_t)a3
{
  SBDisplayItem *v5;
  BOOL v6;
  NSArray *itemsWithoutCenterOrFloatingItems;
  int64_t v8;
  SBDisplayItem *floatingItem;

  v5 = -[NSArray count](self->_itemsWithoutCenterOrFloatingItems, "count");
  if (a3)
    v6 = (unint64_t)a3 <= 0xA;
  else
    v6 = 0;
  if (!v6)
    goto LABEL_5;
  if (a3 == 1)
  {
    if (!v5)
      return v5;
    itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
    v8 = 0;
LABEL_19:
    -[NSArray objectAtIndex:](itemsWithoutCenterOrFloatingItems, "objectAtIndex:", v8);
    v5 = (SBDisplayItem *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  if (a3 != 2)
  {
    if (a3 == 3)
    {
      floatingItem = self->_floatingItem;
    }
    else
    {
      if (a3 != 4)
      {
        v8 = a3 - 3;
        if ((unint64_t)v5 >= a3 - 2)
        {
          itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
          goto LABEL_19;
        }
        goto LABEL_5;
      }
      floatingItem = self->_centerItem;
    }
    v5 = floatingItem;
    return v5;
  }
  if ((unint64_t)v5 >= 2)
  {
    itemsWithoutCenterOrFloatingItems = self->_itemsWithoutCenterOrFloatingItems;
    v8 = 1;
    goto LABEL_19;
  }
LABEL_5:
  v5 = 0;
  return v5;
}

- (id)leafAppLayoutForItem:(id)a3
{
  id v4;
  int64_t v5;
  NSUInteger v6;
  SBAppLayout *v7;
  SBAppLayout *v8;

  v4 = a3;
  v5 = -[SBAppLayout layoutRoleForItem:](self, "layoutRoleForItem:", v4);
  if (v5 == 1 && (v6 = -[NSArray count](self->_items, "count"), v4) && v6 == 1)
  {
    v7 = self;
  }
  else
  {
    if (!v4)
    {
      v8 = 0;
      goto LABEL_9;
    }
    -[SBAppLayout _leafAppLayoutForItem:role:](self, "_leafAppLayoutForItem:role:", v4, v5);
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (void)enumerate:(id)a3
{
  void (**v4)(id, int64_t, _QWORD, char *);
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, int64_t, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_items;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, -[SBAppLayout layoutRoleForItem:](self, "layoutRoleForItem:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), (_QWORD)v10), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t __38__SBAppLayout_containsAnyItemFromSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (int64_t)layoutRoleForItem:(id)a3
{
  id v4;
  NSUInteger v5;
  int64_t *v6;
  int64_t v7;

  v4 = a3;
  v5 = -[NSArray indexOfObject:](self->_itemsWithoutCenterOrFloatingItems, "indexOfObject:", v4);
  switch(v5)
  {
    case 0uLL:
      v6 = &SBLayoutRolePrimary;
      goto LABEL_13;
    case 1uLL:
      v6 = &SBLayoutRoleSide;
      goto LABEL_13;
    case 0x7FFFFFFFFFFFFFFFuLL:
      if (v4)
      {
        if (BSEqualObjects())
        {
          v6 = &SBLayoutRoleCenter;
LABEL_13:
          v7 = *v6;
          goto LABEL_14;
        }
        if (BSEqualObjects())
        {
          v6 = &SBLayoutRoleFloating;
          goto LABEL_13;
        }
      }
      v6 = &SBLayoutRoleUndefined;
      goto LABEL_13;
  }
  v7 = v5 + 3;
LABEL_14:

  return v7;
}

void __48__SBAppLayout_containsItemWithUniqueIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __45__SBAppLayout_appLayoutWithItemsPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v4)
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
  }

}

void __41__SBAppLayout_continuousExposeIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "containsObject:", v4);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
      v4 = v6;
    }
  }

}

- (SBAppLayout)initWithItems:(id)a3 centerItem:(id)a4 floatingItem:(id)a5 configuration:(int64_t)a6 itemsToLayoutAttributes:(id)a7 centerConfiguration:(int64_t)a8 environment:(int64_t)a9 hidden:(BOOL)a10 preferredDisplayOrdinal:(int64_t)a11
{
  id v18;
  uint64_t v19;
  SBAppLayout *v20;
  SBAppLayout *v21;
  uint64_t v22;
  NSArray *items;
  NSArray *v24;
  uint64_t v25;
  NSArray *itemsWithoutCenterOrFloatingItems;
  NSDictionary *itemsToLayoutAttributesMap;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  SBDisplayItemLayoutAttributes *v35;
  SBDisplayItemLayoutAttributes *v36;
  NSDictionary *v37;
  void *v38;
  uint64_t v39;
  NSDictionary *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  id v51;
  id *v52;
  id v53;
  id v54;
  id *v55;
  uint64_t v56;
  id v57;
  SBAppLayout *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  SBAppLayout *v68;
  SBAppLayout *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  SBAppLayout *v80;
  objc_super v81;
  _BYTE v82[128];
  uint64_t v83;
  SBDisplayItemLayoutAttributes *v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  v18 = a4;
  v66 = a5;
  v70 = a7;
  v19 = objc_opt_class();
  v64 = v18;
  if (v19 == objc_opt_class())
  {
    if (!v18)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 333, CFSTR("This might not work for subclasses"));

    if (!v18)
      goto LABEL_5;
  }
  if ((objc_msgSend(v67, "containsObject:", v18, v18) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_5:
  if (v66 && (objc_msgSend(v67, "containsObject:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v70)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 336, CFSTR("itemsToLayoutAttributesMap cannot be nil"));

  }
  if (__allAppLayoutsOnceToken != -1)
    dispatch_once(&__allAppLayoutsOnceToken, &__block_literal_global_211);
  v81.receiver = self;
  v81.super_class = (Class)SBAppLayout;
  v20 = -[SBAppLayout init](&v81, sel_init, v64);
  v68 = v20;
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_centerItem, a4);
    objc_storeStrong((id *)&v68->_floatingItem, a5);
    v68->_configuration = a6;
    v68->_environment = a9;
    v68->_centerConfiguration = a8;
    v68->_cachedAppLayoutType = -1;
    v68->_hidden = a10;
    v68->_preferredDisplayOrdinal = a11;
    v22 = objc_msgSend(v67, "copy");
    items = v68->_items;
    v68->_items = (NSArray *)v22;

    v24 = v68->_items;
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke_2;
    v79[3] = &unk_1E8E9DF50;
    v69 = v68;
    v80 = v69;
    -[NSArray bs_filter:](v24, "bs_filter:", v79);
    v25 = objc_claimAutoreleasedReturnValue();
    itemsWithoutCenterOrFloatingItems = v69->_itemsWithoutCenterOrFloatingItems;
    v69->_itemsWithoutCenterOrFloatingItems = (NSArray *)v25;

    itemsToLayoutAttributesMap = v69->_itemsToLayoutAttributesMap;
    v69->_itemsToLayoutAttributesMap = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v28 = v68->_items;
    v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v76 != v30)
            objc_enumerationMutation(v28);
          v32 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i);
          objc_msgSend(v70, "objectForKey:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
            v35 = v33;
          else
            v35 = objc_alloc_init(SBDisplayItemLayoutAttributes);
          v36 = v35;

          v37 = v69->_itemsToLayoutAttributesMap;
          v83 = v32;
          v84 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary bs_dictionaryByAddingEntriesFromDictionary:](v37, "bs_dictionaryByAddingEntriesFromDictionary:", v38);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = v69->_itemsToLayoutAttributesMap;
          v69->_itemsToLayoutAttributesMap = (NSDictionary *)v39;

        }
        v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      }
      while (v29);
    }

    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend(v41, "appendInteger:", v68->_environment);
    v43 = (id)objc_msgSend(v41, "appendInteger:", v68->_configuration);
    v44 = (id)objc_msgSend(v41, "appendInteger:", v68->_centerConfiguration);
    v45 = (id)objc_msgSend(v41, "appendBool:", v68->_hidden);
    v46 = (id)objc_msgSend(v41, "appendInteger:", v68->_preferredDisplayOrdinal);
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v47 = v68->_items;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v72 != v49)
            objc_enumerationMutation(v47);
          v51 = (id)objc_msgSend(v41, "appendObject:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j));
        }
        v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      }
      while (v48);
    }

    v69->_cachedHash = objc_msgSend(v41, "hash");
    v21 = v68;
  }
  v52 = v21;
  v53 = v52[10];
  v54 = (id)__allAppLayouts;
  objc_sync_enter(v54);
  objc_msgSend((id)__allAppLayouts, "member:", v52);
  v55 = (id *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    objc_msgSend((id)__allAppLayouts, "addObject:", v52);
    v55 = v52;
  }
  objc_sync_exit(v54);

  v56 = objc_msgSend(v53, "copy");
  v57 = v55[10];
  v55[10] = (id)v56;

  v58 = v55;
  return v58;
}

- (BOOL)isSplitConfiguration
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __144__SBAppLayout_initWithItemsForLayoutRoles_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v5 = v6;
  }

}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 itemsToLayoutAttributes:(id)a5 centerConfiguration:(int64_t)a6 environment:(int64_t)a7 hidden:(BOOL)a8 preferredDisplayOrdinal:(int64_t)a9
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBAppLayout *v22;
  uint64_t v24;
  _QWORD v27[4];
  id v28;
  id v29;

  v13 = a3;
  v14 = a5;
  v15 = (void *)objc_opt_new();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __144__SBAppLayout_initWithItemsForLayoutRoles_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke;
  v27[3] = &unk_1E8EABFB0;
  v28 = v13;
  v29 = v15;
  v16 = v15;
  v17 = v13;
  SBLayoutRoleEnumerateValidRoles(v27);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v24) = a8;
  v22 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](self, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v16, v19, v21, a4, v14, a6, a7, v24, a9);

  return v22;
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__SBAppLayout_containsItem___block_invoke;
  v7[3] = &unk_1E8EA85E0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBAppLayout enumerate:](self, "enumerate:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (BOOL)isOrContainsAppLayout:(id)a3
{
  SBAppLayout *v4;
  id *p_isa;
  unint64_t v6;
  uint64_t v7;
  int64_t environment;
  BOOL v9;
  void *v10;

  v4 = (SBAppLayout *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = -[NSArray count](self->_items, "count"), v6 > objc_msgSend(p_isa[14], "count")))
  {
    v7 = objc_msgSend(p_isa, "environment");
    environment = self->_environment;
    if (environment == v7 || (v9 = 0, v7 == 3) && environment == 1)
    {
      objc_msgSend(p_isa, "itemForLayoutRole:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBAppLayout containsItem:](self, "containsItem:", v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (int64_t)environment
{
  return self->_environment;
}

- (int64_t)configuration
{
  return self->_configuration;
}

uint64_t __28__SBAppLayout_containsItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (int64_t)preferredDisplayOrdinal
{
  return self->_preferredDisplayOrdinal;
}

- (SBDisplayItem)floatingItem
{
  return self->_floatingItem;
}

- (SBDisplayItem)centerItem
{
  return self->_centerItem;
}

- (int64_t)centerConfiguration
{
  return self->_centerConfiguration;
}

- (id)anyLeafAppLayout
{
  return -[SBAppLayout leafAppLayoutForRole:](self, "leafAppLayoutForRole:", 1);
}

- (id)leafAppLayouts
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](self->_items, "count") == 1)
  {
    v10[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_opt_new();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__SBAppLayout_leafAppLayouts__block_invoke;
    v8[3] = &unk_1E8E9E3B0;
    v8[4] = self;
    v5 = v4;
    v9 = v5;
    -[SBAppLayout enumerate:](self, "enumerate:", v8);
    v6 = v9;
    v7 = v5;

    return v7;
  }
}

- (id)allItems
{
  return self->_items;
}

- (id)layoutAttributesForItem:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_itemsToLayoutAttributesMap, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)switcherLayoutElementType
{
  return 0;
}

- (id)zOrderedItems
{
  NSArray *items;
  _QWORD v4[5];

  items = self->_items;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __28__SBAppLayout_zOrderedItems__block_invoke;
  v4[3] = &unk_1E8EAC3F0;
  v4[4] = self;
  -[NSArray sortedArrayUsingComparator:](items, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((BSEqualObjects() & 1) != 0)
    v3 = 0;
  else
    v3 = BSEqualObjects() ^ 1;

  return v3;
}

- (BOOL)containsItemWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBAppLayout_containsItemWithUniqueIdentifier___block_invoke;
  v7[3] = &unk_1E8EA85E0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBAppLayout enumerate:](self, "enumerate:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBAppLayout descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBAppLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__SBAppLayout_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __53__SBAppLayout_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  id v21;
  unint64_t v22;
  __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "configuration");
  if (v2 - 1 >= 4)
    v2 = 0;
  v3 = *(void **)(a1 + 40);
  SBStringForSpaceConfiguration(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("configuration"));

  v5 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(v11, "bundleIdentifier");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v16, v15);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v8);
  }

  v17 = *(void **)(a1 + 40);
  objc_msgSend(v17, "activeMultilinePrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v5, CFSTR("itemsToLayoutAttributes"), v18, 0);

  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v19 > 3)
    v20 = 0;
  else
    v20 = off_1E8EB2AD0[v19];
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v20, CFSTR("environment"));
  v21 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("hidden"), 1);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v22 > 2)
    v23 = 0;
  else
    v23 = off_1E8EB2AF0[v22];
  objc_msgSend(*(id *)(a1 + 40), "appendString:withName:", v23, CFSTR("centerConfiguration"));
  v24 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), CFSTR("preferredDisplayOrdinal"));
  v25 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "continuousExposeIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendString:withName:", v26, CFSTR("continuousExposeIdentifier"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v28 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v38;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
        SBLayoutRoleDescription(objc_msgSend(*(id *)(a1 + 32), "layoutRoleForItem:", v33, (_QWORD)v37));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v33, v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v30);
  }

  v35 = *(void **)(a1 + 40);
  objc_msgSend(v35, "activeMultilinePrefix");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v27, CFSTR("layoutItems"), v36, 0);

}

void __41__SBAppLayout_succinctDescriptionBuilder__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E8EC7EC0;
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  SBLayoutRoleDescription(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendString:withName:", v13, v15);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBAppLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  SBAppLayout *v4;
  int64_t centerConfiguration;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  unint64_t environment;
  __CFString *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "homeScreenAppLayout");
  v4 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    objc_msgSend(v3, "appendString:withName:", CFSTR("HomeScreenAppLayout"), 0);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__SBAppLayout_succinctDescriptionBuilder__block_invoke;
    v12[3] = &unk_1E8EA43C0;
    v13 = v3;
    -[SBAppLayout enumerate:](self, "enumerate:", v12);

  }
  centerConfiguration = self->_centerConfiguration;
  if (centerConfiguration)
  {
    v6 = CFSTR("page");
    if (centerConfiguration != 1)
      v6 = 0;
    if (centerConfiguration == 2)
      v7 = CFSTR("fullScreen");
    else
      v7 = v6;
    objc_msgSend(v3, "appendString:withName:", v7, CFSTR("centerConfig"));
  }
  v8 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_hidden, CFSTR("hidden"), 1);
  environment = self->_environment;
  if (environment > 3)
    v10 = 0;
  else
    v10 = off_1E8EB2AD0[environment];
  objc_msgSend(v3, "appendString:withName:", v10, CFSTR("environment"));
  return v3;
}

- (BOOL)containsAnyItemFromSet:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SBAppLayout_containsAnyItemFromSet___block_invoke;
  v7[3] = &unk_1E8EA85E0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBAppLayout enumerate:](self, "enumerate:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

+ (id)homeScreenAppLayout
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SBAppLayout_homeScreenAppLayout__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeScreenAppLayout_onceToken != -1)
    dispatch_once(&homeScreenAppLayout_onceToken, block);
  return (id)homeScreenAppLayout___homeScreenAppLayout;
}

- (NSString)continuousExposeIdentifier
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__73;
  v11 = __Block_byref_object_dispose__73;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__SBAppLayout_continuousExposeIdentifier__block_invoke;
  v6[3] = &unk_1E8EA6040;
  v6[4] = &v7;
  -[SBAppLayout enumerate:](self, "enumerate:", v6);
  objc_msgSend((id)v8[5], "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("&"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v7, 8);
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsWithoutCenterOrFloatingItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay, 0);
  objc_storeStrong((id *)&self->_cachedLastOverlappingModelKey, 0);
  objc_storeStrong((id *)&self->_cachedLastAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_itemsToLayoutAttributesMap, 0);
  objc_storeStrong((id *)&self->_floatingItem, 0);
  objc_storeStrong((id *)&self->_centerItem, 0);
}

- (int64_t)type
{
  int64_t result;
  void *v4;
  unint64_t v5;
  void *v6;
  BOOL v7;

  result = self->_cachedAppLayoutType;
  if (result == -1)
  {
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "type");

    +[SBAppLayout homeScreenAppLayout](SBAppLayout, "homeScreenAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBAppLayout isEqual:](self, "isEqual:", v6);

    result = 1;
    if (!v7 && v5 != 1)
    {
      if (v5 > 6)
        result = -1;
      else
        result = qword_1D0E89FF8[v5];
    }
    self->_cachedAppLayoutType = result;
  }
  return result;
}

- (SBAppLayout)appLayoutWithItemsPassingTest:(id)a3
{
  id v4;
  id v5;
  SBAppLayout *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int64_t configuration;
  int64_t environment;
  int64_t centerConfiguration;
  int64_t v20;
  int v21;
  unsigned int v22;
  id v23;
  SBDisplayItem *centerItem;
  SBDisplayItem *floatingItem;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__73;
  v39 = __Block_byref_object_dispose__73;
  v40 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __45__SBAppLayout_appLayoutWithItemsPassingTest___block_invoke;
  v32[3] = &unk_1E8EB2A50;
  v5 = v4;
  v33 = v5;
  v34 = &v35;
  -[SBAppLayout enumerate:](self, "enumerate:", v32);
  if (!BSEqualArrays())
  {
    if (!objc_msgSend((id)v36[5], "count"))
    {
      v6 = 0;
      goto LABEL_45;
    }
    v7 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = (id)v36[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_itemsToLayoutAttributesMap, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v13, v12);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
      }
      while (v9);
    }

    if (self->_centerItem)
      v14 = objc_msgSend((id)v36[5], "containsObject:");
    else
      v14 = 0;
    if (self->_floatingItem)
      v15 = objc_msgSend((id)v36[5], "containsObject:");
    else
      v15 = 0;
    v16 = objc_msgSend((id)v36[5], "count");
    configuration = self->_configuration;
    if ((unint64_t)(configuration - 2) < 3 && (v14 << 63 >> 63) - (unint64_t)v15 + v16 <= 1)
      configuration = 1;
    environment = self->_environment;
    if ((_DWORD)v14)
      centerConfiguration = self->_centerConfiguration;
    else
      centerConfiguration = 0;
    if (self->_centerConfiguration)
      v20 = centerConfiguration;
    else
      v20 = 0;
    if (environment == 3)
      v21 = 0;
    else
      v21 = v14;
    if (v21 == 1)
    {
      if (objc_msgSend((id)v36[5], "count") == 1)
      {
        LODWORD(v14) = 0;
        environment = 3;
        configuration = 1;
      }
      else
      {
        LODWORD(v14) = 1;
      }
    }
    if (objc_msgSend((id)v36[5], "count") == 1)
      v22 = v15;
    else
      v22 = 0;
    if (v22 == 1)
    {
      v15 = 0;
      environment = 2;
      configuration = 1;
    }
    v23 = objc_alloc((Class)objc_opt_class());
    if ((_DWORD)v14)
    {
      centerItem = self->_centerItem;
      if (!v15)
      {
LABEL_41:
        floatingItem = 0;
LABEL_44:
        LOBYTE(v27) = self->_hidden;
        v6 = (SBAppLayout *)objc_msgSend(v23, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v36[5], centerItem, floatingItem, configuration, v7, v20, environment, v27, self->_preferredDisplayOrdinal);

        goto LABEL_45;
      }
    }
    else
    {
      centerItem = 0;
      if (!v15)
        goto LABEL_41;
    }
    floatingItem = self->_floatingItem;
    goto LABEL_44;
  }
  v6 = self;
LABEL_45:

  _Block_object_dispose(&v35, 8);
  return v6;
}

- (NSDictionary)itemsToLayoutAttributesMap
{
  return self->_itemsToLayoutAttributesMap;
}

- (void)setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay, a3);
}

uint64_t __36__SBAppLayout__preferredWindowScene__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExternalDisplayWindowScene");
}

uint64_t __36__SBAppLayout__preferredWindowScene__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (id)preferredDisplayIdentity
{
  void *v2;
  void *v3;
  void *v4;

  -[SBAppLayout _preferredWindowScene](self, "_preferredWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sbDisplayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_preferredWindowScene
{
  int64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;

  v2 = -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal");
  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectedWindowScenes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_76);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectedWindowScenes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_77_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v2 == 1;
  else
    v9 = 0;
  if (v9)
    v10 = v8;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

void __48__SBAppLayout_containsItemWithBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a3, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)containsItemWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBAppLayout_containsItemWithBundleIdentifier___block_invoke;
  v7[3] = &unk_1E8EA85E0;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SBAppLayout enumerate:](self, "enumerate:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (SBAppLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 261, CFSTR("use -initWithItemsForLayoutRoles:configuration:environment:"));

  return 0;
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 preferredDisplayOrdinal:(int64_t)a6
{
  return -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:](self, "initWithItemsForLayoutRoles:configuration:environment:hidden:preferredDisplayOrdinal:", a3, a4, a5, 0, a6);
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 environment:(int64_t)a5 hidden:(BOOL)a6 preferredDisplayOrdinal:(int64_t)a7
{
  return -[SBAppLayout initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](self, "initWithItemsForLayoutRoles:configuration:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", a3, a4, 0, a5, a6, a7);
}

- (SBAppLayout)initWithItemsForLayoutRoles:(id)a3 configuration:(int64_t)a4 centerConfiguration:(int64_t)a5 environment:(int64_t)a6 hidden:(BOOL)a7 preferredDisplayOrdinal:(int64_t)a8
{
  return -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](self, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", a3, a4, MEMORY[0x1E0C9AA70], a5, a6, a7, a8);
}

void __154__SBAppLayout_initWithItems_centerItem_floatingItem_configuration_itemsToLayoutAttributes_centerConfiguration_environment_hidden_preferredDisplayOrdinal___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3870]), "initWithOptions:", 5);
  objc_msgSend(v2, "setIsEqualFunction:", _SBAppLayoutContentInspectingPointerFunctionIsEqual);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithPointerFunctions:capacity:", v2, 100);
  v1 = (void *)__allAppLayouts;
  __allAppLayouts = v0;

}

- (SBAppLayout)initWithPlistRepresentation:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  SBDisplayItem *v57;
  SBDisplayItem *v58;
  void *v59;
  SBDisplayItemLayoutAttributes *v60;
  void *v61;
  SBDisplayItemLayoutAttributes *v62;
  BOOL v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  SBAppLayout *v67;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_opt_class();
  v6 = v3;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("RolesAndItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = v9;
    if (v10)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    v16 = v12;

    objc_msgSend(v8, "objectForKey:", CFSTR("Config"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_class();
    v19 = v17;
    if (v18)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    v73 = objc_msgSend(v21, "integerValue");
    objc_msgSend(v8, "objectForKey:", CFSTR("CenterConfig"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    v24 = v22;
    if (v23)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v14 = v25;

    if (v14)
      v72 = objc_msgSend(v14, "integerValue");
    else
      v72 = 0;
    objc_msgSend(v8, "objectForKey:", CFSTR("Environment"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v30 = v29;

    if (v30)
      v71 = objc_msgSend(v30, "integerValue");
    else
      v71 = 1;
    objc_msgSend(v8, "objectForKey:", CFSTR("Hidden"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_class();
    v33 = v31;
    if (v32)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
    }
    else
    {
      v34 = 0;
    }
    v35 = v34;

    v70 = objc_msgSend(v35, "BOOLValue");
    objc_msgSend(v8, "objectForKey:", CFSTR("PreferredDisplayOrdinal"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_opt_class();
    v38 = v36;
    if (v37)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v39 = v38;
      else
        v39 = 0;
    }
    else
    {
      v39 = 0;
    }
    v40 = v39;

    v69 = objc_msgSend(v40, "integerValue");
  }
  else
  {
    v13 = objc_opt_class();
    v14 = v6;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;
    v69 = 0;
    v70 = 0;
    v72 = 0;
    v73 = 0;
    v71 = 1;
  }
  v74 = v8;
  v76 = v6;
  v77 = v4;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v41 = v16;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v42)
  {
    v43 = v42;
    v44 = 0;
    v45 = *(_QWORD *)v80;
LABEL_52:
    v46 = 0;
    while (1)
    {
      if (*(_QWORD *)v80 != v45)
        objc_enumerationMutation(v41);
      v47 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v46);
      v48 = objc_opt_class();
      v49 = v47;
      if (v48)
        v50 = (objc_opt_isKindOfClass() & 1) != 0 ? v49 : 0;
      else
        v50 = 0;
      v51 = v50;

      if (v51 && (unint64_t)objc_msgSend(v51, "count") >= 2)
      {
        objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_opt_class();
        v54 = v52;
        if (v53)
          v55 = (objc_opt_isKindOfClass() & 1) != 0 ? v54 : 0;
        else
          v55 = 0;
        v56 = v55;

        v58 = [SBDisplayItem alloc];
        objc_msgSend(v51, "objectAtIndexedSubscript:", 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[SBDisplayItem initWithPlistRepresentation:](v58, "initWithPlistRepresentation:", v59);

      }
      else
      {
        v56 = 0;
        v57 = 0;
      }
      if ((unint64_t)objc_msgSend(v51, "count") < 3)
      {
        v62 = 0;
      }
      else
      {
        v60 = [SBDisplayItemLayoutAttributes alloc];
        objc_msgSend(v51, "objectAtIndex:", 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = -[SBDisplayItemLayoutAttributes initWithPlistRepresentation:](v60, "initWithPlistRepresentation:", v61);

      }
      v63 = !v56 || v57 == 0;
      v64 = !v63;
      if (v63)
      {
        v44 = 1;
      }
      else
      {
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v57, v56);
        if (v62)
          objc_msgSend(v77, "setObject:forKey:", v62, v57);
      }

      if (!v64)
        break;
      if (v43 == ++v46)
      {
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
        if (v43)
          goto LABEL_52;
        break;
      }
    }
  }
  else
  {
    v44 = 0;
  }

  if (!v41 || (v44 & 1) != 0)
  {

    v67 = 0;
    v66 = v77;
    v65 = v78;
  }
  else
  {
    v66 = v77;
    v65 = v78;
    v67 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](self, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v78, v73, v77, v72, v71, v70, v69);
  }

  return v67;
}

- (id)plistRepresentation
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  SBAppLayout *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __34__SBAppLayout_plistRepresentation__block_invoke;
  v15 = &unk_1E8E9E3B0;
  v16 = self;
  v17 = v3;
  v4 = v3;
  -[SBAppLayout enumerate:](self, "enumerate:", &v12);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_configuration, v12, v13, v14, v15, v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Config"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_centerConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("CenterConfig"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_environment);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("Environment"));

  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("RolesAndItems"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hidden);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("Hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preferredDisplayOrdinal);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("PreferredDisplayOrdinal"));

  return v5;
}

void __34__SBAppLayout_plistRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);

  objc_msgSend(v5, "plistRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "plistRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

+ (SBAppLayout)appLayoutWithProtobufRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SBAppLayout *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SBDisplayItemLayoutAttributes *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SBDisplayItemLayoutAttributes *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  SBDisplayItemLayoutAttributes *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t *v35;
  void *v36;
  void *v37;
  SBDisplayItemLayoutAttributes *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  uint64_t *v42;
  void *v43;
  void *v44;
  void *v45;
  SBDisplayItemLayoutAttributes *v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = -[SBPBAppLayout layoutConfiguration]((uint64_t)v3) - 1;
  if (v7 < 4)
    v8 = v7 + 1;
  else
    v8 = 0;
  -[SBPBAppLayout displayItems]((uint64_t)v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v4;
  v60 = v9;
  if (!objc_msgSend(v9, "count"))
  {
    v13 = v8;
    -[SBPBAppLayout primaryDisplayItem]((uint64_t)v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem displayItemWithProtobufRepresentation:](SBDisplayItem, "displayItemWithProtobufRepresentation:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = 0;
LABEL_70:
      v9 = v60;
      goto LABEL_71;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, v15);

    if (-[SBPBAppLayout hasPrimaryLayoutAttributes]((_BOOL8)v3))
    {
      -[SBPBAppLayout primaryLayoutAttributes]((uint64_t)v3);
      v16 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:](SBDisplayItemLayoutAttributes, "layoutAttributesWithProtobufRepresentation:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v17, v11);

    }
    else
    {
      v16 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      objc_msgSend(v5, "setObject:forKey:", v16, v11);
    }

    if (-[SBPBAppLayout hasSecondaryDisplayItem]((_BOOL8)v3))
    {
      -[SBPBAppLayout secondaryDisplayItem]((uint64_t)v3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItem displayItemWithProtobufRepresentation:](SBDisplayItem, "displayItemWithProtobufRepresentation:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = -[SBPBAppLayout secondaryDisplayItemRole]((uint64_t)v3) - 1;
        if (v34 > 3)
          v35 = &SBLayoutRoleUndefined;
        else
          v35 = off_1E8EB2AB0[v34];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v33, v36);

      }
      v37 = v11;
      if (-[SBPBAppLayout hasSecondaryLayoutAttributes]((_BOOL8)v3))
      {
        -[SBPBAppLayout secondaryLayoutAttributes]((uint64_t)v3);
        v38 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();
        +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:](SBDisplayItemLayoutAttributes, "layoutAttributesWithProtobufRepresentation:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v39, v33);

      }
      else
      {
        v38 = objc_alloc_init(SBDisplayItemLayoutAttributes);
        objc_msgSend(v5, "setObject:forKey:", v38, v33);
      }
      v11 = v37;

    }
    if (!-[SBPBAppLayout hasCenterDisplayItem]((_BOOL8)v3))
    {
      v4 = v59;
LABEL_63:

      v48 = -[SBPBAppLayout environment]((uint64_t)v3) - 1;
      if (v48 > 2)
        v49 = 1;
      else
        v49 = qword_1D0E89FE0[v48];
      v50 = -[SBPBAppLayout centerConfiguration]((uint64_t)v3);
      if (v50 == 2)
        v51 = 2;
      else
        v51 = v50 == 1;
      v52 = -[SBPBAppLayout hidden]((_BOOL8)v3);
      v12 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v4, v8, v5, v51, v49, v52, -[SBPBAppLayout preferredDisplayOrdinal]((uint64_t)v3));
      -[SBAppLayout setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:](v12, "setCachedDisplayItemLayoutAttributesForNonPreferredDisplay:", v6);
      goto LABEL_70;
    }
    v57 = v6;
    -[SBPBAppLayout centerDisplayItem]((uint64_t)v3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem displayItemWithProtobufRepresentation:](SBDisplayItem, "displayItemWithProtobufRepresentation:", v40);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v41 = -[SBPBAppLayout centerDisplayItemRole]((uint64_t)v3) - 1;
      if (v41 > 3)
        v42 = &SBLayoutRoleUndefined;
      else
        v42 = off_1E8EB2AB0[v41];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setObject:forKey:", v18, v43);

    }
    v58 = v5;
    if (-[SBPBAppLayout hasCenterLayoutAttributes]((_BOOL8)v3))
    {
      -[SBPBAppLayout centerLayoutAttributes]((uint64_t)v3);
      v44 = v5;
      v19 = (id)objc_claimAutoreleasedReturnValue();
      +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:](SBDisplayItemLayoutAttributes, "layoutAttributesWithProtobufRepresentation:", v19);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setObject:forKey:", v45, v18);

    }
    else
    {
      v46 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      v47 = v5;
      v19 = v46;
      objc_msgSend(v47, "setObject:forKey:", v46, v18);
    }
    v4 = v59;
    v8 = v13;
LABEL_62:

    v6 = v57;
    v5 = v58;
    goto LABEL_63;
  }
  -[SBPBAppLayout centerDisplayItem]((uint64_t)v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[SBDisplayItem displayItemWithProtobufRepresentation:](SBDisplayItem, "displayItemWithProtobufRepresentation:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {

      v12 = 0;
      goto LABEL_71;
    }
  }
  else
  {
    v11 = 0;
  }
  v57 = v6;
  v58 = v5;

  -[SBPBAppLayout displayItemLayoutAttributes]((uint64_t)v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBAppLayout displayItemLayoutAttributesForNonPreferredDisplays]((uint64_t)v3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
    goto LABEL_62;
  v56 = v11;
  v54 = v8;
  v55 = v3;
  v20 = 0;
  v21 = 0;
  while (1)
  {
    objc_msgSend(v9, "objectAtIndex:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItem displayItemWithProtobufRepresentation:](SBDisplayItem, "displayItemWithProtobufRepresentation:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      break;
    v24 = (void *)v23;
    if (v21 >= objc_msgSend(v18, "count")
      || (objc_msgSend(v18, "objectAtIndex:", v21), (v25 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v27 = objc_alloc_init(SBDisplayItemLayoutAttributes);
      if (!v27)
        goto LABEL_34;
LABEL_20:
      if (v56 && (objc_msgSend(v56, "isEqual:", v24) & 1) != 0)
      {
        v28 = 4;
      }
      else
      {
        if (v20 <= 1)
          v28 = v20 + 1;
        else
          v28 = v20 + 3;
        ++v20;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v24, v29);

      objc_msgSend(v58, "setObject:forKey:", v27, v24);
      if (v21 < objc_msgSend(v19, "count"))
      {
        objc_msgSend(v19, "objectAtIndex:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30
          || (+[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:](SBDisplayItemLayoutAttributes, "layoutAttributesWithProtobufRepresentation:", v30), (v31 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue()) == 0))
        {
LABEL_32:
          v31 = v27;
        }
        objc_msgSend(v57, "setObject:forKey:", v31, v24);

        v4 = v59;
        goto LABEL_34;
      }
      v30 = 0;
      goto LABEL_32;
    }
    v26 = (void *)v25;
    +[SBDisplayItemLayoutAttributes layoutAttributesWithProtobufRepresentation:](SBDisplayItemLayoutAttributes, "layoutAttributesWithProtobufRepresentation:", v25);
    v27 = (SBDisplayItemLayoutAttributes *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_20;
LABEL_34:
    v9 = v60;

    if (!v27)
      goto LABEL_44;
    if (++v21 >= objc_msgSend(v60, "count"))
    {
      v8 = v54;
      v3 = v55;
      v11 = v56;
      goto LABEL_62;
    }
  }

LABEL_44:
  v12 = 0;
  v3 = v55;
  v6 = v57;
  v5 = v58;
LABEL_71:

  return v12;
}

- (id)protobufRepresentation
{
  SBPBAppLayout *v3;
  int64_t v4;
  int v5;
  int64_t v6;
  int v7;
  int64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SBPBAppLayout *v18;
  NSDictionary *cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  SBPBAppLayout *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  SBPBAppLayout *v34;
  SBAppLayout *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SBPBAppLayout);
  v4 = -[SBAppLayout configuration](self, "configuration");
  if ((unint64_t)(v4 - 1) < 4)
    v5 = v4;
  else
    v5 = 0;
  -[SBPBAppLayout setLayoutConfiguration:]((uint64_t)v3, v5);
  v6 = -[SBAppLayout environment](self, "environment");
  if (v6 == 3)
    v7 = 3;
  else
    v7 = v6 == 2;
  -[SBPBAppLayout setEnvironment:]((uint64_t)v3, v7);
  v8 = -[SBAppLayout centerConfiguration](self, "centerConfiguration");
  if (v8 == 2)
    v9 = 2;
  else
    v9 = v8 == 1;
  -[SBPBAppLayout setCenterConfiguration:]((uint64_t)v3, v9);
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "protobufRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPBAppLayout setPrimaryDisplayItem:]((uint64_t)v3, v11);

  -[SBPBAppLayout setHidden:]((uint64_t)v3, -[SBAppLayout isHidden](self, "isHidden"));
  -[SBPBAppLayout setPreferredDisplayOrdinal:]((uint64_t)v3, -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal"));
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "protobufRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPBAppLayout setSecondaryDisplayItem:]((uint64_t)v3, v14);

    -[SBPBAppLayout setSecondaryDisplayItemRole:]((uint64_t)v3, 2);
  }
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "protobufRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPBAppLayout setCenterDisplayItem:]((uint64_t)v3, v17);

    -[SBPBAppLayout setCenterDisplayItemRole:]((uint64_t)v3, 4);
  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __37__SBAppLayout_protobufRepresentation__block_invoke;
  v33[3] = &unk_1E8E9E3B0;
  v18 = v3;
  v34 = v18;
  v35 = self;
  -[SBAppLayout enumerate:](self, "enumerate:", v33);
  cachedDisplayItemLayoutAttributesForNonPreferredDisplay = self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
  if (cachedDisplayItemLayoutAttributesForNonPreferredDisplay)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[NSDictionary allKeys](cachedDisplayItemLayoutAttributesForNonPreferredDisplay, "allKeys", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          -[NSDictionary objectForKey:](self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "protobufRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBPBAppLayout addDisplayItemLayoutAttributesForNonPreferredDisplay:]((uint64_t)v18, v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      }
      while (v22);
    }

  }
  v27 = v18;

  return v27;
}

void __37__SBAppLayout_protobufRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "protobufRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBPBAppLayout addDisplayItems:](*(_QWORD *)(a1 + 32), v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "protobufRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPBAppLayout addDisplayItemLayoutAttributes:](*(_QWORD *)(a1 + 32), v7);
    switch(a2)
    {
      case 1:
        -[SBPBAppLayout setPrimaryLayoutAttributes:](*(_QWORD *)(a1 + 32), v7);
        break;
      case 2:
        -[SBPBAppLayout setSecondaryLayoutAttributes:](*(_QWORD *)(a1 + 32), v7);
        break;
      case 4:
        -[SBPBAppLayout setCenterLayoutAttributes:](*(_QWORD *)(a1 + 32), v7);
        break;
    }

  }
}

void __34__SBAppLayout_homeScreenAppLayout__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = objc_msgSend(v1, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", MEMORY[0x1E0C9AA70], 0, 1, 0);
  v3 = (void *)homeScreenAppLayout___homeScreenAppLayout;
  homeScreenAppLayout___homeScreenAppLayout = v2;

}

- (id)latestItemPassingTest:(id)a3
{
  id v4;
  SBAppLayout *v5;
  SBAppLayout *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  SBAppLayout *v11;
  id v12;
  uint64_t *v13;
  _QWORD *v14;
  _QWORD v15[4];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = self;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__73;
  v20 = __Block_byref_object_dispose__73;
  v21 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = -1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__SBAppLayout_latestItemPassingTest___block_invoke;
  v10[3] = &unk_1E8EB29B0;
  v6 = v5;
  v11 = v6;
  v13 = &v16;
  v14 = v15;
  v7 = v4;
  v12 = v7;
  -[SBAppLayout enumerate:](v6, "enumerate:", v10);
  v8 = (id)v17[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __37__SBAppLayout_latestItemPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "layoutAttributesForItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lastInteractionTime");

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    || v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6;
    }
  }

}

- (BOOL)containsAnyItemFromAppLayout:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBAppLayout containsAnyItemFromSet:](self, "containsAnyItemFromSet:", v6);

  return (char)self;
}

- (BOOL)containsAllItemsFromSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[SBAppLayout allItems](self, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isSubsetOfSet:", v7);

  return v8;
}

- (BOOL)containsAllItemsFromAppLayout:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SBAppLayout_containsAllItemsFromAppLayout___block_invoke;
  v6[3] = &unk_1E8EA85E0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerate:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __45__SBAppLayout_containsAllItemsFromAppLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsItem:");
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __28__SBAppLayout_zOrderedItems__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lastInteractionTime");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "lastInteractionTime");
  if (v8 > v10)
    return -1;
  else
    return v8 < v10;
}

- (id)zOrderedLeafAppLayouts
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[SBAppLayout zOrderedItems](self, "zOrderedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SBAppLayout_zOrderedLeafAppLayouts__block_invoke;
  v6[3] = &unk_1E8EB29D8;
  v6[4] = self;
  objc_msgSend(v3, "bs_compactMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __37__SBAppLayout_zOrderedLeafAppLayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:", a2);
}

- (BOOL)isFullScreen
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCenterOverFull
{
  BOOL v3;
  void *v4;

  if (-[SBAppLayout isSplitConfiguration](self, "isSplitConfiguration"))
    return 0;
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)isCenterOverSplit
{
  void *v3;
  BOOL v4;

  if (!-[SBAppLayout isSplitConfiguration](self, "isSplitConfiguration"))
    return 0;
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_leafAppLayoutForItem:(id)a3 role:(int64_t)a4
{
  int64_t centerConfiguration;
  int64_t environment;
  NSDictionary *itemsToLayoutAttributesMap;
  id v9;
  void *v10;
  void *v11;
  SBAppLayout *v12;
  void *v13;
  void *v14;
  void *v15;
  SBAppLayout *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (a4 == 3)
  {
    centerConfiguration = 0;
    environment = 2;
  }
  else if (a4 == 4 || (environment = self->_environment, environment == 3))
  {
    centerConfiguration = self->_centerConfiguration;
    environment = 3;
  }
  else
  {
    centerConfiguration = 0;
  }
  itemsToLayoutAttributesMap = self->_itemsToLayoutAttributesMap;
  v9 = a3;
  -[NSDictionary objectForKey:](itemsToLayoutAttributesMap, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13;
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  v18 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v12, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v14, 1, v15, centerConfiguration, environment, self->_hidden, self->_preferredDisplayOrdinal);
  return v16;
}

- (id)appLayoutByInsertingLeafAppLayout:(id)a3 inRole:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(v6, "itemForLayoutRole:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutAttributesForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppLayout appLayoutByInsertingItem:withLayoutAttributes:inLayoutRole:](self, "appLayoutByInsertingItem:withLayoutAttributes:inLayoutRole:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __29__SBAppLayout_leafAppLayouts__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);

}

- (id)appLayoutByModifyingHiddenState:(BOOL)a3
{
  _BOOL4 hidden;
  SBAppLayout *v4;
  BOOL v5;
  uint64_t v7;

  hidden = self->_hidden;
  if (hidden == a3)
  {
    v4 = self;
  }
  else
  {
    if (((!hidden ^ a3) & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      v5 = !self->_hidden && a3;
      LOBYTE(v7) = v5;
      v4 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", self->_items, self->_centerItem, self->_floatingItem, self->_configuration, self->_itemsToLayoutAttributesMap, self->_centerConfiguration, self->_environment, v7, self->_preferredDisplayOrdinal);
    }
    -[SBAppLayout setCachedLastAutoLayoutSpace:](v4, "setCachedLastAutoLayoutSpace:", 0);
    -[SBAppLayout setCachedLastOverlappingModelKey:](v4, "setCachedLastOverlappingModelKey:", 0);
  }
  return v4;
}

- (id)appLayoutByModifyingEnvironment:(int64_t)a3
{
  void *v6;
  SBAppLayout *v7;
  void *v8;
  void *v9;
  SBAppLayout *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (self->_environment == a3)
    return self;
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v7, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v9, 1, self->_itemsToLayoutAttributesMap, 0, a3, 0, self->_preferredDisplayOrdinal);

  return v10;
}

- (id)appLayoutByModifyingConfiguration:(int64_t)a3
{
  void *v6;
  id v7;
  SBAppLayout *v8;
  _QWORD v9[5];
  id v10;

  if (self->_configuration == a3)
    return self;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__SBAppLayout_appLayoutByModifyingConfiguration___block_invoke;
  v9[3] = &unk_1E8EABFB0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  SBLayoutRoleEnumerateValidRoles(v9);
  v8 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v7, a3, self->_itemsToLayoutAttributesMap, self->_centerConfiguration, self->_environment, self->_hidden, self->_preferredDisplayOrdinal);

  return v8;
}

void __49__SBAppLayout_appLayoutByModifyingConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, v5);

  }
}

- (id)appLayoutByModifyingPreferredDisplayOrdinal:(int64_t)a3
{
  SBAppLayout *v4;
  SBAppLayout *v6;
  uint64_t v8;

  if (self->_preferredDisplayOrdinal == a3)
  {
    v4 = self;
  }
  else
  {
    v6 = [SBAppLayout alloc];
    LOBYTE(v8) = self->_hidden;
    v4 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v6, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", self->_items, self->_centerItem, self->_floatingItem, self->_configuration, self->_itemsToLayoutAttributesMap, self->_centerConfiguration, self->_environment, v8, a3);
  }
  return v4;
}

- (id)appLayoutByInsertingItem:(id)a3 withLayoutAttributes:(id)a4 inLayoutRole:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  SBAppLayout *v13;
  void *v14;
  SBDisplayItem *v15;
  SBDisplayItem *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  SBDisplayItem *v20;
  SBDisplayItem *v21;
  unint64_t v22;
  void *v23;
  id v24;
  unint64_t v25;
  SBDisplayItemLayoutAttributes *v26;
  void *v27;
  int64_t configuration;
  uint64_t v29;
  BOOL v31;
  int64_t centerConfiguration;
  SBAppLayout *v33;
  uint64_t v35;
  void *v36;

  v9 = a3;
  v10 = a4;
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    v13 = self;
    goto LABEL_51;
  }
  v14 = (void *)-[NSArray mutableCopy](self->_itemsWithoutCenterOrFloatingItems, "mutableCopy");
  v15 = self->_centerItem;
  v16 = self->_floatingItem;
  v17 = (void *)-[NSDictionary mutableCopy](self->_itemsToLayoutAttributesMap, "mutableCopy");
  if (objc_msgSend(v14, "containsObject:", v9))
  {
    objc_msgSend(v14, "removeObject:", v9);
    if (objc_msgSend(v14, "count"))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleDescription(a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 998, CFSTR("Moving %@ to %@ would result in an app layout without a primary item"), v9, v36);

  }
  else if ((objc_msgSend(v9, "isEqual:", v15) & 1) != 0)
  {
    v18 = v15;
    v15 = 0;
  }
  else
  {
    if (!objc_msgSend(v9, "isEqual:", v16))
      goto LABEL_11;
    v18 = v16;
    v16 = 0;
  }

LABEL_11:
  objc_msgSend(v17, "removeObjectForKey:", v9);
  if (SBLayoutRoleIsValidForSplitView(a5))
  {
    if (a5 == 1)
    {
      v19 = 0;
    }
    else if (a5 == 2)
    {
      v19 = 1;
    }
    else
    {
      v22 = objc_msgSend(v14, "count");
      if (v22 >= a5 - 3)
        v19 = a5 - 3;
      else
        v19 = v22;
    }
    if (objc_msgSend(v14, "count") == 1 && !v19)
    {
      v23 = v14;
      v24 = v9;
      v25 = 0;
      goto LABEL_33;
    }
    if (objc_msgSend(v14, "count") <= v19)
    {
      v23 = v14;
      v24 = v9;
      v25 = v19;
LABEL_33:
      objc_msgSend(v23, "insertObject:atIndex:", v24, v25);
      if (!v10)
        goto LABEL_34;
LABEL_31:
      objc_msgSend(v17, "setObject:forKey:", v10, v9);
      goto LABEL_35;
    }
    objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v19, v9);
  }
  else
  {
    if (a5 == 4)
    {
      v20 = (SBDisplayItem *)v9;

      v15 = v20;
      if (!v10)
        goto LABEL_34;
      goto LABEL_31;
    }
    if (a5 == 3)
    {
      v21 = (SBDisplayItem *)v9;

      v16 = v21;
      if (!v10)
        goto LABEL_34;
      goto LABEL_31;
    }
  }
  if (v10)
    goto LABEL_31;
LABEL_34:
  v26 = objc_alloc_init(SBDisplayItemLayoutAttributes);
  objc_msgSend(v17, "setObject:forKey:", v26, v9);

LABEL_35:
  v27 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v27, "bs_safeAddObject:", v15);
  objc_msgSend(v27, "bs_safeAddObject:", v16);
  configuration = self->_configuration;
  if ((unint64_t)objc_msgSend(v14, "count") < 2 || configuration >= 2)
  {
    v29 = objc_msgSend(v14, "count");
    if (configuration > 1 && v29 == 1)
      configuration = 1;
  }
  else
  {
    configuration = 3;
  }
  if (self->_centerConfiguration)
    v31 = 1;
  else
    v31 = v15 == 0;
  if (v31)
    centerConfiguration = self->_centerConfiguration;
  else
    centerConfiguration = 1;
  v33 = [SBAppLayout alloc];
  LOBYTE(v35) = self->_hidden;
  v13 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v33, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v27, v15, v16, configuration, v17, centerConfiguration, self->_environment, v35, self->_preferredDisplayOrdinal);

LABEL_51:
  return v13;
}

- (id)appLayoutByRemovingItemInLayoutRole:(int64_t)a3
{
  void *v5;
  void *v6;
  SBDisplayItem *v7;
  SBDisplayItem *v8;
  void *v9;
  unint64_t v10;
  SBAppLayout *v11;
  unint64_t v12;
  void *v13;
  int64_t configuration;
  uint64_t v15;
  int64_t centerConfiguration;
  SBAppLayout *v19;
  uint64_t v21;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)-[NSArray mutableCopy](self->_itemsWithoutCenterOrFloatingItems, "mutableCopy");
    v7 = self->_centerItem;
    v8 = self->_floatingItem;
    v9 = (void *)-[NSDictionary mutableCopy](self->_itemsToLayoutAttributesMap, "mutableCopy");
    if (SBLayoutRoleIsValidForSplitView(a3))
    {
      if (a3 == 1)
      {
        v10 = 0;
      }
      else if (a3 == 2)
      {
        v10 = 1;
      }
      else
      {
        v12 = objc_msgSend(v6, "count");
        if (v12 >= a3 - 3)
          v10 = a3 - 3;
        else
          v10 = v12;
      }
      if (objc_msgSend(v6, "count") > v10)
        objc_msgSend(v6, "removeObjectAtIndex:", v10);
    }
    else if (a3 == 4)
    {

      v7 = 0;
    }
    else if (a3 == 3)
    {

      v8 = 0;
    }
    objc_msgSend(v9, "removeObjectForKey:", v5);
    v13 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v13, "bs_safeAddObject:", v7);
    objc_msgSend(v13, "bs_safeAddObject:", v8);
    configuration = self->_configuration;
    if (objc_msgSend(v6, "count") == 1 && configuration > 1)
    {
      configuration = 1;
    }
    else
    {
      v15 = objc_msgSend(v6, "count");
      if (configuration > 0 && v15 == 0)
        configuration = 0;
    }
    if (self->_centerConfiguration == 1 && v7 == 0)
      centerConfiguration = 0;
    else
      centerConfiguration = self->_centerConfiguration;
    v19 = [SBAppLayout alloc];
    LOBYTE(v21) = self->_hidden;
    v11 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v19, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v13, v7, v8, configuration, v9, centerConfiguration, self->_environment, v21, self->_preferredDisplayOrdinal);

  }
  else
  {
    v11 = self;
  }

  return v11;
}

- (id)flippedAppLayout
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  SBAppLayout *v10;
  SBAppLayout *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  SBAppLayout *v17;
  id v18;
  id v19;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __31__SBAppLayout_flippedAppLayout__block_invoke;
  v16 = &unk_1E8EAC028;
  v17 = self;
  v18 = v3;
  v19 = v4;
  v5 = v4;
  v6 = v3;
  SBLayoutRoleEnumerateValidRoles(&v13);
  v7 = -[SBAppLayout configuration](self, "configuration");
  v8 = 4;
  if (v7 != 2)
    v8 = v7;
  if (v7 == 4)
    v9 = 2;
  else
    v9 = v8;
  v10 = [SBAppLayout alloc];
  v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v10, "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v6, v9, v5, self->_centerConfiguration, 1, self->_hidden, self->_preferredDisplayOrdinal, v13, v14, v15, v16, v17);

  return v11;
}

void __31__SBAppLayout_flippedAppLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2 == 2)
      v6 = 1;
    else
      v6 = a2;
    if (a2 == 1)
      v7 = 2;
    else
      v7 = v6;
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

    if (v5)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v10);

    v4 = v10;
  }

}

- (id)appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController:(id)a3 multitaskingSupported:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  char v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  char v25;
  _QWORD v26[5];
  _QWORD v27[2];

  v4 = a4;
  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[SBAppLayout environment](self, "environment") != 2 || v4)
  {
    if (-[SBAppLayout isFullScreen](self, "isFullScreen"))
    {
      v8 = 0;
    }
    else
    {
      -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applicationWithBundleIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isMedusaCapable");

      -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applicationWithBundleIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMedusaCapable");

      v17 = v12 & v16 & v4;
      if (v17 == 1)
      {
        -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 5);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_13;
        v18 = 0;
      }
      else
      {
        v18 = 1;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20 = MEMORY[0x1E0C809B0];
      if (v17)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke;
        v26[3] = &unk_1E8E9DF50;
        v26[4] = self;
        -[SBAppLayout appLayoutWithItemsPassingTest:](self, "appLayoutWithItemsPassingTest:", v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v21);

      }
      v23[0] = v20;
      v23[1] = 3221225472;
      v23[2] = __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke_2;
      v23[3] = &unk_1E8EB2A00;
      v25 = v18;
      v23[4] = self;
      v8 = v19;
      v24 = v8;
      -[SBAppLayout enumerate:](self, "enumerate:", v23);

    }
  }
  else
  {
    -[SBAppLayout appLayoutByModifyingEnvironment:](self, "appLayoutByModifyingEnvironment:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v8;
}

BOOL __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutRoleForItem:", a2) < 5;
}

void __107__SBAppLayout_appLayoutsBySplittingMedusaIncompatibleItemsWithApplicationController_multitaskingSupported___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  id v4;

  if (*(_BYTE *)(a1 + 48))
    v2 = 1;
  else
    v2 = a2 >= 5;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "leafAppLayoutForItem:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

- (id)appLayoutByAdjustingFloatingItemsForChamois
{
  void *v3;
  SBAppLayout *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  SBAppLayout *v11;
  int64_t v12;
  SBAppLayout *v13;
  uint64_t v15;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [SBAppLayout alloc];
    -[SBAppLayout allItems](self, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBAppLayout configuration](self, "configuration");
    -[SBAppLayout itemsToLayoutAttributesMap](self, "itemsToLayoutAttributesMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBAppLayout environment](self, "environment");
    LOBYTE(v15) = -[SBAppLayout isHidden](self, "isHidden");
    v10 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v4, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v5, v6, 0, v7, v8, 0, v9, v15, -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal"));
  }
  else
  {
    if (-[SBAppLayout environment](self, "environment") != 2)
    {
      v13 = self;
      return v13;
    }
    v11 = [SBAppLayout alloc];
    -[SBAppLayout allItems](self, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBAppLayout configuration](self, "configuration");
    -[SBAppLayout itemsToLayoutAttributesMap](self, "itemsToLayoutAttributesMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = -[SBAppLayout isHidden](self, "isHidden");
    v10 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v11, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v5, v6, 0, v12, v8, 0, 1, v15, -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal"));
  }
  v13 = (SBAppLayout *)v10;

  return v13;
}

- (id)appLayoutByAdjustingCenterWindowItemsForChamois
{
  void *v3;
  int64_t v4;
  uint64_t v5;
  SBAppLayout *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  SBAppLayout *v11;
  SBAppLayout *v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v17;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[SBAppLayout configuration](self, "configuration");
    if (v4 == 1)
      v5 = 3;
    else
      v5 = v4;
    v6 = [SBAppLayout alloc];
    -[SBAppLayout allItems](self, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemsToLayoutAttributesMap](self, "itemsToLayoutAttributesMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBAppLayout environment](self, "environment");
    LOBYTE(v17) = -[SBAppLayout isHidden](self, "isHidden");
    v11 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v6, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v7, 0, v8, v5, v9, 0, v10, v17, -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal"));

  }
  else
  {
    if (-[SBAppLayout environment](self, "environment") != 3)
    {
      v11 = self;
      return v11;
    }
    v12 = [SBAppLayout alloc];
    -[SBAppLayout allItems](self, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBAppLayout configuration](self, "configuration");
    -[SBAppLayout itemsToLayoutAttributesMap](self, "itemsToLayoutAttributesMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = -[SBAppLayout isHidden](self, "isHidden");
    v11 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v12, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v7, 0, v13, v14, v15, 0, 1, v17, -[SBAppLayout preferredDisplayOrdinal](self, "preferredDisplayOrdinal"));

  }
  return v11;
}

- (id)layoutAttributesForItemInRole:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout layoutAttributesForItem:](self, "layoutAttributesForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  SBAppLayout *v12;
  void *v13;
  SBAppLayout *v14;
  void *v16;
  void *v17;
  uint64_t v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 1234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAttributes"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 1235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

LABEL_3:
  -[NSDictionary objectForKey:](self->_itemsToLayoutAttributesMap, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    v12 = self;
  }
  else
  {
    v13 = (void *)-[NSDictionary mutableCopy](self->_itemsToLayoutAttributesMap, "mutableCopy");
    objc_msgSend(v13, "setObject:forKey:", v7, v9);
    v14 = [SBAppLayout alloc];
    LOBYTE(v18) = self->_hidden;
    v12 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v14, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", self->_items, self->_centerItem, self->_floatingItem, self->_configuration, v13, self->_centerConfiguration, self->_environment, v18, self->_preferredDisplayOrdinal);

  }
  return v12;
}

- (id)appLayoutByModifyingLayoutAttributesForItems:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  SBAppLayout *v14;
  SBAppLayout *v15;
  SBAppLayout *v16;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 1245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newLayoutAttributesForItems"));

  }
  v6 = (void *)-[NSDictionary mutableCopy](self->_itemsToLayoutAttributesMap, "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = self->_items;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v6, "setObject:forKey:", v13, v12);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "isEqual:", self->_itemsToLayoutAttributesMap))
  {
    v14 = self;
  }
  else
  {
    v15 = [SBAppLayout alloc];
    LOBYTE(v19) = self->_hidden;
    v14 = -[SBAppLayout initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:](v15, "initWithItems:centerItem:floatingItem:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", self->_items, self->_centerItem, self->_floatingItem, self->_configuration, v6, self->_centerConfiguration, self->_environment, v19, self->_preferredDisplayOrdinal);
  }
  v16 = v14;

  return v16;
}

- (id)appLayoutByModifyingLayoutAttributes:(id)a3 forItemInRole:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v7 = a3;
  -[SBAppLayout itemForLayoutRole:](self, "itemForLayoutRole:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleDescription(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppLayout.m"), 1263, CFSTR("No item in role %@"), v12);

  }
  -[SBAppLayout appLayoutByModifyingLayoutAttributes:forItem:](self, "appLayoutByModifyingLayoutAttributes:forItem:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast((uint64_t)v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SBAppLayout configuration](self, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);
    v16[3] = v9;

    if (!v16[3])
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __23__SBAppLayout_compare___block_invoke;
      v12[3] = &unk_1E8EB2A28;
      v14 = &v15;
      v13 = v6;
      -[SBAppLayout enumerate:](self, "enumerate:", v12);

    }
  }
  v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __23__SBAppLayout_compare___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "itemForLayoutRole:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
}

- (BOOL)hasSameItemsInLayoutRoles:(unint64_t)a3 asAppLayout:(id)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__SBAppLayout_hasSameItemsInLayoutRoles_asAppLayout___block_invoke;
  v9[3] = &unk_1E8EB21F0;
  v12 = a3;
  v9[4] = self;
  v7 = v6;
  v10 = v7;
  v11 = &v13;
  SBLayoutRoleEnumerateAppLayoutRoles(v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __53__SBAppLayout_hasSameItemsInLayoutRoles_asAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char v6;

  if (SBLayoutRoleMaskContainsRole(*(_QWORD *)(a1 + 56), a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemForLayoutRole:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSEqualObjects();

    if ((v6 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (NSString)description
{
  return (NSString *)-[SBAppLayout descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (uint64_t)setConfiguration:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 32) = a2;
  return result;
}

- (void)setItemsToLayoutAttributesMap:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
}

- (SBContinuousExposeAutoLayoutSpace)cachedLastAutoLayoutSpace
{
  return self->_cachedLastAutoLayoutSpace;
}

- (void)setCachedLastAutoLayoutSpace:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLastAutoLayoutSpace, a3);
}

- (SBAppLayoutAutoLayoutSpaceCacheKey)cachedLastOverlappingModelKey
{
  return self->_cachedLastOverlappingModelKey;
}

- (void)setCachedLastOverlappingModelKey:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLastOverlappingModelKey, a3);
}

- (NSDictionary)cachedDisplayItemLayoutAttributesForNonPreferredDisplay
{
  return self->_cachedDisplayItemLayoutAttributesForNonPreferredDisplay;
}

- (void)setItems:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 112);
}

- (void)setItemsWithoutCenterOrFloatingItems:(void *)a1
{
  if (a1)
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 120);
}

@end
