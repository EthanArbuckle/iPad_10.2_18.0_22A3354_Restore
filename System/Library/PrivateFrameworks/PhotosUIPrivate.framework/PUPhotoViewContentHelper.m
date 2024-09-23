@implementation PUPhotoViewContentHelper

- (PUPhotoViewContentHelper)init
{
  return -[PUPhotoViewContentHelper initWithContentView:](self, "initWithContentView:", 0);
}

- (PUPhotoViewContentHelper)initWithContentView:(id)a3
{
  id v4;
  PUPhotoViewContentHelper *v5;
  PUPhotoViewContentHelper *v6;
  uint64_t v7;
  UIColor *layerDefaultBackgroundColor;
  CGSize *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotoViewContentHelper;
  v5 = -[PUPhotoViewContentHelper init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_contentView, v4);
    v6->_fillMode = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
    layerDefaultBackgroundColor = v6->_layerDefaultBackgroundColor;
    v6->_layerDefaultBackgroundColor = (UIColor *)v7;

    v9 = (CGSize *)MEMORY[0x1E0D7D110];
    v6->_badgeStyle = 1;
    v6->_customPaddingForBadgeElements = *v9;
    v6->_contentAlpha = 1.0;
    v6->_continuousCorners = 1;
  }

  return v6;
}

- (CGRect)photoDecorationBorderViewFrameForImageContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PUPhotoViewContentHelper photoDecoration](self, "photoDecoration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "borderWidth");
  v9 = v8;

  v10 = x - v9;
  v11 = y - v9;
  v12 = -v9 - v9;
  v13 = width - v12;
  v14 = height - v12;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)imageContentFrameForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  int64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PUPhotoViewContentHelper fillMode](self, "fillMode");
  -[PUPhotoViewContentHelper photoSize](self, "photoSize");
  objc_msgSend((id)objc_opt_class(), "_imageContentFrameForBounds:imageSize:fillMode:", v8, x, y, width, height, v9, v10);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)imageContentFrame
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUPhotoViewContentHelper imageContentFrameForBounds:](self, "imageContentFrameForBounds:", v5, v7, v9, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  __int128 v5;
  PXAssetBadgeInfo badgeInfo;
  PXAssetBadgeInfo v7;

  v7 = *a3;
  badgeInfo = self->_badgeInfo;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    v5 = *(_OWORD *)&a3->count;
    *(_OWORD *)&self->_badgeInfo.badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&self->_badgeInfo.count = v5;
    -[PUPhotoViewContentHelper _invalidateBadgeView](self, "_invalidateBadgeView", *(_OWORD *)&badgeInfo.badges, *(_OWORD *)&badgeInfo.count, *(_OWORD *)&v7.badges, *(_OWORD *)&v7.count);
  }
}

- (void)setBadgeStyle:(int64_t)a3
{
  if (self->_badgeStyle != a3)
  {
    self->_badgeStyle = a3;
    -[PUPhotoViewContentHelper _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)setCustomPaddingForBadgeElements:(CGSize)a3
{
  if (a3.width != self->_customPaddingForBadgeElements.width
    || a3.height != self->_customPaddingForBadgeElements.height)
  {
    self->_customPaddingForBadgeElements = a3;
    -[PUPhotoViewContentHelper _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)setTextBannerVisible:(BOOL)a3
{
  if (self->_isTextBannerVisible != a3)
  {
    self->_isTextBannerVisible = a3;
    -[PUPhotoViewContentHelper _updateTextBannerView](self, "_updateTextBannerView");
  }
}

- (void)setFillMode:(int64_t)a3
{
  id WeakRetained;

  if (self->_fillMode != a3)
  {
    self->_fillMode = a3;
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
    -[PUPhotoViewContentHelper _updateLivePhotoView](self, "_updateLivePhotoView");
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setPhotoSize:(CGSize)a3
{
  id WeakRetained;

  if (self->_photoSize.width != a3.width || self->_photoSize.height != a3.height)
  {
    self->_photoSize = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (void)setImageTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[5];
  CGAffineTransform t2;
  CGAffineTransform t1;

  v5 = *(_OWORD *)&self->_imageTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_imageTransform.a;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_imageTransform.tx;
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v7 = *(_OWORD *)&a3->a;
    v8 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&self->_imageTransform.c = *(_OWORD *)&a3->c;
    *(_OWORD *)&self->_imageTransform.tx = v8;
    *(_OWORD *)&self->_imageTransform.a = v7;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PUPhotoViewContentHelper_setImageTransform___block_invoke;
    v9[3] = &unk_1E58ABD10;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v9);
  }
}

- (void)setTransitionSnapshotView:(id)a3
{
  UIView *v5;
  UIView *transitionSnapshotView;
  UIView *v7;

  v5 = (UIView *)a3;
  transitionSnapshotView = self->_transitionSnapshotView;
  if (transitionSnapshotView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](transitionSnapshotView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_transitionSnapshotView, a3);
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
    v5 = v7;
  }

}

- (void)setPhotoImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_photoImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_photoImage, a3);
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)setPlaceHolderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeHolderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeHolderImage, a3);
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)updatePhotoImageWithoutReconfiguring:(id)a3
{
  UIImage *v5;
  UIImageView *photoImageView;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  UIImage *v11;

  v5 = (UIImage *)a3;
  if (self->_photoImage != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_photoImage, a3);
    photoImageView = self->_photoImageView;
    if (photoImageView)
    {
      -[UIImageView setImage:](photoImageView, "setImage:", self->_photoImage);
    }
    else if (-[PUPhotoViewContentHelper needsAvalancheStack](self, "needsAvalancheStack"))
    {
      -[PUPhotoViewContentHelper _addAvalancheStackViewIfNecessary](self, "_addAvalancheStackViewIfNecessary");
      -[PUAvalancheStackView setImage:](self->_avalancheStackView, "setImage:", self->_photoImage);
      WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(WeakRetained, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContents:", 0);

    }
    else
    {
      -[PUPhotoViewContentHelper _removeAvalancheStackViewIfNecessary](self, "_removeAvalancheStackViewIfNecessary");
      v9 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setContents:", -[UIImage CGImage](self->_photoImage, "CGImage"));

    }
    v5 = v11;
  }

}

- (void)setPhotoDecoration:(id)a3
{
  PUPhotoDecoration *v4;
  PUPhotoDecoration *photoDecoration;
  BOOL v6;
  PUPhotoDecoration *v7;
  PUPhotoDecoration *v8;
  PUPhotoDecoration *v9;

  v4 = (PUPhotoDecoration *)a3;
  photoDecoration = self->_photoDecoration;
  if (photoDecoration != v4)
  {
    v9 = v4;
    v6 = -[PUPhotoDecoration isEqual:](photoDecoration, "isEqual:", v4);
    v4 = v9;
    if (!v6)
    {
      v7 = (PUPhotoDecoration *)-[PUPhotoDecoration copy](v9, "copy");
      v8 = self->_photoDecoration;
      self->_photoDecoration = v7;

      -[PUPhotoViewContentHelper _updatePhotoDecoration](self, "_updatePhotoDecoration");
      v4 = v9;
    }
  }

}

- (BOOL)isImageViewEdgeAntialiasingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PUPhotoViewContentHelper photoImageView](self, "photoImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsEdgeAntialiasing");

  return v4;
}

- (void)setImageViewEdgeAntialiasingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PUPhotoViewContentHelper photoImageView](self, "photoImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

}

