@implementation PXImageRequestOptions(PhotoKit)

- (id)photoKitRequestOptions
{
  id v2;

  objc_msgSend(a1, "underlyingPhotoKitImageRequestOptions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    objc_msgSend(a1, "copyPropertiesToPhotoKitOptions:", v2);
  }
  return v2;
}

- (void)initWithUnderlyingPhotoKitImageRequestOptions:()PhotoKit
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "init");
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setUnderlyingPhotoKitImageRequestOptions:", v4);

  return v6;
}

- (void)setUnderlyingPhotoKitImageRequestOptions:()PhotoKit
{
  id value;

  value = a3;
  objc_msgSend(a1, "copyPropertiesFromPhotoKitOptions:", value);
  objc_setAssociatedObject(a1, (const void *)UnderlyingPhotoKitRequestOptionsKey, value, (void *)3);

}

- (id)underlyingPhotoKitImageRequestOptions
{
  return objc_getAssociatedObject(a1, (const void *)UnderlyingPhotoKitRequestOptionsKey);
}

- (void)copyPropertiesToPhotoKitOptions:()PhotoKit
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setVersion:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsVersionFromPXImageRequestOptionsVersion:", objc_msgSend(a1, "version")));
  objc_msgSend(v6, "setAllowPlaceholder:", objc_msgSend(a1, "allowPlaceholder"));
  objc_msgSend(v6, "setDeliveryMode:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsDeliveryModeFromPXImageRequestOptionsDeliveryMode:", objc_msgSend(a1, "deliveryMode")));
  objc_msgSend(v6, "setResizeMode:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsResizeModeFromPXImageRequestOptionsResizeMode:", objc_msgSend(a1, "resizeMode")));
  objc_msgSend(a1, "normalizedCropRect");
  objc_msgSend(v6, "setNormalizedCropRect:");
  objc_msgSend(v6, "setNetworkAccessAllowed:", objc_msgSend(a1, "isNetworkAccessAllowed"));
  objc_msgSend(v6, "setSynchronous:", objc_msgSend(a1, "isSynchronous"));
  objc_msgSend(a1, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProgressHandler:", v4);

  objc_msgSend(v6, "setAllowSecondaryDegradedImage:", objc_msgSend(a1, "allowSecondaryDegradedImage"));
  objc_msgSend(a1, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
  objc_msgSend(v6, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(v6, "setLoadingMode:", objc_msgSend(a1, "loadingMode"));
  objc_msgSend(a1, "resultHandlerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultHandlerQueue:", v5);

  objc_msgSend(v6, "setDownloadIntent:", objc_msgSend(a1, "downloadIntent"));
  objc_msgSend(v6, "setDownloadPriority:", objc_msgSend(a1, "downloadPriority"));
  objc_msgSend(v6, "setUseLowMemoryMode:", objc_msgSend(a1, "useLowMemoryMode"));
  objc_msgSend(v6, "setPreferHDR:", objc_msgSend(a1, "preferHDR"));
  objc_msgSend(a1, "targetHDRHeadroom");
  objc_msgSend(v6, "setTargetHDRHeadroom:");
  objc_msgSend(v6, "setIncludeHDRGainMap:", objc_msgSend(a1, "includeHDRGainMap"));
  objc_msgSend(v6, "setChooseAlchemist:", objc_msgSend(a1, "chooseAlchemist"));
  objc_msgSend(v6, "setUseAsyncForFastOpportunisticResult:", objc_msgSend(a1, "useAsyncForFastOpportunisticResult"));
  objc_msgSend(v6, "setOpportunisticDegradedImagesToReturn:", objc_msgSend((id)objc_opt_class(), "phImageRequestOptionsDegradedImagesToReturnFromPXImageRequestOptionsDegradedImagesToReturn:", objc_msgSend(a1, "opportunisticDegradedImagesToReturn")));

}

- (uint64_t)copyPropertiesFromPhotoKitOptions:()PhotoKit
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "setVersion:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsVersionFromPHImageRequestOptionsVersion:", objc_msgSend(v4, "version")));
  objc_msgSend(a1, "setAllowPlaceholder:", objc_msgSend(v4, "allowPlaceholder"));
  objc_msgSend(a1, "setDeliveryMode:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsDeliveryModeFromPHImageRequestOptionsDeliveryMode:", objc_msgSend(v4, "deliveryMode")));
  objc_msgSend(a1, "setResizeMode:", objc_msgSend((id)objc_opt_class(), "pxImageRequestOptionsResizeModeFromPHImageRequestOptionsResizeMode:", objc_msgSend(v4, "resizeMode")));
  objc_msgSend(v4, "normalizedCropRect");
  objc_msgSend(a1, "setNormalizedCropRect:");
  objc_msgSend(a1, "setNetworkAccessAllowed:", objc_msgSend(v4, "isNetworkAccessAllowed"));
  objc_msgSend(a1, "setSynchronous:", objc_msgSend(v4, "isSynchronous"));
  objc_msgSend(v4, "progressHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setProgressHandler:", v5);

  objc_msgSend(a1, "setAllowSecondaryDegradedImage:", objc_msgSend(v4, "allowSecondaryDegradedImage"));
  objc_msgSend(v4, "fallbackTargetSizeIfRequestedSizeNotLocallyAvailable");
  objc_msgSend(a1, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  objc_msgSend(a1, "setLoadingMode:", objc_msgSend(v4, "loadingMode"));
  objc_msgSend(v4, "resultHandlerQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setResultHandlerQueue:", v6);

  objc_msgSend(a1, "setDownloadIntent:", objc_msgSend(v4, "downloadIntent"));
  objc_msgSend(a1, "setDownloadPriority:", objc_msgSend(v4, "downloadPriority"));
  objc_msgSend(a1, "setUseLowMemoryMode:", objc_msgSend(v4, "useLowMemoryMode"));
  objc_msgSend(a1, "setPreferHDR:", objc_msgSend(v4, "preferHDR"));
  objc_msgSend(v4, "targetHDRHeadroom");
  objc_msgSend(a1, "setTargetHDRHeadroom:");
  objc_msgSend(a1, "setIncludeHDRGainMap:", objc_msgSend(v4, "includeHDRGainMap"));
  objc_msgSend(a1, "setChooseAlchemist:", objc_msgSend(v4, "chooseAlchemist"));
  objc_msgSend(a1, "setUseAsyncForFastOpportunisticResult:", objc_msgSend(v4, "useAsyncForFastOpportunisticResult"));
  v7 = (void *)objc_opt_class();
  v8 = objc_msgSend(v4, "opportunisticDegradedImagesToReturn");

  return objc_msgSend(a1, "setOpportunisticDegradedImagesToReturn:", objc_msgSend(v7, "pxImageRequestOptionsDegradedImagesToReturnFromPHImageRequestOptionsDegradedImagesToReturn:", v8));
}

