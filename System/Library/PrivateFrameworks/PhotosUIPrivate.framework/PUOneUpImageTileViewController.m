@implementation PUOneUpImageTileViewController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpImageTileViewController;
  -[PUTileViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUOneUpImageTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
  -[PUImageTileViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)applyLayoutInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpImageTileViewController;
  -[PUImageTileViewController applyLayoutInfo:](&v4, sel_applyLayoutInfo_, a3);
  -[PUOneUpImageTileViewController _updateAssetViewModelContentsRect](self, "_updateAssetViewModelContentsRect");
}

- (void)assetViewModelDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUOneUpImageTileViewController;
  v4 = a3;
  -[PUImageTileViewController assetViewModelDidChange:](&v6, sel_assetViewModelDidChange_, v4);
  -[PUImageTileViewController imageView](self, "imageView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterView:forImageAnalysisInteractionHostMode:", v5, 2);

  -[PUOneUpImageTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
}

- (void)displayedImageRequestResultDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpImageTileViewController;
  -[PUImageTileViewController displayedImageRequestResultDidChange](&v3, sel_displayedImageRequestResultDidChange);
  -[PUOneUpImageTileViewController _updateAssetViewModelBestImage](self, "_updateAssetViewModelBestImage");
}

- (void)didChangeIsOnPrimaryDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpImageTileViewController;
  -[PUTileViewController didChangeIsOnPrimaryDisplay](&v3, sel_didChangeIsOnPrimaryDisplay);
  -[PUOneUpImageTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
}

- (void)_updateAssetViewModelContentsRect
{
  void *v3;
  _QWORD v4[5];

  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__PUOneUpImageTileViewController__updateAssetViewModelContentsRect__block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateInteractionHostViewRegistration
{
  void *v3;
  id v4;

  if (-[PUTileViewController isOnPrimaryDisplay](self, "isOnPrimaryDisplay"))
  {
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUImageTileViewController imageView](self, "imageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerView:forImageAnalysisInteractionHostMode:", v3, 2);

  }
}

- (void)_updateAssetViewModelBestImage
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  -[PUImageTileViewController displayedImageRequestResult](self, "displayedImageRequestResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PUOneUpImageTileViewController__updateAssetViewModelBestImage__block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v8 = v3;
  v9 = v4;
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "performChanges:", v7);

}

- (id)presentationProgressBlock
{
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PUOneUpImageTileViewController_presentationProgressBlock__block_invoke;
  v5[3] = &unk_1E58A4298;
  objc_copyWeak(&v6, &location);
  v2 = _Block_copy(v5);
  v3 = _Block_copy(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)dismissalProgressBlock
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  -[PUImageTileViewController imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsExtendedDynamicRangeContent");

  if (v5)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PUOneUpImageTileViewController_dismissalProgressBlock__block_invoke;
    v9[3] = &unk_1E58A4298;
    objc_copyWeak(&v10, &location);
    v6 = _Block_copy(v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = 0;
  }
  v7 = _Block_copy(v6);

  return v7;
}

void __56__PUOneUpImageTileViewController_dismissalProgressBlock__block_invoke(uint64_t a1, double a2)
{
  double v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = 1.0 - a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsEDRStrength:", v2);

}

void __59__PUOneUpImageTileViewController_presentationProgressBlock__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsEDRStrength:", a2);

}

void __64__PUOneUpImageTileViewController__updateAssetViewModelBestImage__block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "imageIsFullQuality"))
  {
    objc_msgSend(*(id *)(a1 + 32), "image");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setBestImage:", v2);

  }
}

void __67__PUOneUpImageTileViewController__updateAssetViewModelContentsRect__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "assetViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMainImageContentsRect:", v4, v6, v8, v10);

}

@end
