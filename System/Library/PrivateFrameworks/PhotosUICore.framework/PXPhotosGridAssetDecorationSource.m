@implementation PXPhotosGridAssetDecorationSource

- (id)draggingSpriteIndexesInLayout:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXPhotosGridAssetDecorationSource update](self, "update");
  -[PXPhotosGridAssetDecorationSource _spriteIndexesForItems:inLayout:](self, "_spriteIndexesForItems:inLayout:", self->_draggedItems, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)update
{
  unint64_t needsUpdate;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosGridAssetDecorationSource update]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXPhotosGridAssetDecorationSource.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      self->_updateFlags.needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXPhotosGridAssetDecorationSource _updateDragDecoration](self, "_updateDragDecoration");
      needsUpdate = self->_updateFlags.needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosGridAssetDecorationSource update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosGridAssetDecorationSource.m"), 337, CFSTR("still needing to update %lu after update pass"), self->_updateFlags.needsUpdate);

    }
  }
}

- (id)_spriteIndexesForItems:(id)a3 inLayout:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "spriteIndexesForItems:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)loadStatusForAsset:(id)a3 atSpriteIndex:(unsigned int)a4 inLayout:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  self->_isGettingLoadStatus = 1;
  v6 = a3;
  -[PXPhotosGridAssetDecorationSource loadingStatusManager](self, "loadingStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "loadingStatusForItemIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  self->_isGettingLoadStatus = 0;
  return v9;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (BOOL)durationAlwaysHidden
{
  return self->_durationAlwaysHidden;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (BOOL)wantsSharedLibraryDecorations
{
  return self->_wantsSharedLibraryDecorations;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)shouldShowSavedToLibraryBadgeForAsset:(id)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = self->_assetImportStatusManager
    && -[PXPhotosGridAssetDecorationSource isInSelectMode](self, "isInSelectMode")
    && -[PXAssetImportStatusManager importStateForAsset:](self->_assetImportStatusManager, "importStateForAsset:", v6) == 2;

  return v8;
}

- (BOOL)isSharedLibraryBadgeEnabled
{
  NSNumber *cachedSharedLibraryBadgeEnabledSettingValue;
  int AppBooleanValue;
  BOOL v5;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *v8;
  Boolean keyExistsAndHasValidFormat;

  cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  if (!cachedSharedLibraryBadgeEnabledSettingValue)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SharedLibraryBadgingEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v5 = AppBooleanValue == 0;
    else
      v5 = 0;
    v6 = !v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedSharedLibraryBadgeEnabledSettingValue;
    self->_cachedSharedLibraryBadgeEnabledSettingValue = v7;

    cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  }
  return -[NSNumber BOOLValue](cachedSharedLibraryBadgeEnabledSettingValue, "BOOLValue");
}

- (BOOL)enableSpatialBadges
{
  return self->_enableSpatialBadges;
}

- (BOOL)enableDebugBadgeColors
{
  return self->_enableDebugBadgeColors;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  void *tapbackStatusManager;
  Class v10;
  objc_class *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 702, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 702, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v15);
  }

LABEL_3:
  v8 = objc_msgSend(v7, "decoratingTypeForSpriteIndex:", v4);
  if (v8 == 3)
  {
    tapbackStatusManager = self;
    goto LABEL_8;
  }
  if (v8 != 7)
  {
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = NSClassFromString(CFSTR("CKMediaObjectTapbackManager"));
    if (!v10)
      goto LABEL_13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = NSClassFromString(CFSTR("CKPhotoGridTapbackView"));
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  tapbackStatusManager = self->_tapbackStatusManager;
LABEL_8:
  v10 = (Class)objc_msgSend(tapbackStatusManager, "decorationViewClass");
LABEL_13:
  v11 = v10;

  return v11;
}

- (Class)decorationViewClass
{
  return self->_decorationViewClass;
}

- (void)observeIsInCloud:(BOOL)a3 forDisplayAsset:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PXPhotosGridAssetDecorationSource *v10;
  BOOL v11;

  v6 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXPhotosGridAssetDecorationSource_observeIsInCloud_forDisplayAsset___block_invoke;
  block[3] = &unk_1E51473C0;
  v9 = v6;
  v10 = self;
  v11 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)preferencesDidChange
{
  NSNumber *cachedSharedLibraryBadgeEnabledSettingValue;

  cachedSharedLibraryBadgeEnabledSettingValue = self->_cachedSharedLibraryBadgeEnabledSettingValue;
  self->_cachedSharedLibraryBadgeEnabledSettingValue = 0;

  -[PXPhotosGridAssetDecorationSource _invalidateSharedLibraryDecoration](self, "_invalidateSharedLibraryDecoration");
}

