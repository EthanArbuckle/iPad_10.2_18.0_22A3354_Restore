@implementation PXUIPlayButtonTile

- (PXUIPlayButtonTile)init
{
  PXUIPlayButtonTile *v2;
  PXUIPlayButtonTile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXUIPlayButtonTile;
  v2 = -[PXUIPlayButtonTile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_playButtonStyle = 0;
    v2->_allowsBackdropStatisticsSuppression = 1;
    -[PXUIPlayButtonTile _invalidatePlayButton](v2, "_invalidatePlayButton");
  }
  return v3;
}

- (void)setPlayButtonSize:(CGSize)a3
{
  double height;
  double width;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  if (!self->_isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 64, CFSTR("[%@] %@ must be called from a performChanges block."), self, v9);

  }
  if (width != self->_playButtonSize.width || height != self->_playButtonSize.height)
  {
    self->_playButtonSize.width = width;
    self->_playButtonSize.height = height;
    -[PXUIPlayButtonTile _invalidatePlayButton](self, "_invalidatePlayButton");
  }
}

- (void)setPlayButtonStyle:(int64_t)a3
{
  void *v6;
  void *v7;

  if (!self->_isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 74, CFSTR("[%@] %@ must be called from a performChanges block."), self, v7);

  }
  if (self->_playButtonStyle != a3)
  {
    self->_playButtonStyle = a3;
    -[PXUIPlayButtonTile _invalidatePlayButton](self, "_invalidatePlayButton");
  }
}

- (void)setPlayButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *playButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_playButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      playButtonTitle = self->_playButtonTitle;
      self->_playButtonTitle = v6;

      -[PXUIPlayButtonTile _invalidatePlayButton](self, "_invalidatePlayButton");
    }
  }

}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v6;
  PXImageRequester *imageRequester;
  void *v8;
  void *v9;
  PXImageRequester *v10;
  PXImageRequester *v11;

  v6 = (PXImageRequester *)a3;
  if (!self->_isPerformingChanges)
  {
    v11 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 93, CFSTR("[%@] %@ must be called from a performChanges block."), self, v9);

    v6 = v11;
  }
  imageRequester = self->_imageRequester;
  if (imageRequester != v6)
  {
    v10 = v6;
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXUIPlayButtonTile _invalidateBackgroundImage](self, "_invalidateBackgroundImage");
    -[PXImageRequester registerChangeObserver:context:](self->_imageRequester, "registerChangeObserver:context:", self, PXImageRequesterObserverContext);
    v6 = v10;
  }

}

- (void)setImageViewportLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  if (!self->_isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 106, CFSTR("[%@] %@ must be called from a performChanges block."), self, v9);

  }
  if (x != self->_imageViewportLocation.x || y != self->_imageViewportLocation.y)
  {
    self->_imageViewportLocation.x = x;
    self->_imageViewportLocation.y = y;
    -[PXUIPlayButtonTile _invalidateBackgroundImage](self, "_invalidateBackgroundImage");
  }
}

- (void)setAllowsBackdropStatisticsSuppression:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;

  v3 = a3;
  if (!self->_isPerformingChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 116, CFSTR("[%@] %@ must be called from a performChanges block."), self, v7);

  }
  if (self->_allowsBackdropStatisticsSuppression != v3)
  {
    self->_allowsBackdropStatisticsSuppression = v3;
    -[PXUIPlayButtonTile _resetHifiPlayButton](self, "_resetHifiPlayButton");
  }
}

- (void)_resetHifiPlayButton
{
  PXVideoOverlayButton *hifiPlayButtonView;

  -[PXVideoOverlayButton removeFromSuperview](self->_hifiPlayButtonView, "removeFromSuperview");
  hifiPlayButtonView = self->_hifiPlayButtonView;
  self->_hifiPlayButtonView = 0;

  -[PXUIPlayButtonTile _invalidatePlayButton](self, "_invalidatePlayButton");
}

- (void)_setAnimationCount:(unint64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    -[PXUIPlayButtonTile _setAnimatingGeometry:](self, "_setAnimatingGeometry:", a3 != 0);
  }
}

- (void)_setAnimatingGeometry:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->__animatingGeometry != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->__animatingGeometry = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __44__PXUIPlayButtonTile__setAnimatingGeometry___block_invoke;
    v4[3] = &unk_1E5124B40;
    v4[4] = self;
    -[PXUIPlayButtonTile performChanges:](self, "performChanges:", v4);
  }
}

