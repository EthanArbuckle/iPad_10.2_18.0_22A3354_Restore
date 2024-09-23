@implementation PXUIAssetsScene

- (PXUIAssetsScene)initWithTilingController:(id)a3 mediaProvider:(id)a4 dataSourceManager:(id)a5 selectionManager:(id)a6 delegate:(id)a7
{
  id v12;
  PXUIAssetsScene *v13;
  NSMutableSet *v14;
  NSMutableSet *tilesInUse;
  uint64_t v16;
  NSMapTable *imageRequesterByAssetReference;
  void *v18;
  void *v19;
  objc_super v21;

  v12 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXUIAssetsScene;
  v13 = -[PXAssetsScene initWithTilingController:mediaProvider:dataSourceManager:selectionManager:delegate:](&v21, sel_initWithTilingController_mediaProvider_dataSourceManager_selectionManager_delegate_, v12, a4, a5, a6, a7);
  if (v13)
  {
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    tilesInUse = v13->_tilesInUse;
    v13->_tilesInUse = v14;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    imageRequesterByAssetReference = v13->_imageRequesterByAssetReference;
    v13->_imageRequesterByAssetReference = (NSMapTable *)v16;

    objc_msgSend(v12, "scrollController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);

    -[PXUIAssetsScene _registerDefaultTiles](v13, "_registerDefaultTiles");
    -[PXUIAssetsScene _invalidatePreheating](v13, "_invalidatePreheating");
    -[PXUIAssetsScene _updatePreheatingIfNeeded](v13, "_updatePreheatingIfNeeded");
  }

  return v13;
}

- (PXUIScrollViewController)scrollViewController
{
  void *v2;
  void *v3;

  -[PXAssetsScene tilingController](self, "tilingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXUIScrollViewController *)v3;
}

- (void)_registerDefaultTiles
{
  id v2;

  -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333123, &__block_literal_global_90878);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333183, &__block_literal_global_6_90879);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333193, &__block_literal_global_8_90880);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333203, &__block_literal_global_10_90881);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333133, &__block_literal_global_12_90882);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333153, &__block_literal_global_14_90883);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333163, &__block_literal_global_16_90884);
  objc_msgSend(v2, "registerReusableObjectForReuseIdentifier:creationHandler:", 333173, &__block_literal_global_17_90885);

}

- (id)_imageRequesterForIndexPath:(PXSimpleIndexPath *)a3 inDataSource:(id)a4
{
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  v5 = *(_OWORD *)&a3->item;
  v9[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v9[1] = v5;
  objc_msgSend(a4, "assetReferenceAtItemIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIAssetsScene _imageRequesterForAssetReference:](self, "_imageRequesterForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_imageRequesterForAssetReference:(id)a3
{
  id v4;
  PXImageRequester *v5;
  PXImageRequester *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v13[5];

  v4 = a3;
  -[NSMapTable objectForKey:](self->_imageRequesterByAssetReference, "objectForKey:", v4);
  v5 = (PXImageRequester *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = [PXImageRequester alloc];
    -[PXAssetsScene mediaProvider](self, "mediaProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXImageRequester initWithMediaProvider:asset:](v6, "initWithMediaProvider:asset:", v7, v8);

    -[PXUIAssetsScene maximumImageSize](self, "maximumImageSize");
    if (*MEMORY[0x1E0C9D820] != v10 || *(double *)(MEMORY[0x1E0C9D820] + 8) != v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__PXUIAssetsScene__imageRequesterForAssetReference___block_invoke;
      v13[3] = &unk_1E5124B18;
      v13[4] = self;
      -[PXImageRequester performChanges:](v5, "performChanges:", v13);
    }
    -[NSMapTable setObject:forKey:](self->_imageRequesterByAssetReference, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_transitionImageRequestersToDataSource:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSMapTable *imageRequesterByAssetReference;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMapTable count](self->_imageRequesterByAssetReference, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMapTable keyEnumerator](self->_imageRequesterByAssetReference, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_imageRequesterByAssetReference, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v4, "assetReferenceForAssetReference:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v12, v13);
              v15[0] = MEMORY[0x1E0C809B0];
              v15[1] = 3221225472;
              v15[2] = __58__PXUIAssetsScene__transitionImageRequestersToDataSource___block_invoke;
              v15[3] = &unk_1E5124B18;
              v16 = v13;
              objc_msgSend(v12, "performChanges:", v15);

            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    imageRequesterByAssetReference = self->_imageRequesterByAssetReference;
    self->_imageRequesterByAssetReference = v5;

  }
}

- (BOOL)needsUpdate
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXUIAssetsScene;
  return -[PXAssetsScene needsUpdate](&v4, sel_needsUpdate) || self->_needsUpdateFlags.preheating;
}

- (void)updateIfNeeded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIAssetsScene;
  -[PXAssetsScene updateIfNeeded](&v3, sel_updateIfNeeded);
  if (-[PXUIAssetsScene needsUpdate](self, "needsUpdate"))
    -[PXUIAssetsScene _updatePreheatingIfNeeded](self, "_updatePreheatingIfNeeded");
}

- (void)_invalidatePreheating
{
  self->_needsUpdateFlags.preheating = 1;
  -[PXAssetsScene setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updatePreheatingIfNeeded
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_needsUpdateFlags.preheating)
  {
    self->_needsUpdateFlags.preheating = 0;
    -[PXAssetsScene scrollSpeedometer](self, "scrollSpeedometer");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v15, "regime"))
    {
      case -1:
        break;
      case 1:
        objc_msgSend(v15, "previousRegime");
        goto LABEL_5;
      default:
LABEL_5:
        objc_msgSend(v15, "scrollViewController");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "scrollView");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "contentSize");
        objc_msgSend(v4, "contentInset");
        sub_1A7AE3F38();
        PXEdgeInsetsInsetSize();
        objc_msgSend(v4, "bounds");
        objc_msgSend(v4, "bounds");
        PXEdgeInsetsMake();
        v6 = v5;
        v8 = v7;
        v10 = v9;
        v12 = v11;
        -[PXAssetsScene tilingController](self, "tilingController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXAssetsSceneSettings sharedInstance](PXAssetsSceneSettings, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "enableImagePreheating"))
          objc_msgSend(v13, "registerPreheatHandler:withPadding:tileGroup:context:", self, 0, PXImagePreheatContext, v6, v8, v10, v12);
        else
          objc_msgSend(v13, "unregisterPreheatHandler:context:", self, PXImagePreheatContext);

        break;
    }

  }
}

