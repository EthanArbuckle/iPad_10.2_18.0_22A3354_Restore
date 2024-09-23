@implementation PXDemoTilingControllerWidget

- (PXDemoTilingControllerWidget)init
{
  PXDemoTilingControllerWidget *v2;
  PXDemoTilingControllerWidget *v3;
  NSString *localizedSubtitle;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXDemoTilingControllerWidget;
  v2 = -[PXDemoTilingControllerWidget init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    localizedSubtitle = v2->_localizedSubtitle;
    v2->_localizedSubtitle = (NSString *)CFSTR("3 Infinite Loop");

  }
  return v3;
}

- (void)_loadTilingController
{
  void *v3;
  PXPhotosDataSourceConfiguration *v4;
  PXPhotosDataSource *v5;
  PXPhotoKitAssetsDataSourceManager *v6;
  PXAssetsDataSourceManager *dataSourceManager;
  PXPhotoKitUIMediaProvider *v8;
  PXPhotoKitUIMediaProvider *mediaProvider;
  PXBasicUIViewTileAnimator *v10;
  PXBasicUIViewTileAnimator *tileAnimator;
  NSMutableSet *v12;
  NSMutableSet *tilesInUse;
  void *v14;
  void *v15;
  PXTilingController *v16;
  PXTilingController *tilingController;
  PXUIAssetsScene *v18;
  PXUIAssetsScene *scene;
  id v20;

  if (!self->__tilingController)
  {
    -[PXDemoTilingControllerWidget context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetCollections");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v4 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v20, 0);
    v5 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v4);
    v6 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v5);
    dataSourceManager = self->__dataSourceManager;
    self->__dataSourceManager = &v6->super;

    v8 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = self->__mediaProvider;
    self->__mediaProvider = v8;

    v10 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    tilesInUse = self->__tilesInUse;
    self->__tilesInUse = v12;

    -[PXAssetsDataSourceManager dataSource](self->__dataSourceManager, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDemoTilingControllerWidget _demoTilingLayoutForDataSource:](self, "_demoTilingLayoutForDataSource:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PXTilingController initWithLayout:]([PXTilingController alloc], "initWithLayout:", v15);
    tilingController = self->__tilingController;
    self->__tilingController = v16;

    -[PXTilingController setTileAnimator:](self->__tilingController, "setTileAnimator:", self->__tileAnimator);
    v18 = -[PXAssetsScene initWithTilingController:mediaProvider:dataSourceManager:delegate:]([PXUIAssetsScene alloc], "initWithTilingController:mediaProvider:dataSourceManager:delegate:", self->__tilingController, self->__mediaProvider, self->__dataSourceManager, self);
    scene = self->__scene;
    self->__scene = v18;

    -[PXTilingController setTileSource:](self->__tilingController, "setTileSource:", self);
    -[PXTilingController setTransitionDelegate:](self->__tilingController, "setTransitionDelegate:", self);
    -[PXTilingController setScrollDelegate:](self->__tilingController, "setScrollDelegate:", self->__scene);

  }
}

- (id)_demoTilingLayoutForDataSource:(id)a3
{
  id v3;
  PXDemoTilingControllerWidgetLayout *v4;

  v3 = a3;
  v4 = -[PXAssetsTilingLayout initWithDataSource:]([PXDemoTilingControllerWidgetLayout alloc], "initWithDataSource:", v3);

  return v4;
}

- (void)_setLocalizedSubtitle:(id)a3
{
  NSString *v5;
  void *v6;
  char v7;
  NSString *v8;

  v8 = (NSString *)a3;
  v5 = self->_localizedSubtitle;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_4;
  v7 = -[NSString isEqual:](v8, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_localizedSubtitle, a3);
    -[PXDemoTilingControllerWidget widgetDelegate](self, "widgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetLocalizedSubtitleDidChange:", self);
LABEL_4:

  }
}

