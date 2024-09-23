@implementation _UITabOutlineParser

- (_UITabOutlineParser)initWithTabs:(id)a3
{
  return -[_UITabOutlineParser initWithTabs:includeAllowsHidingItems:transaction:](self, "initWithTabs:includeAllowsHidingItems:transaction:", a3, 0, 0);
}

- (_UITabOutlineParser)initWithTabs:(id)a3 includeAllowsHidingItems:(BOOL)a4 transaction:(id)a5
{
  id v8;
  id v9;
  _UITabOutlineParser *v10;
  _UITabOutlineParser *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *contentByIdentifier;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UITabOutlineParser;
  v10 = -[_UITabOutlineParser init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_includeAllowsHidingItems = a4;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contentByIdentifier = v11->_contentByIdentifier;
    v11->_contentByIdentifier = v12;

    objc_storeWeak((id *)&v11->_transaction, v9);
    -[_UITabOutlineParser _parseTabs:](v11, "_parseTabs:", v8);
  }

  return v11;
}

- (void)_parseTabs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *rootItems;
  NSArray *groupItems;
  _UITabOutlineNode *v12;

  v4 = a3;
  v12 = -[_UITabOutlineNode initWithIdentifier:]([_UITabOutlineNode alloc], "initWithIdentifier:", CFSTR("Root"));
  -[_UITabOutlineParser _parseNode:tabs:rootNode:](self, "_parseNode:tabs:rootNode:", v12, v4, v12);

  -[_UITabOutlineNode children](v12, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UITabOutlineNode children](v12, "children");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_443);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UITabOutlineNode children](v12, "children");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectsAtIndexes:](v8, "objectsAtIndexes:", v7);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    rootItems = self->_rootItems;
    self->_rootItems = v9;

    -[NSArray removeObjectsAtIndexes:](v8, "removeObjectsAtIndexes:", v7);
    groupItems = self->_groupItems;
    self->_groupItems = v8;

  }
}

- (void)_parseNode:(id)a3 tabs:(id)a4 rootNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableDictionary *contentByIdentifier;
  void *v18;
  uint64_t v19;
  id v20;
  _UITabOutlineNode *v21;
  void *v22;
  _UITabOutlineNode *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id WeakRetained;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  id *location;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  id obj;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v72;
    location = (id *)&self->_transaction;
    v52 = *(_QWORD *)v72;
    v53 = v10;
    v54 = v8;
    do
    {
      v14 = 0;
      v55 = v12;
      do
      {
        if (*(_QWORD *)v72 != v13)
          objc_enumerationMutation(obj);
        v58 = v14;
        v15 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v14);
        +[_UITabSidebarContent contentForTab:](_UITabSidebarContent, "contentForTab:", v15, location);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        contentByIdentifier = self->_contentByIdentifier;
        objc_msgSend(v15, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](contentByIdentifier, "setObject:forKeyedSubscript:", v16, v18);

        v19 = objc_msgSend(v15, "_isGroup");
        v20 = v15;
        v21 = [_UITabOutlineNode alloc];
        objc_msgSend(v20, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[_UITabOutlineNode initWithIdentifier:](v21, "initWithIdentifier:", v22);

        -[_UITabOutlineNode setIsGroup:](v23, "setIsGroup:", v19);
        if (!objc_msgSend(v20, "isHidden")
          || objc_msgSend(v20, "allowsHiding")
          && -[_UITabOutlineParser includeAllowsHidingItems](self, "includeAllowsHidingItems"))
        {
          if ((v19 & 1) != 0)
          {
            v69 = 0u;
            v70 = 0u;
            v67 = 0u;
            v68 = 0u;
            v57 = v20;
            objc_msgSend(v20, "sidebarActions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v68;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v68 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
                  +[_UITabSidebarContent contentForAction:](_UITabSidebarContent, "contentForAction:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = self->_contentByIdentifier;
                  objc_msgSend(v29, "identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v30, v32);

                  objc_msgSend(v29, "identifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UITabOutlineNode addActionIdentifier:](v23, "addActionIdentifier:", v33);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
              }
              while (v26);
            }

            v34 = objc_msgSend(v57, "sidebarAppearance");
            v10 = v53;
            v8 = v54;
            v35 = v53;
            if (v34 == 2 || (v36 = objc_msgSend(v57, "sidebarAppearance"), v35 = v54, !v36))
              objc_msgSend(v35, "addChild:", v23);
            WeakRetained = objc_loadWeakRetained(location);
            objc_msgSend(v57, "identifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "currentDisplayOrderForGroupWithIdentifier:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = v57;
            objc_msgSend(v57, "_orderedChildrenForDisplayOrder:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UITabOutlineParser _parseNode:tabs:rootNode:](self, "_parseNode:tabs:rootNode:", v23, v40, v53);
            if (objc_msgSend(v57, "sidebarAppearance") == 1)
            {
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              -[_UITabOutlineNode children](v23, "children");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
              if (v42)
              {
                v43 = v42;
                v44 = *(_QWORD *)v64;
                do
                {
                  for (j = 0; j != v43; ++j)
                  {
                    if (*(_QWORD *)v64 != v44)
                      objc_enumerationMutation(v41);
                    objc_msgSend(v54, "addChild:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j));
                  }
                  v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
                }
                while (v43);
              }

              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              -[_UITabOutlineNode actions](v23, "actions");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
              if (v47)
              {
                v48 = v47;
                v49 = *(_QWORD *)v60;
                do
                {
                  for (k = 0; k != v48; ++k)
                  {
                    if (*(_QWORD *)v60 != v49)
                      objc_enumerationMutation(v46);
                    objc_msgSend(v54, "addActionIdentifier:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * k));
                  }
                  v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
                }
                while (v48);
              }

              v20 = v57;
            }

            v13 = v52;
            v12 = v55;
          }
          else
          {
            objc_msgSend(v8, "addChild:", v23);
          }
        }

        v14 = v58 + 1;
      }
      while (v58 + 1 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v12);
  }

}

- (NSArray)rootItems
{
  return self->_rootItems;
}

- (NSArray)groupItems
{
  return self->_groupItems;
}

- (NSMutableDictionary)contentByIdentifier
{
  return self->_contentByIdentifier;
}

- (void)setContentByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contentByIdentifier, a3);
}

- (BOOL)includeAllowsHidingItems
{
  return self->_includeAllowsHidingItems;
}

- (_UITabSidebarTransaction)transaction
{
  return (_UITabSidebarTransaction *)objc_loadWeakRetained((id *)&self->_transaction);
}

- (void)setTransaction:(id)a3
{
  objc_storeWeak((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transaction);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
  objc_storeStrong((id *)&self->_groupItems, 0);
  objc_storeStrong((id *)&self->_rootItems, 0);
}

@end
