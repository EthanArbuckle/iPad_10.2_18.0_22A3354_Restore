@implementation PUUIImageViewController

- (PUUIImageViewController)initWithPhoto:(id)a3 imagePickerProperties:(id)a4 expectsLivePhoto:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUUIImageViewController;
  v10 = -[PLUIImageViewController initWithPhoto:](&v20, sel_initWithPhoto_, v8);
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CD1A18], *MEMORY[0x1E0CD1960], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pl_PHAssetWithPropertySets:photoLibrary:", v12, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v10 + 137);
    *((_QWORD *)v10 + 137) = v13;

    *((_BYTE *)v10 + 1092) = a5;
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DC5868]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v10 + 1093) = objc_msgSend(v15, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5908]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v10 + 1094) = objc_msgSend(v16, "BOOLValue");

    *((_BYTE *)v10 + 1090) = objc_msgSend(*((id *)v10 + 137), "canPlayLoopingVideo");
    if (*((_BYTE *)v10 + 1092) || (v17 = *((_BYTE *)v10 + 1093)) != 0)
    {
      if (objc_msgSend(*((id *)v10 + 137), "canPlayPhotoIris"))
        v17 = *((_BYTE *)v10 + 1090) == 0;
      else
        v17 = 0;
    }
    *((_BYTE *)v10 + 1089) = v17;
    *((_BYTE *)v10 + 1091) = objc_msgSend(*((id *)v10 + 137), "playbackStyle") == 2;
    objc_msgSend(v10, "localizedTitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v18);

  }
  return (PUUIImageViewController *)v10;
}

