@implementation PXMemoriesRelatedTapToRadarService

+ (BOOL)isServiceAvailableForProviders:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedCollection"), (_QWORD)v11) & 1) != 0|| (objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierMemory")) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (id)title
{
  return CFSTR("Tap-to-Radar (Memories/Related)");
}

- (BOOL)canProvideConsoleDescription
{
  return 1;
}

- (id)consoleDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v16)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v17 = v4;
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v4);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v5, "registeredIdentifiers");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v5, "itemForIdentifier:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v3, "length"))
                objc_msgSend(v3, "appendString:", CFSTR("\n"));
              objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@\n"), v11, v12);

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }

        v4 = v17 + 1;
      }
      while (v17 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v16);
  }

  return v3;
}

- (id)_libraryStatDictionary
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__247465;
  v13 = __Block_byref_object_dispose__247466;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D719A8], "systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke;
  v6[3] = &unk_1E5148AA8;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)_providerItemsSummary
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v38;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v28 = v3;
        v4 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v3);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v4, "registeredIdentifiers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v34;
          v30 = v5;
          v31 = v4;
          v29 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v34 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (objc_msgSend(v10, "containsString:", CFSTR("com.apple.miro")))
              {
                v11 = (id)objc_msgSend(v4, "itemForIdentifier:", v10);
              }
              else
              {
                objc_msgSend(v4, "itemForIdentifier:", v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v32, "objectForKey:", v10);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  v14 = (void *)objc_msgSend(v13, "mutableCopy");

                  if (!v14)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v15 = objc_msgSend(v14, "count");
                  objc_msgSend(v12, "uuid");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "objectForKey:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = (void *)objc_msgSend(v17, "mutableCopy");

                  if (!v18)
                  {
                    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  v19 = objc_msgSend(v18, "count");
                  objc_msgSend(v18, "objectForKey:", v16);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v20)
                  {
                    +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", v12);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "setObject:forKey:", v21, v16);

                  }
                  if (objc_msgSend(v18, "count") > v19)
                  {
                    objc_msgSend(v18, "valueForKey:", v16);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v22, CFSTR("summaryInfo"), v12, CFSTR("providerItem"), 0);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "setObject:forKey:", v23, v16);

                  }
                  v8 = v29;
                  if (objc_msgSend(v14, "count") > v15)
                    objc_msgSend(v32, "setObject:forKey:", v14, v10);

                  v5 = v30;
                  v4 = v31;
                }

              }
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v7);
        }

        v3 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v27);
  }

  return v32;
}