- (void)setFlattensBadgeView:(BOOL)a3
{
  if (self->_flattensBadgeView != a3)
  {
    self->_flattensBadgeView = a3;
    -[PUPhotoViewContentHelper _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)setAvoidsPhotoDecoration:(BOOL)a3
{
  if (self->_avoidsPhotoDecoration != a3)
  {
    self->_avoidsPhotoDecoration = a3;
    -[PUPhotoViewContentHelper _updatePhotoDecoration](self, "_updatePhotoDecoration");
  }
}

- (BOOL)providesVisualFeedbackOnPress
{
  return self->_livePhotoView != 0;
}

- (void)setAnimatingRoundedCorners:(BOOL)a3
{
  if (self->_animatingRoundedCorners != a3)
  {
    self->_animatingRoundedCorners = a3;
    -[PUPhotoViewContentHelper _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PUPhotoViewContentHelper _updateHighlight](self, "_updateHighlight");
  }
}

- (void)setCornerRadius:(double)a3
{
  unint64_t v5;
  id v6;

  v5 = -[PUPhotoViewContentHelper cornersToRound](self, "cornersToRound");
  -[PUPhotoViewContentHelper overlayColor](self, "overlayColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoViewContentHelper setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:](self, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", v5, 0, v6, 1, a3);

}

- (void)setCornersToRound:(unint64_t)a3
{
  double v5;
  double v6;
  _BOOL8 v7;
  id v8;

  -[PUPhotoViewContentHelper cornerRadius](self, "cornerRadius");
  v6 = v5;
  v7 = -[PUPhotoViewContentHelper useOverlay](self, "useOverlay");
  -[PUPhotoViewContentHelper overlayColor](self, "overlayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoViewContentHelper setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:](self, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", a3, v7, v8, 1, v6);

}

- (void)setUseOverlay:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  unint64_t v7;
  id v8;

  v3 = a3;
  -[PUPhotoViewContentHelper cornerRadius](self, "cornerRadius");
  v6 = v5;
  v7 = -[PUPhotoViewContentHelper cornersToRound](self, "cornersToRound");
  -[PUPhotoViewContentHelper overlayColor](self, "overlayColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoViewContentHelper setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:](self, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", v7, v3, v8, 1, v6);

}

- (void)setOverlayColor:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[PUPhotoViewContentHelper cornerRadius](self, "cornerRadius");
  -[PUPhotoViewContentHelper setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:](self, "setCornerRadius:cornersToRound:useOverlay:overlayColor:continuousCorners:", -[PUPhotoViewContentHelper cornersToRound](self, "cornersToRound"), -[PUPhotoViewContentHelper useOverlay](self, "useOverlay"), v5, 1, v4);

}

- (void)setCornerRadius:(double)a3 cornersToRound:(unint64_t)a4 useOverlay:(BOOL)a5 overlayColor:(id)a6 continuousCorners:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v9;
  UIColor *v13;
  UIColor *v14;

  v7 = a7;
  v9 = a5;
  v13 = (UIColor *)a6;
  if (self->_cornerRadius != a3
    || self->_cornersToRound != a4
    || self->_useOverlay != v9
    || self->_overlayColor != v13
    || self->_continuousCorners != v7)
  {
    self->_cornerRadius = a3;
    self->_cornersToRound = a4;
    v14 = v13;
    self->_useOverlay = v9;
    objc_storeStrong((id *)&self->_overlayColor, a6);
    self->_continuousCorners = v7;
    -[PUPhotoViewContentHelper _updateLayerCornerRadius](self, "_updateLayerCornerRadius");
    -[PUPhotoViewContentHelper _updateRoundedCornersOverlayView](self, "_updateRoundedCornersOverlayView");
    v13 = v14;
  }

}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
  }
}

- (void)setDarkContentOverlayAlpha:(double)a3
{
  if (self->_darkContentOverlayAlpha != a3)
  {
    self->_darkContentOverlayAlpha = a3;
    -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
  }
}

- (void)setLivePhotoHidden:(BOOL)a3
{
  if (self->_livePhotoHidden != a3)
  {
    self->_livePhotoHidden = a3;
    -[PUPhotoViewContentHelper _updateLivePhotoViewVisibility](self, "_updateLivePhotoViewVisibility");
  }
}

- (void)setShouldPrepareForPlayback:(BOOL)a3
{
  if (self->_shouldPrepareForPlayback != a3)
  {
    self->_shouldPrepareForPlayback = a3;
    -[PUPhotoViewContentHelper _updateLivePhotoViewPreparing](self, "_updateLivePhotoViewPreparing");
  }
}

- (void)setShowsLivePhoto:(BOOL)a3
{
  if (self->_showsLivePhoto != a3)
  {
    self->_showsLivePhoto = a3;
    -[PUPhotoViewContentHelper _updateLivePhotoView](self, "_updateLivePhotoView");
  }
}

- (void)setLivePhoto:(id)a3
{
  PHLivePhoto *v5;
  PHLivePhoto *livePhoto;
  char v7;
  PHLivePhoto *v8;

  v5 = (PHLivePhoto *)a3;
  livePhoto = self->_livePhoto;
  if (livePhoto != v5)
  {
    v8 = v5;
    v7 = -[PHLivePhoto isEqual:](livePhoto, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_livePhoto, a3);
      -[PUPhotoViewContentHelper _updateLivePhotoView](self, "_updateLivePhotoView");
      v5 = v8;
    }
  }

}

- (void)startPlaybackWithStyle:(int64_t)a3
{
  if (self->_livePhotoView)
  {
    -[PUPhotoViewContentHelper setShouldPrepareForPlayback:](self, "setShouldPrepareForPlayback:", 1);
    -[PHLivePhotoView startPlaybackWithStyle:](self->_livePhotoView, "startPlaybackWithStyle:", a3);
  }
  else
  {
    -[PUPhotoViewContentHelper _startPlaybackWhenLivePhotoAvailableWithStyle:](self, "_startPlaybackWhenLivePhotoAvailableWithStyle:", a3);
  }
}

- (void)stopPlayback
{
  self->_hasPendingPlaybackRequest = 0;
  -[PHLivePhotoView stopPlayback](self->_livePhotoView, "stopPlayback");
}

- (void)_updateLivePhotoViewVisibility
{
  -[PHLivePhotoView setHidden:](self->_livePhotoView, "setHidden:", self->_livePhotoHidden);
}

- (void)_updateLivePhotoViewPreparing
{
  -[PHLivePhotoView setTargetReadiness:](self->_livePhotoView, "setTargetReadiness:", 2);
}

- (void)_startPlaybackWhenLivePhotoAvailableWithStyle:(int64_t)a3
{
  self->_hasPendingPlaybackRequest = 1;
  self->_pendingPlaybackRequestStyle = a3;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToLivePhotoWillBeginPlaybackWithStyle = objc_opt_respondsToSelector() & 1;

  }
}

- (void)setLoopingVideoAsset:(id)a3
{
  AVAsset *v4;
  AVAsset *loopingVideoAsset;

  if (self->_loopingVideoAsset != a3)
  {
    v4 = (AVAsset *)objc_msgSend(a3, "copy");
    loopingVideoAsset = self->_loopingVideoAsset;
    self->_loopingVideoAsset = v4;

    -[PUPhotoViewContentHelper _invalidateLoopingVideoView](self, "_invalidateLoopingVideoView");
  }
}

- (void)setAnimatedImage:(id)a3
{
  PHAnimatedImage *v5;
  PHAnimatedImage *v6;

  v5 = (PHAnimatedImage *)a3;
  if (self->_animatedImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_animatedImage, a3);
    -[PUPhotoViewContentHelper _invalidateAnimatedImageView](self, "_invalidateAnimatedImageView");
    v5 = v6;
  }

}

- (void)setLoopingPlaybackAllowed:(BOOL)a3
{
  if (self->_loopingPlaybackAllowed != a3)
  {
    self->_loopingPlaybackAllowed = a3;
    -[PUPhotoViewContentHelper _invalidateAnimatedImageView](self, "_invalidateAnimatedImageView");
  }
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  id WeakRetained;

  if (self->_delegateFlags.respondsToLivePhotoWillBeginPlaybackWithStyle)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "photoViewContentHelper:livePhotoWillBeginPlaybackWithStyle:", self, a4);

  }
}

