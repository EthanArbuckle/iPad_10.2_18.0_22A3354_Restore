@implementation PRWidgetGridModel

- (PRWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5
{
  id v9;
  id v10;
  PRWidgetGridModel *v11;
  PRWidgetGridModel *v12;
  __int16 v13;
  uint64_t v14;
  SBHIconModel *iconModel;
  NSMutableDictionary *v16;
  NSMutableDictionary *complicationDescriptorsByUniqueIdentifier;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v45.receiver = self;
  v45.super_class = (Class)PRWidgetGridModel;
  v11 = -[PRWidgetGridModel init](&v45, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_24;
  objc_storeStrong((id *)&v11->_complicationDescriptors, a3);
  objc_storeStrong((id *)&v12->_iconLayout, a4);
  v12->_type = a5;
  if (a5 == 1)
  {
    v13 = objc_msgSend(MEMORY[0x1E0D1BC88], "sidebarGridHeight");
    v12->_gridSize.columns = 2;
    goto LABEL_6;
  }
  if (!a5)
  {
    v12->_gridSize.columns = 4;
    v13 = 1;
LABEL_6:
    v12->_gridSize.rows = v13;
  }
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAA4B0]), "initWithStore:", v12);
  iconModel = v12->_iconModel;
  v12->_iconModel = (SBHIconModel *)v14;

  -[SBHIconModel setDelegate:](v12->_iconModel, "setDelegate:", v12);
  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  complicationDescriptorsByUniqueIdentifier = v12->_complicationDescriptorsByUniqueIdentifier;
  v12->_complicationDescriptorsByUniqueIdentifier = v16;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v24 = v12->_complicationDescriptorsByUniqueIdentifier;
        objc_msgSend(v23, "uniqueIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v24, "setObject:forKey:", v23, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v20);
  }

  v12->_layoutInsetsMode = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v12, sel__iconModelWillLayoutIconState_, *MEMORY[0x1E0DAAA18], v12->_iconModel);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObserver:selector:name:object:", v12, sel__iconModelDidLayoutIconState_, *MEMORY[0x1E0DAAA08], v12->_iconModel);

  -[SBHIconModel layoutIfNeeded](v12->_iconModel, "layoutIfNeeded");
  PRSharedWidgetExtensionProvider();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerObserver:", v12);

  -[PRWidgetGridModel _populateIntentsByDescriptorIdentifier](v12, "_populateIntentsByDescriptorIdentifier");
  -[PRWidgetGridModel _updateLayoutInsetsMode](v12, "_updateLayoutInsetsMode");
  if (!v10)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v29 = v18;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(v29);
          -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](v12, "_addIconForDescriptor:withGridIndex:animated:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j), 0, 0, (_QWORD)v37);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      }
      while (v31);
    }

  }
  objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry", (_QWORD)v37);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addMonitor:subjectMask:subscriptionOptions:", v12, 1, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&v12->_appProtectionSubjectMonitorSubscription, v35);

LABEL_24:
  return v12;
}

- (void)dealloc
{
  void *v3;
  id WeakRetained;
  objc_super v5;

  PRSharedWidgetExtensionProvider();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_msgSend(WeakRetained, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)PRWidgetGridModel;
  -[PRWidgetGridModel dealloc](&v5, sel_dealloc);
}

- (void)_populateIntentsByDescriptorIdentifier
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_complicationDescriptors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "widget", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "intentReference");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v13);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v14 = (void *)objc_msgSend(v3, "copy");
  -[PRWidgetGridModel setIntentsByDescriptorIdentifier:](self, "setIntentsByDescriptorIdentifier:", v14);

}

- (id)complicationDescriptorForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_complicationDescriptorsByUniqueIdentifier, "objectForKeyedSubscript:", a3);
}

- (BOOL)canAddComplicationDescriptor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PRIconGridSizeClassForWidgetFamily(objc_msgSend(v4, "family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRWidgetGridModel listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "firstFreeGridCellIndexOfRangeOfSizeClass:gridCellInfoOptions:", v5, 0) != 0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

- (void)addComplicationDescriptor:(id)a3
{
  -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](self, "_addIconForDescriptor:withGridIndex:animated:", a3, 0, 1);
}

- (void)addComplicationDescriptor:(id)a3 withGridIndex:(id)a4
{
  -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](self, "_addIconForDescriptor:withGridIndex:animated:", a3, a4, 1);
}

- (id)removeComplicationDescriptor:(id)a3
{
  return -[PRWidgetGridModel _removeIconForDescriptor:animated:](self, "_removeIconForDescriptor:animated:", a3, 1);
}

