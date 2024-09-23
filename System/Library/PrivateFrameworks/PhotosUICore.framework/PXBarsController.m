@implementation PXBarsController

uint64_t __30__PXBarsController_updateBars__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getCachedOrCreateNewBarButtonItemForIdentifier:placement:", a2, *(_QWORD *)(a1 + 40));
}

- (void)setViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_viewController, obj);
    -[PXBarsController viewControllerDidChange](self, "viewControllerDidChange");
    -[PXBarsController invalidateBars](self, "invalidateBars");
    v5 = obj;
  }

}

- (void)updateIfNeeded
{
  if (-[PXBarsController _needsUpdate](self, "_needsUpdate"))
    -[PXBarsController _updateBarsIfNeeded](self, "_updateBarsIfNeeded");
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.needsUpdateBars;
}

- (void)invalidateBars
{
  self->_needsUpdateFlags.needsUpdateBars = 1;
}

- (void)setWantsAnimatedBarsUpdate:(BOOL)a3
{
  self->_wantsAnimatedBarsUpdate = a3;
}

- (void)_updateBarsIfNeeded
{
  if (self->_needsUpdateFlags.needsUpdateBars)
  {
    self->_needsUpdateFlags.needsUpdateBars = 0;
    -[PXBarsController updateBars](self, "updateBars");
    -[PXBarsController setWantsAnimatedBarsUpdate:](self, "setWantsAnimatedBarsUpdate:", 0);
  }
}

