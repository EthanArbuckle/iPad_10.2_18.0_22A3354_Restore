@implementation PUPhotoEditSnapshot

- (PUPhotoEditSnapshot)init
{
  PUPhotoEditSnapshot *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditSnapshot;
  result = -[PUPhotoEditSnapshot init](&v3, sel_init);
  if (result)
    result->_workImageVersion = 1;
  return result;
}

- (void)_setImageData:(id)a3
{
  NSData *v4;
  NSData *imageData;

  v4 = -[PUPhotoEditSnapshot _copyData:](self, "_copyData:", a3);
  imageData = self->_imageData;
  self->_imageData = v4;

}

- (void)_setImageUTI:(id)a3
{
  objc_storeStrong((id *)&self->_imageUTI, a3);
}

- (void)_setBaseImageData:(id)a3
{
  NSData *v4;
  NSData *baseImageData;

  v4 = -[PUPhotoEditSnapshot _copyData:](self, "_copyData:", a3);
  baseImageData = self->_baseImageData;
  self->_baseImageData = v4;

}

- (void)_setVideoComplement:(id)a3
{
  AVURLAsset *v4;
  AVURLAsset *videoComplement;

  v4 = -[PUPhotoEditSnapshot _copyAsset:](self, "_copyAsset:", a3);
  videoComplement = self->_videoComplement;
  self->_videoComplement = v4;

}

- (void)_setBaseVideoComplement:(id)a3
{
  AVURLAsset *v4;
  AVURLAsset *baseVideoComplement;

  v4 = -[PUPhotoEditSnapshot _copyAsset:](self, "_copyAsset:", a3);
  baseVideoComplement = self->_baseVideoComplement;
  self->_baseVideoComplement = v4;

}

- (id)_copyAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PUPhotoEditSnapshot _copyDataAtURL:](self, "_copyDataAtURL:", v4);
  objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_copyData:(id)a3
{
  id v4;

  if (!a3)
    return 0;
  v4 = 0;
  -[PUPhotoEditSnapshot _copySourceData:destinationData:destinationURL:](self, "_copySourceData:destinationData:destinationURL:", a3, &v4, 0);
  return v4;
}

- (id)_copyDataAtURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataWithContentsOfFile:options:error:", v5, 8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  -[PUPhotoEditSnapshot _copySourceData:destinationData:destinationURL:](self, "_copySourceData:destinationData:destinationURL:", v6, 0, &v9);
  v7 = v9;

  return v7;
}

- (void)_copySourceData:(id)a3 destinationData:(id *)a4 destinationURL:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v9 = a3;
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "writeToFile:options:error:", v13, 1073741825, 0);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v13, 8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_retainAutorelease(v13);
  unlink((const char *)objc_msgSend(v16, "fileSystemRepresentation"));
  if (v14)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoEditSnapshot.m"), 133, CFSTR("couldn't copy snapshot data"));

  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v14);
LABEL_4:
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void)_setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)_setAdjustmentData:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentData, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSData)baseImageData
{
  return self->_baseImageData;
}

- (AVURLAsset)videoComplement
{
  return self->_videoComplement;
}

- (AVURLAsset)baseVideoComplement
{
  return self->_baseVideoComplement;
}

- (NSString)imageUTI
{
  return self->_imageUTI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUTI, 0);
  objc_storeStrong((id *)&self->_baseVideoComplement, 0);
  objc_storeStrong((id *)&self->_videoComplement, 0);
  objc_storeStrong((id *)&self->_baseImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

+ (void)captureSnapshotForAsset:(id)a3 mediaProvider:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  PUEditableMediaProviderAdjustmentDataNode *v9;
  PUPhotoEditBaseMediaNode *v10;
  PUEditableMediaProviderImageDataNode *v11;
  PUEditableMediaProviderVideoAssetNode *v12;
  PUPhotoEditSnapshotFinishingNode *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  v9 = -[PUEditableMediaProviderAdjustmentDataNode initWithAsset:mediaProvider:]([PUEditableMediaProviderAdjustmentDataNode alloc], "initWithAsset:mediaProvider:", v14, v7);
  v10 = -[PUPhotoEditBaseMediaNode initWithAdjustmentNode:]([PUPhotoEditBaseMediaNode alloc], "initWithAdjustmentNode:", v9);
  v11 = -[PUEditableMediaProviderImageDataNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderImageDataNode alloc], "initWithAsset:mediaProvider:version:", v14, v7, 0);
  v12 = 0;
  if (objc_msgSend(v14, "isLivePhoto"))
    v12 = -[PUEditableMediaProviderVideoAssetNode initWithAsset:mediaProvider:version:]([PUEditableMediaProviderVideoAssetNode alloc], "initWithAsset:mediaProvider:version:", v14, v7, 0);
  v13 = -[PUPhotoEditSnapshotFinishingNode initWithAdjustmentNode:baseMediaNode:currentImageNode:currentVideoNode:completionHandler:]([PUPhotoEditSnapshotFinishingNode alloc], "initWithAdjustmentNode:baseMediaNode:currentImageNode:currentVideoNode:completionHandler:", v9, v10, v11, v12, v8);

  objc_msgSend(MEMORY[0x1E0D7B8C0], "processGraphForRunNode:", v13);
}

@end
