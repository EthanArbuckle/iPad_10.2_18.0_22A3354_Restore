@implementation PGBirthdayContextualRule

- (PGBirthdayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 loggingConnection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PGBirthdayContextualRule *v15;
  PGBirthdayContextualRule *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGBirthdayContextualRule;
  v15 = -[PGBirthdayContextualRule init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_graph, a3);
    objc_storeStrong((id *)&v16->_photoLibrary, a4);
    objc_storeStrong((id *)&v16->_curationManager, a5);
    objc_storeStrong((id *)&v16->_loggingConnection, a6);
  }

  return v16;
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSArray *v22;
  NSArray *availablePersons;
  NSUInteger v24;
  NSObject *loggingConnection;
  NSArray *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[4];
  PGBirthdayContextualRule *v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  NSUInteger v44;
  __int16 v45;
  NSArray *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "localTodayComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "month");
  v9 = objc_msgSend(v7, "day");
  +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesIncludingMeInGraph:", self->_graph);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke;
  v34[3] = &unk_1E8430DA8;
  v34[4] = self;
  v37 = v8;
  v38 = v9;
  v12 = v5;
  v35 = v12;
  v13 = v6;
  v36 = v13;
  v28 = v10;
  objc_msgSend(v10, "enumerateNodesUsingBlock:", v34);
  +[PGGraphPersonNode personScoreSortDescriptors](PGGraphPersonNode, "personScoreSortDescriptors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortUsingDescriptors:", v14);

  v15 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v31[0] = v11;
  v31[1] = 3221225472;
  v31[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_131;
  v31[3] = &unk_1E8430DD0;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v16;
  v17 = v15;
  v33 = v17;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v31);
  objc_storeStrong((id *)&self->_personNodeByLocalIdentifier, v15);
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v13, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fetchedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_2;
  v29[3] = &unk_1E8430DF8;
  v21 = v16;
  v30 = v21;
  objc_msgSend(v20, "sortedArrayUsingComparator:", v29);
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availablePersons = self->_availablePersons;
  self->_availablePersons = v22;

  v24 = -[NSArray count](self->_availablePersons, "count");
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_availablePersons;
    *(_DWORD *)buf = 138413059;
    v40 = self;
    v41 = 1024;
    v42 = v24 != 0;
    v43 = 2048;
    v44 = v24;
    v45 = 2113;
    v46 = v26;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d, for %lu persons: %{private}@", buf, 0x26u);
  }

  return v24 != 0;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  id v62;
  id v63;
  void *v64;
  NSObject *loggingConnection;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void (**v79)(id, void *, void *, uint64_t, char *, double);
  uint64_t v80;
  NSArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  unsigned int v92;
  void *v93;
  PGBirthdayContextualRule *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  char v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _QWORD v117[2];
  _BYTE buf[12];
  __int16 v119;
  void *v120;
  uint64_t v121;

  v12 = a4;
  v121 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v75 = a5;
  v14 = a6;
  v74 = a7;
  v79 = (void (**)(id, void *, void *, uint64_t, char *, double))a8;
  if (v79 && -[NSArray count](self->_availablePersons, "count"))
  {
    objc_msgSend(v78, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "endDate");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v15 && v16)
    {
      v89 = v14;
      v112 = 0;
      -[NSArray firstObject](self->_availablePersons, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "librarySpecificFetchOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v92 = v12;
      +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:](PGHighlightEnrichmentUtilities, "internalPredicateForFetchingAssetsForSharingFilter:", v12);
      v21 = objc_claimAutoreleasedReturnValue();
      v71 = v17;
      v72 = v15;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlightBeingExtendedAssets != nil && dateCreated >= %@ && dateCreated <= %@"), v15, v17);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0CB3528];
      v69 = (void *)v22;
      v70 = (void *)v21;
      v117[0] = v21;
      v117[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "andPredicateWithSubpredicates:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v20;
      objc_msgSend(v20, "setInternalPredicate:", v25);

      v88 = (void *)objc_opt_new();
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v26 = self->_availablePersons;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v109 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
            v32 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v31, v87);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "count"))
            {
              objc_msgSend(v33, "fetchedObjects");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "localIdentifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "setObject:forKeyedSubscript:", v34, v35);

            }
            objc_autoreleasePoolPop(v32);
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
        }
        while (v28);
      }

      v14 = v89;
      if (objc_msgSend(v88, "count"))
      {
        objc_msgSend(v78, "localDateComponents");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "localTodayComponents");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        v68 = v36;
        objc_msgSend(v38, "setYear:", objc_msgSend(v36, "year"));
        objc_msgSend(v38, "setMonth:", objc_msgSend(v37, "month"));
        v67 = v37;
        objc_msgSend(v38, "setDay:", objc_msgSend(v37, "day"));
        objc_msgSend(v38, "setHour:", 12);
        objc_msgSend(v38, "setMinute:", 0);
        v66 = v38;
        objc_msgSend(v38, "setSecond:", 0);
        v39 = v92;
        objc_msgSend(v78, "childHighlightItemsForHighlightFilter:", v92);
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
        if (v77)
        {
          v76 = *(_QWORD *)v105;
          v94 = self;
LABEL_17:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v105 != v76)
            {
              v41 = v40;
              objc_enumerationMutation(obj);
              v40 = v41;
            }
            v80 = v40;
            v42 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v40);
            v100 = 0u;
            v101 = 0u;
            v102 = 0u;
            v103 = 0u;
            v81 = self->_availablePersons;
            v84 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
            if (v84)
            {
              v82 = v42;
              v83 = *(_QWORD *)v101;
              while (2)
              {
                for (j = 0; j != v84; ++j)
                {
                  if (*(_QWORD *)v101 != v83)
                    objc_enumerationMutation(v81);
                  v44 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
                  v45 = (void *)MEMORY[0x1CAA4EB2C]();
                  v93 = v44;
                  objc_msgSend(v44, "localIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "objectForKeyedSubscript:", v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  -[PGBirthdayContextualRule _filterCuratedAssets:forHighlightItem:](self, "_filterCuratedAssets:forHighlightItem:", v47, v42);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v48, "count"))
                  {
                    v86 = v48;
                    v85 = j;
                    objc_msgSend(v14, "fetchChildHighlightItemsForHighlightItem:sharingFilter:", v42, v39);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v96 = 0u;
                    v97 = 0u;
                    v98 = 0u;
                    v99 = 0u;
                    v95 = v49;
                    v50 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
                    if (v50)
                    {
                      v51 = v50;
                      v90 = 0;
                      v91 = 0;
                      v52 = *(_QWORD *)v97;
                      v53 = -1.79769313e308;
                      do
                      {
                        for (k = 0; k != v51; ++k)
                        {
                          if (*(_QWORD *)v97 != v52)
                            objc_enumerationMutation(v95);
                          v55 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * k);
                          v56 = (void *)MEMORY[0x1CAA4EB2C]();
                          if (MEMORY[0x1CAA4E418](objc_msgSend(v14, "visibilityStateForHighlightItem:sharingFilter:", v55, v39)))
                          {
                            v57 = v47;
                            -[PGBirthdayContextualRule _fetchCuratedAssetsForHighlightItem:intersectingAssets:](v94, "_fetchCuratedAssetsForHighlightItem:intersectingAssets:", v55, v47);
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            if (objc_msgSend(v58, "count"))
                            {
                              *(_QWORD *)buf = 0;
                              -[PGBirthdayContextualRule _bestAssetInCuratedAssets:forPerson:contextualScore:](v94, "_bestAssetInCuratedAssets:forPerson:contextualScore:", v58, v93, buf);
                              v59 = (void *)objc_claimAutoreleasedReturnValue();
                              v60 = v59;
                              if (v59)
                              {
                                v61 = *(double *)buf;
                                if (*(double *)buf <= v53)
                                {
                                  v61 = v53;
                                }
                                else
                                {
                                  v62 = v59;

                                  v63 = v55;
                                  v90 = v63;
                                  v91 = v62;
                                  v14 = v89;
                                }
                              }
                              else
                              {
                                v61 = v53;
                              }

                              v53 = v61;
                              v39 = v92;
                            }

                            v47 = v57;
                          }
                          objc_autoreleasePoolPop(v56);
                        }
                        v51 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
                      }
                      while (v51);
                    }
                    else
                    {
                      v90 = 0;
                      v91 = 0;
                      v53 = -1.79769313e308;
                    }

                    if (v91)
                    {
                      v79[2](v79, v91, v90, v82, &v112, v53);

                      objc_autoreleasePoolPop(v45);
                      self = v94;
                      goto LABEL_52;
                    }
                    self = v94;
                    v42 = v82;
                    j = v85;
                    v64 = v90;
                  }
                  else
                  {

                    v64 = 0;
                  }

                  objc_autoreleasePoolPop(v45);
                }
                v84 = -[NSArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
                if (v84)
                  continue;
                break;
              }
            }
LABEL_52:

            if (v112)
              break;
            v40 = v80 + 1;
            if (v80 + 1 == v77)
            {
              v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
              if (v77)
                goto LABEL_17;
              break;
            }
          }
        }

      }
      v17 = v71;
      v15 = v72;
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v15;
        v119 = 2112;
        v120 = v17;
        _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "[PGBirthdayContextualRule] Unable to enumerate contextual key assets, year highlight missing date info: startDate = %@, endDate = %@", buf, 0x16u);
      }
    }

  }
}

