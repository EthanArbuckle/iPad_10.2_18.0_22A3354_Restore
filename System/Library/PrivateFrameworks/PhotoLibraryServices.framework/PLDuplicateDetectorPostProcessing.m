@implementation PLDuplicateDetectorPostProcessing

+ (void)postProcessDuplicateSubGroupWithResult:(id)a3 metadataMap:(id)a4 metadataKey:(id)a5 secondarySortKey:(id)a6 subGroupSplitDecisionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  PLDuplicateGroup *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *context;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t (**v53)(id, void *, void *, id *);
  void *v54;
  id v55;
  uint64_t v56;
  PLDuplicateGroup *v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v50 = a6;
  v53 = (uint64_t (**)(id, void *, void *, id *))a7;
  context = (void *)MEMORY[0x19AEC1554]();
  v14 = objc_alloc_init(PLDuplicateGroup);
  v46 = v11;
  if ((objc_msgSend(v11, "hasSubGroups") & 1) != 0)
  {
    objc_msgSend(v11, "subGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "group");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithObject:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v15;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v61;
    v55 = v12;
    v57 = v14;
    v47 = *(_QWORD *)v61;
    do
    {
      v21 = 0;
      v48 = v19;
      do
      {
        if (*(_QWORD *)v61 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v21);
        if ((unint64_t)objc_msgSend(v22, "count") > 1)
        {
          objc_msgSend(a1, "_postProcessSortOIDs:oidMetadataMap:sortKey:secondarySortKey:", v22, v12, v13, v50);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "count");
          if (v24)
          {
            v25 = v24;
            v52 = v21;
            v26 = 0;
            v27 = 0;
            v58 = 0;
            v56 = v24;
            v54 = v23;
            do
            {
              objc_msgSend(v23, "objectAtIndexedSubscript:", v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                objc_msgSend(v12, "objectForKeyedSubscript:", v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "key");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectForKeyedSubscript:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31)
                {
                  objc_msgSend(v23, "objectAtIndexedSubscript:", v26 - 1);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "objectForKeyedSubscript:", v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v13;
                  objc_msgSend(v13, "key");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "objectForKeyedSubscript:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                  {
                    v59 = v58;
                    v37 = v53[2](v53, v28, v32, &v59);
                    v38 = v59;

                    if (v37)
                    {

                      v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                      -[PLDuplicateGroup addSubGroup:](v57, "addSubGroup:", v39);
                      PLDuplicateDetectionGetLog();
                      v40 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v28, "URIRepresentation");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v41, "relativePath");
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412546;
                        v65 = v42;
                        v66 = 2112;
                        v67 = v34;
                        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEBUG, "Duplicate Processing Detector: Split group [%@] on property: %@", buf, 0x16u);

                      }
                      v58 = 0;
                      v27 = v39;
                    }
                    else
                    {
                      v58 = v38;
                    }
                    v23 = v54;
                  }
                  objc_msgSend(v27, "addObject:", v28);

                  v13 = v34;
                  v12 = v55;
                  v25 = v56;
                }
                else
                {
                  objc_msgSend(v27, "addObject:", v28);
                }

              }
              else
              {
                v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);

                -[PLDuplicateGroup addSubGroup:](v57, "addSubGroup:", v43);
                objc_msgSend(v43, "addObject:", v28);
                v27 = v43;
              }

              ++v26;
            }
            while (v25 != v26);

            v14 = v57;
            v20 = v47;
            v19 = v48;
            v21 = v52;
          }

        }
        else
        {
          -[PLDuplicateGroup addSubGroup:](v14, "addSubGroup:", v22);
        }
        ++v21;
      }
      while (v21 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v19);
  }

  if (-[PLDuplicateGroup hasSubGroups](v14, "hasSubGroups"))
  {
    -[PLDuplicateGroup subGroups](v14, "subGroups");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "replaceSubGroups:", v44);

  }
  objc_autoreleasePoolPop(context);

}

+ (id)_postProcessSortOIDs:(id)a3 oidMetadataMap:(id)a4 sortKey:(id)a5 secondarySortKey:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v19)
          v22 = v20 == 0;
        else
          v22 = 1;
        if (!v22)
          objc_msgSend(v13, "setObject:forKey:", v20, v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __98__PLDuplicateDetectorPostProcessing__postProcessSortOIDs_oidMetadataMap_sortKey_secondarySortKey___block_invoke;
  v27[3] = &unk_1E36612B0;
  v28 = v11;
  v29 = v12;
  v23 = v12;
  v24 = v11;
  objc_msgSend(v13, "keysSortedByValueUsingComparator:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  SEL v12;
  id v13;

  v5 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __121__PLDuplicateDetectorPostProcessing_sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke;
  v10[3] = &unk_1E36612D8;
  v12 = a2;
  v13 = a1;
  v11 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x19AEC174C](v10);
  v8 = (void *)MEMORY[0x19AEC174C]();

  return v8;
}

