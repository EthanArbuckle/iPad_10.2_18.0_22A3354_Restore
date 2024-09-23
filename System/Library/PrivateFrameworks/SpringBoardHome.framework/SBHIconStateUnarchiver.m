@implementation SBHIconStateUnarchiver

- (SBHIconStateUnarchiver)initWithArchive:(id)a3
{
  id v5;
  SBHIconStateUnarchiver *v6;
  SBHIconStateUnarchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconStateUnarchiver;
  v6 = -[SBHIconStateUnarchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_archive, a3);
    v7->_removesEmptyFolders = 1;
  }

  return v7;
}

- (SBHIconStateUnarchiver)initWithArchive:(id)a3 iconModel:(id)a4
{
  id v7;
  SBHIconStateUnarchiver *v8;
  SBHIconStateUnarchiver *v9;

  v7 = a4;
  v8 = -[SBHIconStateUnarchiver initWithArchive:](self, "initWithArchive:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_iconModel, a4);
    objc_storeStrong((id *)&v9->_iconSource, a4);
  }

  return v9;
}

- (SBHIconStateUnarchiver)init
{
  return -[SBHIconStateUnarchiver initWithArchive:](self, "initWithArchive:", MEMORY[0x1E0C9AA70]);
}

- (id)effectiveDelegate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBHIconStateUnarchiver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBHIconStateUnarchiver iconModel](self, "iconModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)unarchive
{
  SBIconStateUnarchiveResult *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(SBIconStateUnarchiveResult);
  -[SBHIconStateUnarchiver archive](self, "archive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconStateUnarchiver iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17DF4E4]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metadata"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconStateUnarchiveResult _setMetadata:](v3, "_setMetadata:", v7);

    objc_msgSend(v5, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBIconStateUnarchiveResult metadata](v3, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "willUnarchiveIconModel:withMetadata:", v5, v9);

    }
  }
  -[SBHIconStateUnarchiver _nodeFromRepresentation:context:](self, "_nodeFromRepresentation:context:", v4, v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconStateUnarchiveResult setRootNode:](v3, "setRootNode:", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SBIconStateUnarchiveResult _setRootFolder:](v3, "_setRootFolder:", v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setGridSizeClassDomain:", v11);

  }
  objc_autoreleasePoolPop(v6);

  return v3;
}

- (id)_nodeFromRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("widgetVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_postNewsWidgetMigration = objc_msgSend(v8, "unsignedIntegerValue") != 0;

    -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:](self, "_folderFromRepresentation:withContext:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v13 = (void *)v9;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "_currentFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();

    -[SBHIconStateUnarchiver propertiesForFolderClass:](self, "propertiesForFolderClass:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateUnarchiver _listFromRepresentation:properties:identifier:context:overflow:](self, "_listFromRepresentation:properties:identifier:context:overflow:", v6, v12, 0, v7, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:](self, "_iconFromRepresentation:withContext:", v6, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    SBLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SBHIconStateUnarchiver _nodeFromRepresentation:context:].cold.1();

    objc_msgSend(v7, "_noteRepresentationIsCorrupted");
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)_newFolderIconForFolder:(id)a3
{
  id v3;
  SBFolderIcon *v4;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = -[SBFolderIcon initWithFolder:]([SBFolderIcon alloc], "initWithFolder:", v3);

  return v4;
}

- (id)_iconFromRepresentation:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBHIconStateUnarchiver iconSource](self, "iconSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconStateUnarchiver iconModel](self, "iconModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      SBLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.7();

      goto LABEL_26;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("iconType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqual:", CFSTR("custom")))
    {
      -[SBHIconStateUnarchiver _widgetIconFromRepresentation:context:](self, "_widgetIconFromRepresentation:context:", v6, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        SBLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.4();
LABEL_45:

        objc_msgSend(v7, "_noteSignificantDeviation");
        goto LABEL_46;
      }
      goto LABEL_34;
    }
    if (objc_msgSend(v11, "isEqual:", CFSTR("app")))
    {
      -[SBHIconStateUnarchiver _applicationIconFromRepresentation:context:](self, "_applicationIconFromRepresentation:context:", v6, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        SBLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.5();
        goto LABEL_45;
      }
LABEL_34:
      v18 = (id)v13;
      goto LABEL_22;
    }
    if (v11)
    {
LABEL_46:
      v18 = 0;
      goto LABEL_22;
    }
    -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("iconLists"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v25, "iconStateUnarchiver:iconForRepresentation:", self, v6);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_59;
    }
    objc_msgSend(v7, "_noteEnteredNode");
    -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:](self, "_folderFromRepresentation:withContext:", v6, v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27
      || objc_msgSend(v27, "isEmpty")
      && -[SBHIconStateUnarchiver removesEmptyFolders](self, "removesEmptyFolders")
      && objc_msgSend(v28, "shouldRemoveWhenEmpty"))
    {
      objc_msgSend(v7, "_noteExitedNode");
    }
    else
    {
      v18 = -[SBHIconStateUnarchiver _newFolderIconForFolder:](self, "_newFolderIconForFolder:", v28);
      objc_msgSend(v7, "_noteExitedNode");
      if (v18)
      {
LABEL_58:

LABEL_59:
        goto LABEL_22;
      }
    }
    SBLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.6();

    v18 = 0;
    goto LABEL_58;
  }
  v10 = v6;
  v11 = v10;
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "migratedIdentifierForLeafIdentifier:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10;
  }
  v16 = v12;
  if ((objc_msgSend(v12, "isEqualToString:", v11) & 1) == 0)
  {
    SBLogIcon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v30 = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_INFO, "Migrated identifier for %@ to %@", (uint8_t *)&v30, 0x16u);
    }

    objc_msgSend(v7, "_noteSignificantDeviation");
  }
  objc_msgSend(v8, "leafIconForIdentifier:", v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.3();

  }
LABEL_22:

  if (v18)
  {
    objc_msgSend(v18, "nodeIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_isNodeIdentifierAlreadyUnarchived:", v20))
    {
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.1();
    }
    else
    {
      if (!v9 || objc_msgSend(v9, "isIconVisible:", v18))
      {
        objc_msgSend(v7, "_noteNodeIdentifierWasUnarchived:", v20);
        v23 = v18;
LABEL_38:

        goto LABEL_39;
      }
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:].cold.2();
    }

    objc_msgSend(v7, "_noteSignificantDeviation");
    v23 = 0;
    goto LABEL_38;
  }
LABEL_26:
  SBLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v30 = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_INFO, "could not find icon for representation=%@", (uint8_t *)&v30, 0xCu);
  }

  objc_msgSend(v7, "_noteSignificantDeviation");
  v23 = 0;
LABEL_39:

  return v23;
}