- (id)parseProviderItemsSummary:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  void *v44;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  SEL v59;
  uint8_t buf[16];
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[8];
  _QWORD v70[5];
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[5];
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t v88;
  const __CFString *v89;
  _BYTE v90[128];
  _QWORD v91[3];

  v91[1] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "objectForKey:", CFSTR("providerItemSummary"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__247465;
  v84 = __Block_byref_object_dispose__247466;
  v85 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__247465;
  v78[4] = __Block_byref_object_dispose__247466;
  v79 = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__247465;
  v76 = __Block_byref_object_dispose__247466;
  v77 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__247465;
  v70[4] = __Block_byref_object_dispose__247466;
  v71 = 0;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke;
  v69[3] = &unk_1E513E250;
  v69[4] = &v80;
  v69[5] = v78;
  v69[6] = &v72;
  v69[7] = v70;
  objc_msgSend(v52, "enumerateKeysAndObjectsUsingBlock:", v69);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v55, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setSortDescriptors:", v8);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v55);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v51, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v66 != v13)
          objc_enumerationMutation(v11);
        +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("localIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v5, "setObject:forKey:", v15, v16);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v65, v90, 16);
    }
    while (v12);
  }

  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("listOfMemoriesSummaries"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v73[5];
  if (v17)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_3;
    v63[3] = &unk_1E5148268;
    v64 = v53;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v63);

  }
  objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("listOfSummaries"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendFormat:", CFSTR("More details can be found in the attachments, but here is the high level library stats:\n"));
  objc_msgSend(v18, "appendFormat:", CFSTR("\n ======== Library Summary Stat =======\n"));
  objc_msgSend(v54, "objectForKey:", CFSTR("libraryStatSummary"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_4;
  v61[3] = &unk_1E5148268;
  v19 = v18;
  v62 = v19;
  objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v61);
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("summaryDescription"));
  objc_msgSend((id)v81[5], "objectForKey:", CFSTR("summaryInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v81[5])
  {
    objc_msgSend((id)v73[5], "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v81[5];
    v81[5] = v22;

    objc_msgSend((id)v81[5], "objectForKey:", CFSTR("summaryInfo"));
    v24 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v24;
    if (!v81[5])
      goto LABEL_18;
  }
  if (v20)
  {
    objc_msgSend(v20, "objectForKey:", CFSTR("referenceOrigin"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v81[5], "objectForKey:", CFSTR("summaryInfo"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v81[5], "objectForKey:", CFSTR("providerItem"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("Related")))
    {
      objc_msgSend(v47, "objectForKey:", CFSTR("momentLocalIdentifiers"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }

    }
    else
    {
      objc_msgSend(v47, "objectForKey:", CFSTR("localIdentifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v25, CFSTR("referenceOrigin"), v44, CFSTR("providerItem"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKey:", v33, v28);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v73[5];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_195;
      v56[3] = &unk_1E513E278;
      v59 = a2;
      v56[4] = self;
      v57 = v25;
      v36 = v34;
      v58 = v36;
      objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v56);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKey:", v48, CFSTR("referenceObjectIdentifier"));
      objc_msgSend(v37, "setObject:forKey:", v36, CFSTR("collectionIdentifiers"));
      objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("identifiers"));
      v38 = v4;

    }
    else
    {
      PLUIGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v39, OS_LOG_TYPE_ERROR, "Error - Local Identifier for a reference object wasn't set", buf, 2u);
      }

      if (a4)
      {
        v40 = (void *)MEMORY[0x1E0CB35C8];
        v86 = *MEMORY[0x1E0CB2D50];
        v87 = CFSTR("Error - Local Identifier for a reference object wasn't set");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Photos.TTR.metadataSnapshot"), 2, v41);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v42 = v4;
    }

  }
  else
  {
LABEL_18:
    PLUIGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_ERROR, "Error - the main reference object (Moment / Memory) was not found. Please try to capture the data once all results were fully loaded on the screen.", buf, 2u);
    }

    if (a4)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v88 = *MEMORY[0x1E0CB2D50];
      v89 = CFSTR("Error - the main reference object (Moment / Memory) was not found. Please try to capture the data once all results were fully loaded on the screen.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Photos.TTR.metadataSnapshot"), 2, v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = v4;
  }

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(&v80, 8);

  return v4;
}

- (id)collectProviderItemsSummaryAndLibraryStat
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesRelatedTapToRadarService _providerItemsSummary](self, "_providerItemsSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("providerItemSummary"));
  -[PXMemoriesRelatedTapToRadarService _libraryStatDictionary](self, "_libraryStatDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("libraryStatSummary"));

  return v3;
}

- (id)tapToRadarURLWithTitle:(id)a3 descriptionString:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesRelatedTapToRadarService.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title && descriptionString"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("Title"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics"), CFSTR("ExtensionIdentifiers"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("Serious Bug"), CFSTR("Classification"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("Always"), CFSTR("Reproducibility"));
  v25 = v9;
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("Description"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("819256"), CFSTR("ComponentID"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("all"), CFSTR("ComponentVersion"));
  objc_msgSend(v10, "setObject:forKey:", CFSTR("Photos Media Mining (New Bugs)"), CFSTR("ComponentName"));
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v13, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "queryItemWithName:value:", v18, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  objc_msgSend(v11, "setQueryItems:", v12);
  objc_msgSend(v11, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)writeGraphData:(id)a3 errorsList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0;
  objc_msgSend(a3, "requestExportGraphForPurpose:error:", CFSTR("snapshot"), &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== requestExportGraphForPurpose:snapshot ==\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("Failed writing Memories/Related Graph State - ERROR(%@)\n"), v7);
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "== requestExportGraphForPurpose:snapshot ==\nFailed writing Memories/Related Graph State - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(v5, "addObject:", v8);
  }

  return v6;
}

- (id)writeGraphStatistics:(id)a3 errorsList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v22 = 0;
  objc_msgSend(a3, "requestGraphStatisticsWithOptions:error:", MEMORY[0x1E0C9AA70], &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D716E8], "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("GraphStatistics.txt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v21 = 0;
      v14 = objc_msgSend(v13, "writeToURL:options:error:", v12, 1073741825, &v21);
      v15 = v21;
      if ((v14 & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("Graph Statistics is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Photos.TTR.metadataSnapshot"), 3, v17);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== writing Graph statistics ==\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("Failed writing Graph Statistics - ERROR(%@)\n"), v15);
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "== writing Graph statistics ==\nFailed writing Graph Statistics - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(v5, "addObject:", v18);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== requestGraphStatistic ==\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("Failed obtaining Graph Statistics - ERROR(%@)\n"), v7);
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "== requestGraphStatistic ==\nFailed obtaining Graph Statistics - ERROR(%@)\n", buf, 0xCu);
  }

  objc_msgSend(v5, "addObject:", v8);
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)writePeopleContactSuggestionsGraphStatistics:(id)a3 errorsList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v22 = 0;
  objc_msgSend(a3, "requestGraphStatisticsWithOptions:error:", &unk_1E53F0F48, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D716E8], "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("PeopleContactSuggestions.txt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v21 = 0;
      v14 = objc_msgSend(v13, "writeToURL:options:error:", v12, 1073741825, &v21);
      v15 = v21;
      if ((v14 & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v24 = CFSTR("Graph Statistics is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Photos.TTR.metadataSnapshot"), 3, v17);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== writing Graph statistics ==\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendFormat:", CFSTR("Failed writing Graph Statistics - ERROR(%@)\n"), v15);
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "== writing Graph statistics ==\nFailed writing Graph Statistics - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(v5, "addObject:", v18);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== requestGraphStatistic ==\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("Failed obtaining People Contact Suggestions Graph Statistics - ERROR(%@)\n"), v7);
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "== requestGraphStatistic ==\nFailed obtaining Graph Statistics - ERROR(%@)\n", buf, 0xCu);
  }

  objc_msgSend(v5, "addObject:", v8);
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)writeMemoriesSummary:(id)a3 analysisClient:(id)a4 errorsList:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  char v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  id obj;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKey:", CFSTR("listOfMemoriesSummaries"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D716E8], "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Memories"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__247465;
    v37 = __Block_byref_object_dispose__247466;
    v38 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id *)(v34 + 5);
    obj = (id)v34[5];
    v17 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &obj);
    objc_storeStrong(v16, obj);

    v32 = v17;
    if (*((_BYTE *)v30 + 24))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__PXMemoriesRelatedTapToRadarService_writeMemoriesSummary_analysisClient_errorsList___block_invoke;
      v22[3] = &unk_1E513E2A0;
      v26 = &v33;
      v23 = v14;
      v27 = &v29;
      v24 = v11;
      v25 = v9;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);

      v18 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== writing summary list ==\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendFormat:", CFSTR("Failed writing Memories/Related summary list - ERROR(%@)\n"), v34[5]);
      PLUIGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = v34[5];
        *(_DWORD *)buf = 138412290;
        v40 = v20;
        _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "== writing summary list ==\nFailed writing Memories/Related summary list - ERROR(%@)\n", buf, 0xCu);
      }

      objc_msgSend(v9, "addObject:", v18);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);

  }
  return v11;
}