- (void)updateBars
{
  void *v3;
  void *v4;
  void (**v5)(void *, void *, uint64_t, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[5];

  -[PXBarsController viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PXBarsController_updateBars__block_invoke;
  aBlock[3] = &unk_1E511A320;
  aBlock[4] = self;
  v5 = (void (**)(void *, void *, uint64_t, void *))_Block_copy(aBlock);
  -[PXBarsController leftBarButtonItemIdentifiers](self, "leftBarButtonItemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController additionalLeftBarButtonItems](self, "additionalLeftBarButtonItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItems:", v8);

  -[PXBarsController rightBarButtonItemIdentifiers](self, "rightBarButtonItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController additionalRightBarButtonItems](self, "additionalRightBarButtonItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9, 3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItems:", v11);

  -[PXBarsController toolbarItemIdentifiers](self, "toolbarItemIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v12, 4, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXBarsController viewController](self, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setToolbarItems:", v13);

}

id __30__PXBarsController_updateBars__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v6 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = *(_QWORD *)(a1 + 32);
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count", v10, 3221225472, __30__PXBarsController_updateBars__block_invoke_2, &unk_1E511A2F8, v11, a3))
  {
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateDynamicHitTestInsetsForBarWithItems:placement:", v7, a3);

  return v7;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (NSArray)leftBarButtonItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_getCachedOrCreateNewBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[PXBarsController barButtonItemCache](self, "barButtonItemCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXBarsController barButtonItemCachedPlacement](self, "barButtonItemCachedPlacement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

  if ((v12 & 1) != 0)
  {
    if (v8)
      goto LABEL_7;
  }
  else
  {

  }
  -[PXBarsController createBarButtonItemForIdentifier:placement:](self, "createBarButtonItemForIdentifier:placement:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PXBarsController barButtonItemCache](self, "barButtonItemCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXBarsController barButtonItemCachedPlacement](self, "barButtonItemCachedPlacement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v6);

  }
LABEL_7:

  return v8;
}

- (void)purgeCachedBarButtonItemsForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        -[PXBarsController barButtonItemCache](self, "barButtonItemCache");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeObjectForKey:", v9);

        -[PXBarsController barButtonItemCachedPlacement](self, "barButtonItemCachedPlacement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (NSMutableDictionary)barButtonItemCachedPlacement
{
  return self->_barButtonItemCachedPlacement;
}

- (NSMutableDictionary)barButtonItemCache
{
  return self->_barButtonItemCache;
}

- (PXBarsController)init
{
  PXBarsController *v2;
  PXBarsController *v3;
  uint64_t v4;
  NSMutableDictionary *barButtonItemCache;
  NSMutableDictionary *v6;
  NSMutableDictionary *barButtonItemCachedPlacement;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXBarsController;
  v2 = -[PXBarsController init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_needsUpdateFlags.needsUpdateBars = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    barButtonItemCache = v3->_barButtonItemCache;
    v3->_barButtonItemCache = (NSMutableDictionary *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    barButtonItemCachedPlacement = v3->_barButtonItemCachedPlacement;
    v3->_barButtonItemCachedPlacement = v6;

  }
  return v3;
}

- (id)createBarButtonItemForIdentifier:(id)a3 placement:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  const __CFString *v22;

  v5 = a3;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierSelect")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierSelectAll")))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedSelectAllBarButtonItem");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierDeselectAll")))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedDeselectAllBarButtonItem");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierDone")))
    {
      v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v8 = 0;
LABEL_11:
      v6 = objc_msgSend(v7, "initWithBarButtonSystemItem:target:action:", v8, 0, 0);
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierCancel")))
    {
      v7 = objc_alloc(MEMORY[0x1E0DC34F0]);
      v8 = 1;
      goto LABEL_11;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierAdd")))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedAddBarButtonItem");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu")))
    {
      +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "actionMenuGlyphName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v13, "initWithImage:style:target:action:", v14, 0, 0, 0);

LABEL_18:
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierDismiss")))
    {
      v15 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemImageNamed:withConfiguration:", CFSTR("chevron.left"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "imageFlippedForRightToLeftLayoutDirection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v18, 0, 0, 0);
      goto LABEL_13;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierInterButtonSpacing")))
    {
      -[PXBarsController fixedSpaceForInterButtonSpacing](self, "fixedSpaceForInterButtonSpacing");
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierButtonEndSpacing")))
      {
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierAddToLibrary"))
          || objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierContentSyndicationSaveAll")))
        {
          v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
          v21 = (void *)MEMORY[0x1E0DC3870];
          v22 = CFSTR("square.and.arrow.down");
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierInfo")))
        {
          v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
          v21 = (void *)MEMORY[0x1E0DC3870];
          v22 = CFSTR("info.circle");
        }
        else
        {
          if (!objc_msgSend(v5, "isEqualToString:", CFSTR("PXBarItemIdentifierToggleSidebar")))
            goto LABEL_35;
          v20 = objc_alloc(MEMORY[0x1E0DC34F0]);
          v21 = (void *)MEMORY[0x1E0DC3870];
          v22 = CFSTR("sidebar.leading");
        }
        objc_msgSend(v21, "systemImageNamed:", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v20, "initWithImage:style:target:action:", v11, 0, 0, 0);
        goto LABEL_18;
      }
      -[PXBarsController fixedSpaceForEndButtonSpacing](self, "fixedSpaceForEndButtonSpacing");
    }
    if (v19 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_35:
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DC34F0], "px_localizedSelectBarButtonItem");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v9 = (void *)v6;
LABEL_13:

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setBarSpec:(id)a3
{
  PXBarSpec *v5;
  PXBarSpec *v6;

  v5 = (PXBarSpec *)a3;
  if (self->_barSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barSpec, a3);
    -[PXBarsController invalidateBars](self, "invalidateBars");
    -[PXBarsController _updateBarsIfNeeded](self, "_updateBarsIfNeeded");
    v5 = v6;
  }

}

- (void)_updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = a3;
  -[PXBarsController viewController](self, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "px_layoutDirection");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke;
  v10[3] = &unk_1E511A348;
  v10[4] = self;
  -[PXBarsController updateDynamicHitTestInsetsForBarWithItems:placement:layoutDirection:isSpaceItem:dynamicHitTestInsetsViewProvider:](self, "updateDynamicHitTestInsetsForBarWithItems:placement:layoutDirection:isSpaceItem:dynamicHitTestInsetsViewProvider:", v6, a4, v9, v10, &__block_literal_global_25697);

}

- (BOOL)_isSpaceItem:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isSystemItem"))
    v4 = (unint64_t)(objc_msgSend(v3, "systemItem") - 5) < 2;
  else
    v4 = 0;

  return v4;
}

- (NSArray)rightBarButtonItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSArray)toolbarItemIdentifiers
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setAdditionalLeftBarButtonItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *additionalLeftBarButtonItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_additionalLeftBarButtonItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      additionalLeftBarButtonItems = self->_additionalLeftBarButtonItems;
      self->_additionalLeftBarButtonItems = v6;

      -[PXBarsController invalidateBars](self, "invalidateBars");
    }
  }

}

