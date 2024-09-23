@implementation PXImportMediaProvider

- (PXImportMediaProvider)initWithImageFormat:(unsigned __int16)a3
{
  PXImportMediaProvider *v4;
  PXImportMediaProvider *v5;
  uint64_t v6;
  NSMutableDictionary *thumbnailRequestsByID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXImportMediaProvider;
  v4 = -[PXImportMediaProvider init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_thumbnailImageFormat = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    thumbnailRequestsByID = v5->_thumbnailRequestsByID;
    v5->_thumbnailRequestsByID = (NSMutableDictionary *)v6;

    atomic_store(1u, (unsigned int *)&v5->_nextRequestID);
    v5->_lastRequestsInflight = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  double width;
  id v13;
  id v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;

  height = a4.height;
  width = a4.width;
  v13 = a7;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __91__PXImportMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v17[3] = &unk_1E513BD08;
  v18 = v13;
  v14 = v13;
  v15 = -[PXImportMediaProvider requestCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestCGImageForAsset:targetSize:contentMode:options:resultHandler:", a3, a5, a6, v17, width, height);

  return v15;
}

- (int64_t)requestCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  int64_t v18;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  height = a4.height;
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = v12;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v22, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 95, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v22);
  }

LABEL_3:
  if (height <= 192.0)
    v16 = 0;
  else
    v16 = 3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v25[3] = &unk_1E511AE68;
  v26 = v14;
  v27 = &v28;
  v17 = v14;
  v18 = -[PXImportMediaProvider requestImageForImportItem:ofSize:completion:](self, "requestImageForImportItem:ofSize:completion:", v15, v16, v25);
  v29[3] = v18;
  _Block_object_dispose(&v28, 8);

  return v18;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  _QWORD block[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[PXImportMediaProvider nextRequestID](self, "nextRequestID");
  v11 = v8;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 113, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v29, v31);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 113, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v29);
  }

LABEL_3:
  objc_msgSend(v11, "importAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "orientation");

  v38 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "importAsset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "securityScopedURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v11, "uniformTypeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_dictionaryBySettingObject:forKey:", v19, *MEMORY[0x1E0CD1C20]);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v18);
    v16 = (void *)v20;
  }
  else
  {
    v21 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PXImportMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E513ABE0;
  v33 = v21;
  v34 = v11;
  v36 = v9;
  v37 = v14;
  v35 = v16;
  v22 = v16;
  v23 = v11;
  v24 = v21;
  v25 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return v10;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[PXImportMediaProvider nextRequestID](self, "nextRequestID");
  v11 = v8;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v23);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 130, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v23, v25);

    goto LABEL_6;
  }
LABEL_3:
  v30[0] = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  v30[1] = *MEMORY[0x1E0CD1C20];
  objc_msgSend(v11, "uniformTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "importAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "securityScopedURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PXImportMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5145688;
  v28 = v14;
  v29 = v9;
  v27 = v16;
  v17 = v14;
  v18 = v16;
  v19 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return v10;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = -[PXImportMediaProvider nextRequestID](self, "nextRequestID");
  v31 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 143, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("asset"), v24);
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImportMediaProvider.m"), 143, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("asset"), v24, v26);

    goto LABEL_10;
  }
LABEL_3:
  objc_msgSend(v13, "importAsset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "importAsset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "securityScopedURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isMovie") && v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithURL:", v16);
    v29 = v12;
    v30 = v9;
    v18 = v12;
    v19 = v9;
    v20 = v17;
    px_dispatch_on_main_queue();

  }
  else
  {
    v27 = v12;
    v28 = v9;
    v19 = v12;
    v20 = v9;
    px_dispatch_on_main_queue();

    v18 = v28;
  }

  return v10;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v7;
  id v8;
  _QWORD block[4];
  id v11;

  v7 = a7;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__PXImportMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  block[3] = &unk_1E5148A40;
  v11 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return 0;
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v5 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXImportMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  block[3] = &unk_1E5148A40;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return 0;
}