+ (unint64_t)phImageRequestOptionsVersionFromPXImageRequestOptionsVersion:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 110, CFSTR("Unexpected PX value %ti"), a3);

    abort();
  }
  return a3;
}

+ (unint64_t)pxImageRequestOptionsVersionFromPHImageRequestOptionsVersion:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 123, CFSTR("Unexpected PH value %ti"), a3);

    abort();
  }
  return a3;
}

+ (unint64_t)phImageRequestOptionsDeliveryModeFromPXImageRequestOptionsDeliveryMode:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 136, CFSTR("Unexpected PX value %ti"), a3);

    abort();
  }
  return a3;
}

+ (unint64_t)pxImageRequestOptionsDeliveryModeFromPHImageRequestOptionsDeliveryMode:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 149, CFSTR("Unexpected PH value %ti"), a3);

    abort();
  }
  return a3;
}

+ (unint64_t)phImageRequestOptionsResizeModeFromPXImageRequestOptionsResizeMode:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 162, CFSTR("Unexpected PX value %ti"), a3);

    abort();
  }
  return a3;
}

+ (unint64_t)pxImageRequestOptionsResizeModeFromPHImageRequestOptionsResizeMode:()PhotoKit
{
  void *v7;

  if (a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXImageRequestOptions+PhotoKit.m"), 175, CFSTR("Unexpected PH value %ti"), a3);

    abort();
  }
  return a3;
}

+ (uint64_t)phImageRequestOptionsDegradedImagesToReturnFromPXImageRequestOptionsDegradedImagesToReturn:()PhotoKit
{
  return a3 & 3;
}

+ (uint64_t)pxImageRequestOptionsDegradedImagesToReturnFromPHImageRequestOptionsDegradedImagesToReturn:()PhotoKit
{
  return a3 & 3;
}

@end
