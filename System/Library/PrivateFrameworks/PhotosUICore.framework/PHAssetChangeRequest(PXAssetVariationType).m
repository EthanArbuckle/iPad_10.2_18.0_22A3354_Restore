@implementation PHAssetChangeRequest(PXAssetVariationType)

+ (id)px_changeRequestForSettingRecommendationSeen:()PXAssetVariationType variationType:asset:
{
  id v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;

  v8 = a5;
  if (objc_msgSend(v8, "px_isRecommendationSeenForVariationType:", a4) == (_DWORD)a3)
    goto LABEL_10;
  +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "suggestionsScheme");

  if ((unint64_t)(v10 - 1) < 3)
  {
    v11 = (const void *)PXRecommendationSeenAssociationKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v11, v12, (void *)0x301);

LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  if (v10)
    goto LABEL_10;
  if ((unint64_t)(a4 - 1) >= 3)
    a4 = 0;
  v13 = objc_msgSend(v8, "variationSuggestionStatesForVariationType:", a4) & 0xFFFFFFFFFFFFFFDFLL;
  v14 = 32;
  if (!(_DWORD)a3)
    v14 = 0;
  v15 = v13 | v14;
  objc_msgSend(a1, "changeRequestForAsset:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVariationSuggestionStates:forVariationType:", v15, a4);
LABEL_11:

  return v16;
}

@end
