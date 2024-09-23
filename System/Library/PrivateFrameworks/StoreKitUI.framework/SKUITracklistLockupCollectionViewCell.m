@implementation SKUITracklistLockupCollectionViewCell

- (SKUITracklistLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUITracklistLockupCollectionViewCell *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *columnViewsByIndex;
  UIView *v19;
  UIView *separatorView;
  UIView *v21;
  void *v22;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUITracklistLockupCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUITracklistLockupCollectionViewCell;
  v16 = -[SKUIViewReuseCollectionViewCell initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    columnViewsByIndex = v16->_columnViewsByIndex;
    v16->_columnViewsByIndex = v17;

    v19 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v16->_separatorView;
    v16->_separatorView = v19;

    v21 = v16->_separatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[SKUITracklistLockupCollectionViewCell contentView](v16, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v16->_separatorView);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278], 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUITracklistLockupCollectionViewCell;
  -[SKUIViewReuseCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (void)hidePreviewProgressAnimated:(BOOL)a3
{
  int64_t previewState;
  SKUIPreviewProgressIndicator *v6;
  SUPlayerStatus *lastPlayerStatus;
  SKUIPreviewProgressIndicator *previewProgressIndicator;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  previewState = self->_previewState;
  if (previewState)
  {
    self->_previewState = 3;
    v6 = self->_previewProgressIndicator;
    lastPlayerStatus = self->_lastPlayerStatus;
    self->_lastPlayerStatus = 0;

    previewProgressIndicator = self->_previewProgressIndicator;
    self->_previewProgressIndicator = 0;

    if (previewState == 2)
    {
      -[SKUITracklistLockupCollectionViewCell _previewColumnView](self, "_previewColumnView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3)
      {
        -[SKUITracklistLockupCollectionViewCell _addFlipContainerViewWithFrontView:backView:](self, "_addFlipContainerViewWithFrontView:backView:", v6, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHidden:", 0);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __69__SKUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke;
        v14[3] = &unk_1E739FE78;
        v12 = v10;
        v15 = v12;
        objc_copyWeak(&v16, &location);
        objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v14);

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);

      }
      else
      {
        self->_previewState = 0;
        -[SKUIPreviewProgressIndicator removeFromSuperview](v6, "removeFromSuperview");
        -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v9);

        -[SKUITracklistLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
      }

    }
  }
}

void __69__SKUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__SKUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke_2;
  v3[3] = &unk_1E73A3138;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "flipToBackViewWithDuration:options:completionBlock:", 0x100000, v3, 0.5);

  objc_destroyWeak(&v5);
}

void __69__SKUITracklistLockupCollectionViewCell_hidePreviewProgressAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resolvePreviewStateAfterTransitionForFlipView:", *(_QWORD *)(a1 + 32));

}

- (void)showPreviewProgressWithStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  int64_t previewState;
  void *v9;
  SKUIPreviewProgressIndicator *v10;
  SKUIPreviewProgressIndicator *previewProgressIndicator;
  SKUIPreviewProgressIndicator *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[5];
  BOOL v27;

  v4 = a4;
  v7 = a3;
  objc_storeStrong((id *)&self->_lastPlayerStatus, a3);
  previewState = self->_previewState;
  if (previewState)
  {
    if (previewState == 2)
      -[SKUIPreviewProgressIndicator reloadWithPlayerStatus:animated:](self->_previewProgressIndicator, "reloadWithPlayerStatus:animated:", v7, v4);
  }
  else
  {
    -[SKUITracklistLockupCollectionViewCell _previewColumnView](self, "_previewColumnView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = -[SKUIPreviewProgressIndicator initWithFrame:]([SKUIPreviewProgressIndicator alloc], "initWithFrame:", 0.0, 0.0, 29.0, 29.0);
      previewProgressIndicator = self->_previewProgressIndicator;
      self->_previewProgressIndicator = v10;

      v12 = self->_previewProgressIndicator;
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIPreviewProgressIndicator setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[SKUIPreviewProgressIndicator setEnabled:](self->_previewProgressIndicator, "setEnabled:", 0);
      -[SKUITracklistLockupCollectionViewCell _previewControlViewElement](self, "_previewControlViewElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "style");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIViewElementPlainColorWithStyle(v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SKUIPreviewProgressIndicator setTintColor:](self->_previewProgressIndicator, "setTintColor:", v16);
      if (v4)
      {
        -[SKUITracklistLockupCollectionViewCell _addFlipContainerViewWithFrontView:backView:](self, "_addFlipContainerViewWithFrontView:backView:", v9, self->_previewProgressIndicator);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self->_previewState = 1;
        -[SKUIPreviewProgressIndicator reloadWithPlayerStatus:animated:](self->_previewProgressIndicator, "reloadWithPlayerStatus:animated:", v7, 1);
        objc_initWeak(&location, self);
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_2;
        v22[3] = &unk_1E739FE78;
        v19 = v17;
        v23 = v19;
        objc_copyWeak(&v24, &location);
        objc_msgSend(v18, "_performBlockAfterCATransactionCommits:", v22);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);

      }
      else
      {
        self->_previewState = 2;
        -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", self->_previewProgressIndicator);

        -[SKUITracklistLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke;
        v26[3] = &unk_1E73A40F8;
        v26[4] = self;
        v27 = v4;
        objc_msgSend(v21, "_performBlockAfterCATransactionCommits:", v26);

      }
    }

  }
}

