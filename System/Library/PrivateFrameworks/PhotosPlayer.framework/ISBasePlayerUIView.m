@implementation ISBasePlayerUIView

- (void)setPlayer:(id)a3
{
  ISBasePlayer *v5;
  ISBasePlayer **p_player;
  ISBasePlayer *player;
  ISBasePlayer *v8;

  v5 = (ISBasePlayer *)a3;
  p_player = &self->_player;
  player = self->_player;
  if (player != v5)
  {
    v8 = v5;
    -[ISObservable unregisterChangeObserver:context:](player, "unregisterChangeObserver:context:", self, ISBasePlayerUIViewPlayerObservationContext);
    -[ISBasePlayer removeOutput:](*p_player, "removeOutput:", self);
    -[ISBasePlayerUIView setContent:](self, "setContent:", 0);
    objc_storeStrong((id *)&self->_player, a3);
    -[ISBasePlayer addOutput:](*p_player, "addOutput:", self);
    -[ISObservable registerChangeObserver:context:](*p_player, "registerChangeObserver:context:", self, ISBasePlayerUIViewPlayerObservationContext);
    -[ISBasePlayerUIView playerDidChange](self, "playerDidChange");
    v5 = v8;
  }

}

- (void)setContent:(id)a3
{
  ISPlayerOutputContent *v5;
  ISPlayerOutputContent *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ISPlayerOutputContent *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  ISPlayerOutputContent *v20;

  v5 = (ISPlayerOutputContent *)a3;
  v6 = v5;
  if (self->_content != v5)
  {
    v20 = v5;
    v7 = -[ISPlayerOutputContent isEqual:](v5, "isEqual:");
    v6 = v20;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_content, a3);
      -[ISBasePlayerUIView photoView](self, "photoView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISBasePlayerUIView videoView](self, "videoView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISBasePlayerUIView overrideImage](self, "overrideImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[ISBasePlayerUIView overrideImage](self, "overrideImage");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = -[ISPlayerOutputContent photo](v20, "photo");
        objc_msgSend(v8, "image");
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = objc_msgSend(v18, "CGImage");

        v13 = v20;
        if (v17 == v19)
          goto LABEL_7;
        if (!v17)
        {
          objc_msgSend(v8, "setImage:", 0);
          goto LABEL_6;
        }
        -[ISPlayerOutputContent photoEXIFOrientation](v20, "photoEXIFOrientation");
        v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:scale:orientation:", v17, PLImageOrientationFromExifOrientation(), 1.0);
      }
      v12 = (void *)v11;
      objc_msgSend(v8, "setImage:", v11);

LABEL_6:
      v13 = v20;
LABEL_7:
      -[ISPlayerOutputContent videoPlayer](v13, "videoPlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setVideoPlayer:", v14);
      -[ISPlayerOutputContent videoPlayer](v20, "videoPlayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISBasePlayerUIView videoBlurView](self, "videoBlurView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setVideoPlayer:", v15);

      -[ISBasePlayerUIView _updatePhotoView](self, "_updatePhotoView");
      -[ISBasePlayerUIView setNeedsLayout](self, "setNeedsLayout");

      v6 = v20;
    }
  }

}

- (void)_updatePhotoView
{
  void *v3;
  void *v4;
  ISPlayerOutputContent *v5;
  ISPlayerOutputContent *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  -[ISBasePlayerUIView photoView](self, "photoView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView customPhotoView](self, "customPhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_content;
  v6 = v5;
  if (v3 && (!v5 || -[ISPlayerOutputContent photoIsOriginal](v5, "photoIsOriginal")))
  {
    objc_msgSend(v11, "removeFromSuperview");
    objc_msgSend(v3, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v4)
    {
      v8 = v4;
      v9 = v3;
LABEL_8:
      objc_msgSend(v8, "insertSubview:atIndex:", v9, 0);
    }
  }
  else
  {
    objc_msgSend(v11, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v3, "removeFromSuperview");
      v8 = v4;
      v9 = v11;
      goto LABEL_8;
    }
  }
  -[ISBasePlayerUIView setNeedsLayout](self, "setNeedsLayout");

}

