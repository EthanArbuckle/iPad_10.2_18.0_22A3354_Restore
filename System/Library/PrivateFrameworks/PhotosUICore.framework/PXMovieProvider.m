@implementation PXMovieProvider

- (PXMovieProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMovieProvider.m"), 20, CFSTR("%s is not available as initializer"), "-[PXMovieProvider init]");

  abort();
}

- (PXMovieProvider)initWithAssetCollection:(id)a3
{
  id v5;
  PXMovieProvider *v6;
  PXMovieProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMovieProvider;
  v6 = -[PXMovieProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetCollection, a3);

  return v7;
}

- (PXMovieProvider)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  id v7;
  PXMovieProvider *v8;
  PXMovieProvider *v9;

  v7 = a4;
  v8 = -[PXMovieProvider initWithAssetCollection:](self, "initWithAssetCollection:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_keyAsset, a4);

  return v9;
}

- (UIViewController)movieViewController
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMovieProvider.m"), 40, CFSTR("This class should be never be used directly"));

  return 0;
}

- (BOOL)canPlayMovie
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMovieProvider.m"), 45, CFSTR("This class should be never be used directly"));

  return 0;
}

- (PXDiagnosticsItemProvider)diagnosticsItemProvider
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMovieProvider.m"), 50, CFSTR("This class should be never be used directly"));

  return 0;
}

- (BOOL)ppt_runTest:(id)a3 options:(id)a4
{
  return 0;
}

- (PXMovieProviderDelegate)delegate
{
  return (PXMovieProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