- (void)updateIntent:(id)a3 forWidgetWithIdentifier:(id)a4
{
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[PRWidgetGridModel complicationDescriptorForIdentifier:](self, "complicationDescriptorForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSArray indexOfObject:](self->_complicationDescriptors, "indexOfObject:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(v6, "widget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widgetByReplacingIntent:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v11, "setWidget:", v10);
    v12 = (void *)-[NSArray mutableCopy](self->_complicationDescriptors, "mutableCopy");
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v8, v11);
    v13 = (void *)objc_msgSend(v12, "copy");
    -[PRWidgetGridModel setComplicationDescriptors:](self, "setComplicationDescriptors:", v13);

  }
}

- (void)saveIconStateIfNeeded
{
  id v2;

  -[PRWidgetGridModel iconModel](self, "iconModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveIconStateIfNeeded");

}

- (SBIconListModel)listModel
{
  void *v2;
  void *v3;

  -[PRWidgetGridModel rootFolder](self, "rootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListModel *)v3;
}

- (SBRootFolder)rootFolder
{
  void *v2;
  void *v3;

  -[PRWidgetGridModel iconModel](self, "iconModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRootFolder *)v3;
}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PRWidgetGridModel setComplicationDescriptors:](self, "setComplicationDescriptors:", v6);
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "importIconState:", v7);

  if (!v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:](self, "_addIconForDescriptor:withGridIndex:animated:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 0, 0, (_QWORD)v14);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (void)setComplicationDescriptors:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *complicationDescriptorsByUniqueIdentifier;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_complicationDescriptors, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
          objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](complicationDescriptorsByUniqueIdentifier, "setObject:forKey:", v11, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    -[PRWidgetGridModel _populateIntentsByDescriptorIdentifier](self, "_populateIntentsByDescriptorIdentifier");
    -[PRWidgetGridModel _updateLayoutInsetsMode](self, "_updateLayoutInsetsMode");
    -[PRWidgetGridModel delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widgetGridModelDidUpdateContent:", self);

  }
}

- (void)_updateLayoutInsetsMode
{
  void *v3;
  int v4;

  if (!self->_type)
  {
    -[PRWidgetGridModel complicationDescriptors](self, "complicationDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "bs_containsObjectPassingTest:", &__block_literal_global_34);

    -[PRWidgetGridModel setLayoutInsetsMode:](self, "setLayoutInsetsMode:", v4 ^ 1u);
  }
}

BOOL __44__PRWidgetGridModel__updateLayoutInsetsMode__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "widget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "family") != 10;

  return v3;
}

- (void)_setupFixedPositionsForRowLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (!-[PRWidgetGridModel type](self, "type"))
  {
    -[PRWidgetGridModel setConfiguringFixedPositions:](self, "setConfiguringFixedPositions:", 1);
    -[PRWidgetGridModel iconModel](self, "iconModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rootFolder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstList");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "removeAllFixedIconLocations");
    objc_msgSend(v13, "icons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_filter:", &__block_literal_global_12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "icons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_filter:", &__block_literal_global_14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count") == 1 && objc_msgSend(v8, "count") == 1)
    {
      v9 = (unsigned __int16)objc_msgSend(v13, "gridSize") - 1;
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v13, "moveContainedIcon:toGridCellIndex:gridCellInfoOptions:mutationOptions:", v10, v9, 0, 128);

    }
    if (objc_msgSend(v6, "count") == 1 && objc_msgSend(v8, "count") == 2)
    {
      objc_msgSend(v6, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "moveContainedIcon:toIndex:options:", v12, 0, 0);

    }
    -[PRWidgetGridModel setConfiguringFixedPositions:](self, "setConfiguringFixedPositions:", 0);

  }
}

BOOL __53__PRWidgetGridModel__setupFixedPositionsForRowLayout__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 11;
}

BOOL __53__PRWidgetGridModel__setupFixedPositionsForRowLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "gridSizeClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = PRWidgetFamilyForIconGridSizeClass(v7);
  return v8 == 10;
}

- (void)_iconModelWillLayoutIconState:(id)a3
{
  -[PRWidgetGridModel willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("listModel"));
}