- (id)writeLibraryStatistics:(id)a3 analysisClient:(id)a4 errorsList:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(a3, "objectForKey:", CFSTR("libraryStatSummary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D716E8], "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("LibraryStatistics.plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20;
    v13 = v20;
    v14 = objc_msgSend(v12, "writeToURL:options:error:", v10, 0, &v19);
    v15 = v19;

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== writing library statistics summary ==\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendFormat:", CFSTR("Failed writing Library Statistics List - ERROR(%@)\n"), v15);
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "== writing library statistics summary ==\nFailed writing Library Statistics List - ERROR(%@)\n", buf, 0xCu);
      }

      objc_msgSend(v6, "addObject:", v16);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)writeErrorsToErrorLog:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ErrorsSnapshotMemoriesAndRelated.log"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D716E8], "memoriesAndRelatedDiagnosticsOutputURLWithPathManager:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 100, 0, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v15;
  if (!objc_msgSend(v9, "length")
    || (v14 = v10,
        v11 = objc_msgSend(v9, "writeToURL:options:error:", v8, 1073741825, &v14),
        v12 = v14,
        v10,
        v10 = v12,
        (v11 & 1) == 0))
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed writing an error log due to an error - %@\n", buf, 0xCu);
    }

  }
}

- (id)diagnosticFilesForPeopleContactSuggestionWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoAnalysisClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(MEMORY[0x1E0D716E8], "createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:", v7);
  -[PXMemoriesRelatedTapToRadarService writeGraphData:errorsList:](self, "writeGraphData:errorsList:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesRelatedTapToRadarService writePeopleContactSuggestionsGraphStatistics:errorsList:](self, "writePeopleContactSuggestionsGraphStatistics:errorsList:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesRelatedTapToRadarService writeGraphStatistics:errorsList:](self, "writeGraphStatistics:errorsList:", v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "addObject:", v9);
  if (v10)
    objc_msgSend(v13, "addObject:", v10);
  if (v11)
    objc_msgSend(v13, "addObject:", v11);

  return v13;
}