- (Class)_folderClassForFolderType:(id)a3 context:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("folder")) & 1) == 0)
    objc_msgSend(v5, "_currentParseDepth");
  objc_opt_class();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6 iconSource:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  id v18;
  id v19;

  v19 = a6;
  v11 = a7;
  objc_msgSend(v19, "objectForKey:", CFSTR("defaultDisplayName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", &stru_1E8D8E958))
  {

    goto LABEL_6;
  }
  if (!v12)
  {
LABEL_6:
    objc_msgSend(v19, "objectForKey:", CFSTR("displayName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (v13)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v11, "localizedFolderNameForDefaultDisplayName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_8;
LABEL_7:
  objc_msgSend(v11, "localizedDefaultFolderName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlocalizedDefaultFolderName");
  v14 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v14;
LABEL_8:
  if (a3)
    *a3 = objc_retainAutorelease(v13);
  if (a4)
    *a4 = objc_retainAutorelease(v12);
  if (a5)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("uniqueIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {

      v15 = 0;
    }
    v18 = objc_retainAutorelease(v15);
    *a5 = v18;

  }
}

- (void)_getFolderDisplayName:(id *)a3 defaultDisplayName:(id *)a4 uniqueIdentifier:(id *)a5 forRepresentation:(id)a6
{
  id v10;
  void *v11;
  id v12;

  v10 = a6;
  v11 = (void *)objc_opt_class();
  -[SBHIconStateUnarchiver iconModel](self, "iconModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_getFolderDisplayName:defaultDisplayName:uniqueIdentifier:forRepresentation:iconSource:", a3, a4, a5, v10, v12);

}

- (SBHIconGridSize)_listGridSizeForFolderClass:(Class)a3
{
  void *v5;
  int v6;
  unsigned int v7;
  int v8;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "iconStateUnarchiver:listGridSizeForFolderClass:", self, a3);
    v7 = v6 & 0xFFFF0000;
    v8 = (unsigned __int16)v6;
  }
  else
  {
    v7 = 196608;
    v8 = 3;
  }

  return (SBHIconGridSize)(v7 | v8);
}

- (SBHIconGridSize)_listWithNonDefaultSizedIconsGridSizeForFolderClass:(Class)a3
{
  void *v5;
  SBHIconGridSize v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (SBHIconGridSize)objc_msgSend(v5, "iconStateUnarchiver:listWithNonDefaultSizedIconsGridSizeForFolderClass:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (SBHIconGridSize)_listGridSizeForTodayList
{
  void *v2;
  void *v3;
  SBHIconGridSize v4;

  -[SBHIconStateUnarchiver iconModel](self, "iconModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (SBHIconGridSize)(objc_msgSend(v2, "maxColumnCountForTodayList") | 0xFFFF0000);
  else
    v4 = (SBHIconGridSize)-65532;

  return v4;
}

- (SBHIconGridSize)_listGridSizeForFavoriteTodayList
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned __int16 v6;

  -[SBHIconStateUnarchiver iconModel](self, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "maxRowCountForFavoriteTodayList") << 16;
  else
    v5 = 0x40000;
  v6 = (unsigned __int16)-[SBHIconStateUnarchiver _listGridSizeForTodayList](self, "_listGridSizeForTodayList");

  return (SBHIconGridSize)(v6 | v5);
}

- (unint64_t)_maxListCountForFolders
{
  void *v3;
  unint64_t v4;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "maxListCountForFoldersForIconStateUnarchiver:", self);
  else
    v4 = 10;

  return v4;
}

- (unint64_t)_maxIconCountForDock
{
  void *v3;
  unint64_t v4;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "maxIconCountForDockForIconStateUnarchiver:", self);
  else
    v4 = 10;

  return v4;
}

- (id)_gridSizeClassSizes
{
  void *v3;
  SBHIconGridSizeClassSizeMap *v4;
  SBHIconGridSizeClassSizeMap *v5;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "gridSizeClassSizesForIconStateUnarchiver:", self);
    v4 = (SBHIconGridSizeClassSizeMap *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  v5 = v4;

  return v5;
}

- (id)_rotatedGridSizeClassSizes
{
  void *v3;
  void *v4;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "rotatedGridSizeClassSizesForIconStateUnarchiver:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_listRotatedLayoutClusterGridSizeClass
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "listRotatedLayoutClusterGridSizeClassForIconStateUnarchiver:", self);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("SBHIconGridSizeClassDefault");
  }
  v5 = v4;

  return v5;
}

- (BOOL)_listsAllowRotatedLayoutForFolderClass:(Class)a3
{
  void *v5;
  char v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconStateUnarchiver:listsAllowRotatedLayoutForFolderClass:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (id)_allowedGridSizeClassesForFolderClass:(Class)a3
{
  void *v5;
  void *v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "iconStateUnarchiver:allowedGridSizeClassesForFolderClass:", self, a3);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_allowedGridSizeClassesForDock
{
  void *v3;
  void *v4;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "allowedGridSizeClassesForDockForIconStateUnarchiver:", self);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_allowedGridSizeClassesForTodayList
{
  void *v3;
  SBHIconGridSizeClassSet *v4;
  SBHIconGridSizeClassSet *v5;
  void *v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "allowedGridSizeClassesForTodayListForIconStateUnarchiver:", self);
    v4 = (SBHIconGridSizeClassSet *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = [SBHIconGridSizeClassSet alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v5, "initWithGridSizeClasses:", v6);

  }
  return v4;
}

- (int64_t)_listsFixedIconLocationBehaviorForFolderClass:(Class)a3
{
  void *v5;
  int64_t v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconStateUnarchiver:listsFixedIconLocationBehaviorForFolderClass:", self, a3);
  else
    v6 = 1;

  return v6;
}

- (unint64_t)_listsIconLayoutBehaviorForFolderClass:(Class)a3
{
  void *v5;
  unint64_t v6;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconStateUnarchiver:listsIconLayoutBehaviorForFolderClass:", self, a3);
  else
    v6 = 0;

  return v6;
}

