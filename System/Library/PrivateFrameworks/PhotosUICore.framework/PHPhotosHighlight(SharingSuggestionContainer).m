@implementation PHPhotosHighlight(SharingSuggestionContainer)

- (__CFString)px_sl_title
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  __CFString *v14;

  objc_msgSend(a1, "startDate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "endDate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(a1, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earlierDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "timeIntervalSinceDate:", v7);
    objc_msgSend(v7, "dateByAddingTimeInterval:", v11 * 0.5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v12, 0.0);
    _localizedSuggestionTitleForDateInterval(v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = &stru_1E5149688;
  }
  return v14;
}

- (id)px_sl_fetchAssetCollections
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CD1708];
  v5[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fetchHighlightsInSharedLibrarySharingSuggestions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)px_sl_getKeyAsset:()SharingSuggestionContainer suggestedDate:locations:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v73;
  id obj;
  void *v76;
  void *v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _QWORD v105[2];
  void *v106;
  void *v107;
  _QWORD v108[3];

  v108[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
  v108[0] = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v9);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(a1, "objectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("highlightBeingAssets.parentPhotosHighlight == %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalSortDescriptors:", v17);

  objc_msgSend(v8, "setSharingFilter:", 0);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = v19;
  objc_msgSend(v19, "curationProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addedDate");
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CD1708];
  v106 = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchHighlightsInSharedLibrarySharingSuggestions:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v79 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "librarySpecificFetchOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setWantsIncrementalChangeDetails:", 0);
  v77 = v25;
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("curationScore"), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v26;
  objc_msgSend(v26, "setInternalSortDescriptors:", v29);

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v23;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v97 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
        v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInHighlight:options:", v34, v77);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0u;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v93;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v93 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * j), "localizedLocationNames");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v41, "count"))
                objc_msgSend(v35, "addObjectsFromArray:", v41);

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
          }
          while (v38);
        }
        v42 = (void *)objc_msgSend(v35, "copy");
        objc_msgSend(v79, "setObject:forKeyedSubscript:", v42, v34);

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v34, v76);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v43, v34);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v104, 16);
    }
    while (v31);
  }

  objc_msgSend(v78, "keysSortedByValueUsingComparator:", &__block_literal_global_432);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "mutableCopy");

  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v46 = v45;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v89;
    while (2)
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v89 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * k);
        objc_msgSend(v78, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "firstObject");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v53)
        {
          v54 = v51;

          v55 = objc_retainAutorelease(v53);
          *a3 = v55;
          v71 = v55;
          if (v54)
          {
            objc_msgSend(v46, "removeObject:", v54);
            v70 = v54;
            objc_msgSend(v46, "insertObject:atIndex:", v54, 0);
          }
          else
          {
            v70 = 0;
          }
          goto LABEL_29;
        }
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v88, v102, 16);
      if (v48)
        continue;
      break;
    }
  }

  v70 = 0;
  v71 = 0;
  *a3 = 0;
LABEL_29:
  v56 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v57 = v46;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v85;
    do
    {
      for (m = 0; m != v59; ++m)
      {
        if (*(_QWORD *)v85 != v60)
          objc_enumerationMutation(v57);
        v62 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * m);
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v79, "objectForKeyedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v81;
LABEL_36:
          v67 = 0;
          while (1)
          {
            if (*(_QWORD *)v81 != v66)
              objc_enumerationMutation(v63);
            v68 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v67);
            if ((objc_msgSend(v56, "containsObject:", v68) & 1) == 0)
            {
              objc_msgSend(v56, "addObject:", v68);
              if ((unint64_t)objc_msgSend(v56, "count") > 3)
                break;
            }
            if (v65 == ++v67)
            {
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v80, v100, 16);
              if (v65)
                goto LABEL_36;
              break;
            }
          }
        }

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v84, v101, 16);
    }
    while (v59);
  }

  objc_msgSend(v56, "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  *a5 = (id)objc_msgSend(v69, "copy");

}

- (id)px_sl_containedSharingSuggestions
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = a1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)px_sl_containedSharingSuggestionObjectIDs
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
