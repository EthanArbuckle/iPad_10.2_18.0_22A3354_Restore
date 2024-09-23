@implementation PXCollectionFetchOperation

- (PXCollectionFetchOperation)initWithCollection:(id)a3
{
  id v6;
  PXCollectionFetchOperation *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXCollectionFetchOperation;
  v7 = -[PXCollectionFetchOperation init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PXCollectionFetchOperation.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collection"));

    }
    objc_storeStrong((id *)&v7->_collection, a3);
  }

  return v7;
}

- (PXCollectionFetchOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionFetchOperation.m"), 39, CFSTR("%s is not available as initializer"), "-[PXCollectionFetchOperation init]");

  abort();
}

- (void)setDelegate:(id)a3
{
  PXCollectionFetchOperationDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }

}

- (void)main
{
  PHFetchOptions *fetchOptions;
  void *v4;
  void *v5;
  PHCollection *v6;
  void *v7;
  void *v8;
  PHFetchOptions *v9;

  -[PXCollectionFetchOperation handleBegin](self, "handleBegin");
  fetchOptions = self->_fetchOptions;
  if (fetchOptions)
  {
    v9 = fetchOptions;
  }
  else
  {
    -[PXCollectionFetchOperation collection](self, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
    v9 = (PHFetchOptions *)objc_claimAutoreleasedReturnValue();

  }
  if ((-[PXCollectionFetchOperation isCancelled](self, "isCancelled") & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((-[PXCollectionFetchOperation isCancelled](self, "isCancelled") & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", self->_collection, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = self->_collection;
    if (-[PHCollection assetCollectionType](v6, "assetCollectionType") == 2
      && -[PHCollection assetCollectionSubtype](v6, "assetCollectionSubtype") == 1000000205)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXCollectionFetchOperation PHAssetCollection All Photos"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFetchOptions setImportantFetchName:](v9, "setImportantFetchName:", v7);

    }
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXCollectionFetchOperation setOutputFetchResult:](self, "setOutputFetchResult:", v8);
  -[PXCollectionFetchOperation handleFinish](self, "handleFinish");

}

- (void)handleBegin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXCollectionFetchOperation_handleBegin__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)handleFinish
{
  void (*v3)(uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  if (-[PXCollectionFetchOperation isCancelled](self, "isCancelled"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v3 = __42__PXCollectionFetchOperation_handleFinish__block_invoke;
    v4 = &v6;
  }
  else
  {
    v5 = MEMORY[0x1E0C809B0];
    v3 = __42__PXCollectionFetchOperation_handleFinish__block_invoke_2;
    v4 = &v5;
  }
  v4[1] = 3221225472;
  v4[2] = (uint64_t)v3;
  v4[3] = (uint64_t)&unk_1E5149198;
  v4[4] = (uint64_t)self;
  dispatch_async(MEMORY[0x1E0C80D38], v4);
}

- (PXCollectionFetchOperationDelegate)delegate
{
  return (PXCollectionFetchOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PHFetchOptions)fetchOptions
{
  return self->_fetchOptions;
}

- (void)setFetchOptions:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOptions, a3);
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PHFetchResult)outputFetchResult
{
  return self->_outputFetchResult;
}

- (void)setOutputFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_outputFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFetchResult, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_fetchOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __42__PXCollectionFetchOperation_handleFinish__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "collectionFetchOperationDidComplete:", *(_QWORD *)(a1 + 32));

}

void __42__PXCollectionFetchOperation_handleFinish__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "collectionFetchOperationDidCancel:", *(_QWORD *)(a1 + 32));

}

void __41__PXCollectionFetchOperation_handleBegin__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "collectionFetchOperationDidBegin:", *(_QWORD *)(a1 + 32));

}

+ (id)fetchOperationWithCollection:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCollection:", v7);

  objc_msgSend(v8, "setDelegate:", v6);
  return v8;
}

@end
