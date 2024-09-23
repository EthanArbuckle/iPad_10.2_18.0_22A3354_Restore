@implementation PUFeedPlayerCell

- (PUFeedPlayerCell)initWithFrame:(CGRect)a3
{
  PUFeedPlayerCell *v4;
  PUFeedPlayerCell *v5;
  id v6;
  void *v7;
  ISLivePhotoUIView *playerView;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUFeedPlayerCell;
  v4 = -[PUFeedPlayerCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[PUFeedPlayerCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PUFeedPlayerCell setCurrentImageRequestID:](v5, "setCurrentImageRequestID:", 0);
    v5->_photoTime = -1000.0;
    v6 = objc_alloc_init(MEMORY[0x1E0D78268]);
    objc_storeStrong((id *)&v5->__player, v6);
    -[PUFeedPlayerCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PUFeedPlayerCell.m"), 53, CFSTR("The content view must be a ISLivePhotoUIView: %@"), v7);

    }
    objc_msgSend(v7, "setContentMode:", 2);
    objc_msgSend(v7, "setPlayer:", v6);
    playerView = v5->__playerView;
    v5->__playerView = (ISLivePhotoUIView *)v7;

  }
  return v5;
}

- (void)_updateCommentButton
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = -[PUFeedPlayerCell isPlayerHidden](self, "isPlayerHidden");
  v4 = -[PUFeedPlayerCell commentCount](self, "commentCount");
  -[PUFeedPlayerCell _commentButton](self, "_commentButton");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 < 1)
  {
    v3 = 1;
  }
  else
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    v7 = v5;
    if (!v8)
    {
      objc_msgSend(v5, "createCloudFeedCommentButton");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__handleCommentButton_, 64);
      -[PUFeedPlayerCell addSubview:](self, "addSubview:", v9);
      -[PUFeedPlayerCell _setCommentButton:](self, "_setCommentButton:", v9);
      -[PUFeedPlayerCell setNeedsLayout](self, "setNeedsLayout");
      v6 = v9;
    }
    v8 = v6;
    objc_msgSend(v7, "configureCloudFeedCommentButton:withCount:", v6, v4);

  }
  -[PUFeedPlayerCell _setShouldHideCommentButton:](self, "_setShouldHideCommentButton:", v4 < 1);
  objc_msgSend(v8, "setHidden:", v3);

}

- (void)performIrisPlayerChanges:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL8 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[PUFeedPlayerCell _isPerformingIrisPlayerChanges](self, "_isPerformingIrisPlayerChanges");
  -[PUFeedPlayerCell _setPerformingIrisPlayerChanges:](self, "_setPerformingIrisPlayerChanges:", 1);
  v4[2](v4);

  -[PUFeedPlayerCell _setPerformingIrisPlayerChanges:](self, "_setPerformingIrisPlayerChanges:", v5);
  if (!v5)
    -[PUFeedPlayerCell _updateIrisIfNeeded](self, "_updateIrisIfNeeded");
}

- (void)_assertInsideIrisPlayerChanges
{
  id v4;

  if (!-[PUFeedPlayerCell _isPerformingIrisPlayerChanges](self, "_isPerformingIrisPlayerChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedPlayerCell.m"), 99, CFSTR("must be called within -performIrisPlayerChanges: block"));

  }
}