- (ISWrappedAVAudioSession)wrappedAudioSession
{
  return self->_wrappedAudioSession;
}

- (ISVideoPlayerUIView)videoView
{
  return self->_videoView;
}

- (UIImage)overrideImage
{
  return self->_overrideImage;
}

- (UIView)customPhotoView
{
  return self->_customPhotoView;
}

- (void)applyOutputInfo:(id)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a4;
  v8 = a5;
  v9 = a3;
  -[ISBasePlayerUIView layoutIfNeeded](self, "layoutIfNeeded");
  -[ISBasePlayerUIView videoContainerView](self, "videoContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView photoView](self, "photoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView customPhotoView](self, "customPhotoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ISBasePlayerUIView isDisplayingPhoto](self, "isDisplayingPhoto");
  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v11, "layer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  +[ISTransitionApplier defaultApplier](ISTransitionApplier, "defaultApplier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applyOutputInfo:withTransitionOptions:toPhotoLayer:videoLayer:completion:", v9, v26, v17, v19, v8);

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "videoAlpha");
  v22 = v21;

  objc_msgSend(v20, "numberWithDouble:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView videoBlurView](self, "videoBlurView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forKeyPath:ofLayer:withTransitionOptions:completion:", v23, CFSTR("opacity"), v25, v26, 0);

  if (v13 != -[ISBasePlayerUIView isDisplayingPhoto](self, "isDisplayingPhoto"))
  {
    objc_msgSend(v26, "transitionDuration");
    -[ISBasePlayerUIView _signalChange:withAnimationDuration:](self, "_signalChange:withAnimationDuration:", 1);
  }

}