- (void)setAdditionalRightBarButtonItems:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *additionalRightBarButtonItems;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_additionalRightBarButtonItems;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      additionalRightBarButtonItems = self->_additionalRightBarButtonItems;
      self->_additionalRightBarButtonItems = v6;

      -[PXBarsController invalidateBars](self, "invalidateBars");
    }
  }

}

- (void)invalidateBarButtonItemWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXBarsController purgeCachedBarButtonItemsForIdentifiers:](self, "purgeCachedBarButtonItemsForIdentifiers:", v6, v7, v8);
  -[PXBarsController invalidateBars](self, "invalidateBars");
}

- (id)cachedBarButtonItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXBarsController barButtonItemCache](self, "barButtonItemCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)fixedSpaceForInterButtonSpacing
{
  NSObject *v2;
  uint8_t v4[16];

  PXAssertGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Creating a bar button spacer with no width specified", v4, 2u);
  }

  return 0.0;
}

- (double)fixedSpaceForEndButtonSpacing
{
  return 0.0;
}

- (PXBarsControllerDelegate)delegate
{
  return (PXBarsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXActionPerformerDelegate)actionPerformerDelegate
{
  return (PXActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
}

- (void)setActionPerformerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionPerformerDelegate, a3);
}

- (BOOL)wantsAnimatedBarsUpdate
{
  return self->_wantsAnimatedBarsUpdate;
}

- (NSArray)additionalLeftBarButtonItems
{
  return self->_additionalLeftBarButtonItems;
}

- (NSArray)additionalRightBarButtonItems
{
  return self->_additionalRightBarButtonItems;
}

- (PXBarSpec)barSpec
{
  return self->_barSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItemCachedPlacement, 0);
  objc_storeStrong((id *)&self->_barButtonItemCache, 0);
  objc_storeStrong((id *)&self->_barSpec, 0);
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewController);
}

uint64_t __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isSpaceItem:", a2);
}

id __73__PXBarsController__updateDynamicHitTestInsetsForBarWithItems_placement___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "customView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEAE9A00))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)updateDynamicHitTestInsetsForBarWithItems:(id)a3 placement:(unint64_t)a4 layoutDirection:(int64_t)a5 isSpaceItem:(id)a6 dynamicHitTestInsetsViewProvider:(id)a7
{
  id v13;
  void (**v14)(id, void *);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  SEL v21;
  PXBarsController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;

  v30 = a3;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  v31 = v13;
  PXFilter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_13;
    case 2uLL:
      switch(a5)
      {
        case 1:
          goto LABEL_12;
        case 2:
LABEL_11:
          v18 = 0;
          v17 = v16 - 1;
          goto LABEL_13;
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v21 = a2;
          v22 = self;
          v23 = 339;
          goto LABEL_23;
      }
      goto LABEL_10;
    case 3uLL:
      switch(a5)
      {
        case 1:
          goto LABEL_11;
        case 2:
LABEL_12:
          v17 = 0;
          v18 = v16 - 1;
          break;
        case 0:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          v21 = a2;
          v22 = self;
          v23 = 354;
LABEL_23:
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, CFSTR("PXBarsController.m"), v23, CFSTR("Code which should be unreachable has been reached"));

          abort();
        default:
LABEL_10:
          v17 = 0;
          v18 = 0;
          break;
      }
LABEL_13:
      if (v16 >= 1)
      {
        v24 = 0;
        do
        {
          v25 = 5;
          if (v17 == v24)
            v25 = 7;
          if (v18 == v24)
            v26 = v25 | 8;
          else
            v26 = v25;
          v27 = v16;
          objc_msgSend(v15, "objectAtIndexedSubscript:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v14[2](v14, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v29, "setExtendedHitTestInsetsEdges:", v26);
          objc_msgSend(v29, "updateHitTestInsets");

          v16 = v27;
          ++v24;
        }
        while (v27 != v24);
      }

      return;
    default:
      goto LABEL_10;
  }
}

uint64_t __142__PXBarsController_Testing__updateDynamicHitTestInsetsForBarWithItems_placement_layoutDirection_isSpaceItem_dynamicHitTestInsetsViewProvider___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

@end