- (void)_removePhotoImageViewIfNecessary
{
  UIImageView *photoImageView;

  photoImageView = self->_photoImageView;
  if (photoImageView)
  {
    -[UIImageView removeFromSuperview](photoImageView, "removeFromSuperview");
    -[PUPhotoViewContentHelper setPhotoImageView:](self, "setPhotoImageView:", 0);
  }
}

- (void)_addAvalancheStackViewIfNecessary
{
  PUAvalancheStackView *v3;
  PUAvalancheStackView *avalancheStackView;
  CGColor *v5;
  void *v6;
  id WeakRetained;
  id v8;

  if (!self->_avalancheStackView)
  {
    v3 = objc_alloc_init(PUAvalancheStackView);
    avalancheStackView = self->_avalancheStackView;
    self->_avalancheStackView = v3;

    -[PUAvalancheStackView setContentMode:](self->_avalancheStackView, "setContentMode:", -[PUPhotoViewContentHelper fillMode](self, "fillMode"));
    v5 = -[PUPhotoViewContentHelper avalancheStackBackgroundColor](self, "avalancheStackBackgroundColor");
    -[PUAvalancheStackView layer](self->_avalancheStackView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "addSubview:", self->_avalancheStackView);

    -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
    v8 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v8, "setNeedsLayout");

  }
}

- (void)_removeAvalancheStackViewIfNecessary
{
  PUAvalancheStackView *avalancheStackView;

  avalancheStackView = self->_avalancheStackView;
  if (avalancheStackView)
  {
    -[PUAvalancheStackView removeFromSuperview](avalancheStackView, "removeFromSuperview");
    -[PUPhotoViewContentHelper setAvalancheStackView:](self, "setAvalancheStackView:", 0);
  }
}

- (void)_updateLivePhotoView
{
  _BOOL4 showsLivePhoto;
  PHLivePhotoView *livePhotoView;
  id v6;
  id WeakRetained;
  PHLivePhotoView *v8;
  PHLivePhotoView *v9;
  id v10;
  id v11;
  unint64_t fillMode;
  uint64_t v13;
  PHLivePhotoView *v14;
  void *v15;

  showsLivePhoto = self->_showsLivePhoto;
  livePhotoView = self->_livePhotoView;
  if (showsLivePhoto)
  {
    if (!livePhotoView)
    {
      v6 = objc_alloc(MEMORY[0x1E0CD2160]);
      WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(WeakRetained, "bounds");
      v8 = (PHLivePhotoView *)objc_msgSend(v6, "initWithFrame:");
      v9 = self->_livePhotoView;
      self->_livePhotoView = v8;

      v10 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v10, "addSubview:", self->_livePhotoView);

      -[PHLivePhotoView setDelegate:](self->_livePhotoView, "setDelegate:", self);
      -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
      v11 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v11, "setNeedsLayout");

      -[PUPhotoViewContentHelper _updateLivePhotoViewVisibility](self, "_updateLivePhotoViewVisibility");
      -[PUPhotoViewContentHelper _updateLivePhotoViewPreparing](self, "_updateLivePhotoViewPreparing");
    }
    fillMode = self->_fillMode;
    if (fillMode > 2)
      v13 = 0;
    else
      v13 = qword_1AB0EFEE0[fillMode];
    -[PHLivePhotoView setContentMode:](self->_livePhotoView, "setContentMode:", v13);
    -[PHLivePhotoView setLivePhoto:](self->_livePhotoView, "setLivePhoto:", self->_livePhoto);
    if (self->_hasPendingPlaybackRequest)
    {
      self->_hasPendingPlaybackRequest = 0;
      if (!self->_pendingPlaybackRequestStyle)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoView.m"), 692, CFSTR("Trying to start playback with PHLivePhotoViewPlaybackStyleUndefined"));

      }
      -[PUPhotoViewContentHelper startPlaybackWithStyle:](self, "startPlaybackWithStyle:");
    }
  }
  else
  {
    -[PHLivePhotoView removeFromSuperview](livePhotoView, "removeFromSuperview");
    v14 = self->_livePhotoView;
    self->_livePhotoView = 0;

  }
}

- (void)_updateImageView
{
  int v3;
  UIImage *photoImage;
  UIImage *placeHolderImage;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  UIImageView *photoImageView;
  void *v15;
  UIImageView *v16;
  double v17;
  UIView *v18;
  UIView *darkContentOverlay;
  UIView *v20;
  void *v21;
  id v22;
  unint64_t fillMode;
  uint64_t v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  PUAvalancheStackView *avalancheStackView;
  void *v31;
  id v32;
  void *v33;
  unint64_t v34;
  id v35;
  PUBackgroundColorView *photoDecorationBorderView;
  PUBackgroundColorView *photoDecorationOverlayView;
  UIImage *v38;

  if (!self->_avoidsImageViewIfPossible
    || self->_hasTransform
    || (photoDecorationBorderView = self->_photoDecorationBorderView) != 0
    && !-[PUBackgroundColorView isHidden](photoDecorationBorderView, "isHidden"))
  {
    v3 = 1;
  }
  else
  {
    photoDecorationOverlayView = self->_photoDecorationOverlayView;
    if (photoDecorationOverlayView)
      v3 = -[PUBackgroundColorView isHidden](photoDecorationOverlayView, "isHidden") ^ 1;
    else
      v3 = 0;
  }
  photoImage = self->_photoImage;
  if (!photoImage)
    photoImage = self->_placeHolderImage;
  v38 = photoImage;
  if (self->_photoImage)
  {
    placeHolderImage = self->_placeHolderImage;
    if (placeHolderImage)
    {
      self->_placeHolderImage = 0;

    }
  }
  self->_hasLayerBackgroundColor = 0;
  if (v3)
  {
    -[PUPhotoViewContentHelper _removeAvalancheStackViewIfNecessary](self, "_removeAvalancheStackViewIfNecessary");
    if (!self->_photoImageView)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[PUPhotoViewContentHelper setPhotoImageView:](self, "setPhotoImageView:", v6);
      objc_msgSend(v6, "setClipsToBounds:", 1);
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

      WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(WeakRetained, "addSubview:", v6);

      v9 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v9, "layoutIfNeeded");

      -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
    }
    -[PUPhotoViewContentHelper _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
    v10 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContents:", 0);

    v12 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", 0);

    -[UIImageView setImage:](self->_photoImageView, "setImage:", v38);
    photoImageView = self->_photoImageView;
    -[PUPhotoViewContentHelper backgroundColor](self, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](photoImageView, "setBackgroundColor:", v15);

    v16 = self->_photoImageView;
    -[PUPhotoViewContentHelper contentAlpha](self, "contentAlpha");
    -[UIImageView setAlpha:](v16, "setAlpha:");
    if (self->_transitionSnapshotView)
    {
      -[UIImageView bounds](self->_photoImageView, "bounds");
      -[UIView setFrame:](self->_transitionSnapshotView, "setFrame:");
      -[UIImageView addSubview:](self->_photoImageView, "addSubview:", self->_transitionSnapshotView);
    }
    -[PUPhotoViewContentHelper darkContentOverlayAlpha](self, "darkContentOverlayAlpha");
    if (v17 > 0.0 && !self->_darkContentOverlay)
    {
      v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      darkContentOverlay = self->_darkContentOverlay;
      self->_darkContentOverlay = v18;

      v20 = self->_darkContentOverlay;
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v20, "setBackgroundColor:", v21);

      v22 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v22, "addSubview:", self->_darkContentOverlay);

    }
    -[PUPhotoViewContentHelper darkContentOverlayAlpha](self, "darkContentOverlayAlpha");
    -[UIView setAlpha:](self->_darkContentOverlay, "setAlpha:");
    fillMode = self->_fillMode;
    if (fillMode > 2)
      v24 = 0;
    else
      v24 = qword_1AB0EFEE0[fillMode];
    -[UIView setContentMode:](self->_transitionSnapshotView, "setContentMode:", v24);
    -[UIImageView setContentMode:](self->_photoImageView, "setContentMode:", v24);
    -[UIImageView setContentMode:](self->__crossfadeImageView, "setContentMode:", v24);
  }
  else
  {
    v25 = -[PUPhotoViewContentHelper needsAvalancheStack](self, "needsAvalancheStack");
    -[PUPhotoViewContentHelper _removePhotoImageViewIfNecessary](self, "_removePhotoImageViewIfNecessary");
    if (v25)
    {
      -[PUPhotoViewContentHelper _addAvalancheStackViewIfNecessary](self, "_addAvalancheStackViewIfNecessary");
      -[PUPhotoViewContentHelper _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
      v26 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v26, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setContents:", 0);

      v28 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v28, "layer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBackgroundColor:", 0);

      -[PUAvalancheStackView setImage:](self->_avalancheStackView, "setImage:", v38);
      avalancheStackView = self->_avalancheStackView;
      -[PUPhotoViewContentHelper backgroundColor](self, "backgroundColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAvalancheStackView setBackgroundColor:](avalancheStackView, "setBackgroundColor:", v31);

    }
    else
    {
      -[PUPhotoViewContentHelper _removeAvalancheStackViewIfNecessary](self, "_removeAvalancheStackViewIfNecessary");
      -[PUPhotoViewContentHelper _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
      v32 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v32, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setContents:", -[UIImage CGImage](objc_retainAutorelease(v38), "CGImage"));
      if (PUMainScreenScale_onceToken != -1)
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
      objc_msgSend(v33, "setContentsScale:", *(double *)&PUMainScreenScale_screenScale);
      self->_hasLayerBackgroundColor = 1;
      -[PUPhotoViewContentHelper _updateLayerBackgroundColorIfNeeded](self, "_updateLayerBackgroundColorIfNeeded");
      v34 = self->_fillMode;
      if (v34 > 2)
        v35 = 0;
      else
        v35 = **((id **)&unk_1E58A5A60 + v34);
      objc_msgSend(v33, "setContentsGravity:", v35);

    }
  }

}

- (void)_updateLayerBackgroundColorIfNeeded
{
  id WeakRetained;
  UIColor *v4;
  UIColor *layerDefaultBackgroundColor;
  UIColor *v6;
  UIColor *v7;
  uint64_t v8;
  id v9;

  if (self->_hasLayerBackgroundColor)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "layer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[PUPhotoViewContentHelper backgroundColor](self, "backgroundColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    layerDefaultBackgroundColor = v4;
    if (!v4)
      layerDefaultBackgroundColor = self->_layerDefaultBackgroundColor;
    v6 = layerDefaultBackgroundColor;

    v7 = objc_retainAutorelease(v6);
    v8 = -[UIColor CGColor](v7, "CGColor");

    objc_msgSend(v9, "setBackgroundColor:", v8);
  }
}