- (BOOL)hasContentForCurrentInput
{
  void *v2;
  char v3;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showDemoTilingViewWidget");

  return v3;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return a3 * 0.75;
}

- (PXTilingController)contentTilingController
{
  -[PXDemoTilingControllerWidget _loadTilingController](self, "_loadTilingController");
  return -[PXDemoTilingControllerWidget _tilingController](self, "_tilingController");
}

- (NSString)localizedTitle
{
  return (NSString *)CFSTR("Demo Tiling Controller");
}

- (NSString)localizedCaption
{
  return (NSString *)CFSTR("13 photos nearby");
}

- (void)userDidSelectSubtitle
{
  void *v3;
  id v4;

  -[PXDemoTilingControllerWidget localizedSubtitle](self, "localizedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("i"), CFSTR("_#_"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("o"), CFSTR("i"), 0, 0, objc_msgSend(v4, "length"));
  objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("_#_"), CFSTR("o"), 0, 0, objc_msgSend(v4, "length"));
  -[PXDemoTilingControllerWidget _setLocalizedSubtitle:](self, "_setLocalizedSubtitle:", v4);

}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  return -[PXDemoTilingControllerWidget _demoTilingLayoutForDataSource:](self, "_demoTilingLayoutForDataSource:", a4);
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7;
  PXDemoTilingControllerWidgetTile *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  PXDemoTilingControllerWidgetTile *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _QWORD v29[11];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unint64_t v35;

  v7 = a4;
  if (*(_OWORD *)&a3->length == __PAIR128__(6432423, 5))
  {
    -[PXDemoTilingControllerWidget _scene](self, "_scene");
    v8 = (PXDemoTilingControllerWidgetTile *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&a3->index[3];
    v10 = *(_OWORD *)&a3->index[7];
    v33 = *(_OWORD *)&a3->index[5];
    v34 = v10;
    v35 = a3->index[9];
    v11 = *(_OWORD *)&a3->index[1];
    v30 = *(_OWORD *)&a3->length;
    v31 = v11;
    v32 = v9;
    v12 = (PXDemoTilingControllerWidgetTile *)-[PXDemoTilingControllerWidgetTile checkOutTileForIdentifier:layout:](v8, "checkOutTileForIdentifier:layout:", &v30, v7);
  }
  else
  {
    +[PXDemoTilingControllerWidgetLayout backgroundTileIdentifier](PXDemoTilingControllerWidgetLayout, "backgroundTileIdentifier");
    v13 = *(_OWORD *)&a3->index[3];
    v14 = *(_OWORD *)&a3->index[7];
    v33 = *(_OWORD *)&a3->index[5];
    v34 = v14;
    v35 = a3->index[9];
    v15 = *(_OWORD *)&a3->index[1];
    v30 = *(_OWORD *)&a3->length;
    v31 = v15;
    v32 = v13;
    v16 = (_QWORD)v30 == v29[0];
    if ((_QWORD)v30 && (_QWORD)v30 == v29[0])
    {
      v17 = 1;
      do
      {
        v18 = *((_QWORD *)&v30 + v17);
        v19 = v29[v17];
        v16 = v18 == v19;
        if (v17 >= (unint64_t)v30)
          break;
        ++v17;
      }
      while (v18 == v19);
    }
    if (v16)
    {
      v8 = objc_alloc_init(PXDemoTilingControllerWidgetTile);
      -[PXDemoTilingControllerWidget _tilingController](self, "_tilingController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scrollController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXDemoTilingControllerWidgetTile view](v8, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

      -[PXDemoTilingControllerWidget _tilesInUse](self, "_tilesInUse");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v8);

      v12 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (PXDemoTilingControllerWidgetTile *)objc_claimAutoreleasedReturnValue();
      v24 = *(_OWORD *)&a3->index[3];
      v25 = *(_OWORD *)&a3->index[7];
      v33 = *(_OWORD *)&a3->index[5];
      v34 = v25;
      v35 = a3->index[9];
      v26 = *(_OWORD *)&a3->index[1];
      v30 = *(_OWORD *)&a3->length;
      v31 = v26;
      v32 = v24;
      PXTileIdentifierDescription((unint64_t *)&v30);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDemoTilingControllerWidgetTile handleFailureInMethod:object:file:lineNumber:description:](v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDemoTilingControllerWidget.m"), 149, CFSTR("unknown identifier %@"), v27);

      v12 = 0;
    }
  }

  return v12;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _QWORD v25[11];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;

  if (*(_OWORD *)&a4->length == __PAIR128__(6432423, 5))
  {
    -[PXDemoTilingControllerWidget _scene](self, "_scene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_OWORD *)&a4->index[3];
    v10 = *(_OWORD *)&a4->index[7];
    v29 = *(_OWORD *)&a4->index[5];
    v30 = v10;
    v31 = a4->index[9];
    v11 = *(_OWORD *)&a4->index[1];
    v26 = *(_OWORD *)&a4->length;
    v27 = v11;
    v28 = v9;
    objc_msgSend(v8, "checkInTile:withIdentifier:", a3, &v26);
  }
  else
  {
    +[PXDemoTilingControllerWidgetLayout backgroundTileIdentifier](PXDemoTilingControllerWidgetLayout, "backgroundTileIdentifier");
    v12 = *(_OWORD *)&a4->index[3];
    v13 = *(_OWORD *)&a4->index[7];
    v29 = *(_OWORD *)&a4->index[5];
    v30 = v13;
    v31 = a4->index[9];
    v14 = *(_OWORD *)&a4->index[1];
    v26 = *(_OWORD *)&a4->length;
    v27 = v14;
    v28 = v12;
    v15 = (_QWORD)v26 == v25[0];
    if ((_QWORD)v26 && (_QWORD)v26 == v25[0])
    {
      v16 = 1;
      do
      {
        v17 = *((_QWORD *)&v26 + v16);
        v18 = v25[v16];
        v15 = v17 == v18;
        if (v16 >= (unint64_t)v26)
          break;
        ++v16;
      }
      while (v17 == v18);
    }
    if (v15)
    {
      v19 = a3;
      -[PXDemoTilingControllerWidget _tilesInUse](self, "_tilesInUse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObject:", v19);

      objc_msgSend(v19, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "removeFromSuperview");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_OWORD *)&a4->index[3];
      v22 = *(_OWORD *)&a4->index[7];
      v29 = *(_OWORD *)&a4->index[5];
      v30 = v22;
      v31 = a4->index[9];
      v23 = *(_OWORD *)&a4->index[1];
      v26 = *(_OWORD *)&a4->length;
      v27 = v23;
      v28 = v21;
      PXTileIdentifierDescription((unint64_t *)&v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDemoTilingControllerWidget.m"), 164, CFSTR("unknown identifier %@"), v24);

    }
  }

}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXTileIdentifierIdentityConverter *v10;
  PXComposedTileIdentifierConverter *v11;
  void *v12;
  PXComposedTileIdentifierConverter *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PXDemoTilingControllerWidget _scene](self, "_scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tilingController:tileIdentifierConverterForChange:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(PXTileIdentifierIdentityConverter);
  v11 = [PXComposedTileIdentifierConverter alloc];
  v15[0] = v9;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXComposedTileIdentifierConverter initWithTileIdentifierConverters:](v11, "initWithTileIdentifierConverters:", v12);

  return v13;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PXAssetsDataSourceManager)_dataSourceManager
{
  return self->__dataSourceManager;
}

- (PXPhotoKitUIMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (NSMutableSet)_tilesInUse
{
  return self->__tilesInUse;
}

- (PXUIAssetsScene)_scene
{
  return self->__scene;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->__scene, 0);
  objc_storeStrong((id *)&self->__tilesInUse, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__dataSourceManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

@end
