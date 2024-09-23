@implementation PXForYouSuggestionGadget

- (PXForYouSuggestionGadget)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionGadget.m"), 78, CFSTR("%s is not available as initializer"), "-[PXForYouSuggestionGadget init]");

  abort();
}

- (PXForYouSuggestionGadget)initWithSuggestion:(id)a3
{
  id v5;
  PXForYouSuggestionGadget *v6;
  PXForYouSuggestionGadget *v7;
  id v8;
  void *v9;
  uint64_t v10;
  PXUIMediaProvider *mediaProvider;
  PXPhotoKitUIMediaProvider *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXForYouSuggestionGadget;
  v6 = -[PXForYouSuggestionGadget init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestion, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      objc_msgSend(v8, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      mediaProvider = v7->_mediaProvider;
      v7->_mediaProvider = (PXUIMediaProvider *)v10;

    }
    else
    {
      v12 = objc_alloc_init(PXPhotoKitUIMediaProvider);
      v9 = v7->_mediaProvider;
      v7->_mediaProvider = &v12->super;
    }

    -[PXForYouSuggestionGadget _updateKeyAsset](v7, "_updateKeyAsset");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXForYouSuggestionGadget;
  -[PXForYouSuggestionGadget dealloc](&v4, sel_dealloc);
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[PXForYouSuggestionGadget setCachedHeightForWidth:](self, "setCachedHeightForWidth:", a3, *(double *)off_1E50B8810, *((double *)off_1E50B8810 + 1));
  -[PXForYouSuggestionGadget delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gadget:didChange:", self, 64);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXForYouSuggestionGadget cachedHeightForWidth](self, "cachedHeightForWidth");
  v7 = v6;
  v9 = v8;
  if ((PXSizeIsNull() & 1) != 0 || v7 != width)
  {
    -[PXForYouSuggestionGadget suggestion](self, "suggestion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadget title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadget subtitle](self, "subtitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXForYouSuggestionGadgetContentView sizeThatFits:withSuggestion:title:subtitle:](PXForYouSuggestionGadgetContentView, "sizeThatFits:withSuggestion:title:subtitle:", v10, v11, v12, width, height);
    v7 = v13;
    v9 = v14;

    -[PXForYouSuggestionGadget setCachedHeightForWidth:](self, "setCachedHeightForWidth:", v7, v9);
  }
  v15 = v7;
  v16 = v9;
  result.height = v16;
  result.width = v15;
  return result;
}

- (PXRegionOfInterest)regionOfInterestForOneUpTransition
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v12;
  void *v13;

  -[PXForYouSuggestionGadget contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionGadget.m"), 142, CFSTR("%@ asked for ROI for 1-Up transition, but our view is not loaded!"), v13);

    abort();
  }
  v5 = v4;
  objc_msgSend(v4, "assetContentBoundsInCoordinateSpace:", v4);
  v10 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B4620), "initWithRect:inCoordinateSpace:", v5, v6, v7, v8, v9);
  objc_msgSend(v5, "assetContentsRect");
  objc_msgSend(v10, "setImageContentsRect:");

  return (PXRegionOfInterest *)v10;
}

- (void)setContentHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_contentHidden != a3)
  {
    v3 = a3;
    self->_contentHidden = a3;
    -[PXForYouSuggestionGadget contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAssetContentHidden:", v3);

  }
}