uint64_t __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "reloadWithPlayerStatus:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856), *(unsigned __int8 *)(a1 + 40));
}

void __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_3;
  v3[3] = &unk_1E73A3138;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "flipToBackViewWithDuration:options:completionBlock:", 0x200000, v3, 0.5);

  objc_destroyWeak(&v5);
}

void __80__SKUITracklistLockupCollectionViewCell_showPreviewProgressWithStatus_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resolvePreviewStateAfterTransitionForFlipView:", *(_QWORD *)(a1 + 32));

}

- (void)togglePreviewPlaybackAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SKUITracklistLockupCollectionViewCell _previewMediaURL](self, "_previewMediaURL", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC1E8], "sessionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSessionForURL:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278], v7);
      objc_msgSend(v7, "stop");
      -[SKUITracklistLockupCollectionViewCell hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 1);
    }
    else
    {
      v8 = (id)objc_msgSend(v6, "stopAllAudioPlayerSessions");
      objc_msgSend(v6, "startSessionWithURL:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, *MEMORY[0x1E0DDC278], v9);
      -[SKUITracklistLockupCollectionViewCell _previewControlViewElement](self, "_previewControlViewElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setStoreItemIdentifier:", objc_msgSend(v10, "itemIdentifier"));
      objc_msgSend(v9, "playerStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUITracklistLockupCollectionViewCell showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v11, 1);

      objc_msgSend(v9, "play");
    }

    v4 = v12;
  }

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITracklistLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__SKUITracklistLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke;
  v20[3] = &unk_1E73A1208;
  v17 = v8;
  v22 = &v24;
  v23 = a4;
  v21 = v17;
  objc_msgSend(v7, "enumerateChildrenUsingBlock:", v20);
  v18 = *((_BYTE *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return v18;
}

void __88__SKUITracklistLockupCollectionViewCell_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  uint64_t v4;
  char v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 8)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "loadImageForBadgeElement:reason:", v6, *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v4 + 24))
      v5 = 1;
    else
      v5 = v3;
    *(_BYTE *)(v4 + 24) = v5;
  }

}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUITracklistLockupCollectionViewCell preferredSizeForViewElement:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  double v27;
  id v28;

  v8 = a3;
  v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        +[SKUITracklistLockupCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  objc_msgSend(v9, "aggregateValueForKey:", 0x1E73B05F0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelLayoutCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __83__SKUITracklistLockupCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke;
  v23[3] = &unk_1E73A6450;
  v27 = a4;
  v24 = v19;
  v25 = v8;
  v26 = v9;
  v28 = a1;
  v20 = v9;
  v21 = v8;
  v22 = v19;
  objc_msgSend(v18, "enumerateColumnsForTrack:usingBlock:", v21, v23);

}

void __83__SKUITracklistLockupCollectionViewCell_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "width");
  v7 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "elementType", (_QWORD)v17);
        if (v14 <= 79)
        {
          if (v14 != 8)
          {
            if (v14 != 12)
              goto LABEL_17;
LABEL_13:
            SKUITracklistAttributedStringForButton(v14, v13, *(void **)(a1 + 48));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "requestLayoutForButton:attributedString:width:", v13, v15, (uint64_t)v7);
LABEL_16:

            goto LABEL_17;
          }
          objc_msgSend(*(id *)(a1 + 32), "requestLayoutForBadge:width:", v13, (uint64_t)*(double *)(a1 + 56));
        }
        else
        {
          switch(v14)
          {
            case 80:
              objc_msgSend(*(id *)(a1 + 64), "_attributedStringForOrdinal:context:", v13, *(_QWORD *)(a1 + 48));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "requestLayoutForOrdinal:attributedString:width:", v13, v15, (uint64_t)v7);
              goto LABEL_16;
            case 138:
              SKUITracklistAttributedStringForLabel(*(void **)(a1 + 40), v13, *(void **)(a1 + 48));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "requestLayoutForLabel:attributedString:width:", v13, v15, (uint64_t)v7);
              goto LABEL_16;
            case 141:
              goto LABEL_13;
          }
        }
