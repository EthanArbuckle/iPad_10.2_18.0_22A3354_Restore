@implementation PXWallpaperSuggestionView

- (PXWallpaperSuggestionView)initWithFrame:(CGRect)a3
{
  PXWallpaperSuggestionView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXUIMediaProvider *mediaProvider;
  uint64_t v9;
  UIImageView *overlayView;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXWallpaperSuggestionView;
  v3 = -[PXWallpaperSuggestionView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWallpaperSuggestionView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[PXWallpaperSuggestionView setContentMode:](v3, "setContentMode:", 2);
    -[PXWallpaperSuggestionView setAccessibilityIgnoresInvertColors:](v3, "setAccessibilityIgnoresInvertColors:", 1);
    -[PXWallpaperSuggestionView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksToBounds:", 1);

    v3->_needsRoundedCorner = 1;
    v3->_showClockOverlay = 1;
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:](PXPhotoKitUIMediaProvider, "mediaProviderWithLibrary:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    mediaProvider = v3->_mediaProvider;
    v3->_mediaProvider = (PXUIMediaProvider *)v7;

    v3->_classificationMode = 0;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    overlayView = v3->_overlayView;
    v3->_overlayView = (UIImageView *)v9;

    -[UIImageView setContentMode:](v3->_overlayView, "setContentMode:", 2);
    v11 = *MEMORY[0x1E0CD2EF8];
    -[UIImageView layer](v3->_overlayView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMinificationFilter:", v11);

    objc_initWeak(&location, v3);
    v13 = (void *)objc_opt_class();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __43__PXWallpaperSuggestionView_initWithFrame___block_invoke;
    v18 = &unk_1E512B4C8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "requestSharedOverlayImageWithCompletionBlock:", &v15);
    -[PXWallpaperSuggestionView addSubview:](v3, "addSubview:", v3->_overlayView, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  PXImageRequester *v14;
  void *v15;
  PXImageRequester *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[13];

  -[PXWallpaperSuggestionView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PXWallpaperSuggestionView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  if (v8 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scale");
    v11 = v10;

  }
  else
  {
    v11 = v8;
  }

  -[PXWallpaperSuggestionView asset](self, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[PXWallpaperSuggestionView _resetImageRequester](self, "_resetImageRequester");
    goto LABEL_28;
  }
  -[PXWallpaperSuggestionView imageRequester](self, "imageRequester");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = [PXImageRequester alloc];
    -[PXWallpaperSuggestionView mediaProvider](self, "mediaProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXImageRequester initWithMediaProvider:asset:](v14, "initWithMediaProvider:asset:", v15, v12);

    -[PXWallpaperSuggestionView setImageRequester:](self, "setImageRequester:", v16);
  }
  -[PXWallpaperSuggestionView imageRequester](self, "imageRequester");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentSize");
  if ((PXSizeApproximatelyEqualToSize() & 1) == 0)
  {

    goto LABEL_12;
  }
  -[PXWallpaperSuggestionView imageRequester](self, "imageRequester");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;

  if (v11 != v20)
  {
LABEL_12:
    v21 = *(_QWORD *)off_1E50B86D0;
    v22 = *((_QWORD *)off_1E50B86D0 + 1);
    v23 = *((_QWORD *)off_1E50B86D0 + 2);
    v24 = *((_QWORD *)off_1E50B86D0 + 3);
    if ((PXSizeIsEmpty() & 1) != 0 || -[PXWallpaperSuggestionView contentMode](self, "contentMode") == 1)
      goto LABEL_27;
    v25 = v12;
    v26 = -[PXWallpaperSuggestionView cropMode](self, "cropMode");
    if (v26 == 2)
    {
      objc_msgSend(MEMORY[0x1E0D77E68], "cropVariantsForAsset:targetSize:faces:", v25, 0, v4, v6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
LABEL_24:

        goto LABEL_26;
      }
      objc_msgSend(v28, "cropRect");
    }
    else
    {
      if (v26 == 1)
      {
        objc_msgSend(v25, "suggestedCropForTargetSize:", v4, v6);
        v21 = v34;
        v22 = v35;
        v23 = v36;
        v24 = v37;
        goto LABEL_26;
      }
      if (v26)
      {
LABEL_26:

LABEL_27:
        -[PXWallpaperSuggestionView imageRequester](self, "imageRequester");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __43__PXWallpaperSuggestionView_layoutSubviews__block_invoke;
        v57[3] = &__block_descriptor_104_e35_v16__0___PXMutableImageRequester__8l;
        *(double *)&v57[4] = v4;
        *(double *)&v57[5] = v6;
        v57[6] = v21;
        v57[7] = v22;
        v57[8] = v23;
        v57[9] = v24;
        *(double *)&v57[10] = v4;
        *(double *)&v57[11] = v6;
        *(double *)&v57[12] = v11;
        objc_msgSend(v38, "performChanges:", v57);

        goto LABEL_28;
      }
      if (-[PXWallpaperSuggestionView _isPortrait](self, "_isPortrait"))
        v27 = 1;
      else
        v27 = 2;
      objc_msgSend(MEMORY[0x1E0D751A8], "deviceConfigurationForOrientation:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D77EF8], "bestWallpaperCropForAsset:classification:outputCropScore:outputLayoutAcceptable:layoutConfiguration:", v25, self->_classificationMode, 0, 0, v28);
    }
    v21 = v29;
    v22 = v30;
    v23 = v31;
    v24 = v32;
    goto LABEL_24;
  }
LABEL_28:
  if (-[PXWallpaperSuggestionView needsRoundedCorner](self, "needsRoundedCorner"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "traitCollection");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "displayCornerRadius");
    v42 = v41;
    objc_msgSend(v39, "bounds");
    v44 = v42 * (v4 / v43);

    v45 = 4.0;
    if (v44 >= 4.0)
      v45 = v44;
    -[PXWallpaperSuggestionView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v45);

  }
  -[UIImageView setHidden:](self->_overlayView, "setHidden:", !self->_showClockOverlay);
  -[PXWallpaperSuggestionView bounds](self, "bounds");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  -[PXWallpaperSuggestionView overlayView](self, "overlayView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFrame:", v47, v49, v51, v53);

  if (-[PXWallpaperSuggestionView _isPortrait](self, "_isPortrait"))
    -[PXWallpaperSuggestionView portraitOverlay](self, "portraitOverlay");
  else
    -[PXWallpaperSuggestionView landscapeOverlay](self, "landscapeOverlay");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXWallpaperSuggestionView overlayView](self, "overlayView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setImage:", v55);

}

- (BOOL)_isPortrait
{
  void *v2;
  void *v3;
  uint64_t v4;

  -[PXWallpaperSuggestionView window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return (unint64_t)(v4 - 1) < 2;
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXWallpaperSuggestionView _resetImageRequester](self, "_resetImageRequester");
    v5 = v6;
    if (v6)
    {
      -[PXWallpaperSuggestionView setNeedsLayout](self, "setNeedsLayout");
      v5 = v6;
    }
  }

}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  void *v7;
  PXImageRequester *v8;

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  v8 = v5;
  if (imageRequester != v5)
  {
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext_132159);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXImageRequester registerChangeObserver:context:](v8, "registerChangeObserver:context:", self, PXImageRequesterObserverContext_132159);
    -[PXImageRequester image](v8, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWallpaperSuggestionView setImage:](self, "setImage:", v7);

    -[PXImageRequester contentsRect](v8, "contentsRect");
    -[PXWallpaperSuggestionView setContentsRect:](self, "setContentsRect:");
  }

}

