@implementation PXMediaProvider

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

void __42__PXMediaProvider_availableThumbnailSizes__block_invoke(uint64_t a1, uint64_t a2, double a3, double a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  LOWORD(a3) = *(_WORD *)(a2 + 16);
  v4 = (double)*(unint64_t *)&a3;
  LOWORD(a4) = *(_WORD *)(a2 + 18);
  v5 = (double)*(unint64_t *)&a4;
  v6 = round(v4 * 0.75);
  v7 = round(v5 * 0.75);
  if (!*(_BYTE *)(a2 + 20))
  {
    v5 = v7;
    v4 = v6;
  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", v4, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (NSArray)availableThumbnailSizes
{
  NSArray *v3;
  id v4;
  id v5;
  NSArray *availableThumbnailSizes;
  _QWORD v8[4];
  id v9;

  v3 = self->_availableThumbnailSizes;
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__PXMediaProvider_availableThumbnailSizes__block_invoke;
    v8[3] = &unk_2514D0A18;
    v9 = v4;
    v5 = v4;
    -[PXMediaProvider enumerateAvailableThumbnailDataFormats:](self, "enumerateAvailableThumbnailDataFormats:", v8);
    v3 = (NSArray *)(id)objc_msgSend(v5, "copy");
    availableThumbnailSizes = self->_availableThumbnailSizes;
    self->_availableThumbnailSizes = v3;

  }
  return v3;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 68, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:]", v16);

  abort();
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 73, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestImageDataForAsset:options:resultHandler:]", v14);

  abort();
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 78, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestImageURLForAsset:options:resultHandler:]", v14);

  abort();
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 83, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestPlayerItemForVideo:options:resultHandler:]", v14);

  abort();
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v11 = a3;
  v12 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 88, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:]", v16);

  abort();
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 93, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestAnimatedImageForAsset:options:resultHandler:]", v14);

  abort();
}

- (int64_t)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 98, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestURLForVideo:options:resultHandler:]", v14);

  abort();
}

- (int64_t)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 103, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider requestStreamForVideo:options:resultHandler:]", v14);

  abort();
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 108, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider thumbnailDataForAsset:targetSize:onlyFromCache:outDataSpec:]", v11);

  abort();
}

- (CGSize)masterThumbnailSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)cancelImageRequest:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaProvider.m"), 142, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXMediaProvider cancelImageRequest:]", v7);

  abort();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_availableThumbnailSizes, 0);
}

@end