- (id)customGridSizeClassDomain
{
  void *v3;
  void *v4;

  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "iconGridSizeClassDomainForIconStateUnarchiver:", self);
  else
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)effectiveGridSizeClassDomain
{
  void *v2;

  -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)propertiesForFolderClass:(Class)a3
{
  SBHIconStateArchiverListProperties *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  SEL v10;
  const char *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  SEL v16;

  v5 = objc_alloc_init(SBHIconStateArchiverListProperties);
  -[SBHIconStateUnarchiver _gridSizeClassSizes](self, "_gridSizeClassSizes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
  {
    objc_setProperty_nonatomic_copy(v5, v7, v6, 24);

    v5->_listGridSize = -[SBHIconStateUnarchiver _listGridSizeForFolderClass:](self, "_listGridSizeForFolderClass:", a3);
    v5->_listWithNonDefaultSizedIconsGridSize = -[SBHIconStateUnarchiver _listWithNonDefaultSizedIconsGridSizeForFolderClass:](self, "_listWithNonDefaultSizedIconsGridSizeForFolderClass:", a3);
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v10, v9, 56);
  }
  else
  {

    -[SBHIconStateUnarchiver _listGridSizeForFolderClass:](self, "_listGridSizeForFolderClass:", a3);
    -[SBHIconStateUnarchiver _listWithNonDefaultSizedIconsGridSizeForFolderClass:](self, "_listWithNonDefaultSizedIconsGridSizeForFolderClass:", a3);
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SBHIconStateUnarchiver _allowedGridSizeClassesForFolderClass:](self, "_allowedGridSizeClassesForFolderClass:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_setProperty_nonatomic_copy(v5, v11, v12, 40);

  -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v5, v13);

  v14 = -[SBHIconStateUnarchiver _listsAllowRotatedLayoutForFolderClass:](self, "_listsAllowRotatedLayoutForFolderClass:", a3);
  if (v5)
  {
    v5->_allowRotatedLayout = v14;
    v5->_fixedIconLocationBehavior = -[SBHIconStateUnarchiver _listsFixedIconLocationBehaviorForFolderClass:](self, "_listsFixedIconLocationBehaviorForFolderClass:", a3);
    v5->_iconLayoutBehavior = -[SBHIconStateUnarchiver _listsIconLayoutBehaviorForFolderClass:](self, "_listsIconLayoutBehaviorForFolderClass:", a3);
    -[SBHIconStateUnarchiver _rotatedGridSizeClassSizes](self, "_rotatedGridSizeClassSizes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v16, v15, 32);
  }
  else
  {
    -[SBHIconStateUnarchiver _listsFixedIconLocationBehaviorForFolderClass:](self, "_listsFixedIconLocationBehaviorForFolderClass:", a3);
    -[SBHIconStateUnarchiver _listsIconLayoutBehaviorForFolderClass:](self, "_listsIconLayoutBehaviorForFolderClass:", a3);
    -[SBHIconStateUnarchiver _rotatedGridSizeClassSizes](self, "_rotatedGridSizeClassSizes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)applyProperties:(id)a3 asDefaultPropertiesToFolder:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;

  v9 = (unsigned __int8 *)a3;
  v5 = a4;
  v6 = v5;
  if (v9)
  {
    objc_msgSend(v5, "setListRotatedLayoutClusterGridSizeClass:", *((_QWORD *)v9 + 7));
    v7 = *((_QWORD *)v9 + 5);
  }
  else
  {
    objc_msgSend(v5, "setListRotatedLayoutClusterGridSizeClass:", 0);
    v7 = 0;
  }
  objc_msgSend(v6, "setListAllowedGridSizeClasses:", v7);
  if (v9)
  {
    objc_msgSend(v6, "setGridSizeClassDomain:", *((_QWORD *)v9 + 6));
    objc_msgSend(v6, "setListsAllowRotatedLayout:", v9[8]);
    objc_msgSend(v6, "setListWithNonDefaultSizedIconsGridSize:", *(unsigned int *)(v9 + 14));
    objc_msgSend(v6, "setListsFixedIconLocationBehavior:", *((_QWORD *)v9 + 8));
    objc_msgSend(v6, "setListsIconLayoutBehavior:", *((_QWORD *)v9 + 9));
    v8 = *((_QWORD *)v9 + 4);
  }
  else
  {
    objc_msgSend(v6, "setGridSizeClassDomain:", 0);
    objc_msgSend(v6, "setListsAllowRotatedLayout:", 0);
    objc_msgSend(v6, "setListWithNonDefaultSizedIconsGridSize:", 0);
    objc_msgSend(v6, "setListsFixedIconLocationBehavior:", 0);
    objc_msgSend(v6, "setListsIconLayoutBehavior:", 0);
    v8 = 0;
  }
  objc_msgSend(v6, "setRotatedIconGridSizeClassSizes:", v8);

}

- (id)dockListProperties
{
  SBHIconStateArchiverListProperties *v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  SEL v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  -[SBHIconStateUnarchiver _gridSizeClassSizes](self, "_gridSizeClassSizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = (SBHIconGridSize)((unsigned __int16)-[SBHIconStateUnarchiver _maxIconCountForDock](self, "_maxIconCountForDock") | 0x10000);
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v3, v8, v7, 56);
  }
  else
  {

    -[SBHIconStateUnarchiver _maxIconCountForDock](self, "_maxIconCountForDock");
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SBHIconStateUnarchiver _allowedGridSizeClassesForDock](self, "_allowedGridSizeClassesForDock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v10, v9, 40);

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v12);

    v3->_allowRotatedLayout = 0;
    v3->_fixedIconLocationBehavior = 0;
    v3->_iconLayoutBehavior = 0;
  }
  else
  {

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v14);

  }
  return v3;
}

- (id)todayListProperties
{
  SBHIconStateArchiverListProperties *v3;
  void *v4;
  const char *v5;
  void *v6;
  void *v7;
  SEL v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v14;

  v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  -[SBHIconStateUnarchiver _gridSizeClassSizes](self, "_gridSizeClassSizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = -[SBHIconStateUnarchiver _listGridSizeForTodayList](self, "_listGridSizeForTodayList");
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v3, v8, v7, 56);
  }
  else
  {

    -[SBHIconStateUnarchiver _listGridSizeForTodayList](self, "_listGridSizeForTodayList");
    -[SBHIconStateUnarchiver _listRotatedLayoutClusterGridSizeClass](self, "_listRotatedLayoutClusterGridSizeClass");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[SBHIconStateUnarchiver _allowedGridSizeClassesForTodayList](self, "_allowedGridSizeClassesForTodayList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v10, v9, 40);

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v12);

    v3->_allowRotatedLayout = 0;
    *(_OWORD *)&v3->_fixedIconLocationBehavior = xmmword_1D0190C50;
  }
  else
  {

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v14);

  }
  return v3;
}

- (id)favoriteTodayListProperties
{
  uint64_t v3;
  SBHIconGridSize v4;

  -[SBHIconStateUnarchiver todayListProperties](self, "todayListProperties");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (SBHIconGridSize)-[SBHIconStateUnarchiver _listGridSizeForFavoriteTodayList](self, "_listGridSizeForFavoriteTodayList");
  if (v3)
    *(SBHIconGridSize *)(v3 + 10) = v4;
  return (id)v3;
}

