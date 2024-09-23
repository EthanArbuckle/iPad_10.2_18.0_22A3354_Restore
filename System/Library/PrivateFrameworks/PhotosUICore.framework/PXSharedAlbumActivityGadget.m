@implementation PXSharedAlbumActivityGadget

- (PXSharedAlbumActivityGadget)init
{
  PXSharedAlbumActivityGadget *v2;
  PXPhotoKitUIMediaProvider *v3;
  PXPhotoKitUIMediaProvider *mediaProvider;
  void *v5;
  void *v6;
  CGSize v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXSharedAlbumActivityGadget;
  v2 = -[PXSharedAlbumActivityGadget init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = v2->_mediaProvider;
    v2->_mediaProvider = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDeferredKeyObserver:", v2);

    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v2->_visibleContentRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v2->_visibleContentRect.size = v7;
  }
  return v2;
}

- (void)dealloc
{
  PXAssetCollageView *collageView;
  void *v4;
  void *v5;
  objc_super v6;

  collageView = self->_collageView;
  NSStringFromSelector(sel_frame);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollageView removeObserver:forKeyPath:context:](collageView, "removeObserver:forKeyPath:context:", self, v4, ColllageViewFrameObservationContext);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v6.receiver = self;
  v6.super_class = (Class)PXSharedAlbumActivityGadget;
  -[PXSharedAlbumActivityGadget dealloc](&v6, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)ColllageViewFrameObservationContext == a6)
  {
    px_dispatch_on_main_queue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXSharedAlbumActivityGadget;
    -[PXSharedAlbumActivityGadget observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setAssetsSectionInfo:(id)a3
{
  void *v4;
  id v5;

  objc_storeStrong((id *)&self->_assetsSectionInfo, a3);
  if (-[PXSharedAlbumActivityGadget wasAskedToLoadContentData](self, "wasAskedToLoadContentData"))
    -[PXSharedAlbumActivityGadget _loadContentFromSectionInfo](self, "_loadContentFromSectionInfo");
  -[PXSharedAlbumActivityGadget setAssetsDataSourceManager:](self, "setAssetsDataSourceManager:", 0);
  -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumActivityGadget headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionInfo:", v5);

}

- (PXSharedAlbumHeaderView)headerView
{
  PXSharedAlbumHeaderView *headerView;
  PXSharedAlbumHeaderView *v4;
  void *v5;
  PXSharedAlbumHeaderView *v6;

  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = objc_alloc_init(PXSharedAlbumHeaderView);
    -[PXSharedAlbumHeaderView setTappableArea:](v4, "setTappableArea:", 2);
    -[PXSharedAlbumHeaderView setLayoutStyle:](v4, "setLayoutStyle:", 2);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleActionTap_);
    -[PXSharedAlbumHeaderView addGestureRecognizer:](v4, "addGestureRecognizer:", v5);
    v6 = self->_headerView;
    self->_headerView = v4;

    headerView = self->_headerView;
  }
  return headerView;
}

- (PXAssetCollageView)collageView
{
  PXAssetCollageView *collageView;
  PXAssetCollageView *v4;
  void *v5;
  PXAssetCollageView *v6;
  void *v7;
  void *v8;
  PXAssetCollageView *v9;
  PXAssetCollageView *v10;
  void *v11;

  collageView = self->_collageView;
  if (!collageView)
  {
    v4 = [PXAssetCollageView alloc];
    -[PXSharedAlbumActivityGadget mediaProvider](self, "mediaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXAssetCollageView initWithFrame:mediaProvider:](v4, "initWithFrame:mediaProvider:", v5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    -[PXAssetCollageView setCornerRadius:](v6, "setCornerRadius:", 4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollageView setCornerBackgroundColor:](v6, "setCornerBackgroundColor:", v7);

    -[PXAssetCollageView setSpacing:](v6, "setSpacing:", 2.0);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleCollageViewTap_);
    -[PXAssetCollageView addGestureRecognizer:](v6, "addGestureRecognizer:", v8);
    v9 = self->_collageView;
    self->_collageView = v6;
    v10 = v6;

    NSStringFromSelector(sel_frame);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetCollageView addObserver:forKeyPath:options:context:](v10, "addObserver:forKeyPath:options:context:", self, v11, 0, ColllageViewFrameObservationContext);

    collageView = self->_collageView;
  }
  return collageView;
}

