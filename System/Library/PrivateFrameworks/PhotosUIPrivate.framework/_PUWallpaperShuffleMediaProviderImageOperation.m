@implementation _PUWallpaperShuffleMediaProviderImageOperation

- (_PUWallpaperShuffleMediaProviderImageOperation)initWithSegmentationOperation:(id)a3 requestDescriptor:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PUWallpaperShuffleMediaProviderImageOperation *v12;
  _PUWallpaperShuffleMediaProviderImageOperation *v13;
  uint64_t v14;
  id resultHandler;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PUWallpaperShuffleMediaProviderImageOperation;
  v12 = -[PXAsyncOperation init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestDescriptor, a4);
    v14 = objc_msgSend(v11, "copy");
    resultHandler = v13->_resultHandler;
    v13->_resultHandler = (id)v14;

    objc_storeStrong((id *)&v13->_segmentationLoadingOperation, a3);
    -[_PUWallpaperShuffleMediaProviderImageOperation addDependency:](v13, "addDependency:", v13->_segmentationLoadingOperation);
  }

  return v13;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[NUBufferRenderRequest renderContext](self->_renderRequest, "renderContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllRequests");

  v4.receiver = self;
  v4.super_class = (Class)_PUWallpaperShuffleMediaProviderImageOperation;
  -[PXAsyncOperation cancel](&v4, sel_cancel);
}

- (void)px_start
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  Class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSError *v19;
  NSError *error;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (-[_PUWallpaperShuffleMediaProviderImageOperation isCancelled](self, "isCancelled"))
  {
    -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");
    return;
  }
  -[_PUWallpaperShuffleMediaProviderImageOperation segmentationLoadingOperation](self, "segmentationLoadingOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperShuffleMediaProvider.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("segmentationOperation.isFinished"));

  }
  objc_msgSend(v4, "segmentationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v13;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    if (v13)
    {
      v25 = *MEMORY[0x1E0CB3388];
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperShuffleMediaProviderError"), 1, v15);
    v19 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v19;

    if (v7)
    -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");
    goto LABEL_18;
  }
  objc_msgSend(v5, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52020]), "initWithComposition:", v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v8, "setPriority:", v9);

  objc_storeStrong((id *)&self->_renderRequest, v8);
  -[_PUWallpaperShuffleMediaProviderImageOperation requestDescriptor](self, "requestDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "contentMode");

  if (!v11)
  {
    v12 = (Class *)0x1E0D520D0;
    goto LABEL_12;
  }
  if (v11 == 1)
  {
    v12 = (Class *)0x1E0D520C0;
LABEL_12:
    v16 = objc_alloc(*v12);
    -[_PUWallpaperShuffleMediaProviderImageOperation requestDescriptor](self, "requestDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "targetSize");
    v18 = (void *)objc_msgSend(v16, "initWithTargetSize:");
    objc_msgSend(v8, "setScalePolicy:", v18);

  }
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58___PUWallpaperShuffleMediaProviderImageOperation_px_start__block_invoke;
  v22[3] = &unk_1E58A79E0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v8, "submit:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

LABEL_18:
}

- (void)_handleRenderResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *resultImage;
  void *v13;
  PXCGImage *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  objc_msgSend(a3, "result:", &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D52168];
    objc_msgSend(v4, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "newCGImageFromBufferImage:", v8);

    if (v9)
    {
      v10 = 0;
    }
    else
    {
      v28 = *MEMORY[0x1E0CD1BE8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperShuffleMediaProviderError"), 2, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = (PXCGImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B240]), "initWithCGImage:", v9);
    resultImage = self->_resultImage;
    self->_resultImage = v14;
LABEL_10:

    v16 = v9;
    goto LABEL_11;
  }
  v32 = *MEMORY[0x1E0CD1BE8];
  v11 = (void *)MEMORY[0x1E0CB35C8];
  if (v5)
  {
    v30 = *MEMORY[0x1E0CB3388];
    v31 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    resultImage = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    resultImage = 0;
  }
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperShuffleMediaProviderError"), 2, resultImage);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v16 = 0;
  if (v6)
    goto LABEL_10;
LABEL_11:
  -[_PUWallpaperShuffleMediaProviderImageOperation requestDescriptor](self, "requestDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resultHandlerQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    v21 = MEMORY[0x1E0C80D38];
    v22 = MEMORY[0x1E0C80D38];
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___PUWallpaperShuffleMediaProviderImageOperation__handleRenderResponse___block_invoke;
  block[3] = &unk_1E58A9DF0;
  v25 = v10;
  v26 = v16;
  block[4] = self;
  v23 = v10;
  dispatch_async(v21, block);

}

- (PXImageRequestDescriptor)requestDescriptor
{
  return self->_requestDescriptor;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (PUWallpaperShuffleSegmentationLoadingOperation)segmentationLoadingOperation
{
  return self->_segmentationLoadingOperation;
}

- (PXCGImage)resultImage
{
  return self->_resultImage;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resultImage, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingOperation, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_requestDescriptor, 0);
  objc_storeStrong((id *)&self->_renderRequest, 0);
}

@end