- (UIImage)currentImage
{
  void *v2;
  void *v3;

  -[PXForYouSuggestionGadget contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAssetImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  void *v6;
  BOOL v7;
  PXGadgetSpec *v8;

  v8 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  v6 = v8;
  if (v5 == v8)
    goto LABEL_5;
  v7 = -[PXGadgetSpec isEqual:](v8, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    if (self->_contentView)
    {
      -[PXForYouSuggestionGadget contentView](self, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setGadgetSpec:", v8);
LABEL_5:

    }
  }

}

- (PXForYouSuggestionGadgetContentView)contentView
{
  PXForYouSuggestionGadgetContentView *contentView;
  PXForYouSuggestionGadgetContentView *v4;
  PXForYouSuggestionGadgetContentView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc_init(PXForYouSuggestionGadgetContentView);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[PXForYouSuggestionGadget suggestion](self, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setSuggestion:](self->_contentView, "setSuggestion:", v6);

    -[PXForYouSuggestionGadget mediaProvider](self, "mediaProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setMediaProvider:](self->_contentView, "setMediaProvider:", v7);

    -[PXForYouSuggestionGadget gadgetSpec](self, "gadgetSpec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setGadgetSpec:](self->_contentView, "setGadgetSpec:", v8);

    -[PXForYouSuggestionGadget keyAsset](self, "keyAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setKeyAsset:](self->_contentView, "setKeyAsset:", v9);

    -[PXForYouSuggestionGadgetContentView setBlursDegradedContent:](self->_contentView, "setBlursDegradedContent:", -[PXForYouSuggestionGadget blursDegradedContent](self, "blursDegradedContent"));
    -[PXForYouSuggestionGadget title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setTitle:](self->_contentView, "setTitle:", v10);

    -[PXForYouSuggestionGadget subtitle](self, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadgetContentView setSubtitle:](self->_contentView, "setSubtitle:", v11);

    -[PXForYouSuggestionGadget _updateSyndicationHighlightForContentView:](self, "_updateSyndicationHighlightForContentView:", self->_contentView);
    -[PXForYouSuggestionGadget _updateContentViewMode](self, "_updateContentViewMode");
    contentView = self->_contentView;
  }
  return contentView;
}

- (unint64_t)gadgetType
{
  return 10;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (id)uniqueGadgetIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "localIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Suggestion-%@-%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)contentHasBeenSeen
{
  id v2;

  +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logForYouSuggestionViewedCount");

}

- (void)contentViewWillAppear
{
  -[PXForYouSuggestionGadget setContentViewVisible:](self, "setContentViewVisible:", 1);
}

- (void)contentViewDidDisappear
{
  -[PXForYouSuggestionGadget setContentViewVisible:](self, "setContentViewVisible:", 0);
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
    -[PXForYouSuggestionGadget _updateContentViewMode](self, "_updateContentViewMode");
  }
}

- (id)debugURLsForDiagnostics
{
  id v3;
  objc_class *v4;
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
  int v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD1698];
  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuidFromLocalIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Summary-%@.txt"), v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget debugDictionary](self, "debugDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v24 = v9;
    objc_msgSend(v14, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v5, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v18 = objc_msgSend(v17, "writeToURL:atomically:encoding:error:", v13, 1, 4, &v25);
    v19 = v25;
    if (v18)
    {
      objc_msgSend(v3, "addObject:", v13);
    }
    else
    {
      PLUIGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v5;
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "%@ failed to save tap-to-radar info, error: %@", buf, 0x16u);
      }

    }
    v9 = v24;
  }
  if (objc_msgSend(v3, "count"))
    v21 = v3;
  else
    v21 = (void *)MEMORY[0x1E0C9AA60];
  v22 = v21;

  return v22;
}

- (id)debugDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchKeyAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "playbackStyle");
  if (v7 <= 5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", off_1E5137808[v7], CFSTR("Playback style"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailedDebugDescriptionInLibrary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("Suggestion asset debug description"));
  }
  objc_msgSend(v4, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Suggestion"));

  return v3;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PXForYouSuggestionGadget delegate](self, "delegate", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget mediaProvider](self, "mediaProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionGadgetPreviewController:withMediaProvider:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXForYouSuggestionGadget contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetContentBoundsInCoordinateSpace:", v8);
  objc_msgSend(v8, "convertRect:toCoordinateSpace:", v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  v19.x = x;
  v19.y = y;
  if (CGRectContainsPoint(v20, v19))
  {
    objc_msgSend(v8, "previewAssetView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)commitPreviewViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXForYouSuggestionGadget delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionGadget:commitViewController:", self, v4);

}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PXForYouSuggestionGadget delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionGadget:didDismissPreviewController:committing:", self, v6, v4);

}