LABEL_17:
        ++v12;
      }
      while (v10 != v12);
      v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 = v16;
    }
    while (v16);
  }

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  double v32;
  uint64_t v33;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v9)
        +[SKUITracklistLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x3010000000;
  v31 = &unk_1BBF15257;
  v33 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  v32 = a3;
  objc_msgSend(v8, "aggregateValueForKey:", 0x1E73B05F0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "labelLayoutCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__SKUITracklistLockupCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke;
  v25[3] = &unk_1E73A6478;
  v19 = v18;
  v26 = v19;
  v27 = &v28;
  objc_msgSend(v17, "enumerateColumnsForTrack:usingBlock:", v7, v25);
  v21 = v29[4];
  v20 = v29[5];
  if (v20 <= 32.0)
    v22 = 44.0;
  else
    v22 = v20 + 20.0;
  v29[5] = v22;

  _Block_object_dispose(&v28, 8);
  v23 = v21;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

void __79__SKUITracklistLockupCollectionViewCell_sizeThatFitsWidth_viewElement_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _BYTE *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  if (objc_msgSend(v8, "columnIdentifier") == 4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v15, "elementType", (_QWORD)v18) == 138)
          {
            v16 = *(void **)(a1 + 32);
            objc_msgSend(v8, "width");
            objc_msgSend(v16, "estimatedSizeForLabel:width:", v15);
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v17
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    *a5 = 1;
  }

}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  SKUITracklistColumnData *v10;
  SKUITracklistColumnData *columnData;
  SKUIGradientView *offerConfirmationGradientView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIView *separatorView;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;

  v8 = a3;
  v9 = a5;
  -[NSMapTable removeAllObjects](self->_buyButtonDescriptorToButton, "removeAllObjects");
  objc_msgSend(v9, "aggregateValueForKey:", 0x1E73B05F0);
  v10 = (SKUITracklistColumnData *)objc_claimAutoreleasedReturnValue();
  columnData = self->_columnData;
  self->_columnData = v10;

  objc_storeStrong((id *)&self->_track, a3);
  -[NSMutableDictionary removeAllObjects](self->_columnViewsByIndex, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_imageViewToImageResourceCacheKey, "removeAllObjects");
  -[SKUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  self->_offerConfirmationGradientView = 0;

  objc_msgSend(v8, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ikBorderColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "color");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "dividerType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("none"));

  if (!(_DWORD)v17)
  {
    separatorView = self->_separatorView;
    if (v15)
    {
      -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v19);

    }
  }
  -[UIView setHidden:](self->_separatorView, "setHidden:", v17);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __77__SKUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke;
  v28[3] = &unk_1E73A00B8;
  v28[4] = self;
  v20 = v8;
  v29 = v20;
  v21 = v9;
  v30 = v21;
  -[SKUIViewReuseCollectionViewCell modifyUsingBlock:](self, "modifyUsingBlock:", v28);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0DDC278];
  objc_msgSend(v22, "removeObserver:name:object:", self, *MEMORY[0x1E0DDC278], 0);
  -[SKUITracklistLockupCollectionViewCell _previewMediaURL](self, "_previewMediaURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24
    && (objc_msgSend(MEMORY[0x1E0DDC1E8], "sessionManager"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v25, "audioPlayerForURL:", v24),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v26))
  {
    objc_msgSend(v22, "addObserver:selector:name:object:", self, sel__audioPlayerStatusChangeNotification_, v23, v26);
    objc_msgSend(v26, "playerStatus");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITracklistLockupCollectionViewCell showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v27, 0);

  }
  else
  {
    -[SKUITracklistLockupCollectionViewCell hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 0);
  }

}

void __77__SKUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 832);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__SKUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_1E73A64A0;
  v10 = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateColumnsForTrack:usingBlock:", v4, v9);

}

