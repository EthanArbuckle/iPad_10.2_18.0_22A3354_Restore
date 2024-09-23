@implementation PHPhotosHighlight(HighlightModelProtocol)

- (BOOL)isUpToDate
{
  int v2;

  v2 = objc_msgSend(a1, "enrichmentVersion");
  return v2 == objc_msgSend(a1, "highlightVersion");
}

- (uint64_t)faceAnalysisProgressForPhotoLibrary:()HighlightModelProtocol
{
  return objc_msgSend(a3, "faceAnalysisProgressForHighlight:", a1);
}

- (uint64_t)sceneAnalysisProgressForPhotoLibrary:()HighlightModelProtocol
{
  return objc_msgSend(a3, "sceneAnalysisProgressForHighlight:", a1);
}

- (double)nonDefaultCurationScorePercentageForPhotoLibrary:()HighlightModelProtocol
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v4 = a3;
  v5 = objc_msgSend(a1, "estimatedAssetCount");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldPrefetchCount:", 1);
    objc_msgSend(v7, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("curationScore != 0.5 && curationScore != 0.0"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setInternalPredicate:", v8);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (double)(unint64_t)objc_msgSend(v9, "count") / (double)v6;

  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (uint64_t)changeRequest
{
  return objc_msgSend(MEMORY[0x1E0CD1710], "changeRequestForPhotosHighlight:", a1);
}

+ (id)fetchParentDayGroupHighlightsForDayHighlights:()HighlightModelProtocol
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

        if (!v8)
        {
          objc_msgSend(v11, "photoLibrary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);

    if (!v8)
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_15;
    }
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY childDayGroupPhotosHighlights IN %@"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v14);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000304, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
    v8 = v5;
  }

LABEL_15:
  return v16;
}

@end