- (id)thumbnailDataForAsset:(id)a3 targetSize:(CGSize)a4 onlyFromCache:(BOOL)a5 outDataSpec:(PXMediaProviderThumbnailDataSpec *)a6
{
  return 0;
}

- (void)cancelImageRequest:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  uint64_t v22;
  int64_t imageRequestsInflight;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PXImportMediaProvider thumbnailRequestsByID](self, "thumbnailRequestsByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    _importMediaProviderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "importItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[PXImportMediaProvider cancelImageRequest:]";
      v28 = 2048;
      v29 = a3;
      v30 = 2112;
      v31 = v18;
      _os_log_debug_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%s: Cancel request %lu for %@", buf, 0x20u);

    }
    objc_msgSend(v7, "importItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "requestSize");
    objc_msgSend(v9, "removeThumbnailRequest:", v7);
    objc_msgSend(v7, "assetDataRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _importMediaProviderLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v7, "importItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "importAsset");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fileName");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v20;
      v28 = 2048;
      v29 = (int64_t)v11;
      _os_log_debug_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEBUG, "*THUMBNAIL* CANCELING: %@ <%p>", buf, 0x16u);

    }
    objc_msgSend(v9, "thumbnailRequestsForRequestSize:", objc_msgSend(v7, "requestSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count") && (objc_msgSend(v11, "isCanceled") & 1) == 0)
    {
      _importMediaProviderLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v7, "importItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "-[PXImportMediaProvider cancelImageRequest:]";
        v28 = 2048;
        v29 = a3;
        v30 = 2112;
        v31 = v24;
        _os_log_debug_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "%s: 0 thumbnail requests remaining after %lu was cancelled. Actually cancelling asset data request for %@", buf, 0x20u);

      }
      objc_msgSend(v9, "removeAssetDataRequestForRequestSize:", v10);
      objc_msgSend(v11, "cancel");
    }
    -[PXImportMediaProvider thumbnailRequestsByID](self, "thumbnailRequestsByID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

    _importMediaProviderLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[PXImportMediaProvider thumbnailRequestsByID](self, "thumbnailRequestsByID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      imageRequestsInflight = self->_imageRequestsInflight;
      *(_DWORD *)buf = 134218240;
      v27 = (const char *)v22;
      v28 = 2048;
      v29 = imageRequestsInflight;
      _os_log_debug_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEBUG, "Number of thumbnail requests remaining: %lu. Num in-flight with backend: %ld", buf, 0x16u);

    }
  }

}

- (PXImportImageCache)imageCache
{
  PXImportImageCache *imageCache;
  PXImportImageCache *v4;
  PXImportImageCache *v5;

  imageCache = self->_imageCache;
  if (!imageCache)
  {
    +[PXImportImageCache sharedInstance](PXImportImageCache, "sharedInstance");
    v4 = (PXImportImageCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageCache;
    self->_imageCache = v4;

    -[PXImportImageCache configureWithFormat:](self->_imageCache, "configureWithFormat:", -[PXImportMediaProvider thumbnailImageFormat](self, "thumbnailImageFormat"));
    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (int64_t)imageOfSize:(unint64_t)a3 forModel:(id)a4 localCacheOnly:(BOOL)a5 priority:(unsigned __int8)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  int64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  unint64_t v25;
  int64_t v26;
  BOOL v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v8 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a7;
  v13 = -[PXImportMediaProvider nextRequestID](self, "nextRequestID");
  _importMediaProviderLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    PXImportImageRequestSizeDebugDescription(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importAsset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v29 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]";
    v30 = 2112;
    v31 = v11;
    v32 = 2114;
    v33 = v19;
    v34 = 1024;
    v35 = v8;
    v36 = 2048;
    v37 = v13;
    v38 = 2112;
    v39 = v21;
    _os_log_debug_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "%s: %@ size = %{public}@ fastpath = %d (entry). Request ID = %lu for %@", buf, 0x3Au);

  }
  -[PXImportMediaProvider imageCache](self, "imageCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke;
  v22[3] = &unk_1E511AF58;
  v27 = v8;
  v22[4] = self;
  v23 = v11;
  v24 = v12;
  v25 = a3;
  v26 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "imageForModel:ofSize:allowLowerResolutions:completion:", v17, a3, 1, v22);

  return v13;
}

- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 completion:(id)a5
{
  return -[PXImportMediaProvider requestImageForImportItem:ofSize:priority:completion:](self, "requestImageForImportItem:ofSize:priority:completion:", a3, a4, 0, a5);
}

- (int64_t)requestImageForImportItem:(id)a3 ofSize:(unint64_t)a4 priority:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "isDeleted") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v10, "deleteSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13 != 0;

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke;
  v17[3] = &unk_1E511AF80;
  v18 = v11;
  v14 = v11;
  v15 = -[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:](self, "imageOfSize:forModel:localCacheOnly:priority:completion:", a4, v10, v12, v7, v17);

  return v15;
}

- (BOOL)thumbnailExistsForModel:(id)a3 atSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = a3;
  -[PXImportMediaProvider imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForModel:ofSize:allowLowerResolutions:foundSize:", v6, a4, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = v10 == a4;
  return a4;
}

- (BOOL)thumbnailExistsForModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  v4 = a3;
  -[PXImportMediaProvider imageCache](self, "imageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForModel:ofSize:allowLowerResolutions:foundSize:", v4, 3, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (id)cachedImageForModel:(id)a3 atSize:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v10 = 0;
  v6 = a3;
  -[PXImportMediaProvider imageCache](self, "imageCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForModel:ofSize:allowLowerResolutions:foundSize:", v6, a4, 0, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performIdleProcessingIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PXImportMediaProvider_performIdleProcessingIfNecessary__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (double)idleTimeOut
{
  _BOOL4 v2;
  double result;

  v2 = -[PXImportMediaProvider hasBeenIdle](self, "hasBeenIdle");
  result = 0.05;
  if (!v2)
    return 5.0;
  return result;
}

- (id)_newPlaceholderImageForItemWithExtension:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  __CFString *v9;
  int v10;
  id v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  CGFloat *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  double v38;
  void *v39;
  _QWORD v40[2];
  _QWORD v41[3];
  CGSize v42;
  CGRect v43;

  height = a4.height;
  width = a4.width;
  v41[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v17 = 0;
  }
  else
  {
    v9 = (__CFString *)v6;
    v10 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("RAW+JPG"));
    if (v10)
    {

      v9 = CFSTR("RAW");
    }
    PLGenericImageNameForExtension();
    v11 = 0;
    v12 = (__CFString *)0;
    v13 = v12;
    if (v10)
    {

      v13 = CFSTR("RAW+JPG");
    }
    PLPhotoLibraryServicesFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v11;
    if (height <= 160.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 10.0;
    }
    else
    {
      v15 = 0;
      v16 = 28.0;
    }
    v18 = (CGFloat *)MEMORY[0x1E0C9D648];
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0DC1138];
      v41[0] = v19;
      v21 = *MEMORY[0x1E0DC1140];
      v40[0] = v20;
      v40[1] = v21;
      objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString sizeWithAttributes:](v13, "sizeWithAttributes:", v23);
      v38 = v24;
      v26 = v25;
    }
    else
    {
      v19 = 0;
      v23 = 0;
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    }
    objc_msgSend(v15, "size");
    v28 = v27;
    v30 = v29;
    v31 = (height - (v26 + v29)) * 0.5;
    v42.width = width;
    v42.height = height;
    UIGraphicsBeginImageContextWithOptions(v42, 0, 0.0);
    v33 = *v18;
    v32 = v18[1];
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "set");

    v43.origin.x = v33;
    v43.origin.y = v32;
    v43.size.width = width;
    v43.size.height = height;
    UIRectFill(v43);
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFill");

      objc_msgSend(v15, "imageWithRenderingMode:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "drawInRect:", round((width - v28) * 0.5), v31, v28, v30);
    }
    if (v13)
      -[__CFString drawInRect:withAttributes:](v13, "drawInRect:withAttributes:", v23, round((width - v38) * 0.5), v30 + v31, v38, v26);
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v17;
}

