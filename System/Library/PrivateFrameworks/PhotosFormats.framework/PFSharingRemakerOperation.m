@implementation PFSharingRemakerOperation

- (PFSharingRemakerOperation)init
{
  PFSharingRemakerOperation *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFSharingRemakerOperation;
  v2 = -[PFSharingRemakerOperation init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFSharingRemakerOperation _setUUID:](v2, "_setUUID:", v4);

  }
  return v2;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)_setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (NSURL)imageOutputURL
{
  return self->_imageOutputURL;
}

- (void)_setImageOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)videoOutputURL
{
  return self->_videoOutputURL;
}

- (void)_setVideoOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)_uuid
{
  return self->__uuid;
}

- (void)_setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PFVideoSharingOperation)_videoOperation
{
  return self->__videoOperation;
}

- (void)_setVideoOperation:(id)a3
{
  objc_storeStrong((id *)&self->__videoOperation, a3);
}

- (PFPhotoSharingOperation)_imageOperation
{
  return self->__imageOperation;
}

- (void)_setImageOperation:(id)a3
{
  objc_storeStrong((id *)&self->__imageOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__imageOperation, 0);
  objc_storeStrong((id *)&self->__videoOperation, 0);
  objc_storeStrong((id *)&self->__uuid, 0);
  objc_storeStrong((id *)&self->_videoOutputURL, 0);
  objc_storeStrong((id *)&self->_imageOutputURL, 0);
}

+ (id)remakerOperationWithInputType:(int64_t)a3 videoURL:(id)a4 imageURL:(id)a5 adjustmentData:(id)a6
{
  id v9;
  id v10;
  id v11;
  PFSharingRemakerOperation *v12;
  PFVideoSharingOperation *v13;
  PFPhotoSharingOperation *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(PFSharingRemakerOperation);
  -[PFSharingRemakerOperation _setInputType:](v12, "_setInputType:", a3);
  if ((unint64_t)(a3 - 1) <= 2)
  {
    v13 = -[PFVideoSharingOperation initWithVideoURL:adjustmentData:]([PFVideoSharingOperation alloc], "initWithVideoURL:adjustmentData:", v9, v11);
    -[PFSharingRemakerOperation _setVideoOperation:](v12, "_setVideoOperation:", v13);

  }
  if ((unint64_t)a3 <= 1)
  {
    v14 = -[PFPhotoSharingOperation initWithImageURL:adjustmentData:]([PFPhotoSharingOperation alloc], "initWithImageURL:adjustmentData:", v10, v11);
    -[PFSharingRemakerOperation _setImageOperation:](v12, "_setImageOperation:", v14);

  }
  return v12;
}

@end