- (id)snapshotMemoriesRelatedResults:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _QWORD *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  NSObject *v34;
  void *v35;
  id *v36;
  id *v37;
  NSObject *v38;
  void *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint8_t v55[16];
  _QWORD v56[5];
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  _QWORD v62[5];
  _QWORD v63[6];
  _QWORD v64[6];
  id v65;
  __int128 buf;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoAnalysisClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  -[PXMemoriesRelatedTapToRadarService parseProviderItemsSummary:error:](self, "parseProviderItemsSummary:error:", v6, &v65);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v65;
  v11 = v10;
  if (a4 && v10)
  {
    v12 = objc_retainAutorelease(v10);
    *a4 = v12;
    objc_msgSend(v12, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v13);

  }
  v14 = (void *)MEMORY[0x1E0D716E8];
  objc_msgSend(v7, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v14, "createOrEmptyMemoriesRelatedSnapshotOutputFolderWithPathManager:", v15);

  v17 = (void *)objc_msgSend(v54, "mutableCopy");
  v18 = -[PXMemoriesRelatedTapToRadarService writeGraphData:errorsList:](self, "writeGraphData:errorsList:", v8, v9);
  v19 = -[PXMemoriesRelatedTapToRadarService writeGraphStatistics:errorsList:](self, "writeGraphStatistics:errorsList:", v8, v9);
  v20 = -[PXMemoriesRelatedTapToRadarService writeMemoriesSummary:analysisClient:errorsList:](self, "writeMemoriesSummary:analysisClient:errorsList:", v17, v8, v9);
  v21 = -[PXMemoriesRelatedTapToRadarService writeLibraryStatistics:analysisClient:errorsList:](self, "writeLibraryStatistics:analysisClient:errorsList:", v6, v8, v9);
  if (!v11)
  {
    objc_msgSend(v17, "objectForKey:", CFSTR("identifiers"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectForKey:", CFSTR("referenceObjectIdentifier"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "objectForKey:", CFSTR("referenceOrigin"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== Unknown Reference Object Type Error ==\n"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
        objc_msgSend(v51, "appendFormat:", CFSTR("Reference Object Info:\n(%@)\n"), v52);
      else
        objc_msgSend(v51, "appendFormat:", CFSTR("Reference Object is nil\n"));
      PLUIGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v51;
        _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_ERROR, "%@\n", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v9, "addObject:", v51);
      -[PXMemoriesRelatedTapToRadarService writeErrorsToErrorLog:](self, "writeErrorsToErrorLog:", v9);
      v22 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v17, "setObject:forKey:", v53, CFSTR("referenceObjectType"));
    if ((objc_msgSend(v53, "isEqualToString:", CFSTR("Moment")) & 1) != 0
      || (objc_msgSend(v53, "isEqualToString:", CFSTR("Related")) & 1) != 0
      || (objc_msgSend(v53, "isEqualToString:", CFSTR("Collection")) & 1) != 0
      || (objc_msgSend(v53, "isEqualToString:", CFSTR("Memory")) & 1) != 0)
    {
      v25 = 1;
      v44 = 1;
    }
    else
    {
      v44 = objc_msgSend(v53, "isEqualToString:", CFSTR("One Up"));
      v25 = 0;
    }
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v53;
      _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEBUG, "Snapshotting Memories and Related has started with reference object type %@.", (uint8_t *)&buf, 0xCu);
    }

    if (v44)
    {
      if (v25)
      {
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke;
        v64[3] = &unk_1E513E2C8;
        v27 = v64;
        v28 = v48;
        v64[4] = v28;
        v64[5] = v9;
        objc_msgSend(v8, "requestSnapshotServiceForRelatedWithMomentLocalIdentifier:reply:", v28, v64);
      }
      else
      {
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_308;
        v63[3] = &unk_1E513E2C8;
        v27 = v63;
        v29 = v48;
        v63[4] = v29;
        v63[5] = v9;
        objc_msgSend(v8, "requestSnapshotServiceForRelatedWithAssetLocalIdentifier:reply:", v29, v63);
      }

    }
    objc_msgSend(v17, "objectForKey:", CFSTR("listOfSummaries"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__247465;
    v69 = __Block_byref_object_dispose__247466;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (id)objc_claimAutoreleasedReturnValue();
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_311;
    v62[3] = &unk_1E513E2F0;
    v62[4] = &buf;
    objc_msgSend(v51, "enumerateKeysAndObjectsUsingBlock:", v62);
    objc_msgSend(v54, "objectForKey:", CFSTR("identifiers"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("referenceObjectIdentifier"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKey:", CFSTR("collectionIdentifiers"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v30;
    if (!objc_msgSend(v47, "count") || !objc_msgSend(v46, "count"))
    {
LABEL_35:
      if (objc_msgSend(v9, "count"))
      {
        -[PXMemoriesRelatedTapToRadarService writeErrorsToErrorLog:](self, "writeErrorsToErrorLog:", v9);
        if (a4)
        {
          objc_msgSend(v9, "firstObject");
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      PLUIGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v55 = 0;
        _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_DEBUG, "Snapshotting Memories and Related results has completed.", v55, 2u);
      }

      if (objc_msgSend(v9, "count"))
        v39 = 0;
      else
        v39 = v17;
      v22 = v39;

      _Block_object_dispose(&buf, 8);
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v47, "allKeys");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v53, "isEqualToString:", CFSTR("One Up")))
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "allKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_2;
      v59[3] = &unk_1E513E318;
      v59[4] = v9;
      v60 = v32;
      v61 = v42;
      v45 = v60;
      objc_msgSend(v8, "requestSnapshotServiceForRelatedDebugInfoBetweenAssetForLocalIdentifier:andRelatedResultsForLocalIdentifiers:relatedType:reply:", v61, v60, 63, v59);
      v33 = v59;
    }
    else
    {
      if (!v44)
      {
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_320;
      v56[3] = &unk_1E513E318;
      v56[4] = v9;
      v57 = v35;
      v58 = v42;
      v45 = v57;
      objc_msgSend(v8, "requestSnapshotServiceForRelatedDebugInfoBetweenMomentForLocalIdentifier:andRelatedResultsForLocalIdentifiers:relatedType:additionalSnapshotSummaryInfo:reply:", v58, v57, 63, v41, v56);
      v33 = v56;
    }
    v36 = (id *)(v33 + 4);
    v37 = (id *)(v33 + 5);

    goto LABEL_34;
  }
  if (objc_msgSend(v9, "count"))
    -[PXMemoriesRelatedTapToRadarService writeErrorsToErrorLog:](self, "writeErrorsToErrorLog:", v9);
  v22 = 0;
LABEL_45:

  return v22;
}

- (BOOL)canProvideContextualViewController
{
  void *v2;
  char v3;

  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableGraphService");

  return v3;
}

- (BOOL)canProvideSettingsViewController
{
  return 1;
}

- (id)contextualViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[PXMemoriesRelatedTapToRadarService canProvideConsoleDescription](self, "canProvideConsoleDescription"))
    return 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PXMemoriesRelatedTapToRadarService_contextualViewController__block_invoke;
  v6[3] = &unk_1E5148158;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F20], "px_viewControllerWithOutput:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMemoriesRelatedTapToRadarService title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  return v3;
}