- (void)_invalidateSharedLibraryDecoration
{
  id v2;

  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateDecoration");

}

- (CGSize)expectedInsetsForItem:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)assetBackgroundStyleForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (void)setDecoratedLayout:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_decoratedLayout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_decoratedLayout, obj);
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    v5 = obj;
  }

}

void __70__PXPhotosGridAssetDecorationSource_observeIsInCloud_forDisplayAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (*(unsigned __int8 *)(a1 + 48) != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "containsObject:"))
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
      if (*(_BYTE *)(a1 + 48))
        objc_msgSend(v2, "addObject:", v4);
      else
        objc_msgSend(v2, "removeObject:", v4);
      objc_msgSend(*(id *)(a1 + 40), "decoratedLayout");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "invalidateDecoration");

    }
  }
}

- (BOOL)wantsTapbackDecorationInLayout:(id)a3
{
  if (self->_tapbackStatusManager)
    return !-[PXPhotosGridAssetDecorationSource isInSelectMode](self, "isInSelectMode", a3);
  else
    return 0;
}

- (BOOL)wantsCaptionDecorationsInLayout:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "itemCaptionsVisible");
  else
    v4 = 0;

  return v4;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return 1;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  _BOOL4 v7;
  int64_t v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "viewEnvironment");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "wantsFocusRing");

  LOBYTE(v5) = -[PXPhotosGridAssetDecorationSource isSelectionLimitReached](self, "isSelectionLimitReached");
  v7 = -[PXPhotosGridAssetDecorationSource isInSelectMode](self, "isInSelectMode");
  if ((v5 & 1) != 0)
  {
    v8 = 5;
  }
  else
  {
    v9 = v7 | v6 ^ 1;
    if (v7)
      v8 = 3;
    else
      v8 = 0;
    if ((v9 & 1) == 0)
    {
      if (-[PXPhotosGridAssetDecorationSource focusRingTypeInLayout:](self, "focusRingTypeInLayout:", v4) == 1)
        v8 = 2;
      else
        v8 = 1;
    }
  }

  return v8;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "px_isRecentlyDeletedSmartAlbum");

  if (v5)
    return 2;
  else
    return 0;
}

- (BOOL)isSelectionLimitReached
{
  return self->_selectionLimitReached;
}

- (int64_t)focusRingTypeInLayout:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  int64_t v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "interItemSpacing");
    v7 = v6;
    objc_msgSend(v5, "interItemSpacing");
    v9 = v8;

    if (v7 >= v9)
      v10 = v9;
    else
      v10 = v7;
    v11 = round(v10) >= (double)-[PXPhotosGridAssetDecorationSource interItemSpacingThresholdForExteriorFocusRingSelection](self, "interItemSpacingThresholdForExteriorFocusRingSelection");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        objc_opt_class();
        v11 = objc_opt_isKindOfClass() ^ 1;
      }
    }
  }
  v12 = v11 & 1;

  return v12;
}

