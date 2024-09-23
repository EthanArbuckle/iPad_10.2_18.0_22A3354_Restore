@implementation PNAssetCurationUtilities

+ (id)assetsShowcasingFoodWithoutFacesInAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v45 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_31;
  }
  v42 = v5;
  v43 = v4;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = *MEMORY[0x24BDE37C8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  v41 = v6;
  objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE3648], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = v3;
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v3;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (!v9)
    goto LABEL_29;
  v10 = v9;
  v11 = *(_QWORD *)v62;
  v46 = *(_QWORD *)v62;
  v47 = v8;
  do
  {
    v12 = 0;
    v49 = v10;
    do
    {
      if (*(_QWORD *)v62 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x249506444]();
      objc_msgSend(v13, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
      {
        v55 = v14;
        v56 = v12;
        v54 = v15;
        objc_msgSend(v48, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v13;
        objc_msgSend(v13, "sceneAnalysisProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (int)objc_msgSend(v19, "sceneAnalysisVersion");

        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE726D0]), "initWithSceneAnalysisVersion:", v20);
        objc_msgSend(v53, "foodDrinkFoodieNode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE726A0]), "initWithSceneAnalysisVersion:", v20);
        objc_msgSend(v52, "foodOrDrinkNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v23 = v18;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (!v24)
          goto LABEL_26;
        v25 = v24;
        v26 = 0;
        v27 = 0;
        v28 = *(_QWORD *)v58;
        while (1)
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v58 != v28)
              objc_enumerationMutation(v23);
            v30 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v29);
            v31 = objc_msgSend(v30, "extendedSceneIdentifier");
            if (v31 == objc_msgSend(v21, "identifier")
              && (objc_msgSend(v30, "confidence"), v33 = v32, objc_msgSend(v21, "operatingPoint"), v33 >= v34))
            {
              v27 = 1;
            }
            else
            {
              v35 = objc_msgSend(v30, "extendedSceneIdentifier");
              if (v35 == objc_msgSend(v22, "identifier"))
              {
                objc_msgSend(v30, "confidence");
                v37 = v36;
                objc_msgSend(v22, "highPrecisionOperatingPoint");
                if (v37 >= v38)
                  v26 = 1;
              }
              if ((v27 & 1) == 0)
                goto LABEL_20;
            }
            if ((v26 & 1) != 0)
            {
              objc_msgSend(v45, "addObject:", v51);
              goto LABEL_26;
            }
LABEL_20:
            ++v29;
          }
          while (v25 != v29);
          v39 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
          v25 = v39;
          if (!v39)
          {
LABEL_26:

            v11 = v46;
            v8 = v47;
            v10 = v49;
            v14 = v55;
            v12 = v56;
            v15 = v54;
            break;
          }
        }
      }

      objc_autoreleasePoolPop(v14);
      ++v12;
    }
    while (v12 != v10);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  }
  while (v10);
LABEL_29:

  v4 = v43;
  v3 = v44;
  v5 = v42;
LABEL_31:

  return v45;
}

+ (BOOL)assetIsSafeForDisplay:(id)a3 modelSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  char v12;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "sceneAnalysisProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sceneAnalysisVersion");
  v10 = objc_msgSend(v7, "sceneAnalysisVersion");

  if (v9 != v10 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "sceneAnalysisProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = 67109376;
    v15[1] = objc_msgSend(v14, "sceneAnalysisVersion");
    v16 = 1024;
    v17 = objc_msgSend(v7, "sceneAnalysisVersion");
    _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[PNAssetCurationUtilities] assetIsSafeForDisplay asset and modelSet sceneAnalysisVersion mismatch (%d != %d)", (uint8_t *)v15, 0xEu);

  }
  objc_msgSend(v6, "sceneClassifications");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "_assetIsSafeForWidgetDisplay:sceneClassifications:modelSet:", v6, v11, v7);

  return v12;
}