- (void)_updateIrisIfNeeded
{
  id v4;

  if (-[PUFeedPlayerCell _needsUpdateIris](self, "_needsUpdateIris"))
  {
    -[PUFeedPlayerCell _updatePlayerItemIfNeeded](self, "_updatePlayerItemIfNeeded");
    -[PUFeedPlayerCell _updateVitalityIfNeeded](self, "_updateVitalityIfNeeded");
    if (-[PUFeedPlayerCell _needsUpdateIris](self, "_needsUpdateIris"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFeedPlayerCell.m"), 110, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdateIris
{
  return -[PUFeedPlayerCell _needsUpdatePlayerItem](self, "_needsUpdatePlayerItem")
      || -[PUFeedPlayerCell _needsUpdateVitality](self, "_needsUpdateVitality");
}

- (void)_invalidatePlayerItem
{
  -[PUFeedPlayerCell _setNeedsUpdatePlayerItem:](self, "_setNeedsUpdatePlayerItem:", 1);
  -[PUFeedPlayerCell _setNeedsUpdateIris](self, "_setNeedsUpdateIris");
}

- (void)_updatePlayerItemIfNeeded
{
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  if (-[PUFeedPlayerCell _needsUpdatePlayerItem](self, "_needsUpdatePlayerItem"))
  {
    -[PUFeedPlayerCell _setNeedsUpdatePlayerItem:](self, "_setNeedsUpdatePlayerItem:", 0);
    -[PUFeedPlayerCell photoImage](self, "photoImage");
    v13 = objc_claimAutoreleasedReturnValue();
    v3 = -[PUFeedPlayerCell isPhotoImageDegraded](self, "isPhotoImageDegraded");
    -[PUFeedPlayerCell videoAsset](self, "videoAsset");
    v4 = objc_claimAutoreleasedReturnValue();
    -[PUFeedPlayerCell photoTime](self, "photoTime");
    v6 = v5;
    v7 = 0;
    if (v13 && v4)
      v7 = (v5 != -1000.0) & ~v3;
    if (!v4 || v7)
    {
      objc_msgSend((id)v13, "imageOrientation");
      v8 = PLExifOrientationFromImageOrientation();
      if (v13 | v4)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78260]), "initWithVideoAsset:photo:photoTime:photoEXIFOrientation:", v4, objc_msgSend(objc_retainAutorelease((id)v13), "CGImage"), v8, v6);
        if (v9)
        {
          v10 = objc_alloc(MEMORY[0x1E0D78278]);
          v11 = (void *)objc_msgSend(v10, "initWithAsset:targetSize:", v9, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
        v9 = 0;
      }
      -[PUFeedPlayerCell _player](self, "_player");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPlayerItem:", v11);

    }
  }
}

- (void)_invalidateVitality
{
  -[PUFeedPlayerCell _setNeedsUpdateVitality:](self, "_setNeedsUpdateVitality:", 1);
  -[PUFeedPlayerCell _setNeedsUpdateIris](self, "_setNeedsUpdateIris");
}

- (void)_updateVitalityIfNeeded
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[PUFeedPlayerCell _needsUpdateVitality](self, "_needsUpdateVitality"))
  {
    -[PUFeedPlayerCell _setNeedsUpdateVitality:](self, "_setNeedsUpdateVitality:", 0);
    v3 = -[PUFeedPlayerCell isPlayerHidden](self, "isPlayerHidden");
    -[PUFeedPlayerCell containingCollectionView](self, "containingCollectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    if (v3)
    {
      objc_msgSend(v4, "is_vitalityControllerCreateIfNeeded:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedPlayerCell _playerView](self, "_playerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removePlayerView:", v6);
    }
    else
    {
      objc_msgSend(v4, "is_vitalityControllerCreateIfNeeded:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedPlayerCell _playerView](self, "_playerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addPlayerView:", v6);
    }

  }
}

- (void)_handleCommentButton:(id)a3
{
  id v4;

  -[PUFeedPlayerCell _playerCellDelegate](self, "_playerCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapCommentButtonInFeedPlayerCell:", self);

}

- (void)setCommentCount:(int64_t)a3
{
  if (self->_commentCount != a3)
  {
    self->_commentCount = a3;
    -[PUFeedPlayerCell _updateCommentButton](self, "_updateCommentButton");
  }
}

- (void)setPlayerHidden:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUFeedPlayerCell _assertInsideIrisPlayerChanges](self, "_assertInsideIrisPlayerChanges");
  if (self->_playerHidden != v3)
  {
    self->_playerHidden = v3;
    -[PUFeedPlayerCell _invalidateVitality](self, "_invalidateVitality");
    -[PUFeedPlayerCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPhotoImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  -[PUFeedPlayerCell _assertInsideIrisPlayerChanges](self, "_assertInsideIrisPlayerChanges");
  if (self->_photoImage != v5)
  {
    objc_storeStrong((id *)&self->_photoImage, a3);
    -[PUFeedPlayerCell _invalidatePlayerItem](self, "_invalidatePlayerItem");
  }

}

- (void)setPhotoImageDegraded:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[PUFeedPlayerCell _assertInsideIrisPlayerChanges](self, "_assertInsideIrisPlayerChanges");
  if (self->_isPhotoImageDegraded != v3)
  {
    self->_isPhotoImageDegraded = v3;
    -[PUFeedPlayerCell _invalidatePlayerItem](self, "_invalidatePlayerItem");
  }
}

- (void)setVideoAsset:(id)a3
{
  AVAsset *v5;

  v5 = (AVAsset *)a3;
  -[PUFeedPlayerCell _assertInsideIrisPlayerChanges](self, "_assertInsideIrisPlayerChanges");
  if (self->_videoAsset != v5)
  {
    objc_storeStrong((id *)&self->_videoAsset, a3);
    -[PUFeedPlayerCell _invalidatePlayerItem](self, "_invalidatePlayerItem");
  }

}

- (void)setContainingCollectionView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  -[PUFeedPlayerCell _assertInsideIrisPlayerChanges](self, "_assertInsideIrisPlayerChanges");
  WeakRetained = objc_loadWeakRetained((id *)&self->_containingCollectionView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingCollectionView, obj);
    -[PUFeedPlayerCell _invalidateVitality](self, "_invalidateVitality");
    v5 = obj;
  }

}

