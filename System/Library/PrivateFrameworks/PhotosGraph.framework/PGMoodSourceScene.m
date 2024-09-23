@implementation PGMoodSourceScene

- (double)weight
{
  return 1.5;
}

- (unint64_t)_sourceInputCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[PGMoodSource options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PGMoodSourceScene;
    return -[PGMoodSource _sourceInputCount](&v7, sel__sourceInputCount);
  }
  return v5;
}

- (void)_combineMoodVectorsWithGraph:(id)a3
{
  id v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  -[PGMoodSource options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIdentifiersByMomentNodeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PGMoodSource enrichedMemory](self, "enrichedMemory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PGMoodSource enrichedMemory](self, "enrichedMemory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "memoryMomentNodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGMoodUtilities moodSceneIdentifiersByMomentForMomentNodes:](PGMoodUtilities, "moodSceneIdentifiersByMomentForMomentNodes:", v10);
    }
    else
    {
      -[PGMoodSource assetCollection](self, "assetCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGMoodSource options](self, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGMoodUtilities moodSceneIdentifiersByMomentForAssetCollection:withGraph:moodOptions:](PGMoodUtilities, "moodSceneIdentifiersByMomentForAssetCollection:withGraph:moodOptions:", v9, v4, v10);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGMoodSource options](self, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSceneIdentifiersByMomentNodeIdentifier:", v7);

  }
  v23 = v7;
  v24 = v4;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v7, "objectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v29 = v12;
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
        v14 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v15 = v13;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (objc_msgSend((id)objc_opt_class(), "shouldUseSceneIdentifier:", v20))
              {
                objc_msgSend(v20, "moodIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[PGMoodSource _moodVectorForMoodIdentifier:](self, "_moodVectorForMoodIdentifier:", v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  v30[0] = MEMORY[0x1E0C809B0];
                  v30[1] = 3221225472;
                  v30[2] = __50__PGMoodSourceScene__combineMoodVectorsWithGraph___block_invoke;
                  v30[3] = &unk_1E8430E28;
                  v31 = v14;
                  v32 = v5;
                  objc_msgSend(v22, "enumerateWithBlock:", v30);

                }
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v17);
        }

        objc_msgSend(v14, "normalize");
        objc_msgSend(v27, "addMoodVector:", v14);

        v12 = v29 + 1;
      }
      while (v29 + 1 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v28);
  }

  objc_msgSend(v27, "multiplyByWeight:", 1.0 / (double)-[PGMoodSourceScene _sourceInputCount](self, "_sourceInputCount"));
  -[PGMoodSource setPositiveVector:](self, "setPositiveVector:", v27);
  -[PGMoodSource setNegativeVector:](self, "setNegativeVector:", v5);

}

uint64_t __50__PGMoodSourceScene__combineMoodVectorsWithGraph___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  if (a3 == 1.0)
    return objc_msgSend(*(id *)(result + 32), "addValue:forMood:", a2, 1.0);
  if (a3 == -1.0)
    return objc_msgSend(*(id *)(result + 40), "setValue:forMood:", a2, 1.0);
  return result;
}

+ (BOOL)shouldUseSceneIdentifier:(id)a3
{
  return 1;
}

+ (id)_plistName
{
  return CFSTR("MoodSourceScene");
}

@end