+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "sceneClassifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_assetIsSafeForWidgetDisplay:sceneClassifications:modelSet:", v4, v5, 0);

  return (char)a1;
}

+ (BOOL)assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4
{
  return objc_msgSend(a1, "_assetIsSafeForWidgetDisplay:sceneClassifications:modelSet:", a3, a4, 0);
}

+ (BOOL)_assetIsSafeForWidgetDisplay:(id)a3 sceneClassifications:(id)a4 modelSet:(id)a5
{
  id v8;
  id v9;
  PNAssetSafeForDisplayModelSet *v10;
  PNAssetSafeForDisplayModelSet *v11;
  PNAssetSafeForDisplayModelSet *v12;
  void *v13;
  uint64_t v14;
  PNAssetSafeForDisplayModelSet *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  PNAssetSafeForDisplayModelSet *v42;
  id v43;
  id v44;
  PNAssetSafeForDisplayModelSet *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (PNAssetSafeForDisplayModelSet *)a5;
  if (v8)
  {
    v11 = v10;
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(v8, "sceneAnalysisProperties");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "sceneAnalysisVersion");

      v15 = [PNAssetSafeForDisplayModelSet alloc];
      v16 = v14;
      v11 = 0;
      v12 = -[PNAssetSafeForDisplayModelSet initWithSceneAnalysisVersion:](v15, "initWithSceneAnalysisVersion:", v16);
    }
    -[PNAssetSafeForDisplayModelSet ivsNSFWModel](v12, "ivsNSFWModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyNode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PNAssetSafeForDisplayModelSet nsfwModel](v12, "nsfwModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "generalNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v12;
    -[PNAssetSafeForDisplayModelSet tabooEventModel](v12, "tabooEventModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v23)
    {
      v24 = v23;
      v42 = v11;
      v43 = v9;
      v44 = v8;
      v25 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v28 = objc_msgSend(v27, "extendedSceneIdentifier", v42, v43, v44);
          if (v28 == objc_msgSend(v18, "identifier"))
          {
            objc_msgSend(v27, "confidence");
            v30 = v29;
            objc_msgSend(v18, "highRecallOperatingPoint");
            if (v30 >= v31)
              goto LABEL_19;
          }
          if (!v18 && v28 == objc_msgSend(v20, "identifier"))
          {
            objc_msgSend(v27, "confidence");
            v33 = v32;
            objc_msgSend(v20, "highRecallOperatingPoint");
            if (v33 >= v34)
              goto LABEL_19;
          }
          if (objc_msgSend(a1, "_isSupportedTabooEventIdentifier:", v28))
          {
            objc_msgSend(v21, "nodeForSignalIdentifier:", v28);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "highRecallOperatingPoint");
            v37 = v36;
            objc_msgSend(v27, "confidence");
            v39 = v38;

            if (v39 >= v37)
            {
LABEL_19:
              v40 = 0;
              goto LABEL_20;
            }
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v24)
          continue;
        break;
      }
      v40 = 1;
LABEL_20:
      v9 = v43;
      v8 = v44;
      v11 = v42;
    }
    else
    {
      v40 = 1;
    }

    v10 = v45;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

