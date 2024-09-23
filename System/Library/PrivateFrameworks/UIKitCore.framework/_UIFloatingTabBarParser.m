@implementation _UIFloatingTabBarParser

- (_QWORD)fixedItems
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      objc_msgSend(a1, "fixedTabs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_listItemsForTabs:customizableOnly:", v3, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[2];
      v1[2] = v4;

      v6 = (void *)v1[5];
      v1[5] = 0;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)pinnedItems
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      objc_msgSend(a1, "pinnedTabs");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_listItemsForTabs:customizableOnly:", v3, 0);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v1[3];
      v1[3] = v4;

      v6 = (void *)v1[5];
      v1[5] = 0;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (_QWORD)items
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (v2)
    {
LABEL_9:
      a1 = v2;
      return a1;
    }
    if (a1[9])
    {
      objc_msgSend(a1, "_listItemsFromOverrideFavoriteOrder");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "favoriteOrder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(v1, "sourceTabs");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "_listItemsForTabs:customizableOnly:", v5, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v1[4];
        v1[4] = v9;

        goto LABEL_8;
      }
      objc_msgSend(v1, "_listItemsFromFavoriteOrder");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v1[4];
    v1[4] = v3;
LABEL_8:

    v6 = (void *)v1[5];
    v1[5] = 0;

    v7 = (void *)v1[6];
    v1[6] = 0;

    v2 = (void *)v1[4];
    goto LABEL_9;
  }
  return a1;
}

- (_QWORD)currentFavoriteOrder
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[6];
    if (!v2)
    {
      -[_UIFloatingTabBarParser items](a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "tabForSelection", (_QWORD)v15);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v4, "addObject:", v11);
            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

      objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v4);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v1[6];
      v1[6] = v12;

      v2 = (void *)v1[6];
    }
    a1 = v2;
  }
  return a1;
}

