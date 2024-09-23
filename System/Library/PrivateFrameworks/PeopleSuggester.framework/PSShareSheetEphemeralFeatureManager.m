@implementation PSShareSheetEphemeralFeatureManager

uint64_t __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callFeatureFunctionWithFeature:histogramFeatureData:", objc_msgSend(a2, "intValue"), *(_QWORD *)(a1 + 40));
}

uint64_t __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "intValue");
  return BMMLSEVirtualFeatureStoreFeaturefeatureNameAsString();
}

void __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_4;
  v7[3] = &unk_1E4402198;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __77___PSShareSheetEphemeralFeatureManager_computeFeaturesWithHistogramFeatures___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

}

@end
