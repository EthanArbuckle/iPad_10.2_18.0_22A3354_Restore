@implementation PUMediaProvider

- (int)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 14, CFSTR("concrete subclass must implement"));

  return 0;
}

- (int)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = a5;
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PUMediaProviderErrorDomain"), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CD1BE8];
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, 0, v8);

  }
  return 0;
}

- (int)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 27, CFSTR("concrete subclass must implement"));

  return 0;
}

- (int)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a5, a6, a7, a4.width, a4.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 32, CFSTR("concrete subclass must implement"));

  return 0;
}

- (int)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 38, CFSTR("Concrete subclass must implement"));

  return 0;
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 43, CFSTR("concrete subclass must implement"));

  return 0;
}

- (void)cancelImageRequest:(int)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUMediaProvider.m"), 48, CFSTR("concrete subclass must implement"));

}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_loadingStatusManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
}

@end
