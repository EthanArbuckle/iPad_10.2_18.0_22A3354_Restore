@implementation PIPhotosPipelineHDRFilters

+ (id)_map
{
  _QWORD v3[46];
  _QWORD v4[47];

  v4[46] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("CIMix");
  v3[1] = CFSTR("CIDissolveTransition");
  v4[0] = &__block_literal_global_13388;
  v4[1] = &__block_literal_global_13388;
  v3[2] = CFSTR("CIGammaAdjust");
  v3[3] = CFSTR("CIExposureAdjust");
  v4[2] = &__block_literal_global_13388;
  v4[3] = &__block_literal_global_13388;
  v3[4] = CFSTR("CIProSharpenEdges");
  v3[5] = CFSTR("CIFaceBalance");
  v4[4] = &__block_literal_global_13388;
  v4[5] = &__block_literal_global_13388;
  v3[6] = CFSTR("CIPhotoEffectMono");
  v3[7] = CFSTR("CIPhotoEffectTonal");
  v4[6] = &__block_literal_global_1;
  v4[7] = &__block_literal_global_1;
  v3[8] = CFSTR("CIPhotoEffectNoir");
  v3[9] = CFSTR("CIPhotoEffectFade");
  v4[8] = &__block_literal_global_1;
  v4[9] = &__block_literal_global_1;
  v3[10] = CFSTR("CIPhotoEffectChrome");
  v3[11] = CFSTR("CIPhotoEffectProcess");
  v4[10] = &__block_literal_global_1;
  v4[11] = &__block_literal_global_1;
  v3[12] = CFSTR("CIPhotoEffectTransfer");
  v3[13] = CFSTR("CIPhotoEffectInstant");
  v4[12] = &__block_literal_global_1;
  v4[13] = &__block_literal_global_1;
  v3[14] = CFSTR("CIPhotoEffect3DVivid");
  v3[15] = CFSTR("CIPhotoEffect3DVividWarm");
  v4[14] = &__block_literal_global_1;
  v4[15] = &__block_literal_global_1;
  v3[16] = CFSTR("CIPhotoEffect3DVividCool");
  v3[17] = CFSTR("CIPhotoEffect3DDramatic");
  v4[16] = &__block_literal_global_1;
  v4[17] = &__block_literal_global_1;
  v3[18] = CFSTR("CIPhotoEffect3DDramaticWarm");
  v3[19] = CFSTR("CIPhotoEffect3DDramaticCool");
  v4[18] = &__block_literal_global_1;
  v4[19] = &__block_literal_global_1;
  v3[20] = CFSTR("CIPhotoEffect3DSilverplate");
  v3[21] = CFSTR("CIPhotoEffect3DNoir");
  v4[20] = &__block_literal_global_1;
  v4[21] = &__block_literal_global_1;
  v3[22] = CFSTR("CIHighKey");
  v3[23] = CFSTR("CILocalContrast");
  v4[22] = &__block_literal_global_1;
  v4[23] = &__block_literal_global_1;
  v3[24] = CFSTR("PILocalContrastHDR");
  v3[25] = CFSTR("CILocalLightFilter");
  v4[24] = &__block_literal_global_13388;
  v4[25] = &__block_literal_global_1;
  v3[26] = CFSTR("CILocalLightMapPrepare");
  v3[27] = CFSTR("CIPhotoGrain");
  v4[26] = &__block_literal_global_1;
  v4[27] = &__block_literal_global_1;
  v3[28] = CFSTR("CISmartBlackAndWhite");
  v3[29] = CFSTR("CISmartColorFilter");
  v4[28] = &__block_literal_global_1;
  v4[29] = &__block_literal_global_1;
  v3[30] = CFSTR("CISmartToneFilter");
  v3[31] = CFSTR("CIVibrance");
  v4[30] = &__block_literal_global_1;
  v4[31] = &__block_literal_global_5;
  v3[32] = CFSTR("CIVignetteEffect");
  v3[33] = CFSTR("CILocalLight");
  v4[32] = &__block_literal_global_5;
  v4[33] = &__block_literal_global_1;
  v3[34] = CFSTR("CISmartColor");
  v3[35] = CFSTR("CISmartTone");
  v4[34] = &__block_literal_global_1;
  v4[35] = &__block_literal_global_1;
  v3[36] = CFSTR("PIFalseColorHDRDebug");
  v3[37] = CFSTR("PIColorBalanceFilter");
  v4[36] = &__block_literal_global_13388;
  v4[37] = &__block_literal_global_13388;
  v3[38] = CFSTR("PITempTintFilter");
  v3[39] = CFSTR("PIRAWFaceBalance");
  v4[38] = &__block_literal_global_13388;
  v4[39] = &__block_literal_global_13388;
  v3[40] = CFSTR("PINeutralGrayWhiteBalanceFilter");
  v3[41] = CFSTR("PIBilateralFilter");
  v4[40] = &__block_literal_global_13388;
  v4[41] = &__block_literal_global_13388;
  v3[42] = CFSTR("PICurvesLUTFilter");
  v3[43] = CFSTR("PICurvesFilter");
  v4[42] = &__block_literal_global_5;
  v4[43] = &__block_literal_global_1;
  v3[44] = CFSTR("PISelectiveColorFilter");
  v3[45] = CFSTR("PILevelsFilter");
  v4[44] = &__block_literal_global_13388;
  v4[45] = &__block_literal_global_1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 46);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)getMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PIPhotosPipelineHDRFilters_getMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getMap_onceToken != -1)
    dispatch_once(&getMap_onceToken, block);
  return (id)getMap_map;
}

+ (id)HDRFilterForSDRFilter:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "getMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

void __36__PIPhotosPipelineHDRFilters_getMap__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_map");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)getMap_map;
  getMap_map = v1;

}

id __34__PIPhotosPipelineHDRFilters__map__block_invoke_3(int a1, id a2)
{
  return a2;
}

id __34__PIPhotosPipelineHDRFilters__map__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "substringFromIndex:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("HDR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("PI"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __34__PIPhotosPipelineHDRFilters__map__block_invoke(int a1, id a2)
{
  return a2;
}

@end
