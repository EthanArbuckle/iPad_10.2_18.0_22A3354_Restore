@implementation SBHLibraryCategoriesFolderDataSource

- (void)iconAccessoriesDidUpdate:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (-[NSSet containsObject:](self->_mappedIcons, "containsObject:") && (objc_msgSend(v5, "isWidgetIcon") & 1) == 0)
    v4 = -[SBHLibraryCategoriesFolderDataSource reloadData](self, "reloadData");

}

- (id)reloadData
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHLibraryCategoriesFolderDataSource iconModel](self, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leafIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoriesFolderDataSource reloadDataSourceUsingIcons:categoryMap:](self, "reloadDataSourceUsingIcons:categoryMap:", v4, self->_categoryMap);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reloadDataSourceUsingIcons:(id)a3 categoryMap:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSSet *mappedIcons;
  NSSet *v10;
  NSSet *v11;
  NSSet *v12;
  SBHLibraryCategoriesRootFolder *v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "isEqual:", self->_mappedIcons)
    || !objc_msgSend(v7, "isEqualToCategoryMap:", self->_categoryMap))
  {
    v8 = MEMORY[0x1E0C809B0];
    mappedIcons = self->_mappedIcons;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke;
    v16[3] = &unk_1E8D89330;
    v16[4] = self;
    -[NSSet enumerateObjectsUsingBlock:](mappedIcons, "enumerateObjectsUsingBlock:", v16);
    v10 = (NSSet *)objc_msgSend(v6, "copy");
    v11 = self->_mappedIcons;
    self->_mappedIcons = v10;

    objc_storeStrong((id *)&self->_categoryMap, a4);
    -[SBHLibraryCategoriesFolderDataSource _regenerateCategoriesFolder](self, "_regenerateCategoriesFolder");
    v12 = self->_mappedIcons;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke_2;
    v15[3] = &unk_1E8D89330;
    v15[4] = self;
    -[NSSet enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v15);
    objc_storeStrong((id *)&self->_categoryMap, a4);
  }
  v13 = self->_categoriesFolder;

  return v13;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[SBHLibraryCategoriesFolderDataSource isEqualToDataSource:](self, "isEqualToDataSource:", v4);

  return v5;
}

- (SBHLibraryCategoriesFolderDataSource)initWithCategoriesFolder:(id)a3
{
  id v5;
  void *v6;
  SBHLibraryCategoriesFolderDataSource *v7;
  SBHLibraryCategoriesFolderDataSource *v8;
  uint64_t v9;
  NSHashTable *observers;
  void *v11;
  objc_super v13;

  v5 = a3;
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryCategoriesFolderDataSource;
  v7 = -[SBHLibraryCategoriesFolderDataSource init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_iconModel, v6);
    objc_storeStrong((id *)&v8->_categoriesFolder, a3);
    v8->_maximumNumberOfDisplayedCategories = -1;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteDidAddIcon_, CFSTR("SBIconModelDidAddIconNotification"), v8->_iconModel);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteDidReplaceIcon_, CFSTR("SBIconModelDidReplaceIconNotification"), v8->_iconModel);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteWillRemoveIcon_, CFSTR("SBIconModelWillRemoveIconNotification"), v8->_iconModel);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteDidReloadIcons_, CFSTR("SBIconModelDidReloadIconsNotification"), v8->_iconModel);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteIconVisibilityDidChange_, CFSTR("SBIconModelVisibilityDidChangeNotification"), v8->_iconModel);
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__noteWillLayoutIconState_, CFSTR("SBIconModelWillLayoutIconStateNotification"), v8->_iconModel);

  }
  return v8;
}

- (SBHLibraryCategoriesFolderDataSource)init
{

  return 0;
}

