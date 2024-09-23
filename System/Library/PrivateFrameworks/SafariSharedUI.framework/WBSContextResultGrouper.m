@implementation WBSContextResultGrouper

- (WBSContextResultGrouper)init
{
  WBSContextResultGrouper *v2;
  WBSContextResultGrouper *v3;
  WBSContextResultGrouper *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSContextResultGrouper;
  v2 = -[WBSContextResultGrouper init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_minimumNumberOfItemsRequiredInGroup = 1;
    v4 = v2;
  }

  return v3;
}

- (id)groupItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
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
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "groupContextResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "objectForKey:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v5, "setObject:forKey:", v13, v12);
          }
          objc_msgSend(v13, "addObject:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "keyEnumerator", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "count") < self->_minimumNumberOfItemsRequiredInGroup)
          objc_msgSend(v5, "removeObjectForKey:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  return v5;
}

- (unint64_t)minimumNumberOfItemsRequiredInGroup
{
  return self->_minimumNumberOfItemsRequiredInGroup;
}

- (void)setMinimumNumberOfItemsRequiredInGroup:(unint64_t)a3
{
  self->_minimumNumberOfItemsRequiredInGroup = a3;
}

@end
