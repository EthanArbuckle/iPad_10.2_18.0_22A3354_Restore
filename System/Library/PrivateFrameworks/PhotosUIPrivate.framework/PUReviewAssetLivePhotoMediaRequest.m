@implementation PUReviewAssetLivePhotoMediaRequest

- (id)initLivePhotoRequestID:(int)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUReviewAssetLivePhotoMediaRequest;
  result = -[PUReviewAssetLivePhotoMediaRequest init](&v5, sel_init);
  if (result)
    *((_DWORD *)result + 2) = a3;
  return result;
}

- (void)cancelRequest
{
  uint64_t v2;

  v2 = -[PUReviewAssetLivePhotoMediaRequest _liveRequestID](self, "_liveRequestID");
  objc_msgSend(MEMORY[0x1E0CD1608], "cancelLivePhotoRequestWithRequestID:", v2);
}

- (int)_liveRequestID
{
  return self->__liveRequestID;
}

@end
