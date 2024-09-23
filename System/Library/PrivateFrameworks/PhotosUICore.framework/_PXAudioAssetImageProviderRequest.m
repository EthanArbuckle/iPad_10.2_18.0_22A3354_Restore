@implementation _PXAudioAssetImageProviderRequest

- (_PXAudioAssetImageProviderRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetImageProvider.m"), 226, CFSTR("%s is not available as initializer"), "-[_PXAudioAssetImageProviderRequest init]");

  abort();
}

- (_PXAudioAssetImageProviderRequest)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7 requestID:(int64_t)a8 signpostID:(unint64_t)a9
{
  CGFloat height;
  CGFloat width;
  id v18;
  id v19;
  id v20;
  _PXAudioAssetImageProviderRequest *v21;
  _PXAudioAssetImageProviderRequest *v22;
  uint64_t v23;
  id resultHandler;
  objc_super v26;

  height = a4.height;
  width = a4.width;
  v18 = a3;
  v19 = a6;
  v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_PXAudioAssetImageProviderRequest;
  v21 = -[_PXAudioAssetImageProviderRequest init](&v26, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_asset, a3);
    v22->_targetSize.width = width;
    v22->_targetSize.height = height;
    v22->_contentMode = a5;
    objc_storeStrong((id *)&v22->_options, a6);
    v23 = objc_msgSend(v20, "copy");
    resultHandler = v22->_resultHandler;
    v22->_resultHandler = (id)v23;

    v22->_requestID = a8;
    v22->_signpostID = a9;
  }

  return v22;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXAudioAssetImageProviderRequest asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXAudioAssetImageProviderRequest targetSize](self, "targetSize");
  NSStringFromCGSize(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; asset: %@, targetSize: %@ requestID: %ld>"),
                 v5,
                 self,
                 v6,
                 v7,
                 -[_PXAudioAssetImageProviderRequest requestID](self, "requestID"));

  return v8;
}

- (PXDisplayAsset)asset
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

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