void __77__SKUITracklistLockupCollectionViewCell_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = v6;
  objc_msgSend(v6, "width");
  v10 = v9;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v40;
    v15 = (double)(uint64_t)v10;
    v38 = v11;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v11);
        v17 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v17, "elementType") == 90)
        {
          objc_msgSend(v17, "flattenedChildren");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "firstObject");
          v19 = objc_claimAutoreleasedReturnValue();

          v17 = (id)v19;
        }
        v20 = objc_msgSend(v17, "elementType");
        if (v20 > 49)
        {
          if (v20 > 137)
          {
            if (v20 == 138)
            {
              objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
              v22 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            }
            if (v20 != 141)
              goto LABEL_38;
LABEL_18:
            objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__cancelConfirmationAction_, 0x10000);
            objc_msgSend(v21, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 0x20000);
            objc_msgSend(v21, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__showConfirmationAction_, 0x40000);
            LODWORD(v23) = -0.5;
            objc_msgSend(v21, "setCharge:", v23);
            objc_msgSend(v21, "setItemOfferDelegate:", *(_QWORD *)(a1 + 48));
            if (v21)
            {
              objc_msgSend(v17, "buyButtonDescriptor");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                v25 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
                if (!v25)
                {
                  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 517, 1);
                  v27 = *(_QWORD *)(a1 + 48);
                  v28 = *(void **)(v27 + 824);
                  *(_QWORD *)(v27 + 824) = v26;

                  v25 = *(void **)(*(_QWORD *)(a1 + 48) + 824);
                }
                objc_msgSend(v25, "setObject:forKey:", v21, v24);
                v11 = v38;
              }

            }
LABEL_36:
            objc_msgSend(v8, "addObject:", v21);
LABEL_37:

            goto LABEL_38;
          }
          if (v20 != 50)
          {
            if (v20 != 80)
              goto LABEL_38;
            objc_msgSend(*(id *)(a1 + 32), "addLabelViewWithOrdinalElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
            v22 = objc_claimAutoreleasedReturnValue();
LABEL_35:
            v21 = (id)v22;
            goto LABEL_36;
          }
LABEL_24:
          objc_msgSend(*(id *)(a1 + 32), "addButtonWithElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 48), sel__buttonAction_, 64);
          objc_msgSend(v8, "addObject:", v29);
          if (objc_msgSend(v17, "elementType") == 50)
            v21 = v29;
          else
            v21 = 0;

          if (v21)
          {
LABEL_29:
            objc_msgSend(*(id *)(a1 + 40), "imageResourceCacheKeyForViewElement:", v17);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v31 = *(void **)(*(_QWORD *)(a1 + 48) + 848);
              if (!v31)
              {
                v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 1);
                v33 = *(_QWORD *)(a1 + 48);
                v34 = *(void **)(v33 + 848);
                *(_QWORD *)(v33 + 848) = v32;

                v31 = *(void **)(*(_QWORD *)(a1 + 48) + 848);
              }
              objc_msgSend(v31, "setObject:forKey:", v30, v21);
              v11 = v38;
            }

            goto LABEL_37;
          }
        }
        else
        {
          switch(v20)
          {
            case 8:
              objc_msgSend(*(id *)(a1 + 32), "addBadgeViewWithElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
              v21 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v21);
              if (v21)
                goto LABEL_29;
              break;
            case 9:
              objc_msgSend(*(id *)(a1 + 32), "addBarRatingWithElement:width:context:", v17, *(_QWORD *)(a1 + 40), v15);
              v22 = objc_claimAutoreleasedReturnValue();
              goto LABEL_35;
            case 12:
              goto LABEL_24;
            case 13:
              goto LABEL_18;
            default:
              break;
          }
        }
LABEL_38:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v13);
  }

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 840), "setObject:forKey:", v8, v35);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v22;
  NSMapTable *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(a4, "requestIdentifier");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v22 = v8;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "requestIdentifierForResourceCacheKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "unsignedIntegerValue") == v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "imageView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = v22;
            objc_msgSend(v20, "setImage:", v22);

          }
          else
          {
            v8 = v22;
            objc_msgSend(v15, "setImage:", v22);
          }

          v19 = 1;
          goto LABEL_16;
        }

      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
    v19 = 0;
    v8 = v22;
  }
  else
  {
    v19 = 0;
  }