- (void)loadView
{
  void *v3;
  PUVideoPlayerView *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUUIImageViewController;
  -[PLUIImageViewController loadView](&v9, sel_loadView);
  if (*((_BYTE *)&self->super + 1089))
  {
    -[PUUIImageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (PUVideoPlayerView *)objc_alloc_init(MEMORY[0x1E0CD2160]);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoPlayerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PUVideoPlayerView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "bounds");
    -[PUVideoPlayerView setFrame:](v4, "setFrame:");
    -[PUVideoPlayerView setContentMode:](v4, "setContentMode:", 1);
    -[PUVideoPlayerView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    objc_msgSend(v3, "insertSubview:atIndex:", v4, 1);
    -[PUUIImageViewController _setLivePhotoView:](self, "_setLivePhotoView:", v4);
    -[PUUIImageViewController _setImageManagerVideoRequestID:](self, "_setImageManagerVideoRequestID:", 0);
    -[PUUIImageViewController _loadLivePhoto](self, "_loadLivePhoto");
LABEL_5:

    return;
  }
  if (*((_BYTE *)&self->super + 1090))
  {
    -[PUUIImageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(PUVideoPlayerView);
    -[PUVideoPlayerView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    objc_msgSend(v3, "bounds");
    -[PUVideoPlayerView setFrame:](v4, "setFrame:");
    -[PUVideoPlayerView setDelegate:](v4, "setDelegate:", self);
    objc_msgSend(v3, "insertSubview:atIndex:", v4, 1);
    -[PUUIImageViewController _setAutoloopView:](self, "_setAutoloopView:", v4);
    -[PUUIImageViewController _setImageManagerVideoRequestID:](self, "_setImageManagerVideoRequestID:", 0);
    -[PUUIImageViewController _loadAutoloopVideo](self, "_loadAutoloopVideo");
    goto LABEL_5;
  }
  if (*((_BYTE *)&self->super + 1091)
    && (*((_BYTE *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E0D714D8]) & 1) == 0)
  {
    -[PUUIImageViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D78258]);
    objc_msgSend(v3, "bounds");
    v4 = (PUVideoPlayerView *)objc_msgSend(v6, "initWithFrame:");
    -[PUVideoPlayerView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
    -[PUVideoPlayerView setContentMode:](v4, "setContentMode:", 1);
    -[PUVideoPlayerView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v7 = objc_alloc(MEMORY[0x1E0DC3890]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v8, "setContentMode:", 1);
    -[PUVideoPlayerView setPlaceholderImageView:](v4, "setPlaceholderImageView:", v8);
    objc_msgSend(v3, "insertSubview:atIndex:", v4, 0);
    -[PUUIImageViewController _setAnimatedImageView:](self, "_setAnimatedImageView:", v4);
    -[PUUIImageViewController _setAnimatedImageRequestID:](self, "_setAnimatedImageRequestID:", 0);
    -[PUUIImageViewController _loadAnimatedImage](self, "_loadAnimatedImage");

    goto LABEL_5;
  }
}

- (void)setIrisPlayer:(id)a3
{
  PUPhotoPickerResizeTaskDescriptorViewModel *v5;
  void *v6;
  void *v7;
  PUPhotoPickerResizeTaskDescriptorViewModel *v8;

  v5 = (PUPhotoPickerResizeTaskDescriptorViewModel *)a3;
  if (self->_resizeTaskDescriptorViewModel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, a3);
    -[PUPhotoPickerResizeTaskDescriptorViewModel player](self->_resizeTaskDescriptorViewModel, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUUIImageViewController _livePhotoView](self, "_livePhotoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlayer:", v6);

    v5 = v8;
  }

}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUUIImageViewController;
  -[PUUIImageViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUUIImageViewController resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (*((_BYTE *)&self->super + 1094))
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    -[PLUIImageViewController cropOverlay](self, "cropOverlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFileResizingHidden:", 0);

    -[PLUIImageViewController cropOverlay](self, "cropOverlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedFileSizeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFileResizingTitle:", v8);

    objc_msgSend(v4, "registerChangeObserver:context:", self, PUUIImageViewControllerResizeTaskDescriptorViewModelObservationContext);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUUIImageViewController;
  -[PLUIImageViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (LODWORD(self->_asset))
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelImageRequest:", LODWORD(self->_asset));

  }
  if (HIDWORD(self->_asset))
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelImageRequest:", HIDWORD(self->_asset));

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUUIImageViewController;
  -[PLUIImageViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didDisplayPhotoPickerPreview");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUUIImageViewController;
  -[PUUIImageViewController viewDidLayoutSubviews](&v17, sel_viewDidLayoutSubviews);
  -[PUUIImageViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = PURectWithAspectRatioFittingRect((double)(unint64_t)objc_msgSend(*(id *)&self->_isIris, "pixelWidth")/ (double)(unint64_t)objc_msgSend(*(id *)&self->_isIris, "pixelHeight"), v4, v5, v6, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PUUIImageViewController _livePhotoView](self, "_livePhotoView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  -[PUUIImageViewController _autoloopView](self, "_autoloopView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v8, v10, v12, v14);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (id)irisPlayerViewViewHostingGestureRecognizers:(id)a3
{
  return 0;
}

- (void)videoPlayerView:(id)a3 isReadyForDisplayDidChange:(BOOL)a4
{
  objc_msgSend(a3, "setIsDisplayingPlaceholder:", !a4);
}

- (void)_loadAnimatedImage
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke;
  v6[3] = &unk_1E58AA268;
  objc_copyWeak(&v7, &location);
  -[PUUIImageViewController _fetchPreviewImageWithCompletion:](self, "_fetchPreviewImageWithCompletion:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke_147;
  v4[3] = &unk_1E58AA290;
  objc_copyWeak(&v5, &location);
  -[PUUIImageViewController _fetchAnimatedImageWithCompletion:](self, "_fetchAnimatedImageWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleAnimatedImagePreviewResult:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUUIImageViewController _animatedImageView](self, "_animatedImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)_handleAnimatedImageResult:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUUIImageViewController _setAnimatedImageRequestID:](self, "_setAnimatedImageRequestID:", 0);
  -[PUUIImageViewController _animatedImageView](self, "_animatedImageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pf_animatedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImage:", v5);
  objc_msgSend(v6, "setPlaying:", 1);

}

- (void)_loadAutoloopVideo
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke;
  v6[3] = &unk_1E58AA268;
  objc_copyWeak(&v7, &location);
  -[PUUIImageViewController _fetchPreviewImageWithCompletion:](self, "_fetchPreviewImageWithCompletion:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_150;
  v4[3] = &unk_1E58AA2B8;
  objc_copyWeak(&v5, &location);
  -[PUUIImageViewController _fetchVideoWithCompletion:](self, "_fetchVideoWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_handleAutoloopPreviewImageResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUUIImageViewController _autoloopView](self, "_autoloopView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderImage:", v4);

}

- (void)_handleAutoloopVideoResult:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  id v8;

  v4 = a3;
  -[PUUIImageViewController _setVideoAssetURL:](self, "_setVideoAssetURL:", v4);
  -[PUUIImageViewController _autoloopView](self, "_autoloopView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0D78298]);
  objc_msgSend(v6, "replaceCurrentItemWithPlayerItem:", v5);
  objc_msgSend(v6, "setLoopingEnabled:withTemplateItem:", 1, v5);
  objc_msgSend(v8, "configureWithAVPlayer:", v6);
  LODWORD(v7) = 1.0;
  objc_msgSend(v6, "setRate:", v7);

}

- (void)_loadLivePhoto
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = *(id *)&self->_isIris;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CD1618]);
  objc_msgSend(v5, "setDeliveryMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "scale");
  v12 = v8 * v11;
  v13 = v10 * v11;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__PUUIImageViewController__loadLivePhoto__block_invoke;
  v14[3] = &unk_1E58AA308;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v3, 0, v5, v14, v12, v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_handleLivePhotoRequestResult:(id)a3 info:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[PUUIImageViewController _livePhotoView](self, "_livePhotoView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLivePhoto:", v5);

}

- (void)_fetchPreviewImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = *(void **)&self->_isIris;
  v6 = (void *)MEMORY[0x1E0CD15A0];
  v7 = v5;
  objc_msgSend(v6, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v9, "setVersion:", 0);
  objc_msgSend(v9, "setDeliveryMode:", 2);
  objc_msgSend(v9, "setResizeMode:", 0);
  objc_msgSend(v9, "setNetworkAccessAllowed:", 0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "scale");
  v16 = v12 * v15;
  v17 = v14 * v15;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PUUIImageViewController__fetchPreviewImageWithCompletion___block_invoke;
  v19[3] = &unk_1E58AA608;
  v20 = v4;
  v18 = v4;
  objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v9, v19, v16, v17);

}

- (void)_fetchVideoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setVersion:", 0);
  objc_msgSend(v5, "setDeliveryMode:", 1);
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)&self->_isIris;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PUUIImageViewController__fetchVideoWithCompletion___block_invoke;
  v10[3] = &unk_1E58AA330;
  v11 = v4;
  v8 = v4;
  v9 = objc_msgSend(v6, "requestURLForVideo:options:resultHandler:", v7, v5, v10);

  -[PUUIImageViewController _setImageManagerVideoRequestID:](self, "_setImageManagerVideoRequestID:", v9);
}

