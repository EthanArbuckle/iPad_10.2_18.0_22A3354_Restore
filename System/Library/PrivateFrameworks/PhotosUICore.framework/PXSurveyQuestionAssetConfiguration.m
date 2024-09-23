@implementation PXSurveyQuestionAssetConfiguration

- (PXSurveyQuestionAssetConfiguration)initWithTitle:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionAssetConfiguration *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionAssetConfiguration;
  v8 = -[PXSurveyQuestionAssetConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    v8->_isStale = 0;
  }

  return v8;
}

- (PXSurveyQuestionAssetConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionAssetConfiguration.m"), 36, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionAssetConfiguration init]");

  abort();
}

- (void)dealloc
{
  PXDisplayAssetContentView *v3;
  PXDisplayAssetContentView *v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  PXDisplayAssetContentView *v10;

  v3 = self->_assetView;
  v4 = v3;
  if (v3)
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __45__PXSurveyQuestionAssetConfiguration_dealloc__block_invoke;
    v9 = &unk_1E5149198;
    v10 = v3;
    px_dispatch_on_main_queue();

  }
  v5.receiver = self;
  v5.super_class = (Class)PXSurveyQuestionAssetConfiguration;
  -[PXSurveyQuestionAssetConfiguration dealloc](&v5, sel_dealloc);
}

- (UIView)contentView
{
  PXDisplayAssetContentView *assetView;
  void *v4;
  PXDisplayAssetContentView *v5;
  PXDisplayAssetContentView *v6;
  void *v7;

  assetView = self->_assetView;
  if (!assetView)
  {
    -[PXSurveyQuestionAssetConfiguration asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXDisplayAssetContentView checkOutViewForAsset:withPlaybackStyle:](PXDisplayAssetContentView, "checkOutViewForAsset:withPlaybackStyle:", v4, 1);
    v5 = (PXDisplayAssetContentView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_assetView;
    self->_assetView = v5;

    +[PXSurveyQuestionAssetConfiguration configureViewForAsset:](PXSurveyQuestionAssetConfiguration, "configureViewForAsset:", self->_assetView);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDidSelectAssetView);
    -[PXDisplayAssetContentView addGestureRecognizer:](self->_assetView, "addGestureRecognizer:", v7);

    assetView = self->_assetView;
  }
  return (UIView *)assetView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  -[PXDisplayAssetContentView setFrame:](self->_assetView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIImage)contentImageForOneUp
{
  return -[PXDisplayAssetContentView currentImage](self->_assetView, "currentImage");
}

- (CGRect)contentRectForOneUp
{
  PXDisplayAssetContentView *assetView;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  assetView = self->_assetView;
  if (assetView)
  {
    -[PXDisplayAssetContentView currentContentsRect](assetView, "currentContentsRect");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_handleDidSelectAssetView
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  -[PXSurveyQuestionAssetConfiguration handlers](self, "handlers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didSelectAssetHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXSurveyQuestionAssetConfiguration handlers](self, "handlers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didSelectAssetHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXDisplayAsset *))v5)[2](v5, self->_asset);

  }
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "changeDetailsForObject:", self->_asset);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectWasDeleted");

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (CGRect)assetContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_assetContentsRect.origin.x;
  y = self->_assetContentsRect.origin.y;
  width = self->_assetContentsRect.size.width;
  height = self->_assetContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetView, 0);
}

uint64_t __45__PXSurveyQuestionAssetConfiguration_dealloc__block_invoke(uint64_t a1)
{
  return +[PXDisplayAssetContentView checkInView:](PXDisplayAssetContentView, "checkInView:", *(_QWORD *)(a1 + 32));
}

+ (void)configureViewForAsset:(id)a3
{
  void *v3;
  void *v4;
  PXPhotoKitUIMediaProvider *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v6 = a3;
  objc_msgSend(v3, "quaternarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  objc_msgSend(v6, "setCanDisplayLoadingIndicator:", 1);
  objc_msgSend(v6, "setHidden:", 0);
  v5 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  objc_msgSend(v6, "setMediaProvider:", v5);

  objc_msgSend(v6, "setPlaceholderTransitionDuration:", 0.2);
  objc_msgSend(v6, "setContentMode:", 2);

}

@end