- (UILabel)captionLabel
{
  UILabel *captionLabel;
  UILabel *v4;
  UILabel *v5;

  captionLabel = self->_captionLabel;
  if (!captionLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 4);
    -[UILabel setNumberOfLines:](v4, "setNumberOfLines:", -[PXSharedAlbumActivityGadget _numberOfLinesForCaption](self, "_numberOfLinesForCaption"));
    -[UILabel setHidden:](v4, "setHidden:", -[PXSharedAlbumActivityGadget _isAccessibilityContentSize](self, "_isAccessibilityContentSize"));
    v5 = self->_captionLabel;
    self->_captionLabel = v4;

    captionLabel = self->_captionLabel;
  }
  return captionLabel;
}

- (void)contentViewWillAppear
{
  void *v3;
  void *v4;
  id v5;

  -[PXSharedAlbumActivityGadget _updateCollageView](self, "_updateCollageView");
  if (-[PXSharedAlbumActivityGadget isContentViewLaidOut](self, "isContentViewLaidOut"))
  {
    -[PXSharedAlbumActivityGadget contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "focusInfoChangeHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v5;
    if (v5)
    {
      (*((void (**)(id))v5 + 2))(v5);
      v4 = v5;
    }

  }
}

- (void)contentViewDidDisappear
{
  id v2;

  -[PXSharedAlbumActivityGadget collageView](self, "collageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetViewState");

}

- (unint64_t)gadgetType
{
  return 4;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (void)userDidSelectGadget
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXSharedAlbumActivityGadget collageView](self, "collageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumActivityGadget assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "displayAssetViewWithAsset:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumActivityGadget _navigateToAssetView:](self, "_navigateToAssetView:", v5);

  }
}

- (_PXSharedAlbumActivityGadgetContentView)contentView
{
  _PXSharedAlbumActivityGadgetContentView *contentView;
  _PXSharedAlbumActivityGadgetContentView *v4;
  _PXSharedAlbumActivityGadgetContentView *v5;
  void *v6;
  _PXSharedAlbumActivityGadgetContentView *v7;
  void *v8;
  _PXSharedAlbumActivityGadgetContentView *v9;
  void *v10;
  _PXSharedAlbumActivityGadgetContentView *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  contentView = self->_contentView;
  if (!contentView)
  {
    -[PXSharedAlbumActivityGadget setWasAskedToLoadContentData:](self, "setWasAskedToLoadContentData:", 1);
    -[PXSharedAlbumActivityGadget _loadContentFromSectionInfo](self, "_loadContentFromSectionInfo");
    v4 = objc_alloc_init(_PXSharedAlbumActivityGadgetContentView);
    v5 = self->_contentView;
    self->_contentView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXSharedAlbumActivityGadgetContentView setBackgroundColor:](self->_contentView, "setBackgroundColor:", v6);

    v7 = self->_contentView;
    -[PXSharedAlbumActivityGadget headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXSharedAlbumActivityGadgetContentView addSubview:](v7, "addSubview:", v8);

    v9 = self->_contentView;
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXSharedAlbumActivityGadgetContentView addSubview:](v9, "addSubview:", v10);

    v11 = self->_contentView;
    -[PXSharedAlbumActivityGadget captionLabel](self, "captionLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXSharedAlbumActivityGadgetContentView addSubview:](v11, "addSubview:", v12);

    objc_initWeak(&location, self);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __42__PXSharedAlbumActivityGadget_contentView__block_invoke;
    v19 = &unk_1E5148D30;
    objc_copyWeak(&v20, &location);
    -[_PXSharedAlbumActivityGadgetContentView setLayoutSubviewsHandler:](self->_contentView, "setLayoutSubviewsHandler:", &v16);
    -[PXSharedAlbumActivityGadget caption](self, "caption", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumActivityGadget captionLabel](self, "captionLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAttributedText:", v13);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void)setVisibleContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_visibleContentRect))
  {
    self->_visibleContentRect.origin.x = x;
    self->_visibleContentRect.origin.y = y;
    self->_visibleContentRect.size.width = width;
    self->_visibleContentRect.size.height = height;
    -[PXSharedAlbumActivityGadget _updateCollageViewVideoEnabled](self, "_updateCollageViewVideoEnabled");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXSharedAlbumActivityGadget _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)uniqueGadgetIdentifier
{
  void *v2;
  void *v3;

  -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 14;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v5 = a4;
  -[PXSharedAlbumActivityGadget assetsDataSourceManager](self, "assetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForAssetReference:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (v9 = objc_msgSend(v8, "item"),
        v9 < +[PXAssetCollageView maximumNumberOfItems](PXAssetCollageView, "maximumNumberOfItems")))
  {
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayAssetViewWithAsset:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bounds");
  }
  else
  {
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    PXRectGetCenter();
    PXRectWithCenterAndSize();
  }
  v17 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4620), "initWithRect:inCoordinateSpace:", v12, v13, v14, v15, v16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "currentContentsRect");
    objc_msgSend(v17, "setImageContentsRect:");
  }

  return v17;
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[PXSharedAlbumActivityGadget assetsDataSourceManager](self, "assetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForAssetReference:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (v9 = objc_msgSend(v8, "item"),
        v9 < +[PXAssetCollageView maximumNumberOfItems](PXAssetCollageView, "maximumNumberOfItems")))
  {
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayAssetViewWithAsset:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "currentImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  -[PXSharedAlbumActivityGadget setOneUpHiddenAssetReferences:](self, "setOneUpHiddenAssetReferences:", a4);
}