LABEL_16:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = self->_buyButtonDescriptorToButton;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (SKUIIKViewElementTypeIsButton(objc_msgSend(v15, "elementType", (_QWORD)v20))
          && (objc_msgSend(v15, "canPersonalizeUsingItemState:", v8) & 1) != 0)
        {
          -[NSMapTable objectForKey:](self->_buyButtonDescriptorToButton, "objectForKey:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "clientContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setValuesUsingBuyButtonDescriptor:itemState:clientContext:animated:", v15, v8, v18, v5);

          -[SKUITracklistLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
          v16 = 1;
          goto LABEL_12;
        }
      }
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = 0;
LABEL_12:

  return v16;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__58;
  v15 = __Block_byref_object_dispose__58;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__SKUITracklistLockupCollectionViewCell_viewForElementIdentifier___block_invoke;
  v8[3] = &unk_1E73A64C8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SKUITracklistLockupCollectionViewCell _enumerateViewElementViewsUsingBlock:](self, "_enumerateViewElementViewsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __66__SKUITracklistLockupCollectionViewCell_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "itmlID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[10];
  BOOL v20;
  _QWORD v21[3];
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SKUITracklistLockupCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v23, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[SKUITracklistLockupCollectionViewCell semanticContentAttribute](self, "semanticContentAttribute"));
  -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  v22 = v13;
  -[SKUITracklistColumnData columns](self->_columnData, "columns");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke;
  v19[3] = &unk_1E73A6540;
  v19[6] = v6;
  v19[7] = v8;
  *(double *)&v19[8] = v10;
  *(double *)&v19[9] = v12;
  v19[4] = self;
  v19[5] = v21;
  v20 = v3 == 0;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = v16;

  -[SKUITracklistColumnData leftEdgeInset](self->_columnData, "leftEdgeInset");
  -[UIView setFrame:](self->_separatorView, "setFrame:", v18, v12 - 1.0 / v17, v10 - v18);

  _Block_object_dispose(v21, 8);
}

void __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  float v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, uint64_t);
  void *v33;
  id v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  double v38;
  __int128 v39;
  __int128 v40;
  char v41;
  _QWORD v42[3];
  double v43;
  _QWORD v44[8];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;

  v5 = a2;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "width");
  v9 = v8;
  if (objc_msgSend(v7, "count"))
  {
    v10 = malloc_type_malloc(32 * objc_msgSend(v7, "count"), 0x1000040E0EAB150uLL);
    if (v10)
    {
      v11 = v10;
      v45 = 0;
      v46 = (double *)&v45;
      v47 = 0x2020000000;
      v48 = 0;
      v12 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_2;
      v44[3] = &unk_1E73A64F0;
      *(double *)&v44[6] = v9;
      v44[7] = 0x7FEFFFFFFFFFFFFFLL;
      v44[4] = &v45;
      v44[5] = v10;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v44);
      v42[0] = 0;
      v42[1] = v42;
      v43 = 0.0;
      v13 = (*(double *)(a1 + 72) - v46[3]) * 0.5;
      v42[2] = 0x2020000000;
      v43 = floorf(v13);
      v30 = v12;
      v31 = 3221225472;
      v32 = __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_3;
      v33 = &unk_1E73A6518;
      v37 = v11;
      v35 = v42;
      v14 = v5;
      v15 = *(_QWORD *)(a1 + 40);
      v34 = v14;
      v36 = v15;
      v38 = v9;
      v41 = *(_BYTE *)(a1 + 80);
      v16 = *(_OWORD *)(a1 + 64);
      v39 = *(_OWORD *)(a1 + 48);
      v40 = v16;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v30);
      if (objc_msgSend(v14, "showsPreviewControl", v30, v31, v32, v33))
      {
        objc_msgSend(v7, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 872))
        {
          objc_msgSend(v17, "frame");
          v20 = v19;
          v22 = v21;
          v24 = v23;
          v26 = v25;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "frame");
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 872), "setFrame:", v20 + (v24 - v27) * 0.5, v22 + (v26 - v28) * 0.5);
          objc_msgSend(v18, "setHidden:", 1);
        }
        else
        {
          objc_msgSend(v17, "setHidden:", 0);
        }

      }
      free(v11);

      _Block_object_dispose(v42, 8);
      _Block_object_dispose(&v45, 8);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "interColumnSpacing");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                              + v29
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);

}