- (void)_resetImageRequester
{
  -[PXWallpaperSuggestionView setImageRequester:](self, "setImageRequester:", 0);
  -[PXWallpaperSuggestionView setCurrentImageIdentifier:](self, "setCurrentImageIdentifier:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16[2];
  id location[6];

  v6 = a4;
  v8 = a3;
  if ((void *)PXImageRequesterObserverContext_132159 == a5)
  {
    if (v6 < 0)
    {
      location[1] = (id)MEMORY[0x1E0C809B0];
      location[2] = (id)3221225472;
      location[3] = __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke;
      location[4] = &unk_1E5149198;
      location[5] = self;
      px_dispatch_on_main_queue();
    }
    if ((v6 & 4) != 0)
    {
      -[PXWallpaperSuggestionView imageRequester](self, "imageRequester");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "image");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXWallpaperSuggestionView setCurrentImageIdentifier:](self, "setCurrentImageIdentifier:", -[PXWallpaperSuggestionView currentImageIdentifier](self, "currentImageIdentifier") + 1);
      v11 = -[PXWallpaperSuggestionView currentImageIdentifier](self, "currentImageIdentifier");
      objc_initWeak(location, self);
      objc_msgSend((id)objc_opt_class(), "sharedWorkQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_2;
      block[3] = &unk_1E513FF48;
      v16[1] = v11;
      objc_copyWeak(v16, location);
      v15 = v10;
      v13 = v10;
      dispatch_async(v12, block);

      objc_destroyWeak(v16);
      objc_destroyWeak(location);

    }
  }

}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (UIImageView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (BOOL)needsRoundedCorner
{
  return self->_needsRoundedCorner;
}

- (void)setNeedsRoundedCorner:(BOOL)a3
{
  self->_needsRoundedCorner = a3;
}

- (BOOL)showClockOverlay
{
  return self->_showClockOverlay;
}

- (void)setShowClockOverlay:(BOOL)a3
{
  self->_showClockOverlay = a3;
}

- (unint64_t)cropMode
{
  return self->_cropMode;
}

- (void)setCropMode:(unint64_t)a3
{
  self->_cropMode = a3;
}

- (unint64_t)classificationMode
{
  return self->_classificationMode;
}

- (void)setClassificationMode:(unint64_t)a3
{
  self->_classificationMode = a3;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  self->_contentsRect = a3;
}

- (UIImage)landscapeOverlay
{
  return self->_landscapeOverlay;
}

- (void)setLandscapeOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeOverlay, a3);
}

