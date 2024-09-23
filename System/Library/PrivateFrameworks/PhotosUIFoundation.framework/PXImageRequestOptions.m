@implementation PXImageRequestOptions

- (int64_t)loadingMode
{
  return self->_loadingMode;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (double)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)includeHDRGainMap
{
  return self->_includeHDRGainMap;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (BOOL)allowSecondaryDegradedImage
{
  return ((unint64_t)-[PXImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") >> 1) & 1;
}

- (BOOL)allowPlaceholder
{
  return self->_allowPlaceholder;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXImageRequestOptions copyPropertiesToOptions:](self, "copyPropertiesToOptions:", v4);
  return v4;
}

- (PXImageRequestOptions)init
{
  PXImageRequestOptions *v2;
  PXImageRequestOptions *v3;
  CGSize v4;
  id progressHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXImageRequestOptions;
  v2 = -[PXImageRequestOptions init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_loadingMode = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v2->_normalizedCropRect.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v2->_normalizedCropRect.size = v4;
    v2->_networkAccessAllowed = 0;
    progressHandler = v2->_progressHandler;
    v2->_resizeMode = 1;
    v2->_progressHandler = 0;

    v3->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = (CGSize)*MEMORY[0x24BDBF148];
    v3->_allowPlaceholder = 0;
    v3->_targetHDRHeadroom = 1.0;
    v3->_chooseAlchemist = 0;
    *(_WORD *)&v3->_useAsyncForFastOpportunisticResult = 0;
    v3->_opportunisticDegradedImagesToReturn = 1;
  }
  return v3;
}

- (void)copyPropertiesToOptions:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "setVersion:", version);
  objc_msgSend(v5, "setAllowPlaceholder:", self->_allowPlaceholder);
  objc_msgSend(v5, "setDeliveryMode:", self->_deliveryMode);
  objc_msgSend(v5, "setResizeMode:", self->_resizeMode);
  objc_msgSend(v5, "setNormalizedCropRect:", self->_normalizedCropRect.origin.x, self->_normalizedCropRect.origin.y, self->_normalizedCropRect.size.width, self->_normalizedCropRect.size.height);
  objc_msgSend(v5, "setNetworkAccessAllowed:", self->_networkAccessAllowed);
  objc_msgSend(v5, "setSynchronous:", self->_synchronous);
  objc_msgSend(v5, "setProgressHandler:", self->_progressHandler);
  objc_msgSend(v5, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:", self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width, self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height);
  objc_msgSend(v5, "setLoadingMode:", self->_loadingMode);
  objc_msgSend(v5, "setResultHandlerQueue:", self->_resultHandlerQueue);
  objc_msgSend(v5, "setDownloadIntent:", self->_downloadIntent);
  objc_msgSend(v5, "setDownloadPriority:", self->_downloadPriority);
  objc_msgSend(v5, "setUseLowMemoryMode:", self->_useLowMemoryMode);
  objc_msgSend(v5, "setPreferHDR:", self->_preferHDR);
  objc_msgSend(v5, "setTargetHDRHeadroom:", self->_targetHDRHeadroom);
  objc_msgSend(v5, "setIncludeHDRGainMap:", self->_includeHDRGainMap);
  objc_msgSend(v5, "setChooseAlchemist:", self->_chooseAlchemist);
  objc_msgSend(v5, "setUseAsyncForFastOpportunisticResult:", self->_useAsyncForFastOpportunisticResult);
  objc_msgSend(v5, "setOpportunisticDegradedImagesToReturn:", self->_opportunisticDegradedImagesToReturn);

}

- (void)setLoadingMode:(int64_t)a3
{
  self->_loadingMode = a3;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (void)setTargetHDRHeadroom:(double)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (void)setAllowSecondaryDegradedImage:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[PXImageRequestOptions opportunisticDegradedImagesToReturn](self, "opportunisticDegradedImagesToReturn") & 0xFFFFFFFFFFFFFFFDLL;
  v6 = 2;
  if (!v3)
    v6 = 0;
  -[PXImageRequestOptions setOpportunisticDegradedImagesToReturn:](self, "setOpportunisticDegradedImagesToReturn:", v5 | v6);
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void)setIncludeHDRGainMap:(BOOL)a3
{
  self->_includeHDRGainMap = a3;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (void)setAllowPlaceholder:(BOOL)a3
{
  self->_allowPlaceholder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (BOOL)useAsyncForFastOpportunisticResult
{
  return self->_useAsyncForFastOpportunisticResult;
}

- (void)setUseAsyncForFastOpportunisticResult:(BOOL)a3
{
  self->_useAsyncForFastOpportunisticResult = a3;
}

- (int64_t)opportunisticDegradedImagesToReturn
{
  return self->_opportunisticDegradedImagesToReturn;
}

- (void)setOpportunisticDegradedImagesToReturn:(int64_t)a3
{
  self->_opportunisticDegradedImagesToReturn = a3;
}

- (CGSize)fallbackTargetSizeIfRequestedSizeNotLocallyAvailable
{
  double width;
  double height;
  CGSize result;

  width = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.width;
  height = self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:(CGSize)a3
{
  self->_fallbackTargetSizeIfRequestedSizeNotLocallyAvailable = a3;
}

- (BOOL)chooseAlchemist
{
  return self->_chooseAlchemist;
}

- (void)setChooseAlchemist:(BOOL)a3
{
  self->_chooseAlchemist = a3;
}

@end