- (BOOL)enableDebugDecoration
{
  return self->_enableDebugDecoration;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setWantsSharedLibraryDecorations:(BOOL)a3
{
  id v3;

  if (self->_wantsSharedLibraryDecorations != a3)
  {
    self->_wantsSharedLibraryDecorations = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setForbiddenBadges:(unint64_t)a3
{
  id v3;

  if (self->_forbiddenBadges != a3)
  {
    self->_forbiddenBadges = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setEnableDebugDecoration:(BOOL)a3
{
  id v3;

  if (self->_enableDebugDecoration != a3)
  {
    self->_enableDebugDecoration = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setDurationAlwaysHidden:(BOOL)a3
{
  id v3;

  if (self->_durationAlwaysHidden != a3)
  {
    self->_durationAlwaysHidden = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setDraggedAssetReferences:(id)a3
{
  NSSet *v4;
  NSSet *draggedAssetReferences;

  if (self->_draggedAssetReferences != a3)
  {
    v4 = (NSSet *)objc_msgSend(a3, "copy");
    draggedAssetReferences = self->_draggedAssetReferences;
    self->_draggedAssetReferences = v4;

    -[PXPhotosGridAssetDecorationSource _invalidateDragDecoration](self, "_invalidateDragDecoration");
  }
}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;

  v5 = (PXSelectionSnapshot *)a3;
  if (self->_selectionSnapshot != v5)
  {
    objc_storeStrong((id *)&self->_selectionSnapshot, a3);
    -[PXPhotosGridAssetDecorationSource setSelectionLimitReached:](self, "setSelectionLimitReached:", -[PXSelectionSnapshot isSelectionLimitReached](v5, "isSelectionLimitReached"));
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    objc_msgSend(off_1E50B5CD0, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableTungstenKeyboardNavigation");

    if (v8)
    {
      -[PXPhotosGridAssetDecorationSource decoratedItemsLayout](self, "decoratedItemsLayout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v5)
      {
        -[PXSelectionSnapshot pendingIndexPath](v5, "pendingIndexPath");
        objc_msgSend(v10, "setItem:forStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 0, 1);
        v12 = 0u;
        v13 = 0u;
        -[PXSelectionSnapshot cursorIndexPath](v5, "cursorIndexPath");
      }
      else
      {
        objc_msgSend(v9, "setItem:forStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 0, 1);
        v12 = 0u;
        v13 = 0u;
      }
      objc_msgSend(v10, "setItem:forStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 1, 1, v12, v13);

    }
    if (v5)
      -[PXSelectionSnapshot pressedIndexPath](v5, "pressedIndexPath");
    -[PXPhotosGridAssetDecorationSource decoratedItemsLayout](self, "decoratedItemsLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setItem:forStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 2, 1);

  }
}

- (void)setSelectionLimitReached:(BOOL)a3
{
  self->_selectionLimitReached = a3;
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a3;
  if (*(_OWORD *)&self->_dataSource != __PAIR128__(a4, (unint64_t)v7))
  {
    self->_section = a4;
    v9 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateDecoration");

    v7 = v9;
  }

}

- (PXGLayout)decoratedLayout
{
  return (PXGLayout *)objc_loadWeakRetained((id *)&self->_decoratedLayout);
}

- (PXGItemsLayout)decoratedItemsLayout
{
  void *v2;
  id v3;

  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (PXGItemsLayout *)v3;
}

- (void)setLoadingStatusManager:(id)a3
{
  PXLoadingStatusManager *v5;
  PXLoadingStatusManager *loadingStatusManager;
  PXLoadingStatusManager *v7;

  v5 = (PXLoadingStatusManager *)a3;
  loadingStatusManager = self->_loadingStatusManager;
  if (loadingStatusManager != v5)
  {
    v7 = v5;
    -[PXLoadingStatusManager unregisterObserver:](loadingStatusManager, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_loadingStatusManager, a3);
    -[PXLoadingStatusManager registerObserver:](self->_loadingStatusManager, "registerObserver:", self);
    -[PXPhotosGridAssetDecorationSource _invalidateProgressDecoration](self, "_invalidateProgressDecoration");
    v5 = v7;
  }

}

- (void)setAssetImportStatusManager:(id)a3
{
  PXAssetImportStatusManager *v5;
  void *v6;
  PXAssetImportStatusManager *v7;

  v5 = (PXAssetImportStatusManager *)a3;
  if (self->_assetImportStatusManager != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_assetImportStatusManager, a3);
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateDecoration");

    v5 = v7;
  }

}

- (PXPhotosGridAssetDecorationSource)init
{
  PXPhotosGridAssetDecorationSource *v2;
  PXPhotosGridAssetDecorationSource *v3;
  uint64_t v4;
  PXAssetBadgeManager *badgeManager;
  NSMutableSet *v6;
  NSMutableSet *assetUUIDsInCloud;
  void *v8;
  NSShadow *v9;
  NSShadow *backgroundShadow;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPhotosGridAssetDecorationSource;
  v2 = -[PXPhotosGridAssetDecorationSource init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_section = 0x7FFFFFFFFFFFFFFFLL;
    +[PXAssetBadgeManager defaultManager](PXAssetBadgeManager, "defaultManager");
    v4 = objc_claimAutoreleasedReturnValue();
    badgeManager = v3->_badgeManager;
    v3->_badgeManager = (PXAssetBadgeManager *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    assetUUIDsInCloud = v3->_assetUUIDsInCloud;
    v3->_assetUUIDsInCloud = v6;

    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3->_forceBadgesOnAllAssets = objc_msgSend(v8, "forceBadgesOnAllAssets");

    v3->_interItemSpacingThresholdForExteriorFocusRingSelection = 10;
    v9 = (NSShadow *)objc_alloc_init(MEMORY[0x1E0DC1298]);
    backgroundShadow = v3->_backgroundShadow;
    v3->_backgroundShadow = v9;

    -[NSShadow setShadowOffset:](v3->_backgroundShadow, "setShadowOffset:", 0.0, 0.0);
    -[NSShadow setShadowBlurRadius:](v3->_backgroundShadow, "setShadowBlurRadius:", 20.0);
    PXRegisterPreferencesObserver(v3);
  }
  return v3;
}

- (BOOL)wantsBackgroundForZeroInset
{
  return 0;
}

- (void)setItemsWithCoveredBottomTrailingCorner:(id)a3
{
  NSIndexSet *v4;
  void *v5;
  char v6;
  NSIndexSet *v7;
  NSIndexSet *itemsWithCoveredBottomTrailingCorner;
  NSIndexSet *v9;

  v9 = (NSIndexSet *)a3;
  v4 = self->_itemsWithCoveredBottomTrailingCorner;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSIndexSet isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSIndexSet *)-[NSIndexSet copy](v9, "copy");
    itemsWithCoveredBottomTrailingCorner = self->_itemsWithCoveredBottomTrailingCorner;
    self->_itemsWithCoveredBottomTrailingCorner = v7;

    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateDecoration");
LABEL_4:

  }
}

- (void)dealloc
{
  objc_super v3;

  PXUnregisterPreferencesObserver(self);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosGridAssetDecorationSource;
  -[PXPhotosGridAssetDecorationSource dealloc](&v3, sel_dealloc);
}

- (void)setIsInSelectMode:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    -[PXPhotosGridAssetDecorationSource tapbackStatusManager](self, "tapbackStatusManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[PXPhotosGridAssetDecorationSource _invalidateTapbackDecoration](self, "_invalidateTapbackDecoration");
    -[PXPhotosGridAssetDecorationSource assetImportStatusManager](self, "assetImportStatusManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateDecoration");

    }
  }
}

- (void)setWantsStacksDecorations:(BOOL)a3
{
  id v3;

  if (self->_wantsStacksDecorations != a3)
  {
    self->_wantsStacksDecorations = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setEnableDebugBadgeColors:(BOOL)a3
{
  id v3;

  if (self->_enableDebugBadgeColors != a3)
  {
    self->_enableDebugBadgeColors = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setEnableSpatialBadges:(BOOL)a3
{
  id v3;

  if (self->_enableSpatialBadges != a3)
  {
    self->_enableSpatialBadges = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setHidesInteractiveFavoriteBadges:(BOOL)a3
{
  id v3;

  if (self->_hidesInteractiveFavoriteBadges != a3)
  {
    self->_hidesInteractiveFavoriteBadges = a3;
    -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateDecoration");

  }
}

- (void)setTapbackStatusManager:(id)a3
{
  PXTapbackStatusManager *v5;
  PXTapbackStatusManager *v6;

  v5 = (PXTapbackStatusManager *)a3;
  if (self->_tapbackStatusManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
    -[PXPhotosGridAssetDecorationSource _invalidateTapbackDecoration](self, "_invalidateTapbackDecoration");
    v5 = v6;
  }

}

- (id)_displayAssetForItem:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  _QWORD v9[4];

  -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotosGridAssetDecorationSource section](self, "section");
  v9[0] = objc_msgSend(v5, "identifier");
  v9[1] = v6;
  v9[2] = a3;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetAtItemIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isStacksBadgeEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StacksEnabled"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 1;
  return !v3;
}

- (void)_invalidateDragDecoration
{
  void *v2;
  void *v3;
  id v4;

  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosGridAssetDecorationSource _invalidateDragDecoration]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXPhotosGridAssetDecorationSource.m"), 341, CFSTR("invalidating %lu after it already has been updated"), 1);

    abort();
  }
  self->_updateFlags.needsUpdate |= 1uLL;
  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateDecoration");

}

- (void)_updateDragDecoration
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[PXPhotosGridAssetDecorationSource draggedAssetReferences](self, "draggedAssetReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *(_QWORD *)off_1E50B7E98;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        *((_QWORD *)&v15 + 1) = 0;
        -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "indexPathForAssetReference:", v11);
        else
          v15 = 0u;

        if ((_QWORD)v15 != v9 && *((_QWORD *)&v15 + 1) == -[PXPhotosGridAssetDecorationSource section](self, "section"))
          objc_msgSend(v4, "addIndex:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, 0.0);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v14 = v4;
  else
    v14 = 0;
  objc_storeStrong((id *)&self->_draggedItems, v14);

}

- (void)_invalidateProgressDecoration
{
  id v2;

  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateDecoration");

}

- (void)_invalidateTapbackDecoration
{
  id v2;

  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateDecorationAndSprites");

}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v5 = a3;
  -[PXPhotosGridAssetDecorationSource selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") < 1)
  {
    v13 = 0;
  }
  else
  {
    -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "identifier");

    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "identifier");

    if (v9 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 433, CFSTR("identifier mismatch between dataSource of %@ and selectionSnapshot %@"), self, v6);

    }
    objc_msgSend(v7, "itemIndexSetForDataSourceIdentifier:section:", v9, -[PXPhotosGridAssetDecorationSource section](self, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PXPhotosGridAssetDecorationSource _spriteIndexesForItems:inLayout:](self, "_spriteIndexesForItems:inLayout:", v12, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "sectionIndexSetForDataSourceIdentifier:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "containsIndex:", -[PXPhotosGridAssetDecorationSource section](self, "section"))&& (objc_msgSend(v6, "dataSource"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "numberOfItemsInSection:", -[PXPhotosGridAssetDecorationSource section](self, "section")), v15, v16 >= 1))
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosGridAssetDecorationSource _spriteIndexesForItems:inLayout:](self, "_spriteIndexesForItems:inLayout:", v17, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

    }
  }

  return v13;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = *(float *)off_1E50B8290;
  v5 = *((float *)off_1E50B8290 + 1);
  v6 = *((float *)off_1E50B8290 + 2);
  v7 = *((float *)off_1E50B8290 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v13[4];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (-[PXPhotosGridAssetDecorationSource wantsNumberedSelectionStyle](self, "wantsNumberedSelectionStyle"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(v6, "itemForSpriteIndex:", v4);
    else
      v4 = v4;
    -[PXPhotosGridAssetDecorationSource selectionSnapshot](self, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "identifier");
    v11 = -[PXPhotosGridAssetDecorationSource section](self, "section");

    v13[0] = v10;
    v13[1] = v11;
    v13[2] = v4;
    v13[3] = 0x7FFFFFFFFFFFFFFFLL;
    v7 = objc_msgSend(v8, "overallSelectionOrderIndexForIndexPath:", v13);

  }
  else
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  id v11;
  id v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  PXAssetBadgeManager *badgeManager;
  uint64_t v17;
  uint64_t v18;
  NSMutableSet *assetUUIDsInCloud;
  void *v20;
  id v21;
  uint64_t (**v22)(_QWORD);
  uint64_t v23;
  void *v24;
  uint64_t (**v25)(_QWORD, _QWORD, _QWORD);
  unint64_t v26;
  double v27;
  PXGAssetDecorationInfo *result;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  PXPhotosGridAssetDecorationSource *v35;
  SEL v36;
  unsigned int v37;
  __int128 v38;
  __int128 v39;

  v11 = a4;
  v12 = a6;
  v13 = -[PXPhotosGridAssetDecorationSource wantsFileSizeBadge](self, "wantsFileSizeBadge");
  v14 = -[PXPhotosGridAssetDecorationSource durationAlwaysHidden](self, "durationAlwaysHidden");
  v15 = -[PXPhotosGridAssetDecorationSource enableSpatialBadges](self, "enableSpatialBadges");
  v38 = 0u;
  v39 = 0u;
  badgeManager = self->_badgeManager;
  if (badgeManager)
  {
    v17 = 2;
    if (!v13)
      v17 = 0;
    if (v14)
      v17 |= 4uLL;
    if (v15)
      v18 = v17 | 8;
    else
      v18 = v17;
    -[PXAssetBadgeManager badgeInfoForAsset:inCollection:options:](badgeManager, "badgeInfoForAsset:inCollection:options:", v11, 0, v18);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
  {
    assetUUIDsInCloud = self->_assetUUIDsInCloud;
    objc_msgSend(v11, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(assetUUIDsInCloud) = -[NSMutableSet containsObject:](assetUUIDsInCloud, "containsObject:", v20);

    if ((_DWORD)assetUUIDsInCloud)
      *(_QWORD *)&v38 = v38 | 0x20;
  }
  if (-[PXPhotosGridAssetDecorationSource shouldShowSavedToLibraryBadgeForAsset:inLayout:](self, "shouldShowSavedToLibraryBadgeForAsset:inLayout:", v11, v12))
  {
    *(_QWORD *)&v38 = v38 | 0x200000000;
  }
  if (-[PXPhotosGridAssetDecorationSource wantsSharedLibraryDecorations](self, "wantsSharedLibraryDecorations")
    && (-[PXPhotosGridAssetDecorationSource isInSelectMode](self, "isInSelectMode") && !PLIsPhotoPicker()
     || -[PXPhotosGridAssetDecorationSource isSharedLibraryBadgeEnabled](self, "isSharedLibraryBadgeEnabled"))
    && objc_msgSend(v11, "isInSharedLibrary"))
  {
    *(_QWORD *)&v38 = v38 | 0x2000000000;
  }
  *(_QWORD *)&v38 = v38 & ~self->_forbiddenBadges;
  if (self->_forceBadgesOnAllAssets)
  {
    v29 = *((double *)&v38 + 1);
    if (*((double *)&v38 + 1) < 1.0)
      v29 = 1.0;
    *((double *)&v38 + 1) = v29;
  }
  else if (-[PXPhotosGridAssetDecorationSource durationAlwaysHidden](self, "durationAlwaysHidden"))
  {
    *((_QWORD *)&v38 + 1) = 0;
  }
  if (-[PXPhotosGridAssetDecorationSource enableDebugBadgeColors](self, "enableDebugBadgeColors"))
    *(_QWORD *)&v38 = v38 | 0x60000000;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __88__PXPhotosGridAssetDecorationSource_assetDecorationInfoForAsset_atSpriteIndex_inLayout___block_invoke;
  v33 = &unk_1E511AFF8;
  v21 = v12;
  v35 = self;
  v36 = a3;
  v34 = v21;
  v37 = a5;
  v22 = (uint64_t (**)(_QWORD))_Block_copy(&v30);
  if (-[NSIndexSet count](self->_itemsWithCoveredBottomTrailingCorner, "count", v30, v31, v32, v33)
    && -[NSIndexSet containsIndex:](self->_itemsWithCoveredBottomTrailingCorner, "containsIndex:", v22[2](v22)))
  {
    *(_QWORD *)&v38 = v38 & 0xFFFFFFFFFFFFFFDDLL;
    *((_QWORD *)&v38 + 1) = 0;
  }
  if (-[PXPhotosGridAssetDecorationSource wantsAssetIndexBadge](self, "wantsAssetIndexBadge"))
  {
    v23 = v22[2](v22);
    *(_QWORD *)&v38 = v38 | 0x200000000000;
    *(_QWORD *)&v39 = v23 + 1;
  }
  -[PXPhotosGridAssetDecorationSource badgesModifier](self, "badgesModifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PXPhotosGridAssetDecorationSource badgesModifier](self, "badgesModifier");
    v25 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v26 = ((uint64_t (**)(_QWORD, id, _QWORD))v25)[2](v25, v11, v38);

    *(_QWORD *)&v38 = v26;
  }
  else
  {
    v26 = v38;
  }
  v27 = *((double *)&v38 + 1);
  retstr->var0 = v26;
  retstr->var1 = v27;
  *(_OWORD *)&retstr->var2 = v39;

  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)assetBackgroundCornerRadiusForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 635, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v15);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 635, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v15, v17);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v7, "decoratedLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayAssetFetchResultForSpritesInRange:inLayout:", objc_msgSend(v7, "decoratedIndexForDecoratingIndex:", a3) | 0x100000000, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberOfDecoratingSpritesPerDecoratedSprite");
  PXDisplayAssetFetchResultScaledWithMultiplier();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PXPhotosGridAssetDecorationSource decoratedLayout](self, "decoratedLayout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "desiredPlaceholderStyleInLayout:", v3);

  return v5;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;

  v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 654, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v16, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 654, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v16);
  }

LABEL_3:
  if (objc_msgSend(v7, "localNumberOfSprites") <= a3)
  {
    v12 = 0;
  }
  else
  {
    v8 = a3 / objc_msgSend(v7, "numberOfDecoratingSpritesPerDecoratedSprite");
    objc_msgSend(v7, "decoratedLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGridAssetDecorationSource selectedSpriteIndexesInLayout:](self, "selectedSpriteIndexesInLayout:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "containsIndex:", v8))
    {
      +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "enableShadow"))
      {
        objc_msgSend(v11, "globalFocusAnimationShadow");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 10.0;
}

- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPhotosGridAssetDecorationSource _displayAssetForItem:](self, "_displayAssetForItem:", objc_msgSend(v6, "itemForSpriteIndex:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXTapbackStatusManager hasTapbacksForAsset:](self->_tapbackStatusManager, "hasTapbacksForAsset:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  int64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  void *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int v40;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 722, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v32);
LABEL_23:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 722, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v32, v34);

    goto LABEL_23;
  }
LABEL_3:
  objc_msgSend(v7, "itemsLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -1;
  v9 = 0;
  if (objc_msgSend(v7, "isSpriteIndex:decoratingSpriteWithIndex:", v4, &v40) && v8)
  {
    v35 = objc_msgSend(v8, "itemForSpriteIndex:", objc_msgSend(v7, "convertSpriteIndex:toDescendantLayout:", v40, v8));
    -[PXPhotosGridAssetDecorationSource _displayAssetForItem:](self, "_displayAssetForItem:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentDataSourceChange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    if (objc_msgSend(v7, "appearState") == 1)
    {
      v13 = v10;
      if (v12)
      {
        objc_msgSend(v12, "changeDetails");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v11;
        v17 = objc_msgSend(v15, "toDataSourceIdentifier");
        v18 = objc_msgSend(v16, "identifier");

        v13 = v10;
        v19 = v17 == v18;
        v11 = v16;
        if (v19)
        {
          v20 = objc_msgSend(v16, "identifier");
          v21 = -[PXPhotosGridAssetDecorationSource section](self, "section");
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v12, "changeDetails");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&v36 = v20;
          *((_QWORD *)&v36 + 1) = v21;
          *(_QWORD *)&v37 = v35;
          *((_QWORD *)&v37 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(off_1E50B4A18, "indexPathAfterRevertingChanges:fromIndexPath:hasIncrementalChanges:objectChanged:", v22, &v36, 0, 0);

          v13 = v10;
          if ((_QWORD)v38 != *(_QWORD *)off_1E50B7E98)
          {
            v13 = v10;
            if ((_QWORD)v39 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v13 = v10;
              if (*((_QWORD *)&v39 + 1) == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v12, "dataSourceBeforeChanges");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v38;
                v37 = v39;
                objc_msgSend(v23, "objectAtIndexPath:", &v36);
                v13 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
          }
          v11 = v16;
        }
      }
    }
    -[PXPhotosGridAssetDecorationSource decorationDataSource](self, "decorationDataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PXPhotosGridAssetDecorationSource decorationDataSource](self, "decorationDataSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userDataForAsset:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PXTapbackStatusManager tapbackUserDataForAsset:previousAsset:](self->_tapbackStatusManager, "tapbackUserDataForAsset:previousAsset:", v10, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PXPhotosGridAssetDecorationSource dataSource](self, "dataSource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "identifier");
      v28 = -[PXPhotosGridAssetDecorationSource section](self, "section");
      *(_QWORD *)&v38 = v27;
      *((_QWORD *)&v38 + 1) = v28;
      *(_QWORD *)&v39 = v35;
      *((_QWORD *)&v39 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v26, "assetReferenceAtItemIndexPath:", &v38);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)debugDecorationAtSpriteIndex:(unsigned int)a3 asset:(id)a4 inLayout:(id)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  double v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  _QWORD v40[7];
  _QWORD v41[4];
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  float32x2_t *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[4];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  _QWORD v65[2];

  v65[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enableStacksReviewUI");

  if (!v12)
  {
    v45 = 0;
    v46 = (float32x2_t *)&v45;
    v47 = 0x4010000000;
    v48 = &unk_1A7E74EE7;
    v18 = *((_OWORD *)off_1E50B8358 + 1);
    v49 = *(_OWORD *)off_1E50B8358;
    v50 = v18;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0xC010000000;
    v53[3] = &unk_1A7E74EE7;
    v19 = *((_OWORD *)off_1E50B83A0 + 7);
    v60 = *((_OWORD *)off_1E50B83A0 + 6);
    v61 = v19;
    v20 = *((_OWORD *)off_1E50B83A0 + 9);
    v62 = *((_OWORD *)off_1E50B83A0 + 8);
    v63 = v20;
    v21 = *((_OWORD *)off_1E50B83A0 + 3);
    v56 = *((_OWORD *)off_1E50B83A0 + 2);
    v57 = v21;
    v22 = *((_OWORD *)off_1E50B83A0 + 5);
    v58 = *((_OWORD *)off_1E50B83A0 + 4);
    v59 = v22;
    v23 = *((_OWORD *)off_1E50B83A0 + 1);
    v54 = *(_OWORD *)off_1E50B83A0;
    v55 = v23;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x4810000000;
    v41[3] = &unk_1A7E74EE7;
    v24 = *((_OWORD *)off_1E50B8398 + 1);
    v42 = *(_OWORD *)off_1E50B8398;
    v43 = v24;
    v44 = *((_QWORD *)off_1E50B8398 + 4);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __81__PXPhotosGridAssetDecorationSource_debugDecorationAtSpriteIndex_asset_inLayout___block_invoke;
    v40[3] = &unk_1E511B020;
    v40[4] = &v45;
    v40[5] = v53;
    v40[6] = v41;
    objc_msgSend(v10, "enumerateSpritesInRange:usingBlock:", a3 | 0x100000000, v40);
    objc_msgSend(v9, "preferredCropRect");
    PXRectFlippedVertically();
    objc_msgSend(v10, "displayScale");
    PXRectDenormalize();
    PXRectArea();
    v26 = v25 / vmul_lane_f32(v46[7], v46[7], 1).f32[0];
    if (v26 <= 0.0 || v26 > 1.29999995)
    {
      if (v26 <= 1.29999995 || v26 > 1.5)
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30 = v27;
    v51[0] = PXGDebugDecorationBackgroundColorKey;
    objc_msgSend(v27, "colorWithAlphaComponent:", 0.150000006);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = PXGDebugDecorationTextKey;
    v52[0] = v31;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fit:%0.0f%%"), v26 * 100.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(&v45, 8);
    goto LABEL_24;
  }
  v13 = v9;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 785, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v37);
LABEL_28:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridAssetDecorationSource.m"), 785, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v37, v39);

    goto LABEL_28;
  }
LABEL_4:
  objc_msgSend(v13, "burstIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v13, "pl_managedAsset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "avalancheKind") == 2)
    {
      objc_msgSend(v13, "burstIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hash") % 0xFFuLL;

      if (v17)
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (double)v17 / 255.0, 1.0, 1.0, 1.0);
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = PXGDebugDecorationBottomEdgeColorKey;
      v65[0] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0C9AA70];
    }

  }
  else
  {
    v29 = (void *)MEMORY[0x1E0C9AA70];
  }

LABEL_24:
  return v29;
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  if (!self->_isGettingLoadStatus)
    -[PXPhotosGridAssetDecorationSource _invalidateProgressDecoration](self, "_invalidateProgressDecoration", a3, a4, a5);
}

- (int64_t)section
{
  return self->_section;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (void)setDecorationDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_decorationDataSource, a3);
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (unint64_t)forbiddenBadges
{
  return self->_forbiddenBadges;
}

- (BOOL)hidesInteractiveFavoriteBadges
{
  return self->_hidesInteractiveFavoriteBadges;
}

- (void)setDecorationViewClass:(Class)a3
{
  objc_storeStrong((id *)&self->_decorationViewClass, a3);
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  self->_wantsDimmedSelectionStyle = a3;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  self->_wantsFileSizeBadge = a3;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (BOOL)wantsStacksDecorations
{
  return self->_wantsStacksDecorations;
}

- (int64_t)interItemSpacingThresholdForExteriorFocusRingSelection
{
  return self->_interItemSpacingThresholdForExteriorFocusRingSelection;
}

- (void)setInterItemSpacingThresholdForExteriorFocusRingSelection:(int64_t)a3
{
  self->_interItemSpacingThresholdForExteriorFocusRingSelection = a3;
}

- (NSIndexSet)itemsWithCoveredBottomTrailingCorner
{
  return self->_itemsWithCoveredBottomTrailingCorner;
}

- (void)setBadgesModifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (PXGGridLayout)decoratedGridLayout
{
  return self->_decoratedGridLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedGridLayout, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong((id *)&self->_itemsWithCoveredBottomTrailingCorner, 0);
  objc_storeStrong((id *)&self->_decorationViewClass, 0);
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_decoratedLayout);
  objc_storeStrong((id *)&self->_cachedSharedLibraryBadgeEnabledSettingValue, 0);
  objc_storeStrong((id *)&self->_backgroundShadow, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_storeStrong((id *)&self->_assetUUIDsInCloud, 0);
  objc_storeStrong((id *)&self->_draggedItems, 0);
}

__n128 __81__PXPhotosGridAssetDecorationSource_debugDecorationAtSpriteIndex_asset_inLayout___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _OWORD *a4, _OWORD *a5, uint64_t a6)
{
  uint64_t v6;
  __int128 v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __n128 result;
  __int128 v18;

  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = a4[1];
  *(_OWORD *)(v6 + 32) = *a4;
  *(_OWORD *)(v6 + 48) = v7;
  v8 = *(_OWORD **)(a1[5] + 8);
  v9 = a5[5];
  v11 = a5[2];
  v10 = a5[3];
  v8[6] = a5[4];
  v8[7] = v9;
  v8[4] = v11;
  v8[5] = v10;
  v12 = a5[9];
  v14 = a5[6];
  v13 = a5[7];
  v8[10] = a5[8];
  v8[11] = v12;
  v8[8] = v14;
  v8[9] = v13;
  v15 = a5[1];
  v8[2] = *a5;
  v8[3] = v15;
  v16 = *(_QWORD *)(a1[6] + 8);
  result = *(__n128 *)a6;
  v18 = *(_OWORD *)(a6 + 16);
  *(_QWORD *)(v16 + 64) = *(_QWORD *)(a6 + 32);
  *(__n128 *)(v16 + 32) = result;
  *(_OWORD *)(v16 + 48) = v18;
  return result;
}

uint64_t __88__PXPhotosGridAssetDecorationSource_assetDecorationInfoForAsset_atSpriteIndex_inLayout___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "itemForSpriteIndex:", *(unsigned int *)(a1 + 56));

  return v3;
}

@end
