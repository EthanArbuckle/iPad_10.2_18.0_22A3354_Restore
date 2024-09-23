@implementation PGMoodSourceAsset

+ (id)_plistName
{
  return CFSTR("MoodSourceAsset");
}

- (double)weight
{
  return 0.5;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  id v32;
  const __CFString *v33;
  double v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMoodSource options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prefetchedAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PGMoodSource photoLibrary](self, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x1E0CD19F0];
    v42[0] = *MEMORY[0x1E0CD1A50];
    v42[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchPropertySets:", v10);

    +[PGCurationManager defaultAssetSortDescriptors](PGCurationManager, "defaultAssetSortDescriptors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v11);

    v12 = (void *)MEMORY[0x1E0CD1390];
    -[PGMoodSource assetCollection](self, "assetCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetsInAssetCollection:options:", v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0D77E08]);
    -[PGMoodSource photoLibrary](self, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithPhotoLibrary:", v16);

    objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v14, 25, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMoodSource options](self, "options");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPrefetchedAssets:", v6);

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v20)
  {

    v32 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  v21 = v20;
  v36 = v4;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v38 != v26)
        objc_enumerationMutation(v19);
      v28 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
      v29 = objc_msgSend(v28, "clsPeopleCount");
      if (v29)
      {
        ++v25;
        v22 += v29;
        objc_msgSend(v28, "clsFaceInformationSummary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "numberOfGoodFaces");

        v23 += v31;
        if (v31)
          ++v24;
      }
    }
    v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  }
  while (v21);

  if (v25 >= 3)
  {
    if ((double)v25 * 0.3 >= (double)v24)
    {
      v34 = (double)v25 * 0.1;
      v4 = v36;
      if (v34 <= (double)v24)
      {
LABEL_24:
        v32 = v4;
        goto LABEL_25;
      }
      v33 = CFSTR("NoSmile");
    }
    else
    {
      if ((double)v22 * 0.5 >= (double)v23)
        v33 = CFSTR("SomeSmiles");
      else
        v33 = CFSTR("ManySmiles");
      v4 = v36;
    }
    objc_msgSend(v4, "addObject:", v33);
    goto LABEL_24;
  }
  v32 = (id)MEMORY[0x1E0C9AA60];
  v4 = v36;
LABEL_25:

  return v32;
}

@end
