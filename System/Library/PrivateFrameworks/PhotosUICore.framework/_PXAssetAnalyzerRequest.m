@implementation _PXAssetAnalyzerRequest

- (_PXAssetAnalyzerRequest)initWithAsset:(id)a3 workerType:(int64_t)a4
{
  id v8;
  _PXAssetAnalyzerRequest *v9;
  _PXAssetAnalyzerRequest *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetAnalyzer.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_PXAssetAnalyzerRequest;
  v9 = -[_PXAssetAnalyzerRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v10->_workerType = a4;
  }

  return v10;
}

- (void)runWithResultHandler:(id)a3
{
  id v5;
  void *v6;
  id resultHandler;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  uint8_t buf[4];
  int v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetAnalyzer.m"), 119, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

  }
  v6 = (void *)objc_msgSend(v5, "copy");
  resultHandler = self->_resultHandler;
  self->_resultHandler = v6;

  -[_PXAssetAnalyzerRequest asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_workerType)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D475C0], "sharedAnalysisService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = v9;
      v21[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48___PXAssetAnalyzerRequest_runWithResultHandler___block_invoke;
      v16[3] = &unk_1E5145588;
      objc_copyWeak(&v17, &location);
      v12 = objc_msgSend(v10, "requestLivePhotoEffectsForAssets:withOptions:progressHandler:andCompletionHandler:", v11, 0, 0, v16);

      if (v12 <= 0)
      {
        PLUIGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v20 = v12;
          _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Effects request failed: invalid request ID %d", buf, 8u);
        }

        -[_PXAssetAnalyzerRequest _handleFinishWithSuccess:](self, "_handleFinishWithSuccess:", 0);
      }
      objc_destroyWeak(&v17);

    }
    else
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "PXAssetAnalyzerWorkerTypeAutoloop requires at least Yukon17A491", buf, 2u);
      }

      -[_PXAssetAnalyzerRequest _handleFinishWithSuccess:](self, "_handleFinishWithSuccess:", 0);
    }

    objc_destroyWeak(&location);
  }

}

- (void)_handleFinishWithSuccess:(BOOL)a3
{
  id resultHandler;
  _BOOL8 v5;
  id v6;
  void (**v7)(id, _BOOL8);

  if (!self->_finished)
  {
    self->_finished = 1;
    resultHandler = self->_resultHandler;
    if (resultHandler)
    {
      v5 = a3;
      v7 = (void (**)(id, _BOOL8))_Block_copy(resultHandler);
      v6 = self->_resultHandler;
      self->_resultHandler = 0;

      v7[2](v7, v5);
    }
  }
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)workerType
{
  return self->_workerType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_resultHandler, 0);
}

@end