- (void)_updateCollageViewVideoEnabled
{
  int v3;
  int v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  void *v38;
  double v39;
  double v40;
  _BOOL4 v41;
  CGFloat v42;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v47, "allowVideoPlayback");
  v4 = objc_msgSend(v47, "allowLoopPlayback");
  v5 = objc_msgSend(v47, "allowGIFPlayback");
  -[PXSharedAlbumActivityGadget collageView](self, "collageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0 || (v4 & 1) != 0 || v5)
  {
    -[PXSharedAlbumActivityGadget visibleContentRect](self, "visibleContentRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[PXSharedAlbumActivityGadget contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:fromView:", v18, v11, v13, v15, v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(v6, "bounds");
    v55.origin.x = v27;
    v55.origin.y = v28;
    v55.size.width = v29;
    v55.size.height = v30;
    v48.origin.x = v20;
    v48.origin.y = v22;
    v48.size.width = v24;
    v48.size.height = v26;
    v49 = CGRectIntersection(v48, v55);
    y = v49.origin.y;
    x = v49.origin.x;
    height = v49.size.height;
    width = v49.size.width;
    objc_msgSend(v6, "bounds");
    v42 = v31;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "minimumVisibilityForVideoPlayback");
    v40 = v39;

    v50.origin.x = v11;
    v50.origin.y = v13;
    v50.size.width = v15;
    v50.size.height = v17;
    if (CGRectIsEmpty(v50))
      goto LABEL_9;
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    if (CGRectIsEmpty(v51))
      goto LABEL_9;
    v52.origin.x = v42;
    v52.origin.y = v33;
    v52.size.width = v35;
    v52.size.height = v37;
    if (CGRectIsEmpty(v52)
      || (v53.origin.x = x, v53.origin.y = y,
                            v53.size.width = width,
                            v53.size.height = height,
                            CGRectGetWidth(v53) < v40))
    {
LABEL_9:
      v41 = 0;
    }
    else
    {
      v54.origin.x = x;
      v54.origin.y = y;
      v54.size.width = width;
      v54.size.height = height;
      v41 = CGRectGetHeight(v54) >= v40;
    }
    v9 = v3 & v41;
    v8 = v4 & v41;
    v7 = v5 & v41;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  objc_msgSend(v6, "setAllowVideoPlayback:", v9);
  objc_msgSend(v6, "setAllowLoopPlayback:", v8);
  objc_msgSend(v6, "setAllowAnimatedImagePlayback:", v7);

}

- (void)setOneUpHiddenAssetReferences:(id)a3
{
  NSSet *v4;
  char v5;
  NSSet *v6;
  NSSet *oneUpHiddenAssetReferences;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v4 = self->_oneUpHiddenAssetReferences;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSSet *)-[NSSet copy](v8, "copy");
      oneUpHiddenAssetReferences = self->_oneUpHiddenAssetReferences;
      self->_oneUpHiddenAssetReferences = v6;

      -[PXSharedAlbumActivityGadget _updateCollageViewHiddenAssets](self, "_updateCollageViewHiddenAssets");
    }
  }

}