double __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  float v19;
  double v20;
  uint64_t v21;
  double result;

  v5 = (_QWORD *)(*(_QWORD *)(a1 + 40) + 32 * a3);
  v6 = a2;
  objc_msgSend(v6, "frame");
  *v5 = v7;
  v5[1] = v8;
  v5[2] = v9;
  v5[3] = v10;
  v11 = *(_QWORD *)(a1 + 40) + 32 * a3;
  objc_msgSend(v6, "sizeThatFits:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v13 = v12;
  v15 = v14;

  *(_QWORD *)(v11 + 16) = v13;
  *(_QWORD *)(v11 + 24) = v15;
  v16 = *(double *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 40) + 32 * a3;
  v18 = *(double *)(v17 + 24);
  v19 = *(double *)(v17 + 16);
  v20 = ceilf(v19);
  if (v16 >= v20)
    v16 = v20;
  *(double *)(v17 + 16) = v16;
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v18 + *(double *)(v21 + 24);
  *(double *)(v21 + 24) = result;
  return result;
}

void __55__SKUITracklistLockupCollectionViewCell_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  double *v7;
  float v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double Width;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;

  v15 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32 * a3 + 8) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  switch(objc_msgSend(*(id *)(a1 + 32), "contentAlignment"))
  {
    case 0:
    case 3:
    case 4:
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(double *)(v5 + 32 * a3) = v6;
      break;
    case 1:
      v5 = *(_QWORD *)(a1 + 56);
      v7 = (double *)(v5 + 32 * a3);
      v8 = (*(double *)(a1 + 64) - v7[2]) * 0.5;
      v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + floorf(v8);
      goto LABEL_6;
    case 2:
      v5 = *(_QWORD *)(a1 + 56);
      v7 = (double *)(v5 + 32 * a3);
      v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + *(double *)(a1 + 64) - v7[2];
LABEL_6:
      *v7 = v6;
      break;
    default:
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(double *)(v5 + 32 * a3);
      break;
  }
  v9 = (double *)(v5 + 32 * a3);
  v10 = v9[1];
  v11 = v9[2];
  v12 = v9[3];
  if (!*(_BYTE *)(a1 + 104))
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 72));
    v16.origin.x = v6;
    v16.origin.y = v10;
    v16.size.width = v11;
    v16.size.height = v12;
    v14 = Width - CGRectGetWidth(v16);
    v17.origin.x = v6;
    v17.origin.y = v10;
    v17.size.width = v11;
    v17.size.height = v12;
    v6 = v14 - CGRectGetMinX(v17);
  }
  objc_msgSend(v15, "setFrame:", v6, v10, v11, v12);
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(*(CGRect *)(*(_QWORD *)(a1 + 56) + 32 * a3));

}

- (void)itemOfferButtonDidAnimateTransition:(id)a3
{
  SKUIGradientView *offerConfirmationGradientView;

  if ((objc_msgSend(a3, "isShowingConfirmation") & 1) == 0)
  {
    -[SKUIGradientView removeFromSuperview](self->_offerConfirmationGradientView, "removeFromSuperview");
    offerConfirmationGradientView = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = 0;

  }
}

- (void)itemOfferButtonWillAnimateTransition:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  CGRect v26;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v20 = 0;
  v21 = (double *)&v20;
  v22 = 0x3010000000;
  v24 = 0;
  v25 = 0;
  v23 = &unk_1BBF15257;
  objc_msgSend(v4, "sizeThatFits:", *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v24 = v13;
  v25 = v14;
  v15 = objc_msgSend(v4, "isShowingConfirmation");
  if ((v15 & 1) == 0)
  {
    -[SKUITracklistColumnData columns](self->_columnData, "columns");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __78__SKUITracklistLockupCollectionViewCell_itemOfferButtonWillAnimateTransition___block_invoke;
    v17[3] = &unk_1E73A6568;
    v17[4] = self;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v17);

  }
  v26.origin.x = v6;
  v26.origin.y = v8;
  v26.size.width = v10;
  v26.size.height = v12;
  objc_msgSend(v4, "setFrame:", CGRectGetMaxX(v26) - v21[4], v8, v21[4], v21[5]);
  -[SKUITracklistLockupCollectionViewCell _layoutConfirmationGradientRelativeToView:alpha:](self, "_layoutConfirmationGradientRelativeToView:alpha:", v4, (double)v15);
  _Block_object_dispose(&v20, 8);

}

void __78__SKUITracklistLockupCollectionViewCell_itemOfferButtonWillAnimateTransition___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v12 = a2;
  v7 = *(void **)(a1[4] + 840);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "containsObject:", a1[5]))
  {
    v10 = *(double *)(*(_QWORD *)(a1[6] + 8) + 32);
    objc_msgSend(v12, "width");
    if (v10 < v11)
      v11 = v10;
    *(double *)(*(_QWORD *)(a1[6] + 8) + 32) = v11;
    *a4 = 1;
  }

}

