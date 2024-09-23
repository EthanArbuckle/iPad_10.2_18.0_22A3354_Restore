@implementation _UITabSidebarTransaction

- (_UITabSidebarTransaction)initWithTabs:(id)a3 sidebar:(id)a4
{
  id v6;
  id v7;
  _UITabSidebarTransaction *v8;
  _UITabSidebarTransaction *v9;
  uint64_t v10;
  NSMutableDictionary *tabsByIdentifier;
  NSMutableSet *v12;
  NSMutableSet *tabsBecomingHidden;
  NSMutableSet *v14;
  NSMutableSet *tabsBecomingVisible;
  NSMutableDictionary *v16;
  NSMutableDictionary *updatedDisplayOrderForGroup;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UITabSidebarTransaction;
  v8 = -[_UITabSidebarTransaction init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_committed = 0;
    v10 = objc_msgSend(v6, "mutableCopy");
    tabsByIdentifier = v9->_tabsByIdentifier;
    v9->_tabsByIdentifier = (NSMutableDictionary *)v10;

    objc_storeWeak((id *)&v9->_sidebar, v7);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    tabsBecomingHidden = v9->_tabsBecomingHidden;
    v9->_tabsBecomingHidden = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    tabsBecomingVisible = v9->_tabsBecomingVisible;
    v9->_tabsBecomingVisible = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updatedDisplayOrderForGroup = v9->_updatedDisplayOrderForGroup;
    v9->_updatedDisplayOrderForGroup = v16;

  }
  return v9;
}

- (void)updateTabs:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *tabsByIdentifier;
  void *v7;
  void *v8;
  NSMutableSet *tabsBecomingVisible;
  id v10;
  id v11;
  NSMutableSet *tabsBecomingHidden;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  tabsByIdentifier = self->_tabsByIdentifier;
  self->_tabsByIdentifier = v5;

  v7 = (void *)-[NSMutableSet mutableCopy](self->_tabsBecomingVisible, "mutableCopy");
  v8 = (void *)-[NSMutableSet mutableCopy](self->_tabsBecomingHidden, "mutableCopy");
  tabsBecomingVisible = self->_tabsBecomingVisible;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __39___UITabSidebarTransaction_updateTabs___block_invoke;
  v32[3] = &unk_1E16B9228;
  v10 = v4;
  v33 = v10;
  v11 = v7;
  v34 = v11;
  -[NSMutableSet enumerateObjectsUsingBlock:](tabsBecomingVisible, "enumerateObjectsUsingBlock:", v32);
  tabsBecomingHidden = self->_tabsBecomingHidden;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __39___UITabSidebarTransaction_updateTabs___block_invoke_2;
  v29[3] = &unk_1E16B9228;
  v13 = v10;
  v30 = v13;
  v14 = v8;
  v31 = v14;
  -[NSMutableSet enumerateObjectsUsingBlock:](tabsBecomingHidden, "enumerateObjectsUsingBlock:", v29);
  objc_storeStrong((id *)&self->_tabsBecomingVisible, v7);
  objc_storeStrong((id *)&self->_tabsBecomingHidden, v8);
  -[_UITabSidebarTransaction updatedDisplayOrderForGroup](self, "updatedDisplayOrderForGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKey:", v22, (_QWORD)v25);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (!v23 || (objc_msgSend(v23, "_isGroup") & 1) == 0)
          -[NSMutableDictionary removeObjectForKey:](self->_updatedDisplayOrderForGroup, "removeObjectForKey:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v19);
  }

}

- (void)replaceTab:(id)a3 forIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_tabsByIdentifier, "setObject:forKey:", a3, a4);
}

- (BOOL)isTabHidden:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSMutableSet containsObject:](self->_tabsBecomingHidden, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((-[NSMutableSet containsObject:](self->_tabsBecomingVisible, "containsObject:", v5) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(v4, "isHidden");
  }

  return v6;
}

- (void)updateTab:(id)a3 toHidden:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSMutableSet *tabsBecomingHidden;
  NSMutableSet *tabsBecomingVisible;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (-[_UITabSidebarTransaction isCommitted](self, "isCommitted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarTransaction.m"), 94, CFSTR("Cannot update a transaction that has already been committed."));

  }
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (-[NSMutableSet containsObject:](self->_tabsBecomingHidden, "containsObject:", v7))
    {
      tabsBecomingHidden = self->_tabsBecomingHidden;
      goto LABEL_8;
    }
    if (!objc_msgSend(v11, "isHidden"))
      goto LABEL_14;
    tabsBecomingVisible = self->_tabsBecomingVisible;
