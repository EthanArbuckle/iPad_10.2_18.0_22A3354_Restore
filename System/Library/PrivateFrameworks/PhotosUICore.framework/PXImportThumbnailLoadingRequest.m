@implementation PXImportThumbnailLoadingRequest

- (PXImportThumbnailLoadingRequest)initWithImportItem:(id)a3 requestID:(int64_t)a4 requestSize:(unint64_t)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  PXImportThumbnailLoadingRequest *v12;
  PXImportThumbnailLoadingRequest *v13;
  uint64_t v14;
  id completionBlock;
  objc_super v17;

  v10 = a3;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PXImportThumbnailLoadingRequest;
  v12 = -[PXImportThumbnailLoadingRequest init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_importItem, v10);
    v13->_requestID = a4;
    v13->_requestSize = a5;
    v14 = objc_msgSend(v11, "copy");
    completionBlock = v13->_completionBlock;
    v13->_completionBlock = (id)v14;

  }
  return v13;
}

- (PXImportItemViewModel)importItem
{
  return (PXImportItemViewModel *)objc_loadWeakRetained((id *)&self->_importItem);
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (unint64_t)requestSize
{
  return self->_requestSize;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (PHImportAssetDataRequest)assetDataRequest
{
  return (PHImportAssetDataRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetDataRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDataRequest, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak((id *)&self->_importItem);
}

@end
