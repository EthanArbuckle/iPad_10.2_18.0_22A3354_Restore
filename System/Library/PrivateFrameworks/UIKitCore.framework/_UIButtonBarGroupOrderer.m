@implementation _UIButtonBarGroupOrderer

+ (id)groupOrdererForCustomizationIdentifier:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  _UIButtonBarGroupOrderer *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  void *v11;

  v2 = a2;
  v3 = objc_opt_self();
  if (!v2)
  {
    v10 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_groupOrdererForCustomizationIdentifier_, v10, CFSTR("_UIButtonBarGroupOrderer.m"), 40, CFSTR("Cannot instantiate a _UIButtonBarGroupOrderer with a nil customizationIdentifier"));

  }
  v4 = [_UIButtonBarGroupOrderer alloc];
  objc_msgSend(CFSTR("com.apple.UIKit.UINavigationBarCustomizations."), "stringByAppendingString:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_UIButtonBarGroupOrderer _initWithCustomizationIdentifier:data:](v4, "_initWithCustomizationIdentifier:data:", v2, v7);
  return v8;
}

- (id)_initWithCustomizationIdentifier:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  _UIButtonBarGroupOrderer *v8;
  uint64_t v9;
  NSString *customizationIdentifier;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableSet *v18;
  uint64_t v19;
  NSMutableOrderedSet *includedItems;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSMutableSet *excludedItems;
  uint64_t v27;
  NSMutableOrderedSet *v28;
  uint64_t v29;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_UIButtonBarGroupOrderer;
  v8 = -[_UIButtonBarGroupOrderer init](&v31, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    customizationIdentifier = v8->_customizationIdentifier;
    v8->_customizationIdentifier = (NSString *)v9;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11 == &unk_1E1A9AF80 || v11 && (v13 = objc_msgSend(v11, "isEqual:", &unk_1E1A9AF80), v12, v13))
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("includedItems"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = (void *)MEMORY[0x1E0C9AA60];
      if (v14)
        v17 = (void *)v14;
      else
        v17 = (void *)MEMORY[0x1E0C9AA60];
      v18 = v17;

      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v18);
      includedItems = v8->_includedItems;
      v8->_includedItems = (NSMutableOrderedSet *)v19;

      objc_msgSend(v7, "objectForKey:", CFSTR("excludedItems"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (void *)v21;
      else
        v23 = v16;
      v24 = v23;

      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v24);
      excludedItems = v8->_excludedItems;
      v8->_excludedItems = (NSMutableSet *)v25;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v8->_includedItems;
      v8->_includedItems = (NSMutableOrderedSet *)v27;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v29 = objc_claimAutoreleasedReturnValue();
      v18 = v8->_excludedItems;
      v8->_excludedItems = (NSMutableSet *)v29;
    }

  }
  return v8;
}

- (void)save
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend((id)a1, "_hasCustomization"))
    {
      v7[0] = &unk_1E1A9AF80;
      v6[0] = CFSTR("version");
      v6[1] = CFSTR("includedItems");
      objc_msgSend(*(id *)(a1 + 8), "array");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v2, "copy");
      v7[1] = v3;
      v6[2] = CFSTR("excludedItems");
      objc_msgSend(*(id *)(a1 + 16), "allObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    __setCustomizationDataForIdentifier(v5, *(_QWORD *)(a1 + 32));

  }
}

- (void)reset
{
  void *v2;
  id WeakRetained;

  if (a1)
  {
    __setCustomizationDataForIdentifier(0, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_groupOrdererDidUpdate:", a1);

  }
}

- (id)groups
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 5);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_groupOrdererGroups:", v1);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      v6 = (void *)MEMORY[0x1E0C9AA60];
      if (v4)
        v6 = (void *)v4;
      v1 = v6;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (void)enumerateSourceGroups:(id *)a1
{
  void (**v3)(id, _QWORD, uint64_t);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    -[_UIButtonBarGroupOrderer orderedGroups](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v3[2](v3, v11, 1);
          objc_msgSend(v5, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    -[_UIButtonBarGroupOrderer groups](a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
          if ((objc_msgSend(v5, "containsObject:", v17) & 1) == 0)
            v3[2](v3, v17, 0);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
}

- (_QWORD)orderedGroups
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      objc_msgSend(a1, "_orderGroups");
      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (void)setIncludedIdentifiers:(void *)a3 excludedIdentifiers:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  id WeakRetained;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[_UIButtonBarGroupOrderer groups]((id *)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id **)(*((_QWORD *)&v39 + 1) + 8 * i);
          -[UIBarButtonItemGroup _customizationIdentifier](v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 8), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 16), "removeAllObjects");
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v7, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            objc_msgSend(*(id *)(a1 + 16), "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v17);
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v5;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k);
          objc_msgSend(v7, "objectForKeyedSubscript:", v27, (_QWORD)v31);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(*(id *)(a1 + 8), "addObject:", v27);
            objc_msgSend(*(id *)(a1 + 16), "removeObject:", v27);
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v24);
    }

    v29 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_groupOrdererDidUpdate:", a1);

  }
}

- (BOOL)_hasCustomization
{
  uint64_t v3;

  v3 = -[NSMutableOrderedSet count](self->_includedItems, "count");
  return v3 + -[NSMutableSet count](self->_excludedItems, "count") != 0;
}

- (void)_orderGroups
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSMutableOrderedSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSArray *v20;
  NSArray *orderedGroups;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[_UIButtonBarGroupOrderer groups]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          -[UIBarButtonItemGroup _customizationIdentifier]((id *)v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            if (-[NSMutableOrderedSet containsObject:](self->_includedItems, "containsObject:", v13))
            {
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);
            }
            else if (v12
                   && (~*(unsigned __int8 *)(v12 + 24) & 0x30) != 0
                   && (-[NSMutableSet containsObject:](self->_excludedItems, "containsObject:", v13) & 1) == 0)
            {
              objc_msgSend(v5, "addObject:", v12);
            }
          }
          else
          {
            objc_msgSend(v5, "insertObject:atIndex:", v12, v9++);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_includedItems;
    v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v5, "insertObject:atIndex:", v19, v9++);

        }
        v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

    v20 = (NSArray *)objc_msgSend(v5, "copy");
    orderedGroups = self->_orderedGroups;
    self->_orderedGroups = v20;

    v3 = v22;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_customizationIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedGroups, 0);
  objc_storeStrong((id *)&self->_excludedItems, 0);
  objc_storeStrong((id *)&self->_includedItems, 0);
}

@end
