@implementation UTTypeForBundlePathKey

void __UTTypeForBundlePathKey_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[16];
  _QWORD v23[18];

  v23[16] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("PFAssetBundlePathPhotoKey");
  v0 = (void *)*MEMORY[0x1E0CEC520];
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("PFAssetBundlePathVideoKey");
  v1 = (void *)*MEMORY[0x1E0CEC568];
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("PFAssetBundlePathAudioKey");
  objc_msgSend((id)*MEMORY[0x1E0CEC450], "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  v22[3] = CFSTR("PFAssetBundlePathAlternatePhotoKey");
  objc_msgSend(v0, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("PFAssetBundlePathFullSizePhotoKey");
  objc_msgSend(v0, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = CFSTR("PFAssetBundlePathFullSizeVideoKey");
  objc_msgSend(v1, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v16;
  v22[6] = CFSTR("PFAssetBundlePathAdjustmentDataKey");
  +[PFUniformTypeUtilities supplementalResourceAAEType](PFUniformTypeUtilities, "supplementalResourceAAEType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v14;
  v22[7] = CFSTR("PFAssetBundlePathOriginalAdjustmentDataKey");
  +[PFUniformTypeUtilities supplementalResourceAAEType](PFUniformTypeUtilities, "supplementalResourceAAEType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v3;
  v22[8] = CFSTR("PFAssetBundlePathAdjustmentSecondaryDataKey");
  objc_msgSend((id)*MEMORY[0x1E0CEC4A0], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v4;
  v22[9] = CFSTR("PFAssetBundlePathAdjustmentBasePhotoKey");
  objc_msgSend(v0, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v5;
  v22[10] = CFSTR("PFAssetBundlePathPairedVideoKey");
  objc_msgSend(v1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v6;
  v22[11] = CFSTR("PFAssetBundlePathFullSizePairedVideoKey");
  objc_msgSend(v1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v7;
  v22[12] = CFSTR("PFAssetBundlePathAdjustmentBasePairedVideoKey");
  objc_msgSend(v1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v8;
  v22[13] = CFSTR("PFAssetBundlePathSpatialOvercapturePhotoKey");
  objc_msgSend(v0, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v9;
  v22[14] = CFSTR("PFAssetBundlePathSpatialOvercapturePairedVideoKey");
  objc_msgSend(v1, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[14] = v10;
  v22[15] = CFSTR("PFAssetBundlePathSpatialOvercaptureVideoKey");
  objc_msgSend(v1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[15] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 16);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)UTTypeForBundlePathKey_utiTypesByPathKey;
  UTTypeForBundlePathKey_utiTypesByPathKey = v12;

}

@end