- (void)setParallaxOffset:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFeedPlayerCell;
  -[PUFeedCell setParallaxOffset:](&v4, sel_setParallaxOffset_, a3.x, a3.y);
  -[PUFeedPlayerCell _layoutPlayerView](self, "_layoutPlayerView");
}

- (void)prepareForReuse
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFeedPlayerCell;
  -[PUFeedPlayerCell prepareForReuse](&v4, sel_prepareForReuse);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__PUFeedPlayerCell_prepareForReuse__block_invoke;
  v3[3] = &unk_1E58ABD10;
  v3[4] = self;
  -[PUFeedPlayerCell performIrisPlayerChanges:](self, "performIrisPlayerChanges:", v3);
  -[PUFeedPlayerCell setCurrentImageRequestID:](self, "setCurrentImageRequestID:", 0);
}

- (void)_layoutPlayerView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;

  -[PUFeedPlayerCell photoImage](self, "photoImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v6 = 0.0;
  if ((v4 != -1.79769313e308 || v5 != -1.79769313e308)
    && (v4 != *MEMORY[0x1E0C9D820] || v5 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
  {
    v6 = v4 / v5;
  }

  -[PUFeedPlayerCell bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PUFeedCell parallaxOffset](self, "parallaxOffset");
  v18 = v17;
  v20 = v19;
  -[PUFeedCell edgeParallaxOffset](self, "edgeParallaxOffset");
  +[PUFeedCell rectWithAspectRatio:fillingRect:parallaxOffset:edgeParallaxOffset:](PUFeedCell, "rectWithAspectRatio:fillingRect:parallaxOffset:edgeParallaxOffset:", v6, v10, v12, v14, v16, v18, v20, v21, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[PUFeedPlayerCell _playerView](self, "_playerView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxX;
  CGFloat v20;
  double MaxY;
  double v22;
  _BOOL8 v23;
  uint64_t v24;
  void *v25;
  CGRect rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = PUFeedPlayerCell;
  -[CGFloat layoutSubviews]((objc_super *)&rect.origin.y, sel_layoutSubviews);
  -[PUFeedPlayerCell _commentButton](self, "_commentButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedPlayerCell bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "frame");
  rect.origin.x = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v27.origin.x = v5;
  v27.origin.y = v7;
  v27.size.width = v9;
  v27.size.height = v11;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = rect.origin.x;
  v28.origin.y = v14;
  v28.size.width = v16;
  v28.size.height = v18;
  v20 = MaxX - CGRectGetWidth(v28) + -5.0;
  v29.origin.x = v5;
  v29.origin.y = v7;
  v29.size.width = v9;
  v29.size.height = v11;
  MaxY = CGRectGetMaxY(v29);
  v30.origin.x = v20;
  v30.origin.y = v14;
  v30.size.width = v16;
  v30.size.height = v18;
  v22 = MaxY - CGRectGetHeight(v30) + -5.0;
  v23 = -[PUFeedPlayerCell isPlayerHidden](self, "isPlayerHidden");
  v24 = -[PUFeedPlayerCell _shouldHideCommentButton](self, "_shouldHideCommentButton") | v23;
  -[PUFeedPlayerCell _playerView](self, "_playerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v23);

  -[PUFeedPlayerCell _layoutPlayerView](self, "_layoutPlayerView");
  objc_msgSend(v3, "setFrame:", v20, v22, v16, v18);
  objc_msgSend(v3, "setHidden:", v24);

}

- (int64_t)commentCount
{
  return self->_commentCount;
}

- (int)currentImageRequestID
{
  return self->_currentImageRequestID;
}

- (void)setCurrentImageRequestID:(int)a3
{
  self->_currentImageRequestID = a3;
}

- (BOOL)isPlayerHidden
{
  return self->_playerHidden;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (BOOL)isPhotoImageDegraded
{
  return self->_isPhotoImageDegraded;
}

- (double)photoTime
{
  return self->_photoTime;
}

- (void)setPhotoTime:(double)a3
{
  self->_photoTime = a3;
}

- (UICollectionView)containingCollectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_containingCollectionView);
}

- (BOOL)_isPerformingIrisPlayerChanges
{
  return self->__isPerformingIrisPlayerChanges;
}

- (void)_setPerformingIrisPlayerChanges:(BOOL)a3
{
  self->__isPerformingIrisPlayerChanges = a3;
}

- (BOOL)_needsUpdatePlayerItem
{
  return self->__needsUpdatePlayerItem;
}

- (void)_setNeedsUpdatePlayerItem:(BOOL)a3
{
  self->__needsUpdatePlayerItem = a3;
}

- (BOOL)_needsUpdateVitality
{
  return self->__needsUpdateVitality;
}

- (void)_setNeedsUpdateVitality:(BOOL)a3
{
  self->__needsUpdateVitality = a3;
}

- (ISLivePhotoPlayer)_player
{
  return self->__player;
}

- (ISLivePhotoUIView)_playerView
{
  return self->__playerView;
}

- (UIButton)_commentButton
{
  return self->__commentButton;
}

- (void)_setCommentButton:(id)a3
{
  objc_storeStrong((id *)&self->__commentButton, a3);
}

- (BOOL)_shouldHideCommentButton
{
  return self->__shouldHideCommentButton;
}

- (void)_setShouldHideCommentButton:(BOOL)a3
{
  self->__shouldHideCommentButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__commentButton, 0);
  objc_storeStrong((id *)&self->__playerView, 0);
  objc_storeStrong((id *)&self->__player, 0);
  objc_destroyWeak((id *)&self->_containingCollectionView);
  objc_storeStrong((id *)&self->_photoImage, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
}

uint64_t __35__PUFeedPlayerCell_prepareForReuse__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setVideoAsset:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotoImage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotoImageDegraded:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setPhotoTime:", -1000.0);
  return objc_msgSend(*(id *)(a1 + 32), "setPlayerHidden:", 0);
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end