uint64_t __62__PXMemoriesRelatedTapToRadarService_contextualViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consoleDescription");
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== requestSnapshotServiceForRelatedWithMomentLocalIdentifier:%@ ==\n"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Failed writing Memories/Related related results - ERROR(%@)\n"), v4);
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "== requestSnapshotServiceForRelatedWithMomentLocalIdentifier:%@ ==\nFailed writing Memories/Related related results - ERROR(%@)\n", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_308(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== requestSnapshotServiceForRelatedWithAssetLocalIdentifier:%@ ==\n"), *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("Failed writing Memories/Related related results - ERROR(%@)\n"), v4);
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "== requestSnapshotServiceForRelatedWithAssetLocalIdentifier:%@ ==\nFailed writing Memories/Related related results - ERROR(%@)\n", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_311(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("referenceOrigin"));
  objc_msgSend(v2, "objectForKey:", CFSTR("momentLocalIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("localIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  if (objc_msgSend(v3, "count"))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v2, v7);

  }
}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed writing related debug info - ERROR(%@)\n"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed writing related debug info - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR("; "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("== writing related debugInfo between asset(%@) and related results(%@) ==\n"), *(_QWORD *)(a1 + 48), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "== writing related debugInfo between asset(%@) and related results(%@) ==\n", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }

}

