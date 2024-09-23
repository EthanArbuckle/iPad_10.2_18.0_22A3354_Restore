@implementation SBHLibraryCategory

- (void)_refreshAggregateIconLabelAccessoryType
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  int64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_icons;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "labelAccessoryType", (_QWORD)v12);
        if (v9 == 1)
        {

          v10 = 1;
          goto LABEL_14;
        }
        v6 |= v9 != 4;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }

    if ((v6 & 1) != 0)
    {
      v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {

  }
  v10 = 4 * (-[NSArray count](self->_icons, "count", (_QWORD)v12) != 0);
LABEL_14:
  if (self->_aggregrateIconLabelAccessoryType != v10)
  {
    self->_aggregrateIconLabelAccessoryType = v10;
    objc_msgSend(MEMORY[0x1E0CB37D0], "sbh_leafIconDataSourceNotificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBLeafIconDataSourceDidChangeNotification"), self);

  }
}

- (BOOL)isEqual:(id)a3
{
  SBHLibraryCategory *v4;
  BOOL v5;

  v4 = (SBHLibraryCategory *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[SBHLibraryCategory isEqualToCategory:](self, "isEqualToCategory:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCategory:(id)a3
{
  SBHLibraryCategory *v4;
  SBHLibraryCategory *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  void *v11;

  v4 = (SBHLibraryCategory *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[SBHLibraryCategory categoryIdentifier](v4, "categoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[SBHLibraryCategory icons](v5, "icons");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibraryCategory icons](self, "icons");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = BSEqualObjects();

    }
  }

  return v9;
}

- (NSArray)icons
{
  return self->_icons;
}

- (SBHLibraryCategoryIdentifier)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (SBHLibraryCategory)init
{
  SBHLibraryCategory *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryCategory;
  v2 = -[SBHLibraryCategory init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  SBHLibraryAdditionalItemsIndicatorIcon *additionalItemsIndicatorIcon;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategory icons](self, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("icons"));

  -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("categoryIdentifier"));

  additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  if (additionalItemsIndicatorIcon)
    v9 = (id)objc_msgSend(v3, "appendPointer:withName:", additionalItemsIndicatorIcon, CFSTR("additionalItemsIndicatorIcon"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)_localizedDisplayNameChangedTo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;

  v10 = a3;
  -[SBFolder displayName](self->_compactPodFolder, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v10);

  if ((v5 & 1) == 0)
    -[SBFolder setDisplayName:](self->_compactPodFolder, "setDisplayName:", v10);
  -[SBFolder displayName](self->_compactPodAdditionalItemsFolder, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if ((v7 & 1) == 0)
    -[SBFolder setDisplayName:](self->_compactPodAdditionalItemsFolder, "setDisplayName:", v10);
  -[SBFolder displayName](self->_expandedPodFolder, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v9 & 1) == 0)
    -[SBFolder setDisplayName:](self->_expandedPodFolder, "setDisplayName:", v10);

}

- (void)setCategoryIdentifier:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SBHLibraryCategoryIdentifier isEqual:](self->_categoryIdentifier, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_categoryIdentifier, a3);
    objc_msgSend(v6, "localizedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory _localizedDisplayNameChangedTo:](self, "_localizedDisplayNameChangedTo:", v5);

    self->_overflowBehavior = objc_msgSend(v6, "predictionCategoryID") == 3;
  }

}

- (BOOL)updateCategoryIdentifier:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[SBHLibraryCategoryIdentifier isEqual:](self->_categoryIdentifier, "isEqual:", v4);
  if (!v5)
  {
    -[SBHLibraryCategory _noteCategoryWillUpdate](self, "_noteCategoryWillUpdate");
    -[SBHLibraryCategory setCategoryIdentifier:](self, "setCategoryIdentifier:", v4);
    -[SBHLibraryCategory _noteCategoryDidUpdate](self, "_noteCategoryDidUpdate");
  }

  return !v5;
}

