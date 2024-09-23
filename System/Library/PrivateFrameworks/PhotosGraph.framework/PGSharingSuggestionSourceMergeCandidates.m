@implementation PGSharingSuggestionSourceMergeCandidates

- (PGSharingSuggestionSourceMergeCandidates)initWithServiceManager:(id)a3
{
  id v5;
  PGSharingSuggestionSourceMergeCandidates *v6;
  PGSharingSuggestionSourceMergeCandidates *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGSharingSuggestionSourceMergeCandidates;
  v6 = -[PGSharingSuggestionSourceMergeCandidates init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceManager, a3);

  return v7;
}

- (id)name
{
  return CFSTR("Merge Candidates");
}

- (id)details
{
  return CFSTR("Return suggestions by replacing unverified person by their verified merge candidates");
}

- (double)weight
{
  return 0.6;
}

- (BOOL)canRunWithOptions:(id)a3
{
  return objc_msgSend(a3, "replaceMergeCandidates");
}

- (id)filterMeNodePredicateForInput:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "meNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contactIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v6, "momentNodes"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v13))
  {
    v14 = v11;
  }
  else
  {
    -[CLSServiceManager mePerson](self->_serviceManager, "mePerson");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CNIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v7, "librarySpecificFetchOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUri == %@"), v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setPredicate:", v23);

      objc_msgSend(v22, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v26;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier != %@"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v16);

  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("personUri != %@"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  if (objc_msgSend(v15, "count") == 1)
  {
    objc_msgSend(v15, "firstObject");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((unint64_t)objc_msgSend(v15, "count") < 2)
    {
      v19 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v18;
LABEL_14:

  return v19;
}

- (id)suggestedResultsForInput:(id)a3 withOptions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  NSObject *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id obj;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  uint64_t v87;
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
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _QWORD v104[4];
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  uint8_t v110[128];
  uint8_t buf[4];
  id v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _QWORD v116[2];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v84 = a4;
  objc_msgSend(v5, "momentNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v5;
  objc_msgSend(v5, "graph");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v107;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v107 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        v14 = (void *)objc_opt_new();
        v104[0] = v11;
        v104[1] = 3221225472;
        v104[2] = __81__PGSharingSuggestionSourceMergeCandidates_suggestedResultsForInput_withOptions___block_invoke;
        v104[3] = &unk_1E8434020;
        v15 = v14;
        v105 = v15;
        objc_msgSend(v13, "enumeratePersonNodesUsingBlock:", v104);
        objc_msgSend(v13, "localIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
          objc_msgSend(v83, "setObject:forKeyedSubscript:", v15, v16);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v117, 16);
    }
    while (v9);
  }

  objc_msgSend(v70, "moments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharingSuggestionSourceMergeCandidates filterMeNodePredicateForInput:photoLibrary:](self, "filterMeNodePredicateForInput:photoLibrary:", v70, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype != %d && kindSubtype != %d"), 10, 103);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v20;
  objc_msgSend(v20, "setInternalPredicate:", v21);

  objc_msgSend(v18, "librarySpecificFetchOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPersonContext:", 3);
  if (v19)
    objc_msgSend(v22, "setPredicate:", v19);
  v69 = v18;
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType == %d || verifiedType == %d) && type != %d"), 2, 1, -1);
  v24 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v24;
  v68 = (void *)v19;
  if (v19)
  {
    v25 = (void *)MEMORY[0x1E0CB3528];
    v116[0] = v24;
    v116[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPredicate:", v27);

  }
  else
  {
    objc_msgSend(v23, "setPredicate:", v24);
  }
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v71 = v17;
  v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v115, 16);
  if (v78)
  {
    v73 = v22;
    v74 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v78; ++j)
      {
        if (*(_QWORD *)v101 != v74)
          objc_enumerationMutation(v71);
        v29 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
        v30 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v29, v75);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v31, "count"))
        {
          v81 = v30;
          v82 = j;
          v32 = v29;
          v33 = objc_msgSend(v31, "count");
          v34 = (uint64_t)v32;
          if (v33 != objc_msgSend(v32, "estimatedAssetCount"))
          {
            objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v31, 0);
            v34 = objc_claimAutoreleasedReturnValue();

          }
          v79 = (void *)v34;
          v80 = v31;
          objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", v34, v22);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "localIdentifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "objectForKeyedSubscript:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v38 = v35;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
          if (v39)
          {
            v40 = v39;
            v86 = v37;
            v87 = *(_QWORD *)v97;
            v85 = v38;
            do
            {
              for (k = 0; k != v40; ++k)
              {
                if (*(_QWORD *)v97 != v87)
                  objc_enumerationMutation(v38);
                v42 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
                v43 = (void *)MEMORY[0x1CAA4EB2C]();
                if (objc_msgSend(v42, "verifiedType"))
                {
                  objc_msgSend(v42, "localIdentifier");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v37, "containsObject:", v44);

                  if ((v45 & 1) == 0)
                    objc_msgSend(v7, "addObject:", v42);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v42, v23);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v46, "count"))
                  {
                    v47 = v23;
                    v94 = 0u;
                    v95 = 0u;
                    v92 = 0u;
                    v93 = 0u;
                    v48 = v46;
                    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
                    if (v49)
                    {
                      v50 = v49;
                      v51 = *(_QWORD *)v93;
                      do
                      {
                        for (m = 0; m != v50; ++m)
                        {
                          if (*(_QWORD *)v93 != v51)
                            objc_enumerationMutation(v48);
                          objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * m));
                        }
                        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v92, v113, 16);
                      }
                      while (v50);
                    }

                    v23 = v47;
                    v38 = v85;
                    v37 = v86;
                  }
                  else if (objc_msgSend(v84, "includeUnverified") && objc_msgSend(v42, "faceCount") >= 8)
                  {
                    objc_msgSend(v7, "addObject:", v42);
                  }

                }
                objc_autoreleasePoolPop(v43);
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v96, v114, 16);
            }
            while (v40);
          }

          v22 = v73;
          v30 = v81;
          j = v82;
          v31 = v80;
        }

        objc_autoreleasePoolPop(v30);
      }
      v78 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v100, v115, 16);
    }
    while (v78);
  }

  if (!objc_msgSend(v71, "count"))
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "loggingConnection");
    v54 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v112 = obj;
      _os_log_error_impl(&dword_1CA237000, v54, OS_LOG_TYPE_ERROR, "No asset collections fetched for %@", buf, 0xCu);
    }

  }
  v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v56 = v7;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v89;
    do
    {
      for (n = 0; n != v58; ++n)
      {
        if (*(_QWORD *)v89 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * n);
        objc_msgSend(v61, "localIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "personNodeForPersonLocalIdentifier:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
          v64 = v63;
        else
          v64 = v61;
        -[PGSharingSuggestionSource suggestionResultWithPerson:](self, "suggestionResultWithPerson:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObject:", v65);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
    }
    while (v58);
  }

  return v55;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
}

void __81__PGSharingSuggestionSourceMergeCandidates_suggestedResultsForInput_withOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "localIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