- (void)_updateContentViewClipsToBounds
{
  _BOOL8 v3;
  double v4;
  UIView **p_contentView;
  id WeakRetained;
  int v7;
  id v8;

  if ((self->_photoImageView || self->_avalancheStackView)
    && !-[PUPhotoViewContentHelper isAnimatingRoundedCorners](self, "isAnimatingRoundedCorners"))
  {
    -[PUPhotoViewContentHelper cornerRadius](self, "cornerRadius");
    v3 = v4 != 0.0;
  }
  else
  {
    v3 = 1;
  }
  p_contentView = &self->_contentView;
  WeakRetained = objc_loadWeakRetained((id *)p_contentView);
  v7 = objc_msgSend(WeakRetained, "clipsToBounds");

  if (v3 != v7)
  {
    v8 = objc_loadWeakRetained((id *)p_contentView);
    objc_msgSend(v8, "setClipsToBounds:", v3);

  }
}

- (void)_updateSubviewOrdering
{
  UIView **p_contentView;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  p_contentView = &self->_contentView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "bringSubviewToFront:", self->_avalancheStackView);

  v5 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v5, "bringSubviewToFront:", self->_photoDecorationBorderView);

  v6 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v6, "bringSubviewToFront:", self->__crossfadeImageView);

  v7 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v7, "bringSubviewToFront:", self->_photoImageView);

  v8 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v8, "bringSubviewToFront:", self->_livePhotoView);

  v9 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v9, "bringSubviewToFront:", self->_loopingVideoView);

  v10 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v10, "bringSubviewToFront:", self->_animatedImageView);

  v11 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v11, "bringSubviewToFront:", self->_photoDecorationOverlayView);

  v12 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v12, "bringSubviewToFront:", self->__badgeView);

  v13 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v13, "bringSubviewToFront:", self->_textBannerView);

  v14 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v14, "bringSubviewToFront:", self->__titleSubtitleLabel);

  v15 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v15, "bringSubviewToFront:", self->__highlightOverlayView);

  v16 = objc_loadWeakRetained((id *)p_contentView);
  objc_msgSend(v16, "bringSubviewToFront:", self->_roundedCornerOverlayView);

}

- (void)_updateTextBannerView
{
  _BOOL4 isTextBannerVisible;
  PXTextBannerView *textBannerView;
  PXTextBannerView *v5;
  PXTextBannerView *v6;
  void *v7;
  id WeakRetained;
  id v9;

  isTextBannerVisible = self->_isTextBannerVisible;
  textBannerView = self->_textBannerView;
  if (isTextBannerVisible)
  {
    if (!textBannerView)
    {
      v5 = (PXTextBannerView *)objc_alloc_init(MEMORY[0x1E0D7BAE0]);
      v6 = self->_textBannerView;
      self->_textBannerView = v5;

      textBannerView = self->_textBannerView;
    }
    -[PXTextBannerView superview](textBannerView, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(WeakRetained, "addSubview:", self->_textBannerView);

      -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
    }
  }
  else
  {
    -[PXTextBannerView removeFromSuperview](textBannerView, "removeFromSuperview");
  }
  v9 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v9, "setNeedsLayout");

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.loopingVideoView
      || self->_needsUpdateFlags.titleSubtitleUILabel
      || self->_needsUpdateFlags.animatedImageView;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUPhotoViewContentHelper _needsUpdate](self, "_needsUpdate"))
  {
    -[PUPhotoViewContentHelper _updateTitleSubtitleUILabelIfNeeded](self, "_updateTitleSubtitleUILabelIfNeeded");
    -[PUPhotoViewContentHelper _updateLoopingVideoViewIfNeeded](self, "_updateLoopingVideoViewIfNeeded");
    -[PUPhotoViewContentHelper _updateAnimatedImageViewIfNeeded](self, "_updateAnimatedImageViewIfNeeded");
    if (-[PUPhotoViewContentHelper _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoView.m"), 877, CFSTR("%@: update still needed at end of update pass"), self);

    }
  }
}