- (BOOL)isDisplayingPhoto
{
  void *v2;
  double v3;
  BOOL v4;

  -[ISBasePlayerUIView videoContainerView](self, "videoContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 == 0.0;

  return v4;
}

- (ISVideoPlayerUIView)videoBlurView
{
  return self->_videoBlurView;
}

- (UIView)videoContainerView
{
  return self->_videoContainerView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  double v24;
  double MidX;
  double MidY;
  double x;
  double y;
  double width;
  double height;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  objc_super v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v57.receiver = self;
  v57.super_class = (Class)ISBasePlayerUIView;
  -[ISBasePlayerUIView layoutSubviews](&v57, sel_layoutSubviews);
  -[ISBasePlayerUIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ISBasePlayerUIView containerView](self, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView photoView](self, "photoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView customPhotoView](self, "customPhotoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView videoView](self, "videoView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView videoContainerView](self, "videoContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView videoBlurView](self, "videoBlurView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[ISBasePlayerUIView contentMode](self, "contentMode");
  objc_msgSend(v14, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMeshTransform:", 0);

  objc_msgSend(v12, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  if (v19)
  {
    v22 = v21 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v20 == *MEMORY[0x1E0C9D820];
    if (!v22 && v17 != 2)
    {
      v24 = v20 / v21;
      v58.origin.x = v4;
      v58.origin.y = v6;
      v58.size.width = v8;
      v58.size.height = v10;
      MidX = CGRectGetMidX(v58);
      v59.origin.x = v4;
      v59.origin.y = v6;
      v59.size.width = v8;
      v59.size.height = v10;
      MidY = CGRectGetMidY(v59);
      if (v8 / v10 > v24)
        v8 = v10 * v24;
      else
        v10 = v8 / v24;
      v4 = MidX + v8 * -0.5;
      v6 = MidY + v10 * -0.5;
    }
  }
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  objc_msgSend(v11, "bounds");
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  v31 = CGRectGetMidX(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v32 = CGRectGetMidY(v61);
  objc_msgSend(v12, "setCenter:", v31, v32);
  objc_msgSend(v12, "setBounds:", x, y, width, height);
  objc_msgSend(v12, "setContentMode:", v17);
  objc_msgSend(v13, "setCenter:", v31, v32);
  objc_msgSend(v13, "setBounds:", x, y, width, height);
  objc_msgSend(v15, "setCenter:", v31, v32);
  objc_msgSend(v15, "setBounds:", x, y, width, height);
  objc_msgSend(v15, "setContentMode:", v17);
  objc_msgSend(v14, "setCenter:", v31, v32);
  objc_msgSend(v14, "setBounds:", x, y, width, height);
  objc_msgSend(v14, "setContentMode:", v17);
  objc_msgSend(v16, "setCenter:", v31, v32);
  objc_msgSend(v16, "setBounds:", x, y, width, height);
  objc_msgSend(v16, "setContentMode:", v17);
  -[ISBasePlayerUIView _updateVideoViewsFrameWithContainerBounds:](self, "_updateVideoViewsFrameWithContainerBounds:", x, y, width, height);
  -[ISBasePlayerUIView scaleAnchorOffset](self, "scaleAnchorOffset");
  v34 = v33;
  v36 = v35;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  v37 = 0.5;
  v38 = 0.5;
  if (!CGRectIsEmpty(v62))
  {
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    v38 = v34 / CGRectGetWidth(v63) + 0.5;
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v37 = v36 / CGRectGetHeight(v64) + 0.5;
  }
  objc_msgSend(v12, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAnchorPoint:", v38, v37);

  objc_msgSend(v12, "center");
  objc_msgSend(v12, "setCenter:", v40 + v34, v41 + v36);
  objc_msgSend(v13, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setAnchorPoint:", v38, v37);

  objc_msgSend(v13, "center");
  objc_msgSend(v13, "setCenter:", v43 + v34, v44 + v36);
  objc_msgSend(v14, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setAnchorPoint:", v38, v37);

  objc_msgSend(v14, "center");
  objc_msgSend(v14, "setCenter:", v46 + v34, v47 + v36);
  objc_msgSend(v16, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAnchorPoint:", v38, v37);

  objc_msgSend(v16, "center");
  objc_msgSend(v16, "setCenter:", v49 + v34, v50 + v36);
  objc_msgSend(v15, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAnchorPoint:", v38, v37);

  objc_msgSend(v15, "center");
  objc_msgSend(v15, "setCenter:", v52 + v34, v53 + v36);
  -[ISBasePlayerUIView videoTransform](self, "videoTransform");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setMeshTransform:", v54);

  -[ISBasePlayerUIView videoTransform](self, "videoTransform");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setHidden:", v56 == 0);

}

- (CAMeshTransform)videoTransform
{
  return self->_videoTransform;
}

- (ISBasePlayerUIView)initWithFrame:(CGRect)a3
{
  ISBasePlayerUIView *v3;
  ISBasePlayerUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISBasePlayerUIView;
  v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ISBasePlayerUIView _performCommonInitialization](v3, "_performCommonInitialization");
  return v4;
}

- (void)_performCommonInitialization
{
  CGRect *p_contentsRect;
  PXAVResourceReclamationController *v4;
  PXAVResourceReclamationController *resourceReclamationController;
  UIView *v6;
  UIView *containerView;
  UIImageView *v8;
  UIImageView *photoView;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  ISVideoPlayerUIView *v15;
  ISVideoPlayerUIView *videoView;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  ISVideoPlayerUIView *v22;
  ISVideoPlayerUIView *videoBlurView;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  UIView *videoContainerView;
  _QWORD v34[4];
  id v35;
  id location;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  p_contentsRect = &self->_contentsRect;
  self->_contentsRect = *(CGRect *)ISRectUnit;
  v4 = (PXAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E0D78240]);
  resourceReclamationController = self->_resourceReclamationController;
  self->_resourceReclamationController = v4;

  -[PXAVResourceReclamationController registerObserver:](self->_resourceReclamationController, "registerObserver:", self);
  self->_preferredImageDynamicRange = 0;
  -[ISBasePlayerUIView _updateAudioSession](self, "_updateAudioSession");
  -[ISBasePlayerUIView setClipsToBounds:](self, "setClipsToBounds:", 1);
  v6 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  containerView = self->_containerView;
  self->_containerView = v6;

  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  -[ISBasePlayerUIView addSubview:](self, "addSubview:", self->_containerView);
  v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
  photoView = self->_photoView;
  self->_photoView = v8;

  x = p_contentsRect->origin.x;
  y = p_contentsRect->origin.y;
  width = p_contentsRect->size.width;
  height = p_contentsRect->size.height;
  -[UIImageView layer](self->_photoView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", x, y, width, height);

  v15 = objc_alloc_init(ISVideoPlayerUIView);
  videoView = self->_videoView;
  self->_videoView = v15;

  v17 = p_contentsRect->origin.x;
  v18 = p_contentsRect->origin.y;
  v19 = p_contentsRect->size.width;
  v20 = p_contentsRect->size.height;
  -[ISVideoPlayerUIView layer](self->_videoView, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setContentsRect:", v17, v18, v19, v20);

  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __50__ISBasePlayerUIView__performCommonInitialization__block_invoke;
  v34[3] = &unk_1E9453BF8;
  objc_copyWeak(&v35, &location);
  -[ISVideoPlayerUIView setVideoLayerReadyForDisplayChangeHandler:](self->_videoView, "setVideoLayerReadyForDisplayChangeHandler:", v34);
  v22 = objc_alloc_init(ISVideoPlayerUIView);
  videoBlurView = self->_videoBlurView;
  self->_videoBlurView = v22;

  v24 = p_contentsRect->origin.x;
  v25 = p_contentsRect->origin.y;
  v26 = p_contentsRect->size.width;
  v27 = p_contentsRect->size.height;
  -[ISVideoPlayerUIView layer](self->_videoBlurView, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentsRect:", v24, v25, v26, v27);

  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setName:", CFSTR("vitalityBlur"));
  objc_msgSend(v29, "setCachesInputImage:", 0);
  objc_msgSend(v29, "setValue:forKey:", &unk_1E945FD40, CFSTR("inputRadius"));
  objc_msgSend(v29, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputHardEdges"));
  objc_msgSend(v29, "setValue:forKey:", CFSTR("medium"), CFSTR("inputQuality"));
  v37[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISVideoPlayerUIView layer](self->_videoBlurView, "layer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFilters:", v30);

  v32 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  videoContainerView = self->_videoContainerView;
  self->_videoContainerView = v32;

  -[UIView addSubview:](self->_videoContainerView, "addSubview:", self->_videoBlurView);
  -[UIView addSubview:](self->_videoContainerView, "addSubview:", self->_videoView);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_photoView);
  -[UIView addSubview:](self->_containerView, "addSubview:", self->_videoContainerView);
  -[ISBasePlayerUIView _updatePhotoViewDynamicRange](self, "_updatePhotoViewDynamicRange");

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (CGPoint)scaleAnchorOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scaleAnchorOffset.x;
  y = self->_scaleAnchorOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

void __50__ISBasePlayerUIView__performCommonInitialization__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_videoViewReadyForDisplayDidChange");

}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  if (-[ISBasePlayerUIView contentMode](self, "contentMode") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ISBasePlayerUIView;
    -[ISBasePlayerUIView setContentMode:](&v5, sel_setContentMode_, a3);
    -[ISBasePlayerUIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setWrappedAudioSession:(id)a3
{
  ISWrappedAVAudioSession *v5;
  ISWrappedAVAudioSession *v6;

  v5 = (ISWrappedAVAudioSession *)a3;
  if (self->_wrappedAudioSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_wrappedAudioSession, a3);
    -[ISBasePlayerUIView audioSessionDidChange](self, "audioSessionDidChange");
    v5 = v6;
  }

}

- (void)setVideoLayerReadyForDisplayChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (ISBasePlayerUIView)initWithCoder:(id)a3
{
  ISBasePlayerUIView *v3;
  ISBasePlayerUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISBasePlayerUIView;
  v3 = -[ISBasePlayerUIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ISBasePlayerUIView _performCommonInitialization](v3, "_performCommonInitialization");
  return v4;
}

- (void)registerChangeObserver:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  -[ISBasePlayerUIView _changeObserver](self, "_changeObserver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v5)
    -[ISBasePlayerUIView _setChangeObserver:](self, "_setChangeObserver:", v5);

}

- (void)unregisterChangeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ISBasePlayerUIView _changeObserver](self, "_changeObserver");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[ISBasePlayerUIView _setChangeObserver:](self, "_setChangeObserver:", 0);
}

- (void)_setChangeObserver:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__changeObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__changeObserver, obj);
    self->_changeObserverRespondsTo.didChangeWithAnimationDuration = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setVideoTransform:(id)a3
{
  CAMeshTransform *v4;
  CAMeshTransform *v5;
  char v6;
  CAMeshTransform *v7;
  CAMeshTransform *videoTransform;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CAMeshTransform *v18;

  v4 = (CAMeshTransform *)a3;
  v5 = v4;
  if (self->_videoTransform != v4)
  {
    v18 = v4;
    v6 = -[CAMeshTransform isEqual:](v4, "isEqual:");
    v5 = v18;
    if ((v6 & 1) == 0)
    {
      v7 = (CAMeshTransform *)-[CAMeshTransform copy](v18, "copy");
      videoTransform = self->_videoTransform;
      self->_videoTransform = v7;

      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "disableActions");
      -[ISBasePlayerUIView videoView](self, "videoView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMeshTransform:", v18);

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scale");
      v13 = v12;
      -[ISBasePlayerUIView videoView](self, "videoView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRasterizationScale:", v13);

      -[ISBasePlayerUIView videoTransform](self, "videoTransform");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ISBasePlayerUIView videoBlurView](self, "videoBlurView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", v16 == 0);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      v5 = v18;
    }
  }

}

- (void)setVideoFilter:(id)a3
{
  CAFilter *v5;
  id *p_videoFilter;
  void *v7;
  void *v8;
  CAFilter *v9;

  v5 = (CAFilter *)a3;
  p_videoFilter = (id *)&self->_videoFilter;
  if (self->_videoFilter != v5)
  {
    v9 = v5;
    -[ISBasePlayerUIView videoView](self, "videoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*p_videoFilter)
      objc_msgSend(v8, "is_removeFilter:");
    objc_storeStrong(p_videoFilter, a3);
    if (v9)
      objc_msgSend(v8, "is_addFilter:", v9);

    v5 = v9;
  }

}

- (void)setCustomPhotoView:(id)a3
{
  UIView *v5;
  UIView *customPhotoView;
  UIView *v7;

  v5 = (UIView *)a3;
  customPhotoView = self->_customPhotoView;
  if (customPhotoView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](customPhotoView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customPhotoView, a3);
    -[ISBasePlayerUIView _updatePhotoView](self, "_updatePhotoView");
    v5 = v7;
  }

}

- (BOOL)isVideoReadyForDisplay
{
  void *v2;
  char v3;

  -[ISBasePlayerUIView videoView](self, "videoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "videoLayerReadyForDisplay");

  return v3;
}

- (void)_videoViewReadyForDisplayDidChange
{
  void *v3;
  void (**v4)(void);

  -[ISBasePlayerUIView videoLayerReadyForDisplayChangeHandler](self, "videoLayerReadyForDisplayChangeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ISBasePlayerUIView videoLayerReadyForDisplayChangeHandler](self, "videoLayerReadyForDisplayChangeHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (void)setScaleAnchorOffset:(CGPoint)a3
{
  if (a3.x != self->_scaleAnchorOffset.x || a3.y != self->_scaleAnchorOffset.y)
  {
    self->_scaleAnchorOffset = a3;
    -[ISBasePlayerUIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentsRect;
  void *v9;
  void *v10;
  id v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    -[ISBasePlayerUIView setNeedsLayout](self, "setNeedsLayout");
    -[ISBasePlayerUIView photoView](self, "photoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentsRect:", x, y, width, height);

    -[ISBasePlayerUIView videoView](self, "videoView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentsRect:", x, y, width, height);

  }
}

- (void)_updateAudioSession
{
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend((id)objc_opt_class(), "audioSessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ISBasePlayerUIView__updateAudioSession__block_invoke;
  block[3] = &unk_1E9453F70;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updatePlayerAudioSession
{
  void *v3;
  void *v4;
  id v5;

  -[ISBasePlayerUIView wrappedAudioSession](self, "wrappedAudioSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ISBasePlayerUIView player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWrappedAudioSession:", v5);

  }
}

- (void)_signalChange:(unint64_t)a3 withAnimationDuration:(double)a4
{
  id v7;

  if (self->_changeObserverRespondsTo.didChangeWithAnimationDuration)
  {
    -[ISBasePlayerUIView _changeObserver](self, "_changeObserver");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "basePlayerUIView:didChange:withAnimationDuration:", self, a3, a4);

  }
}

- (void)_updateVideoViewsFrameWithContainerBounds:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  -[ISBasePlayerUIView containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  -[ISPlayerOutputContent aspectRatio](self->_content, "aspectRatio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  if (v10 == 0.0)
  {
    v11 = 1.0;
    if (v6 != 0.0 && v8 != 0.0)
    {
      v12 = v6 == *MEMORY[0x1E0D71130] && v8 == *(double *)(MEMORY[0x1E0D71130] + 8);
      v13 = fabs(v6 / v8);
      if (v12)
        v11 = 1.0;
      else
        v11 = v13;
    }
  }

  -[ISBasePlayerUIView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  v16 = v15;

  if (v16 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scale");
    v16 = v18;

  }
  -[ISBasePlayerUIView contentsRect](self, "contentsRect");
  PFFrameApplyingContentsRectInBounds();
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[ISBasePlayerUIView videoView](self, "videoView", *(_QWORD *)&v11, *(_QWORD *)&v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[ISBasePlayerUIView videoBlurView](self, "videoBlurView");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFrame:", v20, v22, v24, v26);

}

- (void)setPreferredImageDynamicRange:(int64_t)a3
{
  if (self->_preferredImageDynamicRange != a3)
  {
    self->_preferredImageDynamicRange = a3;
    -[ISBasePlayerUIView _updatePhotoViewDynamicRange](self, "_updatePhotoViewDynamicRange");
  }
}

- (void)_updatePhotoViewDynamicRange
{
  int64_t v3;
  id v4;

  v3 = -[ISBasePlayerUIView preferredImageDynamicRange](self, "preferredImageDynamicRange");
  -[ISBasePlayerUIView photoView](self, "photoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreferredImageDynamicRange:", v3);

}

- (void)applyScale:(double)a3 withTransitionOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a5;
  v9 = a4;
  -[ISBasePlayerUIView layoutIfNeeded](self, "layoutIfNeeded");
  -[ISBasePlayerUIView videoContainerView](self, "videoContainerView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView photoView](self, "photoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView customPhotoView](self, "customPhotoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  +[ISTransitionApplier defaultApplier](ISTransitionApplier, "defaultApplier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "applyScale:withTransitionOptions:toPhotoLayer:videoLayer:completion:", v9, v15, v17, v8, a3);

}

- (id)generateSnapshotImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;
  CGImage *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  -[ISBasePlayerUIView videoView](self, "videoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISBasePlayerUIView videoContainerView](self, "videoContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;

  if (v6 <= 0.0)
  {
    -[ISBasePlayerUIView photoView](self, "photoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "image");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "videoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "videoComposition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0uLL;
    v34 = 0;
    if (v7)
      objc_msgSend(v7, "currentTime");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v9);
    -[ISBasePlayerUIView bounds](self, "bounds");
    v14 = v13;
    v16 = v15;
    -[ISBasePlayerUIView traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayScale");
    v19 = v18;

    if (v19 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "scale");
      v19 = v21;

    }
    objc_msgSend(v12, "setMaximumSize:", v14 * v19, v16 * v19);
    objc_msgSend(v12, "setAppliesPreferredTrackTransform:", 1);
    v31 = *MEMORY[0x1E0CA2E68];
    v26 = v31;
    v32 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v22 = v32;
    objc_msgSend(v12, "setRequestedTimeToleranceAfter:", &v31);
    v29 = v26;
    v30 = v22;
    objc_msgSend(v12, "setRequestedTimeToleranceBefore:", &v29);
    objc_msgSend(v12, "setVideoComposition:", v11);
    objc_msgSend(v12, "setApertureMode:", *MEMORY[0x1E0C89ED8]);
    v27 = v33;
    v28 = v34;
    v23 = (CGImage *)objc_msgSend(MEMORY[0x1E0D75130], "copyCGImageFromImageGenerator:atTime:actualTime:error:", v12, &v27, 0, 0);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v23);
    CGImageRelease(v23);

  }
  return v24;
}

- (void)setOverrideImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_overrideImage != v6)
  {
    objc_storeStrong((id *)&self->_overrideImage, a3);
    -[ISBasePlayerUIView photoView](self, "photoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 4) != 0 && (void *)ISBasePlayerUIViewPlayerObservationContext == a5)
    -[ISBasePlayerUIView _updatePlayerAudioSession](self, "_updatePlayerAudioSession", a3);
}

- (ISBasePlayer)player
{
  return self->_player;
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

- (int64_t)preferredImageDynamicRange
{
  return self->_preferredImageDynamicRange;
}

- (id)videoLayerReadyForDisplayChangeHandler
{
  return self->_videoLayerReadyForDisplayChangeHandler;
}

- (CAFilter)videoFilter
{
  return self->_videoFilter;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (ISBasePlayerUIViewChangeObserver)_changeObserver
{
  return (ISBasePlayerUIViewChangeObserver *)objc_loadWeakRetained((id *)&self->__changeObserver);
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (UIImageView)photoView
{
  return self->_photoView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_videoBlurView, 0);
  objc_destroyWeak((id *)&self->__changeObserver);
  objc_storeStrong((id *)&self->_wrappedAudioSession, 0);
  objc_storeStrong((id *)&self->_videoContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_videoFilter, 0);
  objc_storeStrong((id *)&self->_videoTransform, 0);
  objc_storeStrong(&self->_videoLayerReadyForDisplayChangeHandler, 0);
  objc_storeStrong((id *)&self->_overrideImage, 0);
  objc_storeStrong((id *)&self->_customPhotoView, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

void __41__ISBasePlayerUIView__updateAudioSession__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "livePhotoAudioSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__ISBasePlayerUIView__updateAudioSession__block_invoke_2;
  v4[3] = &unk_1E9453F70;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v6);
}

void __41__ISBasePlayerUIView__updateAudioSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setWrappedAudioSession:", *(_QWORD *)(a1 + 32));

}

+ (Class)playerClass
{
  return (Class)objc_opt_class();
}

+ (id)audioSessionQueue
{
  if (audioSessionQueue_onceToken != -1)
    dispatch_once(&audioSessionQueue_onceToken, &__block_literal_global_262);
  return (id)audioSessionQueue__queue;
}

+ (id)livePhotoAudioSession
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "audioSessionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)SharedAudioSession;
  if (!SharedAudioSession)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D78240]);
    v6 = (void *)livePhotoAudioSession_resourceReclamationController;
    livePhotoAudioSession_resourceReclamationController = (uint64_t)v5;

    objc_msgSend((id)livePhotoAudioSession_resourceReclamationController, "observationWithWeakTarget:selector:", a1, sel__handleAVResourceReclamationEvent_);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)livePhotoAudioSession_reclamationObservation;
    livePhotoAudioSession_reclamationObservation = v7;

    +[ISWrappedAVAudioSession auxiliarySession](ISWrappedAVAudioSession, "auxiliarySession");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)SharedAudioSession;
    SharedAudioSession = v9;

    v11 = *MEMORY[0x1E0C89660];
    v12 = *MEMORY[0x1E0C89748];
    v17 = 0;
    v13 = objc_msgSend((id)SharedAudioSession, "setCategory:mode:routeSharingPolicy:options:error:", v11, v12, 0, 0, &v17);
    v14 = v17;
    if ((v13 & 1) == 0)
    {
      ISGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_error_impl(&dword_1D2DCA000, v15, OS_LOG_TYPE_ERROR, "Failed configuring AVAudioSession for Live Photo playback. Error: %@", buf, 0xCu);
      }

    }
    v4 = (void *)SharedAudioSession;
  }
  return v4;
}

+ (void)_handleAVResourceReclamationEvent:(id)a3
{
  NSObject *v3;

  objc_msgSend(a1, "audioSessionQueue", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_9);

}

void __56__ISBasePlayerUIView__handleAVResourceReclamationEvent___block_invoke()
{
  void *v0;

  v0 = (void *)SharedAudioSession;
  SharedAudioSession = 0;

}

void __39__ISBasePlayerUIView_audioSessionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.ISLivePhotoUIView.audiosession", v2);
  v1 = (void *)audioSessionQueue__queue;
  audioSessionQueue__queue = (uint64_t)v0;

}

@end