- (BOOL)isEqualToDataSource:(id)a3
{
  SBHLibraryCategoriesFolderDataSource *v4;
  SBHLibraryCategoriesFolderDataSource *v5;
  void *v6;
  NSSet *mappedIcons;
  uint64_t v8;
  SBHLibraryCategoriesFolderDataSource *v9;
  id v10;
  SBHIconModel *iconModel;
  SBHLibraryCategoriesFolderDataSource *v12;
  id v13;
  SBHLibraryCategoriesRootFolder *categoriesFolder;
  id v15;
  char v16;
  _QWORD v18[4];
  SBHLibraryCategoriesFolderDataSource *v19;
  _QWORD v20[4];
  SBHLibraryCategoriesFolderDataSource *v21;
  _QWORD v22[4];
  SBHLibraryCategoriesFolderDataSource *v23;

  v4 = (SBHLibraryCategoriesFolderDataSource *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      mappedIcons = self->_mappedIcons;
      v8 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke;
      v22[3] = &unk_1E8D89308;
      v9 = v5;
      v23 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", mappedIcons, v22);
      iconModel = self->_iconModel;
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_2;
      v20[3] = &unk_1E8D89308;
      v12 = v9;
      v21 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", iconModel, v20);
      categoriesFolder = self->_categoriesFolder;
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_3;
      v18[3] = &unk_1E8D89308;
      v19 = v12;
      v15 = (id)objc_msgSend(v6, "appendObject:counterpart:", categoriesFolder, v18);
      v16 = objc_msgSend(v6, "isEqual");

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 8);
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 48);
}

id __60__SBHLibraryCategoriesFolderDataSource_isEqualToDataSource___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (id)reloadDataWithCategoryMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBHLibraryCategoriesFolderDataSource iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leafIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryCategoriesFolderDataSource reloadDataSourceUsingIcons:categoryMap:](self, "reloadDataSourceUsingIcons:categoryMap:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeObserver:", *(_QWORD *)(a1 + 32));
}

uint64_t __79__SBHLibraryCategoriesFolderDataSource_reloadDataSourceUsingIcons_categoryMap___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObserver:", *(_QWORD *)(a1 + 32));
}

- (int64_t)maximumNumberOfDisplayedCategories
{
  return self->_maximumNumberOfDisplayedCategories;
}

- (void)setMaximumNumberOfDisplayedCategories:(int64_t)a3
{
  if (self->_maximumNumberOfDisplayedCategories != a3)
  {
    self->_maximumNumberOfDisplayedCategories = a3;
    -[SBHLibraryCategoriesFolderDataSource _regenerateCategoriesFolder](self, "_regenerateCategoriesFolder");
  }
}