+ (id)safeAssetsForWidgetDisplay:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = (void *)MEMORY[0x24BDE3648];
  v5 = a3;
  objc_msgSend(v4, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__PNAssetCurationUtilities_safeAssetsForWidgetDisplay___block_invoke;
  v13[3] = &unk_251480090;
  v14 = v6;
  v16 = a1;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

+ (BOOL)_isSupportedTabooEventIdentifier:(unint64_t)a3
{
  return (a3 - 2147482870 < 0xA) & (0x37Fu >> (a3 + 10));
}

+ (id)syndicationEligibilityForAssets:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PNAssetCurationUtilities.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[asset isKindOfClass:PHAsset.class]"));

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "syndicationEligibility"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("curationScore"), *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.importedByBundleIdentifier"), *MEMORY[0x24BE720E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD14C0];
  v12[0] = v4;
  v12[1] = v5;
  v12[2] = v6;
  v12[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NSPredicate)internalPredicateToFilterAssetsEligibleForSyndication
{
  return (NSPredicate *)objc_msgSend(a1, "_internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:", *MEMORY[0x24BE72068]);
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForQuestion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_internalPredicateToFilterSyndicatedAssetsEligibleWithCurationScore:", 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend((id)*MEMORY[0x24BDF83D8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("uniformTypeIdentifier"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K != %d) AND (%K != %d)"), CFSTR("kindSubtype"), 10, CFSTR("kindSubtype"), 103);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD14C0];
  v11[0] = v2;
  v11[1] = v5;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v9;
}

+ (NSPredicate)internalPredicateToFilterGuestSyndicatedAssetsEligibleForQuestion
{
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
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "internalPredicateToFilterSyndicatedAssetsEligibleForQuestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %llu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3780]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == %llu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3778]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  v14[0] = v3;
  v14[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE72260], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x24BE72260], "maskForGuestAsset"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD14C0];
  v13[0] = v2;
  v13[1] = v8;
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v11;
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForCurationProcessing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K == 0.0"), CFSTR("curationScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v7;
}

+ (NSPredicate)internalPredicateToFilterSyndicatedAssetsEligibleForGuestInferenceProcessing
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "internalPredicateToFilterAssetsEligibleForSyndication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K & %i) != %i"), CFSTR("mediaAnalysisAttributes.syndicationProcessingValue"), 4096, 4096);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (%K == %llu OR (%K == nil && %K == %llu))"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3780], CFSTR("faceAdjustmentVersion"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3778]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v7;
}

+ (NSPredicate)internalPredicateToIncludeOnlyReceivedSyndicatedAssets
{
  return (NSPredicate *)objc_msgSend(MEMORY[0x24BE71FE0], "filterPredicateToIncludeOnlyReceivedSyndicatedAssets");
}