- (id)_placeholderExtensionForItem:(id)a3
{
  id v3;
  __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isJpegPlusRAW") & 1) != 0)
  {
    v4 = CFSTR("RAW+JPG");
  }
  else if ((objc_msgSend(v3, "isRAW") & 1) != 0)
  {
    v4 = CFSTR("RAW");
  }
  else
  {
    objc_msgSend(v3, "fileExtension");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (CGSize)gridItemSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 160.0;
  v3 = 160.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_placeholderForItem:(id)a3 size:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *extensionPlaceholderCachesByRequestSize;
  void *v22;
  void *v23;
  void *v24;

  -[PXImportMediaProvider _placeholderExtensionForItem:](self, "_placeholderExtensionForItem:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImportMediaProvider extensionPlaceholderCachesByRequestSize](self, "extensionPlaceholderCachesByRequestSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a4 == 3)
  {
    v12 = 320.0;
    v13 = 320.0;
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    -[PXImportMediaProvider gridItemSize](self, "gridItemSize");
    v12 = v14;
    v13 = v15;
    if (!v11)
      goto LABEL_9;
  }
  objc_msgSend(v11, "size");
  if (v17 == v12 && v16 == v13)
  {
    v19 = v11;
    goto LABEL_16;
  }
LABEL_9:
  v19 = -[PXImportMediaProvider _newPlaceholderImageForItemWithExtension:size:](self, "_newPlaceholderImageForItemWithExtension:size:", v6, v12, v13);

  if (v19)
  {
    if (!self->_extensionPlaceholderCachesByRequestSize)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      extensionPlaceholderCachesByRequestSize = self->_extensionPlaceholderCachesByRequestSize;
      self->_extensionPlaceholderCachesByRequestSize = v20;

    }
    -[PXImportMediaProvider extensionPlaceholderCachesByRequestSize](self, "extensionPlaceholderCachesByRequestSize");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v23 = (void *)objc_opt_new();
      -[PXImportMediaProvider extensionPlaceholderCachesByRequestSize](self, "extensionPlaceholderCachesByRequestSize");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v7);

    }
    objc_msgSend(v23, "setObject:forKey:", v19, v6);
    v9 = v23;
  }
LABEL_16:

  return v19;
}

- (void)ppt_sendMediaProviderDidProcessAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PXImportMediaProvider_ppt_sendMediaProviderDidProcessAsset___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendMediaProviderThumbnailingBecameIdle
{
  void *v3;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lazyLoadAllAssets");

  if (v4)
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PXImportMediaProvider_sendMediaProviderThumbnailingBecameIdle__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (int64_t)nextRequestID
{
  int *p_nextRequestID;
  signed int v3;

  p_nextRequestID = &self->_nextRequestID;
  do
    v3 = __ldaxr((unsigned int *)p_nextRequestID);
  while (__stlxr(v3 + 1, (unsigned int *)p_nextRequestID));
  return v3;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->loadingStatusManager, a3);
}

- (unsigned)thumbnailImageFormat
{
  return self->_thumbnailImageFormat;
}

- (NSMutableDictionary)thumbnailRequestsByID
{
  return self->_thumbnailRequestsByID;
}

- (void)setThumbnailRequestsByID:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailRequestsByID, a3);
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (int64_t)imageRequestsInflight
{
  return self->_imageRequestsInflight;
}

