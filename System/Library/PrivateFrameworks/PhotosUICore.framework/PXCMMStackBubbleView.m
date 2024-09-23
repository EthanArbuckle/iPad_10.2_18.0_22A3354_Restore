@implementation PXCMMStackBubbleView

- (PXCMMStackBubbleView)initWithFrame:(CGRect)a3
{
  PXCMMStackBubbleView *v3;
  void *v4;
  uint64_t v5;
  PXPhotoKitUIMediaProvider *mediaProvider;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCMMStackBubbleView;
  v3 = -[PXCMMStackBubbleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v3->_mediaProvider;
    v3->_mediaProvider = (PXPhotoKitUIMediaProvider *)v5;

    v3->_maximumHeight = 1.79769313e308;
  }
  return v3;
}

- (PXCMMStackBubbleView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStackBubbleView.m"), 43, CFSTR("%s is not available as initializer"), "-[PXCMMStackBubbleView initWithCoder:]");

  abort();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[PXCMMStackBubbleView maximumHeight](self, "maximumHeight");
  if (height >= v5)
    height = v5;
  objc_msgSend((id)objc_opt_class(), "sizeThatFits:", width, height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setMomentShare:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((-[PHMomentShare isEqual:](self->_momentShare, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_momentShare, a3);
    if (v8)
    {
      PXCuratedAssetsWithFallbackForMomentShare(v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = 0;
      +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:", v8, v5, 0, 0, 0, 0, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "status") == 2)
        objc_msgSend(v8, "acceptMomentShareWithCompletion:", &__block_literal_global_160161);

    }
    else
    {
      v6 = 0;
    }
    -[PXCMMStackBubbleView setDataSourceManager:](self, "setDataSourceManager:", v6);

  }
}

- (void)setDataSourceManager:(id)a3
{
  PXPhotoKitAssetsDataSourceManager *v5;
  PXPhotoKitAssetsDataSourceManager *dataSourceManager;
  PXPhotoKitAssetsDataSourceManager *v7;

  v5 = (PXPhotoKitAssetsDataSourceManager *)a3;
  dataSourceManager = self->_dataSourceManager;
  if (dataSourceManager != v5)
  {
    v7 = v5;
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](dataSourceManager, "unregisterChangeObserver:context:", self, DataSourceManagerObservationContext_160150);
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_dataSourceManager, "registerChangeObserver:context:", self, DataSourceManagerObservationContext_160150);
    -[PXCMMStackBubbleView _updateSubviews](self, "_updateSubviews");
    v5 = v7;
  }

}

- (void)_updateSubviews
{
  void *v3;
  void *v4;
  int v5;
  PXMessagesStackView *stackView;
  PXMessagesStackView *v7;
  PXMessagesStackView *v8;
  PXMessagesStackView *v9;
  void *v10;
  void *v11;
  UIActivityIndicatorView *activityIndicatorView;
  UIActivityIndicatorView *v13;
  PXMessagesStackView *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *v16;

  -[PXCMMStackBubbleView dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsAnyItems");

  stackView = self->_stackView;
  if (v5)
  {
    if (!stackView)
    {
      v7 = [PXMessagesStackView alloc];
      v8 = -[PXMessagesStackView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_stackView;
      self->_stackView = v8;

      -[PXCMMStackBubbleView mediaProvider](self, "mediaProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMessagesStackView setMediaProvider:](self->_stackView, "setMediaProvider:", v10);

      -[PXCMMStackBubbleView dataSourceManager](self, "dataSourceManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXBaseMessagesStackView setDataSourceManager:](self->_stackView, "setDataSourceManager:", v11);

      -[PXCMMStackBubbleView addSubview:](self, "addSubview:", self->_stackView);
    }
    activityIndicatorView = self->_activityIndicatorView;
    if (activityIndicatorView)
    {
      -[UIActivityIndicatorView removeFromSuperview](activityIndicatorView, "removeFromSuperview");
      v13 = self->_activityIndicatorView;
      self->_activityIndicatorView = 0;

    }
  }
  else
  {
    if (stackView)
    {
      -[PXMessagesStackView removeFromSuperview](stackView, "removeFromSuperview");
      v14 = self->_stackView;
      self->_stackView = 0;

    }
    if (!self->_activityIndicatorView)
    {
      v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
      v16 = self->_activityIndicatorView;
      self->_activityIndicatorView = v15;

      -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
      -[PXCMMStackBubbleView addSubview:](self, "addSubview:", self->_activityIndicatorView);
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[PXCMMStackBubbleView bounds](self, "bounds");
  -[PXMessagesStackView setFrame:](self->_stackView, "setFrame:");
  -[PXCMMStackBubbleView bounds](self, "bounds");
  -[UIActivityIndicatorView setFrame:](self->_activityIndicatorView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)PXCMMStackBubbleView;
  -[PXCMMStackBubbleView layoutSubviews](&v3, sel_layoutSubviews);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)DataSourceManagerObservationContext_160150 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMStackBubbleView.m"), 125, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXCMMStackBubbleView _updateSubviews](self, "_updateSubviews");
    v9 = v11;
  }

}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (PXPhotoKitAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

void __39__PXCMMStackBubbleView_setMomentShare___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLSharingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Failed to accept CMM with error %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (CGSize)sizeThatFits:(CGSize)a3
{
  JUMPOUT(0x1A85CD660);
}

@end