- (void)setIgnoredFavoriteOrderItems:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 88);
    v4 = v9;
    v5 = v4;
    if (v3 == v4)
    {

    }
    else
    {
      if (v4 && v3)
      {
        v6 = objc_msgSend(v3, "isEqual:", v4);

        if ((v6 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      v7 = objc_msgSend(v5, "copy");
      v8 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v7;

      v5 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;
    }

  }
LABEL_11:

}

- (id)sourceTabIdentifiers
{
  if (a1)
  {
    -[_UIFloatingTabBarParser validateFavoriteOrder:](a1, a1[7]);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)validateFavoriteOrder:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(a1[8], "tabForIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "_hasCustomizablePlacement")
            || (objc_msgSend(a1, "_canDisplayTabInBar:", v11) & 1) == 0)
          {
            if (!v7)
              v7 = (void *)objc_msgSend(v4, "mutableCopy");
            objc_msgSend(v7, "removeObject:", v10);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
    if (v7)
      v12 = v7;
    else
      v12 = v4;
    a1 = v12;

  }
  return a1;
}

- (void)invalidateFavorites
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 64), "customizationStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIFloatingTabBarParser sourceTabIdentifiers]((id *)a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "favoriteOrderForDefaultIdentifiers:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = v3;

    v5 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (_QWORD)itemIdentifiers
{
  _QWORD *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[5];
    if (!v2)
    {
      v3 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[_UIFloatingTabBarParser fixedItems](v1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");
      -[_UIFloatingTabBarParser pinnedItems](v1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count") + v5;
      -[_UIFloatingTabBarParser items](v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v3, "initWithCapacity:", v7 + objc_msgSend(v8, "count"));

      -[_UIFloatingTabBarParser fixedItems](v1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_insertIdentifiersFromItems:intoSet:", v10, v9);

      -[_UIFloatingTabBarParser items](v1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_insertIdentifiersFromItems:intoSet:", v11, v9);

      -[_UIFloatingTabBarParser pinnedItems](v1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_insertIdentifiersFromItems:intoSet:", v12, v9);

      v13 = objc_msgSend(v9, "copy");
      v14 = (void *)v1[5];
      v1[5] = v13;

      v2 = (void *)v1[5];
    }
    a1 = v2;
  }
  return a1;
}

- (uint64_t)containsTab:(uint64_t)a1
{
  id v3;
  void *v4;
  char IsRepresentedInListItems;
  void *v6;
  char v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    -[_UIFloatingTabBarParser fixedItems]((_QWORD *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsRepresentedInListItems = _UITabIsRepresentedInListItems(v3, v4);

    if ((IsRepresentedInListItems & 1) != 0
      || (-[_UIFloatingTabBarParser items]((_QWORD *)a1),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = _UITabIsRepresentedInListItems(v3, v6),
          v6,
          (v7 & 1) != 0))
    {
      a1 = 1;
    }
    else
    {
      -[_UIFloatingTabBarParser pinnedItems]((_QWORD *)a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = _UITabIsRepresentedInListItems(v3, v8);

    }
  }

  return a1;
}

- (BOOL)containsDescendantOfTab:(_BOOL8)a1
{
  id v3;
  void *v4;
  BOOL IsAncestorOfTabsInListItems;
  void *v6;
  BOOL v7;
  void *v8;

  v3 = a2;
  if (a1)
  {
    -[_UIFloatingTabBarParser fixedItems]((_QWORD *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IsAncestorOfTabsInListItems = _UITabIsAncestorOfTabsInListItems(v3, v4);

    if (IsAncestorOfTabsInListItems
      || (-[_UIFloatingTabBarParser items]((_QWORD *)a1),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = _UITabIsAncestorOfTabsInListItems(v3, v6),
          v6,
          v7))
    {
      a1 = 1;
    }
    else
    {
      -[_UIFloatingTabBarParser pinnedItems]((_QWORD *)a1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = _UITabIsAncestorOfTabsInListItems(v3, v8);

    }
  }

  return a1;
}

- (void)reloadItems
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    objc_msgSend(*(id *)(a1 + 64), "tabItems");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    objc_msgSend((id)a1, "_parseTabs:fixedTabs:sourceTabs:pinnedTabs:sourceIdentifiers:", v8, v2, v3, v4, v20);
    v9 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v2;
    v10 = v2;

    v11 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = v3;
    v12 = v3;

    v13 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = v4;
    v14 = v4;

    v15 = objc_msgSend(v20, "copy");
    v16 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v15;

    v17 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v18 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v19 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    -[_UIFloatingTabBarParser invalidateFavorites](a1);
  }
}

- (void)_parseTabs:(id)a3 fixedTabs:(id)a4 sourceTabs:(id)a5 pinnedTabs:(id)a6 sourceIdentifiers:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIFloatingTabBarParser *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v24 = self;
  v31 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v11;
  v16 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        switch(objc_msgSend(v20, "_tabPlacement", v24))
        {
          case 1:
          case 3:
            objc_msgSend(v13, "addObject:", v20);
            objc_msgSend(v20, "identifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v21);

            break;
          case 4:
            v22 = v14;
            goto LABEL_10;
          case 5:
            v22 = v12;
LABEL_10:
            objc_msgSend(v22, "addObject:", v20);
            break;
          default:
            break;
        }
        if (objc_msgSend(v20, "_isGroup"))
        {
          objc_msgSend(v20, "children");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFloatingTabBarParser _parseTabs:fixedTabs:sourceTabs:pinnedTabs:sourceIdentifiers:](v24, "_parseTabs:fixedTabs:sourceTabs:pinnedTabs:sourceIdentifiers:", v23, v12, v13, v14, v15);

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

}

- (void)_insertIdentifiersFromItems:(id)a3 intoSet:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v23 = v5;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        objc_msgSend(v11, "tabForSelection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "tabForSelection");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

LABEL_8:
          goto LABEL_9;
        }
        objc_msgSend(v11, "children");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v11, "children");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v25 != v18)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "tabForSelection");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "addObject:", v21);

              }
              v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v17);
            v5 = v23;
          }
          goto LABEL_8;
        }
LABEL_9:
        ++v10;
      }
      while (v10 != v8);
      v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v8 = v22;
    }
    while (v22);
  }

}

