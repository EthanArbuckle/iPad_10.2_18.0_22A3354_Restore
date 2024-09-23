@implementation PNExternalAssetRelevanceUtilities

+ (int64_t)externalAssetEligibilityForAsset:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  int64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int16 v15;

  v3 = a3;
  objc_msgSend(v3, "sceneAnalysisProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sceneAnalysisVersion");
  objc_msgSend(MEMORY[0x24BE71FF8], "currentSceneVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 <= v5)
  {
    objc_msgSend(v3, "faceAdjustmentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "curationScore");
      if (v10 == 0.0)
      {
        v8 = -2;
      }
      else
      {
        objc_msgSend(v3, "curationScore");
        if (v11 >= *MEMORY[0x24BE72068])
        {
          objc_msgSend(v3, "mediaAnalysisProperties");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "syndicationProcessingVersion");

          if (v13 == 8)
          {
            objc_msgSend(v3, "mediaAnalysisProperties");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "syndicationProcessingValue");

            if ((v15 & 0x3CF1) != 0)
              v8 = 2;
            else
              v8 = 1;
          }
          else
          {
            v8 = -1;
          }
        }
        else
        {
          v8 = 0;
        }
      }
    }
    else
    {
      v8 = -3;
    }
  }
  else
  {
    v8 = -4;
  }

  return v8;
}

+ (id)internalPredicateToIncludeExternalAssetsNeedingProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != %llu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("curationScore"), 0x3FE0000000000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestFaceVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "internalPredicateToIncludeExternalAssetsEligibleForProcessing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)internalPredicateToIncludeProcessedExternalAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %llu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "internalPredicateToIncludeExternalAssetsEligibleForProcessing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)internalPredicateToIncludeExternalAssetsEligibleForProcessing
{
  return (id)objc_msgSend(MEMORY[0x24BE72000], "internalPredicateToIncludeExternalAssetsEligibleForProcessing");
}

+ (BOOL)importedAssetInferredRelevant:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  __int16 v9;
  BOOL v10;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "curationProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importedByBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BE72000], "importedByBundleIdentifiersAllowListForMomentGeneration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) != 0
    || (objc_msgSend(v3, "mediaAnalysisProperties"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "syndicationProcessingValue"),
        v8,
        (v9 & 0x3CF1) != 0))
  {
LABEL_4:
    v10 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE72000], "importedByBundleIdentifiersToIncludeIfNotProcessed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "containsObject:", v5))
    {
      objc_msgSend(v3, "mediaAnalysisProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "syndicationProcessingVersion") == 0;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

@end