- (void)willTransitionToDataSource:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUIAssetsScene;
  v4 = a3;
  -[PXAssetsScene willTransitionToDataSource:](&v5, sel_willTransitionToDataSource_, v4);
  -[PXUIAssetsScene _transitionImageRequestersToDataSource:](self, "_transitionImageRequestersToDataSource:", v4, v5.receiver, v5.super_class);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[5];

  v8 = a3;
  if ((a4 & 6) != 0 && (void *)PXAssetsSceneSpeedometerObserverContext == a5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PXUIAssetsScene_observable_didChange_context___block_invoke;
    v10[3] = &unk_1E5149198;
    v10[4] = self;
    -[PXAssetsScene performChanges:](self, "performChanges:", v10);
  }
  v9.receiver = self;
  v9.super_class = (Class)PXUIAssetsScene;
  -[PXAssetsScene observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);

}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  unint64_t v8;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  unint64_t v55;
  _QWORD v56[4];
  id v57;

  v7 = a4;
  v8 = a3->index[0];
  if (a3->length != 5 || v8 != 6432423)
  {
    switch(v8)
    {
      case 0x60A012uLL:
        -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = 333133;
        goto LABEL_14;
      case 0x60A013uLL:
        -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "checkOutReusableObjectWithReuseIdentifier:", 333163);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        -[PXAssetsScene badgeManager](self, "badgeManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBadgeManager:", v24);

        v47 = *(_OWORD *)&a3->index[1];
        v25 = a3->index[3];
        v26 = a3->index[4];
        objc_msgSend(v7, "dataSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v47;
        *(_QWORD *)&v51 = v25;
        *((_QWORD *)&v51 + 1) = v26;
        -[PXUIAssetsScene _imageRequesterForIndexPath:inDataSource:](self, "_imageRequesterForIndexPath:inDataSource:", &v50, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "setImageRequester:", v28);
        goto LABEL_23;
      case 0x60A014uLL:
        -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = 333153;
LABEL_14:
        objc_msgSend(v10, "checkOutReusableObjectWithReuseIdentifier:", v12);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 0x60A015uLL:
        -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "checkOutReusableObjectWithReuseIdentifier:", 333173);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        v48 = *(_OWORD *)&a3->index[1];
        v30 = a3->index[3];
        v31 = a3->index[4];
        objc_msgSend(v7, "dataSource");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v48;
        *(_QWORD *)&v51 = v30;
        *((_QWORD *)&v51 + 1) = v31;
        -[PXUIAssetsScene _imageRequesterForIndexPath:inDataSource:](self, "_imageRequesterForIndexPath:inDataSource:", &v50, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __52__PXUIAssetsScene_checkOutTileForIdentifier_layout___block_invoke;
        v56[3] = &unk_1E5124B40;
        v57 = v33;
        v11 = v33;
        objc_msgSend(v23, "performChanges:", v56);

        break;
      case 0x60A019uLL:
        -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "checkOutReusableObjectWithReuseIdentifier:", 333203);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      default:
        if (v8 - 6332439 > 1)
        {
          if (v8 != 6332438)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = *(_OWORD *)&a3->index[5];
            v52 = *(_OWORD *)&a3->index[3];
            v53 = v44;
            v54 = *(_OWORD *)&a3->index[7];
            v55 = a3->index[9];
            v45 = *(_OWORD *)&a3->index[1];
            v50 = *(_OWORD *)&a3->length;
            v51 = v45;
            PXTileIdentifierDescription((unint64_t *)&v50);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIAssetsScene.m"), 343, CFSTR("%@ got asked to produce a tile for an unknown identifier:%@. If you're adding custom tile kinds, those have to be returned by your own tile source and not bubble up to the assets scene."), self, v46);

            abort();
          }
          -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v36 = 333183;
        }
        else
        {
          -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          v36 = 333193;
        }
        objc_msgSend(v34, "checkOutReusableObjectWithReuseIdentifier:", v36);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setDesiredPlayState:", -[PXAssetsScene autoplayTilesWaitForInput](self, "autoplayTilesWaitForInput") ^ 1);
        goto LABEL_21;
    }