- (void)setImageRequestsInflight:(int64_t)a3
{
  self->_imageRequestsInflight = a3;
}

- (int64_t)lastRequestsInflight
{
  return self->_lastRequestsInflight;
}

- (void)setLastRequestsInflight:(int64_t)a3
{
  self->_lastRequestsInflight = a3;
}

- (NSMutableDictionary)extensionPlaceholderCachesByRequestSize
{
  return self->_extensionPlaceholderCachesByRequestSize;
}

- (void)setExtensionPlaceholderCachesByRequestSize:(id)a3
{
  objc_storeStrong((id *)&self->_extensionPlaceholderCachesByRequestSize, a3);
}

- (BOOL)hasBeenIdle
{
  return self->_hasBeenIdle;
}

- (void)setHasBeenIdle:(BOOL)a3
{
  self->_hasBeenIdle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPlaceholderCachesByRequestSize, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_thumbnailRequestsByID, 0);
  objc_storeStrong((id *)&self->loadingStatusManager, 0);
}

void __64__PXImportMediaProvider_sendMediaProviderThumbnailingBecameIdle__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PXImportMediaProviderThumbnailingBecameIdleNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __62__PXImportMediaProvider_ppt_sendMediaProviderDidProcessAsset___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("PXImportMediaProviderDidProcessAssetNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __57__PXImportMediaProvider_performIdleProcessingIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[7];
  if (!v3 || v3 == v2[8])
  {
    objc_msgSend(v2, "setHasBeenIdle:", 1);
    v2 = *(_QWORD **)(a1 + 32);
  }
  result = objc_msgSend(v2, "sendMediaProviderThumbnailingBecameIdle");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  return result;
}