- (id)_listItemsForTabs:(id)a3 customizableOnly:(BOOL)a4
{
  id v5;
  _UIFloatingTabBarListItem *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t i;
  void *v14;
  _UIFloatingTabBarListItem *v15;
  void *v16;
  id v17;
  _UIFloatingTabBarListItem *v18;
  id v19;
  void *v20;
  int v21;
  _UIFloatingTabBarListItem *v22;
  _UIFloatingTabBarListItem *v23;
  void *v24;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v26 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = (_UIFloatingTabBarListItem *)v5;
  v7 = -[_UIFloatingTabBarListItem countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    v12 = v26;
    v28 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (-[_UIFloatingTabBarParser _canDisplayTabInBar:](self, "_canDisplayTabInBar:", v14)
          && (!v12 || objc_msgSend(v14, "_hasCustomizablePlacement")))
        {
          v15 = -[_UIFloatingTabBarListItem initWithTab:]([_UIFloatingTabBarListItem alloc], "initWithTab:", v14);
          if (self && self->_supportsGroupClusters)
          {
            objc_msgSend(v14, "_clusterIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              goto LABEL_12;
LABEL_16:
            v18 = v6;
            v9 = v9;
            v19 = v16;
            if (v9 == v19)
            {

            }
            else
            {
              v20 = v19;
              if (!v9 || !v19)
              {

                goto LABEL_24;
              }
              v21 = objc_msgSend(v9, "isEqual:", v19);

              if (!v21)
              {
LABEL_24:
                v22 = -[_UIFloatingTabBarListItem initWithChildren:]([_UIFloatingTabBarListItem alloc], "initWithChildren:", v10);
                objc_msgSend(v27, "addObject:", v22);

                v9 = 0;
                v10 = 0;
LABEL_25:
                v6 = v18;
                v12 = v26;
                v11 = v28;
                if (!v16)
                {
LABEL_26:
                  objc_msgSend(v27, "addObject:", v15);
LABEL_27:

                  continue;
                }
LABEL_13:
                if (!v10)
                {
                  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v15, 0);
                  v17 = v16;

                  v9 = v17;
                  v11 = v28;
                }
                goto LABEL_27;
              }
            }
            objc_msgSend(v10, "addObject:", v15);
            goto LABEL_25;
          }
          v16 = 0;
          if (v10)
            goto LABEL_16;
LABEL_12:
          if (!v16)
            goto LABEL_26;
          goto LABEL_13;
        }
      }
      v8 = -[_UIFloatingTabBarListItem countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v8)
      {

        if (v10)
        {
          v23 = -[_UIFloatingTabBarListItem initWithChildren:]([_UIFloatingTabBarListItem alloc], "initWithChildren:", v10);
          objc_msgSend(v27, "addObject:", v23);
          goto LABEL_33;
        }
        goto LABEL_34;
      }
    }
  }
  v10 = 0;
  v9 = 0;
  v23 = v6;
LABEL_33:

LABEL_34:
  v24 = (void *)objc_msgSend(v27, "copy");

  return v24;
}

