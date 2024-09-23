@implementation PPKPhotosMediaView

- (PPKPhotosMediaView)initWithFrame:(CGRect)a3
{
  PPKPhotosMediaView *v3;
  PPKPhotosMediaView *v4;
  void *v5;
  objc_class *v6;
  PXDisplayAssetView *v7;
  PXDisplayAssetView *assetView;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)PPKPhotosMediaView;
  v3 = -[PPKPhotosMediaView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isImageAnalysisEnabled = 1;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getPXDisplayAssetViewClass_softClass;
    v15 = getPXDisplayAssetViewClass_softClass;
    if (!getPXDisplayAssetViewClass_softClass)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getPXDisplayAssetViewClass_block_invoke;
      v11[3] = &unk_1EA839030;
      v11[4] = &v12;
      __getPXDisplayAssetViewClass_block_invoke((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = (PXDisplayAssetView *)objc_alloc_init(v6);
    assetView = v4->_assetView;
    v4->_assetView = v7;

    -[PPKPhotosMediaView setIsHDRAllowed:animated:](v4, "setIsHDRAllowed:animated:", 0, 0);
    -[PPKPhotosMediaView addSubview:](v4, "addSubview:", v4->_assetView);
  }
  return v4;
}

- (PPKPhotosMediaView)initWithImageData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PPKPhotosMediaView *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3870];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  v7 = -[PPKPhotosMediaView initWithImage:](self, "initWithImage:", v6);
  return v7;
}

- (PPKPhotosMediaView)initWithImageURL:(id)a3
{
  id v4;
  PPKPhotosMediaView *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[PPKPhotosMediaView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_alloc_init((Class)getPXFileBackedUIMediaProviderClass());
    -[PPKPhotosMediaView assetView](v5, "assetView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMediaProvider:", v6);

    v8 = (void *)objc_msgSend(objc_alloc((Class)getPXFileBackedAssetClass()), "initWithURL:", v4);
    -[PPKPhotosMediaView assetView](v5, "assetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAsset:", v8);

  }
  return v5;
}

- (PPKPhotosMediaView)initWithImage:(CGImage *)a3 orientation:(int64_t)a4
{
  void *v5;
  PPKPhotosMediaView *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:imageOrientation:", a3, a4);
  v6 = -[PPKPhotosMediaView initWithImage:](self, "initWithImage:", v5);

  return v6;
}

- (PPKPhotosMediaView)initWithImage:(id)a3
{
  id v4;
  PPKPhotosMediaView *v5;
  _ImageAssetMediaProvider *v6;
  void *v7;
  _ImageAsset *v8;
  void *v9;

  v4 = a3;
  v5 = -[PPKPhotosMediaView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
  {
    v6 = objc_alloc_init(_ImageAssetMediaProvider);
    -[PPKPhotosMediaView assetView](v5, "assetView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMediaProvider:", v6);

    v8 = -[_ImageAsset initWithImage:]([_ImageAsset alloc], "initWithImage:", v4);
    -[PPKPhotosMediaView assetView](v5, "assetView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAsset:", v8);

  }
  return v5;
}

- (void)setImage:(id)a3
{
  id v4;
  _ImageAssetMediaProvider *v5;
  void *v6;
  void *v7;
  _ImageAsset *v8;

  v4 = a3;
  v5 = objc_alloc_init(_ImageAssetMediaProvider);
  -[PPKPhotosMediaView assetView](self, "assetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaProvider:", v5);

  v8 = -[_ImageAsset initWithImage:]([_ImageAsset alloc], "initWithImage:", v4);
  -[PPKPhotosMediaView assetView](self, "assetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsset:", v8);

}

- (void)setURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)getPXFileBackedUIMediaProviderClass());
  -[PPKPhotosMediaView assetView](self, "assetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaProvider:", v5);

  v8 = (id)objc_msgSend(objc_alloc((Class)getPXFileBackedAssetClass()), "initWithURL:", v4);
  -[PPKPhotosMediaView assetView](self, "assetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAsset:", v8);

}