- (void)_updateCollageViewHiddenAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXSharedAlbumActivityGadget oneUpHiddenAssetReferences](self, "oneUpHiddenAssetReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedAlbumActivityGadget collageView](self, "collageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumActivityGadget assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__PXSharedAlbumActivityGadget__updateCollageViewHiddenAssets__block_invoke_2;
  v9[3] = &unk_1E51314D8;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

- (void)_loadContentFromSectionInfo
{
  void *v3;

  -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reload");

  -[PXSharedAlbumActivityGadget _loadAssets](self, "_loadAssets");
  -[PXSharedAlbumActivityGadget _loadCaption](self, "_loadCaption");
}

- (void)setAssets:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_assets != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_assets, a3);
    -[PXSharedAlbumActivityGadget _updateCollageView](self, "_updateCollageView");
    v5 = v6;
  }

}

- (void)setCaption:(id)a3
{
  NSAttributedString *v4;
  void *v5;
  char v6;
  NSAttributedString *v7;
  NSAttributedString *caption;
  void *v9;
  NSAttributedString *v10;

  v10 = (NSAttributedString *)a3;
  v4 = self->_caption;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_5;
  v6 = -[NSAttributedString isEqual:](v10, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSAttributedString *)-[NSAttributedString copy](v10, "copy");
    caption = self->_caption;
    self->_caption = v7;

    if (-[PXSharedAlbumActivityGadget isContentViewLoaded](self, "isContentViewLoaded"))
    {
      -[PXSharedAlbumActivityGadget captionLabel](self, "captionLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAttributedText:", v10);

      -[PXSharedAlbumActivityGadget delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "gadget:didChange:", self, 64);
LABEL_5:

    }
  }

}

- (BOOL)isContentViewLoaded
{
  return self->_contentView != 0;
}

- (void)_layoutContentView
{
  void *v3;

  -[PXSharedAlbumActivityGadget contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PXSharedAlbumActivityGadget _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);

  -[PXSharedAlbumActivityGadget setIsContentViewLaidOut:](self, "setIsContentViewLaidOut:", 1);
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  -[PXSharedAlbumActivityGadget captionLabel](self, "captionLabel", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", -[PXSharedAlbumActivityGadget _numberOfLinesForCaption](self, "_numberOfLinesForCaption"));
  objc_msgSend(v5, "setHidden:", -[PXSharedAlbumActivityGadget _isAccessibilityContentSize](self, "_isAccessibilityContentSize"));
  -[PXSharedAlbumActivityGadget _loadCaption](self, "_loadCaption");
  -[PXSharedAlbumActivityGadget delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (PXPhotoKitAssetsDataSourceManager)assetsDataSourceManager
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PXPhotosDataSourceConfiguration *v13;
  PXPhotosDataSource *v14;
  PXPhotoKitAssetsDataSourceManager *v15;
  PXPhotoKitAssetsDataSourceManager *assetsDataSourceManager;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_assetsDataSourceManager)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSystemPhotoLibrary");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CD13B8];
      -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc(MEMORY[0x1E0CD1620]);
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v11, *MEMORY[0x1E0CD1B98], 0, CFSTR("For You One Up Collection"), 0);

      v13 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v12, 0);
      v14 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v13);
      v15 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v14);
      assetsDataSourceManager = self->_assetsDataSourceManager;
      self->_assetsDataSourceManager = v15;

    }
  }
  return self->_assetsDataSourceManager;
}