- (void)_updateBadgeView
{
  _BOOL4 v3;
  uint64_t IsNull;
  id v5;
  uint64_t v6;
  id WeakRetained;
  id v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  -[PUPhotoViewContentHelper badgeInfo](self, "badgeInfo");
  v3 = -[PUPhotoViewContentHelper flattensBadgeView](self, "flattensBadgeView");
  IsNull = PXAssetBadgeInfoIsNull();
  -[PUPhotoViewContentHelper _badgeView](self, "_badgeView", (unsigned __int128)0, (unsigned __int128)0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((IsNull & 1) != 0)
    goto LABEL_9;
  v6 = objc_opt_class();
  if (((v3 ^ (v6 != objc_opt_class())) & 1) != 0)
  {
    if (v5)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

  }
  v5 = objc_alloc_init((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "addSubview:", v5);

  -[PUPhotoViewContentHelper _setBadgeView:](self, "_setBadgeView:", v5);
  -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
LABEL_7:
  v9[0] = v10;
  v9[1] = v11;
  objc_msgSend(v5, "setBadgeInfo:", v9);
  objc_msgSend(v5, "setStyle:", -[PUPhotoViewContentHelper badgeStyle](self, "badgeStyle"));
  -[PUPhotoViewContentHelper customPaddingForBadgeElements](self, "customPaddingForBadgeElements");
  if ((PXSizeIsNull() & 1) == 0)
  {
    -[PUPhotoViewContentHelper customPaddingForBadgeElements](self, "customPaddingForBadgeElements");
    objc_msgSend(v5, "setBottomElementsPadding:");
  }
LABEL_9:
  objc_msgSend(v5, "setHidden:", IsNull);
  v8 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)_updatePhotoDecoration
{
  _BOOL4 v3;
  PUBackgroundColorView *photoDecorationBorderView;
  int v5;
  void *WeakRetained;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  PUBackgroundColorView *v15;
  PUBackgroundColorView *v16;
  PUBackgroundColorView *v17;
  void *v18;
  PUBackgroundColorView *v19;
  void *v20;
  PUBackgroundColorView *v21;
  PUBackgroundColorView *photoDecorationOverlayView;
  PUBackgroundColorView *v23;
  void *v24;
  PUBackgroundColorView *v25;
  PUBackgroundColorView *v26;
  id v27;
  id v28;

  -[PUPhotoViewContentHelper photoDecoration](self, "photoDecoration");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PUPhotoViewContentHelper avoidsPhotoDecoration](self, "avoidsPhotoDecoration");
  if (v3)
  {
    photoDecorationBorderView = self->_photoDecorationBorderView;
    if (photoDecorationBorderView)
    {
      -[PUBackgroundColorView removeFromSuperview](photoDecorationBorderView, "removeFromSuperview");
      v5 = 0;
      WeakRetained = self->_photoDecorationBorderView;
      self->_photoDecorationBorderView = 0;
LABEL_13:
      v13 = !v3;

      v14 = 1;
      goto LABEL_14;
    }
    v5 = 0;
LABEL_8:
    v13 = 0;
    v14 = 0;
LABEL_14:
    v12 = v28;
    goto LABEL_15;
  }
  objc_msgSend(v28, "borderWidth");
  v8 = v7;
  objc_msgSend(v28, "foregroundColor");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v28, "foregroundColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = CGColorGetAlpha((CGColorRef)objc_msgSend(v11, "CGColor")) > 0.0;

    if (v8 <= 0.0)
      goto LABEL_8;
    v12 = v28;
  }
  else
  {
    v5 = 0;
    v13 = 0;
    v14 = 0;
    v12 = v28;
    if (v8 <= 0.0)
      goto LABEL_15;
  }
  if (!self->_photoDecorationBorderView)
  {
    v15 = objc_alloc_init(PUBackgroundColorView);
    v16 = self->_photoDecorationBorderView;
    self->_photoDecorationBorderView = v15;

    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "addSubview:", self->_photoDecorationBorderView);
    goto LABEL_13;
  }
  v14 = 0;
  v13 = 1;
LABEL_15:
  v17 = self->_photoDecorationBorderView;
  objc_msgSend(v12, "borderColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBackgroundColorView _puSetBackgroundColor:](v17, "_puSetBackgroundColor:", v18);

  if (v5 && !self->_photoDecorationOverlayView)
  {
    v21 = objc_alloc_init(PUBackgroundColorView);
    photoDecorationOverlayView = self->_photoDecorationOverlayView;
    self->_photoDecorationOverlayView = v21;

    v20 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v20, "addSubview:", self->_photoDecorationOverlayView);
    goto LABEL_21;
  }
  if (v3)
  {
    v19 = self->_photoDecorationOverlayView;
    if (v19)
    {
      -[PUBackgroundColorView removeFromSuperview](v19, "removeFromSuperview");
      v20 = self->_photoDecorationOverlayView;
      self->_photoDecorationOverlayView = 0;
LABEL_21:

      v14 = 1;
    }
  }
  v23 = self->_photoDecorationOverlayView;
  objc_msgSend(v28, "foregroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBackgroundColorView _puSetBackgroundColor:](v23, "_puSetBackgroundColor:", v24);

  v25 = self->_photoDecorationBorderView;
  if (v25 && v13 == -[PUBackgroundColorView isHidden](v25, "isHidden"))
  {
    -[PUBackgroundColorView setHidden:](self->_photoDecorationBorderView, "setHidden:", v13 ^ 1u);
    v14 = 1;
  }
  v26 = self->_photoDecorationOverlayView;
  if (v26 && v5 == -[PUBackgroundColorView isHidden](v26, "isHidden"))
  {
    -[PUBackgroundColorView setHidden:](self->_photoDecorationOverlayView, "setHidden:", v5 ^ 1u);
  }
  else if (!v14)
  {
    goto LABEL_31;
  }
  -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
  -[PUPhotoViewContentHelper _updateImageView](self, "_updateImageView");
  v27 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v27, "setNeedsLayout");

LABEL_31:
}

- (void)_updateLayerCornerRadius
{
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PUPhotoViewContentHelper contentView](self, "contentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0.0;
  if (!self->_useOverlay)
  {
    -[PUPhotoViewContentHelper cornerRadius](self, "cornerRadius");
    v4 = v5;
  }
  objc_msgSend(v3, "cornerRadius");
  if (v6 != v4)
  {
    objc_msgSend(v3, "setCornerRadius:", v4);
    objc_msgSend(v3, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    -[PUPhotoViewContentHelper _updateContentViewClipsToBounds](self, "_updateContentViewClipsToBounds");
    objc_msgSend(v7, "setNeedsLayout");
  }

}

- (void)_updateRoundedCornersOverlayView
{
  UIColor *overlayColor;
  uint64_t v4;
  id v5;
  id WeakRetained;
  _QWORD v7[5];

  if (self->_cornerRadius > 0.0 && self->_useOverlay)
  {
    overlayColor = self->_overlayColor;
    -[PUPhotoViewContentHelper roundedCornerOverlayView](self, "roundedCornerOverlayView");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (id)v4;
    if (overlayColor)
    {
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0D7B8B8]);
        WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        objc_msgSend(WeakRetained, "addSubview:", v5);

        -[PUPhotoViewContentHelper setRoundedCornerOverlayView:](self, "setRoundedCornerOverlayView:", v5);
        -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
      }
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __60__PUPhotoViewContentHelper__updateRoundedCornersOverlayView__block_invoke;
      v7[3] = &unk_1E58A5A40;
      v7[4] = self;
      objc_msgSend(v5, "performChanges:", v7);
      goto LABEL_10;
    }
  }
  else
  {
    -[PUPhotoViewContentHelper roundedCornerOverlayView](self, "roundedCornerOverlayView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v5)
    return;
  objc_msgSend(v5, "removeFromSuperview");
  -[PUPhotoViewContentHelper setRoundedCornerOverlayView:](self, "setRoundedCornerOverlayView:", 0);
LABEL_10:

}

- (void)_updateHighlight
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = -[PUPhotoViewContentHelper isHighlighted](self, "isHighlighted");
  -[PUPhotoViewContentHelper _highlightOverlayView](self, "_highlightOverlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "bounds");
    v9 = (id)objc_msgSend(v5, "initWithFrame:");

    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v7);

    objc_msgSend(v9, "setAlpha:", 0.5);
    v8 = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(v8, "addSubview:", v9);

    -[PUPhotoViewContentHelper _setHighlightOverlayView:](self, "_setHighlightOverlayView:", v9);
    -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
    v4 = v9;
  }
  v10 = v4;
  objc_msgSend(v4, "setHidden:", !v3);

}

- (void)setFeatureSpec:(id)a3
{
  PXFeatureSpec *v5;
  PXFeatureSpec *v6;

  v5 = (PXFeatureSpec *)a3;
  if (self->_featureSpec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_featureSpec, a3);
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)setCollectionTileLayoutTemplate:(id)a3
{
  PXCollectionTileLayoutTemplate *v5;
  PXCollectionTileLayoutTemplate *v6;

  v5 = (PXCollectionTileLayoutTemplate *)a3;
  if (self->_collectionTileLayoutTemplate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, a3);
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)setTitleFontName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_titleFontName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleFontName, a3);
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)setTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_subtitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitle, a3);
    -[PUPhotoViewContentHelper _invalidateTitleSubtitleUILabel](self, "_invalidateTitleSubtitleUILabel");
    v5 = v6;
  }

}