- (id)ignoredListProperties
{
  SBHIconStateArchiverListProperties *v3;
  SBHIconGridSizeClassSizeMap *v4;
  const char *v5;
  SBHIconGridSizeClassSizeMap *v6;
  SEL v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v13;

  v3 = objc_alloc_init(SBHIconStateArchiverListProperties);
  v4 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  v6 = v4;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v5, v4, 24);

    v3->_listGridSize = (SBHIconGridSize)-65535;
    v3->_listWithNonDefaultSizedIconsGridSize = 0;
    objc_setProperty_nonatomic_copy(v3, v7, CFSTR("SBHIconGridSizeClassDefault"), 56);
  }
  else
  {

  }
  +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v9, v8, 40);

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:]((uint64_t)v3, v11);

    v3->_allowRotatedLayout = 0;
    *(_OWORD *)&v3->_fixedIconLocationBehavior = xmmword_1D0190C50;
    v3->_listAddOptions = 0x100000;
  }
  else
  {

    -[SBHIconStateUnarchiver customGridSizeClassDomain](self, "customGridSizeClassDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateArchiverListProperties setGridSizeClassDomain:](0, v13);

  }
  return v3;
}

- (id)_folderFromRepresentation:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  SBHIconGridSize v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  id v55;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  SBHIconStateUnarchiver *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint8_t buf[4];
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("listType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = -[SBHIconStateUnarchiver _folderClassForFolderType:context:](self, "_folderClassForFolderType:context:", v9, v7);
  if (v10)
  {
    v11 = v10;
    v12 = (SBHIconGridSize)-[SBHIconStateUnarchiver _listGridSizeForFolderClass:](self, "_listGridSizeForFolderClass:", v10);
    v13 = -[SBHIconStateUnarchiver _maxListCountForFolders](self, "_maxListCountForFolders");
    -[SBHIconStateUnarchiver _gridSizeClassSizes](self, "_gridSizeClassSizes");
    v14 = objc_claimAutoreleasedReturnValue();
    v75 = 0;
    v76 = 0;
    v74 = 0;
    v65 = v6;
    -[SBHIconStateUnarchiver _getFolderDisplayName:defaultDisplayName:uniqueIdentifier:forRepresentation:](self, "_getFolderDisplayName:defaultDisplayName:uniqueIdentifier:forRepresentation:", &v76, &v75, &v74, v6);
    v15 = v76;
    v16 = v75;
    v60 = v74;
    v61 = v15;
    v62 = (void *)v14;
    v17 = (void *)objc_msgSend([v11 alloc], "initWithUniqueIdentifier:displayName:maxListCount:listGridSize:iconGridSizeClassSizes:", v60, v15, v13, *(unsigned int *)&v12, v14);
    v18 = v17;
    if (v16)
      objc_msgSend(v17, "setDefaultDisplayName:", v16);
    -[SBHIconStateUnarchiver propertiesForFolderClass:](self, "propertiesForFolderClass:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconStateUnarchiver applyProperties:asDefaultPropertiesToFolder:](self, "applyProperties:asDefaultPropertiesToFolder:");
    objc_msgSend(v18, "startCoalescingContentChangesForReason:", CFSTR("SBResettingIconsCoalesceID"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_pushFolder:", v18);
    v6 = v65;
    objc_msgSend(v65, "objectForKey:", CFSTR("iconLists"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v16;
    v64 = v20;
    if (v20)
    {
      objc_msgSend(v65, "objectForKey:", CFSTR("listUniqueIdentifiers"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKey:", CFSTR("listMetadata"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (!v21
         || (objc_opt_self(),
             v23 = (void *)objc_claimAutoreleasedReturnValue(),
             isKindOfClass = objc_opt_isKindOfClass(),
             v23,
             (isKindOfClass & 1) != 0)))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v64, "count"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke;
        v66[3] = &unk_1E8D86BD8;
        v67 = v21;
        v68 = v25;
        v26 = v18;
        v69 = v26;
        v70 = self;
        v71 = v19;
        v72 = v7;
        v73 = v22;
        v27 = v25;
        objc_msgSend(v64, "enumerateObjectsUsingBlock:", v66);
        objc_msgSend(v26, "_setLists:", v27);

      }
      else
      {
        SBLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.6();

        objc_msgSend(v7, "_noteRepresentationIsCorrupted");
      }

      v16 = v63;
      v20 = v64;
      v6 = v65;
    }
    else
    {
      SBLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.5();

      objc_msgSend(v7, "_noteRepresentationIsCorrupted");
    }
    if (objc_msgSend(v18, "isRootFolder"))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("buttonBar"));
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        SBLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.4();

        objc_msgSend(v7, "_noteRepresentationIsCorrupted");
      }
      else
      {
        -[SBHIconStateUnarchiver dockListProperties](self, "dockListProperties");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconStateUnarchiver _listFromRepresentation:properties:identifier:context:overflow:](self, "_listFromRepresentation:properties:identifier:context:overflow:", v31, v32, 0, v7, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setDock:", v33);

      }
      objc_msgSend(v6, "objectForKey:", CFSTR("today"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35
        && (objc_opt_self(),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = objc_opt_isKindOfClass(),
            v36,
            (v37 & 1) == 0))
      {
        SBLogCommon();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.3();

        objc_msgSend(v7, "_noteRepresentationIsCorrupted");
      }
      else
      {
        -[SBHIconStateUnarchiver todayListProperties](self, "todayListProperties");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconStateUnarchiver _listFromRepresentation:properties:identifier:context:overflow:](self, "_listFromRepresentation:properties:identifier:context:overflow:", v35, v38, 0, v7, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setTodayList:", v39);

      }
      objc_msgSend(v6, "objectForKey:", CFSTR("favoriteToday"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v19;
      if (v41
        && (objc_opt_self(),
            v42 = (void *)objc_claimAutoreleasedReturnValue(),
            v43 = objc_opt_isKindOfClass(),
            v42,
            (v43 & 1) == 0))
      {
        SBLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.2();
        v44 = (void *)v31;

        objc_msgSend(v7, "_noteRepresentationIsCorrupted");
      }
      else
      {
        v44 = (void *)v31;
        -[SBHIconStateUnarchiver todayListProperties](self, "todayListProperties", v57);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconStateUnarchiver _listFromRepresentation:properties:identifier:context:overflow:](self, "_listFromRepresentation:properties:identifier:context:overflow:", v41, v45, 0, v7, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setFavoriteTodayList:", v46);

      }
      objc_msgSend(v65, "objectForKey:", CFSTR("ignored"), v57);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48
        && (objc_opt_self(),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            v50 = objc_opt_isKindOfClass(),
            v49,
            (v50 & 1) == 0))
      {
        SBLogCommon();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          -[SBHIconStateUnarchiver _folderFromRepresentation:withContext:].cold.1();

        objc_msgSend(v7, "_noteRepresentationIsCorrupted");
      }
      else
      {
        -[SBHIconStateUnarchiver ignoredListProperties](self, "ignoredListProperties");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconStateUnarchiver _listFromRepresentation:properties:identifier:context:overflow:](self, "_listFromRepresentation:properties:identifier:context:overflow:", v48, v51, 0, v7, 0);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_setIgnoredList:", v52);

      }
      v16 = v63;
      v20 = v64;
      v6 = v65;
      v19 = v58;
    }
    objc_msgSend(v18, "compactLists");
    if (!objc_msgSend(v18, "visibleListCount"))
    {
      objc_msgSend(v18, "firstList");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setHidden:", 0);

    }
    v55 = (id)objc_msgSend(v7, "_popFolder");
    objc_msgSend(v59, "invalidate");
    objc_msgSend(v18, "markIconStateClean");

  }
  else
  {
    SBLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v6;
      _os_log_impl(&dword_1CFEF3000, v28, OS_LOG_TYPE_INFO, "could not construct folder for representation=%@", buf, 0xCu);
    }

    objc_msgSend(v7, "_noteSignificantDeviation");
    v18 = 0;
  }

  return v18;
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char isKindOfClass;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  char v46;
  unsigned __int16 v47;
  int v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  int v56;
  NSObject *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  id obja;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!v6
     || (objc_opt_self(),
         v7 = (void *)objc_claimAutoreleasedReturnValue(),
         v8 = objc_opt_isKindOfClass(),
         v7,
         (v8 & 1) != 0)))
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    if (v9 < objc_msgSend(*(id *)(a1 + 48), "maxListCount"))
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 56), "_listFromRepresentation:properties:identifier:context:overflow:", v5, *(_QWORD *)(a1 + 64), v6, *(_QWORD *)(a1 + 72), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
      if (!v6)
        goto LABEL_47;
      objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_47;
      v13 = v12;
      objc_msgSend(v12, "objectForKey:", CFSTR("hiddenDate"));
      v14 = objc_claimAutoreleasedReturnValue();
      v61 = (void *)v14;
      if (v14)
      {
        v15 = v14;
        v16 = v11;
        v17 = 1;
        v18 = v15;
      }
      else
      {
        v16 = v11;
        v17 = 0;
        v18 = 0;
      }
      objc_msgSend(v16, "setHidden:byUser:hiddenDate:", v17, 1, v18);
      objc_msgSend(v13, "objectForKey:", CFSTR("focusModeIdentifiers"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFocusModeIdentifiers:");
      objc_msgSend(v13, "objectForKey:", CFSTR("overflowSlotCount"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v13;
      v23 = objc_msgSend(v21, "unsignedIntegerValue");

      objc_msgSend(v11, "setOverflowSlotCount:", v23);
      v62 = v22;
      objc_msgSend(v22, "objectForKey:", CFSTR("rotatedOrder"));
      v24 = objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)v24;
      LOBYTE(v24) = objc_opt_isKindOfClass();

      if ((v24 & 1) != 0)
      {
        v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v63, "count"));
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        obj = v63;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
        if (v26)
        {
          v27 = v26;
          v66 = *(_QWORD *)v71;
LABEL_24:
          v28 = 0;
          while (1)
          {
            if (*(_QWORD *)v71 != v66)
              objc_enumerationMutation(obj);
            v29 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v28);
            objc_opt_self();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
              break;
            objc_msgSend(v11, "directlyContainedIconWithIdentifier:", v29);
            v32 = objc_claimAutoreleasedReturnValue();
            if (!v32)
              break;
            v33 = (void *)v32;
            objc_msgSend(v68, "addObject:", v32);

            if (v27 == ++v28)
            {
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
              if (v27)
                goto LABEL_24;
              break;
            }
          }
        }

        v34 = objc_msgSend(v68, "count");
        if (v34 == objc_msgSend(v11, "numberOfIcons"))
          objc_msgSend(v11, "_setRotatedIcons:clearRotatedFixedIconLocations:", v68, 1);

      }
      v35 = v62;
      objc_msgSend(v62, "objectForKey:", CFSTR("fixedLocations"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKey:", CFSTR("fixedLocationsGridColumns"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "objectForKey:", CFSTR("fixedLocationsGridRows"));
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      v40 = *(_QWORD *)(a1 + 64);
      if (v40 && *(_QWORD *)(v40 + 64))
      {
        v69 = (void *)v38;
        objc_opt_self();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v36;
        v43 = v41;
        v67 = v42;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_45:

          v36 = v67;
          v39 = v69;
          goto LABEL_46;
        }
        objc_opt_self();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        obja = v37;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v35 = v62;
LABEL_44:
          v37 = obja;
          goto LABEL_45;
        }
        objc_opt_self();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v69;
        v46 = objc_opt_isKindOfClass();

        v35 = v62;
        v37 = obja;
        v36 = v67;
        if ((v46 & 1) != 0)
        {
          v47 = objc_msgSend(obja, "unsignedIntegerValue");
          v48 = objc_msgSend(v69, "unsignedIntegerValue");
          v58 = objc_msgSend(v11, "gridSize");
          if (!SBHIconGridSizeEqualToIconGridSize((v48 << 16) | v47, v58))
          {
            SBLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218752;
              v75 = v47;
              v76 = 2048;
              v77 = (unsigned __int16)v48;
              v78 = 2048;
              v79 = (unsigned __int16)v58;
              v80 = 2048;
              v81 = HIWORD(v58);
              _os_log_impl(&dword_1CFEF3000, v43, OS_LOG_TYPE_DEFAULT, "Discarding fixed icon positions because archived grid size (%lu×%lu) does not match actual list size (%lu×%lu)", buf, 0x2Au);
            }
            goto LABEL_45;
          }
          objc_msgSend(*(id *)(a1 + 56), "_sanitizedFixedIconLocationsFromDictionary:", v67);
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setFixedIconLocations:", v43);
          objc_msgSend(v11, "removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:", 0);
          objc_msgSend(v62, "objectForKey:", CFSTR("rotatedFixedLocations"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_opt_isKindOfClass();

          if ((v51 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 56), "_sanitizedFixedIconLocationsFromDictionary:", v49);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setRotatedFixedIconLocations:", v52);
            objc_msgSend(v11, "removeFixedIconLocationsIfPossibleWithGridCellInfoOptions:", 2);

          }
          goto LABEL_44;
        }
      }
