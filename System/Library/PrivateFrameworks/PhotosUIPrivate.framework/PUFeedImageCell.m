@implementation PUFeedImageCell

- (PUFeedImageCell)initWithFrame:(CGRect)a3
{
  PUFeedImageCell *v4;
  PUFeedImageCell *v5;
  void *v6;
  void *v7;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUFeedImageCell;
  v4 = -[PUFeedImageCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[PUFeedImageCell setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[PUFeedImageCell contentView](v5, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PUFeedImageCell.m"), 90, CFSTR("The content view must be a UIImageView: %@"), v6);

    }
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsDisplayCompositing:", 0);

    -[PUFeedImageCell _setImageView:](v5, "_setImageView:", v6);
    -[PUFeedImageCell _setImageTag:](v5, "_setImageTag:", 0x7FFFFFFFFFFFFFFFLL);

  }
  return v5;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFeedImageCell;
  -[PUFeedImageCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PUFeedImageCell setImage:](self, "setImage:", 0);
  -[PUFeedImageCell setImageHidden:](self, "setImageHidden:", 0);
  -[PUFeedImageCell _overlayPlayButtonBackgroundExtraction](self, "_overlayPlayButtonBackgroundExtraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (id)focusEffect
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0DC37D8];
  -[PUFeedImageCell bounds](self, "bounds");
  objc_msgSend(v2, "effectWithRect:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPosition:", 2);
  return v3;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUFeedImageCell;
  -[PUFeedCell setParallaxOffset:](&v4, sel_setParallaxOffset_, a3.x, a3.y);
  -[PUFeedImageCell _layoutImageView](self, "_layoutImageView");
}

- (void)setImage:(id)a3
{
  -[PUFeedImageCell setImage:withTag:](self, "setImage:withTag:", a3, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)setImage:(id)a3 withTag:(int64_t)a4
{
  UIImage *v7;
  UIImage **p_image;
  void *v9;
  void *v10;
  UIImage *v11;

  v7 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v7)
  {
    v11 = v7;
    objc_storeStrong((id *)&self->_image, a3);
    -[PUFeedImageCell _imageView](self, "_imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", *p_image);

    -[PUFeedImageCell videoPlayerView](self, "videoPlayerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaceholderImage:", v11);

    v7 = v11;
    if (*p_image)
    {
      if (a4 == 0x7FFFFFFFFFFFFFFFLL || -[PUFeedImageCell _imageTag](self, "_imageTag") != a4)
        -[PUFeedImageCell _invalidateOverlayPlayButtonBackground](self, "_invalidateOverlayPlayButtonBackground");
      -[PUFeedImageCell _setImageTag:](self, "_setImageTag:", a4);
      v7 = v11;
    }
  }

}

- (void)setPlayerItem:(id)a3
{
  AVPlayerItem *v5;
  id v6;
  void *v7;
  PXVideoPlayerView *v8;
  PXVideoPlayerView *videoPlayerView;
  void *v10;
  void *v11;
  ISWrappedAVPlayer *v12;
  ISWrappedAVPlayer *videoPlayer;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id location;

  v5 = (AVPlayerItem *)a3;
  if (self->_playerItem != v5)
  {
    objc_storeStrong((id *)&self->_playerItem, a3);
    if (v5)
    {
      if (!self->_videoPlayerView)
      {
        v6 = objc_alloc(MEMORY[0x1E0D7BBC0]);
        -[PUFeedImageCell contentView](self, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        v8 = (PXVideoPlayerView *)objc_msgSend(v6, "initWithFrame:");
        videoPlayerView = self->_videoPlayerView;
        self->_videoPlayerView = v8;

        -[PXVideoPlayerView setAutoresizingMask:](self->_videoPlayerView, "setAutoresizingMask:", 18);
        -[PUFeedImageCell image](self, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXVideoPlayerView setPlaceholderImage:](self->_videoPlayerView, "setPlaceholderImage:", v10);

        -[PXVideoPlayerView setVideoAppearanceCrossfadeDuration:](self->_videoPlayerView, "setVideoAppearanceCrossfadeDuration:", 0.200000003);
        -[PUFeedImageCell _updateVideoViewContentMode](self, "_updateVideoViewContentMode");
        -[PUFeedImageCell contentView](self, "contentView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", self->_videoPlayerView);

      }
      if (!self->_videoPlayer)
      {
        v12 = (ISWrappedAVPlayer *)objc_alloc_init(MEMORY[0x1E0D78298]);
        videoPlayer = self->_videoPlayer;
        self->_videoPlayer = v12;

        -[PXVideoPlayerView setPlayer:](self->_videoPlayerView, "setPlayer:", self->_videoPlayer);
        LODWORD(v14) = 0;
        -[ISWrappedAVPlayer setVolume:](self->_videoPlayer, "setVolume:", v14);
        objc_initWeak(&location, self);
        v15 = (void *)MEMORY[0x1E0D78290];
        v16 = MEMORY[0x1E0C809B0];
        v17 = 3221225472;
        v18 = __33__PUFeedImageCell_setPlayerItem___block_invoke;
        v19 = &unk_1E589EB28;
        objc_copyWeak(&v20, &location);
        objc_msgSend(v15, "sharedAmbientInstanceWithLoadHandler:", &v16);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
    -[PUFeedImageCell _updateVideoPlayerContents](self, "_updateVideoPlayerContents", v16, v17, v18, v19);
  }

}

- (void)setAudioSession:(id)a3
{
  ISWrappedAVAudioSession *v5;
  void *v6;
  ISWrappedAVAudioSession *v7;

  v5 = (ISWrappedAVAudioSession *)a3;
  if (self->_audioSession != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_audioSession, a3);
    if (v7)
    {
      -[PUFeedImageCell videoPlayer](self, "videoPlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setWrappedAudioSession:", v7);

    }
    -[PUFeedImageCell _updateVideoPlayerContents](self, "_updateVideoPlayerContents");
    v5 = v7;
  }

}

- (void)_updateVideoPlayerContents
{
  void *v3;
  void *v4;
  void *v5;
  PXVideoPlayerView *videoPlayerView;
  void *v7;
  double v8;
  _QWORD v9[4];
  id v10;

  -[PUFeedImageCell playerItem](self, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  videoPlayerView = self->_videoPlayerView;
  if (v3)
  {
    -[PXVideoPlayerView setPlaceholderDisplayMode:](self->_videoPlayerView, "setPlaceholderDisplayMode:", 0);
    -[PUFeedImageCell audioSession](self, "audioSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "setLoopingEnabled:withTemplateItem:", 1, v3);
      LODWORD(v8) = 1.0;
      objc_msgSend(v5, "setRate:", v8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__PUFeedImageCell__updateVideoPlayerContents__block_invoke;
    v9[3] = &unk_1E58ABD10;
    v10 = v4;
    -[PXVideoPlayerView setPlaceholderDisplayMode:completion:](videoPlayerView, "setPlaceholderDisplayMode:completion:", 1, v9);

  }
}

- (void)setImageContentMode:(int64_t)a3
{
  _BOOL8 v5;
  id v6;

  if (self->_imageContentMode != a3)
  {
    self->_imageContentMode = a3;
    v5 = a3 == 2;
    -[PUFeedImageCell _imageView](self, "_imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentMode:", a3);
    objc_msgSend(v6, "setClipsToBounds:", v5);
    -[PUFeedImageCell _updateVideoViewContentMode](self, "_updateVideoViewContentMode");

  }
}

- (void)_updateVideoViewContentMode
{
  id v3;

  -[PUFeedImageCell videoPlayerView](self, "videoPlayerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVideoViewContentMode:", -[PUFeedImageCell imageContentMode](self, "imageContentMode") == 1);

}

- (void)setImageHidden:(BOOL)a3
{
  if (self->_imageHidden != a3)
  {
    self->_imageHidden = a3;
    -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumImageSize:(CGSize)a3
{
  if (a3.width != self->_maximumImageSize.width || a3.height != self->_maximumImageSize.height)
  {
    self->_maximumImageSize = a3;
    -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageAlignment:(int64_t)a3
{
  if (self->_imageAlignment != a3)
  {
    self->_imageAlignment = a3;
    -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setOverlayOptions:(int64_t)a3
{
  if (self->_overlayOptions != a3)
  {
    self->_overlayOptions = a3;
    -[PUFeedImageCell _updateOverlays](self, "_updateOverlays");
  }
}

- (void)setCommentCount:(int64_t)a3
{
  if (self->_commentCount != a3)
  {
    self->_commentCount = a3;
    -[PUFeedImageCell _updateCommentButton](self, "_updateCommentButton");
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PUFeedImageCell _updateRoundedCornersOverlayView](self, "_updateRoundedCornersOverlayView");
  }
}

- (void)_layoutImageView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PUFeedImageCell _imageFrame](self, "_imageFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUFeedImageCell roundedCornerOverlayView](self, "roundedCornerOverlayView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  double v20;
  double v21;
  double v22;
  int64_t v23;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double MaxX;
  double MaxY;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat rect;
  double recta;
  CGFloat rect_8;
  double rect_8a;
  double rect_16;
  CGFloat rect_24;
  double v80;
  void *v81;
  double v82;
  double v83;
  _QWORD v84[4];
  id v85;
  uint64_t v86;
  objc_super v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v87.receiver = self;
  v87.super_class = (Class)PUFeedImageCell;
  -[PUFeedImageCell layoutSubviews](&v87, sel_layoutSubviews);
  -[PUFeedImageCell _imageView](self, "_imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell _overlayPlayButton](self, "_overlayPlayButton");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell _centerOverlayImageView](self, "_centerOverlayImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell _commentButton](self, "_commentButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell likeBadgeView](self, "likeBadgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell bounds](self, "bounds");
  v8 = v7;
  v82 = v10;
  v83 = v9;
  v12 = v11;
  -[PUFeedImageCell maximumImageSize](self, "maximumImageSize");
  v15 = v14;
  v16 = 0.0;
  v17 = 0.0;
  if (v13 > 0.0)
  {
    v18 = v13;
    v88.origin.x = v8;
    v88.size.height = v82;
    v88.origin.y = v83;
    v88.size.width = v12;
    v17 = fmax((CGRectGetWidth(v88) - v18) * 0.5, 0.0);
  }
  if (v15 > 0.0)
  {
    v89.origin.x = v8;
    v89.size.height = v82;
    v89.origin.y = v83;
    v89.size.width = v12;
    v16 = fmax((CGRectGetHeight(v89) - v15) * 0.5, 0.0);
  }
  v19 = *MEMORY[0x1E0DC49E8];
  v20 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v21 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v22 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v23 = -[PUFeedImageCell imageAlignment](self, "imageAlignment");
  v24 = v17 + v17;
  if (v23)
    v25 = v22;
  else
    v25 = v17;
  if (v23)
    v26 = v21;
  else
    v26 = v16;
  if (v23)
    v27 = v20;
  else
    v27 = v17;
  if (v23)
    v28 = v19;
  else
    v28 = v16;
  if (v23 == 1)
  {
    v25 = v22;
    v26 = v16;
    v29 = v16;
  }
  else
  {
    v24 = v27;
    v29 = v28;
  }
  rect_24 = v8;
  v30 = v8 + v24;
  v31 = v83 + v29;
  v32 = v12 - (v25 + v24);
  v33 = v82 - (v26 + v29);
  -[PUFeedImageCell _setImageFrame:](self, "_setImageFrame:", v30, v83 + v29, v32, v33);
  -[PUFeedImageCell _layoutImageView](self, "_layoutImageView");
  objc_msgSend(v4, "frame");
  v35 = v34;
  v37 = v36;
  v90.origin.x = v30;
  v90.origin.y = v31;
  v90.size.width = v32;
  v90.size.height = v33;
  v38 = CGRectGetMidX(v90) + v35 * -0.5;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v39 = round(*(double *)&PUMainScreenScale_screenScale * v38) / *(double *)&PUMainScreenScale_screenScale + v35 * 0.5;
  v91.origin.x = v30;
  v91.origin.y = v31;
  v91.size.width = v32;
  v91.size.height = v33;
  v40 = CGRectGetMidY(v91) + v37 * -0.5;
  v80 = v39;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  rect_16 = round(*(double *)&PUMainScreenScale_screenScale * v40) / *(double *)&PUMainScreenScale_screenScale
          + v37 * 0.5;
  objc_msgSend(v5, "frame");
  rect = v41;
  rect_8 = v42;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v92.origin.x = rect_24;
  v92.origin.y = v83;
  v92.size.width = v12;
  v92.size.height = v82;
  MaxX = CGRectGetMaxX(v92);
  v93.origin.x = rect;
  v93.origin.y = v43;
  v93.size.width = v45;
  v73 = v45;
  v93.size.height = v47;
  v72 = MaxX - CGRectGetWidth(v93) + -5.0;
  v94.origin.x = rect_24;
  v94.origin.y = v83;
  v94.size.width = v12;
  v94.size.height = v82;
  MaxY = CGRectGetMaxY(v94);
  v95.origin.x = v72;
  v95.origin.y = rect_8;
  v95.size.width = v45;
  v95.size.height = v47;
  v71 = MaxY - CGRectGetHeight(v95) + -5.0;
  objc_msgSend(v6, "frame");
  recta = v51;
  rect_8a = v50;
  v96.origin.x = rect_24;
  v96.origin.y = v83;
  v96.size.width = v12;
  v96.size.height = v82;
  v52 = CGRectGetMinX(v96) + 5.0;
  v97.origin.x = rect_24;
  v97.origin.y = v83;
  v97.size.width = v12;
  v97.size.height = v82;
  v53 = CGRectGetMinY(v97) + 5.0;
  v54 = -[PUFeedImageCell isImageHidden](self, "isImageHidden");
  v55 = -[PUFeedImageCell _shouldHideOverlayPlayButton](self, "_shouldHideOverlayPlayButton") | v54;
  v56 = -[PUFeedImageCell _shouldHideCenterOverlayImageView](self, "_shouldHideCenterOverlayImageView") | v54;
  v57 = -[PUFeedImageCell _shouldHideCommentButton](self, "_shouldHideCommentButton") | v54;
  v58 = -[PUFeedImageCell shouldHideLikeBadge](self, "shouldHideLikeBadge") | v54;
  objc_msgSend(v3, "setHidden:", v54);
  objc_msgSend(v81, "setCenter:", v80, rect_16);
  objc_msgSend(v81, "setHidden:", v55);
  objc_msgSend(v4, "setCenter:", v80, rect_16);
  objc_msgSend(v4, "setHidden:", v56);
  objc_msgSend(v5, "setFrame:", v72, v71, v73, v47);
  objc_msgSend(v5, "setHidden:", v57);
  objc_msgSend(v6, "setFrame:", v52, v53, rect_8a, recta);
  objc_msgSend(v6, "setHidden:", v58);
  -[PUFeedImageCell _overlayPlayButtonBackgroundImageView](self, "_overlayPlayButtonBackgroundImageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setHidden:", v55);
  objc_msgSend(v59, "setCenter:", v80, rect_16);
  if (v59
    && (v55 & 1) == 0
    && -[PUFeedImageCell _shouldUpdateOverlayPlayButtonBackground](self, "_shouldUpdateOverlayPlayButtonBackground"))
  {
    objc_msgSend(v3, "image");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      -[PUFeedImageCell _setShouldUpdateOverlayPlayButtonBackground:](self, "_setShouldUpdateOverlayPlayButtonBackground:", 0);
      v61 = objc_msgSend(v59, "tag") + 1;
      objc_msgSend(v59, "setTag:", v61);
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __33__PUFeedImageCell_layoutSubviews__block_invoke;
      v84[3] = &unk_1E589EB50;
      v85 = v59;
      v86 = v61;
      objc_msgSend(v3, "pu_extractPlayOverlayBackgroundImageFromCenter:asynchronously:handler:", 1, v84, v80, rect_16);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUFeedImageCell _overlayPlayButtonBackgroundExtraction](self, "_overlayPlayButtonBackgroundExtraction");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "cancel");

      -[PUFeedImageCell _setOverlayPlayButtonBackgroundExtraction:](self, "_setOverlayPlayButtonBackgroundExtraction:", v62);
    }
    else
    {
      objc_msgSend(v59, "setImage:", 0);
    }
  }
  -[PUFeedImageCell _photoIrisBadgeView](self, "_photoIrisBadgeView");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[PUFeedImageCell _photoIrisBadgeView](self, "_photoIrisBadgeView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v67 = v66;
    v69 = v68;

    -[PUFeedImageCell _photoIrisBadgeView](self, "_photoIrisBadgeView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setFrame:", 5.0, 5.0, v67, v69);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[PUFeedImageCell image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_updateOverlays
{
  char v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;

  v3 = -[PUFeedImageCell overlayOptions](self, "overlayOptions");
  v4 = -[PUFeedImageCell isImageHidden](self, "isImageHidden");
  -[PUFeedImageCell _overlayPlayButton](self, "_overlayPlayButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedImageCell _overlayPlayButtonBackgroundImageView](self, "_overlayPlayButtonBackgroundImageView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((v3 & 1) == 0)
  {
    v8 = 1;
    goto LABEL_6;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", objc_msgSend((id)objc_opt_class(), "_videoOverlayButtonStyle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTarget:action:", self, sel__handlePlayButton_);
    -[PUFeedImageCell addSubview:](self, "addSubview:", v5);
    -[PUFeedImageCell _setOverlayPlayButton:](self, "_setOverlayPlayButton:", v5);
    -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
    if (v7)
      goto LABEL_5;
LABEL_24:
    v29 = objc_alloc(MEMORY[0x1E0DC3890]);
    v7 = (void *)objc_msgSend(v29, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PUFeedImageCell _setOverlayPlayButtonBackgroundImageView:](self, "_setOverlayPlayButtonBackgroundImageView:", v7);
    -[PUFeedImageCell insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v5);
    -[PUFeedImageCell _invalidateOverlayPlayButtonBackground](self, "_invalidateOverlayPlayButtonBackground");
    goto LABEL_5;
  }
  if (!v6)
    goto LABEL_24;
LABEL_5:
  v8 = v4;
LABEL_6:
  -[PUFeedImageCell _setShouldHideOverlayPlayButton:](self, "_setShouldHideOverlayPlayButton:", (v3 & 1) == 0);
  objc_msgSend(v5, "setHidden:", v8);
  objc_msgSend(v7, "setHidden:", v8);
  -[PUFeedImageCell _centerOverlayImageView](self, "_centerOverlayImageView");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if ((v3 & 2) != 0)
  {
    if (!v9)
    {
      v12 = objc_alloc(MEMORY[0x1E0DC3890]);
      -[PUFeedImageCell bounds](self, "bounds");
      v10 = (void *)objc_msgSend(v12, "initWithFrame:");
      -[PUFeedImageCell addSubview:](self, "addSubview:", v10);
      -[PUFeedImageCell _setCenterOverlayImageView:](self, "_setCenterOverlayImageView:", v10);
      -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUFeedPlayOverlaySmall"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
    {
      objc_msgSend(v10, "setImage:", v13);
      objc_msgSend(v10, "sizeToFit");
      -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
    }

    v11 = v4;
  }
  else
  {
    v11 = 1;
  }
  -[PUFeedImageCell _setShouldHideCenterOverlayImageView:](self, "_setShouldHideCenterOverlayImageView:", (v3 & 2) == 0);
  objc_msgSend(v10, "setHidden:", v11);
  -[PUFeedImageCell _photoIrisBadgeView](self, "_photoIrisBadgeView");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if ((v3 & 4) != 0 && !v15)
  {
    v17 = objc_alloc(MEMORY[0x1E0D7BB38]);
    v16 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v16, "setStyle:", 5);
    objc_msgSend(v16, "setOverContent:", 1);
    PXAssetBadgeInfoCreateWithBadges();
    objc_msgSend(v16, "setBadgeInfo:", &v30);
    -[PUFeedImageCell addSubview:](self, "addSubview:", v16);
    -[PUFeedImageCell _setPhotoIrisBadgeView:](self, "_setPhotoIrisBadgeView:", v16);
  }
  v18 = (v3 & 4) == 0 || v4;
  objc_msgSend(v16, "setHidden:", v18);
  -[PUFeedImageCell likeBadgeView](self, "likeBadgeView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 8) != 0)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, 16.0, 16.0);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("hand.thumbsup.fill"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(v21, "size");
    v24 = v23;
    v26 = v25;
    -[PUFeedImageCell tintColor](self, "tintColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v27, 0, v21, 0, v24, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setImage:", v28);
    objc_msgSend(v20, "setContentMode:", 1);
    -[PUFeedImageCell addSubview:](self, "addSubview:", v20);
    -[PUFeedImageCell setLikeBadgeView:](self, "setLikeBadgeView:", v20);

    v19 = v20;
  }
  else
  {
    v4 = 1;
  }
  objc_msgSend(v19, "setHidden:", v4);

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

  v3 = -[PUFeedImageCell isImageHidden](self, "isImageHidden");
  v4 = -[PUFeedImageCell commentCount](self, "commentCount");
  -[PUFeedImageCell _commentButton](self, "_commentButton");
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
      -[PUFeedImageCell addSubview:](self, "addSubview:", v9);
      -[PUFeedImageCell _setCommentButton:](self, "_setCommentButton:", v9);
      -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
      v6 = v9;
    }
    v8 = v6;
    objc_msgSend(v7, "configureCloudFeedCommentButton:withCount:", v6, v4);

  }
  -[PUFeedImageCell _setShouldHideCommentButton:](self, "_setShouldHideCommentButton:", v4 < 1);
  objc_msgSend(v8, "setHidden:", v3);

}

- (void)_invalidateOverlayPlayButtonBackground
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[PUFeedImageCell _setShouldUpdateOverlayPlayButtonBackground:](self, "_setShouldUpdateOverlayPlayButtonBackground:", 1);
  -[PUFeedImageCell _overlayPlayButtonBackgroundImageView](self, "_overlayPlayButtonBackgroundImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "isHidden");
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      -[PUFeedImageCell setNeedsLayout](self, "setNeedsLayout");
      v4 = v6;
    }
  }

}

- (void)_updateRoundedCornersOverlayView
{
  _BOOL8 v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;
  _QWORD v8[6];

  v3 = -[PUFeedImageCell isImageHidden](self, "isImageHidden");
  -[PUFeedImageCell cornerRadius](self, "cornerRadius");
  v5 = v4;
  -[PUFeedImageCell roundedCornerOverlayView](self, "roundedCornerOverlayView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v6;
  if (v5 > 0.0)
  {
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0D7B8B8]);
      -[PUFeedImageCell addSubview:](self, "addSubview:", v7);
      -[PUFeedImageCell setRoundedCornerOverlayView:](self, "setRoundedCornerOverlayView:", v7);
      -[PUFeedImageCell bringSubviewToFront:](self, "bringSubviewToFront:", v7);
    }
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__PUFeedImageCell__updateRoundedCornersOverlayView__block_invoke;
    v8[3] = &unk_1E589EB78;
    v8[4] = self;
    *(double *)&v8[5] = v5;
    objc_msgSend(v7, "performChanges:", v8);
  }
  else
  {
    v3 = 1;
  }
  objc_msgSend(v7, "setHidden:", v3);

}

- (void)_handlePlayButton:(id)a3
{
  id v4;

  -[PUFeedImageCell _imageCellDelegate](self, "_imageCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapOverlayPlayButtonInFeedImageCell:", self);

}

- (void)_handleCommentButton:(id)a3
{
  id v4;

  -[PUFeedImageCell _imageCellDelegate](self, "_imageCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapCommentButtonInFeedImageCell:", self);

}

- (UIImage)image
{
  return self->_image;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (int)playerItemRequestID
{
  return self->_playerItemRequestID;
}

- (void)setPlayerItemRequestID:(int)a3
{
  self->_playerItemRequestID = a3;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (BOOL)isImageHidden
{
  return self->_imageHidden;
}

- (CGSize)maximumImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumImageSize.width;
  height = self->_maximumImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)imageAlignment
{
  return self->_imageAlignment;
}

- (int64_t)overlayOptions
{
  return self->_overlayOptions;
}

- (int64_t)commentCount
{
  return self->_commentCount;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (PXVideoPlayerView)videoPlayerView
{
  return self->_videoPlayerView;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (ISWrappedAVAudioSession)audioSession
{
  return self->_audioSession;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setImageView:(id)a3
{
  objc_storeStrong((id *)&self->__imageView, a3);
}

- (int64_t)_imageTag
{
  return self->__imageTag;
}

- (void)_setImageTag:(int64_t)a3
{
  self->__imageTag = a3;
}

- (CGRect)_imageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->__imageFrame.origin.x;
  y = self->__imageFrame.origin.y;
  width = self->__imageFrame.size.width;
  height = self->__imageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setImageFrame:(CGRect)a3
{
  self->__imageFrame = a3;
}

- (PXVideoOverlayButton)_overlayPlayButton
{
  return self->__overlayPlayButton;
}

- (void)_setOverlayPlayButton:(id)a3
{
  objc_storeStrong((id *)&self->__overlayPlayButton, a3);
}

- (UIImageView)_overlayPlayButtonBackgroundImageView
{
  return self->__overlayPlayButtonBackgroundImageView;
}

- (void)_setOverlayPlayButtonBackgroundImageView:(id)a3
{
  objc_storeStrong((id *)&self->__overlayPlayButtonBackgroundImageView, a3);
}

- (PUImageViewExtraction)_overlayPlayButtonBackgroundExtraction
{
  return self->__overlayPlayButtonBackgroundExtraction;
}

- (void)_setOverlayPlayButtonBackgroundExtraction:(id)a3
{
  objc_storeStrong((id *)&self->__overlayPlayButtonBackgroundExtraction, a3);
}

- (BOOL)_shouldUpdateOverlayPlayButtonBackground
{
  return self->__shouldUpdateOverlayPlayButtonBackground;
}

- (void)_setShouldUpdateOverlayPlayButtonBackground:(BOOL)a3
{
  self->__shouldUpdateOverlayPlayButtonBackground = a3;
}

- (BOOL)_shouldHideOverlayPlayButton
{
  return self->__shouldHideOverlayPlayButton;
}

- (void)_setShouldHideOverlayPlayButton:(BOOL)a3
{
  self->__shouldHideOverlayPlayButton = a3;
}

- (UIImageView)_centerOverlayImageView
{
  return self->__centerOverlayImageView;
}

- (void)_setCenterOverlayImageView:(id)a3
{
  objc_storeStrong((id *)&self->__centerOverlayImageView, a3);
}

- (BOOL)_shouldHideCenterOverlayImageView
{
  return self->__shouldHideCenterOverlayImageView;
}

- (void)_setShouldHideCenterOverlayImageView:(BOOL)a3
{
  self->__shouldHideCenterOverlayImageView = a3;
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

- (BOOL)shouldHideLikeBadge
{
  return self->_shouldHideLikeBadge;
}

- (void)setShouldHideLikeBadge:(BOOL)a3
{
  self->_shouldHideLikeBadge = a3;
}

- (PXUIAssetBadgeView)_photoIrisBadgeView
{
  return self->__photoIrisBadgeView;
}

- (void)_setPhotoIrisBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->__photoIrisBadgeView, a3);
}

- (PXRoundedCornerOverlayView)roundedCornerOverlayView
{
  return self->_roundedCornerOverlayView;
}

- (void)setRoundedCornerOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, a3);
}

- (UIImageView)likeBadgeView
{
  return self->_likeBadgeView;
}

- (void)setLikeBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_likeBadgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_likeBadgeView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
  objc_storeStrong((id *)&self->__photoIrisBadgeView, 0);
  objc_storeStrong((id *)&self->__commentButton, 0);
  objc_storeStrong((id *)&self->__centerOverlayImageView, 0);
  objc_storeStrong((id *)&self->__overlayPlayButtonBackgroundExtraction, 0);
  objc_storeStrong((id *)&self->__overlayPlayButtonBackgroundImageView, 0);
  objc_storeStrong((id *)&self->__overlayPlayButton, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

void __51__PUFeedImageCell__updateRoundedCornersOverlayView__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayScale");
  v6 = v5;

  if (v6 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v6 = v8;

  }
  objc_msgSend(v10, "setCornerRadius:", *(double *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOverlayColor:", v9);

  objc_msgSend(v10, "setDisplayScale:", v6);
}

void __33__PUFeedImageCell_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "tag") == *(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v8, "size");
    objc_msgSend(v3, "setBounds:", v4, v5, v6, v7);
    objc_msgSend(*(id *)(a1 + 32), "setImage:", v8);
  }

}

uint64_t __45__PUFeedImageCell__updateVideoPlayerContents__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLoopingEnabled:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "replaceCurrentItemWithPlayerItem:", 0);
}

void __33__PUFeedImageCell_setPlayerItem___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setAudioSession:", v3);

}

+ (void)preloadResources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PUFeedImageCell_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadResources_onceToken != -1)
    dispatch_once(&preloadResources_onceToken, block);
}

+ (int64_t)_videoOverlayButtonStyle
{
  return 4;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

uint64_t __35__PUFeedImageCell_preloadResources__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = objc_msgSend(*(id *)(a1 + 32), "_videoOverlayButtonStyle");
  return objc_msgSend(MEMORY[0x1E0DC3F10], "px_preloadResourcesForVideoOverlayButtonWithStyle:", v1);
}

@end