- (id)_listItemsFromOverrideFavoriteOrder
{
  id v3;
  NSOrderedSet *overrideFavoriteOrder;
  void *v5;
  NSOrderedSet *v6;
  NSOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *ignoredFavoriteOrderItems;
  __CFString *v14;
  __CFString *v15;
  int v16;
  UITab *placeholderTab;
  void *v18;
  _UITabModel *tabModel;
  _UIFloatingTabBarListItem *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (self)
    overrideFavoriteOrder = self->_overrideFavoriteOrder;
  else
    overrideFavoriteOrder = 0;
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", -[NSOrderedSet count](overrideFavoriteOrder, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    v6 = self->_overrideFavoriteOrder;
  else
    v6 = 0;
  v7 = v6;
  v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (self)
          ignoredFavoriteOrderItems = self->_ignoredFavoriteOrderItems;
        else
          ignoredFavoriteOrderItems = 0;
        if (!-[NSSet containsObject:](ignoredFavoriteOrderItems, "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11), (_QWORD)v24))
        {
          v14 = v12;
          if (v14 == CFSTR("com.apple.UIKit.TabBar.Placeholder"))
          {

          }
          else
          {
            v15 = v14;
            if (!v14)
            {

              goto LABEL_22;
            }
            v16 = -[__CFString isEqual:](v14, "isEqual:", 0x1E16F2720);

            if (!v16)
            {
LABEL_22:
              if (self)
                tabModel = self->_tabModel;
              else
                tabModel = 0;
              -[_UITabModel tabForIdentifier:](tabModel, "tabForIdentifier:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v18, "_hasCustomizablePlacement")
                && -[_UIFloatingTabBarParser _canDisplayTabInBar:](self, "_canDisplayTabInBar:", v18))
              {
                v20 = -[_UIFloatingTabBarListItem initWithTab:]([_UIFloatingTabBarListItem alloc], "initWithTab:", v18);
                objc_msgSend(v5, "addObject:", v20);

              }
LABEL_27:

              goto LABEL_28;
            }
          }
          if (self)
            placeholderTab = self->_placeholderTab;
          else
            placeholderTab = 0;
          +[_UIFloatingTabBarListItem placeholderItemForTab:](_UIFloatingTabBarListItem, "placeholderItemForTab:", placeholderTab);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v18);
          goto LABEL_27;
        }
LABEL_28:
        ++v11;
      }
      while (v9 != v11);
      v21 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v9 = v21;
    }
    while (v21);
  }

  v22 = (void *)objc_msgSend(v5, "copy");
  return v22;
}

- (id)_listItemsFromFavoriteOrder
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UITabModel *tabModel;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[_UIFloatingTabBarParser favoriteOrder](self, "favoriteOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIFloatingTabBarParser favoriteOrder](self, "favoriteOrder", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        if (self)
        {
          if (-[NSSet containsObject:](self->_ignoredFavoriteOrderItems, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10)))
          {
            goto LABEL_13;
          }
          tabModel = self->_tabModel;
        }
        else
        {
          v14 = objc_msgSend(0, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
          tabModel = 0;
          if ((v14 & 1) != 0)
            goto LABEL_13;
        }
        -[_UITabModel tabForIdentifier:](tabModel, "tabForIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "_hasCustomizablePlacement")
          && -[_UIFloatingTabBarParser _canDisplayTabInBar:](self, "_canDisplayTabInBar:", v13))
        {
          objc_msgSend(v5, "addObject:", v13);
        }

LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v8 = v15;
    }
    while (v15);
  }

  -[_UIFloatingTabBarParser _listItemsForTabs:customizableOnly:](self, "_listItemsForTabs:customizableOnly:", v5, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)_canDisplayTabInBar:(id)a3
{
  id v4;
  _UITabModel *tabModel;
  BOOL v6;

  v4 = a3;
  if (self)
    tabModel = self->_tabModel;
  else
    tabModel = 0;
  v6 = !-[_UITabModel isTabHidden:](tabModel, "isTabHidden:", v4) && objc_msgSend(v4, "_tabPlacement") != 6;

  return v6;
}

- (NSMutableArray)fixedTabs
{
  return self->_fixedTabs;
}

- (NSMutableArray)sourceTabs
{
  return self->_sourceTabs;
}

- (NSMutableArray)pinnedTabs
{
  return self->_pinnedTabs;
}

- (NSOrderedSet)favoriteOrder
{
  return self->_favoriteOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoriteOrder, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
  objc_storeStrong((id *)&self->_sourceTabs, 0);
  objc_storeStrong((id *)&self->_fixedTabs, 0);
  objc_storeStrong((id *)&self->_ignoredFavoriteOrderItems, 0);
  objc_storeStrong((id *)&self->_placeholderTab, 0);
  objc_storeStrong((id *)&self->_overrideFavoriteOrder, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_sourceTabIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentFavoriteOrder, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_pinnedItems, 0);
  objc_storeStrong((id *)&self->_fixedItems, 0);
}

@end