- (id)_filterCuratedAssets:(id)a3 forHighlightItem:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "predicateWithFormat:", CFSTR("creationDate >= %@ && creationDate <= %@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_fetchCuratedAssetsForHighlightItem:(id)a3 intersectingAssets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PGBirthdayContextualRule _filterCuratedAssets:forHighlightItem:](self, "_filterCuratedAssets:forHighlightItem:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "extendedCuratedAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)_bestAssetInCuratedAssets:(id)a3 forPerson:(id)a4 contextualScore:(double *)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v39;
  id obj;
  id v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  objc_msgSend(v39, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v6, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v6;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v45)
  {
    v42 = 0;
    v43 = *(_QWORD *)v52;
    v8 = 0.5;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v52 != v43)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v11, "localIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = objc_msgSend(v13, "count");
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v48 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              objc_msgSend(v19, "personLocalIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v7);

              if ((v21 & 1) != 0)
              {
                v22 = v19;

                if (v22)
                {
                  v23 = (double)(unint64_t)objc_msgSend(v11, "pixelWidth");
                  v24 = 1.3333 / (v23 / (double)(unint64_t)objc_msgSend(v11, "pixelHeight"));
                  objc_msgSend(v22, "size");
                  v26 = v25 * v24;
                  v27 = 0.0;
                  if (v26 >= 0.05 && v26 <= v8)
                  {
                    if (v26 <= 0.15)
                    {
                      v27 = v26 / 0.15;
                    }
                    else
                    {
                      v27 = (0.5 - v26) / 0.35;
                      v8 = 0.5;
                      if (v26 >= 0.5)
                        v27 = 0.0;
                    }
                  }
                  v29 = ceil(v27 * 4.0) * 0.25;
                  objc_msgSend(v11, "overallAestheticScore");
                  v31 = ceil(v30 * 10.0) / 10.0;
                  objc_msgSend(v11, "curationScore");
                  v33 = 1.0 / (double)v46 + v29 * 0.1 + v31 * 0.01 + ceil(v32 * 10.0) / 10.0 * 0.01;
                  objc_msgSend(v22, "quality");
                  v35 = v33 + fmax(v34, 0.0) * 0.001;
                  if (!v42 || v35 > v9)
                  {
                    v36 = v11;

                    *a5 = v35;
                    v42 = v36;
                    v9 = v35;
                  }
                }
                goto LABEL_29;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v16)
              continue;
            break;
          }
        }

        v22 = 0;
