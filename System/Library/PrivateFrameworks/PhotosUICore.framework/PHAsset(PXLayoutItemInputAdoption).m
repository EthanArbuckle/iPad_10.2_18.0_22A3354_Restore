@implementation PHAsset(PXLayoutItemInputAdoption)

- (uint64_t)weight
{
  void *v2;
  uint64_t v3;

  +[PXGridSettings sharedInstance](PXGridSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "weightingScheme");

  return objc_msgSend(a1, "weightUsingWeightingScheme:", v3);
}

- (uint64_t)weightUsingWeightingScheme:()PXLayoutItemInputAdoption
{
  void *v3;
  double v4;
  double v5;
  float v6;
  float v7;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  v3 = (void *)result;
  if (a3)
  {
    switch(a3)
    {
      case 1:
        result = objc_msgSend((id)result, "curationScore", 1.0);
        break;
      case 2:
        objc_msgSend((id)result, "curationScore", 1.0);
        v6 = v5;
        result = objc_msgSend(v3, "px_playbackScore");
        if (v6 < 0.5 || v7 <= 0.5)
        {
          if (v6 >= 0.5)
          {
            result = PXFloatApproximatelyEqualToFloat();
            LODWORD(v9) = 0;
            if ((_DWORD)result)
              result = objc_msgSend(v3, "playbackStyle", v9);
          }
        }
        else
        {
          result = objc_msgSend(v3, "playbackStyle");
        }
        break;
      case 5:
        result = objc_msgSend((id)result, "isFavorite", 1.0);
        break;
      case 6:
        objc_msgSend((id)result, "creationDate", 1.0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        srand(v11);

        result = rand();
        break;
      case 7:
        objc_msgSend((id)result, "creationDate", 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        srand(v13);

        result = rand();
        break;
      default:
        return result;
    }
  }
  else
  {
    result = objc_msgSend((id)result, "highlightVisibilityScore");
    if (fabs(v4) < 2.22044605e-16)
      return objc_msgSend(v3, "overallAestheticScore");
  }
  return result;
}

- (double)size
{
  double v2;

  v2 = (double)(unint64_t)objc_msgSend(a1, "pixelWidth");
  objc_msgSend(a1, "pixelHeight");
  return v2;
}

- (long)weightUsingCriterion:()PXLayoutItemInputAdoption
{
  uint64_t v3;
  uint64_t v4;
  long double result;
  double v6;
  long double v7;

  if (a3 >= 2)
  {
    result = 0.0;
    if (a3 == 2)
    {
      objc_msgSend(a1, "highlightVisibilityScore", 0.0, v3, v4);
      v7 = fmod(v6 * 131.0, 100.0);
      return fmod(v7, 20.0) / 10.0;
    }
  }
  else
  {
    objc_msgSend(a1, "weight");
  }
  return result;
}

- (float)px_playbackScore
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "mediaAnalysisProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "autoplaySuggestionScore");
  v3 = v2;

  return v3;
}

- (__n128)transform
{
  __n128 *v1;
  __int128 v2;
  __n128 result;

  v1 = (__n128 *)MEMORY[0x1E0C9BAA8];
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v2;
  result = v1[2];
  *(__n128 *)(a1 + 32) = result;
  return result;
}

- (double)positionOffset
{
  return *MEMORY[0x1E0C9D538];
}

@end
