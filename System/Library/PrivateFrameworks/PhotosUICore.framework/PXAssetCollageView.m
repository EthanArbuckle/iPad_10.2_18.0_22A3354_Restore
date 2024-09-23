@implementation PXAssetCollageView

- (PXAssetCollageView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollageView.m"), 50, CFSTR("%s is not available as initializer"), "-[PXAssetCollageView initWithFrame:]");

  abort();
}

- (PXAssetCollageView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetCollageView.m"), 54, CFSTR("%s is not available as initializer"), "-[PXAssetCollageView initWithCoder:]");

  abort();
}

- (PXAssetCollageView)initWithFrame:(CGRect)a3 mediaProvider:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PXAssetCollageView *v11;
  PXAssetCollageView *v12;
  void *v13;
  uint64_t v14;
  UIColor *cornerBackgroundColor;
  NSMutableDictionary *v16;
  NSMutableDictionary *assets;
  NSMutableDictionary *v18;
  NSMutableDictionary *assetViews;
  NSMutableIndexSet *v20;
  NSMutableIndexSet *hiddenItemIndexes;
  PXLayoutPerformerOutput *v22;
  PXLayoutPerformerOutput *layoutOutput;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXAssetCollageView;
  v11 = -[PXAssetCollageView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[PXAssetCollageView setClipsToBounds:](v11, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollageView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v14 = objc_claimAutoreleasedReturnValue();
    cornerBackgroundColor = v12->_cornerBackgroundColor;
    v12->_cornerBackgroundColor = (UIColor *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assets = v12->_assets;
    v12->_assets = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    assetViews = v12->_assetViews;
    v12->_assetViews = v18;

    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_allowLoopPlayback = 0;
    v12->_allowVideoPlayback = 0;
    v12->_allowAnimatedImagePlayback = 0;
    v20 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    hiddenItemIndexes = v12->_hiddenItemIndexes;
    v12->_hiddenItemIndexes = v20;

    v22 = -[PXLayoutPerformerOutput initWithCapacity:]([PXLayoutPerformerOutput alloc], "initWithCapacity:", 3);
    layoutOutput = v12->_layoutOutput;
    v12->_layoutOutput = v22;

  }
  return v12;
}

- (BOOL)portraitBias
{
  double v3;
  double v4;
  double v5;
  BOOL v6;
  int64_t v7;
  void *v8;
  char v9;

  -[PXAssetCollageView bounds](self, "bounds");
  PXSizeGetAspectRatioWithDefault();
  UIRoundToViewScale();
  v4 = v3;
  -[PXAssetCollageView _firstAssetAspectRatio](self, "_firstAssetAspectRatio");
  v6 = v5 < 1.0 || v4 >= 1.5;
  v7 = -[PXAssetCollageView numberOfItems](self, "numberOfItems");
  if (v6 || v7 != 2)
    return v6;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "forcePortraitBias");

  return v9;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  _QWORD v24[6];
  BOOL v25;
  _OWORD v26[2];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PXAssetCollageView;
  -[PXAssetCollageView layoutSubviews](&v27, sel_layoutSubviews);
  -[PXAssetCollageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAssetCollageView spacing](self, "spacing");
  v12 = v11;
  v13 = -[PXAssetCollageView portraitBias](self, "portraitBias");
  v14 = -[PXAssetCollageView numberOfItems](self, "numberOfItems");
  if (v14 >= 3)
    v15 = 3;
  else
    v15 = v14;
  PXLayoutPerformerAttributesFromUIView(self, (uint64_t)v26);
  -[PXAssetCollageView layoutOutput](self, "layoutOutput");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __36__PXAssetCollageView_layoutSubviews__block_invoke;
  v24[3] = &__block_descriptor_49_e34_v16__0__PXCollageLayoutPerformer_8l;
  v24[4] = v12;
  v25 = v13;
  v24[5] = v15;
  *(double *)v21 = v4;
  *(double *)&v21[1] = v6;
  *(double *)&v21[2] = v8;
  *(double *)&v21[3] = v10;
  v21[4] = 0;
  v22 = v26[0];
  v23 = v26[1];
  +[PXCollageLayoutPerformer performLayoutWithLayoutInput:layoutOutput:usingBlock:](PXCollageLayoutPerformer, "performLayoutWithLayoutInput:layoutOutput:usingBlock:", v21, v16, v24);
  -[PXAssetCollageView assetViews](self, "assetViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXApplyLayoutOutputToParticipants(v16, v18);

  if (v15 < 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollageView setBackgroundColor:](self, "setBackgroundColor:", v19);

  }
  else
  {
    -[PXAssetCollageView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
  -[PXAssetCollageView roundedCornerOverlayView](self, "roundedCornerOverlayView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v4, v6, v8, v10);

  -[PXAssetCollageView _updateRoundedCornerOverlayView](self, "_updateRoundedCornerOverlayView");
  -[PXAssetCollageView _updateAssetViewsAnimatedContentEnabled](self, "_updateAssetViewsAnimatedContentEnabled");
  -[PXAssetCollageView _updateHiddenViews](self, "_updateHiddenViews");

}

- (int64_t)numberOfItems
{
  void *v2;
  int64_t v3;

  -[PXAssetCollageView assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setCornerRadius:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  if (a3 != self->_cornerRadius)
  {
    self->_cornerRadius = a3;
    -[PXAssetCollageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCornerBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_cornerBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cornerBackgroundColor, a3);
    -[PXAssetCollageView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setAsset:(id)a3 forItemAtIndex:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  int v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 >= 3)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134217984;
      v25 = a4;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXAssetCollageView - Can't set asset for index %ld", (uint8_t *)&v24, 0xCu);
    }

    goto LABEL_17;
  }
  -[PXAssetCollageView assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollageView assetViews](self, "assetViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  v13 = v12;
  v14 = v6;
  if (v12 != v6)
  {
    v15 = objc_msgSend(v12, "isEqual:", v6);

    if ((v15 & 1) != 0)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v14);
  }

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "asset");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v6;
  if (v18 != v6)
  {
    v20 = v18;
    v21 = objc_msgSend(v18, "isEqual:", v6);

    if (!v17 || (v21 & 1) != 0)
      goto LABEL_14;
    -[PXAssetCollageView _removeAssetView:](self, "_removeAssetView:", v17);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v19);
  }

LABEL_14:
  if (v6)
  {
    -[PXAssetCollageView _checkoutAndConfigureAssetViewForAsset:withIndex:](self, "_checkoutAndConfigureAssetViewForAsset:withIndex:", v6, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v23);

    -[PXAssetCollageView addSubview:](self, "addSubview:", v22);
  }
  -[PXAssetCollageView setNeedsLayout](self, "setNeedsLayout");

LABEL_17:
}

- (void)setHidden:(BOOL)a3 forItemAtIndex:(int64_t)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;

  v5 = a3;
  -[PXAssetCollageView hiddenItemIndexes](self, "hiddenItemIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "addIndex:", a4);
  else
    objc_msgSend(v7, "removeIndex:", a4);

  -[PXAssetCollageView _updateHiddenViews](self, "_updateHiddenViews");
}

- (id)displayAssetViewWithAsset:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "asset", (_QWORD)v16);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {

LABEL_13:
          v14 = v10;
          goto LABEL_14;
        }
        v12 = v11;
        v13 = objc_msgSend(v11, "isEqual:", v4);

        if (v13)
          goto LABEL_13;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
  }