LABEL_23:
    v41 = 0;
    goto LABEL_24;
  }
  -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "checkOutReusableObjectWithReuseIdentifier:", 333123);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceStyle");

    if (v19 == 1)
      v20 = CFSTR("PreloadAsset-iCloud");
    else
      v20 = CFSTR("PreloadAsset-iCloud-Dark");
    objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlaceholderImage:", v21);
LABEL_20:

  }
LABEL_21:
  v23 = v14;
  if (!v23)
    goto LABEL_23;
  v49 = *(_OWORD *)&a3->index[1];
  v37 = a3->index[3];
  v38 = a3->index[4];
  objc_msgSend(v7, "dataSource");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  *(_QWORD *)&v51 = v37;
  *((_QWORD *)&v51 + 1) = v38;
  -[PXUIAssetsScene _imageRequesterForIndexPath:inDataSource:](self, "_imageRequesterForIndexPath:inDataSource:", &v50, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setImageRequester:", v40);
  -[PXUIAssetsScene contentTileCornerRadius](self, "contentTileCornerRadius");
  objc_msgSend(v23, "setCornerRadius:");

  v41 = v23;
LABEL_24:
  -[NSMutableSet addObject:](self->_tilesInUse, "addObject:", v23);

  return v23;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v6;

  -[PXAssetsScene viewTileReusePool](self, "viewTileReusePool", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInReusableObject:", a3);

  -[NSMutableSet removeObject:](self->_tilesInUse, "removeObject:", a3);
}

- (void)reusableObjectPool:(id)a3 didCreateReusableObject:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "view", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXUIAssetsScene scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)reusableObjectPool:(id)a3 didEvictReusableObject:(id)a4
{
  id v4;

  objc_msgSend(a4, "view", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)startPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6
{
  id v7;
  _QWORD v8[5];

  if ((void *)PXImagePreheatContext == a6)
  {
    -[PXUIAssetsScene _assetsBySizeWithTileIdentifiers:withGeometries:count:](self, "_assetsBySizeWithTileIdentifiers:withGeometries:count:", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __83__PXUIAssetsScene_startPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke;
    v8[3] = &unk_1E5124B68;
    v8[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

- (void)stopPreheatingTilesForIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5 context:(void *)a6
{
  id v7;
  _QWORD v8[5];

  if ((void *)PXImagePreheatContext == a6)
  {
    -[PXUIAssetsScene _assetsBySizeWithTileIdentifiers:withGeometries:count:](self, "_assetsBySizeWithTileIdentifiers:withGeometries:count:", a3, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__PXUIAssetsScene_stopPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke;
    v8[3] = &unk_1E5124B68;
    v8[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

- (id)_assetsBySizeWithTileIdentifiers:(const PXTileIdentifier *)a3 withGeometries:(const PXTileGeometry *)a4 count:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  unint64_t *v16;
  CGFloat *p_height;
  BOOL v18;
  double v19;
  double v20;
  __int128 v21;
  unint64_t v22;
  void *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsScene dataSourceManager](self, "dataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "identifier");
  v14 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", *MEMORY[0x1E0C9D820], v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v16 = &a3->index[2];
    p_height = &a4->contentSize.height;
    do
    {
      if (*(v16 - 3) == 5 && (*(v16 - 2) == 6432423 ? (v18 = *(v16 - 1) == v12) : (v18 = 0), v18))
      {
        v21 = *(_OWORD *)v16;
        v22 = v16[2];
        v29 = v12;
        v30 = v21;
        v31 = v22;
        objc_msgSend(v11, "assetAtItemIndexPath:", &v29);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(p_height - 1);
        v20 = *p_height;
        if (v19 == v14 && v20 == v13)
        {
          v19 = v14;
          v20 = v13;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", *(p_height - 1), *p_height);
          v25 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v25;
        }
        objc_msgSend(v9, "objectForKeyedSubscript:", v15);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = v26;
          objc_msgSend(v26, "addObject:", v23);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, v15);
        }

      }
      else
      {
        v19 = v14;
        v20 = v13;
      }
      v16 += 11;
      p_height += 24;
      v13 = v20;
      v14 = v19;
      --a5;
    }
    while (a5);
  }

  return v9;
}

- (CGSize)maximumImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumImageSize.width;
  height = self->_maximumImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumImageSize:(CGSize)a3
{
  self->_maximumImageSize = a3;
}

- (double)contentTileCornerRadius
{
  return self->_contentTileCornerRadius;
}

- (void)setContentTileCornerRadius:(double)a3
{
  self->_contentTileCornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequesterByAssetReference, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
}

void __82__PXUIAssetsScene_stopPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(a2, "CGSizeValue");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  PXSizeScale();
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[PXImageRequester defaultOptions](PXImageRequester, "defaultOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopCachingImagesForAssets:targetSize:contentMode:options:", v5, 1, v11, v8, v10);

}

void __83__PXUIAssetsScene_startPreheatingTilesForIdentifiers_withGeometries_count_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v5 = a3;
  objc_msgSend(a2, "CGSizeValue");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  PXSizeScale();
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "mediaProvider");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  +[PXImageRequester defaultOptions](PXImageRequester, "defaultOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startCachingImagesForAssets:targetSize:contentMode:options:", v5, 1, v11, v8, v10);

}

uint64_t __52__PXUIAssetsScene_checkOutTileForIdentifier_layout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageRequester:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__PXUIAssetsScene_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePreheating");
}

void __58__PXUIAssetsScene__transitionImageRequestersToDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "asset");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsset:", v4);

}