- (void)_setAudioSession:(id)a3
{
  ISWrappedAVAudioSession *v5;
  ISWrappedAVAudioSession *v6;

  v5 = (ISWrappedAVAudioSession *)a3;
  if (self->__audioSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__audioSession, a3);
    -[PUPhotoViewContentHelper _invalidateLoopingVideoView](self, "_invalidateLoopingVideoView");
    v5 = v6;
  }

}

- (void)_invalidateLoopingVideoView
{
  id WeakRetained;

  self->_needsUpdateFlags.loopingVideoView = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_updateLoopingVideoViewIfNeeded
{
  void *v3;
  ISWrappedAVPlayer *v4;
  ISWrappedAVPlayer *loopingVideoPlayer;
  double v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  PXVideoPlayerView *v10;
  PXVideoPlayerView *loopingVideoView;
  id v12;
  ISWrappedAVPlayer *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  PXVideoPlayerView *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  _QWORD block[4];
  id v31;
  id location;

  if (self->_needsUpdateFlags.loopingVideoView)
  {
    self->_needsUpdateFlags.loopingVideoView = 0;
    -[PUPhotoViewContentHelper loopingVideoAsset](self, "loopingVideoAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (!self->_loopingVideoPlayer)
      {
        v4 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E0D78298]);
        loopingVideoPlayer = self->_loopingVideoPlayer;
        self->_loopingVideoPlayer = v4;

        -[ISWrappedAVPlayer setIsAudioEnabled:](self->_loopingVideoPlayer, "setIsAudioEnabled:", 0);
        LODWORD(v6) = 0;
        -[ISWrappedAVPlayer setVolume:](self->_loopingVideoPlayer, "setVolume:", v6);
        -[ISWrappedAVPlayer setPreventsSleepDuringVideoPlayback:](self->_loopingVideoPlayer, "setPreventsSleepDuringVideoPlayback:", 0);
        objc_initWeak(&location, self);
        dispatch_get_global_queue(2, 0);
        v7 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke;
        block[3] = &unk_1E58AB2F8;
        objc_copyWeak(&v31, &location);
        dispatch_async(v7, block);

        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);
      }
      if (!self->_loopingVideoView)
      {
        v8 = objc_alloc(MEMORY[0x1E0D7BBC0]);
        WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        objc_msgSend(WeakRetained, "bounds");
        v10 = (PXVideoPlayerView *)objc_msgSend(v8, "initWithFrame:");
        loopingVideoView = self->_loopingVideoView;
        self->_loopingVideoView = v10;

        -[PXVideoPlayerView setAlpha:](self->_loopingVideoView, "setAlpha:", 0.0);
        v12 = objc_loadWeakRetained((id *)&self->_contentView);
        objc_msgSend(v12, "addSubview:", self->_loopingVideoView);

        -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
        v13 = self->_loopingVideoPlayer;
        v14 = (void *)MEMORY[0x1E0C8B300];
        -[PUPhotoViewContentHelper loopingVideoAsset](self, "loopingVideoAsset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "playerItemWithAsset:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ISWrappedAVPlayer setLoopingEnabled:withTemplateItem:](v13, "setLoopingEnabled:withTemplateItem:", 1, v16);

        -[PXVideoPlayerView setPlayer:](self->_loopingVideoView, "setPlayer:", self->_loopingVideoPlayer);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_3;
        v29[3] = &unk_1E58ABD10;
        v29[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v29, 0, 0.3, 0.0);
      }
      -[PUPhotoViewContentHelper _audioSession](self, "_audioSession");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        -[ISWrappedAVPlayer setWrappedAudioSession:](self->_loopingVideoPlayer, "setWrappedAudioSession:", v17);
        LODWORD(v18) = 1.0;
        -[ISWrappedAVPlayer setRate:](self->_loopingVideoPlayer, "setRate:", v18);
      }
    }
    else
    {
      if (!self->_loopingVideoView)
        return;
      v19 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v19, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[PXVideoPlayerView snapshotViewAfterScreenUpdates:](self->_loopingVideoView, "snapshotViewAfterScreenUpdates:", 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_loadWeakRetained((id *)&self->_contentView);
        objc_msgSend(v21, "insertSubview:aboveSubview:", v17, self->_loopingVideoView);

      }
      else
      {
        v17 = 0;
      }
      -[ISWrappedAVPlayer setLoopingEnabled:](self->_loopingVideoPlayer, "setLoopingEnabled:", 0);
      -[PXVideoPlayerView removeFromSuperview](self->_loopingVideoView, "removeFromSuperview");
      v22 = self->_loopingVideoView;
      self->_loopingVideoView = 0;

      if (v17)
      {
        v23 = (void *)MEMORY[0x1E0DC3F10];
        v24 = MEMORY[0x1E0C809B0];
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_4;
        v27[3] = &unk_1E58ABD10;
        v28 = v17;
        v25[0] = v24;
        v25[1] = 3221225472;
        v25[2] = __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_5;
        v25[3] = &unk_1E58A9910;
        v17 = v28;
        v26 = v17;
        objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 2, v27, v25, 0.3, 0.0);

      }
    }

  }
}

