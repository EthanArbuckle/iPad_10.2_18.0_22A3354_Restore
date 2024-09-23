@implementation PHAsset(PXAssetVariationType)

- (BOOL)px_isVariationTypeRecommended:()PXAssetVariationType
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL8 result;
  char v9;

  +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "suggestionsScheme");

  switch(v6)
  {
    case 0:
      if (a3 - 1 >= 3)
        v7 = 0;
      else
        v7 = a3;
      if ((objc_msgSend(a1, "variationSuggestionStatesForVariationType:", v7) & 1) != 0)
        goto LABEL_13;
      goto LABEL_6;
    case 1:
      v9 = objc_msgSend(a1, "canPlayPhotoIris");
      result = 0;
      if (a3 != 1)
        return result;
      goto LABEL_12;
    case 2:
      v9 = objc_msgSend(a1, "canPlayPhotoIris");
      result = 0;
      if (a3 != 3)
        return result;
      goto LABEL_12;
    case 3:
      v9 = objc_msgSend(a1, "canPlayPhotoIris");
      result = 0;
      if (a3 != -1)
      {
LABEL_12:
        if ((v9 & 1) != 0)
        {
LABEL_13:
          if (a3 >= 4)
            LOWORD(a3) = 0;
          result = objc_msgSend(a1, "playbackVariation") != (unsigned __int16)a3;
        }
      }
      break;
    default:
LABEL_6:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)px_isRecommendationSeenForVariationType:()PXAssetVariationType
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "suggestionsScheme");

  if ((unint64_t)(v6 - 1) >= 3)
  {
    if (v6)
    {
      return 0;
    }
    else
    {
      if ((unint64_t)(a3 - 1) >= 3)
        v10 = 0;
      else
        v10 = a3;
      return ((unint64_t)objc_msgSend(a1, "variationSuggestionStatesForVariationType:", v10) >> 5) & 1;
    }
  }
  else
  {
    objc_getAssociatedObject(a1, (const void *)PXRecommendationSeenAssociationKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    return v8;
  }
}

@end