- (void)_updateContentViewMode
{
  _BOOL4 v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = -[PXForYouSuggestionGadget contentViewVisible](self, "contentViewVisible");
  -[PXForYouSuggestionGadget contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  if (v3)
  {
    -[PXForYouSuggestionGadget visibleContentRect](self, "visibleContentRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v25, "assetContentBoundsInCoordinateSpace:", v25);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    v31.origin.x = v6;
    v31.origin.y = v8;
    v31.size.width = v10;
    v31.size.height = v12;
    v27 = CGRectIntersection(v26, v31);
    v17 = v27.origin.x;
    v18 = v27.origin.y;
    v19 = v27.size.width;
    v20 = v27.size.height;
    if (CGRectIsEmpty(v27))
      goto LABEL_5;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    if (CGRectIsEmpty(v28))
      goto LABEL_5;
    +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "minimumVisibilityForVideoPlayback");
    v23 = v22;

    v29.origin.x = v17;
    v29.origin.y = v18;
    v29.size.width = v19;
    v29.size.height = v20;
    if (CGRectGetWidth(v29) < v23)
    {
LABEL_5:
      v24 = 1;
    }
    else
    {
      v30.origin.x = v17;
      v30.origin.y = v18;
      v30.size.width = v19;
      v30.size.height = v20;
      v24 = ~(CGRectGetHeight(v30) >= v23) & 1;
    }
    v4 = v25;
  }
  else
  {
    v24 = 2;
  }
  objc_msgSend(v4, "setMode:", v24);

}

- (void)_updateTitleAndSubtitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget keyAsset](self, "keyAsset");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  v7 = 0;
  if (v3 && v4)
  {
    if (objc_msgSend(v3, "subtype") == 401)
    {
      objc_msgSend(v3, "localizedTitle");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedSubtitle");
      v8 = objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v6 = (void *)v8;
    }
    else
    {
      objc_msgSend(v5, "localizedGeoDescription");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "creationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v9, 2, 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

      v7 = v11;
    }
  }
  v12 = v7;
  -[PXForYouSuggestionGadget setTitle:](self, "setTitle:", v7);
  -[PXForYouSuggestionGadget setSubtitle:](self, "setSubtitle:", v6);

}

- (id)_contentViewIfLoaded
{
  return self->_contentView;
}

- (void)userDidSelectGadget
{
  void *v3;
  id v4;

  -[PXForYouSuggestionGadget delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget mediaProvider](self, "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionGadgetsWantsOneUpPresentation:withMediaProvider:animated:", self, v3, -[PXForYouSuggestionGadget shouldSuppressSelectionAnimation](self, "shouldSuppressSelectionAnimation") ^ 1);

}

- (void)setContentViewVisible:(BOOL)a3
{
  if (self->_contentViewVisible != a3)
  {
    self->_contentViewVisible = a3;
    -[PXForYouSuggestionGadget _updateContentViewMode](self, "_updateContentViewMode");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *title;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  v4 = self->_title;
  v5 = v11;
  if (v4 == v11)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v11);

  if (!v7)
  {
    v8 = (NSString *)-[NSString copy](v11, "copy");
    title = self->_title;
    self->_title = v8;

    -[PXForYouSuggestionGadget _contentViewIfLoaded](self, "_contentViewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v11);

    -[PXForYouSuggestionGadget delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gadget:didChange:", self, 64);
LABEL_4:

  }
}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *subtitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  v4 = self->_subtitle;
  v5 = v11;
  if (v4 == v11)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSString isEqualToString:](v4, "isEqualToString:", v11);

  if (!v7)
  {
    v8 = (NSString *)-[NSString copy](v11, "copy");
    subtitle = self->_subtitle;
    self->_subtitle = v8;

    -[PXForYouSuggestionGadget _contentViewIfLoaded](self, "_contentViewIfLoaded");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSubtitle:", v11);

    -[PXForYouSuggestionGadget delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gadget:didChange:", self, 64);
LABEL_4:

  }
}

- (void)setBlursDegradedContent:(BOOL)a3
{
  if (self->_blursDegradedContent != a3)
  {
    self->_blursDegradedContent = a3;
    -[PXForYouSuggestionGadgetContentView setBlursDegradedContent:](self->_contentView, "setBlursDegradedContent:");
  }
}

- (void)setKeyAsset:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  PXDisplayAsset *v8;

  v8 = (PXDisplayAsset *)a3;
  if (self->_keyAsset != v8)
  {
    objc_storeStrong((id *)&self->_keyAsset, a3);
    -[PXForYouSuggestionGadget _contentViewIfLoaded](self, "_contentViewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyAsset:", v8);

    -[PXForYouSuggestionGadget _updateTitleAndSubtitle](self, "_updateTitleAndSubtitle");
    -[PXForYouSuggestionGadget _contentViewIfLoaded](self, "_contentViewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionGadget _updateSyndicationHighlightForContentView:](self, "_updateSyndicationHighlightForContentView:", v6);

    -[PXForYouSuggestionGadget setCachedHeightForWidth:](self, "setCachedHeightForWidth:", *(double *)off_1E50B8810, *((double *)off_1E50B8810 + 1));
    -[PXForYouSuggestionGadget delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "gadget:didChange:", self, 64);

  }
}

- (void)setSuggestion:(id)a3
{
  void *v5;
  PXDisplaySuggestion *v6;

  v6 = (PXDisplaySuggestion *)a3;
  if (self->_suggestion != v6)
  {
    objc_storeStrong((id *)&self->_suggestion, a3);
    -[PXForYouSuggestionGadget contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuggestion:", v6);

    -[PXForYouSuggestionGadget setCachedHeightForWidth:](self, "setCachedHeightForWidth:", *(double *)off_1E50B8810, *((double *)off_1E50B8810 + 1));
    -[PXForYouSuggestionGadget setSuggestionType:](self, "setSuggestionType:", -[PXDisplaySuggestion type](v6, "type"));
    -[PXForYouSuggestionGadget _updateKeyAsset](self, "_updateKeyAsset");
  }

}

- (void)setSuggestionType:(unsigned __int16)a3
{
  if (self->_suggestionType != a3)
  {
    self->_suggestionType = a3;
    -[PXForYouSuggestionGadget _updateTitleAndSubtitle](self, "_updateTitleAndSubtitle");
  }
}

- (id)syndicationReplyAction
{
  void *v2;
  void *v3;

  -[PXForYouSuggestionGadget contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syndicationReplyActionFromAttributionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_handleDismiss
{
  id v3;

  -[PXForYouSuggestionGadget _markSuggestionAsDeclined](self, "_markSuggestionAsDeclined");
  -[PXForYouSuggestionGadget delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gadget:didChange:", self, 32);

}

- (void)_markSuggestionAsActive
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXForYouSuggestionGadget suggestion](self, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "state"))
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__PXForYouSuggestionGadget__markSuggestionAsActive__block_invoke;
      v7[3] = &unk_1E5149198;
      v8 = v5;
      objc_msgSend(v6, "performChanges:completionHandler:", v7, &__block_literal_global_171_218229);

    }
  }
}

