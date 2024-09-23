@implementation PUReviewAssetAnimatedImageMediaRequest

- (PUReviewAssetAnimatedImageMediaRequest)initWithAnimatedImageRequestID:(int64_t)a3
{
  PUReviewAssetAnimatedImageMediaRequest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUReviewAssetAnimatedImageMediaRequest;
  result = -[PUReviewAssetAnimatedImageMediaRequest init](&v5, sel_init);
  if (result)
    result->__animatedRequestID = a3;
  return result;
}

- (void)cancelRequest
{
  int64_t v2;

  v2 = -[PUReviewAssetAnimatedImageMediaRequest _animatedRequestID](self, "_animatedRequestID");
  objc_msgSend(MEMORY[0x1E0CD1380], "cancelAnimatedImageRequest:", v2);
}

- (int64_t)_animatedRequestID
{
  return self->__animatedRequestID;
}

@end