- (void)_fetchLivePhotoWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CD1618]);
  objc_msgSend(v5, "setDeliveryMode:", 1);
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)&self->_isIris;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__PUUIImageViewController__fetchLivePhotoWithCompletion___block_invoke;
  v11[3] = &unk_1E58AA358;
  v12 = v4;
  v8 = *MEMORY[0x1E0CD1C28];
  v9 = *(double *)(MEMORY[0x1E0CD1C28] + 8);
  v10 = v4;
  objc_msgSend(v6, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v5, v11, v8, v9);

}

- (void)_fetchAnimatedImageWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v5, "setVersion:", 2);
  objc_msgSend(v5, "setNetworkAccessAllowed:", 1);
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)&self->_isIris;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PUUIImageViewController__fetchAnimatedImageWithCompletion___block_invoke;
  v10[3] = &unk_1E58AA380;
  v11 = v4;
  v8 = v4;
  v9 = objc_msgSend(v6, "requestAnimatedImageForAsset:options:resultHandler:", v7, v5, v10);

  -[PUUIImageViewController _setAnimatedImageRequestID:](self, "_setAnimatedImageRequestID:", v9);
}

- (void)_generateGIFFromVideoURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3620];
    v10 = a3;
    objc_msgSend(v9, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tmpFileForVideoTranscodeToPhotoDataDirectory:withExtension:", 0, CFSTR("GIF"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750F8]), "initWithVideoURL:", v10);

    v15 = (void *)MEMORY[0x1E0D750F8];
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke;
    v21[3] = &unk_1E58AA3A8;
    v22 = v7;
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke_2;
    v18[3] = &unk_1E58AA3D0;
    v19 = v13;
    v20 = v8;
    v17 = v13;
    objc_msgSend(v15, "runExport:toURL:progress:completion:", v14, v17, v21, v18);

  }
}

