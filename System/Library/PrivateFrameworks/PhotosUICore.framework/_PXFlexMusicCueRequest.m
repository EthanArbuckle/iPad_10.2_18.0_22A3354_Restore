@implementation _PXFlexMusicCueRequest

- (_PXFlexMusicCueRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFlexMusicCueProvider.m"), 103, CFSTR("%s is not available as initializer"), "-[_PXFlexMusicCueRequest init]");

  abort();
}

- (_PXFlexMusicCueRequest)initWithAsset:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  _PXFlexMusicCueRequest *v9;
  _PXFlexMusicCueRequest *v10;
  uint64_t v11;
  id resultHandler;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXFlexMusicCueRequest;
  v9 = -[_PXFlexMusicCueRequest init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    v11 = objc_msgSend(v8, "copy");
    resultHandler = v10->_resultHandler;
    v10->_resultHandler = (id)v11;

  }
  return v10;
}

- (PXFlexMusicAsset)asset
{
  return self->_asset;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
