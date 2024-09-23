@implementation _PXAppleMusicMediaProviderRequest

- (_PXAppleMusicMediaProviderRequest)initWithAsset:(id)a3 options:(id)a4 requestID:(int64_t)a5 resultHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  _PXAppleMusicMediaProviderRequest *v14;
  _PXAppleMusicMediaProviderRequest *v15;
  uint64_t v16;
  PXAudioRequestOptions *options;
  uint64_t v18;
  id resultHandler;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_PXAppleMusicMediaProviderRequest;
  v14 = -[_PXAppleMusicMediaProviderRequest init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_requestID = a5;
    objc_storeStrong((id *)&v14->_asset, a3);
    v16 = objc_msgSend(v12, "copy");
    options = v15->_options;
    v15->_options = (PXAudioRequestOptions *)v16;

    v18 = objc_msgSend(v13, "copy");
    resultHandler = v15->_resultHandler;
    v15->_resultHandler = (id)v18;

  }
  return v15;
}

- (_PXAppleMusicMediaProviderRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicMediaProvider.m"), 57, CFSTR("%s is not available as initializer"), "-[_PXAppleMusicMediaProviderRequest init]");

  abort();
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (PXAppleMusicAsset)asset
{
  return self->_asset;
}

- (PXAudioRequestOptions)options
{
  return self->_options;
}

- (int64_t)signpostID
{
  return self->_signpostID;
}

- (void)setSignpostID:(int64_t)a3
{
  self->_signpostID = a3;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