LABEL_13:
    -[NSMutableSet addObject:](tabsBecomingVisible, "addObject:", v7);
    goto LABEL_14;
  }
  if (!-[NSMutableSet containsObject:](self->_tabsBecomingVisible, "containsObject:", v7))
  {
    if ((objc_msgSend(v11, "isHidden") & 1) != 0)
      goto LABEL_14;
    tabsBecomingVisible = self->_tabsBecomingHidden;
    goto LABEL_13;
  }
  tabsBecomingHidden = self->_tabsBecomingVisible;
LABEL_8:
  -[NSMutableSet removeObject:](tabsBecomingHidden, "removeObject:", v7);
LABEL_14:

}

- (void)resetCustomizationForTabs:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54___UITabSidebarTransaction_resetCustomizationForTabs___block_invoke;
  v3[3] = &unk_1E16CB518;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (void)_resetDisplayOrderForGroup:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "allowsReordering"))
  {
    objc_msgSend(v6, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabSidebarTransaction _mutableDisplayOrderForGroupIdentifier:](self, "_mutableDisplayOrderForGroupIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "removeAllObjects");
  }

}

- (id)currentDisplayOrderForGroupWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_updatedDisplayOrderForGroup, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_mutableDisplayOrderForGroupIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_updatedDisplayOrderForGroup, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "_isGroup") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarTransaction.m"), 147, CFSTR("Cannot change the display order for a non-group element: %@"), v9);

    }
    objc_msgSend(v9, "_filteredDisplayOrderIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      objc_msgSend(v7, "addObjectsFromArray:", v10);
    }
    else
    {
      v7 = (void *)objc_msgSend(v10, "mutableCopy");
      -[NSMutableDictionary setObject:forKey:](self->_updatedDisplayOrderForGroup, "setObject:forKey:", v7, v5);
    }

  }
  return v7;
}

- (id)_ancestorIdentifierForDescendant:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    while (1)
    {
      objc_msgSend(v9, "_parentGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      v14 = v12;
      if (v13 == v14)
        break;
      v15 = v14;
      if (v13 && v14)
      {
        v16 = objc_msgSend(v13, "isEqual:", v14);

        if ((v16 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_parentGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v20;
      if (!v20)
        goto LABEL_11;
    }

  }
LABEL_11:
  objc_msgSend(v9, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)updateUsingTransaction:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[_UITabSidebarTransaction isCommitted](self, "isCommitted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarTransaction.m"), 171, CFSTR("Cannot update a transaction that has already been committed."));

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v40 = v5;
  objc_msgSend(v5, "sectionTransactions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v59;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(obj);
        v44 = v6;
        v7 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v6);
        objc_msgSend(v7, "difference");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "finalSnapshot");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "items");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v45 = v8;
        objc_msgSend(v8, "removals");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v55 != v13)
                objc_enumerationMutation(v48);
              v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(v15, "object");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKey:", v16);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "_parentGroup");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              -[_UITabSidebarTransaction _mutableDisplayOrderForGroupIdentifier:](self, "_mutableDisplayOrderForGroupIdentifier:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "object");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "removeObject:", v22);

            }
            v12 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
          }
          while (v12);
        }

        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        objc_msgSend(v45, "insertions");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v49 = (id)objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v49)
        {
          v47 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(_QWORD *)v51 != v47)
                objc_enumerationMutation(v46);
              v24 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
              -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "object");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v27, "_parentGroup");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UITabSidebarTransaction _mutableDisplayOrderForGroupIdentifier:](self, "_mutableDisplayOrderForGroupIdentifier:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = objc_msgSend(v24, "index");
              if (v31 >= objc_msgSend(v10, "count") - 1)
              {
                objc_msgSend(v10, "objectAtIndex:", v31 - 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITabSidebarTransaction _ancestorIdentifierForDescendant:parent:](self, "_ancestorIdentifierForDescendant:parent:", v32, v28);
                v36 = objc_claimAutoreleasedReturnValue();
                if (v36)
                {
                  v34 = (void *)v36;
                  v35 = objc_msgSend(v30, "indexOfObject:", v36) + 1;
LABEL_25:

                  if (v35 != 0x7FFFFFFFFFFFFFFFLL)
                    goto LABEL_31;
                  goto LABEL_28;
                }
              }
              else
              {
                objc_msgSend(v10, "objectAtIndex:", v31 + 1);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITabSidebarTransaction _ancestorIdentifierForDescendant:parent:](self, "_ancestorIdentifierForDescendant:parent:", v32, v28);
                v33 = objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  v34 = (void *)v33;
                  v35 = objc_msgSend(v30, "indexOfObject:", v33);
                  goto LABEL_25;
                }
              }