- (void)_setBackgroundImage:(id)a3
{
  UIImage *v5;
  _QWORD v6[5];

  v5 = (UIImage *)a3;
  if (self->__backgroundImage != v5)
  {
    objc_storeStrong((id *)&self->__backgroundImage, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__PXUIPlayButtonTile__setBackgroundImage___block_invoke;
    v6[3] = &unk_1E5124B40;
    v6[4] = self;
    -[PXUIPlayButtonTile performChanges:](self, "performChanges:", v6);
  }

}

- (void)_invalidatePlayButton
{
  self->_needsUpdate.playButton = 1;
}

- (void)_updatePlayButtonViewIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  char v9;
  _BOOL4 v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  PXVideoOverlayButton *playButtonView;
  PXVideoOverlayButton *v18;
  UIImageView *v19;
  void *v20;
  UIImageView *v21;
  PXVideoOverlayButton *v22;
  PXVideoOverlayButton *v23;
  UIImageView *playButtonBackgroundImageView;
  __int128 v25;
  _QWORD v26[4];
  PXVideoOverlayButton *v27;
  UIImageView *v28;
  _QWORD v29[4];
  PXVideoOverlayButton *v30;
  UIImageView *v31;
  _QWORD v32[5];
  id v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;

  if (!self->_needsUpdate.playButton)
    return;
  self->_needsUpdate.playButton = 0;
  -[PXUIPlayButtonTile view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUIPlayButtonTile playButtonSize](self, "playButtonSize");
  v5 = v4;
  v7 = v6;
  v8 = -[PXUIPlayButtonTile playButtonStyle](self, "playButtonStyle");
  if (v8 != 1)
  {
    v11 = v8;
    if (-[PXUIPlayButtonTile _isAnimatingGeometry](self, "_isAnimatingGeometry"))
    {
      -[PXUIPlayButtonTile _backgroundImage](self, "_backgroundImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12 != 0;

      if (v11)
      {
LABEL_6:
        v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
      if (v11)
        goto LABEL_6;
    }
    v9 = !-[PXUIPlayButtonTile _isAnimatingGeometry](self, "_isAnimatingGeometry");
    goto LABEL_9;
  }
  v9 = 0;
  v10 = 1;
LABEL_9:
  v13 = (void *)MEMORY[0x1E0DC3F10];
  v14 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke;
  v37[3] = &unk_1E51229B8;
  v42 = v9;
  v37[4] = self;
  v15 = v3;
  v38 = v15;
  v25 = *MEMORY[0x1E0C9D538];
  v39 = *MEMORY[0x1E0C9D538];
  v40 = v5;
  v41 = v7;
  v43 = 0;
  objc_msgSend(v13, "performWithoutAnimation:", v37);
  if (v10)
  {
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v32[0] = v14;
    v32[1] = 3221225472;
    v32[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_2;
    v32[3] = &unk_1E5124FD0;
    v32[4] = self;
    v33 = v15;
    v34 = v25;
    v35 = v5;
    v36 = v7;
    objc_msgSend(v16, "performWithoutAnimation:", v32);

  }
  else
  {
    playButtonView = self->_playButtonView;
    if (playButtonView)
    {
      v18 = playButtonView;
      v19 = self->_playButtonBackgroundImageView;
      v20 = (void *)MEMORY[0x1E0DC3F10];
      v29[0] = v14;
      v29[1] = 3221225472;
      v29[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_3;
      v29[3] = &unk_1E5148D08;
      v30 = v18;
      v31 = v19;
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_4;
      v26[3] = &unk_1E5144558;
      v27 = v30;
      v28 = v31;
      v21 = v31;
      v22 = v30;
      objc_msgSend(v20, "animateWithDuration:animations:completion:", v29, v26, 2.0);
      v23 = self->_playButtonView;
      self->_playButtonView = 0;

      playButtonBackgroundImageView = self->_playButtonBackgroundImageView;
      self->_playButtonBackgroundImageView = 0;

    }
  }

}

- (void)_invalidateBackgroundImage
{
  self->_needsUpdate.backgroundImage = 1;
}

- (void)_updateBackgroundImageIfNeeded
{
  void *v3;
  void *v4;
  PXImageExtraction *imageExtraction;
  PXDisplayAsset *v6;
  void *v7;
  PXDisplayAsset *v8;
  PXDisplayAsset *v9;
  PXDisplayAsset *v10;
  uint64_t v11;
  PXDisplayAsset *v12;
  PXImageExtraction *v13;
  PXDisplayAsset *v14;
  PXDisplayAsset *assetForImageExtraction;
  double v16;
  double v17;
  double v18;
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
  double v30;
  double v31;
  PXImageExtraction *v32;
  PXImageExtraction *v33;
  _QWORD v34[4];
  id v35;
  id location;

  if (self->_needsUpdate.backgroundImage)
  {
    self->_needsUpdate.backgroundImage = 0;
    -[PXUIPlayButtonTile imageRequester](self, "imageRequester");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "opportunisticImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    imageExtraction = self->_imageExtraction;
    if (v4)
    {
      if (!imageExtraction)
      {
LABEL_15:
        objc_msgSend(v3, "asset");
        v14 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
        assetForImageExtraction = self->_assetForImageExtraction;
        self->_assetForImageExtraction = v14;

        objc_msgSend(v3, "contentsRect");
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v23 = v22;
        objc_msgSend(v3, "viewportSize");
        v25 = v24;
        v27 = v26;
        -[PXUIPlayButtonTile imageViewportLocation](self, "imageViewportLocation");
        v29 = v28;
        v31 = v30;
        objc_initWeak(&location, self);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __52__PXUIPlayButtonTile__updateBackgroundImageIfNeeded__block_invoke;
        v34[3] = &unk_1E51229E0;
        objc_copyWeak(&v35, &location);
        objc_msgSend(v4, "px_extractPlayOverlayBackgroundImageFromLocation:inViewportWithSize:contentMode:contentsRect:asynchronously:handler:", 2, 1, v34, v29, v31, v25, v27, v17, v19, v21, v23);
        v32 = (PXImageExtraction *)objc_claimAutoreleasedReturnValue();
        v33 = self->_imageExtraction;
        self->_imageExtraction = v32;

        objc_destroyWeak(&v35);
        objc_destroyWeak(&location);
        goto LABEL_16;
      }
      v6 = self->_assetForImageExtraction;
      objc_msgSend(v3, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      if (v8 != v9)
      {
        v10 = v9;
        if (v8 && v9)
        {
          v11 = -[PXDisplayAsset isContentEqualTo:](v8, "isContentEqualTo:", v9);
          if (!v11)
            v11 = -[PXDisplayAsset isContentEqualTo:](v10, "isContentEqualTo:", v8);

          if (v11 == 2)
            goto LABEL_16;
        }
        else
        {

        }
        goto LABEL_15;
      }

    }
    else
    {
      -[PXImageExtraction cancel](imageExtraction, "cancel");
      v12 = self->_assetForImageExtraction;
      self->_assetForImageExtraction = 0;

      v13 = self->_imageExtraction;
      self->_imageExtraction = 0;

      objc_msgSend(MEMORY[0x1E0DC3870], "px_playOverlayImage:", 2);
      v8 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
      -[PXUIPlayButtonTile _setBackgroundImage:](self, "_setBackgroundImage:", v8);
    }

LABEL_16:
  }
}

- (void)performChanges:(id)a3
{
  id v4;
  _BOOL4 isPerformingChanges;
  id v6;

  v4 = a3;
  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  v6 = v4;
  if (v4)
  {
    (*((void (**)(id, PXUIPlayButtonTile *))v4 + 2))(v4, self);
    v4 = v6;
  }
  self->_isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    -[PXUIPlayButtonTile _updateIfNeeded](self, "_updateIfNeeded");
    v4 = v6;
  }

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdate.playButton || self->_needsUpdate.backgroundImage;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PXUIPlayButtonTile _needsUpdate](self, "_needsUpdate"))
  {
    -[PXUIPlayButtonTile _updateBackgroundImageIfNeeded](self, "_updateBackgroundImageIfNeeded");
    -[PXUIPlayButtonTile _updatePlayButtonViewIfNeeded](self, "_updatePlayButtonViewIfNeeded");
    if (-[PXUIPlayButtonTile _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXUIPlayButtonTile.m"), 331, CFSTR("[%@] update needed at end of update pass"), self);

    }
  }
}

- (void)_handleExtractionResult:(id)a3 isPlaceholder:(BOOL)a4 extraction:(id)a5
{
  PXImageExtraction *v8;
  PXImageExtraction *imageExtraction;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (PXImageExtraction *)a5;
  if (!-[PXImageExtraction isCancelled](v8, "isCancelled"))
  {
    imageExtraction = self->_imageExtraction;
    if (!imageExtraction || imageExtraction == v8)
    {
      -[PXUIPlayButtonTile _backgroundImage](self, "_backgroundImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10 || !a4)
        -[PXUIPlayButtonTile _setBackgroundImage:](self, "_setBackgroundImage:", v11);
    }
  }

}

- (void)didTapButton:(id)a3
{
  id v4;

  -[PXUIPlayButtonTile delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playButtonTileWasTapped:", self);

}

- (void)becomeReusable
{
  void *v3;

  -[PXUIPlayButtonTile view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXUIPlayButtonTile performChanges:](self, "performChanges:", &__block_literal_global_15_79939);
}

- (void)prepareForReuse
{
  id v2;

  -[PXUIPlayButtonTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[5];

  if ((a4 & 0x800) != 0 && (void *)PXImageRequesterObserverContext == a5)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PXUIPlayButtonTile_observable_didChange_context___block_invoke;
    v5[3] = &unk_1E5124B40;
    v5[4] = self;
    -[PXUIPlayButtonTile performChanges:](self, "performChanges:", v5);
  }
}

- (UIView)view
{
  UIView *v3;
  UIView *view;

  if (!self->_view)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    view = self->_view;
    self->_view = v3;

  }
  -[PXUIPlayButtonTile _updateIfNeeded](self, "_updateIfNeeded");
  return self->_view;
}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  -[PXUIPlayButtonTile _setAnimationCount:](self, "_setAnimationCount:", -[PXUIPlayButtonTile _animationCount](self, "_animationCount", a3, a4, a5) + 1);
}

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  -[PXUIPlayButtonTile _setAnimationCount:](self, "_setAnimationCount:", -[PXUIPlayButtonTile _animationCount](self, "_animationCount", a3, a4, a5) - 1);
}

- (PXUIPlayButtonTileDelegate)delegate
{
  return (PXUIPlayButtonTileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)playButtonSize
{
  double width;
  double height;
  CGSize result;

  width = self->_playButtonSize.width;
  height = self->_playButtonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)playButtonStyle
{
  return self->_playButtonStyle;
}

- (NSString)playButtonTitle
{
  return self->_playButtonTitle;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (CGPoint)imageViewportLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_imageViewportLocation.x;
  y = self->_imageViewportLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)allowsBackdropStatisticsSuppression
{
  return self->_allowsBackdropStatisticsSuppression;
}

- (int64_t)_style
{
  return self->__style;
}

- (void)_setStyle:(int64_t)a3
{
  self->__style = a3;
}

- (BOOL)_isAnimatingGeometry
{
  return self->__animatingGeometry;
}

- (unint64_t)_animationCount
{
  return self->__animationCount;
}

- (UIImage)_backgroundImage
{
  return self->__backgroundImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__backgroundImage, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_playButtonTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetForImageExtraction, 0);
  objc_storeStrong((id *)&self->_imageExtraction, 0);
  objc_storeStrong((id *)&self->_playButtonBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_labeledPlayButtonView, 0);
  objc_storeStrong((id *)&self->_playButtonView, 0);
  objc_storeStrong((id *)&self->_hifiPlayButtonView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

uint64_t __51__PXUIPlayButtonTile_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBackgroundImage");
}

uint64_t __36__PXUIPlayButtonTile_becomeReusable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageRequester:", 0);
}

void __52__PXUIPlayButtonTile__updateBackgroundImageIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleExtractionResult:isPlaceholder:extraction:", v8, a3, v7);

}

void __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v2 = *(unsigned __int8 *)(a1 + 80);
  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[2];
  if (v2)
  {
    if (!v4)
    {
      v5 = objc_msgSend(v3, "allowsBackdropStatisticsSuppression");
      objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:allowBackdropStatisticsSupression:", 0, v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutoresizingMask:", 0);
      objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0);
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    }
    objc_msgSend(v4, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else if (v4)
  {
    objc_msgSend(v4, "removeFromSuperview");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(_QWORD *)(v9 + 16) = 0;

  }
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (*(_BYTE *)(a1 + 81))
  {
    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setStyle:", 5);
      objc_msgSend(v12, "setLocalizedTitle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
      objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithConfiguration:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 32);
      *(_QWORD *)(v14 + 32) = v13;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAutoresizingMask:", 0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setTarget:action:", *(_QWORD *)(a1 + 32), sel_didTapButton_);
      objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    }
    objc_msgSend(v11, "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else if (v11)
  {
    objc_msgSend(v11, "removeFromSuperview");
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 32);
    *(_QWORD *)(v16 + 32) = 0;

  }
}

void __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 24))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAutoresizingMask:", 0);
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutoresizingMask:", 0);
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "_backgroundImage");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setImage:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

uint64_t __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __51__PXUIPlayButtonTile__updatePlayButtonViewIfNeeded__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

uint64_t __42__PXUIPlayButtonTile__setBackgroundImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayButton");
}

uint64_t __44__PXUIPlayButtonTile__setAnimatingGeometry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlayButton");
}

+ (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  if (preferredSize_onceToken != -1)
    dispatch_once(&preferredSize_onceToken, &__block_literal_global_79956);
  v2 = *(double *)&preferredSize_preferredSize_0;
  v3 = *(double *)&preferredSize_preferredSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __35__PXUIPlayButtonTile_preferredSize__block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonSize");
  preferredSize_preferredSize_0 = v1;
  preferredSize_preferredSize_1 = v2;
  return result;
}

@end