- (void)_updateCollageView
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  if (-[PXSharedAlbumActivityGadget isContentViewLoaded](self, "isContentViewLoaded"))
  {
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resetViewState");
    -[PXSharedAlbumActivityGadget assets](self, "assets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    v5 = +[PXAssetCollageView maximumNumberOfItems](PXAssetCollageView, "maximumNumberOfItems");
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXSharedAlbumActivityGadget collageView](self, "collageView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAsset:forItemAtIndex:", v8, i);

      }
    }
    -[PXSharedAlbumActivityGadget _updateCollageViewHiddenAssets](self, "_updateCollageViewHiddenAssets");
    -[PXSharedAlbumActivityGadget _updateCollageViewVideoEnabled](self, "_updateCollageViewVideoEnabled");

  }
}

- (unint64_t)_numberOfLinesForCaption
{
  if (-[PXSharedAlbumActivityGadget _isAccessibilityContentSize](self, "_isAccessibilityContentSize"))
    return 2;
  else
    return 1;
}

- (BOOL)_isAccessibilityContentSize
{
  void *v2;
  NSString *v3;
  BOOL IsAccessibilityCategory;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_loadAssets
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isSystemPhotoLibrary"))
  {
    -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PXAssetCollageView maximumNumberOfItems](PXAssetCollageView, "maximumNumberOfItems");
    v7 = objc_msgSend(v4, "count");
    if (v6 >= v7)
      v8 = v7;
    else
      v8 = v6;
    objc_msgSend(v5, "subarrayWithRange:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PXMap();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v15, v12, 0, 0, 1);

    PXMap();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumActivityGadget setAssets:](self, "setAssets:", v14);

  }
}