+ (id)internalPredicateToIncludeOnlySentSyndicatedAssets
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD14C0];
  +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets](PNAssetCurationUtilities, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notPredicateWithSubpredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)internalPredicateToIncludeReceivedNotAnalyzedSyndicatedAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets](PNAssetCurationUtilities, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K < 0"), CFSTR("thumbnailIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K <= 0.0"), CFSTR("curationScore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notPredicateWithSubpredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x24BE72068];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %f && %K != nil && %K != %llu"), CFSTR("curationScore"), *MEMORY[0x24BE72068], CFSTR("faceAdjustmentVersion"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3780]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K >= %f && %K == nil && %K != %llu"), CFSTR("curationScore"), v7, CFSTR("faceAdjustmentVersion"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x24BDE3778]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD14C0];
  v19[0] = v2;
  v19[1] = v3;
  v19[2] = v6;
  v19[3] = v8;
  v19[4] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "orPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD14C0];
  v18[0] = v17;
  v18[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)internalPredicateToIncludeReceivedNotEligibleSyndicatedAssets
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  +[PNAssetCurationUtilities internalPredicateToIncludeOnlyReceivedSyndicatedAssets](PNAssetCurationUtilities, "internalPredicateToIncludeOnlyReceivedSyndicatedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K < %f"), CFSTR("curationScore"), *MEMORY[0x24BE72068]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE71FE0], "predicateToIncludeOnlyAllowedForAnalysisAndProcessedAssetsToLatestSceneVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD14C0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5
{
  objc_class *v7;
  id v8;
  id v9;
  double v10;
  double v11;

  v7 = (objc_class *)MEMORY[0x24BE72438];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:", v8, v9, a4, a5);
  v11 = v10;

  return v11;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;

  v9 = (void *)MEMORY[0x24BDE34D0];
  v10 = a6;
  v11 = a3;
  objc_msgSend(v9, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a4, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:", v11, v12, v10);
  v14 = v13;

  return v14;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  double v16;

  v11 = (void *)MEMORY[0x24BDE34D0];
  v12 = a6;
  v13 = a3;
  objc_msgSend(v11, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:maxScenesCount:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:maxScenesCount:", v13, v14, v12, a7);
  v16 = v15;

  return v16;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 maxScenesCount:(int64_t)a7 popularityWeight:(double)a8
{
  void *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;

  v13 = (void *)MEMORY[0x24BDE34D0];
  v14 = a6;
  v15 = a3;
  objc_msgSend(v13, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a4, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:maxScenesCount:popularityWeight:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:POIGeoHash:sceneGeography:maxScenesCount:popularityWeight:", v15, v16, v14, a7, a8);
  v18 = v17;

  return v18;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5
{
  double result;

  objc_msgSend(a5, "scoreForPOI:scenes:maxScenesCount:popularityWeight:", a4, a3, 0x7FFFFFFFFFFFFFFFLL, 0.8);
  return result;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6
{
  double result;

  objc_msgSend(a5, "scoreForPOI:scenes:maxScenesCount:popularityWeight:", a4, a3, a6, 0.8);
  return result;
}

+ (double)assetIconicScoreForSceneClassificationIdentifiers:(id)a3 POIGeoHash:(id)a4 sceneGeography:(id)a5 maxScenesCount:(int64_t)a6 popularityWeight:(double)a7
{
  double result;

  objc_msgSend(a5, "scoreForPOI:scenes:maxScenesCount:popularityWeight:", a4, a3, a6, a7);
  return result;
}

+ (double)assetIconicScoreForSceneClassifications:(id)a3 assetLatitude:(double)a4 assetLongitude:(double)a5 sceneGeography:(id)a6 sceneTaxonomy:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "extendedSceneIdentifier", (_QWORD)v29);
        if (objc_msgSend(v13, "nodeRefForExtendedSceneClassId:", v21))
        {
          PFSceneTaxonomyNodeSearchThreshold();
          v23 = v22;
          objc_msgSend(v20, "confidence");
          if (v24 >= v23)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v25);

          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v17);
  }

  +[PNAssetCurationUtilities assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:](PNAssetCurationUtilities, "assetIconicScoreForSceneClassificationIdentifiers:assetLatitude:assetLongitude:sceneGeography:", v14, v12, a4, a5);
  v27 = v26;

  return v27;
}

+ (double)relativePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v7 = (void *)MEMORY[0x24BDE34D0];
  v8 = a5;
  objc_msgSend(v7, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popularityForPOI:popularity:", v9, 0);
  v11 = v10;

  return v11;
}

+ (double)absolutePopularityOfPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;

  v7 = (void *)MEMORY[0x24BDE34D0];
  v8 = a5;
  objc_msgSend(v7, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "popularityForPOI:popularity:", v9, 1);
  v11 = v10;

  return v11;
}

+ (id)sceneIdentifiersByScoreForPOI:(double)a3 assetLongitude:(double)a4 sceneGeography:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDE34D0];
  v8 = a5;
  objc_msgSend(v7, "poiGeoHashWithGeoHashSize:latitude:longitude:", 6, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scenesByScoreForPOIHash:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForSourcingAssetsFromHighlightExtendedCuration
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > %f"), CFSTR("highlightBeingExtendedAssets.promotionScore"), *MEMORY[0x24BE721B8]);
}

+ (id)predicateForSourcingAssetsFromHighlightSummaryCuration
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("highlightBeingSummaryAssets"));
}

void __55__PNAssetCurationUtilities_safeAssetsForWidgetDisplay___block_invoke(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = objc_msgSend(a1[6], "assetIsSafeForWidgetDisplay:sceneClassifications:", v9, v7);
  if (v8)
    objc_msgSend(a1[5], "addObject:", v9);

}

@end
