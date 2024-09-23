@implementation PXSearchTaxonomyUtility

+ (id)localizedSceneAncestryInformationWithError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void (**v14)(id, void *, void *, id);
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD aBlock[5];
  void (**v22)(id, void *, void *, id);
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PXSearchTaxonomyUtility_localizedSceneAncestryInformationWithError___block_invoke;
  aBlock[3] = &unk_1E5119468;
  aBlock[4] = &v23;
  v22 = (void (**)(id, void *, void *, id))_Block_copy(aBlock);
  v24[3] = (uint64_t)&v22;
  v4 = objc_alloc_init(MEMORY[0x1E0D71AD8]);
  objc_msgSend(v4, "latestSceneTaxonomy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v5, "rootNode", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v12, "isIndexed"))
          {
            objc_msgSend(v12, "localizedLabel");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          v14 = v22;
          objc_msgSend(v12, "children");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14[2](v14, v13, v15, v6);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      }
      while (v9);
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Error allocating latest version of PFSceneTaxonomy for scene ancestry information"));
    v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v6;
}

void __70__PXSearchTaxonomyUtility_localizedSceneAncestryInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "isIndexed"))
        {
          objc_msgSend(v14, "localizedLabel");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (id)v15;
          if (v7 && v15)
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v15);
        }
        else
        {
          v16 = v7;
        }
        objc_msgSend(v14, "children");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && objc_msgSend(v17, "count"))
          (*(void (**)(void))(**(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16))();

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

}

@end