- (void)_buttonAction:(id)a3
{
  id v4;
  NSMutableDictionary *columnViewsByIndex;
  id v6;
  _QWORD v7[4];
  id v8;
  SKUITracklistLockupCollectionViewCell *v9;

  v4 = a3;
  columnViewsByIndex = self->_columnViewsByIndex;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SKUITracklistLockupCollectionViewCell__buttonAction___block_invoke;
  v7[3] = &unk_1E73A6590;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](columnViewsByIndex, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __55__SKUITracklistLockupCollectionViewCell__buttonAction___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = objc_msgSend(a3, "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 32));
  v8 = v14;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 832), "viewElementsForTrack:columnIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 896), objc_msgSend(v14, "integerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SKUICollectionViewForView(*(void **)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "indexPathForCell:", *(_QWORD *)(a1 + 40));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "collectionView:didConfirmButtonElement:withClickInfo:forItemAtIndexPath:", v11, v10, 0, v13);

    }
    else
    {
      objc_msgSend(v10, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
    }
    *a4 = 1;

    v8 = v14;
  }

}

- (void)_cancelConfirmationAction:(id)a3
{
  objc_msgSend(a3, "setShowingConfirmation:animated:", 0, 1);
}

- (void)_showConfirmationAction:(id)a3
{
  id v4;
  void *v5;
  SKUIGradientView *offerConfirmationGradientView;
  SKUIGradientView *v7;
  SKUIGradientView *v8;
  SKUIGradientView *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bringSubviewToFront:", v4);
  offerConfirmationGradientView = self->_offerConfirmationGradientView;
  if (!offerConfirmationGradientView)
  {
    v7 = [SKUIGradientView alloc];
    v8 = -[SKUIGradientView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v9 = self->_offerConfirmationGradientView;
    self->_offerConfirmationGradientView = v8;

    -[SKUITracklistLockupCollectionViewCell backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGradientView layer](self->_offerConfirmationGradientView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16[0] = objc_msgSend(v12, "CGColor");
    v13 = objc_retainAutorelease(v10);
    v16[1] = objc_msgSend(v13, "CGColor", v16[0]);
    v14 = objc_retainAutorelease(v13);
    v16[2] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColors:", v15);

    objc_msgSend(v11, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v11, "setStartPoint:", 0.0, 0.5);

    offerConfirmationGradientView = self->_offerConfirmationGradientView;
  }
  objc_msgSend(v5, "insertSubview:belowSubview:", offerConfirmationGradientView, v4);
  -[SKUITracklistLockupCollectionViewCell _layoutConfirmationGradientRelativeToView:alpha:](self, "_layoutConfirmationGradientRelativeToView:alpha:", v4, 0.0);
  objc_msgSend(v4, "setShowingConfirmation:animated:", 1, 1);

}

- (void)_audioPlayerStatusChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SKUITracklistLockupCollectionViewCell _previewMediaURL](self, "_previewMediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v5, "playerStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "playerState");

    if ((unint64_t)(v9 - 6) > 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:name:object:", self, v11, v12);

      -[SKUITracklistLockupCollectionViewCell hidePreviewProgressAnimated:](self, "hidePreviewProgressAnimated:", 1);
    }
    else
    {
      objc_msgSend(v5, "playerStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUITracklistLockupCollectionViewCell showPreviewProgressWithStatus:animated:](self, "showPreviewProgressWithStatus:animated:", v10, 1);
    }

  }
}

+ (id)_attributedStringForOrdinal:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SKUIFontLimitedPreferredFontForTextStyle(20, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "attributedStringWithDefaultFont:foregroundColor:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_addFlipContainerViewWithFrontView:(id)a3 backView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SKUIInlineFlipContainerView *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v12 = -[SKUIInlineFlipContainerView initWithFrontView:backView:]([SKUIInlineFlipContainerView alloc], "initWithFrontView:backView:", v7, v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIInlineFlipContainerView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  objc_msgSend(v7, "frame");
  v15 = v14;
  v17 = v16;

  -[SKUIInlineFlipContainerView frame](v12, "frame");
  -[SKUIInlineFlipContainerView setFrame:](v12, "setFrame:", v9 - v15, v11 - v17);
  -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v12);

  return v12;
}

- (void)_enumerateViewElementViewsUsingBlock:(id)a3
{
  id v4;
  SKUITracklistColumnData *columnData;
  SKUITrackViewElement *track;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  columnData = self->_columnData;
  track = self->_track;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__SKUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke;
  v8[3] = &unk_1E73A65E0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SKUITracklistColumnData enumerateColumnsForTrack:usingBlock:](columnData, "enumerateColumnsForTrack:usingBlock:", track, v8);

}