void __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  char v14;

  v7 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke_2;
  v10[3] = &unk_1E511AE90;
  v8 = *(id *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __78__PXImportMediaProvider_requestImageForImportItem_ofSize_priority_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2;
  v10[3] = &unk_1E511AF30;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v14 = *(_QWORD *)(a1 + 56);
  v15 = a3;
  v17 = *(_BYTE *)(a1 + 72);
  v12 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v13 = v7;
  v16 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  PXImportThumbnailLoadingRequest *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  _BOOL8 v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  uint64_t v46;
  id v47;
  id v48[3];
  id from;
  id location;
  _QWORD aBlock[4];
  id v52;
  id v53;
  uint64_t v54;
  BOOL v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_performIdleProcessingIfNecessary, 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "idleTimeOut");
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_performIdleProcessingIfNecessary, 0);
  v3 = *(void **)(a1 + 40);
  if (v3 && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a1 + 72) || *(_BYTE *)(a1 + 88))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "isDeleted") ^ 1;
    v3 = *(void **)(a1 + 40);
  }
  v5 = v3;
  objc_msgSend(*(id *)(a1 + 48), "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_placeholderForItem:size:", v6, *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _importMediaProviderLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v35 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      v57 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
      v58 = 2112;
      v59 = v35;
      v60 = 2112;
      v61 = (uint64_t)v7;
      _os_log_debug_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: using placeholder thumbnail....%@ (uiimge=%@)", buf, 0x20u);
    }

  }
  +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "loadActualThumbnails");

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v6, "loadMetadataAsync:", 0);
    v4 = 0;
  }
  v11 = MEMORY[0x1E0C809B0];
  v12 = v5 == 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_46;
  aBlock[3] = &unk_1E511AE90;
  v53 = *(id *)(a1 + 56);
  v13 = v7;
  v14 = *(_QWORD *)(a1 + 72);
  v52 = v13;
  v54 = v14;
  v55 = v12;
  v15 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v4)
  {
    v16 = -[PXImportThumbnailLoadingRequest initWithImportItem:requestID:requestSize:completionBlock:]([PXImportThumbnailLoadingRequest alloc], "initWithImportItem:requestID:requestSize:completionBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "assetDataRequestForRequestSize:", *(_QWORD *)(a1 + 64));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[PXImportThumbnailLoadingRequest setAssetDataRequest:](v16, "setAssetDataRequest:", v17);
      objc_msgSend(*(id *)(a1 + 48), "addThumbnailRequest:", v16);
      objc_msgSend(*(id *)(a1 + 48), "thumbnailRequestsForRequestSize:", *(_QWORD *)(a1 + 64));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _importMediaProviderLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v36 = *(_QWORD *)(a1 + 80);
        v43 = *(_QWORD *)(a1 + 48);
        v37 = objc_msgSend(v18, "count");
        v38 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 136316162;
        v57 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
        v58 = 2048;
        v59 = v36;
        v60 = 2112;
        v61 = v43;
        v62 = 2048;
        v63 = v37;
        v64 = 2048;
        v65 = v38;
        _os_log_debug_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEBUG, "%s: Reusing existing asset data request for request %lu for %@. Now at %lu thumbnail requests for size %lu.", buf, 0x34u);
      }

      v15[2](v15);
      goto LABEL_27;
    }
    objc_msgSend(*(id *)(a1 + 48), "addThumbnailRequest:", v16);
    v20 = *(_QWORD *)(a1 + 64) - 1;
    if (v20 > 2)
      v21 = 160;
    else
      v21 = qword_1A7C09D70[v20];
    v42 = v21;
    +[PXImportSettings sharedInstance](PXImportSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "loadRetinaThumbnails");

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "scale");
      v26 = v25;

      v42 = (uint64_t)(v26 * (double)v42);
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_initWeak(&from, *(id *)(a1 + 48));
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    _importMediaProviderLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v39 = *(_QWORD *)(a1 + 80);
      v40 = *(_QWORD *)(a1 + 48);
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 136316162;
      v57 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke";
      v58 = 2048;
      v59 = v39;
      v60 = 2048;
      v61 = v42;
      v62 = 2112;
      v63 = v40;
      v64 = 2048;
      v65 = v41;
      _os_log_debug_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Sending request (%lu) of size %lu for %@(inflight %lu)", buf, 0x34u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(a1 + 48), "setImageProcessingStartTime:");
    v28 = *(_QWORD *)(a1 + 64) == 3;
    v44[0] = v11;
    v44[1] = 3221225472;
    v44[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_51;
    v44[3] = &unk_1E511AF08;
    objc_copyWeak(&v47, &from);
    objc_copyWeak(v48, &location);
    v29 = *(void **)(a1 + 80);
    v48[1] = *(id *)(a1 + 64);
    v48[2] = v29;
    v30 = v6;
    v31 = *(_QWORD *)(a1 + 32);
    v45 = v30;
    v46 = v31;
    objc_msgSend(v30, "thumbnailForSize:priority:atEnd:", v42, v28, v44);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXImportThumbnailLoadingRequest setAssetDataRequest:](v16, "setAssetDataRequest:", v32);
    objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestsByID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 80));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v16, v34);

    objc_msgSend(*(id *)(a1 + 48), "setAssetDataRequest:forRequestSize:", v32, *(_QWORD *)(a1 + 64));
    objc_destroyWeak(v48);
    objc_destroyWeak(&v47);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  if (v15)
    v15[2](v15);
LABEL_27:

}