LABEL_46:

      do
      {
LABEL_47:
        v53 = v11;
        if (!objc_msgSend(v10, "count"))
          break;
        v54 = objc_msgSend(*(id *)(a1 + 40), "count");
        if (v54 >= objc_msgSend(*(id *)(a1 + 48), "maxListCount"))
          break;
        v55 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v10, "removeAllObjects");
        objc_msgSend(*(id *)(a1 + 56), "_listWithIcons:properties:identifier:folder:overflow:", v55, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 48), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 && (objc_msgSend(v11, "isEmpty") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
        v56 = objc_msgSend(v55, "isEqualToArray:", v10);

      }
      while (!v56);
      if (objc_msgSend(v10, "count"))
      {
        SBLogCommon();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_1();

      }
      goto LABEL_58;
    }
    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_2();

  }
  else
  {
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_3();

    objc_msgSend(*(id *)(a1 + 72), "_noteRepresentationIsCorrupted");
  }
LABEL_58:

}

- (id)_listFromRepresentation:(id)a3 properties:(id)a4 identifier:(id)a5 context:(id)a6 overflow:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v29 = a4;
  v28 = a5;
  v13 = a6;
  v27 = a7;
  objc_msgSend(v13, "_noteEnteredNode");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x1D17DF4E4]();
        -[SBHIconStateUnarchiver _iconFromRepresentation:withContext:](self, "_iconFromRepresentation:withContext:", v20, v13);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v14, "addObject:", v22);
        }
        else
        {
          SBLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v15;
            _os_log_error_impl(&dword_1CFEF3000, v23, OS_LOG_TYPE_ERROR, "could not make icon from representation: %@", buf, 0xCu);
          }

          objc_msgSend(v13, "_noteSignificantDeviation");
        }

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v17);
  }

  objc_msgSend(v13, "_currentFolder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconStateUnarchiver _listWithIcons:properties:identifier:folder:overflow:](self, "_listWithIcons:properties:identifier:folder:overflow:", v14, v29, v28, v24, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
    objc_msgSend(v13, "_noteSignificantDeviation");
  objc_msgSend(v13, "_noteExitedNode");

  return v25;
}