void __78__SKUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v8 = (objc_class *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  v13 = (id)objc_msgSend([v8 alloc], "initWithUnsignedInteger:", a4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__SKUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke_2;
  v14[3] = &unk_1E73A65B8;
  v11 = *(id *)(a1 + 40);
  v15 = v10;
  v16 = v11;
  v17 = a5;
  v12 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

}

void __78__SKUITracklistLockupCollectionViewCell__enumerateViewElementViewsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  char v12;

  v12 = 0;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = a2;
  objc_msgSend(v8, "objectAtIndex:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, char *))(v7 + 16))(v7, v9, v10, &v12);

  v11 = v12;
  **(_BYTE **)(a1 + 48) = v12;
  *a4 = v11;
}

- (void)_layoutConfirmationGradientRelativeToView:(id)a3 alpha:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *separatorView;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  if (self->_offerConfirmationGradientView)
  {
    objc_msgSend(a3, "frame");
    v7 = v6;
    v9 = v8;
    -[SKUIGradientView frame](self->_offerConfirmationGradientView, "frame");
    v11 = v10;
    v12 = v7 + -30.0;
    v13 = v9 + 30.0;
    separatorView = self->_separatorView;
    if (separatorView)
    {
      -[UIView frame](separatorView, "frame");
      v16 = v15;
    }
    else
    {
      -[SKUIGradientView superview](self->_offerConfirmationGradientView, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v16 = v18;

    }
    -[SKUIGradientView setAlpha:](self->_offerConfirmationGradientView, "setAlpha:", a4);
    -[SKUIGradientView setFrame:](self->_offerConfirmationGradientView, "setFrame:", v12, v11, v13, v16);
    -[SKUIGradientView layer](self->_offerConfirmationGradientView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 30.0 / v13, &unk_1E749B708);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v20;
    v22[2] = &unk_1E749B720;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLocations:", v21);

  }
}

- (id)_previewColumnView
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__58;
  v11 = __Block_byref_object_dispose__58;
  v12 = 0;
  -[SKUITracklistColumnData columns](self->_columnData, "columns");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SKUITracklistLockupCollectionViewCell__previewColumnView__block_invoke;
  v6[3] = &unk_1E73A6608;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __59__SKUITracklistLockupCollectionViewCell__previewColumnView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (objc_msgSend(a2, "showsPreviewControl"))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "objectForKey:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

- (id)_previewControlViewElement
{
  return -[SKUIViewElement firstChildForElementType:](self->_track, "firstChildForElementType:", 90);
}

- (id)_previewMediaURL
{
  void *v2;
  void *v3;
  void *v4;

  -[SKUITracklistLockupCollectionViewCell _previewControlViewElement](self, "_previewControlViewElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  void *v4;
  int64_t previewState;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  previewState = self->_previewState;
  if (previewState == 3)
  {
    objc_msgSend(v25, "removeFromSuperview");
    -[SKUITracklistLockupCollectionViewCell _previewColumnView](self, "_previewColumnView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUITracklistLockupCollectionViewCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v23);

    -[SKUITracklistLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
    self->_previewState = 0;

  }
  else if (previewState == 1)
  {
    -[SKUIPreviewProgressIndicator frame](self->_previewProgressIndicator, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SKUIPreviewProgressIndicator superview](self->_previewProgressIndicator, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:fromView:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    -[SKUIPreviewProgressIndicator setFrame:](self->_previewProgressIndicator, "setFrame:", v16, v18, v20, v22);
    objc_msgSend(v4, "addSubview:", self->_previewProgressIndicator);
    objc_msgSend(v25, "removeFromSuperview");
    -[SKUIPreviewProgressIndicator reloadWithPlayerStatus:animated:](self->_previewProgressIndicator, "reloadWithPlayerStatus:animated:", self->_lastPlayerStatus, 0);
    self->_previewState = 2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_previewProgressIndicator, 0);
  objc_storeStrong((id *)&self->_offerConfirmationGradientView, 0);
  objc_storeStrong((id *)&self->_lastPlayerStatus, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
  objc_storeStrong((id *)&self->_columnViewsByIndex, 0);
  objc_storeStrong((id *)&self->_columnData, 0);
  objc_storeStrong((id *)&self->_buyButtonDescriptorToButton, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