- (BOOL)containsIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SBHLibraryCategoriesFolderDataSource categoriesFolder](self, "categoriesFolder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "category");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "icons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)categoryForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBHLibraryCategoriesFolderDataSource categoriesFolder](self, "categoriesFolder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "category");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "categoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "category");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSArray)categoryIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBHLibraryCategoriesFolderDataSource categoriesFolder](self, "categoriesFolder", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "category");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "categoryIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (unint64_t)categoryIdentifiersCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBHLibraryCategoriesFolderDataSource categoriesFolder](self, "categoriesFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (void)_regenerateCategoriesFolder
{
  void *v3;
  void *v4;
  NSSet *mappedIcons;
  id v6;
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
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t maximumNumberOfDisplayedCategories;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL (*v32)(uint64_t, void *);
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  BOOL (*v43)(uint64_t, void *);
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  SBHLibraryCategory *v81;
  void *v82;
  SBHLibraryPodCategoryIcon *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  BOOL v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t m;
  void *v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  char v115;
  id obj;
  id obja;
  void *v118;
  SBHLibraryCategoriesFolderDataSource *v119;
  void *v120;
  void (**v121)(void *, id);
  void *v122;
  uint64_t v123;
  void *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  id v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[4];
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[4];
  id v154;
  _QWORD v155[4];
  id v156;
  id v157;
  _QWORD v158[4];
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD aBlock[4];
  id v165;
  SBHLibraryCategoriesFolderDataSource *v166;
  id v167;
  id v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _QWORD v173[4];
  id v174;
  id v175;
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  uint8_t v181[128];
  uint8_t buf[4];
  void *v183;
  __int16 v184;
  void *v185;
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  -[SBHLibraryCategoriesFolderDataSource iconModel](self, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  mappedIcons = self->_mappedIcons;
  v173[0] = MEMORY[0x1E0C809B0];
  v173[1] = 3221225472;
  v173[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke;
  v173[3] = &unk_1E8D89358;
  v106 = v3;
  v174 = v106;
  v6 = v4;
  v175 = v6;
  -[NSSet enumerateObjectsUsingBlock:](mappedIcons, "enumerateObjectsUsingBlock:", v173);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v118 = v6;
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v114 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v119 = self;
  -[SBRootFolder icons](self->_categoriesFolder, "icons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v169, v186, 16);
  v124 = v9;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v170;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v170 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
        objc_msgSend(v15, "category");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "categoryIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          SBLogProactiveAppLibrary();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "objectForKey:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v183 = v16;
            v184 = 2112;
            v185 = v21;
            _os_log_error_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_ERROR, "Error; duplicate category: %@ / %@",
              buf,
              0x16u);

            v9 = v124;
          }

        }
        else
        {
          objc_msgSend(v9, "bs_setSafeObject:forKey:", v16, v18);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v169, v186, 16);
    }
    while (v12);
  }

  -[SBFolder firstList](self->_categoriesFolder, "firstList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryMap categoryIdentifiers](v119->_categoryMap, "categoryIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  maximumNumberOfDisplayedCategories = v119->_maximumNumberOfDisplayedCategories;
  if (v24 >= maximumNumberOfDisplayedCategories)
    v26 = v119->_maximumNumberOfDisplayedCategories;
  else
    v26 = v24;
  if (maximumNumberOfDisplayedCategories >= 0)
    v27 = v26;
  else
    v27 = v24;
  v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:range:copyItems:", v23, 0, v27, 0);

  v28 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2;
  aBlock[3] = &unk_1E8D893C8;
  v110 = v28;
  v165 = v110;
  v166 = v119;
  v105 = v120;
  v167 = v105;
  v168 = &__block_literal_global_42;
  v121 = (void (**)(void *, id))_Block_copy(aBlock);
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v107 = v22;
  objc_msgSend(v22, "icons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
  if (v29)
  {
    v30 = v29;
    v115 = 0;
    v31 = *(_QWORD *)v161;
    v32 = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4;
    do
    {
      v33 = 0;
      v111 = (id)v30;
      do
      {
        if (*(_QWORD *)v161 != v31)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * v33);
        objc_msgSend(v34, "category");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "categoryIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = v32;
        v158[3] = &unk_1E8D893F0;
        v37 = v36;
        v159 = v37;
        objc_msgSend(v122, "bs_firstObjectPassingTest:", v158);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v38
          && v37
          && (objc_msgSend(v38, "isEqualToCategoryIdentifier:", v37) & 1) == 0
          && objc_msgSend(v35, "updateCategoryIdentifier:", v39))
        {
          v40 = v39;

          v115 = 1;
          v37 = v40;
        }
        v41 = objc_msgSend(v37, "predictionCategoryID");
        v121[2](v121, v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41 != 7)
        {
          v43 = v32;
          v44 = v31;
          if (!objc_msgSend(v122, "containsObject:", v37)
            || !objc_msgSend(v42, "count")
            || (objc_msgSend(v35, "icons"),
                v45 = (void *)objc_claimAutoreleasedReturnValue(),
                v46 = objc_msgSend(v45, "count"),
                v45,
                !v46))
          {
            objc_msgSend(v34, "category");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "updateCategoryWithIcons:", MEMORY[0x1E0C9AA60]);

            objc_msgSend(v107, "removeIcon:", v34);
            objc_msgSend(v124, "removeObjectForKey:", v37);
            v48 = (void *)objc_msgSend(v122, "mutableCopy");
            objc_msgSend(v48, "removeObject:", v37);
            v49 = objc_msgSend(v48, "copy");

            v115 = 1;
            v122 = (void *)v49;
          }
          v31 = v44;
          v32 = v43;
          v30 = (uint64_t)v111;
        }

        ++v33;
      }
      while (v30 != v33);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
    }
    while (v30);
  }
  else
  {
    v115 = 0;
  }

  v50 = (void *)objc_opt_new();
  v51 = (void *)objc_opt_new();
  v52 = MEMORY[0x1E0C809B0];
  v155[0] = MEMORY[0x1E0C809B0];
  v155[1] = 3221225472;
  v155[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5;
  v155[3] = &unk_1E8D89418;
  v109 = v51;
  v156 = v109;
  v53 = v50;
  v157 = v53;
  objc_msgSend(v107, "enumerateIconsUsingBlock:", v155);
  v153[0] = v52;
  v153[1] = 3221225472;
  v153[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_33;
  v153[3] = &unk_1E8D89330;
  obja = v107;
  v154 = obja;
  v104 = v53;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", v153);
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v54 = (void *)objc_msgSend(v122, "copy");
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v149, v180, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v150;
    v58 = v124;
    do
    {
      v59 = 0;
      v112 = (id)v56;
      do
      {
        if (*(_QWORD *)v150 != v57)
          objc_enumerationMutation(v54);
        v60 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * v59);
        if (objc_msgSend(v60, "predictionCategoryID") != 7)
        {
          objc_msgSend(v58, "objectForKey:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "leafIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "objectForKey:", v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v121[2](v121, v60);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v146[0] = MEMORY[0x1E0C809B0];
          v146[1] = 3221225472;
          v146[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2_34;
          v146[3] = &unk_1E8D89440;
          v147 = v118;
          v148 = &__block_literal_global_42;
          objc_msgSend(v64, "bs_mapNoNulls:", v146);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v65, "count"))
          {
            if (v63)
              objc_msgSend(obja, "removeIcon:", v63);
            if (v61)
            {
              objc_msgSend(v61, "updateCategoryWithIcons:", v65);
              objc_msgSend(v124, "removeObjectForKey:", v60);
              v66 = (void *)objc_msgSend(v122, "mutableCopy");
              objc_msgSend(v66, "removeObject:", v60);
              v67 = objc_msgSend(v66, "copy");

              v56 = (uint64_t)v112;
              v122 = (void *)v67;
            }
          }

          v58 = v124;
        }
        ++v59;
      }
      while (v56 != v59);
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v149, v180, 16);
    }
    while (v56);
  }

  v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  objc_msgSend(obja, "icons");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v142, v179, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v143;
    do
    {
      for (j = 0; j != v71; ++j)
      {
        if (*(_QWORD *)v143 != v72)
          objc_enumerationMutation(v69);
        v74 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
        objc_msgSend(v74, "leafIdentifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:forKey:", v74, v75);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v142, v179, 16);
    }
    while (v71);
  }
  v108 = v68;

  objc_msgSend(obja, "removeAllIcons");
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v113 = v122;
  v76 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v178, 16);
  if (v76)
  {
    v77 = v76;
    v123 = *(_QWORD *)v139;
    do
    {
      v78 = 0;
      do
      {
        if (*(_QWORD *)v139 != v123)
          objc_enumerationMutation(v113);
        v79 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v78);
        v80 = (void *)MEMORY[0x1D17DF4E4]();
        objc_msgSend(v124, "objectForKey:", v79);
        v81 = (SBHLibraryCategory *)objc_claimAutoreleasedReturnValue();
        -[SBHLibraryCategory leafIdentifier](v81, "leafIdentifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (v82)
        {
          -[SBFolder iconWithIdentifier:](v119->_categoriesFolder, "iconWithIdentifier:", v82);
          v83 = (SBHLibraryPodCategoryIcon *)objc_claimAutoreleasedReturnValue();
          if (!v83)
          {
            objc_msgSend(v108, "objectForKey:", v82);
            v83 = (SBHLibraryPodCategoryIcon *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "removeObjectForKey:", v82);
          }
        }
        else
        {
          v83 = 0;
        }
        v121[2](v121, v79);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = MEMORY[0x1E0C809B0];
        v135[1] = 3221225472;
        v135[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3_36;
        v135[3] = &unk_1E8D89440;
        v136 = v118;
        v137 = &__block_literal_global_42;
        objc_msgSend(v84, "bs_mapNoNulls:", v135);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = objc_msgSend(v79, "predictionCategoryID");
        if (objc_msgSend(v85, "count"))
          v87 = 1;
        else
          v87 = v86 == 7;
        if (!v87)
        {
          if (v83)
            objc_msgSend(obja, "removeIcon:", v83);
          if (v81)
          {
            -[SBHLibraryCategory updateCategoryWithIcons:](v81, "updateCategoryWithIcons:", v85);
            objc_msgSend(v124, "removeObjectForKey:", v79);
          }
          objc_msgSend(v110, "removeObjectForKey:", v79);
          goto LABEL_84;
        }
        if (v81)
        {
          if (!v83)
            goto LABEL_87;
        }
        else
        {
          v81 = objc_alloc_init(SBHLibraryCategory);
          -[SBHLibraryCategory setCategoryIdentifier:](v81, "setCategoryIdentifier:", v79);
          -[SBHLibraryCategoriesFolderDataSource iconModel](v119, "iconModel");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHLibraryCategory setIconDelegate:](v81, "setIconDelegate:", v91);

          objc_msgSend(v124, "setObject:forKey:", v81, v79);
          v115 = 1;
          if (!v83)
          {
LABEL_87:
            v83 = -[SBHLibraryPodCategoryIcon initWithCategory:]([SBHLibraryPodCategoryIcon alloc], "initWithCategory:", v81);
            v115 = 1;
          }
        }
        objc_msgSend(obja, "addIcon:", v83);
        if (-[SBHLibraryCategory updateCategoryWithIcons:](v81, "updateCategoryWithIcons:", v85))
          objc_msgSend(v114, "addObject:", v79);
        -[SBHLibraryCategory compactPodAdditionalItemsFolder](v81, "compactPodAdditionalItemsFolder");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        SBTreeNodeSetParent(v88, (uint64_t)v119->_categoriesFolder);

        -[SBHLibraryCategory compactPodFolder](v81, "compactPodFolder");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        SBTreeNodeSetParent(v89, (uint64_t)v119->_categoriesFolder);

        -[SBHLibraryCategory expandedPodFolder](v81, "expandedPodFolder");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        SBTreeNodeSetParent(v90, (uint64_t)v119->_categoriesFolder);

LABEL_84:
        objc_autoreleasePoolPop(v80);
        ++v78;
      }
      while (v77 != v78);
      v92 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v138, v178, 16);
      v77 = v92;
    }
    while (v92);
  }

  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4_39;
  v133[3] = &unk_1E8D89468;
  v93 = v113;
  v134 = v93;
  objc_msgSend(obja, "sortUsingComparator:", v133);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if ((v115 & 1) != 0)
  {
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v94 = (void *)-[NSHashTable copy](v119->_observers, "copy");
    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v129, v177, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v130;
      do
      {
        for (k = 0; k != v96; ++k)
        {
          if (*(_QWORD *)v130 != v97)
            objc_enumerationMutation(v94);
          objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * k), "categoriesDataSourceNeedsAnimatedReload:", v119);
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v129, v177, 16);
      }
      while (v96);
    }

  }
  if (objc_msgSend(v114, "count"))
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v99 = (void *)-[NSHashTable copy](v119->_observers, "copy");
    v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v125, v176, 16);
    if (v100)
    {
      v101 = v100;
      v102 = *(_QWORD *)v126;
      do
      {
        for (m = 0; m != v101; ++m)
        {
          if (*(_QWORD *)v126 != v102)
            objc_enumerationMutation(v99);
          objc_msgSend(*(id *)(*((_QWORD *)&v125 + 1) + 8 * m), "categoriesDataSource:shouldAnimateLayoutForCategories:", v119, v114);
        }
        v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v125, v176, 16);
      }
      while (v101);
    }

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isIconVisible:"))
  {
    objc_msgSend(v4, "leafIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "bs_setSafeObject:forKey:", v4, v3);

  }
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  v3 = objc_msgSend(v2, "length");
  v4 = (void *)*MEMORY[0x1E0DC55F8];
  if (v3 > objc_msgSend((id)*MEMORY[0x1E0DC55F8], "length") && objc_msgSend(v2, "hasPrefix:", v4))
  {
    objc_msgSend(v2, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  return v2;
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "sortedApplicationIdentifiersForCategoryIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3;
    v10 = &unk_1E8D893A0;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    objc_msgSend(v5, "bs_filter:", &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bs_setSafeObject:forKey:", v4, v3, v7, v8, v9, v10);

  }
  return v4;
}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "containsObject:", v2);

  return v3;
}