- (void)cropOverlayWasCancelled:(id)a3
{
  void *v4;
  id v5;

  -[PUUIImageViewController cancellationDelegate](self, "cancellationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUUIImageViewController cancellationDelegate](self, "cancellationDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageViewControllerDidCancel:", self);

  }
}

- (void)cropOverlayWasOKed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  objc_super v9;
  _QWORD block[6];
  _QWORD v11[4];
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  NSObject *v17;

  v4 = a3;
  -[PUUIImageViewController fileResizingDelegate](self, "fileResizingDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUUIImageViewController fileResizingDelegate](self, "fileResizingDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject imageViewControllerDidConfirmSelection:](v6, "imageViewControllerDidConfirmSelection:", self);
  }
  else
  {
    if (!*((_BYTE *)&self->super + 1089))
    {
      v9.receiver = self;
      v9.super_class = (Class)PUUIImageViewController;
      -[PLUIImageViewController cropOverlayWasOKed:](&v9, sel_cropOverlayWasOKed_, v4);
      goto LABEL_10;
    }
    v7 = dispatch_group_create();
    v6 = v7;
    v8 = MEMORY[0x1E0C809B0];
    if (*((_BYTE *)&self->super + 1093))
    {
      dispatch_group_enter(v7);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke;
      v16[3] = &unk_1E58AB038;
      v16[4] = self;
      v17 = v6;
      -[PUUIImageViewController _fetchVideoWithCompletion:](self, "_fetchVideoWithCompletion:", v16);

    }
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__99355;
    v14[4] = __Block_byref_object_dispose__99356;
    v15 = 0;
    if (*((_BYTE *)&self->super + 1092))
    {
      dispatch_group_enter(v6);
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_169;
      v11[3] = &unk_1E58AA3F8;
      v13 = v14;
      v12 = v6;
      -[PUUIImageViewController _fetchLivePhotoWithCompletion:](self, "_fetchLivePhotoWithCompletion:", v11);

    }
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_2;
    block[3] = &unk_1E58AAE48;
    block[4] = self;
    block[5] = v14;
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);
    _Block_object_dispose(v14, 8);

  }
LABEL_10:

}

- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "properties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (int)*MEMORY[0x1E0D714E8];
  PLPhotoPickerDictionaryFromMedia();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLPickerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v14), "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for asset %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__PUUIImageViewController_handleMediaSelectionUsingTile_managedAsset_args_includeEditing___block_invoke;
  v19[3] = &unk_1E58AA420;
  objc_copyWeak(&v20, (id *)buf);
  objc_msgSend(v18, "didSelectMediaWithInfoDictionary:allowedHandler:", v15, v19);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (int)*MEMORY[0x1E0D714E8];
  PLPhotoPickerDictionaryFromVideo();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLPickerGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v8), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for video asset %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PUUIImageViewController_handleVideoSelectionWithURL_args___block_invoke;
  v13[3] = &unk_1E58AA420;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v12, "didSelectMediaWithInfoDictionary:allowedHandler:", v9, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (void)handleAutoloopSelected
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "convertAutoloopsToGIF");

  if (v4)
  {
    -[PLUIImageViewController beginDisplayingProgress](self, "beginDisplayingProgress");
    v5 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E0D714F0]);
    PLLocalizedFrameworkString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabelText:", v6);

    -[PUUIImageViewController _videoAssetURL](self, "_videoAssetURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke;
    v10[3] = &unk_1E58AA448;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_3;
    v9[3] = &unk_1E58AA470;
    -[PUUIImageViewController _generateGIFFromVideoURL:progressHandler:completionHandler:](self, "_generateGIFFromVideoURL:progressHandler:completionHandler:", v7, v10, v9);

  }
  else
  {
    -[PUUIImageViewController _videoAssetURL](self, "_videoAssetURL");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PUUIImageViewController _finishAutoloopDeliveryWithVideoURL:gifURL:](self, "_finishAutoloopDeliveryWithVideoURL:gifURL:", v8, 0);

  }
}

- (void)_finishAutoloopDeliveryWithVideoURL:(id)a3 gifURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPickerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E0D714E8]), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for looping asset %@", buf, 0xCu);

  }
  if (v7)
  {
    v15 = *MEMORY[0x1E0DC5878];
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  PLPhotoPickerDictionaryFromVideo();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PUUIImageViewController__finishAutoloopDeliveryWithVideoURL_gifURL___block_invoke;
  v13[3] = &unk_1E58AA420;
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v12, "didSelectMediaWithInfoDictionary:allowedHandler:", v11, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

- (BOOL)doNotTranscode
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5928]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)videoQuality
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC4CC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)exportPreset
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5940]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)viewImageBeforeSelecting
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5948]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)videoMaximumDuration
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC4CB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)disableVideoTrimMessage
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC58B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)forceNativeScreenScale
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC58C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)force1XCroppedImage
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5858]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)chooseButtonTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC58A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cancelButtonTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("_UIImagePickerControllerCancelButtonTitle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerCustomBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)maxZoomScaleOverride
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerMaxZoomScaleOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)imagePickerAllowsEditing
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC4C68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (unint64_t)imagePickerSavingOptions
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5950]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (BOOL)wantsAutoloopUI
{
  return *((_BYTE *)&self->super + 1090);
}

- (BOOL)wantsLegacyImageUI
{
  if (*((_BYTE *)&self->super + 1091))
    return *((_BYTE *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E0D714D8]) & 1;
  else
    return 1;
}

