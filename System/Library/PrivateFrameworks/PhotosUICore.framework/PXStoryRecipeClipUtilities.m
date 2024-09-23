@implementation PXStoryRecipeClipUtilities

+ (id)peopleSceneIdentifiers
{
  if (peopleSceneIdentifiers_onceToken != -1)
    dispatch_once(&peopleSceneIdentifiers_onceToken, &__block_literal_global_38086);
  return (id)peopleSceneIdentifiers_peopleSceneIdentifiers;
}

+ (BOOL)assetIsPortrait:(id)a3
{
  return objc_msgSend(a3, "hasPeopleSceneMidOrGreaterConfidence");
}

+ (BOOL)assetHasSignificantFaceArea:(id)a3
{
  double width;
  double height;
  void *v6;
  double v7;
  double v8;
  CGRect v9;

  objc_msgSend(a3, "faceAreaRect");
  width = v9.size.width;
  height = v9.size.height;
  if (CGRectIsEmpty(v9))
    return 0;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoEditPortraitAreaMin");
  v8 = v7;

  return width * height >= v8;
}

+ (BOOL)assetIsPortraitAspectWithLargeVerticalFaceArea:(id)a3
{
  id v3;
  double height;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  CGRect v10;

  v3 = a3;
  objc_msgSend(v3, "aspectRatio");
  if (PXAspectRatioIsPortrait()
    && (objc_msgSend(v3, "faceAreaRect"), height = v10.size.height, !CGRectIsEmpty(v10)))
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autoEditPortraitAspectLargeVerticalFaceAreaMin");
    v8 = v7;

    v5 = height >= v8;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)asset:(id)a3 isClassifiedAs:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "px_storyResourceFetchSceneClassifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "autoEditSceneConfidenceThreshold");
  v9 = v8;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "confidence", (_QWORD)v19);
        if (v15 >= v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v14, "extendedSceneIdentifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v5, "containsObject:", v16);

          if ((v17 & 1) != 0)
          {
            LOBYTE(v11) = 1;
            goto LABEL_12;
          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  return v11;
}

+ (id)petSceneIdentifiers
{
  if (petSceneIdentifiers_onceToken != -1)
    dispatch_once(&petSceneIdentifiers_onceToken, &__block_literal_global_131);
  return (id)petSceneIdentifiers_petSceneIdentifiers;
}

+ (BOOL)assetIsPet:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(a1, "petSceneIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "asset:isClassifiedAs:", v4, v5);

  v7 = v6 && (objc_msgSend(a1, "assetHasSignificantFaceArea:", v4) & 1) != 0;
  return v7;
}

+ (id)doNotRotateSceneIdentifiers
{
  if (doNotRotateSceneIdentifiers_onceToken != -1)
    dispatch_once(&doNotRotateSceneIdentifiers_onceToken, &__block_literal_global_136_38082);
  return (id)doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers;
}

+ (id)skySceneIdentifiers
{
  if (skySceneIdentifiers_onceToken != -1)
    dispatch_once(&skySceneIdentifiers_onceToken, &__block_literal_global_142_38081);
  return (id)skySceneIdentifiers_skySceneIdentifiers;
}

+ (id)doNotRotateWithSkySceneIdentifiers
{
  if (doNotRotateWithSkySceneIdentifiers_onceToken != -1)
    dispatch_once(&doNotRotateWithSkySceneIdentifiers_onceToken, &__block_literal_global_146);
  return (id)doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers;
}

+ (BOOL)canRotateAsset:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(a1, "doNotRotateSceneIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "asset:isClassifiedAs:", v4, v5);

  if ((v6 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(a1, "skySceneIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1, "asset:isClassifiedAs:", v4, v7);

  if (!v8)
    goto LABEL_5;
  objc_msgSend(a1, "doNotRotateWithSkySceneIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "asset:isClassifiedAs:", v4, v9);

  if ((v10 & 1) != 0)
LABEL_4:
    v11 = 0;
  else
LABEL_5:
    v11 = objc_msgSend(v4, "px_storyResourceFetchFaceCount") < 2;

  return v11;
}

+ (BOOL)assetHasHighCurationScore:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v3 = a3;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoEditHighCurationScoreThreshold");
  v6 = v5;

  objc_msgSend(v3, "px_storyResourceFetchCurationScore");
  LOBYTE(v4) = v7 >= v6;

  return (char)v4;
}

+ (BOOL)canRotate1UpClipsInRange:(_NSRange)a3 clipCatalog:(id)a4 maxAdjacent1Ups:(int64_t)a5
{
  int64_t v5;
  NSUInteger v6;
  NSUInteger length;
  NSUInteger location;
  BOOL v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  int64_t v19;

  v5 = 0x7FFFFFFFLL;
  if (a5)
    v5 = a5;
  v19 = v5;
  v6 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    length = a3.length;
    location = a3.location;
    v10 = 0;
    v11 = 0;
    do
    {
      objc_msgSend(a4, "clipAtIndex:", location);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayAssets");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14 == 1)
      {
        if (v11 >= v19
          || (objc_msgSend(v12, "displayAssets"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v15, "firstObject"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = +[PXStoryRecipeClipUtilities canRotateAsset:](PXStoryRecipeClipUtilities, "canRotateAsset:", v16), v16, v15, !v17))
        {

          return v10;
        }
        ++v11;
      }
      else
      {
        v11 = 0;
      }

      v10 = ++location >= v6;
      --length;
    }
    while (length);
  }
  return 1;
}

void __64__PXStoryRecipeClipUtilities_doNotRotateWithSkySceneIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E8AC0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers;
  doNotRotateWithSkySceneIdentifiers_skyPlusSceneIdentifiers = v0;

}

void __49__PXStoryRecipeClipUtilities_skySceneIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E8AA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)skySceneIdentifiers_skySceneIdentifiers;
  skySceneIdentifiers_skySceneIdentifiers = v0;

}

void __57__PXStoryRecipeClipUtilities_doNotRotateSceneIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E8A90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers;
  doNotRotateSceneIdentifiers_doNotRotateSceneIdentifiers = v0;

}

void __49__PXStoryRecipeClipUtilities_petSceneIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E8A78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)petSceneIdentifiers_petSceneIdentifiers;
  petSceneIdentifiers_petSceneIdentifiers = v0;

}

void __52__PXStoryRecipeClipUtilities_peopleSceneIdentifiers__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E8A60);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)peopleSceneIdentifiers_peopleSceneIdentifiers;
  peopleSceneIdentifiers_peopleSceneIdentifiers = v0;

}

@end