- (void)_invalidateAnimatedImageView
{
  id WeakRetained;

  self->_needsUpdateFlags.animatedImageView = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_updateAnimatedImageViewIfNeeded
{
  void *v3;
  ISAnimatedImageView *animatedImageView;
  id v5;
  ISAnimatedImageView *v6;
  ISAnimatedImageView *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  if (self->_needsUpdateFlags.animatedImageView)
  {
    self->_needsUpdateFlags.animatedImageView = 0;
    -[PUPhotoViewContentHelper animatedImage](self, "animatedImage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    animatedImageView = self->_animatedImageView;
    if (v3)
    {
      if (!animatedImageView)
      {
        v5 = objc_alloc(MEMORY[0x1E0D78258]);
        v6 = (ISAnimatedImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        v7 = self->_animatedImageView;
        self->_animatedImageView = v6;

        -[ISAnimatedImageView setContentMode:](self->_animatedImageView, "setContentMode:", 2);
        -[ISAnimatedImageView setClipsToBounds:](self->_animatedImageView, "setClipsToBounds:", 1);
        WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
        objc_msgSend(WeakRetained, "addSubview:", self->_animatedImageView);

        -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
      }
      -[PUPhotoViewContentHelper animatedImage](self, "animatedImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pf_animatedImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISAnimatedImageView setImage:](self->_animatedImageView, "setImage:", v10);

      v11 = objc_loadWeakRetained((id *)&self->_contentView);
      objc_msgSend(v11, "bounds");
      -[ISAnimatedImageView setFrame:](self->_animatedImageView, "setFrame:");

      -[ISAnimatedImageView setHidden:](self->_animatedImageView, "setHidden:", 0);
      -[ISAnimatedImageView setPlaying:](self->_animatedImageView, "setPlaying:", self->_loopingPlaybackAllowed);
    }
    else
    {
      -[ISAnimatedImageView setHidden:](animatedImageView, "setHidden:", 1);
    }
    -[UIImageView setHidden:](self->_photoImageView, "setHidden:", v3 != 0);
  }
}

- (void)_invalidateTitleSubtitleUILabel
{
  id WeakRetained;

  self->_needsUpdateFlags.titleSubtitleUILabel = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "setNeedsLayout");

}

- (void)_updateTitleSubtitleUILabelIfNeeded
{
  UIImage *photoImage;
  void *v4;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;

  if (!self->_needsUpdateFlags.titleSubtitleUILabel)
    return;
  self->_needsUpdateFlags.titleSubtitleUILabel = 0;
  if (!-[NSString length](self->_title, "length") && !-[NSString length](self->_subtitle, "length")
    || !self->_featureSpec
    || !self->_collectionTileLayoutTemplate)
  {
    -[PUPhotoViewContentHelper _titleSubtitleLabel](self, "_titleSubtitleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = v4;
    objc_msgSend(v4, "removeFromSuperview");
    -[PUPhotoViewContentHelper _setTitleSubtitleUILabel:](self, "_setTitleSubtitleUILabel:", 0);

    return;
  }
  photoImage = self->_photoImage;
  -[PUPhotoViewContentHelper _titleSubtitleLabel](self, "_titleSubtitleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!photoImage)
    goto LABEL_11;
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7BB00]);
    -[PXCollectionTileLayoutTemplate titleSubtitleRect](self->_collectionTileLayoutTemplate, "titleSubtitleRect");
    v7 = (id)objc_msgSend(v5, "initWithFrame:");
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "addSubview:", v7);

    -[PUPhotoViewContentHelper _setTitleSubtitleUILabel:](self, "_setTitleSubtitleUILabel:", v7);
    -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
    v4 = v7;
  }
  v8 = v4;
  objc_msgSend(v4, "setTitleText:", self->_title);
  objc_msgSend(v8, "setSubtitleText:", self->_subtitle);

}

- (CGSize)contentViewSizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = -[PUPhotoViewContentHelper fillMode](self, "fillMode");
  -[PUPhotoViewContentHelper photoSize](self, "photoSize");
  objc_msgSend((id)objc_opt_class(), "sizeThatFits:imageSize:fillMode:", v6, width, height, v7, v8);
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviewsOfContentView
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
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
  PUBackgroundColorView *photoDecorationBorderView;
  double y;
  void *v22;
  double height;
  PXTextBannerView *textBannerView;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  PXFeatureSpec *featureSpec;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  CGRect v40;
  CGRect v41;

  WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(WeakRetained, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIImageView setFrame:](self->_photoImageView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_transitionSnapshotView, "setFrame:", v5, v7, v9, v11);
  -[UIView setFrame:](self->_darkContentOverlay, "setFrame:", v5, v7, v9, v11);
  -[PHLivePhotoView setFrame:](self->_livePhotoView, "setFrame:", v5, v7, v9, v11);
  -[PXVideoPlayerView setFrame:](self->_loopingVideoView, "setFrame:", v5, v7, v9, v11);
  -[ISAnimatedImageView setFrame:](self->_animatedImageView, "setFrame:", v5, v7, v9, v11);
  -[PUAvalancheStackView setFrame:](self->_avalancheStackView, "setFrame:", v5, v7, v9, v11);
  -[UIImageView setFrame:](self->__crossfadeImageView, "setFrame:", v5, v7, v9, v11);
  -[PUPhotoViewContentHelper imageContentFrame](self, "imageContentFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  photoDecorationBorderView = self->_photoDecorationBorderView;
  if (photoDecorationBorderView && (-[PUBackgroundColorView isHidden](photoDecorationBorderView, "isHidden") & 1) == 0)
  {
    -[PUPhotoViewContentHelper photoDecorationBorderViewFrameForImageContentFrame:](self, "photoDecorationBorderViewFrameForImageContentFrame:", v13, v15, v17, v19);
    -[PUBackgroundColorView setFrame:](self->_photoDecorationBorderView, "setFrame:");
  }
  -[PUBackgroundColorView setFrame:](self->_photoDecorationOverlayView, "setFrame:", v13, v15, v17, v19);
  v40.origin.x = v13;
  v40.origin.y = v15;
  v40.size.width = v17;
  v40.size.height = v19;
  y = CGRectGetMaxY(v40) + -24.0;
  -[PUPhotoViewContentHelper _badgeView](self, "_badgeView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  height = 24.0;
  objc_msgSend(v22, "setFrame:", v13, y, v17, 24.0);

  textBannerView = self->_textBannerView;
  if (textBannerView && self->_isTextBannerVisible)
  {
    -[PXTextBannerView sizeThatFits:](textBannerView, "sizeThatFits:", v9, v11);
    if (v25 <= v17)
    {
      v41.origin.x = v13;
      v41.size.width = v17;
    }
    else
    {
      if (v9 >= v25)
        v26 = v25;
      else
        v26 = v9;
      v27 = (v9 - v26) * 0.5;
      v28 = 24.0;
      v29 = y;
      v41 = CGRectIntegral(*(CGRect *)(&v26 - 2));
      y = v41.origin.y;
      height = v41.size.height;
    }
    -[PXTextBannerView setFrame:](self->_textBannerView, "setFrame:", v41.origin.x, y, v41.size.width, height);
  }
  -[PUPhotoViewContentHelper _highlightOverlayView](self, "_highlightOverlayView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v13, v15, v17, v19);

  -[PXRoundedCornerOverlayView setFrame:](self->_roundedCornerOverlayView, "setFrame:", v13, v15, v17, v19);
  -[PXCollectionTileLayoutTemplate setBounds:](self->_collectionTileLayoutTemplate, "setBounds:", v13, v15, v17, v19);
  -[PXCollectionTileLayoutTemplate prepare](self->_collectionTileLayoutTemplate, "prepare");
  -[PUPhotoViewContentHelper _updateIfNeeded](self, "_updateIfNeeded");
  -[PUPhotoViewContentHelper _titleSubtitleLabel](self, "_titleSubtitleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31 && (objc_msgSend(v31, "isHidden") & 1) == 0)
  {
    featureSpec = self->_featureSpec;
    v34 = PXViewSpecContextForMemoryTile();
    v35 = PXViewSpecOptionsWithTitleFontName();
    -[PXCollectionTileLayoutTemplate titleSubtitleRect](self->_collectionTileLayoutTemplate, "titleSubtitleRect");
    v39[0] = v34;
    v39[1] = v35;
    v39[2] = v36;
    v39[3] = v37;
    -[PXFeatureSpec viewSpecWithDescriptor:](featureSpec, "viewSpecWithDescriptor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSpec:", v38);
    -[PXCollectionTileLayoutTemplate titleSubtitleRect](self->_collectionTileLayoutTemplate, "titleSubtitleRect");
    objc_msgSend(v32, "setFrame:");

  }
}

- (void)animateCrossfadeToImage:(id)a3
{
  id v4;
  id v5;
  UIImageView *v6;
  UIImageView *crossfadeImageView;
  UIImageView *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[5];

  v4 = a3;
  if (!self->__crossfadeImageView)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[UIImageView frame](self->_photoImageView, "frame");
    v6 = (UIImageView *)objc_msgSend(v5, "initWithFrame:");
    crossfadeImageView = self->__crossfadeImageView;
    self->__crossfadeImageView = v6;

    -[UIImageView setContentMode:](self->__crossfadeImageView, "setContentMode:", -[UIImageView contentMode](self->_photoImageView, "contentMode"));
    v8 = self->__crossfadeImageView;
    -[UIImageView backgroundColor](self->_photoImageView, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
    objc_msgSend(WeakRetained, "insertSubview:belowSubview:", self->__crossfadeImageView, self->_photoImageView);

    -[PUPhotoViewContentHelper _updateSubviewOrdering](self, "_updateSubviewOrdering");
  }
  -[UIImageView setAlpha:](self->_photoImageView, "setAlpha:", 1.0);
  -[UIImageView setImage:](self->__crossfadeImageView, "setImage:", v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PUPhotoViewContentHelper_animateCrossfadeToImage___block_invoke;
  v11[3] = &unk_1E58ABD10;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v11, 0.3);

}

- (BOOL)isTextBannerVisible
{
  return self->_isTextBannerVisible;
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (int64_t)fillMode
{
  return self->_fillMode;
}

- (CGAffineTransform)imageTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[9].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[9].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[9].tx;
  return self;
}

- (CGSize)photoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_photoSize.width;
  height = self->_photoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIImage)photoImage
{
  return self->_photoImage;
}

- (UIImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (UIView)transitionSnapshotView
{
  return self->_transitionSnapshotView;
}

- (PUPhotoDecoration)photoDecoration
{
  return self->_photoDecoration;
}

- (BOOL)avoidsImageViewIfPossible
{
  return self->_avoidsImageViewIfPossible;
}

- (void)setAvoidsImageViewIfPossible:(BOOL)a3
{
  self->_avoidsImageViewIfPossible = a3;
}

- (BOOL)flattensBadgeView
{
  return self->_flattensBadgeView;
}

- (BOOL)avoidsPhotoDecoration
{
  return self->_avoidsPhotoDecoration;
}

- (BOOL)isAnimatingRoundedCorners
{
  return self->_animatingRoundedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (void)setContinuousCorners:(BOOL)a3
{
  self->_continuousCorners = a3;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (BOOL)useOverlay
{
  return self->_useOverlay;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (double)darkContentOverlayAlpha
{
  return self->_darkContentOverlayAlpha;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)isLivePhotoHidden
{
  return self->_livePhotoHidden;
}

- (PUPhotoViewContentHelperDelegate)delegate
{
  return (PUPhotoViewContentHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (BOOL)shouldPrepareForPlayback
{
  return self->_shouldPrepareForPlayback;
}

- (AVAsset)loopingVideoAsset
{
  return self->_loopingVideoAsset;
}

- (PHAnimatedImage)animatedImage
{
  return self->_animatedImage;
}

- (BOOL)loopingPlaybackAllowed
{
  return self->_loopingPlaybackAllowed;
}

- (BOOL)showsLivePhoto
{
  return self->_showsLivePhoto;
}

- (BOOL)needsAvalancheStack
{
  return self->_needsAvalancheStack;
}

- (void)setNeedsAvalancheStack:(BOOL)a3
{
  self->_needsAvalancheStack = a3;
}

- (CGColor)avalancheStackBackgroundColor
{
  return self->_avalancheStackBackgroundColor;
}

- (void)setAvalancheStackBackgroundColor:(CGColor *)a3
{
  self->_avalancheStackBackgroundColor = a3;
}

- (PXAssetBadgeInfo)badgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[13].badges;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[12].count;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (CGSize)customPaddingForBadgeElements
{
  double width;
  double height;
  CGSize result;

  width = self->_customPaddingForBadgeElements.width;
  height = self->_customPaddingForBadgeElements.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXTextBannerView)textBannerView
{
  return self->_textBannerView;
}

- (PXFeatureSpec)featureSpec
{
  return self->_featureSpec;
}

- (PXCollectionTileLayoutTemplate)collectionTileLayoutTemplate
{
  return self->_collectionTileLayoutTemplate;
}

- (NSString)titleFontName
{
  return self->_titleFontName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImageView)photoImageView
{
  return self->_photoImageView;
}

- (void)setPhotoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_photoImageView, a3);
}

- (UIView)darkContentOverlay
{
  return self->_darkContentOverlay;
}

- (void)setDarkContentOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_darkContentOverlay, a3);
}

- (UIImageView)_crossfadeImageView
{
  return self->__crossfadeImageView;
}

- (void)set_crossfadeImageView:(id)a3
{
  objc_storeStrong((id *)&self->__crossfadeImageView, a3);
}

- (PUAvalancheStackView)avalancheStackView
{
  return self->_avalancheStackView;
}

- (void)setAvalancheStackView:(id)a3
{
  objc_storeStrong((id *)&self->_avalancheStackView, a3);
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (void)setLivePhotoView:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoView, a3);
}

- (PXRoundedCornerOverlayView)roundedCornerOverlayView
{
  return self->_roundedCornerOverlayView;
}

- (void)setRoundedCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, a3);
}

- (UIView)_highlightOverlayView
{
  return self->__highlightOverlayView;
}

- (void)_setHighlightOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->__highlightOverlayView, a3);
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (void)_setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->__badgeView, a3);
}

