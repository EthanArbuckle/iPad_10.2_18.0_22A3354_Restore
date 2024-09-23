@implementation PBFPosterGalleryPreviewComplicationContentView

- (PBFPosterGalleryPreviewComplicationContentView)initWithFrame:(CGRect)a3
{
  PBFPosterGalleryPreviewComplicationContentView *v3;
  UIView *v4;
  UIView *inlineComplicationContainerView;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PRWidgetGridViewController *widgetGridViewController;
  void *v11;
  uint64_t v12;
  PRWidgetGridViewController *sidebarWidgetGridViewController;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  v3 = -[PBFPosterGalleryPreviewComplicationContentView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    inlineComplicationContainerView = v3->_inlineComplicationContainerView;
    v3->_inlineComplicationContainerView = v4;

    v6 = objc_alloc(MEMORY[0x1E0D7FBB8]);
    v7 = MEMORY[0x1E0C9AA60];
    v8 = (void *)objc_msgSend(v6, "initWithComplicationDescriptors:iconLayout:type:", MEMORY[0x1E0C9AA60], 0, 0);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBC8]), "initWithModel:iconViewProvider:", v8, v3);
    widgetGridViewController = v3->_widgetGridViewController;
    v3->_widgetGridViewController = (PRWidgetGridViewController *)v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBB8]), "initWithComplicationDescriptors:iconLayout:type:", v7, 0, 1);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FBC8]), "initWithModel:iconViewProvider:", v11, v3);
    sidebarWidgetGridViewController = v3->_sidebarWidgetGridViewController;
    v3->_sidebarWidgetGridViewController = (PRWidgetGridViewController *)v12;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[PRWidgetGridViewController invalidate](self->_widgetGridViewController, "invalidate");
  -[PRWidgetGridViewController invalidate](self->_sidebarWidgetGridViewController, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  -[PBFPosterGalleryPreviewComplicationContentView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  -[PBFPosterGalleryPreviewComplicationContentView didMoveToWindow](&v4, sel_didMoveToWindow);
  v3 = -[PBFPosterGalleryPreviewComplicationContentView _layoutController](self, "_layoutController");
  -[PBFPosterGalleryPreviewComplicationContentView setNeedsLayout](self, "setNeedsLayout");
}

- (id)pbf_displayContext
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  -[UIView pbf_displayContext](&v6, sel_pbf_displayContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", -[PBFPosterGalleryPreviewComplicationContentView layoutOrientation](self, "layoutOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setLayoutOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CSProminentLayoutController *layoutController;

  if (self->_layoutOrientation != a3)
  {
    if (BSInterfaceOrientationIsLandscape())
    {
      -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[BSUIVibrancyEffectView contentView](self->_vibrancyEffectView, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetGridViewController view](self->_sidebarWidgetGridViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v7);

    }
    else
    {
      -[BSUIVibrancyEffectView contentView](self->_vibrancyEffectView, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[PRWidgetGridViewController view](self->_sidebarWidgetGridViewController, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeFromSuperview");
    }

    layoutController = self->_layoutController;
    self->_layoutController = 0;

    self->_layoutOrientation = a3;
    -[PBFPosterGalleryPreviewComplicationContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBFPosterGalleryPreviewComplicationContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPosterPreview:(id)a3
{
  PBFPosterPreview *v5;
  uint64_t v6;
  PBFComplicationSnapshotRequest *v7;
  PBFComplicationSnapshotRequest *inlineComplicationSnapshotRequest;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *iconImageViewsByUniqueIdentifier;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PBFComplicationSnapshotRequest *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  uint64_t v31;
  NSArray *modularComplicationSnapshotRequests;
  id v33;
  uint64_t v34;
  BSUIVibrancyEffectView *vibrancyEffectView;
  void *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BSUIVibrancyEffectView *v43;
  void *v44;
  void *v45;
  void *v46;
  PRWidgetGridViewController **p_sidebarWidgetGridViewController;
  PRWidgetGridViewController **p_widgetGridViewController;
  void *v49;
  void *v50;
  void *v51;
  PBFPosterPreview *v52;
  id obj;
  PBFPosterGalleryPreviewComplicationContentView *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = (PBFPosterPreview *)a3;
  if (self->_posterPreview != v5)
  {
    -[PBFPosterGalleryPreviewComplicationContentView prepareForReuse](self, "prepareForReuse");
    -[PBFPosterGalleryPreviewComplicationContentView setContentMode:](self, "setContentMode:", 3);
    objc_storeStrong((id *)&self->_posterPreview, a3);
    -[PBFPosterPreview subtitleComplication](v5, "subtitleComplication");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PBFComplicationSnapshotRequest requestForComplicationLookupInfo:](PBFComplicationSnapshotRequest, "requestForComplicationLookupInfo:", v6);
      v7 = (PBFComplicationSnapshotRequest *)objc_claimAutoreleasedReturnValue();
      inlineComplicationSnapshotRequest = self->_inlineComplicationSnapshotRequest;
      self->_inlineComplicationSnapshotRequest = v7;

      v9 = -[PBFPosterGalleryPreviewComplicationContentView _placeImageViewForSubtitleComplication:withSuperview:snapshotRequest:](self, "_placeImageViewForSubtitleComplication:withSuperview:snapshotRequest:", v6, self->_inlineComplicationContainerView, self->_inlineComplicationSnapshotRequest);
    }
    v51 = (void *)v6;
    -[PBFPosterPreview suggestedComplications](v5, "suggestedComplications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bs_mapNoNulls:", &__block_literal_global_15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    p_widgetGridViewController = &self->_widgetGridViewController;
    -[PRWidgetGridViewController model](self->_widgetGridViewController, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setComplicationDescriptors:iconLayout:", v11, 0);

    v52 = v5;
    -[PBFPosterPreview suggestedLandscapeComplications](v5, "suggestedLandscapeComplications");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_mapNoNulls:", &__block_literal_global_15);
    v14 = objc_claimAutoreleasedReturnValue();

    p_sidebarWidgetGridViewController = &self->_sidebarWidgetGridViewController;
    -[PRWidgetGridViewController model](self->_sidebarWidgetGridViewController, "model");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setComplicationDescriptors:iconLayout:", v14, 0);

    v49 = (void *)v14;
    v50 = v11;
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iconImageViewsByUniqueIdentifier = self->_iconImageViewsByUniqueIdentifier;
    v54 = self;
    self->_iconImageViewsByUniqueIdentifier = v17;

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v16;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v57 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v23, "widget");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D7FBD0], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "systemMetricsForWidget:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = -[PBFComplicationSnapshotRequest initWithWidget:metrics:]([PBFComplicationSnapshotRequest alloc], "initWithWidget:metrics:", v24, v26);
          objc_msgSend(v55, "addObject:", v27);
          -[PBFPosterGalleryPreviewComplicationContentView _imageViewForComplication:snapshotRequest:](v54, "_imageViewForComplication:snapshotRequest:", v23, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v54->_iconImageViewsByUniqueIdentifier;
          objc_msgSend(v23, "uniqueIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v28, v30);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v20);
    }

    v31 = objc_msgSend(v55, "copy");
    modularComplicationSnapshotRequests = v54->_modularComplicationSnapshotRequests;
    v54->_modularComplicationSnapshotRequests = (NSArray *)v31;

    if (!v54->_vibrancyEffectView
      && -[PBFPosterGalleryPreviewComplicationContentView _hasComplications](v54, "_hasComplications"))
    {
      v33 = objc_alloc(MEMORY[0x1E0D01960]);
      -[PBFPosterGalleryPreviewComplicationContentView bounds](v54, "bounds");
      v34 = objc_msgSend(v33, "initWithFrame:");
      vibrancyEffectView = v54->_vibrancyEffectView;
      v54->_vibrancyEffectView = (BSUIVibrancyEffectView *)v34;

      -[PBFPosterGalleryPreviewComplicationContentView addSubview:](v54, "addSubview:", v54->_vibrancyEffectView);
    }
    -[BSUIVibrancyEffectView contentView](v54->_vibrancyEffectView, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v54->_inlineComplicationContainerView);

    LODWORD(v36) = BSInterfaceOrientationIsLandscape();
    -[BSUIVibrancyEffectView contentView](v54->_vibrancyEffectView, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (id *)p_widgetGridViewController;
    if ((_DWORD)v36)
      v38 = (id *)p_sidebarWidgetGridViewController;
    objc_msgSend(*v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addSubview:", v39);

    v5 = v52;
    if (-[NSArray count](v54->_modularComplicationSnapshotRequests, "count") || v54->_inlineComplicationSnapshotRequest)
    {
      -[PBFPosterPreview posterDescriptorLookupInfo](v52, "posterDescriptorLookupInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "posterDescriptorExtension");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "posterExtensionBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v54->_vibrancyEffectView;
      -[PBFPosterPreview titleStyleConfiguration](v52, "titleStyleConfiguration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "vibrancyConfigurationWithExtensionBundle:", v42);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSUIVibrancyEffectView setConfiguration:](v43, "setConfiguration:", v45);

      -[BSUIVibrancyEffectView setHidden:](v54->_vibrancyEffectView, "setHidden:", 0);
    }
    else
    {
      -[BSUIVibrancyEffectView setHidden:](v54->_vibrancyEffectView, "setHidden:", 1);
    }
    -[PBFPosterGalleryPreviewComplicationContentView setNeedsLayout](v54, "setNeedsLayout");
    -[PBFPosterGalleryPreviewComplicationContentView window](v54, "window");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      -[PBFPosterGalleryPreviewComplicationContentView layoutIfNeeded](v54, "layoutIfNeeded");

  }
}

id __67__PBFPosterGalleryPreviewComplicationContentView_setPosterPreview___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = (objc_class *)MEMORY[0x1E0D10038];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "complicationExtensionBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationContainingBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v5, v6, 0);

  v8 = objc_alloc(MEMORY[0x1E0D10148]);
  objc_msgSend(v3, "complicationWidgetKind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "complicationWidgetFamily");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  objc_msgSend(v3, "complicationIntent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v8, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v7, v9, v11, v12, 0);
  v14 = objc_alloc(MEMORY[0x1E0D7F9F8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithUniqueIdentifier:widget:", v16, v13);

  return v17;
}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *iconImageViewsByUniqueIdentifier;
  NSMapTable *imageViewsForComplicationSnapshotRequest;
  NSMapTable *imageViewForComplication;
  NSArray *modularComplicationSnapshotRequests;
  PBFComplicationSnapshotRequest *inlineComplicationSnapshotRequest;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = (void *)-[NSMutableArray copy](self->_complicationImageViews, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        -[PBFPosterGalleryPreviewComplicationContentView _stopUsingComplicationImageView:](self, "_stopUsingComplicationImageView:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  -[PRWidgetGridViewController model](self->_widgetGridViewController, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v8, "setComplicationDescriptors:iconLayout:", MEMORY[0x1E0C9AA60], 0);

  -[PRWidgetGridViewController model](self->_sidebarWidgetGridViewController, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComplicationDescriptors:iconLayout:", v9, 0);

  iconImageViewsByUniqueIdentifier = self->_iconImageViewsByUniqueIdentifier;
  self->_iconImageViewsByUniqueIdentifier = 0;

  imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  self->_imageViewsForComplicationSnapshotRequest = 0;

  imageViewForComplication = self->_imageViewForComplication;
  self->_imageViewForComplication = 0;

  modularComplicationSnapshotRequests = self->_modularComplicationSnapshotRequests;
  self->_modularComplicationSnapshotRequests = 0;

  inlineComplicationSnapshotRequest = self->_inlineComplicationSnapshotRequest;
  self->_inlineComplicationSnapshotRequest = 0;

}

- (void)setComplicationImage:(id)a3 forComplicationSnapshotRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  PBFPosterGalleryPreviewComplicationContentView *v14;

  v6 = a3;
  v7 = a4;
  if (-[PBFPosterGalleryPreviewComplicationContentView _isComplicationSnapshotRequestOurs:](self, "_isComplicationSnapshotRequestOurs:", v7))
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __102__PBFPosterGalleryPreviewComplicationContentView_setComplicationImage_forComplicationSnapshotRequest___block_invoke;
    v12 = &unk_1E86F5168;
    v13 = v6;
    v14 = self;
    -[PBFPosterGalleryPreviewComplicationContentView _enumerateImageViewsForComplicationSnapshotRequest:usingBlock:](self, "_enumerateImageViewsForComplicationSnapshotRequest:usingBlock:", v7, &v9);
    -[NSMapTable removeObjectForKey:](self->_imageViewsForComplicationSnapshotRequest, "removeObjectForKey:", v7, v9, v10, v11, v12);
    -[PBFPosterGalleryPreviewComplicationContentView setNeedsLayout](self, "setNeedsLayout");
    -[PBFPosterGalleryPreviewComplicationContentView window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PBFPosterGalleryPreviewComplicationContentView layoutIfNeeded](self, "layoutIfNeeded");

  }
}

uint64_t __102__PBFPosterGalleryPreviewComplicationContentView_setComplicationImage_forComplicationSnapshotRequest___block_invoke(uint64_t a1, void *a2)
{
  if (*(_QWORD *)(a1 + 32))
    return objc_msgSend(a2, "setImage:");
  else
    return objc_msgSend(*(id *)(a1 + 40), "_stopUsingComplicationImageView:", a2);
}

- (void)layoutSubviews
{
  PRWidgetGridViewController *widgetGridViewController;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  PRWidgetGridViewController *sidebarWidgetGridViewController;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double MaxY;
  double MinY;
  void *v42;
  uint64_t v43;
  double v44;
  void *v45;
  void *v46;
  UIView *inlineComplicationContainerView;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  objc_super v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v54.receiver = self;
  v54.super_class = (Class)PBFPosterGalleryPreviewComplicationContentView;
  -[PBFPosterGalleryPreviewComplicationContentView layoutSubviews](&v54, sel_layoutSubviews);
  widgetGridViewController = self->_widgetGridViewController;
  -[PBFPosterGalleryPreviewComplicationContentView _contentScaleForWidgetGridViewController](self, "_contentScaleForWidgetGridViewController");
  -[PRWidgetGridViewController setIconContentScale:](widgetGridViewController, "setIconContentScale:");
  -[PBFPosterGalleryPreviewComplicationContentView _scaledFrameForElements:](self, "_scaledFrameForElements:", 8);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v9;
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  sidebarWidgetGridViewController = self->_sidebarWidgetGridViewController;
  -[PBFPosterGalleryPreviewComplicationContentView _contentScaleForWidgetGridViewController](self, "_contentScaleForWidgetGridViewController");
  -[PRWidgetGridViewController setIconContentScale:](sidebarWidgetGridViewController, "setIconContentScale:");
  -[PBFPosterGalleryPreviewComplicationContentView _scaledFrameForElements:](self, "_scaledFrameForElements:", 16);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PRWidgetGridViewController view](self->_sidebarWidgetGridViewController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[PBFPosterGalleryPreviewComplicationContentView posterPreview](self, "posterPreview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "subtitleComplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewComplicationContentView bounds](self, "bounds");
  v27 = v25;
  v28 = v26;
  v51 = v30;
  v52 = v29;
  if (v24)
  {
    v48 = v26;
    v49 = v25;
    v50 = v5;
    -[NSMapTable objectForKey:](self->_imageViewForComplication, "objectForKey:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryPreviewComplicationContentView _scaledFrameForElements:](self, "_scaledFrameForElements:", 4);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;
    objc_msgSend(v31, "setFrame:");
    v55.origin.x = v33;
    v55.origin.y = v35;
    v55.size.width = v37;
    v55.size.height = v39;
    MaxY = 0.0;
    if (CGRectGetMaxY(v55) > 0.0)
    {
      v56.origin.x = v33;
      v56.origin.y = v35;
      v56.size.width = v37;
      v56.size.height = v39;
      MaxY = CGRectGetMaxY(v56);
    }
    v57.origin.x = v33;
    v57.origin.y = v35;
    v57.size.width = v37;
    v57.size.height = v39;
    MinY = 1.79769313e308;
    if (CGRectGetMinY(v57) < 1.79769313e308)
    {
      v58.origin.x = v33;
      v58.origin.y = v35;
      v58.size.width = v37;
      v58.size.height = v39;
      MinY = CGRectGetMinY(v58);
    }

    v27 = v49;
    v5 = v50;
    v28 = v48;
  }
  else
  {
    MaxY = 0.0;
    MinY = 1.79769313e308;
  }
  v59.origin.x = v5;
  v59.origin.y = v7;
  v59.size.width = v53;
  v59.size.height = v11;
  if (CGRectGetMaxY(v59) > MaxY)
  {
    v60.origin.x = v5;
    v60.origin.y = v7;
    v60.size.width = v53;
    v60.size.height = v11;
    MaxY = CGRectGetMaxY(v60);
  }
  v61.origin.x = v5;
  v61.origin.y = v7;
  v61.size.width = v53;
  v61.size.height = v11;
  if (CGRectGetMinY(v61) < MinY)
  {
    v62.origin.x = v5;
    v62.origin.y = v7;
    v62.size.width = v53;
    v62.size.height = v11;
    MinY = CGRectGetMinY(v62);
  }
  if ((BSInterfaceOrientationIsPortrait() & 1) != 0
    || (objc_msgSend(v23, "suggestedLandscapeComplications"),
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v43 = objc_msgSend(v42, "count"),
        v42,
        !v43))
  {
    v44 = MaxY - MinY;
    -[PRWidgetGridViewController view](self->_widgetGridViewController, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v5, v7 - MinY, v53, v11);

    -[NSMapTable objectForKey:](self->_imageViewForComplication, "objectForKey:", v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterGalleryPreviewComplicationContentView _scaledFrameForElements:](self, "_scaledFrameForElements:", 4);
    objc_msgSend(v46, "setFrame:");

  }
  else
  {
    MinY = v28;
    v44 = v51;
  }
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyEffectView, "setFrame:", v27, MinY, v52, v44);
  inlineComplicationContainerView = self->_inlineComplicationContainerView;
  -[BSUIVibrancyEffectView bounds](self->_vibrancyEffectView, "bounds");
  -[UIView setFrame:](inlineComplicationContainerView, "setFrame:");

}

- (void)_enumerateImageViewsForComplicationSnapshotRequest:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[NSMapTable objectForKey:](self->_imageViewsForComplicationSnapshotRequest, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)_imageViewForComplication:(id)a3 snapshotRequest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSMutableArray *complicationImageViews;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMapTable *imageViewForComplication;
  NSMapTable *v14;
  NSMapTable *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMapTable *imageViewsForComplicationSnapshotRequest;
  NSMapTable *v20;
  NSMapTable *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableArray lastObject](self->_unusedComplicationImageViews, "lastObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (id)v8;
    -[NSMutableArray removeLastObject](self->_unusedComplicationImageViews, "removeLastObject");
    objc_msgSend(v9, "setHidden:", 0);
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  }
  complicationImageViews = self->_complicationImageViews;
  if (!complicationImageViews)
  {
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = self->_complicationImageViews;
    self->_complicationImageViews = v11;

    complicationImageViews = self->_complicationImageViews;
  }
  -[NSMutableArray addObject:](complicationImageViews, "addObject:", v9);
  imageViewForComplication = self->_imageViewForComplication;
  if (!imageViewForComplication)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
    v14 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v15 = self->_imageViewForComplication;
    self->_imageViewForComplication = v14;

    imageViewForComplication = self->_imageViewForComplication;
  }
  -[NSMapTable setObject:forKey:](imageViewForComplication, "setObject:forKey:", v9, v6);
  -[NSMapTable objectForKey:](self->_imageViewsForComplicationSnapshotRequest, "objectForKey:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;
    objc_msgSend(v16, "arrayByAddingObject:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  if (!imageViewsForComplicationSnapshotRequest)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v20 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v21 = self->_imageViewsForComplicationSnapshotRequest;
    self->_imageViewsForComplicationSnapshotRequest = v20;

    imageViewsForComplicationSnapshotRequest = self->_imageViewsForComplicationSnapshotRequest;
  }
  -[NSMapTable setObject:forKey:](imageViewsForComplicationSnapshotRequest, "setObject:forKey:", v18, v7);

  return v9;
}

- (id)_placeImageViewForSubtitleComplication:(id)a3 withSuperview:(id)a4 snapshotRequest:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  v8 = a5;
  v9 = a4;
  -[PBFPosterGalleryPreviewComplicationContentView _imageViewForComplication:snapshotRequest:](self, "_imageViewForComplication:snapshotRequest:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[PBFPosterGalleryPreviewComplicationContentView window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PBFPosterGalleryPreviewComplicationContentView _scaledFrameForElements:](self, "_scaledFrameForElements:", 4);
    objc_msgSend(v10, "setFrame:");
  }
  objc_msgSend(v10, "setClipsToBounds:", 1);
  objc_msgSend(v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewComplicationContentView _cornerRadiusForComplicationSnapshotRequest:](self, "_cornerRadiusForComplicationSnapshotRequest:", v8);
  v14 = v13;

  objc_msgSend(v12, "setCornerRadius:", v14);
  return v10;
}

- (void)_stopUsingComplicationImageView:(id)a3
{
  id v4;
  NSMutableArray *unusedComplicationImageViews;
  NSMutableArray *v6;
  NSMutableArray *v7;
  NSMapTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSMapTable *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setImage:", 0);
  objc_msgSend(v4, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setHidden:", 1);
  unusedComplicationImageViews = self->_unusedComplicationImageViews;
  if (!unusedComplicationImageViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_unusedComplicationImageViews;
    self->_unusedComplicationImageViews = v6;

    unusedComplicationImageViews = self->_unusedComplicationImageViews;
  }
  -[NSMutableArray addObject:](unusedComplicationImageViews, "addObject:", v4);
  -[NSMutableArray removeObject:](self->_complicationImageViews, "removeObject:", v4);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_imageViewForComplication;
  v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
      -[NSMapTable objectForKey:](self->_imageViewForComplication, "objectForKey:", v13, (_QWORD)v16);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v4)
        break;

      if (v10 == ++v12)
      {
        v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_14;
      }
    }
    v15 = v13;

    if (!v15)
      goto LABEL_15;
    -[NSMapTable removeObjectForKey:](self->_imageViewForComplication, "removeObjectForKey:", v15);
    v8 = v15;
  }
LABEL_14:

LABEL_15:
}

- (CGRect)_scaledFrameForElements:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect result;

  -[PBFPosterGalleryPreviewComplicationContentView pbf_displayContext](self, "pbf_displayContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[PBFPosterGalleryPreviewComplicationContentView _hasComplications](self, "_hasComplications"))
  {
    objc_msgSend(v5, "pbf_frame");
    v7 = v6;
    v9 = v8;
    -[PBFPosterGalleryPreviewComplicationContentView bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    -[PBFPosterGalleryPreviewComplicationContentView traitCollection](self, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayScale");

    memset(&v37, 0, sizeof(v37));
    CGAffineTransformMakeScale(&v37, v11 / v7, v13 / v9);
    -[PBFPosterGalleryPreviewComplicationContentView _layoutController](self, "_layoutController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frameForElements:withBoundingRect:", a3, 0.0, 0.0, v7, v9);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v36 = v37;
    v38.origin.x = v17;
    v38.origin.y = v19;
    v38.size.width = v21;
    v38.size.height = v23;
    CGRectApplyAffineTransform(v38, &v36);
    UIRectRoundToScale();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
  }
  else
  {
    v25 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v32 = v25;
  v33 = v27;
  v34 = v29;
  v35 = v31;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (double)_contentScaleForWidgetGridViewController
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PBFPosterGalleryPreviewComplicationContentView pbf_displayContext](self, "pbf_displayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "pbf_frame");
    v6 = v5;
    -[PBFPosterGalleryPreviewComplicationContentView bounds](self, "bounds");
    v8 = v7 / v6;
  }
  else
  {
    v8 = 1.0;
  }

  return v8;
}

- (double)_cornerRadiusForComplicationSnapshotRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  -[PBFPosterGalleryPreviewComplicationContentView pbf_displayContext](self, "pbf_displayContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pbf_frame");
    v8 = v7;
    -[PBFPosterGalleryPreviewComplicationContentView bounds](self, "bounds");
    v10 = v9 / v8;
    objc_msgSend(v4, "metrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_effectiveCornerRadius");
    v13 = v12 * v10;

  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (id)_layoutController
{
  void *v3;
  CSProminentLayoutController *layoutController;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  CSProminentLayoutController *v10;
  CSProminentLayoutController *v11;
  CSProminentLayoutController *v12;

  -[PBFPosterGalleryPreviewComplicationContentView pbf_displayContext](self, "pbf_displayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    layoutController = self->_layoutController;
    if (!layoutController
      || (-[CSProminentLayoutController traitEnvironment](layoutController, "traitEnvironment"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[PBFPosterGalleryPreviewComplicationContentView window](self, "window"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          v5,
          (v7 & 1) == 0))
    {
      v8 = objc_alloc(MEMORY[0x1E0D1BCB0]);
      -[PBFPosterGalleryPreviewComplicationContentView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (CSProminentLayoutController *)objc_msgSend(v8, "initWithTraitEnvironment:", v9);
      v11 = self->_layoutController;
      self->_layoutController = v10;

    }
    v12 = self->_layoutController;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_hasComplications
{
  return -[NSArray count](self->_modularComplicationSnapshotRequests, "count")
      || self->_inlineComplicationSnapshotRequest != 0;
}

- (BOOL)_isComplicationSnapshotRequestOurs:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PBFComplicationSnapshotRequest isEqual:](self->_inlineComplicationSnapshotRequest, "isEqual:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = self->_modularComplicationSnapshotRequests;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isEqual:", v4, (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v5;
}

- (void)prepareComplicationPreviewWithGenerator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  _BOOL8 v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id location;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[PBFPosterGalleryPreviewComplicationContentView posterPreview](self, "posterPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v4, "suggestedComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "suggestedLandscapeComplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(v4, "subtitleComplication");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 == 0;

      if (v22)
        goto LABEL_17;
      goto LABEL_5;
    }

  }
LABEL_5:
  objc_msgSend(v4, "subtitleComplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v7 != 0;
  objc_msgSend(v4, "suggestedComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v8, "count");
  objc_msgSend(v4, "suggestedLandscapeComplications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(v25, "preparedComplicationPreviewImagesForPreview:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v11, "keyEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:](self, "_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:", v18, 0, v17, v4);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v14);
    }

  }
  if (objc_msgSend(v12, "count") != v23 + v24 + v10)
  {
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke;
    v29[3] = &unk_1E86F5190;
    objc_copyWeak(&v31, &location);
    v20 = v4;
    v30 = v20;
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_3;
    v26[3] = &unk_1E86F51B8;
    objc_copyWeak(&v28, &location);
    v27 = v20;
    objc_msgSend(v25, "fetchComplicationPreviewImagesForPreview:complicationSnapshotReceivedHandler:errorHandler:completion:", v27, v29, v26, 0);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v31);
  }

LABEL_17:
  objc_destroyWeak(&location);

}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_2;
  v9[3] = &unk_1E86F3EE8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_4;
  v9[3] = &unk_1E86F3EE8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
}

void __90__PBFPosterGalleryPreviewComplicationContentView_prepareComplicationPreviewWithGenerator___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_updatePreviewWithComplicationImage:(id)a3 error:(id)a4 complicationSnapshotRequest:(id)a5 posterPreview:(id)a6
{
  id v11;
  id v12;
  id v13;
  PBFPosterPreview *v14;
  PBFPosterPreview *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (PBFPosterPreview *)a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("complicationSnapshotRequest"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:].cold.1(a2);
LABEL_17:
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA74B80);
  }
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterPreview"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:].cold.2(a2);
    goto LABEL_17;
  }
  if (self->_posterPreview == v14)
  {
    PBFLogGallery();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:].cold.4();
      v18 = 0;
    }
    else
    {
      v18 = v11;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[PBFPosterGalleryPreviewComplicationContentView _updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:].cold.3();
        v18 = v11;
      }
    }

    -[PBFPosterGalleryPreviewComplicationContentView setComplicationImage:forComplicationSnapshotRequest:](self, "setComplicationImage:forComplicationSnapshotRequest:", v18, v13);
  }

}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return 0;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setIconContentScalingEnabled:", 1);
  objc_msgSend(v5, "setDelegate:", self);

}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4;
  PBFWidgetIconViewController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(PBFWidgetIconViewController);
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  objc_msgSend(v10, "leafIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_iconImageViewsByUniqueIdentifier, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFWidgetIconViewController setIconImageView:](v5, "setIconImageView:", v12);

  return v5;
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (double)posterPreviewScale
{
  return self->_posterPreviewScale;
}

- (void)setPosterPreviewScale:(double)a3
{
  self->_posterPreviewScale = a3;
}

- (BOOL)preferredCornerRadius
{
  return self->_preferredCornerRadius;
}

- (void)setPreferredCornerRadius:(BOOL)a3
{
  self->_preferredCornerRadius = a3;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_storeStrong((id *)&self->_sidebarWidgetGridViewController, 0);
  objc_storeStrong((id *)&self->_widgetGridViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_modularComplicationSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_unusedComplicationImageViews, 0);
  objc_storeStrong((id *)&self->_complicationImageViews, 0);
  objc_storeStrong((id *)&self->_imageViewForComplication, 0);
  objc_storeStrong((id *)&self->_imageViewsForComplicationSnapshotRequest, 0);
  objc_storeStrong((id *)&self->_iconImageViewsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
}

- (void)_updatePreviewWithComplicationImage:(const char *)a1 error:complicationSnapshotRequest:posterPreview:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_updatePreviewWithComplicationImage:(const char *)a1 error:complicationSnapshotRequest:posterPreview:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&dword_1CB9FA000, v0, OS_LOG_TYPE_DEBUG, "Laying out poster preview complication request '%{public}@' for poster preview '%{public}@'", v1, 0x16u);
}

- (void)_updatePreviewWithComplicationImage:error:complicationSnapshotRequest:posterPreview:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_1CB9FA000, v0, OS_LOG_TYPE_ERROR, "Error laying out complications for poster preview '%{public}@': %{public}@", v1, 0x16u);
}

@end
