@implementation PUPhotosSharingStackViewController

- (PUPhotosSharingStackViewController)initWithAssetFetchResult:(id)a3
{
  id v5;
  PUPhotosSharingStackViewController *v6;
  PUPhotosSharingStackViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotosSharingStackViewController;
  v6 = -[PUPhotosSharingStackViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetFetchResult, a3);

  return v7;
}

- (PUPhotosSharingStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosSharingStackViewController.m"), 36, CFSTR("%s is not available as initializer"), "-[PUPhotosSharingStackViewController initWithNibName:bundle:]");

  abort();
}

- (PUPhotosSharingStackViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotosSharingStackViewController.m"), 40, CFSTR("%s is not available as initializer"), "-[PUPhotosSharingStackViewController initWithCoder:]");

  abort();
}

- (PHAsset)currentAsset
{
  void *v3;
  void *v4;

  -[PUPhotosSharingStackViewController assetFetchResult](self, "assetFetchResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", -[PXMessagesStackView currentIndex](self->_cardsView, "currentIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHAsset *)v4;
}

- (void)viewDidLoad
{
  id v3;
  PXMessagesStackView *v4;
  PXMessagesStackView *cardsView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotosSharingStackViewController;
  -[PUPhotosSharingStackViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0D7B5B8]);
  v4 = (PXMessagesStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  cardsView = self->_cardsView;
  self->_cardsView = v4;

  -[PXMessagesStackView setAllowPlayableContentLoading:](self->_cardsView, "setAllowPlayableContentLoading:", 1);
  -[PXMessagesStackView setDelegate:](self->_cardsView, "setDelegate:", self);
  -[PXMessagesStackView setHorizontalAlignment:](self->_cardsView, "setHorizontalAlignment:", 0);
  -[PXMessagesStackView setUseAspectTiles:](self->_cardsView, "setUseAspectTiles:", 1);
  v6 = (void *)MEMORY[0x1E0D7B768];
  -[PUPhotosSharingStackViewController assetFetchResult](self, "assetFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaProviderWithLibrary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXMessagesStackView setMediaProvider:](self->_cardsView, "setMediaProvider:", v10);
  v11 = (void *)MEMORY[0x1E0D7B6F8];
  -[PUPhotosSharingStackViewController assetFetchResult](self, "assetFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataSourceManagerWithAssets:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXMessagesStackView setDataSourceManager:](self->_cardsView, "setDataSourceManager:", v13);
  -[PUPhotosSharingStackViewController setView:](self, "setView:", self->_cardsView);

}

- (PHFetchResult)assetFetchResult
{
  return self->_assetFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetFetchResult, 0);
  objc_storeStrong((id *)&self->_cardsView, 0);
}

@end
