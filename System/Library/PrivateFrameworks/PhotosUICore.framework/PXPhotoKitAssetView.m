@implementation PXPhotoKitAssetView

- (void)setAsset:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPhotoKitAssetView;
  v4 = a3;
  -[PXDisplayAssetView setAsset:](&v6, sel_setAsset_, v4);
  objc_msgSend(v4, "photoLibrary", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetView setPhotoLibrary:](self, "setPhotoLibrary:", v5);
}

- (void)setPhotoLibrary:(id)a3
{
  PHPhotoLibrary **p_photoLibrary;
  PHPhotoLibrary *v6;
  PHPhotoLibrary *v7;
  char v8;
  PXPhotoKitUIMediaProvider *v9;
  void *v10;
  PHPhotoLibrary *v11;

  v11 = (PHPhotoLibrary *)a3;
  p_photoLibrary = &self->_photoLibrary;
  v6 = self->_photoLibrary;
  v7 = v11;
  if (v6 == v11)
    goto LABEL_5;
  v8 = -[PHPhotoLibrary isEqual:](v11, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_photoLibrary, a3);
    if (*p_photoLibrary)
    {
      v7 = (PHPhotoLibrary *)objc_alloc_init(MEMORY[0x1E0CD15A0]);
      v9 = -[PXPhotoKitUIMediaProvider initWithImageManager:library:]([PXPhotoKitUIMediaProvider alloc], "initWithImageManager:library:", v7, *p_photoLibrary);
      +[PXSimulatedUIMediaProvider defaultMediaProviderWithMediaProvider:](PXSimulatedUIMediaProvider, "defaultMediaProviderWithMediaProvider:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXDisplayAssetView setMediaProvider:](self, "setMediaProvider:", v10);
LABEL_5:

    }
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end