- (void)_loadCaption
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfItems") < 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v3, "captionForItemAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3498]);
      PXLocalizedStringFromTable(CFSTR("PXForYouActivityCaptionQuote"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v6, CFSTR("%@"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXActivitySpec sharedAlbumActivityGadgetCaptionTextAttributes](PXActivitySpec, "sharedAlbumActivityGadgetCaptionTextAttributes", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v5, "initWithString:attributes:", v7, v8);

    }
    else
    {
      v10 = 0;
    }

    v9 = v10;
  }
  v11 = v9;
  -[PXSharedAlbumActivityGadget setCaption:](self, "setCaption:", v9);

}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, double);
  BOOL v17;
  double v18;
  CGFloat v19;
  CGFloat MaxY;
  void *v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double MaxX;
  double MinX;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat x;
  CGFloat y;
  CGFloat v53;
  CGFloat v54;
  CGFloat rect;
  _QWORD aBlock[5];
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  CGSize result;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  -[PXSharedAlbumActivityGadget contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v11 = v10;

  if (v11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");

  }
  -[PXSharedAlbumActivityGadget headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumActivityGadget collageView](self, "collageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumActivityGadget captionLabel](self, "captionLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v58 = (double *)&v57;
  v59 = 0x2020000000;
  v60 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PXSharedAlbumActivityGadget__performLayoutInRect_updateSubviewFrames___block_invoke;
  aBlock[3] = &unk_1E5143A58;
  aBlock[4] = &v57;
  v16 = (void (**)(_QWORD, double))_Block_copy(aBlock);
  v17 = -[PXSharedAlbumActivityGadget _isAccessibilityContentSize](self, "_isAccessibilityContentSize");
  v50 = height;
  objc_msgSend(v13, "sizeThatFits:", width, height);
  v19 = v18;
  v62.origin.x = 0.0;
  v62.origin.y = 0.0;
  v62.size.width = width;
  v62.size.height = v19;
  MaxY = CGRectGetMaxY(v62);
  v16[2](v16, MaxY);
  rect = v58[3];
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = width;
  if ((objc_msgSend(v21, "useSquareSharedAlbumActivity") & 1) == 0)
  {
    PXFloatRoundToPixel();
    v22 = v23;
  }

  v63.origin.x = 0.0;
  v63.origin.y = rect;
  v63.size.width = width;
  v63.size.height = v22;
  v24 = CGRectGetMaxY(v63);
  v16[2](v16, v24);
  v26 = *MEMORY[0x1E0C9D648];
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v53 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v54 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (!v17)
  {
    -[PXSharedAlbumActivityGadget caption](self, "caption");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      +[PXActivitySpec sharedAlbumActivityGadgetCaptionTextAttributes](PXActivitySpec, "sharedAlbumActivityGadgetCaptionTextAttributes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXActivitySpec captionDynamicDistance](PXActivitySpec, "captionDynamicDistance");
      v31 = v30;
      objc_msgSend(v29, "lineHeight");
      v33 = v32;
      v34 = v58[3];
      objc_msgSend(v29, "descender");
      v36 = v35;
      objc_msgSend(v15, "sizeThatFits:", width, 1.79769313e308);
      v54 = v37;
      v25 = v31 + v34 - (v33 + v36);
      v64.origin.x = 0.0;
      v64.origin.y = v25;
      v64.size.width = width;
      v64.size.height = v54;
      v38 = CGRectGetMaxY(v64);
      v16[2](v16, v38);

      v26 = 0.0;
      v53 = width;
    }
  }
  if (v4)
  {
    v39 = 0.0;
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v8, "semanticContentAttribute")) == 1)
    {
      v65.origin.x = x;
      v65.origin.y = y;
      v65.size.width = width;
      v65.size.height = v50;
      MaxX = CGRectGetMaxX(v65);
      v66.origin.x = 0.0;
      v66.origin.y = 0.0;
      v66.size.width = width;
      v66.size.height = v19;
      v49 = CGRectGetWidth(v66);
      v67.origin.x = 0.0;
      v67.origin.y = 0.0;
      v67.size.width = width;
      v67.size.height = v19;
      MinX = CGRectGetMinX(v67);
      v68.origin.x = v26;
      v68.origin.y = v25;
      v68.size.width = v53;
      v68.size.height = v54;
      CGRectGetWidth(v68);
      v69.origin.x = v26;
      v69.origin.y = v25;
      v69.size.width = v53;
      v69.size.height = v54;
      CGRectGetMinX(v69);
      v39 = MaxX - v49 - MinX;
    }
    if (v17)
    {
      v70.origin.x = x;
      v70.origin.y = y;
      v70.size.width = width;
      v70.size.height = v50;
      v42 = CGRectGetHeight(v70);
      v71.origin.x = 0.0;
      v71.origin.y = rect;
      v71.size.width = width;
      v71.size.height = v22;
      v72.origin.y = v42 - CGRectGetHeight(v71);
      v72.origin.x = 0.0;
      v72.size.width = width;
      v72.size.height = v22;
      CGRectGetMinY(v72);
      v73.origin.y = 0.0;
      v73.origin.x = v39;
      v73.size.width = width;
      v73.size.height = v19;
      CGRectGetMinY(v73);
    }
    PXRectRoundToPixel();
    objc_msgSend(v13, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v14, "setFrame:");
    PXRectRoundToPixel();
    objc_msgSend(v15, "setFrame:");
    objc_msgSend(v14, "cornerRadius");
    +[PXFocusInfo focusInfoWithView:cornerRadius:cornerCurve:](PXFocusInfo, "focusInfoWithView:cornerRadius:cornerCurve:", v14, *MEMORY[0x1E0CD2A60]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFocusInfo:", v43);

    objc_msgSend(v8, "focusInfoChangeHandler");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
      (*(void (**)(uint64_t))(v44 + 16))(v44);

  }
  v46 = v58[3];

  _Block_object_dispose(&v57, 8);
  v47 = width;
  v48 = v46;
  result.height = v48;
  result.width = v47;
  return result;
}

- (void)_handleActionTap:(id)a3
{
  void *v4;
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
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;

  if (objc_msgSend(a3, "state") != 3)
    return;
  -[PXSharedAlbumActivityGadget delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadgetTransition");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("transition"), v18);
LABEL_10:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PXUIGadgetTransition * _Nonnull PXUIGadgetTransitionFromPXGadgetTransition(id<PXGadgetTransition>  _Nonnull __strong)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXUIGadgetTransition.h"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("transition"), v18, v20);

    goto LABEL_10;
  }
LABEL_4:

  objc_msgSend(v21, "gridPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXSharedAlbumActivityGadget assetsSectionInfo](self, "assetsSectionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedAlbum");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "createPhotosAlbumViewControllerForAlbum:withFetchResult:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumActivityGadget delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "gadgetViewControllerHostingGadget:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "navigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pushViewController:animated:", v11, 1);

  }
}