+ (id)sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __123__PLDuplicateDetectorPostProcessing_sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke;
  v8[3] = &unk_1E366C200;
  v9 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x19AEC174C](v8);
  v6 = (void *)MEMORY[0x19AEC174C]();

  return v6;
}

uint64_t __123__PLDuplicateDetectorPostProcessing_sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unsigned int v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v32;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shortValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shortValue");

  if (v9 == 1 || v12 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kind"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "shortValue");

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kind"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = v16 | objc_msgSend(v18, "shortValue");

    v19 = (_DWORD)v15 != 0;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("rjPacked"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_msgSend(v21, "unsignedIntValue") >> 1) & 3;

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("rjPacked"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntValue");

    if (v22 - 1 >= 2)
    {
      if (v22)
        v26 = 1;
      else
        v26 = ((v25 >> 1) & 3) - 3 < 0xFFFFFFFE;
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalStableHash"));
    v29 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalStableHash"));
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = (objc_msgSend((id)v29, "isEqualToString:", v31) & 1) != 0 || (v31 | v29) == 0;
    if (v19 || v26)
    {
      v27 = 0;
    }
    else
    {
      if (v9 != 1)
        v32 = 1;
      v27 = v12 != 1 || v32;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

uint64_t __121__PLDuplicateDetectorPostProcessing_sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap___block_invoke(uint64_t a1, void *a2, void *a3, void **a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v39;

  v7 = a2;
  v8 = a3;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("PLDuplicateDetectorPostProcessing.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  if (!*a4)
  {
    *a4 = objc_alloc_init(PLDuplicateDetectorLivePhotoContext);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kind"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shortValue");

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "shortValue");

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalStableHash"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "shortValue") == 1;

      v20 = *a4;
      +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:isSharedLibrary:](PLDuplicateDetectorLivePhotoContextData, "dataWithSubtype:isSharedLibrary:", v14, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addFingerprint:contextData:", v16, v21);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("kindSubtype"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "shortValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("additionalAttributes.originalStableHash"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("activeLibraryScopeParticipationState"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "shortValue");

  if ((_DWORD)v24 == 2
    && (v30 = *a4,
        +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:isSharedLibrary:](PLDuplicateDetectorLivePhotoContextData, "dataWithSubtype:isSharedLibrary:", 0, v29 != 1), v31 = (void *)objc_claimAutoreleasedReturnValue(), LOBYTE(v30) = objc_msgSend(v30, "hasFingerprint:contextData:", v26, v31), v31, (v30 & 1) != 0))
  {
    v32 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("kind"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "shortValue");

    if (!v35)
    {
      v36 = *a4;
      +[PLDuplicateDetectorLivePhotoContextData dataWithSubtype:isSharedLibrary:](PLDuplicateDetectorLivePhotoContextData, "dataWithSubtype:isSharedLibrary:", v24, v29 == 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addFingerprint:contextData:", v26, v37);

    }
    v32 = 0;
  }

  return v32;
}

uint64_t __98__PLDuplicateDetectorPostProcessing__postProcessSortOIDs_oidMetadataMap_sortKey_secondarySortKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "reverse"))
    v7 = v6;
  else
    v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "reverse"))
    v10 = v5;
  else
    v10 = v6;
  objc_msgSend(*(id *)(a1 + 32), "key");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v9;
  v14 = v12;
  v15 = (void *)v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    if (v13 | v14)
    {
      if (v13)
        v17 = 1;
      else
        v17 = -1;
LABEL_31:

      goto LABEL_32;
    }
LABEL_17:
    if (objc_msgSend(*(id *)(a1 + 40), "reverse"))
      v18 = v6;
    else
      v18 = v5;
    objc_msgSend(*(id *)(a1 + 40), "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 40), "reverse"))
      v21 = v5;
    else
      v21 = v6;
    objc_msgSend(*(id *)(a1 + 40), "key");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v20;
    v24 = v23;
    v15 = (void *)v24;
    if (v13 && v24)
    {
      v17 = objc_msgSend((id)v13, "compare:", v24);
    }
    else
    {
      v25 = -1;
      if (v13)
        v25 = 1;
      if (v13 | v24)
      {
        v17 = v25;
      }
      else
      {
        v15 = 0;
        v13 = 0;
        v17 = 0;
      }
    }
    goto LABEL_31;
  }
  v17 = objc_msgSend((id)v13, "compare:", v14);

  if (!v17)
    goto LABEL_17;
LABEL_32:

  return v17;
}

@end