LABEL_29:

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v45);
  }
  else
  {
    v42 = 0;
  }

  v37 = v42;
  return v37;
}

- (id)_bestBirthdayCelebrationAssetForHighlightNode:(id)a3 assetCollection:(id)a4 curationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGKeyAssetCurationOptions *v14;
  PGCurationManager *curationManager;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCurationManager curationCriteriaFactory](self->_curationManager, "curationCriteriaFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "curationCriteriaWithCollection:meaningLabel:inGraph:client:", v10, CFSTR("Birthday"), v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(PGKeyAssetCurationOptions);
  curationManager = self->_curationManager;
  objc_msgSend(v10, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGCurationManager curatedKeyAssetForCollectionUUID:curatedAssetCollection:options:criteria:curationContext:](curationManager, "curatedKeyAssetForCollectionUUID:curatedAssetCollection:options:criteria:curationContext:", v16, v9, v14, v13, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_personNodeByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_availablePersons, 0);
}

void __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isMeNode") & 1) != 0
    || (objc_msgSend(v3, "isFavorite") & 1) != 0
    || (objc_msgSend(v3, "collection"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "socialGroupNodes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v4,
        v6))
  {
    objc_msgSend(v3, "birthdayDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v3, "potentialBirthdayDateComponents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
LABEL_13:

        goto LABEL_14;
      }
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v13 = 138477827;
        v14 = v3;
        _os_log_debug_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEBUG, "No birthday date found for %{private}@, taking the potential birthday.", (uint8_t *)&v13, 0xCu);
      }
    }
    if (objc_msgSend(v7, "month") == *(_QWORD *)(a1 + 56) && objc_msgSend(v7, "day") == *(_QWORD *)(a1 + 64))
    {
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v13 = 138477827;
        v14 = v3;
        _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "Can provide contextual asset for person %{private}@", (uint8_t *)&v13, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
      v10 = *(void **)(a1 + 48);
      objc_msgSend(v3, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
    goto LABEL_13;
  }
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138477827;
    v14 = v3;
    _os_log_debug_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEBUG, "Skipping person %{private}@, not part of any social groups nor favorited.", (uint8_t *)&v13, 0xCu);
  }
LABEL_14:

}

void __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_131(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(v5, "localIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v7);
}

uint64_t __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(a3, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

@end
