@implementation PUFilmstripMediaProviderResult

- (int64_t)compare:(id)a3
{
  id v5;
  PUFilmstripAsset *asset;
  void *v7;
  int64_t v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUFilmstripMediaProvider.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[result isKindOfClass:[PUFilmstripMediaProviderResult class]]"));

  }
  asset = self->_asset;
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUFilmstripAsset compare:](asset, "compare:", v7);

  return v8;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSDictionary)resultInfo
{
  return self->_resultInfo;
}

- (void)setResultInfo:(id)a3
{
  objc_storeStrong((id *)&self->_resultInfo, a3);
}

- (int64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setRequestNumber:(int64_t)a3
{
  self->_requestNumber = a3;
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

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setActualTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_actualTime.epoch = a3->var3;
  *(_OWORD *)&self->_actualTime.value = v3;
}

- (PUFilmstripAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (BOOL)isReadyForDelivery
{
  return self->_isReadyForDelivery;
}

- (void)setIsReadyForDelivery:(BOOL)a3
{
  self->_isReadyForDelivery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_resultInfo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