void __52__PXUIAssetsScene__imageRequesterForAssetReference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "maximumImageSize");
  objc_msgSend(v3, "setMaximumRequestSize:");

}

PXUIPlayButtonTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_8()
{
  PXUIPlayButtonTile *v0;

  v0 = objc_alloc_init(PXUIPlayButtonTile);
  -[PXUIPlayButtonTile performChanges:](v0, "performChanges:", &__block_literal_global_20_90887);
  return v0;
}

uint64_t __40__PXUIAssetsScene__registerDefaultTiles__block_invoke_9(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPlayButtonStyle:", 0);
}

PXOverlayBadgeUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_7()
{
  return objc_alloc_init(PXOverlayBadgeUIViewTile);
}

PXDimmingUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_6()
{
  PXDimmingUIViewTile *v0;
  void *v1;

  v0 = objc_alloc_init(PXDimmingUIViewTile);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDimmingUIViewTile setBackgroundColor:](v0, "setBackgroundColor:", v1);

  -[PXDimmingUIViewTile setUserInteractionEnabled:](v0, "setUserInteractionEnabled:", 0);
  return v0;
}

PXSelectionBadgeUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_5()
{
  return objc_alloc_init(PXSelectionBadgeUIViewTile);
}

PXAssetLivePhotoUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_4()
{
  return objc_alloc_init(PXAssetLivePhotoUIViewTile);
}

PXAssetLoopUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_3()
{
  return objc_alloc_init(PXAssetLoopUIViewTile);
}

PXAssetAnimatedImageUIViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke_2()
{
  return objc_alloc_init(PXAssetAnimatedImageUIViewTile);
}

PXAssetUIImageViewTile *__40__PXUIAssetsScene__registerDefaultTiles__block_invoke()
{
  PXAssetUIImageViewTile *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_alloc_init(PXAssetUIImageViewTile);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom");

  if (v2 == 2)
  {
    -[PXAssetUIImageViewTile setShouldAllowFocus:](v0, "setShouldAllowFocus:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetUIImageViewTile setPlaceholderColor:](v0, "setPlaceholderColor:", v3);

  }
  else
  {
    -[PXAssetUIImageViewTile setShouldAllowFocus:](v0, "setShouldAllowFocus:", 0);
  }
  return v0;
}

+ (void)preloadResources
{
  +[PXOverlayBadgeUIViewTile preloadResources](PXOverlayBadgeUIViewTile, "preloadResources");
}

@end