- (void)_markSuggestionAsDeclined
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXForYouSuggestionGadget suggestion](self, "suggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PXForYouSuggestionGadget__markSuggestionAsDeclined__block_invoke;
    v8[3] = &unk_1E5149198;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "performChanges:completionHandler:", v8, &__block_literal_global_172_218226);

  }
}

- (void)_updateKeyAsset
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "fetchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXForYouSuggestionGadget__updateKeyAsset__block_invoke;
  block[3] = &unk_1E5147280;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateSyndicationHighlightForContentView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  if (-[PXForYouSuggestionGadget shouldShowSyndicationAttributionView](self, "shouldShowSyndicationAttributionView"))
  {
    -[PXForYouSuggestionGadget keyAsset](self, "keyAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PXForYouSuggestionGadget keyAsset](self, "keyAsset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!PXContentSyndicationShouldShowAttributionViewForAsset(v7))
          {
LABEL_7:

            goto LABEL_8;
          }
LABEL_6:
          objc_msgSend(v5, "setShouldShowSyndicationAttributionView:", 1);
          +[PXContentSyndicationPhotoKitSocialLayerHighlightProvider sharedInstance](PXContentSyndicationPhotoKitSocialLayerHighlightProvider, "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __70__PXForYouSuggestionGadget__updateSyndicationHighlightForContentView___block_invoke;
          v14[3] = &unk_1E51377E0;
          v15 = v5;
          v16 = v7;
          objc_msgSend(v8, "fetchSocialLayerHighlightForAsset:completion:", v16, v14);

          goto LABEL_7;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "px_descriptionForAssertionMessage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionGadget.m"), 479, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.keyAsset"), v11, v13);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionGadget.m"), 479, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.keyAsset"), v11);
      }

      if (!PXContentSyndicationShouldShowAttributionViewForAsset(v7))
        goto LABEL_7;
      goto LABEL_6;
    }
  }