- (BOOL)updateCategoryWithIcons:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  id v50;
  id v51;
  NSArray *v52;
  NSArray *icons;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  SBHLibraryCategory *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD v94[4];
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_icons, "isEqualToArray:", v4))
  {
    v5 = 0;
  }
  else
  {
    -[SBHLibraryCategory _noteCategoryWillUpdate](self, "_noteCategoryWillUpdate");
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDisplayName");
    v7 = objc_claimAutoreleasedReturnValue();

    v69 = (void *)objc_opt_new();
    -[SBHLibraryCategory compactPodFolder](self, "compactPodFolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory compactPodAdditionalItemsFolder](self, "compactPodAdditionalItemsFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory expandedPodFolder](self, "expandedPodFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisplayName:", v7);
    objc_msgSend(v9, "setDisplayName:", v7);
    v59 = (void *)v7;
    objc_msgSend(v10, "setDisplayName:", v7);
    v11 = (void *)objc_opt_new();
    v58 = v8;
    objc_msgSend(v11, "bs_safeAddObject:", v8);
    v57 = v9;
    objc_msgSend(v11, "bs_safeAddObject:", v9);
    v56 = v10;
    objc_msgSend(v11, "bs_safeAddObject:", v10);
    -[NSArray makeObjectsPerformSelector:withObject:](self->_icons, "makeObjectsPerformSelector:withObject:", sel_removeObserver_, self);
    objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_addObserver_, self);
    -[SBHLibraryCategory additionalItemsIndicatorIcon](self, "additionalItemsIndicatorIcon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3880];
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __46__SBHLibraryCategory_updateCategoryWithIcons___block_invoke;
    v94[3] = &unk_1E8D859E8;
    v55 = v12;
    v95 = v55;
    objc_msgSend(v13, "predicateWithBlock:", v94);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v4;
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v14);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    obj = v11;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    v5 = 0;
    if (v64)
    {
      v62 = *(_QWORD *)v91;
      v70 = self;
      do
      {
        for (i = 0; i != v64; ++i)
        {
          if (*(_QWORD *)v91 != v62)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x1D17DF4E4]();
          objc_msgSend(v16, "icons");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHLibraryCategory _buildDisplayedIconsForFolder:icons:](self, "_buildDisplayedIconsForFolder:icons:", v16, v63);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count") || !objc_msgSend(v19, "count"))
          {
            v66 = v18;
            v67 = v17;
            v68 = i;
            v65 = v19;
            v20 = (void *)objc_msgSend(v19, "mutableCopy");
            v86 = 0u;
            v87 = 0u;
            v88 = 0u;
            v89 = 0u;
            v71 = v16;
            objc_msgSend(v16, "lists");
            v75 = (id)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v87;
              v72 = *(_QWORD *)v87;
              v73 = v20;
              do
              {
                v24 = 0;
                v74 = v22;
                do
                {
                  if (*(_QWORD *)v87 != v23)
                    objc_enumerationMutation(v75);
                  v25 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v24);
                  objc_msgSend(v25, "icons");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v20, "count");
                  v28 = objc_msgSend(v25, "maxNumberOfIcons");
                  if (v27 >= v28)
                    v29 = v28;
                  else
                    v29 = v27;
                  objc_msgSend(v20, "subarrayWithRange:", 0, v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "differenceFromArray:", v26);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v31, "hasChanges"))
                  {
                    v76 = v30;
                    v77 = v26;
                    if ((v5 & 1) == 0)
                    {
                      -[SBHLibraryCategory _noteFolderWillUpdateIcons:](v70, "_noteFolderWillUpdateIcons:", v71);
                      objc_msgSend(v69, "addObject:", v71);
                    }
                    v84 = 0u;
                    v85 = 0u;
                    v82 = 0u;
                    v83 = 0u;
                    objc_msgSend(v31, "removals");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
                    if (v33)
                    {
                      v34 = v33;
                      v35 = *(_QWORD *)v83;
                      do
                      {
                        for (j = 0; j != v34; ++j)
                        {
                          if (*(_QWORD *)v83 != v35)
                            objc_enumerationMutation(v32);
                          objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "object");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v25, "removeIcon:", v37);

                        }
                        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
                      }
                      while (v34);
                    }

                    v80 = 0u;
                    v81 = 0u;
                    v78 = 0u;
                    v79 = 0u;
                    objc_msgSend(v31, "insertions");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
                    if (v39)
                    {
                      v40 = v39;
                      v41 = *(_QWORD *)v79;
                      do
                      {
                        for (k = 0; k != v40; ++k)
                        {
                          if (*(_QWORD *)v79 != v41)
                            objc_enumerationMutation(v38);
                          v43 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * k);
                          objc_msgSend(v43, "object");
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          v45 = (id)objc_msgSend(v25, "insertIcon:atIndex:", v44, objc_msgSend(v43, "index"));

                        }
                        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
                      }
                      while (v40);
                    }

                    v5 = 1;
                    v23 = v72;
                    v20 = v73;
                    v22 = v74;
                    v30 = v76;
                    v26 = v77;
                  }
                  objc_msgSend(v20, "removeObjectsInRange:", 0, v29);

                  ++v24;
                }
                while (v24 != v22);
                v22 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
              }
              while (v22);
            }

            while (objc_msgSend(v20, "count"))
            {
              objc_msgSend(v71, "addEmptyList");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v20, "count");
              v48 = objc_msgSend(v46, "maxNumberOfIcons");
              if (v47 >= v48)
                v47 = v48;
              objc_msgSend(v20, "subarrayWithRange:", 0, v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (id)objc_msgSend(v71, "addListWithIcons:", v49);

              objc_msgSend(v20, "removeObjectsInRange:", 0, v47);
            }
            self = v70;
            v17 = v67;
            i = v68;
            v19 = v65;
            v18 = v66;
            if ((v5 & 1) != 0)
              -[SBHLibraryCategory _noteFolderDidUpdateIcons:](v70, "_noteFolderDidUpdateIcons:", v71);

          }
          else
          {
            -[SBHLibraryCategory _noteFolderWillUpdateIcons:](self, "_noteFolderWillUpdateIcons:", v16);
            v51 = (id)objc_msgSend(v16, "addIcons:", v19);
            -[SBHLibraryCategory _noteFolderDidUpdateIcons:](self, "_noteFolderDidUpdateIcons:", v16);
            v5 = 1;
          }

          objc_autoreleasePoolPop(v17);
        }
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      }
      while (v64);
    }

    v4 = v60;
    v52 = (NSArray *)objc_msgSend(v60, "copy");
    icons = self->_icons;
    self->_icons = v52;

    -[SBHLibraryCategory _refreshAggregateIconLabelAccessoryType](self, "_refreshAggregateIconLabelAccessoryType");
    -[SBHLibraryCategory _noteCategoryDidUpdate](self, "_noteCategoryDidUpdate");

  }
  return v5 & 1;
}

