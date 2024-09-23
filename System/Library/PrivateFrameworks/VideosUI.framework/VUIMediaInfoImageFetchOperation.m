@implementation VUIMediaInfoImageFetchOperation

uint64_t __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)executionDidBegin
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke;
  aBlock[3] = &unk_1E9FA3DE8;
  objc_copyWeak(&v12, &location);
  v4 = _Block_copy(aBlock);
  -[VUIMediaInfoImageFetchOperation imageProxy](self, "imageProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIMediaInfoImageFetchOperation imageProxy](self, "imageProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_3;
    v9[3] = &unk_1E9F9E8C8;
    v10 = v4;
    objc_msgSend(v6, "setCompletionHandler:", v9);

    -[VUIMediaInfoImageFetchOperation imageProxy](self, "imageProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "load");

    v8 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VUIMediaInfoImageFetchOperationErrorDomain"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *, _QWORD))v4 + 2))(v4, 0, v8, 0);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)imageProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIMediaInfoImageFetchOperation mediaInfo](self, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageProxies");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

void __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "imageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompletionHandler:", 0);

  objc_msgSend(WeakRetained, "setImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(WeakRetained, "setError:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "setImageLoadFinished:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(WeakRetained, "finishExecutionIfPossible");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(WeakRetained, "completionBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_msgSend(WeakRetained, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "error");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v10, v11, objc_msgSend(WeakRetained, "imageLoadFinished"));

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained, "completionBlocks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (NSMutableArray)completionBlocks
{
  return self->_completionBlocks;
}

- (void)setImageLoadFinished:(BOOL)a3
{
  self->_imageLoadFinished = a3;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
}

- (VUIMediaInfoImageFetchOperation)initWithMediaInfo:(id)a3
{
  id v4;
  VUIMediaInfoImageFetchOperation *v5;
  uint64_t v6;
  VUIMediaInfo *mediaInfo;
  uint64_t v8;
  NSMutableArray *completionBlocks;
  VUIImage *image;
  NSError *error;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIMediaInfoImageFetchOperation;
  v5 = -[VUIMediaInfoImageFetchOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mediaInfo = v5->_mediaInfo;
    v5->_mediaInfo = (VUIMediaInfo *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    completionBlocks = v5->_completionBlocks;
    v5->_completionBlocks = (NSMutableArray *)v8;

    image = v5->_image;
    v5->_image = 0;

    error = v5->_error;
    v5->_error = 0;

    v5->_imageLoadFinished = 0;
  }

  return v5;
}

void __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __52__VUIMediaInfoImageFetchOperation_executionDidBegin__block_invoke_2;
  v15 = &unk_1E9F99CE0;
  objc_copyWeak(&v18, (id *)(a1 + 32));
  v9 = v7;
  v16 = v9;
  v10 = v8;
  v17 = v10;
  v19 = a4;
  v11 = &v12;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v12, v13))
    v14((uint64_t)v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v18);
}

- (VUIImage)image
{
  return self->_image;
}

- (BOOL)imageLoadFinished
{
  return self->_imageLoadFinished;
}

- (NSError)error
{
  return self->_error;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIMediaInfoImageFetchOperation;
  -[VUIMediaInfoImageFetchOperation cancel](&v4, sel_cancel);
  -[VUIMediaInfoImageFetchOperation imageProxy](self, "imageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void)addCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[VUIMediaInfoImageFetchOperation completionBlocks](self, "completionBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)fetchImageWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *, BOOL);

  v6 = (void (**)(id, void *, void *, BOOL))a3;
  VUIRequireMainThread();
  if (-[VUIAsynchronousOperation isFinished](self, "isFinished"))
  {
    -[VUIMediaInfoImageFetchOperation image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaInfoImageFetchOperation error](self, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v4, v5, -[VUIMediaInfoImageFetchOperation imageLoadFinished](self, "imageLoadFinished"));

  }
  else
  {
    -[VUIMediaInfoImageFetchOperation addCompletion:](self, "addCompletion:", v6);
  }

}

- (void)setMediaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mediaInfo, a3);
}

- (void)setCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_completionBlocks, a3);
}

@end
