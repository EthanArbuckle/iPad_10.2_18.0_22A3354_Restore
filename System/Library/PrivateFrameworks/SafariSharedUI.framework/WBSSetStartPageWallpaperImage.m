@implementation WBSSetStartPageWallpaperImage

void ___WBSSetStartPageWallpaperImage_block_invoke(uint64_t a1)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v9 = 0.0;
  v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "analyzeImageAndThresholdIfNecessary:thumbnail:precomputedLuminance:getAppearance:luminance:", objc_msgSend(*(id *)(a1 + 40), "CGImage"), 0, &v10, &v9, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v11 = *MEMORY[0x1E0CBCFF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizeImage:properties:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assignImage:oldImage:", v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_commitImage:appearanceName:luminance:forIdentifier:isGeneratedImage:withinProfile:completionHandler:", v8, v10, &stru_1E5449658, 0, 0, 0, v9);
}

@end