BOOL __46__SBHLibraryCategory_updateCategoryWithIcons___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) != a2;
}

- (void)_noteCategoryWillUpdate
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "categoryWillUpdate:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_noteCategoryDidUpdate
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "categoryDidUpdate:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_noteFolderWillUpdateIcons:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "category:willUpdateIconsWithinFolder:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_noteFolderDidUpdateIcons:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "category:didUpdateIconsWithinFolder:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)_buildDisplayedIconsForFolder:(id)a3 icons:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  -[SBHLibraryCategory compactPodFolder](self, "compactPodFolder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    if ((unint64_t)objc_msgSend(v7, "count") < 5)
    {
      v14 = objc_msgSend(v7, "copy");
      goto LABEL_14;
    }
    if (!-[SBHLibraryCategory overflowBehavior](self, "overflowBehavior"))
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibraryCategory additionalItemsIndicatorIcon](self, "additionalItemsIndicatorIcon");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayByAddingObject:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v10 = v7;
    v11 = 0;
    v12 = 4;
LABEL_9:
    objc_msgSend(v10, "subarrayWithRange:", v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v16 = (void *)v14;
    goto LABEL_15;
  }
  -[SBHLibraryCategory compactPodAdditionalItemsFolder](self, "compactPodAdditionalItemsFolder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v6)
  {

    goto LABEL_10;
  }
  v13 = objc_msgSend(v7, "count");

  if (v13 >= 5)
  {
    v12 = objc_msgSend(v7, "count") - 3;
    v10 = v7;
    v11 = 3;
    goto LABEL_9;
  }
LABEL_10:
  -[SBHLibraryCategory expandedPodFolder](self, "expandedPodFolder");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v6)
  {
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_localizedCompareDisplayNames_);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_15:

  return v16;
}

- (SBHLibraryCategoryFolder)compactPodFolder
{
  SBHLibraryCategoryFolder *compactPodFolder;
  SBHLibraryCategoryFolder *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHLibraryCategoryFolder *v8;
  SBHLibraryCategoryFolder *v9;

  compactPodFolder = self->_compactPodFolder;
  if (!compactPodFolder)
  {
    v4 = [SBHLibraryCategoryFolder alloc];
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBHLibraryCategoryFolder initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:](v4, "initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:", v6, 1, 131074, v7);
    v9 = self->_compactPodFolder;
    self->_compactPodFolder = v8;

    compactPodFolder = self->_compactPodFolder;
  }
  return compactPodFolder;
}