- (id)_listWithIcons:(id)a3 properties:(id)a4 identifier:(id)a5 folder:(id)a6 overflow:(id)a7
{
  id v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (char *)a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
    v16 = *(unsigned int *)(v12 + 10);
  else
    v16 = 0;
  v17 = objc_alloc((Class)objc_msgSend(v14, "listModelClass"));
  if (v12)
    v18 = *((_QWORD *)v12 + 3);
  else
    v18 = 0;
  v36 = v13;
  v19 = (void *)objc_msgSend(v17, "initWithUniqueIdentifier:folder:gridSize:gridSizeClassSizes:", v13, v14, v16, v18);
  v20 = v19;
  if (v12)
  {
    objc_msgSend(v19, "setAllowedGridSizeClasses:", *((_QWORD *)v12 + 5));
    v21 = *((_QWORD *)v12 + 6);
  }
  else
  {
    objc_msgSend(v19, "setAllowedGridSizeClasses:", 0);
    v21 = 0;
  }
  objc_msgSend(v20, "setGridSizeClassDomain:", v21);
  if (v12)
  {
    objc_msgSend(v20, "setAllowsRotatedLayout:", v12[8]);
    v22 = *((_QWORD *)v12 + 7);
  }
  else
  {
    objc_msgSend(v20, "setAllowsRotatedLayout:", 0);
    v22 = 0;
  }
  objc_msgSend(v20, "setRotatedLayoutClusterGridSizeClass:", v22);
  if (v12)
  {
    objc_msgSend(v20, "setFixedIconLocationBehavior:", *((_QWORD *)v12 + 8));
    objc_msgSend(v20, "setIconLayoutBehavior:", *((_QWORD *)v12 + 9));
    objc_msgSend(v20, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", *(unsigned int *)(v12 + 14));
    v23 = *((_QWORD *)v12 + 4);
  }
  else
  {
    objc_msgSend(v20, "setFixedIconLocationBehavior:", 0);
    objc_msgSend(v20, "setIconLayoutBehavior:", 0);
    objc_msgSend(v20, "setGridSizeWhenDirectlyContainingNonDefaultSizedIcons:", 0);
    v23 = 0;
  }
  objc_msgSend(v20, "setRotatedIconGridSizeClassSizes:", v23);
  v37 = v12;
  v35 = v14;
  if (v12)
    v24 = *((_QWORD *)v12 + 10);
  else
    v24 = 0;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v11;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v39 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v31 = objc_msgSend(v20, "numberOfIcons");
        if (v31 >= objc_msgSend(v20, "maxNumberOfIcons"))
        {
          SBLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v30;
            v44 = 2112;
            v45 = v20;
            _os_log_impl(&dword_1CFEF3000, v33, OS_LOG_TYPE_DEFAULT, "list is too small to add icon -> icon=%@ list=%@", buf, 0x16u);
          }

          objc_msgSend(v15, "addObject:", v30);
        }
        else if ((objc_msgSend(v20, "addIcon:options:", v30, v24) & 1) == 0)
        {
          SBLogCommon();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v43 = v30;
            v44 = 2112;
            v45 = v20;
            _os_log_error_impl(&dword_1CFEF3000, v32, OS_LOG_TYPE_ERROR, "could not add icon to list -> icon=%@ list=%@", buf, 0x16u);
          }

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v27);
  }

  objc_msgSend(v20, "markIconStateClean");
  return v20;
}

- (id)_applicationIconFromRepresentation:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("displayIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      -[SBHIconStateUnarchiver iconSource](self, "iconSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applicationIconForBundleIdentifier:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconStateUnarchiver iconModel](self, "iconModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = (void *)objc_msgSend(v14, "iconClassForApplicationWithBundleIdentifier:", v9);
      }
      else
      {
        objc_opt_self();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v17 = (void *)objc_msgSend(objc_alloc((Class)v16), "initWithLeafIdentifier:applicationBundleID:", v6, v9);
      objc_msgSend(v13, "iconDataSources");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addIconDataSources:", v18);

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_widgetIconFromRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  SBWidgetIcon *v13;
  void *v14;
  void *v15;
  char v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  char v44;
  NSObject *v45;
  uint64_t v46;
  char v47;
  SBWidgetIcon *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  __CFString *v52;
  SBWidgetIcon *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  SBWidgetIcon *v60;
  SBWidgetIcon *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFString *v67;
  SBWidgetIcon *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  SBWidgetIcon *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("displayIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v13 = -[SBWidgetIcon initWithLeafIdentifier:applicationBundleID:]([SBWidgetIcon alloc], "initWithLeafIdentifier:applicationBundleID:", v8, 0);
  objc_msgSend(v6, "objectForKey:", CFSTR("gridSize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_isKindOfClass();

  v17 = 0;
  if ((v16 & 1) != 0)
  {
    -[SBHIconStateUnarchiver gridSizeClassForString:](self, "gridSizeClassForString:", v14);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("bundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.news.widget")))
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("widgetIdentifier"));
      v19 = v17;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("today"));

      v17 = v19;
    }
    else
    {
      v21 = 0;
    }

    v22 = -[SBHIconStateUnarchiver postNewsWidgetMigration](self, "postNewsWidgetMigration");
    if (v17 == CFSTR("SBHIconGridSizeClassExtraLarge"))
      v23 = v21 ^ 1;
    else
      v23 = -[__CFString isEqualToString:](v17, "isEqualToString:") & v21 ^ 1;
    if (((v23 | v22) & 1) == 0)
    {
      v24 = CFSTR("SBHIconGridSizeClassNewsLargeTall");

      v17 = v24;
    }
    -[SBIcon setGridSizeClass:](v13, "setGridSizeClass:", v17);
  }
  -[SBHIconStateUnarchiver _customIconElementFromRepresentation:context:](self, "_customIconElementFromRepresentation:context:", v6, v7);
  v25 = objc_claimAutoreleasedReturnValue();
  v64 = v14;
  v65 = (void *)v25;
  if (!v25)
  {
    v67 = v17;
    objc_msgSend(v6, "objectForKey:", CFSTR("elements"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_opt_isKindOfClass();

    if ((v32 & 1) == 0)
    {

      v48 = 0;
      v17 = v67;
      goto LABEL_78;
    }
    v63 = v8;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v28 = v30;
    v33 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (!v33)
    {

LABEL_61:
      v17 = v67;
      goto LABEL_62;
    }
    v34 = v33;
    v68 = v13;
    v35 = *(_QWORD *)v70;
    v66 = v7;
LABEL_22:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v35)
        objc_enumerationMutation(v28);
      v37 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * v36);
      objc_opt_self();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) == 0)
        goto LABEL_45;
      -[SBHIconStateUnarchiver _customIconElementFromRepresentation:context:](self, "_customIconElementFromRepresentation:context:", v37, v7);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        break;
