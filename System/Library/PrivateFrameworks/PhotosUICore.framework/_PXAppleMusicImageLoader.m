@implementation _PXAppleMusicImageLoader

- (_PXAppleMusicImageLoader)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 80, CFSTR("%s is not available as initializer"), "-[_PXAppleMusicImageLoader init]");

  abort();
}

- (_PXAppleMusicImageLoader)initWithAsset:(id)a3 targetSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  _PXAppleMusicImageLoader *v9;
  _PXAppleMusicImageLoader *v10;
  objc_super v12;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXAppleMusicImageLoader;
  v9 = -[_PXAppleMusicImageLoader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_targetSize.width = width;
    v10->_targetSize.height = height;
  }

  return v10;
}

- (void)startWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id completionHandler;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSError *v14;
  NSError *error;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_completionHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_completionHandler == nil"));

  }
  v6 = (void *)objc_msgSend(v5, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  -[_PXAppleMusicImageLoader asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "musicAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PXAppleMusicImageLoader targetSize](self, "targetSize");
  objc_msgSend(v9, "artworkURLForTargetPixelSize:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_PXAppleMusicImageLoader _beginDownloadFromURL:](self, "_beginDownloadFromURL:", v10);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2938];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to fetch missing artwork URL for asset without Photo Library: %@"), v9, v17);
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSError *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 2, v13);
    error = self->_error;
    self->_error = v14;

    (*((void (**)(void))self->_completionHandler + 2))();
  }

}

- (void)_beginDownloadFromURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSURLSessionDataTask *v8;
  NSURLSessionDataTask *dataTask;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v5 = a3;
  if (self->_dataTask)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicImageProvider.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_dataTask == nil"));

  }
  objc_initWeak(&location, self);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39E0]), "initWithURL:", v5);
  objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50___PXAppleMusicImageLoader__beginDownloadFromURL___block_invoke;
  v11[3] = &unk_1E513B050;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v7, "dataTaskWithRequest:completionHandler:", v6, v11);
  v8 = (NSURLSessionDataTask *)objc_claimAutoreleasedReturnValue();
  dataTask = self->_dataTask;
  self->_dataTask = v8;

  -[NSURLSessionDataTask resume](self->_dataTask, "resume");
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_handleRequestData:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFData *v13;
  const __CFDictionary *v14;
  CGImageSourceRef v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    if (v10)
    {
      v26 = *MEMORY[0x1E0CB3388];
      v27 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 4, v20);
    goto LABEL_10;
  }
  -[_PXAppleMusicImageLoader targetSize](self, "targetSize");
  v28 = *MEMORY[0x1E0CBD240];
  v29[0] = MEMORY[0x1E0C9AAA0];
  v12 = (void *)MEMORY[0x1E0C99D80];
  v13 = (const __CFData *)v8;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v15 = CGImageSourceCreateWithData(v13, v14);

  if (!v15 || (v16 = PXCreateCGImageFromImageSourceWithMaxPixelSize(), CFRelease(v15), !v16))
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v9, "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("Finished download data from Apple Music artwork URL, but we could not use it to create an image: %@"), v19);

    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v24 = *MEMORY[0x1E0CB2938];
    v25 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 3, v22);

LABEL_10:
    goto LABEL_11;
  }
  v17 = 0;
LABEL_11:
  v23 = v17;
  px_dispatch_on_main_queue();

}

- (void)_handleURLFetchFailureWithError:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_PXAppleMusicImageLoader asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Failed to fetch artwork URL for Apple Music asset %@"), v6);

  v14 = *MEMORY[0x1E0CB2938];
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB3388]);
    v11 = objc_msgSend(v10, "copy");

    v9 = (void *)v11;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PXAudioAssetImageProviderErrorDomain"), 1, v9);
  v12 = v13;
  px_dispatch_on_main_queue();

}

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)_PXAppleMusicImageLoader;
  -[_PXAppleMusicImageLoader dealloc](&v3, sel_dealloc);
}

- (PXAppleMusicArtworkAsset)asset
{
  return self->_asset;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
}

@end
