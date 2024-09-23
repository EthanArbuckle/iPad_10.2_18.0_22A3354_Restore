@implementation PXPersonItem

- (PXPersonItem)initWithPerson:(id)a3
{
  id v5;
  PXPersonItem *v6;
  PXPersonItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPersonItem;
  v6 = -[PXPersonItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modelObject, a3);

  return v7;
}

- (PHPerson)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
}

- (int)faceImageRequestID
{
  return self->_faceImageRequestID;
}

- (void)setFaceImageRequestID:(int)a3
{
  self->_faceImageRequestID = a3;
}

- (NSUUID)cellUUID
{
  return self->_cellUUID;
}

- (void)setCellUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)faceImageLoadingCompletionBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setFaceImageLoadingCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)resultHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setResultHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (UIImage)faceImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_faceImage);
}

- (void)setFaceImage:(id)a3
{
  objc_storeWeak((id *)&self->_faceImage, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_faceImage);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_faceImageLoadingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cellUUID, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end