LABEL_8:

}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXDiagnosticsItemProvider *v9;
  char isKindOfClass;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget keyAsset](self, "keyAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXForYouSuggestionGadget suggestion](self, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("PXForYouSuggestionGadget"), CFSTR("PXDiagnosticsTitle"));
  v9 = objc_alloc_init(PXDiagnosticsItemProvider);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v11 = MEMORY[0x1E0C809B0];
  if ((isKindOfClass & 1) != 0)
  {
    v12 = v6;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v22[3] = &unk_1E5148158;
    v23 = v12;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v9, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAsset"), v22);
    objc_msgSend(v12, "px_curationDebugString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("Asset Info"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
    v20[3] = &unk_1E5148158;
    v21 = v14;
    -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v9, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAssetCollection"), v20);
    objc_msgSend(v14, "px_debugDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("Suggestion Info"));

  }
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3;
  v18[3] = &unk_1E5148158;
  v19 = v8;
  v16 = v8;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v9, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierDebugDictionary"), v18);
  objc_msgSend(v5, "addObject:", v9);

  return v5;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXForYouSuggestionGadgetDelegate)delegate
{
  return (PXForYouSuggestionGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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

- (PXDisplaySuggestion)suggestion
{
  return self->_suggestion;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (BOOL)blursDegradedContent
{
  return self->_blursDegradedContent;
}

- (BOOL)shouldSuppressSelectionAnimation
{
  return self->_shouldSuppressSelectionAnimation;
}

- (void)setShouldSuppressSelectionAnimation:(BOOL)a3
{
  self->_shouldSuppressSelectionAnimation = a3;
}

- (BOOL)shouldShowSyndicationAttributionView
{
  return self->_shouldShowSyndicationAttributionView;
}

- (void)setShouldShowSyndicationAttributionView:(BOOL)a3
{
  self->_shouldShowSyndicationAttributionView = a3;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PXDisplayAsset)keyAsset
{
  return self->_keyAsset;
}

- (CGSize)cachedHeightForWidth
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedHeightForWidth.width;
  height = self->_cachedHeightForWidth.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedHeightForWidth:(CGSize)a3
{
  self->_cachedHeightForWidth = a3;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (BOOL)contentViewVisible
{
  return self->_contentViewVisible;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)suggestionType
{
  return self->_suggestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

id __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __82__PXForYouSuggestionGadget_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __70__PXForYouSuggestionGadget__updateSyndicationHighlightForContentView___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "setHighlight:", a2);
  if (!a2)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Unexpected nil highlight for asset UUID: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    return objc_msgSend(*(id *)(a1 + 32), "setShouldShowSyndicationAttributionView:", 0);
  }
  return result;
}

void __43__PXForYouSuggestionGadget__updateKeyAsset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchKeyAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXForYouSuggestionGadget__updateKeyAsset__block_invoke_2;
  v5[3] = &unk_1E5147280;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __43__PXForYouSuggestionGadget__updateKeyAsset__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setKeyAsset:", v1);

}

void __53__PXForYouSuggestionGadget__markSuggestionAsDeclined__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markDeclined");

}

void __53__PXForYouSuggestionGadget__markSuggestionAsDeclined__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Error while marking suggestion as declined: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __51__PXForYouSuggestionGadget__markSuggestionAsActive__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "markActive");

}

void __51__PXForYouSuggestionGadget__markSuggestionAsActive__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "Error while marking suggestion as active: %@", (uint8_t *)&v5, 0xCu);
    }

  }
}

+ (void)preloadResources
{
  id v2;

  +[PXForYouSuggestionGadgetContentView preloadResources](PXForYouSuggestionGadgetContentView, "preloadResources");
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleTaskWithQoS:block:", 0, &__block_literal_global_218282);

}

+ (OS_dispatch_queue)fetchQueue
{
  if (fetchQueue_onceToken != -1)
    dispatch_once(&fetchQueue_onceToken, &__block_literal_global_134_218278);
  return (OS_dispatch_queue *)(id)fetchQueue_queue;
}

void __38__PXForYouSuggestionGadget_fetchQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  void *v3;
  NSObject *attr;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.PXForYouSuggestionGadget.fetchQueue", attr);
  v2 = (void *)fetchQueue_queue;
  fetchQueue_queue = (uint64_t)v1;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleTaskAfterCATransactionCommits:", &__block_literal_global_136_218281);

}

void __38__PXForYouSuggestionGadget_fetchQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)fetchQueue_queue);
}

void __44__PXForYouSuggestionGadget_preloadResources__block_invoke()
{
  if (PXPreheatMTLDevice_onceToken != -1)
    dispatch_once(&PXPreheatMTLDevice_onceToken, &__block_literal_global_195012);
}

@end
