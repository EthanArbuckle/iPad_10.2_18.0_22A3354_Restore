@implementation PSIPostProcessor

+ (void)postProcessGroupResults:(id)a3 dedupedGroupResults:(id *)a4 query:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  unint64_t v39;
  BOOL v40;
  void *v41;
  void *v42;
  id *v43;
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  id v49;
  uint64_t v50;
  id v51;
  const __CFArray *v52;
  const __CFArray *v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[2];
  uint64_t (*v72)(uint64_t, void *);
  void *v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v72 = __70__PSIPostProcessor_postProcessGroupResults_dedupedGroupResults_query___block_invoke;
  v73 = &unk_1E3672158;
  v44 = v8;
  v74 = v8;
  if (+[PLSearchIndexConfiguration shouldIndexFilenames](PLSearchIndexConfiguration, "shouldIndexFilenames"))
  {
    v69 = 0uLL;
    v70 = 0uLL;
    v67 = 0uLL;
    v68 = 0uLL;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v68 != v11)
            objc_enumerationMutation(a3);
          v13 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if (objc_msgSend(v13, "dedupingSkippedCategory") != 2100)
            v72((uint64_t)v71, v13);
        }
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v10);
    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          if (objc_msgSend(v18, "dedupingSkippedCategory") == 2100)
            v72((uint64_t)v71, v18);
        }
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      }
      while (v15);
    }
  }
  else
  {
    v61 = 0uLL;
    v62 = 0uLL;
    v59 = 0uLL;
    v60 = 0uLL;
    v19 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v20; ++k)
        {
          if (*(_QWORD *)v60 != v21)
            objc_enumerationMutation(a3);
          v72((uint64_t)v71, *(void **)(*((_QWORD *)&v59 + 1) + 8 * k));
        }
        v20 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v76, 16);
      }
      while (v20);
    }
  }
  objc_msgSend(a3, "removeAllObjects");
  v23 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v43 = a4;
  if (a4)
    v49 = (id)objc_opt_new();
  else
    v49 = 0;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = (id)objc_msgSend(v44, "allValues");
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (v47)
  {
    v46 = *(_QWORD *)v56;
    v51 = a3;
LABEL_33:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v46)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v24);
      if ((objc_msgSend(a5, "isCanceled") & 1) != 0)
        break;
      v50 = v24;
      v26 = objc_msgSend(v25, "count");
      if (v26)
      {
        v27 = v25;
        v28 = v26;
        v29 = 0;
        v54 = v26;
        do
        {
          if ((objc_msgSend(a5, "isCanceled") & 1) != 0)
            break;
          v30 = (void *)objc_msgSend(v27, "objectAtIndex:", v29);
          if (v30 != (void *)v23)
          {
            v31 = v30;
            if (objc_msgSend(v30, "dedupingSkippedCategory") != 2100)
            {
              v53 = (const __CFArray *)objc_msgSend(v31, "assetIds");
              CFArrayGetCount(v53);
              v52 = (const __CFArray *)objc_msgSend(v31, "collectionIds");
              CFArrayGetCount(v52);
              v32 = v29 + 1;
              if (v29 + 1 < v28)
              {
                while ((objc_msgSend(a5, "isCanceled") & 1) == 0)
                {
                  v33 = objc_msgSend(v27, "objectAtIndex:", v32);
                  if (v33 != v23)
                  {
                    v34 = (void *)v33;
                    if (!objc_msgSend(v31, "dedupingSkippedCategory")
                      || (v35 = objc_msgSend(v31, "dedupingSkippedCategory"),
                          v35 != objc_msgSend(v34, "dedupingSkippedCategory")))
                    {
                      v36 = objc_msgSend(v31, "dedupingSkippedCategory");
                      if (v36 == objc_msgSend(v34, "dedupingSkippedCategory")
                        || objc_msgSend(v31, "dedupingSkippedCategory") != 2200
                        && objc_msgSend(v34, "dedupingSkippedCategory") != 2200)
                      {
                        if ((v37 = (void *)objc_msgSend(v31, "sceneGroupsIds"), !objc_msgSend(v37, "count"))
                          || (v38 = (void *)objc_msgSend(v34, "sceneGroupsIds"), !objc_msgSend(v38, "count"))
                          || ((v39 = objc_msgSend(v37, "count"), v40 = v39 >= objc_msgSend(v38, "count"), v28 = v54, v40)
                            ? (v41 = v38)
                            : (v41 = v37),
                              v41 != v37 ? (v42 = v37) : (v42 = v38),
                              objc_msgSend(v41, "isSubsetOfSet:", v42)))
                        {
                          CFArrayGetCount((CFArrayRef)objc_msgSend(v34, "assetIds"));
                          CFArrayGetCount((CFArrayRef)objc_msgSend(v34, "collectionIds"));
                          v28 = v54;
                          if (_idArrayIsEqual((uint64_t)v53))
                          {
                            if (_idArrayIsEqual((uint64_t)v52))
                            {
                              if (!objc_msgSend(a1, "_prefer:over:", v31, v34))
                              {
                                objc_msgSend(v49, "addObject:", v31);
                                objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v29, v23);
                                a3 = v51;
                                goto LABEL_66;
                              }
                              objc_msgSend(v49, "addObject:", v34);
                              objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v32, v23);
                            }
                          }
                        }
                      }
                    }
                  }
                  if (v28 == ++v32)
                    break;
                }
              }
              a3 = v51;
            }
            objc_msgSend(a3, "addObject:", v31);
          }
LABEL_66:
          ++v29;
        }
        while (v29 != v28);
      }
      v24 = v50 + 1;
      if (v50 + 1 == v47)
      {
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
        if (v47)
          goto LABEL_33;
        break;
      }
    }
  }

  if (v43)
    *v43 = v49;
}

+ (BOOL)_prefer:(id)a3 over:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  __int16 v10;
  __int16 v11;
  unint64_t v13;
  unint64_t v14;

  v6 = objc_msgSend(a3, "matchCount");
  v7 = objc_msgSend(a4, "matchCount");
  if (v6 < v7)
    return 1;
  if (v6 > v7)
    return 0;
  v8 = (void *)objc_msgSend(a3, "firstSearchTextGroupSnapshot");
  v9 = (void *)objc_msgSend(a4, "firstSearchTextGroupSnapshot");
  if (v8)
  {
    v10 = objc_msgSend(v8, "category");
    if (v9)
    {
LABEL_5:
      v11 = objc_msgSend(v9, "category");
      goto LABEL_8;
    }
  }
  else
  {
    v10 = objc_msgSend(a3, "categoryAtIndex:", 0);
    if (v9)
      goto LABEL_5;
  }
  v11 = objc_msgSend(a4, "categoryAtIndex:", 0);
LABEL_8:
  if (v10 < v11)
    return 1;
  if (v10 > v11)
    return 0;
  if (v10 == 1100)
  {
    v13 = objc_msgSend((id)objc_msgSend(v8, "contentString"), "length");
    return v13 >= objc_msgSend((id)objc_msgSend(v9, "contentString"), "length");
  }
  else
  {
    if (!PLSearchIndexCategoryIsSynonym(v10))
      return 1;
    v14 = objc_msgSend((id)objc_msgSend(v8, "contentString"), "length");
    return v14 <= objc_msgSend((id)objc_msgSend(v9, "contentString"), "length");
  }
}

uint64_t __70__PSIPostProcessor_postProcessGroupResults_dedupedGroupResults_query___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a2, "matchCount");
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4));
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4));

  }
  return objc_msgSend(v5, "addObject:", a2);
}

@end