LABEL_44:

LABEL_45:
      if (v34 == ++v36)
      {
        v46 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
        v34 = v46;
        if (!v46)
        {

          v13 = v68;
          goto LABEL_61;
        }
        goto LABEL_22;
      }
    }
    objc_opt_self();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v40, "uniqueIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        if (objc_msgSend(v7, "_isWidgetUniqueIdentifierAlreadyUnarchived:", v42))
        {
          SBLogCommon();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v74 = v40;
            v75 = 2112;
            v76 = v68;
            _os_log_error_impl(&dword_1CFEF3000, v43, OS_LOG_TYPE_ERROR, "detected duplicate widget '%@' to icon '%@'", buf, 0x16u);
          }

          goto LABEL_41;
        }
        v44 = 0;
LABEL_35:
        if (-[SBHIconStateUnarchiver _canAddIconDataSource:toIcon:withGridSizeClass:](self, "_canAddIconDataSource:toIcon:withGridSizeClass:", v40, v68, v67))
        {
          -[SBLeafIcon addIconDataSource:](v68, "addIconDataSource:", v40);
          v7 = v66;
          if ((v44 & 1) == 0)
            objc_msgSend(v66, "_noteWidgetUniqueIdentifierWasUnarchived:", v42);
          goto LABEL_43;
        }
        SBLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v74 = v40;
          v75 = 2112;
          v76 = v68;
          _os_log_error_impl(&dword_1CFEF3000, v45, OS_LOG_TYPE_ERROR, "can't add widget '%@' to icon '%@'", buf, 0x16u);
        }

        v7 = v66;
LABEL_41:
        objc_msgSend(v7, "_noteSignificantDeviation");
LABEL_43:

        goto LABEL_44;
      }
    }
    else
    {

      v42 = 0;
    }
    v44 = 1;
    goto LABEL_35;
  }
  v26 = (void *)v25;
  v63 = v8;
  objc_opt_self();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v28 = 0;
    goto LABEL_51;
  }
  objc_msgSend(v26, "uniqueIdentifier");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_51:
    v47 = 1;
    goto LABEL_52;
  }
  if (objc_msgSend(v7, "_isWidgetUniqueIdentifierAlreadyUnarchived:", v28))
  {
    SBLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SBHIconStateUnarchiver _widgetIconFromRepresentation:context:].cold.2();
    goto LABEL_57;
  }
  v47 = 0;
LABEL_52:
  if (-[SBHIconStateUnarchiver _canAddIconDataSource:toIcon:withGridSizeClass:](self, "_canAddIconDataSource:toIcon:withGridSizeClass:", v26, v13, v17))
  {
    -[SBLeafIcon addIconDataSource:](v13, "addIconDataSource:", v26);
    if ((v47 & 1) == 0)
      objc_msgSend(v7, "_noteWidgetUniqueIdentifierWasUnarchived:", v28);
    goto LABEL_62;
  }
  SBLogCommon();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[SBHIconStateUnarchiver _widgetIconFromRepresentation:context:].cold.1();
LABEL_57:

  objc_msgSend(v7, "_noteSignificantDeviation");
LABEL_62:

  objc_msgSend(v6, "objectForKey:", CFSTR("userSelectedElementIdentifier"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[SBLeafIcon firstIconDataSourceWithUniqueIdentifier:](v13, "firstIconDataSourceWithUniqueIdentifier:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogIcon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      -[SBIcon uniqueIdentifier](v13, "uniqueIdentifier");
      v52 = v17;
      v53 = (SBWidgetIcon *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v74 = v50;
      v75 = 2112;
      v76 = v53;
      _os_log_impl(&dword_1CFEF3000, v51, OS_LOG_TYPE_DEFAULT, "Setting last user selected data source after unarchiving: %@ for: %@", buf, 0x16u);

      v17 = v52;
    }

    -[SBWidgetIcon setLastUserSelectedDataSource:](v13, "setLastUserSelectedDataSource:", v50);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("allowsSuggestions"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBWidgetIcon setAllowsSuggestions:](v13, "setAllowsSuggestions:", objc_msgSend(v54, "BOOLValue"));
  objc_msgSend(v6, "objectForKey:", CFSTR("allowsExternalSuggestions"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBWidgetIcon setAllowsExternalSuggestions:](v13, "setAllowsExternalSuggestions:", objc_msgSend(v55, "BOOLValue"));
  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v56, "iconStateUnarchiver:didUnarchiveWidgetIcon:", self, v13);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      v59 = v17;
      v60 = v57;

      v13 = v60;
      v17 = v59;
    }

  }
  if (-[SBLeafIcon iconDataSourceCount](v13, "iconDataSourceCount"))
    v61 = v13;
  else
    v61 = 0;
  v48 = v61;

  v8 = v63;
  v14 = v64;
LABEL_78:

  return v48;
}

- (BOOL)_canAddIconDataSource:(id)a3 toIcon:(id)a4 withGridSizeClass:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v8, "gridSizeClass");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "supportedGridSizeClassesForIcon:", v8);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllGridSizeClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsGridSizeClass:", v12);

  return v14;
}