void __75__PXMemoriesRelatedTapToRadarService_snapshotMemoriesRelatedResults_error___block_invoke_320(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed writing related debug info - ERROR(%@)\n"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Failed writing related debug info - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 40), "componentsJoinedByString:", CFSTR("; "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("== writing related debugInfo between moment(%@) and related results(%@) ==\n"), *(_QWORD *)(a1 + 48), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "== writing related debugInfo between moment(%@) and related results(%@) ==\n", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }

}

void __85__PXMemoriesRelatedTapToRadarService_writeMemoriesSummary_analysisClient_errorsList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB38B0];
  v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  obj = 0;
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v7, 200, 0, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v6, obj);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "pathComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("plist"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v24 = *(id *)(v18 + 40);
  LOBYTE(v14) = objc_msgSend(v9, "writeToURL:options:error:", v17, 0, &v24);
  objc_storeStrong((id *)(v18 + 40), v24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (_BYTE)v14;
  v19 = *(void **)(a1 + 40);
  objc_msgSend(v17, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("== writing summary list ==\n"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "appendFormat:", CFSTR("Failed writing Memories/Related summary list - ERROR(%@)\n"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    PLUIGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v23;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "== writing summary list ==\nFailed writing Memories/Related summary list - ERROR(%@)\n", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
  }

}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  __int128 v16;

  v14 = a2;
  v8 = a3;
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("PXDiagnosticsItemIdentifierRelatedReferenceObject")))
  {
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = a1[5];
LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(v13 + 8) + 40), a2);
    goto LABEL_7;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("PXDiagnosticsItemIdentifierMemory")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    v13 = a1[7];
    goto LABEL_6;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_2;
  v15[3] = &unk_1E513E228;
  v16 = *((_OWORD *)a1 + 2);
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
LABEL_7:
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) && *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    *a4 = 1;

}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("summaryInfo"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("localIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v4);

}

uint64_t __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@ = %@\n"), a2, a3);
}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_195(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("summaryInfo"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("providerItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 40), CFSTR("referenceOrigin"), v5, CFSTR("providerItem"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v7, v6);

}

void __70__PXMemoriesRelatedTapToRadarService_parseProviderItemsSummary_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("summaryInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("category"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "integerValue") == 201)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }

  }
}

void __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke_2;
  v3[3] = &unk_1E51402B8;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D716E8], "collectMomentsStatWithLibraryContext:completionBlock:", v2, v3);

}

uint64_t __60__PXMemoriesRelatedTapToRadarService__libraryStatDictionary__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40), "addEntriesFromDictionary:", a2);
  return result;
}

@end
