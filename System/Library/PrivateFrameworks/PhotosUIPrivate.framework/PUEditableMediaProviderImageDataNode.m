@implementation PUEditableMediaProviderImageDataNode

- (PUEditableMediaProviderImageDataNode)initWithAsset:(id)a3 mediaProvider:(id)a4 version:(int64_t)a5
{
  id v9;
  id v10;
  PUEditableMediaProviderImageDataNode *v11;
  PUEditableMediaProviderImageDataNode *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUEditableMediaProviderImageDataNode;
  v11 = -[PXRunNode initWithDependencies:](&v14, sel_initWithDependencies_, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v12->_version = a5;
  }

  return v12;
}

- (void)didCancel
{
  id v3;

  -[PUEditableMediaProviderImageDataNode mediaProvider](self, "mediaProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", self->_requestID);

}

- (void)run
{
  NSData *imageData;
  NSURL *imageDataURL;
  NSString *imageDataUTI;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  imageData = self->_imageData;
  self->_imageData = 0;

  imageDataURL = self->_imageDataURL;
  self->_imageDataURL = 0;

  imageDataUTI = self->_imageDataUTI;
  self->_imageDataUTI = 0;

  self->_imageExifOrientation = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v6, "setDeliveryMode:", 1);
  objc_msgSend(v6, "setLoadingMode:", 0x10000);
  objc_msgSend(v6, "setVersion:", -[PUEditableMediaProviderImageDataNode version](self, "version"));
  -[PUEditableMediaProviderImageDataNode asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditableMediaProviderImageDataNode mediaProvider](self, "mediaProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__PUEditableMediaProviderImageDataNode_run__block_invoke;
  v9[3] = &unk_1E589E6C0;
  objc_copyWeak(&v10, &location);
  self->_requestID = objc_msgSend(v8, "requestImageDataForAsset:options:resultHandler:", v7, v6, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_handleLoadedImageData:(id)a3 imageUTI:(id)a4 imageOrientation:(int64_t)a5 info:(id)a6
{
  NSData *v9;
  NSString *v10;
  uint64_t v11;
  id v12;
  NSURL *v13;
  void *v14;
  NSObject *v15;
  NSData *imageData;
  NSData *v17;
  NSURL *imageDataURL;
  NSURL *v19;
  NSString *imageDataUTI;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = (NSData *)a3;
  v10 = (NSString *)a4;
  v11 = *MEMORY[0x1E0CD1C18];
  v12 = a6;
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    PLPhotoEditGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Error fetching the image URL: %@", (uint8_t *)&v21, 0xCu);
    }

  }
  imageData = self->_imageData;
  self->_imageData = v9;
  v17 = v9;

  imageDataURL = self->_imageDataURL;
  self->_imageDataURL = v13;
  v19 = v13;

  imageDataUTI = self->_imageDataUTI;
  self->_imageDataUTI = v10;

  self->_imageExifOrientation = (int)PLExifOrientationFromImageOrientation();
  -[PXRunNode completeWithError:](self, "completeWithError:", v14);

}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSURL)imageDataURL
{
  return self->_imageDataURL;
}

- (NSString)imageDataUTI
{
  return self->_imageDataUTI;
}

- (int64_t)imageExifOrientation
{
  return self->_imageExifOrientation;
}

- (BOOL)useEmbeddedPreview
{
  return self->_useEmbeddedPreview;
}

- (int64_t)version
{
  return self->_version;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_imageDataUTI, 0);
  objc_storeStrong((id *)&self->_imageDataURL, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

void __43__PUEditableMediaProviderImageDataNode_run__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleLoadedImageData:imageUTI:imageOrientation:info:", v11, v10, a4, v9);

}

@end