BOOL __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "predictionCategoryID");
  if (v4 == objc_msgSend(*(id *)(a1 + 32), "predictionCategoryID"))
  {
    v5 = objc_msgSend(v3, "predictionCategoryIndex");
    v6 = v5 == objc_msgSend(*(id *)(a1 + 32), "predictionCategoryIndex");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  objc_msgSend(v3, "leafIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      SBLogProactiveAppLibrary();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5_cold_1((uint64_t)v3, v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
    }
  }

}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeIcon:", a2);
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_2_34(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_3_36(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_4_39(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "indexOfObject:", v8);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "categoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "indexOfObject:", v12);

  v14 = 1;
  if (v9 <= v13)
    v14 = -1;
  if (v9 == v13)
    return 0;
  else
    return v14;
}

- (void)_noteDidAddIcon:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  id v9;
  void *v10;

  if (self->_categoryMap)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("icon"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
    if (v10)
    {
      v6 = objc_msgSend(v10, "isWidgetIcon");
      v5 = v10;
      if ((v6 & 1) == 0)
      {
        if (!objc_msgSend(v10, "isApplicationIcon")
          || (v7 = objc_msgSend(v10, "leafIdentifierAndApplicationBundleIDMatches"), v5 = v10, v7))
        {
          v8 = (void *)-[NSSet mutableCopy](self->_mappedIcons, "mutableCopy");
          objc_msgSend(v8, "bs_safeAddObject:", v10);
          if ((objc_msgSend(v8, "isEqualToSet:", self->_mappedIcons) & 1) == 0)
            v9 = -[SBHLibraryCategoriesFolderDataSource reloadDataSourceUsingIcons:categoryMap:](self, "reloadDataSourceUsingIcons:categoryMap:", v8, self->_categoryMap);

          v5 = v10;
        }
      }
    }

  }
}