- (PXTitleSubtitleUILabel)_titleSubtitleLabel
{
  return self->__titleSubtitleLabel;
}

- (void)_setTitleSubtitleUILabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleSubtitleLabel, a3);
}

- (ISWrappedAVAudioSession)_audioSession
{
  return self->__audioSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__audioSession, 0);
  objc_storeStrong((id *)&self->__titleSubtitleLabel, 0);
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->__highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_avalancheStackView, 0);
  objc_storeStrong((id *)&self->__crossfadeImageView, 0);
  objc_storeStrong((id *)&self->_darkContentOverlay, 0);
  objc_storeStrong((id *)&self->_photoImageView, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_collectionTileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->_featureSpec, 0);
  objc_storeStrong((id *)&self->_textBannerView, 0);
  objc_storeStrong((id *)&self->_animatedImage, 0);
  objc_storeStrong((id *)&self->_loopingVideoAsset, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_photoDecoration, 0);
  objc_storeStrong((id *)&self->_transitionSnapshotView, 0);
  objc_storeStrong((id *)&self->_placeHolderImage, 0);
  objc_storeStrong((id *)&self->_photoImage, 0);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_animatedImageView, 0);
  objc_storeStrong((id *)&self->_loopingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_loopingVideoView, 0);
  objc_storeStrong((id *)&self->_layerDefaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_photoDecorationOverlayView, 0);
  objc_storeStrong((id *)&self->_photoDecorationBorderView, 0);
}

uint64_t __52__PUPhotoViewContentHelper_animateCrossfadeToImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "setAlpha:", 0.0);
}

void __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D78290], "sharedAmbientInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v3 = v2;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v4);
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setAlpha:", 1.0);
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __59__PUPhotoViewContentHelper__updateLoopingVideoViewIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setAudioSession:", v1);

}

void __60__PUPhotoViewContentHelper__updateRoundedCornersOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "cornerRadius");
  objc_msgSend(v5, "setCornerRadius:");
  objc_msgSend(v5, "setCornersToRound:", objc_msgSend(*(id *)(a1 + 32), "cornersToRound"));
  objc_msgSend(*(id *)(a1 + 32), "overlayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayColor:", v4);

  objc_msgSend(v5, "setContinuousCorners:", objc_msgSend(*(id *)(a1 + 32), "continuousCorners"));
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v5, "setDisplayScale:", *(double *)&PUMainScreenScale_screenScale);

}

uint64_t __46__PUPhotoViewContentHelper_setImageTransform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  CGAffineTransform v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_OWORD *)(v2 + 448);
  *(_OWORD *)&v8.a = *(_OWORD *)(v2 + 432);
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tx = *(_OWORD *)(v2 + 464);
  *(_BYTE *)(v2 + 24) = !CGAffineTransformIsIdentity(&v8);
  objc_msgSend(*(id *)(a1 + 32), "_updateImageView");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 288);
  v6 = *(_OWORD *)(v4 + 448);
  *(_OWORD *)&v8.a = *(_OWORD *)(v4 + 432);
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(v4 + 464);
  return objc_msgSend(v5, "setTransform:", &v8);
}

+ (CGRect)_imageContentFrameForBounds:(CGRect)result imageSize:(CGSize)a4 fillMode:(int64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = result.size.height;
  width = result.size.width;
  y = result.origin.y;
  x = result.origin.x;
  if ((unint64_t)a5 >= 2)
  {
    result.size.height = 0.0;
    result.size.width = 0.0;
    result.origin.y = 0.0;
    result.origin.x = 0.0;
    if (a5 == 2)
      result.origin.x = PURectWithSizeThatFitsInRect(a4.width, a4.height, x, y, width, height);
  }
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 imageSize:(CGSize)a4 fillMode:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(a1, "_imageContentFrameForBounds:imageSize:fillMode:", a5, 0.0, 0.0, a3.width, a3.height, a4.width, a4.height);
  v6 = v5;
  v8 = v7;
  result.height = v8;
  result.width = v6;
  return result;
}

@end