- (UIImage)portraitOverlay
{
  return self->_portraitOverlay;
}

- (void)setPortraitOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_portraitOverlay, a3);
}

- (int64_t)currentImageIdentifier
{
  return self->_currentImageIdentifier;
}

- (void)setCurrentImageIdentifier:(int64_t)a3
{
  self->_currentImageIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitOverlay, 0);
  objc_storeStrong((id *)&self->_landscapeOverlay, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "imageRequester");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  objc_msgSend(*(id *)(a1 + 32), "setContentsRect:");

}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(WeakRetained, "currentImageIdentifier");

  if (v2 == v5)
  {
    objc_copyWeak(&v7, v3);
    v6 = *(id *)(a1 + 32);
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v7);
  }
}

void __58__PXWallpaperSuggestionView_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setImage:", v1);

}

void __43__PXWallpaperSuggestionView_layoutSubviews__block_invoke(double *a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setCropRect:", a1[6], a1[7], a1[8], a1[9]);
  objc_msgSend(v5, "setViewportSize:", a1[10], a1[11]);
  objc_msgSend(v5, "setScale:", a1[12]);

}

void __43__PXWallpaperSuggestionView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __43__PXWallpaperSuggestionView_initWithFrame___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPortraitOverlay:", v2);

  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setLandscapeOverlay:", v5);

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "setNeedsLayout");

}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken_132194 != -1)
    dispatch_once(&sharedWorkQueue_onceToken_132194, &__block_literal_global_132195);
  return (id)sharedWorkQueue_sharedWorkQueue_132196;
}

+ (void)requestSharedOverlayImageWithCompletionBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