- (void)_noteDidReplaceIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  SBHLibraryCategoriesFolderDataSource *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_categoryMap)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("icon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)-[NSSet mutableCopy](self->_mappedIcons, "mutableCopy");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v17 = self;
      v7 = self->_mappedIcons;
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v5, "leafIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "leafIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if (v15)
              objc_msgSend(v6, "removeObject:", v12);
          }
          v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      if ((objc_msgSend(v6, "isEqualToSet:", v17->_mappedIcons) & 1) == 0)
        v16 = -[SBHLibraryCategoriesFolderDataSource reloadDataSourceUsingIcons:categoryMap:](v17, "reloadDataSourceUsingIcons:categoryMap:", v6, v17->_categoryMap);

    }
  }
}

- (void)_noteWillRemoveIcon:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  SBHLibraryCategoriesFolderDataSource *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_categoryMap)
  {
    objc_msgSend(a3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("icon"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)-[NSSet mutableCopy](self->_mappedIcons, "mutableCopy");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v17 = self;
      v7 = self->_mappedIcons;
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v5, "leafIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "leafIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v13, "isEqualToString:", v14);

            if (v15)
              objc_msgSend(v6, "removeObject:", v12);
          }
          v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }

      if ((objc_msgSend(v6, "isEqualToSet:", v17->_mappedIcons) & 1) == 0)
        v16 = -[SBHLibraryCategoriesFolderDataSource reloadDataSourceUsingIcons:categoryMap:](v17, "reloadDataSourceUsingIcons:categoryMap:", v6, v17->_categoryMap);

    }
  }
}

- (void)_noteDidReloadIcons:(id)a3
{
  id v3;

  if (self->_categoryMap)
    v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
}

- (void)_noteIconVisibilityDidChange:(id)a3
{
  id v3;

  if (self->_categoryMap)
    v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
}

- (void)_noteWillLayoutIconState:(id)a3
{
  id v3;

  if (self->_categoryMap)
    v3 = -[SBHLibraryCategoriesFolderDataSource reloadDataWithCategoryMap:](self, "reloadDataWithCategoryMap:");
}

- (SBHLibraryCategoriesRootFolder)categoriesFolder
{
  return self->_categoriesFolder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_categoryMap, 0);
  objc_storeStrong((id *)&self->_mappedIcons, 0);
}

void __67__SBHLibraryCategoriesFolderDataSource__regenerateCategoriesFolder__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Found duplicate icon: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