uint64_t __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_46(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 16))(result, v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  }
  return result;
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_51(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = objc_loadWeakRetained((id *)(a1 + 56));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_52;
  block[3] = &unk_1E511AEE0;
  block[4] = v11;
  v17 = WeakRetained;
  v23 = *(_OWORD *)(a1 + 64);
  v18 = v7;
  v19 = v8;
  v20 = *(id *)(a1 + 32);
  v21 = v9;
  v22 = *(_QWORD *)(a1 + 40);
  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_52(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void (**v34)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void *v51;
  char *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id obj;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  const __CFString *v80;
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  void *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    if (v2)
    {
      objc_msgSend(v2, "thumbnailRequestsForRequestSize:", *(_QWORD *)(a1 + 88));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v78 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v76;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v76 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
            objc_msgSend(v10, "assetDataRequest");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = *(void **)(a1 + 48);

            if (v11 == v12)
              objc_msgSend(v4, "addObject:", v10);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
        }
        while (v7);
      }

      v57 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = v4;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v72;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v72 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "requestID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "addObject:", v19);

            objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestsByID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "requestID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 != 0;

            v15 |= v23;
            objc_msgSend(*(id *)(a1 + 32), "thumbnailRequestsByID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v18, "requestID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", 0, v25);

            objc_msgSend(*(id *)(a1 + 40), "removeThumbnailRequest:", v18);
          }
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
        }
        while (v14);
      }
      else
      {
        v15 = 0;
      }

      objc_msgSend(*(id *)(a1 + 40), "removeAssetDataRequestForRequestSize:", *(_QWORD *)(a1 + 88));
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(*(id *)(a1 + 40), "setImageProcessingEndTime:");
      --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      _importMediaProviderLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v47 = *(void **)(a1 + 96);
        v48 = *(_QWORD *)(a1 + 40);
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
        *(_DWORD *)buf = 136316162;
        v83 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke_2";
        v84 = 2048;
        v85 = v47;
        v86 = 2112;
        v87 = v48;
        v88 = 2048;
        v89 = v49;
        v90 = 2112;
        v91 = v59;
        _os_log_debug_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Completed request %lu for %@(inflight %lu). Finished thumbnail request IDs: %@", buf, 0x34u);
      }

      if (*(_QWORD *)(a1 + 56))
      {
        _importMediaProviderLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 64), "fileName");
          v50 = (char *)objc_claimAutoreleasedReturnValue();
          v51 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138412546;
          v83 = v50;
          v84 = 2112;
          v85 = v51;
          _os_log_error_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "ImageRequest error for import asset (%@): %@", buf, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 40), "setThumbnailError:", *(_QWORD *)(a1 + 56));
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v28 = obj;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
        v30 = v57;
        if (v29)
        {
          v31 = v29;
          v32 = *(_QWORD *)v68;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v68 != v32)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * k), "completionBlock");
              v34 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v34[2](v34, 0, *(_QWORD *)(a1 + 88), 0);

            }
            v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
          }
          while (v31);
        }
      }
      else
      {
        if (*(_QWORD *)(a1 + 72))
        {
          if ((v15 & 1) == 0)
          {
            _importMediaProviderLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              v54 = *(void **)(a1 + 96);
              v55 = *(_QWORD *)(a1 + 40);
              v56 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
              *(_DWORD *)buf = 136315906;
              v83 = "-[PXImportMediaProvider imageOfSize:forModel:localCacheOnly:priority:completion:]_block_invoke";
              v84 = 2048;
              v85 = v54;
              v86 = 2112;
              v87 = v55;
              v88 = 2048;
              v89 = v56;
              _os_log_debug_impl(&dword_1A6789000, v35, OS_LOG_TYPE_DEBUG, "%s:ImageRequest: Received image for CANCELLED request %lu for %@(inflight %lu)", buf, 0x2Au);
            }

          }
          v36 = *(_QWORD *)(a1 + 88);
          if (v36)
          {
            v30 = v57;
            if (v36 == 3)
            {
              objc_msgSend(*(id *)(a1 + 72), "size");
              objc_msgSend(*(id *)(a1 + 40), "setLargeThumbnailSize:");
            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 72), "size");
            objc_msgSend(*(id *)(a1 + 40), "setThumbnailSize:");
            v30 = v57;
          }
          PXImportIdentifierGenerator(*(void **)(a1 + 40), *(_QWORD *)(a1 + 88));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "imageCache");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = *(_QWORD *)(a1 + 72);
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_55;
          v60[3] = &unk_1E511BC80;
          v61 = *(id *)(a1 + 40);
          v62 = v40;
          v63 = obj;
          v43 = *(id *)(a1 + 72);
          v44 = *(_QWORD *)(a1 + 88);
          v45 = *(_QWORD *)(a1 + 32);
          v64 = v43;
          v65 = v45;
          v66 = v44;
          v28 = v40;
          objc_msgSend(v41, "setImage:forIdentifier:completion:", v42, v28, v60);

          v39 = v61;
        }
        else
        {
          _importMediaProviderLog();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            PXImportImageRequestSizeDebugDescription(*(_QWORD *)(a1 + 88));
            v52 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "fileName");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v83 = v52;
            v84 = 2112;
            v85 = v53;
            _os_log_error_impl(&dword_1A6789000, v37, OS_LOG_TYPE_ERROR, "Both image and error were nil while fetching %{public}@-sized image for asset: %@", buf, 0x16u);

          }
          v30 = v57;
          if (*(_QWORD *)(a1 + 88))
            goto LABEL_50;
          v38 = (void *)MEMORY[0x1E0CB35C8];
          v79 = *MEMORY[0x1E0CB2D50];
          v80 = CFSTR("Null image response");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mobileslideshow.import"), 0, v28);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setThumbnailError:", v39);
        }

      }