- (void)_handleCollageViewTap:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == 3)
  {
    -[PXSharedAlbumActivityGadget collageView](self, "collageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v4);
    objc_msgSend(v4, "displayAssetViewAtPoint:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedAlbumActivityGadget _navigateToAssetView:](self, "_navigateToAssetView:", v5);

  }
}

- (void)_navigateToAssetView:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  PXSharedAlbumActivityGadget *v18;
  SEL v19;
  uint8_t buf[4];
  PXSharedAlbumActivityGadget *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(a3, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        PXNavigableSharedAlbumActivityFeedHostViewControllerForGadget(self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          PXAssertGetLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = self;
            _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "couldn't find PXNavigableSharedAlbumActivityFeedHostViewController for %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pl_managedAssetFromPhotoLibrary:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = MEMORY[0x1E0C809B0];
        v13 = 3221225472;
        v14 = __52__PXSharedAlbumActivityGadget__navigateToAssetView___block_invoke;
        v15 = &unk_1E5131540;
        v16 = v5;
        v17 = v9;
        v18 = self;
        v19 = a2;
        v10 = v9;
        objc_msgSend(v6, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", 1, &v12, 0);
        +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance", v12, v13, v14, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logForYouNavigatedToSharedAlbumActivityViewFromCollageView");

        objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.navigatedToSharedAlbumActivityViewFromCollageView"), MEMORY[0x1E0C9AA70]);
      }
    }

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;

  v9 = a3;
  v6 = a4;
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v9)
    goto LABEL_4;
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("useSquareSharedAlbumActivity"));

  if (v8)
  {
    -[PXSharedAlbumActivityGadget delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gadget:didChange:", self, 64);
LABEL_4:

  }
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXFeedAssetsSectionInfo)assetsSectionInfo
{
  return self->_assetsSectionInfo;
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isContentViewLaidOut
{
  return self->_isContentViewLaidOut;
}

- (void)setIsContentViewLaidOut:(BOOL)a3
{
  self->_isContentViewLaidOut = a3;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (void)setCollageView:(id)a3
{
  objc_storeStrong((id *)&self->_collageView, a3);
}

- (void)setCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabel, a3);
}

- (BOOL)wasAskedToLoadContentData
{
  return self->_wasAskedToLoadContentData;
}

- (void)setWasAskedToLoadContentData:(BOOL)a3
{
  self->_wasAskedToLoadContentData = a3;
}

- (void)setAssetsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetsDataSourceManager, a3);
}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PXAssetReference)currentAssetReference
{
  return self->_currentAssetReference;
}

- (void)setCurrentAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetReference, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSAttributedString)caption
{
  return self->_caption;
}

- (NSSet)oneUpHiddenAssetReferences
{
  return self->_oneUpHiddenAssetReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneUpHiddenAssetReferences, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_currentAssetReference, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_collageView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_assetsSectionInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

void __52__PXSharedAlbumActivityGadget__navigateToAssetView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32)
    && objc_msgSend(v3, "cloudFeedAssetIsAvailableForNavigation:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v4, "navigateToRevealCloudFeedAsset:completion:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "couldn't scroll feed to asset %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

uint64_t __72__PXSharedAlbumActivityGadget__performLayoutInRect_updateSubviewFrames___block_invoke(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) < a2)
    *(double *)(v2 + 24) = a2;
  return result;
}

id __42__PXSharedAlbumActivityGadget__loadAssets__block_invoke_2(int a1, id a2)
{
  return a2;
}

uint64_t __42__PXSharedAlbumActivityGadget__loadAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

uint64_t __61__PXSharedAlbumActivityGadget__updateCollageViewHiddenAssets__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "setHidden:forItemAtIndex:", objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2), a3);
}

uint64_t __61__PXSharedAlbumActivityGadget__updateCollageViewHiddenAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asset");
}

void __42__PXSharedAlbumActivityGadget_contentView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_layoutContentView");

}

uint64_t __78__PXSharedAlbumActivityGadget_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCollageViewVideoEnabled");
}

+ (void)preloadResources
{
  +[PXSharedAlbumHeaderView preloadResources](PXSharedAlbumHeaderView, "preloadResources");
}

@end