- (void)setImage:(CGImage *)a3 orientation:(int64_t)a4
{
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:imageOrientation:", a3, a4);
  -[PPKPhotosMediaView setImage:](self, "setImage:", v5);

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
  id v11;

  -[PPKPhotosMediaView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PPKPhotosMediaView assetView](self, "assetView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (PPKPhotosMediaViewImageAnalysisInteractionContext)imageAnalysisContext
{
  -[PPKPhotosMediaView _ensureImageAnalysisControllerIfNecessary](self, "_ensureImageAnalysisControllerIfNecessary");
  return (PPKPhotosMediaViewImageAnalysisInteractionContext *)-[PPKPhotosMediaView analysisController](self, "analysisController");
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPKPhotosMediaView;
  -[PPKPhotosMediaView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[PPKPhotosMediaView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PPKPhotosMediaView _ensureImageAnalysisControllerIfNecessary](self, "_ensureImageAnalysisControllerIfNecessary");
}

- (void)_ensureImageAnalysisControllerIfNecessary
{
  void *analysisController;
  _PhotosMediaViewAnalysisController *v4;

  -[PPKPhotosMediaView analysisController](self, "analysisController");
  analysisController = (void *)objc_claimAutoreleasedReturnValue();
  if (!analysisController)
  {
    if (!-[PPKPhotosMediaView isImageAnalysisEnabled](self, "isImageAnalysisEnabled"))
      return;
    v4 = -[_PhotosMediaViewAnalysisController initWithAssetView:]([_PhotosMediaViewAnalysisController alloc], "initWithAssetView:", self->_assetView);
    analysisController = self->_analysisController;
    self->_analysisController = v4;
  }

}

- (void)setIsImageAnalysisEnabled:(BOOL)a3
{
  _PhotosMediaViewAnalysisController *analysisController;

  self->_isImageAnalysisEnabled = a3;
  if (a3)
  {
    -[PPKPhotosMediaView _ensureImageAnalysisControllerIfNecessary](self, "_ensureImageAnalysisControllerIfNecessary");
  }
  else
  {
    analysisController = self->_analysisController;
    self->_analysisController = 0;

  }
}

- (BOOL)isHDRAllowed
{
  void *v2;
  BOOL v3;

  -[PPKPhotosMediaView assetView](self, "assetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredImageDynamicRange") == 2;

  return v3;
}

- (void)setIsHDRAllowed:(BOOL)a3
{
  -[PPKPhotosMediaView setIsHDRAllowed:animated:](self, "setIsHDRAllowed:animated:", a3, 1);
}

- (void)setIsHDRAllowed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  _QWORD aBlock[6];

  v4 = a4;
  if ((_os_feature_enabled_impl() & a3) != 0)
    v6 = 2;
  else
    v6 = 0;
  -[PPKPhotosMediaView assetView](self, "assetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "preferredImageDynamicRange");

  if (v8 != v6)
  {
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke;
    aBlock[3] = &unk_1EA839328;
    aBlock[4] = self;
    aBlock[5] = v6;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    v11 = v10;
    if (v4)
    {
      v12 = (void *)MEMORY[0x1E0DC3F10];
      v13[0] = v9;
      v13[1] = 3221225472;
      v13[2] = __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke_2;
      v13[3] = &unk_1EA839350;
      v14 = v10;
      objc_msgSend(v12, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 0, v13, 0, 2.0, 0.0, 0.0, 0.0);

    }
    else
    {
      v10[2](v10);
    }

  }
}

void __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredImageDynamicRange:", v1);

}

uint64_t __47__PPKPhotosMediaView_setIsHDRAllowed_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isImageAnalysisEnabled
{
  return self->_isImageAnalysisEnabled;
}

- (PXDisplayAssetView)assetView
{
  return self->_assetView;
}

- (_PhotosMediaViewAnalysisController)analysisController
{
  return self->_analysisController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisController, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

@end