void __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD block[7];
  BOOL v24;

  if ((requestSharedOverlayImageWithCompletionBlock__isLoadingStarted & 1) != 0)
  {
    v2 = *(void (***)(_QWORD, _QWORD, _QWORD))(a1 + 32);
    if (v2)
    {
      if (requestSharedOverlayImageWithCompletionBlock__isLoadingFinished == 1)
      {
        v2[2](v2, requestSharedOverlayImageWithCompletionBlock__portraitOverlay, requestSharedOverlayImageWithCompletionBlock__landscapeOverlay);
      }
      else
      {
        v20 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
        v22 = (id)objc_msgSend(v2, "copy");
        v21 = _Block_copy(v22);
        objc_msgSend(v20, "addObject:", v21);

      }
    }
  }
  else
  {
    requestSharedOverlayImageWithCompletionBlock__isLoadingStarted = 1;
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
    requestSharedOverlayImageWithCompletionBlock__completionBlocks = (uint64_t)v3;

    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      v6 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
      v7 = (void *)objc_msgSend(v5, "copy");
      v8 = _Block_copy(v7);
      objc_msgSend(v6, "addObject:", v8);

    }
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom") == 1;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scale");
    v18 = v17;

    dispatch_get_global_queue(25, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2;
    block[3] = &__block_descriptor_57_e5_v8__0l;
    block[4] = v13;
    block[5] = v15;
    v24 = v10;
    block[6] = v18;
    dispatch_async(v19, block);

  }
}

uint64_t __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(double *)(a1 + 32);
  v1 = *(double *)(a1 + 40);
  if (v1 >= v2)
    v3 = *(double *)(a1 + 32);
  else
    v3 = *(double *)(a1 + 40);
  if (v1 < v2)
    v1 = *(double *)(a1 + 32);
  v4 = 2.0;
  if (!*(_BYTE *)(a1 + 56))
    v4 = 1.5;
  v5 = *(double *)(a1 + 48);
  v6 = round(v5 * (v3 / v4)) / v5;
  v7 = round(v5 * (v1 / v4)) / v5;
  v8 = (void *)MEMORY[0x1A85CE17C]();
  SOFT_LINKED_SBSUIWallpaperGetOverlay(14523, v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)requestSharedOverlayImageWithCompletionBlock__portraitOverlay;
  requestSharedOverlayImageWithCompletionBlock__portraitOverlay = v9;

  SOFT_LINKED_SBSUIWallpaperGetOverlay(14651, v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)requestSharedOverlayImageWithCompletionBlock__landscapeOverlay;
  requestSharedOverlayImageWithCompletionBlock__landscapeOverlay = v11;

  objc_autoreleasePoolPop(v8);
  if (!requestSharedOverlayImageWithCompletionBlock__portraitOverlay)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 134217984;
      v17 = v6;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "SB SPI returns nil portrait overlay image (requested width: %.3f)", (uint8_t *)&v16, 0xCu);
    }

  }
  if (!requestSharedOverlayImageWithCompletionBlock__landscapeOverlay)
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = 134217984;
      v17 = v7;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "SB SPI returns nil landscape overlay image (requested width: %.3f)", (uint8_t *)&v16, 0xCu);
    }

  }
  return px_dispatch_on_main_queue();
}

void __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_153()
{
  void *v0;

  requestSharedOverlayImageWithCompletionBlock__isLoadingFinished = 1;
  objc_msgSend((id)requestSharedOverlayImageWithCompletionBlock__completionBlocks, "enumerateObjectsUsingBlock:", &__block_literal_global_157_132184);
  v0 = (void *)requestSharedOverlayImageWithCompletionBlock__completionBlocks;
  requestSharedOverlayImageWithCompletionBlock__completionBlocks = 0;

}

uint64_t __74__PXWallpaperSuggestionView_requestSharedOverlayImageWithCompletionBlock___block_invoke_2_155(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, requestSharedOverlayImageWithCompletionBlock__portraitOverlay, requestSharedOverlayImageWithCompletionBlock__landscapeOverlay);
}

void __44__PXWallpaperSuggestionView_sharedWorkQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.wallpaperPreview", attr);
  v2 = (void *)sharedWorkQueue_sharedWorkQueue_132196;
  sharedWorkQueue_sharedWorkQueue_132196 = (uint64_t)v1;

}

@end