- (void)_iconModelDidLayoutIconState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PRWidgetGridModel listModel](self, "listModel", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRIconGridSizeClassCircular"), CFSTR("PRIconGridSizeClassRectangular"), CFSTR("PRIconGridSizeClassSystemSmall"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA488]), "initWithGridSizeClasses:", v4);
  objc_msgSend(v6, "setAllowedGridSizeClasses:", v5);
  objc_msgSend(v6, "setIconLayoutBehavior:", 3);
  objc_msgSend(v6, "setFixedIconLocationBehavior:", 1);
  objc_msgSend(v6, "addListObserver:", self);
  -[PRWidgetGridModel _removeIconsForUnavailableWidgets](self, "_removeIconsForUnavailableWidgets");
  -[PRWidgetGridModel didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("listModel"));

}

- (void)_removeIconsForUnavailableWidgets
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *complicationDescriptorsByUniqueIdentifier;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = v3;
  objc_msgSend(v3, "icons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v35;
    v8 = 0x1E0CA5000uLL;
    *(_QWORD *)&v5 = 138412290;
    v29 = v5;
    do
    {
      v9 = 0;
      v30 = v6;
      do
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
        objc_msgSend(v10, "leafIdentifier", v29);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](complicationDescriptorsByUniqueIdentifier, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "hasMatchingDescriptor") & 1) == 0)
        {
          objc_msgSend(v33, "firstList");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeIcon:", v10);

        }
        objc_msgSend(v13, "PRSWidget");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(*(Class *)(v8 + 2160));
        objc_msgSend(v15, "containerBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithBundleIdentifier:allowPlaceholder:error:", v17, 0, 0);

        objc_msgSend(v18, "applicationState");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = objc_msgSend(v19, "isRestricted");

        if ((_DWORD)v17)
        {
          PRLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "containerBundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v29;
            v39 = v21;
            _os_log_impl(&dword_18B634000, v20, OS_LOG_TYPE_DEFAULT, "%@ is restricted. Removing widget icon.", buf, 0xCu);

          }
          objc_msgSend(v33, "firstList");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeIcon:", v10);
        }
        else
        {
          v23 = v8;
          v24 = v7;
          objc_msgSend(v15, "containerBundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "extensionBundleIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PRWidgetGridModel effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:](PRWidgetGridModel, "effectiveContainerBundleIdentifierForContainerBundleIdentifier:extensionBundleIdentifier:", v25, v26);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v27, "isLocked") & 1) != 0 || objc_msgSend(v27, "isHidden"))
          {
            objc_msgSend(v33, "firstList");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeIcon:", v10);

          }
          v7 = v24;
          v8 = v23;
          v6 = v30;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }

}

+ (id)effectiveContainerBundleIdentifierForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  __CFString *v5;
  id v6;

  v5 = (__CFString *)a3;
  v6 = a4;
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("com.apple.Health.Sleep"))
    && objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Health.Sleep.SleepWidgetExtension")))
  {

    v5 = CFSTR("com.apple.Health");
  }

  return v5;
}

