@implementation PLSearchIndexSceneTaxonomy

- (void)enumerateKeywordAndSynonymsForScenes:(id)a3 usingBlock:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3788];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke;
  v12[3] = &unk_1E3663F50;
  v12[4] = self;
  v13 = v9;
  v14 = v6;
  v10 = v6;
  v11 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

- (void)enumerateKeywordAndSynonymsForSceneIdentifiers:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, uint64_t))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19AEC1554]();
        if (PLIsNodeAllowedForSearch(-[PLSearchIndexSceneTaxonomy nodeRefForExtendedSceneClassId:](self, "nodeRefForExtendedSceneClassId:", objc_msgSend(v12, "unsignedIntegerValue"))))
        {
          PFSceneTaxonomyNodeLocalizedLabel();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          PFSceneTaxonomyNodeLocalizedSynonyms();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = PFSceneTaxonomyNodeExtendedSceneClassId();
          v7[2](v7, v14, v16, v17);

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

void __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if ((objc_msgSend(v3, "classificationType") & 0xFFFFFFFD) == 0)
  {
    if (objc_msgSend(a1[4], "nodeRefForExtendedSceneClassId:", objc_msgSend(v3, "sceneIdentifier")))
    {
      if ((PFSceneTaxonomyNodeIsRoot() & 1) == 0)
      {
        if (PFSceneTaxonomyNodeIsIndexed())
        {
          objc_msgSend(v3, "confidence");
          v5 = v4;
          PFSceneTaxonomyNodeSearchThreshold();
          if (v5 >= v6)
          {
            v7 = a1[5];
            v9 = a1[6];
            v8 = v3;
            PFSceneTaxonomyNodeTraverseParents();

          }
        }
      }
    }
  }

}

uint64_t __78__PLSearchIndexSceneTaxonomy_enumerateKeywordAndSynonymsForScenes_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  result = PLIsNodeAllowedForSearch(a2);
  if ((_DWORD)result)
  {
    v6 = *(_QWORD *)(a3 + 16);
    if ((objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v6) & 1) != 0)
    {
      return 1;
    }
    else
    {
      PFSceneTaxonomyNodeLocalizedLabel();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PFSceneTaxonomyNodeLocalizedSynonyms();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *, void *, uint64_t))(v9 + 16))(v9, v10, v7, v11, v6);

      objc_msgSend(*(id *)(a1 + 32), "addIndex:", v6);
      return 0;
    }
  }
  return result;
}

@end