LABEL_28:
              v37 = objc_msgSend(v24, "index");
              if (v37 >= objc_msgSend(v24, "associatedIndex"))
                v35 = objc_msgSend(v30, "count");
              else
                v35 = 0;
LABEL_31:
              objc_msgSend(v24, "object");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "insertObject:atIndex:", v38, v35);

            }
            v49 = (id)objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          }
          while (v49);
        }

        v6 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v43);
  }

}

- (void)commit
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  if (-[_UITabSidebarTransaction isCommitted](self, "isCommitted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITabSidebarTransaction.m"), 231, CFSTR("Cannot commit a transaction that has already been committed."));

  }
  -[_UITabSidebarTransaction setCommitted:](self, "setCommitted:", 1);
  -[_UITabSidebarTransaction sidebar](self, "sidebar");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v6 = *(id *)(v4 + 40);
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v8 = 0;
    goto LABEL_6;
  }
  v8 = (void *)*((_QWORD *)v6 + 144);
LABEL_6:
  v12 = v8;

  objc_msgSend(v12, "customizationStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34___UITabSidebarTransaction_commit__block_invoke;
  v13[3] = &unk_1E16B1B28;
  v13[4] = self;
  objc_msgSend(v9, "performWithoutSavingCustomization:", v13);
  objc_msgSend(v12, "tabItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveCustomizationForTabs:", v10);

}

- (void)_commit
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id *v28;
  void *v29;
  void *v30;
  id *v31;
  _QWORD v32[5];
  id *v33;
  SEL v34;
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
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[_UITabSidebarTransaction tabsBecomingHidden](self, "tabsBecomingHidden");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[_UITabSidebarTransaction tabsBecomingVisible](self, "tabsBecomingVisible");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v7, "count") + v6);

  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v39 = 0u;
  -[_UITabSidebarTransaction tabsBecomingVisible](self, "tabsBecomingVisible");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setHidden:", 0);
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v11);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[_UITabSidebarTransaction tabsBecomingHidden](self, "tabsBecomingHidden");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
        -[_UITabSidebarTransaction tabsByIdentifier](self, "tabsByIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setHidden:", 1);
        objc_msgSend(v8, "addObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v19);
  }

  -[_UITabSidebarTransaction sidebar](self, "sidebar");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = *(void **)(v25 + 40);
  else
    v27 = 0;
  v28 = v27;

  if (objc_msgSend(v8, "count"))
  {
    v29 = (void *)objc_msgSend(v8, "copy");
    -[UITabBarController _notifyVisibilityChangesForTabs:](v28, v29);

  }
  -[_UITabSidebarTransaction updatedDisplayOrderForGroup](self, "updatedDisplayOrderForGroup");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __35___UITabSidebarTransaction__commit__block_invoke;
  v32[3] = &unk_1E16CB540;
  v33 = v28;
  v34 = a2;
  v32[4] = self;
  v31 = v28;
  objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v32);

}

- (UITabBarControllerSidebar)sidebar
{
  return (UITabBarControllerSidebar *)objc_loadWeakRetained((id *)&self->_sidebar);
}

- (NSMutableDictionary)tabsByIdentifier
{
  return self->_tabsByIdentifier;
}

- (BOOL)isCommitted
{
  return self->_committed;
}

- (void)setCommitted:(BOOL)a3
{
  self->_committed = a3;
}

- (NSMutableSet)tabsBecomingVisible
{
  return self->_tabsBecomingVisible;
}

- (void)setTabsBecomingVisible:(id)a3
{
  objc_storeStrong((id *)&self->_tabsBecomingVisible, a3);
}

- (NSMutableSet)tabsBecomingHidden
{
  return self->_tabsBecomingHidden;
}

- (void)setTabsBecomingHidden:(id)a3
{
  objc_storeStrong((id *)&self->_tabsBecomingHidden, a3);
}

- (NSMutableDictionary)updatedDisplayOrderForGroup
{
  return self->_updatedDisplayOrderForGroup;
}

- (void)setUpdatedDisplayOrderForGroup:(id)a3
{
  objc_storeStrong((id *)&self->_updatedDisplayOrderForGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDisplayOrderForGroup, 0);
  objc_storeStrong((id *)&self->_tabsBecomingHidden, 0);
  objc_storeStrong((id *)&self->_tabsBecomingVisible, 0);
  objc_storeStrong((id *)&self->_tabsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_sidebar);
}

@end