- (void)_addIconForDescriptor:(id)a3 withGridIndex:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leafIconForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v8, "widget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PRWidgetGridSupportsFamily(objc_msgSend(v13, "family"));

    if ((v14 & 1) != 0)
    {
      v15 = (void *)-[NSArray mutableCopy](self->_complicationDescriptors, "mutableCopy");
      objc_msgSend(v15, "addObject:", v8);
      v29 = v15;
      v16 = (void *)objc_msgSend(v15, "copy");
      -[PRWidgetGridModel setComplicationDescriptors:](self, "setComplicationDescriptors:", v16);

      -[PRWidgetGridModel _makeWidgetIconForComplicationDescriptor:](self, "_makeWidgetIconForComplicationDescriptor:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "unsignedLongValue");
      -[PRWidgetGridModel iconModel](self, "iconModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rootFolder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isValidGridCellIndex:options:", v18, 4);

      -[PRWidgetGridModel listModel](self, "listModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v9 && (v22 & 1) != 0)
        v25 = (id)objc_msgSend(v23, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", v17, v18, 4, 8);
      else
        objc_msgSend(v23, "addIcon:", v17);

      if (v5)
      {
        -[PRWidgetGridModel presenter](self, "presenter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "performAnimatedInsertionForIcon:", v17);

      }
      -[PRWidgetGridModel _setupFixedPositionsForRowLayout](self, "_setupFixedPositionsForRowLayout");
      -[PRWidgetGridModel iconModel](self, "iconModel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "saveIconStateIfNeeded");

    }
    else
    {
      PRLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PRWidgetGridModel _addIconForDescriptor:withGridIndex:animated:].cold.1(v8, v26);

    }
  }

}

- (id)_removeIconForDescriptor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "leafIconForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PRWidgetGridModel iconModel](self, "iconModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "gridCellInfoWithOptions:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "gridCellIndexForIcon:gridCellInfo:", v9, v13);
    -[PRWidgetGridModel iconModel](self, "iconModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeIcon:", v9);

    if (v4)
    {
      -[PRWidgetGridModel presenter](self, "presenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "performAnimatedRemovalForIcon:", v9);

    }
    -[PRWidgetGridModel _setupFixedPositionsForRowLayout](self, "_setupFixedPositionsForRowLayout");
    -[PRWidgetGridModel iconModel](self, "iconModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "saveIconStateIfNeeded");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_makeWidgetIconForComplicationDescriptor:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v21;
  void *v22;

  v3 = (objc_class *)MEMORY[0x1E0DAA580];
  v4 = a3;
  v21 = [v3 alloc];
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "extensionIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v5, v7, v10, v13);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA678]), "initWithWidget:", v22);
  objc_msgSend(v4, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "copyWithLeafIdentifier:", v15);

  objc_msgSend(v4, "widget");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "family");
  PRIconGridSizeClassForWidgetFamily(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setGridSizeClass:", v19);

  return v16;
}

- (void)invalidate
{
  -[PRWidgetGridModel setIconModel:](self, "setIconModel:", 0);
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5;

  if (!-[PRWidgetGridModel isConfiguringFixedPositions](self, "isConfiguringFixedPositions", a3, a4))
    -[PRWidgetGridModel _setupFixedPositionsForRowLayout](self, "_setupFixedPositionsForRowLayout");
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveIconStateIfNeeded");

}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v5;

  if (!-[PRWidgetGridModel isConfiguringFixedPositions](self, "isConfiguringFixedPositions", a3, a4))
    -[PRWidgetGridModel _setupFixedPositionsForRowLayout](self, "_setupFixedPositionsForRowLayout");
  -[PRWidgetGridModel iconModel](self, "iconModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveIconStateIfNeeded");

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5;
  NSMutableDictionary *complicationDescriptorsByUniqueIdentifier;
  void *v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;

  v5 = a4;
  complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
  v15 = v5;
  objc_msgSend(v5, "leafIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](complicationDescriptorsByUniqueIdentifier, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NSArray indexOfObject:](self->_complicationDescriptors, "indexOfObject:", v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    v11 = (void *)-[NSArray mutableCopy](self->_complicationDescriptors, "mutableCopy");
    objc_msgSend(v11, "removeObjectAtIndex:", v10);
    v12 = (void *)objc_msgSend(v11, "copy");
    -[PRWidgetGridModel setComplicationDescriptors:](self, "setComplicationDescriptors:", v12);

  }
  v13 = self->_complicationDescriptorsByUniqueIdentifier;
  objc_msgSend(v15, "leafIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  void *v5;

  objc_storeStrong((id *)&self->_iconLayout, a3);
  -[PRWidgetGridModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetGridModelDidUpdateContent:", self);

  return 1;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  NSDictionary *iconLayout;
  void *v6;

  iconLayout = self->_iconLayout;
  self->_iconLayout = 0;

  -[PRWidgetGridModel delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetGridModelDidUpdateContent:", self);

  return 1;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return 1;
}

- (id)loadDesiredIconState:(id *)a3
{
  return 0;
}

- (unint64_t)maxListCountForFoldersForIconModel:(id)a3
{
  return 1;
}

- (unint64_t)maxIconCountForDockForIconModel:(id)a3
{
  return 4;
}

- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  return -[PRWidgetGridModel gridSize](self, "gridSize", a3, a4) >> 16;
}

- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  return (unsigned __int16)-[PRWidgetGridModel gridSize](self, "gridSize", a3, a4);
}

- (id)gridSizeClassSizesForIconModel:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA490]), "initWithGridSizeClassesAndGridSizes:", CFSTR("PRIconGridSizeClassCircular"), 65537, CFSTR("PRIconGridSizeClassRectangular"), 65538, CFSTR("PRIconGridSizeClassSystemSmall"), 131074, 0);
}

- (id)gridSizeClassDomainForIconModel:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain", a3);
}

- (id)iconModel:(id)a3 customInsertionIndexPathForIcon:(id)a4 inRootFolder:(id)a5
{
  return 0;
}

- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  return &stru_1E2186E08;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("PRIconGridSizeClassCircular"), a4, CFSTR("PRIconGridSizeClassRectangular"), CFSTR("PRIconGridSizeClassSystemSmall"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAA488]), "initWithGridSizeClasses:", v4);

  return v5;
}

- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return 3;
}

- (void)iconModel:(id)a3 didAddIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PRComplicationDescriptor *v24;
  void *v25;
  PRComplicationDescriptor *v26;
  NSMutableDictionary *complicationDescriptorsByUniqueIdentifier;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  -[NSMutableDictionary allKeys](self->_complicationDescriptorsByUniqueIdentifier, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leafIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = objc_opt_class();
    v11 = v6;
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
    v13 = v12;

    objc_msgSend(v13, "activeWidget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "gridSizeClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = PRWidgetFamilyForIconGridSizeClass(v15);
    v17 = objc_alloc(MEMORY[0x1E0D10038]);
    objc_msgSend(v14, "extensionBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v17, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v18, v19, 0);

    v21 = objc_alloc(MEMORY[0x1E0D10148]);
    objc_msgSend(v14, "kind");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v20, v22, v16, 0, 0);

    v24 = [PRComplicationDescriptor alloc];
    objc_msgSend(v11, "leafIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[PRComplicationDescriptor initWithUniqueIdentifier:widget:](v24, "initWithUniqueIdentifier:widget:", v25, v23);

    complicationDescriptorsByUniqueIdentifier = self->_complicationDescriptorsByUniqueIdentifier;
    objc_msgSend(v11, "leafIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKey:](complicationDescriptorsByUniqueIdentifier, "setObject:forKey:", v26, v28);
    v29 = (void *)-[NSArray mutableCopy](self->_complicationDescriptors, "mutableCopy");
    objc_msgSend(v29, "addObject:", v26);
    v30 = (void *)objc_msgSend(v29, "copy");
    -[PRWidgetGridModel setComplicationDescriptors:](self, "setComplicationDescriptors:", v30);

    objc_msgSend(v31, "saveIconStateIfNeeded");
  }

}

- (void)iconModel:(id)a3 launchIcon:(id)a4 fromLocation:(id)a5 context:(id)a6
{
  id v7;
  id v8;

  v7 = a4;
  -[PRWidgetGridModel presenter](self, "presenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleLaunchRequestForIcon:", v7);

}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  BSDispatchMain();
}

void __61__PRWidgetGridModel_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "iconModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importIconState:", v2);

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PRWidgetGridModel *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PRWidgetGridModel_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E2183900;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __66__PRWidgetGridModel_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "appProtectionSubjectMonitorSubscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconModel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "iconLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "importIconState:", v4);

  }
}

- (NSArray)complicationDescriptors
{
  return self->_complicationDescriptors;
}

- (NSDictionary)iconLayout
{
  return self->_iconLayout;
}

- (unint64_t)type
{
  return self->_type;
}

- (PRWidgetGridModelDelegate)delegate
{
  return (PRWidgetGridModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)layoutInsetsMode
{
  return self->_layoutInsetsMode;
}

- (void)setLayoutInsetsMode:(unint64_t)a3
{
  self->_layoutInsetsMode = a3;
}

- (NSDictionary)intentsByDescriptorIdentifier
{
  return self->_intentsByDescriptorIdentifier;
}

- (void)setIntentsByDescriptorIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_intentsByDescriptorIdentifier, a3);
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  return (APSubjectMonitorSubscription *)objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
  objc_storeWeak((id *)&self->_appProtectionSubjectMonitorSubscription, a3);
}

- (BOOL)isConfiguringFixedPositions
{
  return self->_configuringFixedPositions;
}

- (void)setConfiguringFixedPositions:(BOOL)a3
{
  self->_configuringFixedPositions = a3;
}

- (NSMutableDictionary)complicationDescriptorsByUniqueIdentifier
{
  return self->_complicationDescriptorsByUniqueIdentifier;
}

- (void)setComplicationDescriptorsByUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_complicationDescriptorsByUniqueIdentifier, a3);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
  objc_storeStrong((id *)&self->_iconModel, a3);
}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (PRWidgetGridModelPresenting)presenter
{
  return (PRWidgetGridModelPresenting *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_complicationDescriptorsByUniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_intentsByDescriptorIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconLayout, 0);
  objc_storeStrong((id *)&self->_complicationDescriptors, 0);
}

- (void)_addIconForDescriptor:(void *)a1 withGridIndex:(NSObject *)a2 animated:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "widget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218242;
  v6 = objc_msgSend(v4, "family");
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_18B634000, a2, OS_LOG_TYPE_ERROR, "Unable to add widget grid icon: unsupported family %ld for descriptor %@", (uint8_t *)&v5, 0x16u);

}

@end