LABEL_14:

  return v14;
}

- (id)displayAssetViewAtPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v16 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "frame", (_QWORD)v11);
        v17.x = x;
        v17.y = y;
        if (CGRectContainsPoint(v18, v17))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)resetViewState
{
  void *v3;
  void *v4;
  id v5;

  -[PXAssetCollageView _removeAllAssetViews](self, "_removeAllAssetViews");
  -[PXAssetCollageView assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PXAssetCollageView assetViews](self, "assetViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[PXAssetCollageView hiddenItemIndexes](self, "hiddenItemIndexes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllIndexes");

}

- (void)_updateHiddenViews
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PXAssetCollageView hiddenItemIndexes](self, "hiddenItemIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PXAssetCollageView__updateHiddenViews__block_invoke;
  v6[3] = &unk_1E5141A48;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

- (id)_checkoutAndConfigureAssetViewForAsset:(id)a3 withIndex:(int64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "playbackStyle");
  if (v7 == 3)
    v8 = 1;
  else
    v8 = v7;
  +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCanDisplayLoadingIndicator:", 1);
  objc_msgSend(v9, "setTag:", a4);
  -[PXAssetCollageView mediaProvider](self, "mediaProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMediaProvider:", v10);

  objc_msgSend(v9, "setContentMode:", 2);
  objc_msgSend(v9, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  return v9;
}

- (void)setAllowVideoPlayback:(BOOL)a3
{
  if (self->_allowVideoPlayback != a3)
  {
    self->_allowVideoPlayback = a3;
    -[PXAssetCollageView _updateAssetViewsAnimatedContentEnabled](self, "_updateAssetViewsAnimatedContentEnabled");
  }
}

- (void)setAllowLoopPlayback:(BOOL)a3
{
  if (self->_allowLoopPlayback != a3)
  {
    self->_allowLoopPlayback = a3;
    -[PXAssetCollageView _updateAssetViewsAnimatedContentEnabled](self, "_updateAssetViewsAnimatedContentEnabled");
  }
}

- (void)setAllowAnimatedImagePlayback:(BOOL)a3
{
  if (self->_allowAnimatedImagePlayback != a3)
  {
    self->_allowAnimatedImagePlayback = a3;
    -[PXAssetCollageView _updateAssetViewsAnimatedContentEnabled](self, "_updateAssetViewsAnimatedContentEnabled");
  }
}

- (void)_updateAssetViewsAnimatedContentEnabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "playbackStyle");
        switch(v9)
        {
          case 2:
            v10 = -[PXAssetCollageView allowAnimatedImagePlayback](self, "allowAnimatedImagePlayback");
            break;
          case 5:
            v10 = -[PXAssetCollageView allowLoopPlayback](self, "allowLoopPlayback");
            break;
          case 4:
            v10 = -[PXAssetCollageView allowVideoPlayback](self, "allowVideoPlayback");
            break;
          default:
            continue;
        }
        objc_msgSend(v8, "setAnimatedContentEnabled:", v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (id)_displayAssetViews
{
  void *v2;
  void *v3;

  -[PXAssetCollageView assetViews](self, "assetViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_displayAssetViewWithIndex:(int64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "tag", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (double)_firstAssetAspectRatio
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[PXAssetCollageView assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      break;
    if (++v3 == 3)
    {
      v6 = 1.0;
      goto LABEL_6;
    }
  }
  objc_msgSend(v5, "aspectRatio");
  v6 = v7;

LABEL_6:
  return v6;
}

- (void)_removeAssetView:(id)a3
{
  id v3;

  if (a3)
  {
    v3 = a3;
    +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", v3);
    objc_msgSend(v3, "removeFromSuperview");

  }
}

- (void)_removeAllAssetViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollageView _displayAssetViews](self, "_displayAssetViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[PXAssetCollageView _removeAssetView:](self, "_removeAssetView:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateRoundedCornerOverlayView
{
  double v3;
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  double v5;
  PXRoundedCornerOverlayView *v6;
  PXRoundedCornerOverlayView *v7;
  PXRoundedCornerOverlayView *v8;
  PXRoundedCornerOverlayView *v9;
  _QWORD v10[6];

  -[PXAssetCollageView cornerRadius](self, "cornerRadius");
  roundedCornerOverlayView = self->_roundedCornerOverlayView;
  if (v3 <= 0.0)
  {
    if (roundedCornerOverlayView)
    {
      -[PXRoundedCornerOverlayView removeFromSuperview](roundedCornerOverlayView, "removeFromSuperview");
      v9 = self->_roundedCornerOverlayView;
      self->_roundedCornerOverlayView = 0;

    }
  }
  else
  {
    v5 = v3;
    if (!roundedCornerOverlayView)
    {
      v6 = [PXRoundedCornerOverlayView alloc];
      -[PXAssetCollageView bounds](self, "bounds");
      v7 = -[PXRoundedCornerOverlayView initWithFrame:](v6, "initWithFrame:");
      v8 = self->_roundedCornerOverlayView;
      self->_roundedCornerOverlayView = v7;

      -[PXAssetCollageView addSubview:](self, "addSubview:", self->_roundedCornerOverlayView);
      roundedCornerOverlayView = self->_roundedCornerOverlayView;
    }
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__PXAssetCollageView__updateRoundedCornerOverlayView__block_invoke;
    v10[3] = &unk_1E5141A70;
    *(double *)&v10[5] = v5;
    v10[4] = self;
    -[PXRoundedCornerOverlayView performChanges:](roundedCornerOverlayView, "performChanges:", v10);
    -[PXAssetCollageView bringSubviewToFront:](self, "bringSubviewToFront:", self->_roundedCornerOverlayView);
  }
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIColor)cornerBackgroundColor
{
  return self->_cornerBackgroundColor;
}

- (BOOL)allowVideoPlayback
{
  return self->_allowVideoPlayback;
}

- (BOOL)allowLoopPlayback
{
  return self->_allowLoopPlayback;
}

- (BOOL)allowAnimatedImagePlayback
{
  return self->_allowAnimatedImagePlayback;
}

- (NSMutableDictionary)assets
{
  return self->_assets;
}

- (NSMutableDictionary)assetViews
{
  return self->_assetViews;
}

- (PXRoundedCornerOverlayView)roundedCornerOverlayView
{
  return self->_roundedCornerOverlayView;
}

- (NSMutableIndexSet)hiddenItemIndexes
{
  return self->_hiddenItemIndexes;
}

- (PXLayoutPerformerOutput)layoutOutput
{
  return self->_layoutOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutOutput, 0);
  objc_storeStrong((id *)&self->_hiddenItemIndexes, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_assetViews, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_cornerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

void __53__PXAssetCollageView__updateRoundedCornerOverlayView__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(double *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setCornerRadius:", v3);
  objc_msgSend(*(id *)(a1 + 32), "cornerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverlayColor:", v5);

  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  objc_msgSend(v4, "setDisplayScale:");

}

void __40__PXAssetCollageView__updateHiddenViews__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "containsIndex:", objc_msgSend(v3, "tag")));

}

void __36__PXAssetCollageView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInterItemSpacing:", v3);
  objc_msgSend(v4, "setOuterLayoutRatio:", 0.66);
  objc_msgSend(v4, "setPortraitBias:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v4, "setNumberOfVisibleItems:", *(_QWORD *)(a1 + 40));

}

+ (int64_t)maximumNumberOfItems
{
  return 3;
}

@end