- (id)_customIconElementFromRepresentation:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  SBHWidget *v26;
  __objc2_class *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  int64_t v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  uint64_t v37;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  SBHIconStateUnarchiver *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("uniqueIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("elementType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("widgetSuggestionSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
  }
  if (v9)
  {
    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
    {
      v26 = 0;
      goto LABEL_37;
    }
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("widget")))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("widgetIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_isKindOfClass();

    v43 = self;
    if ((v19 & 1) == 0)
    {

      v17 = 0;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("bundleIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_isKindOfClass();

    v44 = v7;
    if ((v22 & 1) == 0)
    {

      v20 = 0;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("containerBundleIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v44, "_noteSignificantDeviation");

      v23 = 0;
    }
    v26 = 0;
    if (v8 && v17)
    {
      if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D01B60]))
      {
        -[SBHIconStateUnarchiver _batteryElementWithIdentifier:](v43, "_batteryElementWithIdentifier:", v8);
        v26 = (SBHWidget *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[SBHIconStateUnarchiver supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:](v43, "supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:", v17, v20, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:]([SBHWidget alloc], "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v8, v17, v20, v23, v28);
        SBLogWidgets();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          -[SBHWidget extensionBundleIdentifier](v26, "extensionBundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v28;
          -[SBHWidget uniqueIdentifier](v26, "uniqueIdentifier");
          *(_DWORD *)buf = 138543618;
          v46 = v41;
          v47 = 2114;
          v48 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v48;
          _os_log_impl(&dword_1CFEF3000, v29, OS_LOG_TYPE_DEFAULT, "Widget %{public}@ %{public}@ created from arhive.", buf, 0x16u);

          v28 = v42;
        }

      }
    }

    self = v43;
    v7 = v44;
    if (!v10)
      goto LABEL_37;
LABEL_34:
    v32 = -[SBHIconStateUnarchiver _suggestionSourceFromRepresentation:](self, "_suggestionSourceFromRepresentation:", v10);
    objc_opt_self();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_isKindOfClass();

    if ((v34 & 1) != 0
      || (objc_opt_self(),
          v35 = (void *)objc_claimAutoreleasedReturnValue(),
          v36 = objc_opt_isKindOfClass(),
          v35,
          (v36 & 1) != 0))
    {
      v37 = -[SBHWidget copyWithSuggestionSource:](v26, "copyWithSuggestionSource:", v32);

      v26 = (SBHWidget *)v37;
    }
    goto LABEL_37;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("siriSuggestions")))
  {
    v27 = SBHSiriSuggestionsElement;
LABEL_32:
    v31 = objc_msgSend([v27 alloc], "initWithUniqueIdentifier:", v8);
    goto LABEL_33;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("shortcuts")))
  {
    v27 = SBHShortcutsFolderElement;
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("shortcutsSingle")))
  {
    v27 = SBHShortcutsSingleElement;
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("files")))
  {
    v27 = SBHFilesElement;
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("appPredictions")))
  {
    v27 = SBHAppPredictionsElement;
    goto LABEL_32;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("batteries")))
  {
    -[SBHIconStateUnarchiver _batteryElementWithIdentifier:](self, "_batteryElementWithIdentifier:", v8);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_33:
    v26 = (SBHWidget *)v31;
    if (!v10)
      goto LABEL_37;
    goto LABEL_34;
  }
  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v39, "iconStateUnarchiver:iconDataSourceForRepresentation:", self, v6);
    v26 = (SBHWidget *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  if (v9 && !v26)
  {
    SBLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[SBHIconStateUnarchiver _customIconElementFromRepresentation:context:].cold.1();

    objc_msgSend(v7, "_noteSignificantDeviation");
  }

  if (v10)
    goto LABEL_34;
LABEL_37:

  return v26;
}

- (id)_batteryElementWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  SBHWidget *v9;

  v4 = *MEMORY[0x1E0D01B68];
  v5 = *MEMORY[0x1E0D01B60];
  v6 = *MEMORY[0x1E0D01B58];
  v7 = a3;
  -[SBHIconStateUnarchiver supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:](self, "supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:", v4, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:]([SBHWidget alloc], "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v7, v4, v5, v6, v8);

  return v9;
}

- (int64_t)_suggestionSourceFromRepresentation:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("onboarding")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NPlus1"));

  return v4;
}

- (id)_sanitizedFixedIconLocationsFromDictionary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SBHIconStateUnarchiver__sanitizedFixedIconLocationsFromDictionary___block_invoke;
  v8[3] = &unk_1E8D86C00;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __69__SBHIconStateUnarchiver__sanitizedFixedIconLocationsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v9);
  }
  else
  {

  }
}

- (id)supportedGridSizeClassesForWidgetWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SBHIconStateUnarchiver effectiveDelegate](self, "effectiveDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "iconStateUnarchiver:supportedGridSizeClassesForWidgetWithKind:extensionBundleIdentifier:containerBundleIdentifier:", self, v8, v9, v10);
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllNonDefaultGridSizeClasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)gridSizeClassForString:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  -[SBHIconStateUnarchiver effectiveGridSizeClassDomain](self, "effectiveGridSizeClassDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gridSizeClassForArchiveValue:", v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = CFSTR("SBHIconGridSizeClassSmall");

  return v6;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (SBHIconStateUnarchiverIconSource)iconSource
{
  return self->_iconSource;
}

- (void)setIconSource:(id)a3
{
  objc_storeStrong((id *)&self->_iconSource, a3);
}

- (SBHIconStateUnarchiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BOOL)removesEmptyFolders
{
  return self->_removesEmptyFolders;
}

- (void)setRemovesEmptyFolders:(BOOL)a3
{
  self->_removesEmptyFolders = a3;
}

- (id)archive
{
  return self->_archive;
}

- (BOOL)postNewsWidgetMigration
{
  return self->_postNewsWidgetMigration;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_archive, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_iconSource, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
}

- (void)_nodeFromRepresentation:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "the node representation is in an unknown format -> %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "throwing out icon because its nodeIdentifier has already been unarchived : node=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "throwing out icon because it isn't visible in the model : node=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "could not find icon for representation -> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "could not generate widget icon for representation -> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "could not generate additional application icon for representation -> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "could not generate folderIcon for representation -> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_iconFromRepresentation:withContext:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "throwing out unknown icon representation -> %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of ignored page list should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of favorite today page list should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of today page list should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of dock should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of folder should contain lists: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_folderFromRepresentation:withContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of lists should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "overflow list exceeds the maxListCount of the folder -> folder=%{public}@ overflowListRepresentation=%{public}@");
  OUTLINED_FUNCTION_3();
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "list representation exceeds the maxListCount of the folder -> folder=%{public}@ listRepresentation=%{public}@");
  OUTLINED_FUNCTION_3();
}

void __64__SBHIconStateUnarchiver__folderFromRepresentation_withContext___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Representation of list should be an array: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_widgetIconFromRepresentation:context:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "can't add widget '%@' to icon '%@'");
  OUTLINED_FUNCTION_3();
}

- (void)_widgetIconFromRepresentation:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1CFEF3000, v0, v1, "detected duplicate widget '%@' to icon '%@'");
  OUTLINED_FUNCTION_3();
}

- (void)_customIconElementFromRepresentation:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "unknown custom icon element type: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