- (SBHLibraryCategoryFolder)compactPodAdditionalItemsFolder
{
  SBHLibraryCategoryFolder *compactPodAdditionalItemsFolder;
  SBHLibraryCategoryFolder *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHLibraryCategoryFolder *v8;
  SBHLibraryCategoryFolder *v9;

  compactPodAdditionalItemsFolder = self->_compactPodAdditionalItemsFolder;
  if (!compactPodAdditionalItemsFolder)
  {
    v4 = [SBHLibraryCategoryFolder alloc];
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBHLibraryCategoryFolder initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:](v4, "initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:", v6, -1, 131074, v7);
    v9 = self->_compactPodAdditionalItemsFolder;
    self->_compactPodAdditionalItemsFolder = v8;

    compactPodAdditionalItemsFolder = self->_compactPodAdditionalItemsFolder;
  }
  return compactPodAdditionalItemsFolder;
}

- (SBHLibraryCategoryFolder)expandedPodFolder
{
  SBHLibraryCategoryFolder *expandedPodFolder;
  SBHLibraryCategoryFolder *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SBHLibraryCategoryFolder *v11;
  SBHLibraryCategoryFolder *v12;

  expandedPodFolder = self->_expandedPodFolder;
  if (!expandedPodFolder)
  {
    v4 = [SBHLibraryCategoryFolder alloc];
    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v10 = 4294901766;
    else
      v10 = 4294901764;
    v11 = -[SBHLibraryCategoryFolder initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:](v4, "initWithDisplayName:maxListCount:listGridSize:libraryCategoryIdentifier:", v6, 1, v10, v9);
    v12 = self->_expandedPodFolder;
    self->_expandedPodFolder = v11;

    expandedPodFolder = self->_expandedPodFolder;
  }
  return expandedPodFolder;
}

- (SBHLibraryAdditionalItemsIndicatorIcon)additionalItemsIndicatorIcon
{
  SBHLibraryAdditionalItemsIndicatorIcon *additionalItemsIndicatorIcon;
  SBHLibraryAdditionalItemsIndicatorIcon *v4;
  SBHLibraryAdditionalItemsIndicatorIcon *v5;
  SBHLibraryAdditionalItemsIndicatorIcon *v6;
  void *v7;

  additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  if (!additionalItemsIndicatorIcon)
  {
    v4 = -[SBHLibraryAdditionalItemsIndicatorIcon initWithCategory:]([SBHLibraryAdditionalItemsIndicatorIcon alloc], "initWithCategory:", self);
    v5 = self->_additionalItemsIndicatorIcon;
    self->_additionalItemsIndicatorIcon = v4;

    v6 = self->_additionalItemsIndicatorIcon;
    -[SBHLibraryCategory iconDelegate](self, "iconDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIcon setDelegate:](v6, "setDelegate:", v7);

    additionalItemsIndicatorIcon = self->_additionalItemsIndicatorIcon;
  }
  return additionalItemsIndicatorIcon;
}

- (int64_t)labelAccessoryTypeForIcon:(id)a3
{
  return self->_aggregrateIconLabelAccessoryType;
}

- (NSString)leafIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictionCategoryID");
  -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("dewey_category-%lu-%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_icons, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (int64_t)overflowBehavior
{
  return self->_overflowBehavior;
}

- (void)setOverflowBehavior:(int64_t)a3
{
  self->_overflowBehavior = a3;
}

- (SBIconDelegate)iconDelegate
{
  return (SBIconDelegate *)objc_loadWeakRetained((id *)&self->_iconDelegate);
}

- (void)setIconDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_iconDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_destroyWeak((id *)&self->_iconDelegate);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalItemsIndicatorIcon, 0);
  objc_storeStrong((id *)&self->_expandedPodFolder, 0);
  objc_storeStrong((id *)&self->_compactPodAdditionalItemsFolder, 0);
  objc_storeStrong((id *)&self->_compactPodFolder, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 displayNameForLocation:(id)a4
{
  void *v4;
  void *v5;

  -[SBHLibraryCategory categoryIdentifier](self, "categoryIdentifier", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)iconSupportsUninstall:(id)a3
{
  return 0;
}

- (id)supportedGridSizeClassesForIcon:(id)a3
{
  return -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHIconGridSizeClassSet alloc], "initWithGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
}

@end
