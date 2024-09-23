@implementation PXGImageRequestSharedState

- (BOOL)applyCleanApertureCrop
{
  return self->_applyCleanApertureCrop;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
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

- (double)screenScale
{
  return self->_screenScale;
}

- (unint64_t)presentationStyles
{
  return self->_presentationStyles;
}

- (PXGDisplayAssetRequestObserver)observer
{
  return self->_observer;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (PXGDisplayAssetAdjustment)adjustment
{
  return self->_adjustment;
}

- (PXDisplayAssetFetchResult)displayAssetFetchResult
{
  return self->_displayAssetFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_adjustment, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_displayAssetFetchResult, 0);
}

- (PXGImageRequestSharedState)initWithDisplayAssetFetchResult:(id)a3 observer:(id)a4 presentationStyles:(unint64_t)a5 targetSize:(CGSize)a6 screenScale:(double)a7 screenMaxHeadroom:(double)a8 adjustment:(id)a9 intent:(unint64_t)a10 useLowMemoryDecode:(BOOL)a11 applyCleanApertureCrop:(BOOL)a12 mediaProvider:(id)a13
{
  CGFloat height;
  CGFloat width;
  id v23;
  id v24;
  id v25;
  PXGImageRequestSharedState *v26;
  PXGImageRequestSharedState *v27;
  id v30;
  objc_super v31;

  height = a6.height;
  width = a6.width;
  v23 = a3;
  v24 = a4;
  v30 = a9;
  v25 = a13;
  v31.receiver = self;
  v31.super_class = (Class)PXGImageRequestSharedState;
  v26 = -[PXGImageRequestSharedState init](&v31, sel_init);
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_displayAssetFetchResult, a3);
    objc_storeStrong((id *)&v27->_observer, a4);
    v27->_presentationStyles = a5;
    v27->_targetSize.width = width;
    v27->_targetSize.height = height;
    v27->_screenScale = a7;
    v27->_screenMaxHeadroom = a8;
    objc_storeStrong((id *)&v27->_adjustment, a9);
    v27->_intent = a10;
    objc_storeStrong((id *)&v27->_mediaProvider, a13);
    v27->_useLowMemoryDecode = a11;
    v27->_applyCleanApertureCrop = a12;
  }

  return v27;
}

- (double)screenMaxHeadroom
{
  return self->_screenMaxHeadroom;
}

@end