- (BOOL)uiipc_useTelephonyUI
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DC5910]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isDisplayedInPhotoPicker
{
  objc_super v4;

  if (-[PUUIImageViewController _isPhotosPickerExtensionAvailable](self, "_isPhotosPickerExtensionAvailable"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)PUUIImageViewController;
  return -[PLUIImageViewController isDisplayedInPhotoPicker](&v4, sel_isDisplayedInPhotoPicker);
}

- (int)cropOverlayMode
{
  objc_super v3;

  if (*((_BYTE *)&self->super + 1094))
    return 7;
  v3.receiver = self;
  v3.super_class = (Class)PUUIImageViewController;
  return -[PLUIImageViewController cropOverlayMode](&v3, sel_cropOverlayMode);
}

- (id)cropOverlayFileSizeMenuActions:(id)a3
{
  void *v4;
  void *v5;

  -[PUUIImageViewController fileResizingDelegate](self, "fileResizingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageViewControllerFileSizeMenuActions:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v6;
  void *v7;
  id v8;

  if ((void *)PUUIImageViewControllerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    -[PLUIImageViewController cropOverlay](self, "cropOverlay", a3, a4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PUUIImageViewController resizeTaskDescriptorViewModel](self, "resizeTaskDescriptorViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedFileSizeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFileResizingTitle:", v7);

  }
}

- (BOOL)pu_wantsNavigationBarVisible
{
  objc_super v4;

  if (-[PUUIImageViewController isDisplayedInPhotoPicker](self, "isDisplayedInPhotoPicker"))
    return !-[PLUIImageViewController _displaysFullScreen](self, "_displaysFullScreen");
  v4.receiver = self;
  v4.super_class = (Class)PUUIImageViewController;
  return -[UIViewController pu_wantsNavigationBarVisible](&v4, sel_pu_wantsNavigationBarVisible);
}

- (void)performPhotoPickerSelection
{
  id v3;

  -[PLUIImageViewController cropOverlay](self, "cropOverlay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUUIImageViewController cropOverlayWasOKed:](self, "cropOverlayWasOKed:", v3);

}

- (BOOL)_isPhotosPickerExtensionAvailable
{
  void *v2;
  BOOL v3;

  -[PUUIImageViewController photoPicker](self, "photoPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PUPhotoPicker)photoPicker
{
  return (PUPhotoPicker *)objc_loadWeakRetained((id *)&self->__imageManagerVideoRequestID);
}

- (void)setPhotoPicker:(id)a3
{
  objc_storeWeak((id *)&self->__imageManagerVideoRequestID, a3);
}

- (PUUIImageViewControllerCancellationDelegate)cancellationDelegate
{
  return (PUUIImageViewControllerCancellationDelegate *)objc_loadWeakRetained((id *)&self->_photoPicker);
}

- (void)setCancellationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_photoPicker, a3);
}

- (PUUIImageViewControllerFileResizingDelegate)fileResizingDelegate
{
  return (PUUIImageViewControllerFileResizingDelegate *)objc_loadWeakRetained((id *)&self->_cancellationDelegate);
}

- (void)setFileResizingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cancellationDelegate, a3);
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return (PUPhotoPickerResizeTaskDescriptorViewModel *)objc_loadWeakRetained((id *)&self->_fileResizingDelegate);
}

- (void)setResizeTaskDescriptorViewModel:(id)a3
{
  objc_storeWeak((id *)&self->_fileResizingDelegate, a3);
}

- (PUBrowsingIrisPlayer)_irisPlayer
{
  return (PUBrowsingIrisPlayer *)self->_resizeTaskDescriptorViewModel;
}

- (void)set_irisPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, a3);
}

- (PHLivePhotoView)_livePhotoView
{
  return (PHLivePhotoView *)self->__irisPlayer;
}

- (void)_setLivePhotoView:(id)a3
{
  objc_storeStrong((id *)&self->__irisPlayer, a3);
}

- (PUVideoPlayerView)_autoloopView
{
  return (PUVideoPlayerView *)self->__livePhotoView;
}

- (void)_setAutoloopView:(id)a3
{
  objc_storeStrong((id *)&self->__livePhotoView, a3);
}

- (ISAnimatedImageView)_animatedImageView
{
  return (ISAnimatedImageView *)self->__autoloopView;
}

- (void)_setAnimatedImageView:(id)a3
{
  objc_storeStrong((id *)&self->__autoloopView, a3);
}

- (NSURL)_videoAssetURL
{
  return (NSURL *)self->__animatedImageView;
}

- (void)_setVideoAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->__animatedImageView, a3);
}

- (NSURL)_assetURL
{
  return self->__videoAssetURL;
}

- (void)_setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->__videoAssetURL, a3);
}

- (int)_imageManagerVideoRequestID
{
  return (int)self->_asset;
}

- (void)_setImageManagerVideoRequestID:(int)a3
{
  LODWORD(self->_asset) = a3;
}

- (int)_animatedImageRequestID
{
  return HIDWORD(self->_asset);
}

- (void)_setAnimatedImageRequestID:(int)a3
{
  HIDWORD(self->_asset) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__videoAssetURL, 0);
  objc_storeStrong((id *)&self->__animatedImageView, 0);
  objc_storeStrong((id *)&self->__autoloopView, 0);
  objc_storeStrong((id *)&self->__livePhotoView, 0);
  objc_storeStrong((id *)&self->__irisPlayer, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_destroyWeak((id *)&self->_fileResizingDelegate);
  objc_destroyWeak((id *)&self->_cancellationDelegate);
  objc_destroyWeak((id *)&self->_photoPicker);
  objc_destroyWeak((id *)&self->__imageManagerVideoRequestID);
  objc_storeStrong((id *)&self->_isIris, 0);
}

