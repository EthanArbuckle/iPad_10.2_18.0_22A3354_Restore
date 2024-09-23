@implementation PGWallpaperSuggestionUtilities

+ (id)assetFetchPropertySetsIncludingGating:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PGWallpaperSuggestionAssetGater assetFetchPropertySetsForGating](PGWallpaperSuggestionAssetGater, "assetFetchPropertySetsForGating");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)peopleSceneConfidenceThresholdHelper
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84E95B0, 4);
}

+ (BOOL)foundDominantPeopleSceneInAsset:(id)a3 withConfidenceThresholdHelper:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  NSRect v27;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "curationModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "confidenceThresholdBySceneIdentifierWithCurationModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "clsSceneClassifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v20 = v6;
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v13, "extendedSceneIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v13, "confidence");
          v17 = v16;
          objc_msgSend(v15, "doubleValue");
          if (v17 >= v18)
          {
            objc_msgSend(v13, "boundingBox");
            if (!NSIsEmptyRect(v27))
            {

              LOBYTE(v10) = 1;
              goto LABEL_13;
            }
          }
        }

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
LABEL_13:
    v6 = v20;
  }

  return v10;
}

+ (id)peopleShuffleDescriptorTitleWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PGWallpaperPeopleShuffleWithCount %lu"), CFSTR("PGWallpaperPeopleShuffleWithCount %lu"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
