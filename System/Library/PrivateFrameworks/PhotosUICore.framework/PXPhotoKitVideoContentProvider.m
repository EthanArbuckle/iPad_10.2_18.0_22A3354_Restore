@implementation PXPhotoKitVideoContentProvider

- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXPhotoKitVideoContentProvider *v18;

  v7 = a7;
  v12 = (objc_class *)MEMORY[0x1E0D78238];
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(v12);
  v18 = -[PXPhotoKitVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](self, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:", v16, v15, v14, v13, v7, v17);

  return v18;
}

- (PXPhotoKitVideoContentProvider)initWithAsset:(id)a3 mediaProvider:(id)a4 deliveryStrategies:(id)a5 audioSession:(id)a6 requestURLOnly:(BOOL)a7 resourceReclamationController:(id)a8
{
  _BOOL8 v9;
  id v14;
  PXPhotoKitVideoContentProvider *v15;
  void *v16;
  objc_super v18;

  v9 = a7;
  v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXPhotoKitVideoContentProvider;
  v15 = -[PXDisplayAssetVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](&v18, sel_initWithAsset_mediaProvider_deliveryStrategies_audioSession_requestURLOnly_resourceReclamationController_, v14, a4, a5, a6, v9, a8);
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "px_registerChangeObserver:", v15);

    }
  }

  return v15;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXDisplayAssetVideoContentProvider asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[PXDisplayAssetVideoContentProvider asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeDetailsForObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "objectAfterChanges");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDisplayAssetVideoContentProvider setAsset:](self, "setAsset:", v8);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