LABEL_50:
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel_performIdleProcessingIfNecessary, 0);
      v46 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 80), "idleTimeOut");
      objc_msgSend(v46, "performSelector:withObject:afterDelay:", sel_performIdleProcessingIfNecessary, 0);

    }
  }
}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_55(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_56;
  v4[3] = &unk_1E511BC80;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v2 = *(id *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = v3;
  v8 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_2_56(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  _importMediaProviderLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v31 = v19;
    _os_log_debug_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEBUG, "ImageRequest messaging model with changes: %@", buf, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_57;
  v24[3] = &unk_1E511AEB8;
  v25 = v3;
  v26 = *(id *)(a1 + 40);
  objc_msgSend(v25, "performChanges:", v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v8), "completionBlock", (_QWORD)v20);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v9[2](v9, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), 0);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v6);
  }

  v10 = *(void **)(a1 + 64);
  v27[0] = CFSTR("duration");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "imageProcessingEndTime");
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "imageProcessingStartTime");
  objc_msgSend(v11, "numberWithDouble:", v13 - v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v15;
  v27[1] = CFSTR("filename");
  objc_msgSend(*(id *)(a1 + 32), "fileName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v16;
  v27[2] = CFSTR("isLastDisplayItem");
  if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + 56))
    v17 = MEMORY[0x1E0C9AAA0];
  else
    v17 = MEMORY[0x1E0C9AAB0];
  v28[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3, (_QWORD)v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ppt_sendMediaProviderDidProcessAsset:", v18);

}

void __81__PXImportMediaProvider_imageOfSize_forModel_localCacheOnly_priority_completion___block_invoke_57(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "importAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDuplicate:", objc_msgSend(v4, "isDuplicate"));

  objc_msgSend(v5, "addImageRepresentation:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__PXImportMediaProvider_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__PXImportMediaProvider_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__PXImportMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __73__PXImportMediaProvider_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __71__PXImportMediaProvider_requestImageURLForAsset_options_resultHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __72__PXImportMediaProvider_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniformTypeIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, v4, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

void __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;

  v3 = a2;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v5 = v3;
  px_dispatch_on_main_queue();

}

void __93__PXImportMediaProvider_requestCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CD1C68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v3, "px_dictionaryBySettingObject:forKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)off_1E50B84E8);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"), 0, v3);

}

void __91__PXImportMediaProvider_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;

  v8 = a4;
  if (a2)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:imageOrientation:", a2, a3);
  else
    v7 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