void __70__PUUIImageViewController__finishAutoloopDeliveryWithVideoURL_gifURL___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_enableCropOverlay");

  }
}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke(uint64_t a1, double a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_2;
  v2[3] = &unk_1E58AACF0;
  v2[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_4;
  block[3] = &unk_1E58AB790;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_4(_QWORD *a1, double a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LODWORD(a2) = 1.0;
  objc_msgSend(*(id *)(a1[4] + (int)*MEMORY[0x1E0D714F0]), "setPercentComplete:", a2);
  if (a1[5])
  {
    v3 = (void *)a1[4];
    objc_msgSend(v3, "_videoAssetURL");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_finishAutoloopDeliveryWithVideoURL:gifURL:");

  }
  else
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[6];
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Failed to generate GIF from autoloop video with error: %@", buf, 0xCu);
    }

    v6 = (void *)a1[4];
    objc_msgSend(v6, "_videoAssetURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_finishAutoloopDeliveryWithVideoURL:gifURL:", v7, 0);

  }
}

uint64_t __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_2(uint64_t a1)
{
  double v1;

  v1 = *(double *)(a1 + 40);
  *(float *)&v1 = v1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D714F0]), "setPercentComplete:", v1);
}

void __60__PUUIImageViewController_handleVideoSelectionWithURL_args___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_enableCropOverlay");

  }
}

void __90__PUUIImageViewController_handleMediaSelectionUsingTile_managedAsset_args_includeEditing___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_enableCropOverlay");

  }
}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setVideoAssetURL:", a2);
  }
  else
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to load video with error: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_169(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_videoAssetURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_videoAssetURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, *MEMORY[0x1E0DC58E0]);

  }
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0DC4C88]);
  objc_msgSend(*(id *)(a1 + 32), "handleMediaSelectionUsingTile:managedAsset:args:includeEditing:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D714E0]), *(_QWORD *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D714E8]), v5, 0);
  objc_msgSend(*(id *)(a1 + 32), "_enableCropOverlayIfNecessary");

}

uint64_t __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
}

void __61__PUUIImageViewController__fetchAnimatedImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, 0);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

uint64_t __57__PUUIImageViewController__fetchLivePhotoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __53__PUUIImageViewController__fetchVideoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, 0);
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

void __60__PUUIImageViewController__fetchPreviewImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = *MEMORY[0x1E0CD1BE8];
    v6 = a2;
    objc_msgSend(a3, "objectForKeyedSubscript:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v7);

  }
}

void __41__PUUIImageViewController__loadLivePhoto__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PUUIImageViewController__loadLivePhoto__block_invoke_2;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __41__PUUIImageViewController__loadLivePhoto__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleLivePhotoRequestResult:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _handleAutoloopPreviewImageResult:](WeakRetained, "_handleAutoloopPreviewImageResult:", v5);
  }
  else
  {
    PLUIGetLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AAB61000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load preview image for autoloop with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_2;
    v8[3] = &unk_1E58AB210;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Failed to load autoloop video with error: %@", buf, 0xCu);
    }

  }
}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAutoloopVideoResult:", *(_QWORD *)(a1 + 32));

}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *WeakRetained;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _handleAnimatedImagePreviewResult:](WeakRetained, "_handleAnimatedImagePreviewResult:", v5);
  }
  else
  {
    PLUIGetLog();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AAB61000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load preview image for animated image with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke_2;
    v8[3] = &unk_1E58AB210;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Failed to load animated image with error: %@", buf, 0xCu);
    }

  }
}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAnimatedImageResult:", *(_QWORD *)(a1 + 32));

}

@end
