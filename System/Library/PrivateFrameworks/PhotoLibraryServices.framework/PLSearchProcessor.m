@implementation PLSearchProcessor

- (PLSearchProcessor)initWithDatabase:(id)a3
{
  id v5;
  PLSearchProcessor *v6;
  PLSearchProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchProcessor;
  v6 = -[PLSearchProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchIndex, a3);

  return v7;
}

- (void)performQuery:(id)a3 withResultsHandler:(id)a4
{
  -[PLSearchProcessor performQuery:disableWildcardMatchesForUserControlledCategories:withResultsHandler:](self, "performQuery:disableWildcardMatchesForUserControlledCategories:withResultsHandler:", a3, 0, a4);
}

- (void)performQuery:(id)a3 disableWildcardMatchesForUserControlledCategories:(BOOL)a4 withResultsHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  NSObject *v20;
  PLSearchProcessor *v21;
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  PLSearchBackendQueryGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: will perform search query: %@", buf, 0xCu);
    }

    objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);
    v14 = v12;
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SearchProcessor-PerformQuery", ", buf, 2u);
    }

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke;
    v18[3] = &unk_1E366B7F8;
    v19 = v8;
    v20 = v15;
    v23 = v13;
    v21 = self;
    v22 = v9;
    v16 = v15;
    objc_msgSend(v19, "runWithResultsHandler:disableWildcardMatchesForUserControlledCategories:", v18, v6);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Expected query.", buf, 2u);
    }

    if (v9)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, MEMORY[0x1E0C9AA60]);
    }
    else
    {
      PLSearchBackendQueryGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_FAULT, "Expected resultsHandler.", buf, 2u);
      }

    }
  }

}

- (id)searchResultSectionsForQuery:(id)a3 withAssetResults:(id)a4 assetResultsForCompletions:(id)a5 collectionResults:(id)a6 combineAssetSections:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  PLSearchResultSection *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void (**v45)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v46;
  PLSearchResultSection *v47;
  PLSearchResultSection *v48;
  NSObject *v49;
  NSObject *v50;
  id v51;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  id v55;
  unint64_t v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  PLSearchProcessor *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _QWORD v64[5];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v57 = a7;
  v82 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v55 = a6;
  v60 = self;
  objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);
  v16 = v14;
  v17 = v16;
  v56 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "SearchProcessor-ResultSections", ", buf, 2u);
  }
  spid = v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
  v62 = v18;
  v63 = v17;
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v75 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
        if (objc_msgSend(v25, "categoryMask", spid, v55) == 0x800000)
        {
          if (v22)
          {
            v26 = v17;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v25, "groupDescription");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v80 = v27;
              _os_log_fault_impl(&dword_199541000, v26, OS_LOG_TYPE_FAULT, "Favorite asset search result has already been found for group result: %@", buf, 0xCu);

              v18 = v62;
            }

            v17 = v63;
          }
          else
          {
            v22 = v25;
          }
        }
        else
        {
          objc_msgSend(v18, "addObject:", v25);
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    }
    while (v21);
  }
  else
  {
    v22 = 0;
  }

  v28 = objc_msgSend(v18, "count");
  v29 = MEMORY[0x1E0C809B0];
  if (v28)
  {
    if (v57)
    {
      -[PLSearchProcessor _numberOfAssetsSortDescriptors](v60, "_numberOfAssetsSortDescriptors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sortedArrayUsingDescriptors:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[PLSearchResultSection initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:]([PLSearchResultSection alloc], "initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:", 1, 0x8000000, v31, v13);
      objc_msgSend(v59, "addObject:", v32);

    }
    else
    {
      -[PLSearchProcessor _searchResultsByCategoryMasksForSearchResults:](v60, "_searchResultsByCategoryMasksForSearchResults:", v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v29;
      v70[1] = 3221225472;
      v70[2] = __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke;
      v70[3] = &unk_1E366B820;
      v70[4] = v60;
      v71 = v11;
      v72 = v13;
      v73 = v59;
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v70);

    }
  }
  v58 = v13;
  v61 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", spid);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v36 = v55;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v67 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        v42 = objc_msgSend(v41, "collectionType");
        v43 = v33;
        if (v42 != 3)
        {
          if (objc_msgSend(v41, "collectionType") == 2)
            v43 = v34;
          else
            v43 = v35;
        }
        objc_msgSend(v43, "addObject:", v41);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    }
    while (v38);
  }

  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke_2;
  v64[3] = &unk_1E366B848;
  v64[4] = v60;
  v44 = v59;
  v65 = v44;
  v45 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v64);
  if (objc_msgSend(v33, "count") || v22)
  {
    -[PLSearchProcessor _sortDescriptorsForCategoryMask:](v60, "_sortDescriptorsForCategoryMask:", 256);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sortUsingDescriptors:", v46);
    if (v22)
      objc_msgSend(v33, "insertObject:atIndex:", v22, 0);
    v47 = [PLSearchResultSection alloc];
    v48 = -[PLSearchResultSection initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:](v47, "initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:", 2, 256, v33, MEMORY[0x1E0C9AA60]);
    objc_msgSend(v44, "addObject:", v48);

  }
  if (objc_msgSend(v34, "count"))
    ((void (**)(_QWORD, uint64_t, uint64_t, void *))v45)[2](v45, 2, 4096, v34);
  if (objc_msgSend(v35, "count"))
    ((void (**)(_QWORD, uint64_t, uint64_t, void *))v45)[2](v45, 2, -1, v35);
  v49 = v63;
  v50 = v49;
  if (v56 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v50, OS_SIGNPOST_INTERVAL_END, spida, "SearchProcessor-ResultSections", ", buf, 2u);
  }

  v51 = v44;
  return v51;
}

- (id)updatedSearchSections:(id)a3 withTopCollectionResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  PLSearchResultSection *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v25 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "categoryMask");
        if ((objc_msgSend(v13, "resultTypes") & 2) != 0 && v14 == -1)
        {
          v15 = objc_msgSend(v6, "count");
          objc_msgSend(v13, "searchResults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v15 < v17)
          {
            -[PLSearchProcessor _sortDescriptorsForCategoryMask:](self, "_sortDescriptorsForCategoryMask:", -1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "sortedArrayUsingDescriptors:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = [PLSearchResultSection alloc];
            v21 = objc_msgSend(v13, "resultTypes");
            v22 = -[PLSearchResultSection initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:](v20, "initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:", v21, -1, v19, MEMORY[0x1E0C9AA60]);

            v13 = (id)v22;
          }
        }
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)completionSuggestionsForQuery:(id)a3 withSearchSections:(id)a4 numberOfSuggestions:(unint64_t)a5
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  double v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  CFAllocatorRef v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned __int16 v84;
  void *v85;
  void *v86;
  int v87;
  unint64_t v88;
  BOOL v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  unint64_t v95;
  double v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  PSIQueryToken *v118;
  CFMutableSetRef Mutable;
  CFMutableSetRef v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t m;
  const __CFArray *v126;
  CFIndex Count;
  const __CFArray *v128;
  CFIndex v129;
  void *v130;
  id v131;
  void (**v132)(_QWORD, _QWORD);
  id v133;
  id v134;
  void (**v135)(_QWORD, _QWORD);
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t n;
  uint64_t v141;
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t ii;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t jj;
  uint64_t v152;
  id v153;
  id v154;
  id v155;
  id v156;
  NSObject *v157;
  NSObject *v158;
  id v159;
  os_signpost_id_t spid;
  id v162;
  void *v163;
  NSObject *v164;
  unint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  id obj;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  void *v174;
  id v175;
  PLSearchProcessor *v176;
  void (**v177)(_QWORD, _QWORD);
  void *v179;
  void (**v180)(_QWORD, _QWORD);
  unint64_t v181;
  id v182;
  id v183;
  void *v184;
  unint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  CFAllocatorRef allocator;
  const __CFAllocator *allocatora;
  char v191;
  id v192;
  id v193;
  void *v194;
  void (**v195)(_QWORD, _QWORD);
  void (**v196)(_QWORD, _QWORD);
  void (**v197)(_QWORD, _QWORD);
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  int v204;
  uint64_t v205;
  uint64_t v206;
  void (**v207)(_QWORD, _QWORD);
  uint64_t v208;
  void *v209;
  void *v210;
  int v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void (**v217)(_QWORD, _QWORD);
  void *v218;
  void *v219;
  id v220;
  id v221;
  void *v222;
  void *v223;
  id v224;
  _QWORD v225[4];
  id v226;
  id v227;
  id v228;
  _QWORD v229[4];
  id v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _QWORD v243[4];
  id v244;
  id v245;
  id v246;
  id v247;
  id v248;
  id v249;
  id v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  _QWORD v259[4];
  id v260;
  id v261;
  _QWORD v262[4];
  id v263;
  id v264;
  _QWORD v265[4];
  id v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  _QWORD v283[4];
  id v284;
  _QWORD v285[4];
  id v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  _QWORD v295[5];
  uint8_t buf[16];
  _BYTE v297[128];
  _BYTE v298[128];
  _BYTE v299[128];
  _BYTE v300[128];
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  _BYTE v304[128];
  _BYTE v305[128];
  _BYTE v306[128];
  _BYTE v307[128];
  uint64_t v308;

  v308 = *MEMORY[0x1E0C80C00];
  v221 = a3;
  v7 = a4;
  v176 = self;
  objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  v165 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-CompletionSuggestions", ", buf, 2u);
  }
  spid = v9;
  v164 = v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v295[0] = MEMORY[0x1E0C809B0];
  v295[1] = 3221225472;
  v295[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke;
  v295[3] = &unk_1E3675128;
  v295[4] = v176;
  v163 = (void *)MEMORY[0x19AEC174C](v295);
  v291 = 0u;
  v292 = 0u;
  v293 = 0u;
  v294 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v291, v307, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v292;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v292 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v291 + 1) + 8 * i);
        v287 = 0u;
        v288 = 0u;
        v289 = 0u;
        v290 = 0u;
        objc_msgSend(v18, "searchResults");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v287, v306, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v288;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v288 != v22)
                objc_enumerationMutation(v19);
              v24 = objc_msgSend(*(id *)(*((_QWORD *)&v287 + 1) + 8 * j), "assetCount");
              if (v15 <= v24)
                v15 = v24;
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v287, v306, 16);
          }
          while (v21);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v291, v307, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "searchText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v221, "tokenizer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "normalizeString:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v181 = objc_msgSend(v29, "length");
  v30 = MEMORY[0x1E0C809B0];
  v285[0] = MEMORY[0x1E0C809B0];
  v285[1] = 3221225472;
  v285[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3;
  v285[3] = &unk_1E366B870;
  v162 = v27;
  v286 = v162;
  v195 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v285);
  v283[0] = v30;
  v283[1] = 3221225472;
  v283[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4;
  v283[3] = &unk_1E366B870;
  v183 = v29;
  v284 = v183;
  v197 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v283);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v221, "suggestionWhitelistedScenes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v174 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)v25;
  v34 = (void *)v26;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = 0u;
  v280 = 0u;
  v281 = 0u;
  v282 = 0u;
  obj = v12;
  v187 = (void *)v26;
  v188 = v33;
  v171 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v279, v305, 16);
  if (v171)
  {
    v35 = 0;
    v170 = *(_QWORD *)v280;
    v36 = (double)v15;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v280 != v170)
          objc_enumerationMutation(obj);
        v172 = v37;
        v38 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * v37);
        if (objc_msgSend(v38, "categoryMask") == 0x400000000)
        {
          objc_msgSend(v38, "searchResults");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchProcessor _completionFilenameResultsForFilenameResults:](v176, "_completionFilenameResultsForFilenameResults:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v38, "assetSearchResultsForCompletions");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (v42)
            objc_msgSend(v38, "assetSearchResultsForCompletions");
          else
            objc_msgSend(v38, "searchResults");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v278 = 0u;
        v277 = 0u;
        v276 = 0u;
        v275 = 0u;
        v43 = v40;
        v44 = -[__CFAllocator countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v275, v304, 16);
        if (v44)
        {
          v45 = v44;
          v185 = 0;
          v46 = *(_QWORD *)v276;
          allocator = v43;
          v199 = *(_QWORD *)v276;
          do
          {
            v47 = 0;
            v206 = v45;
            do
            {
              if (*(_QWORD *)v276 != v46)
                objc_enumerationMutation(v43);
              v48 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * v47);
              objc_msgSend(v48, "groupResult");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v34, "containsObject:", v49) & 1) == 0)
              {
                objc_msgSend(v34, "addObject:", v49);
                objc_msgSend(v49, "fullSearchTextGroupSnapshot");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v50, "category") == 1203)
                {
                  v215 = v48;
                  v51 = 1;
                  if ((v35 & 1) == 0)
                  {
                    if (v50)
                      goto LABEL_48;
LABEL_46:
                    if (objc_msgSend(v49, "isDateFilterPartiallyFromFullSearchText"))
                    {
                      objc_msgSend(v49, "dateFilterGroupSnapshot");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v50)
                        goto LABEL_48;
                    }
                    else
                    {
                      v50 = 0;
                    }
                  }
                }
                else
                {
                  v52 = objc_msgSend(v50, "category") == 1204;
                  if ((v52 & v35 & 1) != 0)
                  {
                    v51 = 1;
                  }
                  else
                  {
                    v215 = v48;
                    v51 = v52 | v35;
                    if (!v50)
                      goto LABEL_46;
LABEL_48:
                    ((void (**)(_QWORD, void *))v195)[2](v195, v50);
                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                    v201 = objc_msgSend(v213, "length");
                    ((void (**)(_QWORD, void *))v197)[2](v197, v50);
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    v208 = objc_msgSend(v222, "length");
                    v53 = (int)objc_msgSend(v50, "category");
                    v54 = PLSearchIndexCategoryMaskForCategory(v53);
                    v204 = v53;
                    v55 = PLSearchUserCategoryForCategory(v53);
                    v56 = v55;
                    v218 = v50;
                    v211 = v51;
                    if (v54 != 2)
                      goto LABEL_61;
                    v191 = v55;
                    v274 = 0u;
                    v273 = 0u;
                    v272 = 0u;
                    v271 = 0u;
                    objc_msgSend(v221, "queryTokens");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v271, v303, 16);
                    if (!v58)
                      goto LABEL_60;
                    v59 = v58;
                    v60 = *(_QWORD *)v272;
                    while (2)
                    {
                      for (k = 0; k != v59; ++k)
                      {
                        if (*(_QWORD *)v272 != v60)
                          objc_enumerationMutation(v57);
                        v62 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * k);
                        if ((objc_msgSend(v62, "belongsToSearchText") & 1) == 0
                          && (objc_msgSend(v62, "userCategory") == 8 || !objc_msgSend(v62, "userCategory")))
                        {
                          objc_msgSend(v221, "tokenizer");
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v62, "text");
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v63, "normalizeString:", v64);
                          v65 = (void *)objc_claimAutoreleasedReturnValue();
                          v66 = objc_msgSend(v65, "compare:options:", v222, 10);

                          if (!v66)
                          {
                            v34 = v187;
                            v33 = v188;
                            v43 = allocator;
                            goto LABEL_68;
                          }
                        }
                      }
                      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v271, v303, 16);
                      if (v59)
                        continue;
                      break;
                    }
LABEL_60:

                    v34 = v187;
                    v33 = v188;
                    v43 = allocator;
                    v56 = v191;
                    v50 = v218;
LABEL_61:
                    objc_msgSend(v194, "setObject:forKey:", v50, v49);
                    if (((0x7FFFFC10FEuLL >> v56) & 1) != 0)
                      objc_msgSend(v184, "addObject:", v49);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v50, "groupId"));
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v33, "containsObject:", v57) & 1) == 0)
                    {
                      objc_msgSend(v33, "addObject:", v57);
                      objc_msgSend(v222, "rangeOfString:options:", v183, 2);
                      if (v67)
                      {
                        if (v208 == v181)
                        {
                          objc_msgSend(v179, "setObject:forKey:", &unk_1E375F240, v49);
                          ++v185;
                          goto LABEL_68;
                        }
                        if (v185 <= a5)
                        {
                          objc_msgSend(v218, "matchRanges");
                          v68 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v68, "firstObject");
                          v69 = (void *)objc_claimAutoreleasedReturnValue();
                          v192 = (id)objc_msgSend(v69, "rangeValue");

                          v209 = v68;
                          if (v204 != 2100)
                            goto LABEL_79;
                          if (objc_msgSend(v68, "count") != 1)
                            goto LABEL_79;
                          objc_msgSend(v218, "groupRanges");
                          v70 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v70, "lastObject");
                          v71 = (void *)objc_claimAutoreleasedReturnValue();
                          v72 = objc_msgSend(v71, "rangeValue");

                          if (v192 != (id)v72)
                            goto LABEL_79;
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            objc_msgSend(v167, "setObject:forKeyedSubscript:", v215, v57);
                            objc_msgSend(v221, "tokenizer");
                            v73 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v215, "contentStrings");
                            v74 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v74, "firstObject");
                            v75 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v73, "normalizeString:", v75);
                            v76 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v168, "setObject:forKeyedSubscript:", v76, v57);

                            v77 = 1;
                          }
                          else
                          {
LABEL_79:
                            v77 = 0;
                          }
                          objc_msgSend(v218, "tokens");
                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                          v267 = 0u;
                          v268 = 0u;
                          v269 = 0u;
                          v270 = 0u;
                          v79 = v78;
                          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v267, v302, 16);
                          if (v80)
                          {
                            v81 = v80;
                            v82 = *(_QWORD *)v268;
LABEL_82:
                            v83 = 0;
                            while (1)
                            {
                              if (*(_QWORD *)v268 != v82)
                                objc_enumerationMutation(v79);
                              if (!objc_msgSend(v203, "containsObject:", *(_QWORD *)(*((_QWORD *)&v267 + 1) + 8 * v83)))break;
                              if (v81 == ++v83)
                              {
                                v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v267, v302, 16);
                                if (v81)
                                  goto LABEL_82;
                                goto LABEL_88;
                              }
                            }

                            v43 = allocator;
                            v84 = v204;
                            if (v181 <= 2 && (v204 & 0xFFFFFFFE) == 0x5DC)
                            {
                              objc_msgSend(v213, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
                              v85 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v85, "capitalizedString");
                              v86 = (void *)objc_claimAutoreleasedReturnValue();

                              if ((objc_msgSend(v174, "containsObject:", v86) & 1) == 0)
                              {
                                objc_msgSend(v179, "setObject:forKey:", &unk_1E375F258, v49);

                                goto LABEL_116;
                              }

                              v84 = v204;
                            }
                            v87 = 1;
                            if (v84 <= 0x577u)
                            {
                              v88 = v201;
                              if (v84 - 1200 >= 6)
LABEL_103:
                                v87 = 0;
LABEL_105:
                              v90 = 1.0 - (double)(unint64_t)v192 / (double)v88;
                              v91 = v90 + -0.5;
                              if (v90 + -0.5 < 0.0)
                                v91 = 0.0;
                              if (v90 == 1.0)
                                v92 = 1.0 - (double)(unint64_t)v192 / (double)v88;
                              else
                                v92 = v91;
                              -[PLSearchProcessor _scoreForSearchIndexCategory:](v176, "_scoreForSearchIndexCategory:");
                              v94 = v93;
                              if (v77)
                                v95 = objc_msgSend(v215, "assetCount");
                              else
                                v95 = objc_msgSend(v49, "matchCount");
                              v96 = v94 * 0.25
                                  + v92 * 0.3
                                  + (double)v95 / v36 * 0.25
                                  + (1.0 - (double)v185 / ((double)a5 + -1.0)) * 0.2;
                              if (v87)
                                v96 = v96 * 0.5;
                              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v96);
                              v97 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v179, "setObject:forKey:", v97, v49);

                              v185 += v87 ^ 1u;
                              goto LABEL_116;
                            }
                            if (v84 > 0x897u)
                            {
                              if (v84 != 2200)
                              {
                                v89 = v84 == 2300;
LABEL_102:
                                v88 = v201;
                                if (!v89)
                                  goto LABEL_103;
                                goto LABEL_105;
                              }
                            }
                            else if (v84 - 1400 >= 2)
                            {
                              v89 = v84 == 2100;
                              goto LABEL_102;
                            }
                            v88 = v201;
                            goto LABEL_105;
                          }
LABEL_88:

                          v43 = allocator;
LABEL_116:

                        }
                      }
                    }
LABEL_68:

                    v46 = v199;
                    v45 = v206;
                    v50 = v218;
                    v51 = v211;
                  }
                }

                v35 = v51;
              }

              ++v47;
            }
            while (v47 != v45);
            v98 = -[__CFAllocator countByEnumeratingWithState:objects:count:](v43, "countByEnumeratingWithState:objects:count:", &v275, v304, 16);
            v45 = v98;
          }
          while (v98);
        }

        v37 = v172 + 1;
      }
      while (v172 + 1 != v171);
      v171 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v279, v305, 16);
    }
    while (v171);
  }

  objc_msgSend(v179, "keyEnumerator");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "allObjects");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = MEMORY[0x1E0C809B0];
  v265[0] = MEMORY[0x1E0C809B0];
  v265[1] = 3221225472;
  v265[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_21;
  v265[3] = &unk_1E366B898;
  v173 = v179;
  v266 = v173;
  objc_msgSend(v100, "sortedArrayUsingComparator:", v265);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v262[0] = v101;
  v262[1] = 3221225472;
  v262[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2_23;
  v262[3] = &unk_1E366B8C0;
  v182 = v167;
  v263 = v182;
  v180 = v195;
  v264 = v180;
  v196 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v262);
  v259[0] = v101;
  v259[1] = 3221225472;
  v259[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3_24;
  v259[3] = &unk_1E366B8C0;
  v175 = v168;
  v260 = v175;
  v177 = v197;
  v261 = v177;
  v207 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v259);
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = v166;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v166, "count"));
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = 0u;
  v256 = 0u;
  v257 = 0u;
  v258 = 0u;
  v193 = v102;
  v186 = v103;
  v205 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v255, v301, 16);
  if (v205)
  {
    v202 = *(_QWORD *)v256;
    allocatora = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
LABEL_122:
    v105 = 0;
    while (1)
    {
      if (*(_QWORD *)v256 != v202)
        objc_enumerationMutation(v193);
      v106 = *(void **)(*((_QWORD *)&v255 + 1) + 8 * v105);
      if (objc_msgSend(v104, "count") >= a5)
        goto LABEL_153;
      objc_msgSend(v194, "objectForKey:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v207)[2](v207, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = objc_msgSend(v107, "category");
      v110 = PLSearchUserCategoryForCategory(v109);
      PLSearchedCategoriesSpecificToUserCategory(v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "objectForKeyedSubscript:", v108);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v112)
        break;
      v113 = v112;
      if ((objc_msgSend(v112, "containsIndexes:", v111) & 1) == 0
        && (((0x7FFFFC10FEuLL >> v110) & 1) != 0
         || PLExclusiveCategoriesIsSupersetOfSearchedCategories(v113)))
      {
        goto LABEL_132;
      }
LABEL_151:

      if (++v105 == v205)
      {
        v205 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v255, v301, 16);
        if (v205)
          goto LABEL_122;
        goto LABEL_153;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "setObject:forKeyedSubscript:", v113, v108);
LABEL_132:
    objc_msgSend(v113, "addIndexes:", v111);
    v216 = v111;
    v219 = v108;
    if (v109 == 2100)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v107, "groupId"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "objectForKeyedSubscript:", v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v115 = 0;
    }
    if (v115)
      v116 = 1;
    else
      v116 = 2;
    v223 = v107;
    ((void (**)(_QWORD, void *))v196)[2](v196, v107);
    v117 = objc_claimAutoreleasedReturnValue();
    PLSearchedCategoriesForUserCategory(v110);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = (void *)v117;
    v118 = -[PSIQueryToken initWithText:userCategory:searchedCategories:matchType:]([PSIQueryToken alloc], "initWithText:userCategory:searchedCategories:matchType:", v117, v110, v210, v116);
    v214 = v115;
    if (v115)
    {
      Mutable = CFSetCreateMutable(allocatora, 0, 0);
      v120 = CFSetCreateMutable(allocatora, 0, 0);
      v251 = 0u;
      v252 = 0u;
      v253 = 0u;
      v254 = 0u;
      objc_msgSend(v115, "groupResults");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v251, v300, 16);
      if (v122)
      {
        v123 = v122;
        v124 = *(_QWORD *)v252;
        do
        {
          for (m = 0; m != v123; ++m)
          {
            if (*(_QWORD *)v252 != v124)
              objc_enumerationMutation(v121);
            -[__CFSet addObjectsFromArray:](Mutable, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v251 + 1) + 8 * m), "assetIds"));
          }
          v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v251, v300, 16);
        }
        while (v123);
      }

      -[PSIQueryToken setAssetIds:](v118, "setAssetIds:", Mutable);
      v103 = v186;
    }
    else
    {
      v126 = (const __CFArray *)objc_msgSend(v106, "assetIds");
      Count = CFArrayGetCount(v126);
      Mutable = CFSetCreateMutable(allocatora, Count, 0);
      -[__CFSet addObjectsFromArray:](Mutable, "addObjectsFromArray:", v126);
      -[PSIQueryToken setAssetIds:](v118, "setAssetIds:", Mutable);
      v128 = (const __CFArray *)objc_msgSend(v106, "collectionIds");
      v129 = CFArrayGetCount(v128);
      v120 = CFSetCreateMutable(allocatora, v129, 0);
      -[__CFSet addObjectsFromArray:](v120, "addObjectsFromArray:", v128);
    }
    -[PSIQueryToken setCollectionIds:](v118, "setCollectionIds:", v120);

    v104 = v166;
    objc_msgSend(v166, "addObject:", v118);
    objc_msgSend(v198, "setObject:forKey:", v106, v118);
    v108 = v219;
    objc_msgSend(v200, "objectForKeyedSubscript:", v219);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v130)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "setObject:forKeyedSubscript:", v130, v219);
    }
    objc_msgSend(v130, "addObject:", v118);

    v107 = v223;
    v111 = v216;
    goto LABEL_151;
  }
LABEL_153:

  v243[0] = MEMORY[0x1E0C809B0];
  v243[1] = 3221225472;
  v243[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4_27;
  v243[3] = &unk_1E366B938;
  v131 = v194;
  v244 = v131;
  v220 = v182;
  v245 = v220;
  v132 = v207;
  v249 = v132;
  v133 = v200;
  v246 = v133;
  v217 = v196;
  v250 = v217;
  v224 = v162;
  v247 = v224;
  v134 = v198;
  v248 = v134;
  v135 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v243);
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  objc_msgSend(v131, "keyEnumerator");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v239, v299, 16);
  if (v137)
  {
    v138 = v137;
    v139 = *(_QWORD *)v240;
    do
    {
      for (n = 0; n != v138; ++n)
      {
        if (*(_QWORD *)v240 != v139)
          objc_enumerationMutation(v136);
        v141 = *(_QWORD *)(*((_QWORD *)&v239 + 1) + 8 * n);
        if ((objc_msgSend(v184, "containsObject:", v141) & 1) == 0)
          v135[2](v135, v141);
      }
      v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v239, v299, 16);
    }
    while (v138);
  }

  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  objc_msgSend(v221, "dedupedGroupResults");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v235, v298, 16);
  if (v143)
  {
    v144 = v143;
    v145 = *(_QWORD *)v236;
    do
    {
      for (ii = 0; ii != v144; ++ii)
      {
        if (*(_QWORD *)v236 != v145)
          objc_enumerationMutation(v142);
        v135[2](v135, *(_QWORD *)(*((_QWORD *)&v235 + 1) + 8 * ii));
      }
      v144 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v235, v298, 16);
    }
    while (v144);
  }

  v233 = 0u;
  v234 = 0u;
  v231 = 0u;
  v232 = 0u;
  v147 = v184;
  v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v231, v297, 16);
  if (v148)
  {
    v149 = v148;
    v150 = *(_QWORD *)v232;
    do
    {
      for (jj = 0; jj != v149; ++jj)
      {
        if (*(_QWORD *)v232 != v150)
          objc_enumerationMutation(v147);
        v135[2](v135, *(_QWORD *)(*((_QWORD *)&v231 + 1) + 8 * jj));
      }
      v149 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v231, v297, 16);
    }
    while (v149);
  }

  v152 = MEMORY[0x1E0C809B0];
  v229[0] = MEMORY[0x1E0C809B0];
  v229[1] = 3221225472;
  v229[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_8;
  v229[3] = &unk_1E366B960;
  v153 = v166;
  v230 = v153;
  objc_msgSend(v133, "enumerateKeysAndObjectsUsingBlock:", v229);
  v225[0] = v152;
  v225[1] = 3221225472;
  v225[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_9;
  v225[3] = &unk_1E366B988;
  v154 = v163;
  v228 = v154;
  v155 = v134;
  v226 = v155;
  v156 = v173;
  v227 = v156;
  objc_msgSend(v153, "sortUsingComparator:", v225);
  v157 = v164;
  v158 = v157;
  if (v165 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v157))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v158, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor-CompletionSuggestions", ", buf, 2u);
  }

  v159 = v153;
  return v159;
}

- (double)_scoreForSearchIndexCategory:(unint64_t)a3
{
  double result;
  double v4;
  BOOL v5;

  result = 1.0;
  if ((uint64_t)a3 <= 1520)
  {
    if ((uint64_t)a3 <= 1099)
    {
      if (a3 - 1 >= 0xE)
      {
        switch(a3)
        {
          case 0x3E8uLL:
          case 0x3E9uLL:
            result = 0.91;
            break;
          case 0x3EAuLL:
            return 0.1;
          case 0x3EBuLL:
          case 0x3ECuLL:
          case 0x3EDuLL:
          case 0x3EEuLL:
            result = 0.6;
            break;
          default:
            if (!a3)
              return 0.0;
            break;
        }
        return result;
      }
    }
    else
    {
      if ((uint64_t)a3 <= 1309)
      {
        switch(a3)
        {
          case 0x44CuLL:
          case 0x44DuLL:
          case 0x44EuLL:
            result = 0.65;
            break;
          case 0x44FuLL:
          case 0x450uLL:
          case 0x451uLL:
            return 0.7;
          default:
            switch(a3)
            {
              case 0x4B0uLL:
              case 0x4B2uLL:
              case 0x4B4uLL:
              case 0x4B5uLL:
                return 0.1;
              case 0x4B1uLL:
                result = 0.2;
                break;
              case 0x4B3uLL:
                return 0.4;
              default:
                return result;
            }
            break;
        }
        return result;
      }
      if ((uint64_t)a3 > 1400)
      {
        if ((uint64_t)a3 > 1509)
        {
          if (a3 != 1510 && a3 != 1511 && a3 != 1520)
            return result;
          return 0.55;
        }
        if (a3 == 1401)
          return 0.25;
        if (a3 == 1500 || a3 == 1501)
          return 0.55;
        return result;
      }
      if ((uint64_t)a3 <= 1329)
      {
        switch(a3)
        {
          case 0x51EuLL:
            return 0.95;
          case 0x528uLL:
            return 0.99;
          case 0x529uLL:
            return 0.1;
        }
        return result;
      }
      if (a3 - 1330 >= 2)
      {
        if (a3 != 1400)
          return result;
        return 0.4;
      }
    }
    return 0.9;
  }
  if ((uint64_t)a3 > 1899)
  {
    if ((uint64_t)a3 <= 1999)
    {
      if (a3 - 1900 <= 0x13)
        return 0.3;
      return result;
    }
    if ((uint64_t)a3 > 2499)
    {
      if ((uint64_t)a3 > 2600)
      {
        if (a3 == 2601)
          return 0.5;
        if (a3 == 2700 || a3 == 2800)
          return 0.0;
        return result;
      }
      v4 = 0.5;
      if (a3 == 2600)
        result = 0.5;
      if (a3 == 2501)
        result = 0.5;
      v5 = a3 == 2500;
    }
    else
    {
      if ((uint64_t)a3 <= 2299)
      {
        if (a3 == 2000)
          return 0.3;
        if (a3 != 2100)
        {
          if (a3 != 2200)
            return result;
          return 0.4;
        }
        return 0.1;
      }
      v4 = 0.0;
      if (a3 == 2401)
        result = 0.0;
      if (a3 == 2400)
        result = 0.0;
      v5 = a3 == 2300;
    }
    if (v5)
      return v4;
    return result;
  }
  if ((uint64_t)a3 <= 1610)
  {
    if ((uint64_t)a3 <= 1540)
    {
      if ((uint64_t)a3 > 1530)
      {
        if (a3 != 1531 && a3 != 1540)
          return result;
      }
      else if (a3 != 1521 && a3 != 1530)
      {
        return result;
      }
      return 0.55;
    }
    if ((uint64_t)a3 > 1600)
    {
      if (a3 != 1601 && a3 != 1610)
        return result;
    }
    else
    {
      if (a3 == 1541)
        return 0.55;
      if (a3 != 1600)
        return result;
    }
    return 0.7;
  }
  if ((uint64_t)a3 > 1799)
  {
    switch(a3)
    {
      case 0x708uLL:
        return 0.62;
      case 0x709uLL:
        result = 0.63;
        break;
      case 0x70AuLL:
      case 0x70BuLL:
        return 0.4;
      default:
        return result;
    }
    return result;
  }
  switch(a3)
  {
    case 0x64BuLL:
      return 0.7;
    case 0x6A4uLL:
      return 0.62;
    case 0x6A5uLL:
      return 0.4;
  }
  return result;
}

- (id)_alphabeticalSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_dateSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_numberOfAssetsSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetCount"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("keyAssetUUID"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sortDescriptorsForCategoryMask:(unint64_t)a3
{
  void *v3;

  if ((a3 & 0x3000) != 0)
  {
    -[PLSearchProcessor _dateSortDescriptors](self, "_dateSortDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((a3 & 0x100) != 0)
      -[PLSearchProcessor _alphabeticalSortDescriptors](self, "_alphabeticalSortDescriptors");
    else
      -[PLSearchProcessor _numberOfAssetsSortDescriptors](self, "_numberOfAssetsSortDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_searchResultsByCategoryMasksForSearchResults:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "categoryMask");
        v11 = v10 | 0x40041;
        if ((v10 & 0x40041) == 0)
          v11 = v10;
        if ((v11 & 0xC00) != 0)
          v11 |= 0xC00uLL;
        if ((v11 & 0x10000000000080) != 0)
          v11 |= 0x10000000000080uLL;
        if ((v11 & 0x3FC0000000000000) != 0)
          v11 |= 0x3FC0000000000000uLL;
        if ((v11 & 0xC000000000) != 0)
          v11 |= 0xC000000000uLL;
        if ((v11 & 0x207300000) != 0)
          v11 |= 0x207300000uLL;
        if ((v11 & 0x20004000) != 0)
          v11 |= 0x20004000uLL;
        if (v11 >> 62)
          v11 |= 0xC000000000000000;
        if ((v11 & 0x50008002) != 0)
          v11 |= 0x50008002uLL;
        if ((v11 & 0x80010000) != 0)
          v11 |= 0x80010000uLL;
        if ((v11 & 0x100020000) != 0)
          v11 |= 0x100020000uLL;
        if ((v11 & 0x800400000) != 0)
          v12 = v11 | 0x800400000;
        else
          v12 = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)_combinedFilenameSearchResultsFromSearchResults:(id)a3 inQuery:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  PLNamedCombinedAssetSearchResult *v30;
  void *v31;
  void *v32;
  PLNamedCombinedAssetSearchResult *v33;
  id v34;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  PLNamedCombinedAssetSearchResult *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v36 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v39 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v43;
    v38 = v6;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v12, "groupCount") == 1)
        {
          objc_msgSend(v12, "groupResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "matchRangesAtIndex:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "count") == 1)
          {
            objc_msgSend(v12, "groupResult");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "groupRangesAtIndex:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "rangeValue");
            v20 = v19;

            objc_msgSend(v14, "firstObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "rangeValue");

            if (v18 == v22)
            {
              objc_msgSend(v12, "groupResult");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "normalizedStringAtIndex:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "substringWithRange:", v18, v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v39;
              if (!v26)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v39, "count"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "setObject:forKeyedSubscript:", v26, v25);
              }
              objc_msgSend(v26, "addObject:", v12);

              v6 = v38;
            }
            else
            {
              v6 = v38;
              objc_msgSend(v38, "addObject:", v12);
              v7 = v39;
            }
          }
          else
          {
            objc_msgSend(v6, "addObject:", v12);
          }

        }
        else
        {
          objc_msgSend(v6, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __77__PLSearchProcessor__combinedFilenameSearchResultsFromSearchResults_inQuery___block_invoke;
  v40[3] = &unk_1E366B960;
  v28 = v27;
  v41 = v28;
  objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v40);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = [PLNamedCombinedAssetSearchResult alloc];
    v31 = v36;
    objc_msgSend(v36, "searchText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PLNamedCombinedAssetSearchResult initWithName:assetSearchResults:canOverlap:](v30, "initWithName:assetSearchResults:canOverlap:", v32, v29, 0);

    v46 = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v39;
  }
  else
  {
    v34 = v28;
    v31 = v36;
  }

  return v34;
}

- (id)_completionFilenameResultsForFilenameResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    v27 = v5;
    v28 = v4;
    v26 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "assetSearchResults");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_opt_class();
          objc_msgSend(v11, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_opt_class();

          if (v13 == v15)
          {
            objc_msgSend(v10, "groupResult");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "groups");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "matchRanges");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "rangeValue");
            objc_msgSend(v16, "groupRanges");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "rangeValue");

            if (v21 == v24)
            {
              v4 = v28;
              objc_msgSend(v28, "addObject:", v10);
            }
            else
            {
              v4 = v28;
              objc_msgSend(v28, "addObjectsFromArray:", v11);
            }
            v8 = v26;
            v5 = v27;
          }
          else
          {
            -[PLSearchProcessor _completionFilenameResultsForFilenameResults:](self, "_completionFilenameResultsForFilenameResults:", v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObjectsFromArray:", v16);
          }
          v7 = v30;

        }
        else
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_extractSearchResultsFromGroupResults:(id)a3 withQuery:(id)a4 resultsHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFAllocator *v16;
  uint64_t v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unint64_t v21;
  CFMutableSetRef v22;
  CFMutableSetRef v23;
  id v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t location;
  NSUInteger v46;
  NSUInteger length;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  NSUInteger v53;
  NSRange v54;
  id v55;
  NSObject *v56;
  NSObject *v57;
  double Current;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  CFAbsoluteTime v66;
  int v67;
  double v68;
  os_signpost_id_t v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  CFAbsoluteTime v75;
  int v76;
  uint64_t v77;
  char v78;
  double v79;
  os_signpost_id_t v80;
  NSObject *v81;
  NSObject *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  int v88;
  void *v89;
  uint64_t v90;
  PLAssetSearchResult *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t n;
  PLCollectionSearchResult *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  CFAbsoluteTime v112;
  double v113;
  os_signpost_id_t v114;
  NSObject *v115;
  NSObject *v116;
  void *v117;
  PLTopAssetsSearchResult *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  CFMutableArrayRef v122;
  CFAbsoluteTime v123;
  int v124;
  void *v125;
  NSObject *v126;
  void *v127;
  void (**v128)(id, void *, void *, void *, PLTopAssetsSearchResult *, void *);
  void *v129;
  PLSearchProcessor *v130;
  __CFSet *v131;
  __CFSet *v132;
  _BOOL4 v133;
  void *v134;
  unint64_t v135;
  uint64_t v136;
  id v137;
  id v138;
  id v139;
  id v140;
  CFMutableArrayRef Mutable;
  os_signpost_id_t spid;
  id spida;
  void *v144;
  id v145;
  uint64_t v146;
  BOOL v147;
  NSObject *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  uint8_t buf[4];
  CFAbsoluteTime v192;
  __int16 v193;
  int v194;
  __int16 v195;
  int v196;
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  uint64_t v203;
  NSRange v204;
  NSRange v205;

  v203 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v128 = (void (**)(id, void *, void *, void *, PLTopAssetsSearchResult *, void *))a5;
  objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
  v10 = objc_claimAutoreleasedReturnValue();
  v130 = self;
  v129 = v8;
  objc_msgSend((id)objc_opt_class(), "_OCRProcessedGroupResultsFromGroupResults:query:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tokenizer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = v9;
  objc_msgSend(v9, "searchText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "normalizeString:", v14);
  v156 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = v12;
  v159 = objc_msgSend(v12, "length");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v140 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v139 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v138 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v137 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v10);
  v19 = v10;
  v20 = v19;
  v21 = v18 - 1;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "SearchProcessor - extractSearchResults - prepareIdSets", ", buf, 2u);
  }
  spid = v18;
  v148 = v20;

  v22 = CFSetCreateMutable(v16, 0, 0);
  v23 = CFSetCreateMutable(v16, 0, 0);
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  v190 = 0u;
  v24 = v11;
  v25 = (void *)v15;
  v163 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
  v165 = (void *)v17;
  v131 = v23;
  v132 = v22;
  if (v163)
  {
    v135 = v21;
    v150 = 0;
    v154 = 0;
    v161 = *(_QWORD *)v188;
    v145 = v24;
    do
    {
      for (i = 0; i != v163; ++i)
      {
        if (*(_QWORD *)v188 != v161)
          objc_enumerationMutation(v24);
        v27 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        v186 = 0u;
        v28 = v27;
        objc_msgSend(v27, "assetIds");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v184;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v184 != v32)
                objc_enumerationMutation(v29);
              -[__CFSet addObject:](v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * j));
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v183, v201, 16);
          }
          while (v31);
        }

        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        objc_msgSend(v28, "collectionIds");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v179, v200, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v180;
          do
          {
            for (k = 0; k != v36; ++k)
            {
              if (*(_QWORD *)v180 != v37)
                objc_enumerationMutation(v34);
              -[__CFSet addObject:](v23, "addObject:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * k));
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v179, v200, 16);
          }
          while (v36);
        }

        objc_msgSend(v28, "fullSearchTextGroupSnapshot");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39 && (unsigned __int16)(objc_msgSend(v39, "category") - 1402) <= 0xFFFDu)
        {
          objc_msgSend(v40, "normalizedString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v144, "addObject:", v28);
          if (v159 >= 3)
          {
            v42 = objc_msgSend(v156, "length");
            v157 = v41;
            if (v42 <= objc_msgSend(v41, "length"))
            {
              v55 = v156;
            }
            else
            {
              objc_msgSend(v40, "groupRanges");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "firstObject");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              location = objc_msgSend(v44, "rangeValue");
              length = v46;

              v177 = 0u;
              v178 = 0u;
              v175 = 0u;
              v176 = 0u;
              v48 = v43;
              v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
              if (v49)
              {
                v50 = v49;
                v51 = *(_QWORD *)v176;
                do
                {
                  for (m = 0; m != v50; ++m)
                  {
                    if (*(_QWORD *)v176 != v51)
                      objc_enumerationMutation(v48);
                    v205.location = objc_msgSend(*(id *)(*((_QWORD *)&v175 + 1) + 8 * m), "rangeValue");
                    v205.length = v53;
                    v204.location = location;
                    v204.length = length;
                    v54 = NSUnionRange(v204, v205);
                    location = v54.location;
                    length = v54.length;
                  }
                  v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v175, v199, 16);
                }
                while (v50);
              }

              objc_msgSend(v156, "substringWithRange:", location, length);
              v55 = (id)objc_claimAutoreleasedReturnValue();

              v23 = v131;
              v22 = v132;
              v24 = v145;
            }
            v41 = v157;
            if (!objc_msgSend(v157, "compare:options:", v55, 141))
            {
              objc_msgSend(v134, "addObject:", v28);
              ++v154;
              if (objc_msgSend(v40, "category") == 1203
                || objc_msgSend(v40, "category") == 1204)
              {
                ++v150;
              }
            }

          }
        }

      }
      v163 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v187, v202, 16);
    }
    while (v163);

    v147 = v154 == v150;
    v21 = v135;
    if (v154)
      goto LABEL_48;
  }
  else
  {

  }
  v147 = 0;
LABEL_48:
  v56 = v148;
  v57 = v56;
  if (v21 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v57, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor - extractSearchResults - prepareIdSets", ", buf, 2u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  v59 = os_signpost_id_generate(v57);
  v60 = v57;
  v61 = v60;
  v62 = v156;
  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "SearchProcessor - extractSearchResults - assetUUIDByAssetId", ", buf, 2u);
  }

  -[PSIDatabase assetUUIDByAssetIdWithAssetIds:](v130->_searchIndex, "assetUUIDByAssetIdWithAssetIds:", v22);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v61;
  v64 = v63;
  if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v64, OS_SIGNPOST_INTERVAL_END, v59, "SearchProcessor - extractSearchResults - assetUUIDByAssetId", ", buf, 2u);
  }

  v65 = v64;
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    v66 = CFAbsoluteTimeGetCurrent() - Current;
    v67 = -[__CFSet count](v22, "count");
    *(_DWORD *)buf = 134218240;
    v192 = v66;
    v193 = 1024;
    v194 = v67;
    _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_INFO, "extractSearchResults: getting asset UUIDs took %f seconds for %d assets", buf, 0x12u);
  }

  v68 = CFAbsoluteTimeGetCurrent();
  v69 = os_signpost_id_generate(v65);
  v70 = v65;
  v71 = v70;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v69, "SearchProcessor - extractSearchResults - collectionResultByCollectionId", ", buf, 2u);
  }

  -[PSIDatabase collectionResultByCollectionIdWithCollectionIds:](v130->_searchIndex, "collectionResultByCollectionIdWithCollectionIds:", v23);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  v73 = v72;
  if (v69 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v73, OS_SIGNPOST_INTERVAL_END, v69, "SearchProcessor - extractSearchResults - collectionResultByCollectionId", ", buf, 2u);
  }

  v74 = v73;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    v75 = CFAbsoluteTimeGetCurrent() - v68;
    v76 = -[__CFSet count](v23, "count");
    *(_DWORD *)buf = 134218240;
    v192 = v75;
    v193 = 1024;
    v194 = v76;
    _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_INFO, "extractSearchResults: getting collection results took %f seconds for %d collections", buf, 0x12u);
  }

  v136 = objc_msgSend(v134, "count");
  if (v136)
  {
    v133 = 0;
  }
  else
  {
    v77 = objc_msgSend(v144, "count");
    v133 = v77 != 0;
    v78 = v147;
    if (!v77)
      v78 = 1;
    v147 = v78;
  }
  v79 = CFAbsoluteTimeGetCurrent();
  v80 = os_signpost_id_generate(v74);
  v81 = v74;
  v82 = v81;
  v83 = v80 - 1;
  if (v80 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v81))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v82, OS_SIGNPOST_INTERVAL_BEGIN, v80, "SearchProcessor - extractSearchResults - processGroupResults", ", buf, 2u);
  }

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  spida = v24;
  v155 = objc_msgSend(spida, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
  if (!v155)
  {
    LODWORD(v84) = 0;
    LODWORD(v85) = 0;
    goto LABEL_110;
  }
  v126 = v82;
  v84 = 0;
  v85 = 0;
  v146 = *(_QWORD *)v172;
  do
  {
    v86 = 0;
    do
    {
      v162 = v84;
      if (*(_QWORD *)v172 != v146)
        objc_enumerationMutation(spida);
      v87 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v86);
      objc_msgSend(v87, "resolveObjectsWithAssetCache:collectionCache:", v151, v149);
      v164 = v85;
      v160 = v86;
      if (v147)
      {
        v88 = 1;
        goto LABEL_88;
      }
      if (v136)
      {
        v88 = objc_msgSend(v134, "containsObject:", v87);
        if (((v88 | !v133) & 1) == 0)
          goto LABEL_86;
      }
      else
      {
        if (v133)
        {
LABEL_86:
          v88 = objc_msgSend(v144, "containsObject:", v87);
          goto LABEL_88;
        }
        v88 = 0;
      }
LABEL_88:
      objc_msgSend(v87, "assetUUIDs");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "count");

      if (v90)
      {
        v91 = -[PLSearchResult initWithGroupResult:]([PLAssetSearchResult alloc], "initWithGroupResult:", v87);
        if ((objc_msgSend(v87, "selectedForOCRCompletion") & 1) == 0)
          objc_msgSend(v153, "addObject:", v91);
        if ((objc_msgSend(v87, "isMergedOCRResult") & 1) == 0)
          objc_msgSend(v152, "addObject:", v91);

      }
      objc_msgSend(v87, "assetUUIDs");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v92, "count");

      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      objc_msgSend(v87, "collectionResults");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v167, v197, 16);
      if (v94)
      {
        v95 = v94;
        v96 = *(_QWORD *)v168;
        do
        {
          for (n = 0; n != v95; ++n)
          {
            if (*(_QWORD *)v168 != v96)
              objc_enumerationMutation(v93);
            v98 = -[PLCollectionSearchResult initWithGroupResult:collectionResult:libraryScope:]([PLCollectionSearchResult alloc], "initWithGroupResult:collectionResult:libraryScope:", v87, *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * n), objc_msgSend(v166, "libraryScope"));
            objc_msgSend(v25, "addObject:", v98);
            if (v88 && -[PLCollectionSearchResult collectionType](v98, "collectionType") == 4)
              objc_msgSend(v165, "addObject:", v98);

          }
          v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v167, v197, 16);
        }
        while (v95);
      }

      objc_msgSend(v87, "collectionResults");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "count");

      if (v88)
      {
        -[__CFArray addObjectsFromArray:](Mutable, "addObjectsFromArray:", objc_msgSend(v87, "assetIds"));
        objc_msgSend(v87, "lookupIdentifiers");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        PFMap();
        v102 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v140, "addObjectsFromArray:", v102);
        objc_msgSend(v87, "lookupIdentifiers");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        PFMap();
        v104 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v139, "addObjectsFromArray:", v104);
        objc_msgSend(v87, "lookupIdentifiers");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        PFMap();
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v138, "addObjectsFromArray:", v106);
        v107 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        objc_msgSend(v107, "addIndex:", 1300);
        objc_msgSend(v107, "addIndex:", 1301);
        objc_msgSend(v107, "addIndex:", 1330);
        objc_msgSend(v107, "addIndex:", 1331);
        objc_msgSend(v87, "lookupIdentifiersForSearchIndexCategories:", v107);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "addObjectsFromArray:", v108);

      }
      v62 = v156;
      v84 = v158 + v162;
      v85 = v100 + v164;
      v86 = v160 + 1;
    }
    while (v160 + 1 != v155);
    v155 = objc_msgSend(spida, "countByEnumeratingWithState:objects:count:", &v171, v198, 16);
  }
  while (v155);
  v83 = v80 - 1;
  v82 = v126;
LABEL_110:

  v109 = v82;
  v110 = v109;
  if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v110, OS_SIGNPOST_INTERVAL_END, v80, "SearchProcessor - extractSearchResults - processGroupResults", ", buf, 2u);
  }

  v111 = v110;
  if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
  {
    v112 = CFAbsoluteTimeGetCurrent();
    *(_DWORD *)buf = 134218496;
    v192 = v112 - v79;
    v193 = 1024;
    v194 = v84;
    v195 = 1024;
    v196 = v85;
    _os_log_impl(&dword_199541000, v111, OS_LOG_TYPE_INFO, "extractSearchResults: gathering took %f seconds for %d asset results and %d collection results", buf, 0x18u);
  }

  v113 = CFAbsoluteTimeGetCurrent();
  v114 = os_signpost_id_generate(v111);
  v115 = v111;
  v116 = v115;
  if (v114 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v115))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v116, OS_SIGNPOST_INTERVAL_BEGIN, v114, "SearchProcessor - extractSearchResults - topAssetsSearchResults", ", buf, 2u);
  }

  if (-[__CFArray count](Mutable, "count"))
  {
    v117 = (void *)objc_opt_new();
    objc_msgSend(v117, "setDelegate:", v130->_searchIndex);
    objc_msgSend(v117, "setAssetIds:", Mutable);
    v118 = -[PLTopAssetsSearchResult initWithTopAssetsResult:]([PLTopAssetsSearchResult alloc], "initWithTopAssetsResult:", v117);
    objc_msgSend(v166, "setSceneIdentifiers:", v140);
    objc_msgSend(v166, "setPersonIdentifiers:", v137);
    objc_msgSend(v166, "setAudioIdentifiers:", v139);
    objc_msgSend(v166, "setHumanActionIdentifiers:", v138);

  }
  else
  {
    v118 = 0;
  }
  v119 = v116;
  v120 = v119;
  if (v114 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v120, OS_SIGNPOST_INTERVAL_END, v114, "SearchProcessor - extractSearchResults - topAssetsSearchResults", ", buf, 2u);
  }

  v121 = v120;
  v122 = Mutable;
  if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
  {
    v123 = CFAbsoluteTimeGetCurrent() - v113;
    v124 = -[__CFArray count](Mutable, "count");
    *(_DWORD *)buf = 134218240;
    v192 = v123;
    v193 = 1024;
    v194 = v124;
    _os_log_impl(&dword_199541000, v121, OS_LOG_TYPE_INFO, "extractSearchResults: creating top assets search results took %f seconds for %d asset results", buf, 0x12u);
  }

  if (v128)
  {
    objc_msgSend(v165, "allObjects");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v128[2](v128, v153, v152, v25, v118, v125);

    v122 = Mutable;
  }

}

- (BOOL)_categoryMaskIsCombinable:(unint64_t)a3
{
  return (a3 & 0x3FFFFFBDDBDFBFEBLL) == 0;
}

- (BOOL)_shouldOmitSectionForCategoryMask:(unint64_t)a3
{
  return (a3 & 0x3FFFFFFDD8CFBFFFLL) == 0;
}

- (id)_topAssetSearchResultFromGroupResults:(id)a3
{
  id v4;
  CFMutableArrayRef Mutable;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PLTopAssetsSearchResult *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[__CFArray addObjectsFromArray:](Mutable, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "assetIds", (_QWORD)v14));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setDelegate:", self->_searchIndex);
  objc_msgSend(v11, "setAssetIds:", Mutable);
  v12 = -[PLTopAssetsSearchResult initWithTopAssetsResult:]([PLTopAssetsSearchResult alloc], "initWithTopAssetsResult:", v11);

  return v12;
}

- (id)_collectionSearchResultsFromGroupResults:(id)a3 query:(id)a4
{
  id v6;
  CFMutableSetRef Mutable;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  PLCollectionSearchResult *v27;
  void *v28;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend(v13, "collectionIds");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v45 != v17)
                objc_enumerationMutation(v14);
              -[__CFSet addObject:](Mutable, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j));
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
          }
          while (v16);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v10);
  }

  -[PSIDatabase collectionResultByCollectionIdWithCollectionIds:](self->_searchIndex, "collectionResultByCollectionIdWithCollectionIds:", Mutable);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v8;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v41;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(obj);
        v34 = v20;
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
        objc_msgSend(v21, "resolveObjectsWithAssetCache:collectionCache:", MEMORY[0x1E0C9AA70], v32);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v21, "collectionResults");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v22);
              v27 = -[PLCollectionSearchResult initWithGroupResult:collectionResult:libraryScope:]([PLCollectionSearchResult alloc], "initWithGroupResult:collectionResult:libraryScope:", v21, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), objc_msgSend(v35, "libraryScope"));
              objc_msgSend(v19, "addObject:", v27);

            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          }
          while (v24);
        }

        v20 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
    }
    while (v33);
  }

  v28 = (void *)objc_msgSend(v19, "copy");
  return v28;
}

- (void)performQueryV2:(id)a3 resultsHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSObject *v21;
  os_signpost_id_t v22;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PLPhotosSearchGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLSearchQuerySignpost", ", buf, 2u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchProcessor.m"), 1614, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v8)
      goto LABEL_6;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchProcessor.m"), 1615, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchResultsHandler"));

    goto LABEL_6;
  }
  if (!v8)
    goto LABEL_8;
LABEL_6:
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3254779904;
  v18[2] = __51__PLSearchProcessor_performQueryV2_resultsHandler___block_invoke;
  v18[3] = &unk_1E365EB18;
  v13 = v12;
  v21 = v13;
  v22 = v10;
  v14 = v7;
  v19 = v14;
  v15 = v8;
  v20 = v15;
  objc_msgSend(v14, "runWithResultsHandlerV2:", v18);

}

- (id)performQueryForLookupIdentifier:(id)a3 searchResultTypes:(unint64_t)a4 searchIndex:(id)a5
{
  id v9;
  id v10;
  void *v11;
  PSIQueryToken *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchProcessor.m"), 1635, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lookupIdentifier"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchProcessor.m"), 1636, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchIndex"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = -[PSIQueryToken initWithIdentifier:userCategory:]([PSIQueryToken alloc], "initWithIdentifier:userCategory:", v9, 0);
  v20[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  v14 = (void *)objc_msgSend(v11, "newQueryWithSearchTextV2:queryTokens:scopedSearchIdentifiers:searchResultTypes:searchSuggestionType:useWildcardSearchText:enableExactMatchPrioritization:libraryScope:suggestionLimit:", 0, v13, 0, a4, 0, 0, v19, 0, 0);

  objc_msgSend(v14, "runLookupIdentifierQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (PSIDatabase)searchIndex
{
  return self->_searchIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndex, 0);
}

void __51__PLSearchProcessor_performQueryV2_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  double v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 48);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLSearchQuerySignpost", ", (uint8_t *)&v12, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    PLSearchBackendQueryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Search query was cancelled: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queryBeginResultGenerationAndIntersectionsTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceNow");
    objc_msgSend(*(id *)(a1 + 32), "setElapsedTimeResultGenerationAndIntersections:", 0.0 - v11);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return PLSearchHumanActionIdentifierFromLookupIdentifier(a2);
}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return PLSearchSceneIdentifierFromLookupIdentifier(a2);
}

id __84__PLSearchProcessor__extractSearchResultsFromGroupResults_withQuery_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  return PLSearchSceneIdentifierFromLookupIdentifier(a2);
}

void __77__PLSearchProcessor__combinedFilenameSearchResultsFromSearchResults_inQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PLNamedCombinedAssetSearchResult *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[PLNamedCombinedAssetSearchResult initWithName:assetSearchResults:canOverlap:]([PLNamedCombinedAssetSearchResult alloc], "initWithName:assetSearchResults:canOverlap:", v6, v5, 0);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2;
  v6[3] = &unk_1E3675100;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8[3]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "dateFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "capitalizedString");
  else
    objc_msgSend(v3, "contentString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "dateFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(id *)(a1 + 32);
  }
  else
  {
    objc_msgSend(v3, "normalizedString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_21(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "category") != 2100)
    goto LABEL_3;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "groupId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_3:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_3_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "category") != 2100
    || (v4 = *(void **)(a1 + 32),
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "groupId")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "objectForKeyedSubscript:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_4_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int IsUserControlled;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t j;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  __int128 v54;
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
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "fullSearchTextGroupSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v3, "dateFilterGroupSnapshot");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;

  }
  v10 = objc_msgSend(v6, "category");
  v11 = v10;
  v12 = PLSearchUserCategoryForCategory(v10);
  if (v10 != 2100)
    goto LABEL_9;
  v13 = *(void **)(a1 + 40);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "groups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v16, "groupId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_9:
    IsUserControlled = PLSearchIndexCategoryIsUserControlled(v11);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      && (objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v20),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v21))
    {
LABEL_22:
      (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_5;
      v66[3] = &unk_1E366B910;
      obj = v28;
      v67 = obj;
      v68 = *(id *)(a1 + 56);
      v69 = *(id *)(a1 + 64);
      v71 = v11;
      v72 = v12;
      v70 = v3;
      v29 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v66);
      if (IsUserControlled)
      {
        v64 = 0uLL;
        v65 = 0uLL;
        v62 = 0uLL;
        v63 = 0uLL;
        v30 = *(id *)(a1 + 48);
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
        if (v31)
        {
          v32 = v31;
          v50 = v6;
          v51 = v3;
          v33 = *(_QWORD *)v63;
          do
          {
            v34 = 0;
            v53 = v32;
            do
            {
              if (*(_QWORD *)v63 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v34);
              if (objc_msgSend(v20, "containsString:", v35, v50, v51, obj))
              {
                v36 = v30;
                v37 = v20;
                v60 = 0u;
                v61 = 0u;
                v58 = 0u;
                v59 = 0u;
                v38 = a1;
                objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v35);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
                if (v40)
                {
                  v41 = v40;
                  v42 = *(_QWORD *)v59;
                  do
                  {
                    for (i = 0; i != v41; ++i)
                    {
                      if (*(_QWORD *)v59 != v42)
                        objc_enumerationMutation(v39);
                      v29[2](v29, *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i), 0);
                    }
                    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v78, 16);
                  }
                  while (v41);
                }

                a1 = v38;
                v20 = v37;
                v30 = v36;
                v32 = v53;
              }
              ++v34;
            }
            while (v34 != v32);
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
          }
          while (v32);
          v6 = v50;
          v3 = v51;
        }
      }
      else
      {
        v56 = 0uLL;
        v57 = 0uLL;
        v54 = 0uLL;
        v55 = 0uLL;
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v20);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v77, 16);
        if (v44)
        {
          v45 = v44;
          v46 = v6;
          v47 = v3;
          v48 = *(_QWORD *)v55;
          do
          {
            for (j = 0; j != v45; ++j)
            {
              if (*(_QWORD *)v55 != v48)
                objc_enumerationMutation(v30);
              v29[2](v29, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j), 1);
            }
            v45 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v77, 16);
          }
          while (v45);
          v3 = v47;
          v6 = v46;
        }
      }

    }
    else
    {
      if (!IsUserControlled)
      {
LABEL_50:

        goto LABEL_51;
      }
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obj = *(id *)(a1 + 48);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      if (v22)
      {
        v23 = v22;
        v24 = v6;
        v25 = v3;
        v26 = *(_QWORD *)v74;
        while (2)
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v74 != v26)
              objc_enumerationMutation(obj);
            if ((objc_msgSend(v20, "containsString:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k)) & 1) != 0)
            {

              v3 = v25;
              v6 = v24;
              goto LABEL_22;
            }
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
          if (v23)
            continue;
          break;
        }
        v3 = v25;
        v6 = v24;
      }
    }

    goto LABEL_50;
  }
LABEL_51:

}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
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
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4;
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          if (!objc_msgSend(v9, "userCategory"))
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * j);
          if (v15 != v6)
          {
            v16 = objc_msgSend(v6, "assetCount", (_QWORD)v18);
            if (v16 == objc_msgSend(v15, "assetCount"))
            {
              v17 = objc_msgSend(v6, "collectionCount");
              if (v17 == objc_msgSend(v15, "collectionCount"))
              {
                objc_msgSend(*(id *)(a1 + 32), "removeObject:", v6);
                goto LABEL_24;
              }
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_24:

  }
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "userCategory");
  if (v7 == objc_msgSend(v6, "userCategory"))
  {
LABEL_4:
    objc_msgSend(v5, "searchedCategories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchedCategories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToIndexSet:", v9);

    if ((v10 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "compare:", v14);

      if (v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "text");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "length"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v18, "compare:", v21);
    }
    else
    {
      v22 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v6, "searchedCategories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v5, "searchedCategories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v12, "compare:", v18);
      if (v24)
      {
        v15 = v24;
LABEL_13:

        goto LABEL_14;
      }
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "searchedCategories");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "searchedCategories");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v21, "compare:", v28);

      v20 = v30;
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "userCategory"))
  {
    if (objc_msgSend(v6, "userCategory"))
      goto LABEL_4;
    v15 = 1;
  }
  else
  {
    v15 = -1;
  }
LABEL_15:

  return v15;
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v5 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_6;
  v24[3] = &unk_1E366BA58;
  v29 = a3;
  v25 = *(id *)(a1 + 32);
  v7 = v5;
  v26 = v7;
  v27 = *(id *)(a1 + 40);
  v28 = *(id *)(a1 + 48);
  v8 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v24);
  if (*(_QWORD *)(a1 + 64) != 2100 || objc_msgSend(v7, "matchType") != 1)
  {
    v9 = objc_msgSend(v7, "userCategory");
    if (!v9 || (v10 = v9, v11 = *(_QWORD *)(a1 + 72), v11 == v9))
    {
      objc_msgSend(v7, "assetIds");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 56), "assetIds"));

      objc_msgSend(v7, "collectionIds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 56), "collectionIds"));

      v8[2](v8);
    }
    else if (v11 > 0x26 || ((0x7FFFFC10FEuLL >> v11) & 1) == 0)
    {
      objc_msgSend(v7, "searchedCategories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = (v10 < 0x27) & (0x7FFFFC10FEuLL >> v10);
      if (v14 != 1 || objc_msgSend(v12, "containsIndex:", *(_QWORD *)(a1 + 64)))
      {
        PLSearchedCategoriesForUserCategory(*(_QWORD *)(a1 + 72));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_7;
        v18[3] = &unk_1E366B8E8;
        v19 = v13;
        v23 = v14;
        v22 = v8;
        v20 = v7;
        v21 = *(id *)(a1 + 56);
        objc_msgSend(v15, "enumerateRangesUsingBlock:", v18);

      }
    }
  }

}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v3, "isEqualToString:", v11) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "lowercaseString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v11, "containsString:", v4);
      v6 = objc_msgSend(v3, "containsString:", v4);
      if (v5 && !v6
        || v5 == v6
        && (v7 = *(void **)(a1 + 32),
            objc_msgSend(*(id *)(a1 + 40), "text"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "compare:", v8),
            v8,
            v9 == 1))
      {
        objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 40), "setText:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v10, *(_QWORD *)(a1 + 40));

      }
    }

  }
}

void __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", a2, a3))
  {
    if (!*(_BYTE *)(a1 + 64))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "setUserCategory:", 0);
      objc_msgSend(*(id *)(a1 + 40), "setSearchedCategories:", 0);
    }
    objc_msgSend(*(id *)(a1 + 40), "assetIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 48), "assetIds"));

    objc_msgSend(*(id *)(a1 + 40), "collectionIds");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 48), "collectionIds"));

    *a4 = 1;
  }
}

uint64_t __90__PLSearchProcessor_completionSuggestionsForQuery_withSearchSections_numberOfSuggestions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "_scoreForSearchIndexCategory:", a2);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(double *)(v5 + 24) >= v4)
    v4 = *(double *)(v5 + 24);
  *(double *)(v5 + 24) = v4;
  return result;
}

void __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  PLCombinedAssetSearchResult *v17;
  PLCombinedAssetSearchResult *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  PLSearchResultSection *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldOmitSectionForCategoryMask:", v6) & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    if ((v6 & 0x400000000) != 0)
    {
      objc_msgSend(v7, "_combinedFilenameSearchResultsFromSearchResults:inQuery:", v5, *(_QWORD *)(a1 + 40));
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v19;
    }
    else if (objc_msgSend(v7, "_categoryMaskIsCombinable:", v6))
    {
      v23 = v6;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v14, "contentStrings");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "objectForKeyedSubscript:", v16);
            v17 = (PLCombinedAssetSearchResult *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = v17;
              -[PLCombinedAssetSearchResult addAssetSearchResult:isMainSearchResult:](v17, "addAssetSearchResult:isMainSearchResult:", v14, 0);
            }
            else
            {
              v18 = -[PLCombinedAssetSearchResult initWithAssetSearchResult:]([PLCombinedAssetSearchResult alloc], "initWithAssetSearchResult:", v14);
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v16);
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

      objc_msgSend(v8, "allValues");
      v5 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v23;
    }
    objc_msgSend(*(id *)(a1 + 32), "_sortDescriptorsForCategoryMask:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PLSearchResultSection initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:]([PLSearchResultSection alloc], "initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:", 1, v6, v21, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);

  }
}

void __133__PLSearchProcessor_searchResultSectionsForQuery_withAssetResults_assetResultsForCompletions_collectionResults_combineAssetSections___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  id v8;
  PLSearchResultSection *v9;
  PLSearchResultSection *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  objc_msgSend(v7, "_sortDescriptorsForCategoryMask:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortUsingDescriptors:", v11);
  v9 = [PLSearchResultSection alloc];
  v10 = -[PLSearchResultSection initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:](v9, "initWithResultTypes:categoryMask:searchResults:assetSearchResultsForCompletions:", a2, a3, v8, MEMORY[0x1E0C9AA60]);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
}

void __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendQueryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v28 = v5;
    v29 = 2048;
    v30 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: did run search query: %@ and got %lu results", buf, 0x16u);
  }

  v6 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v8, "SearchProcessor-PerformQuery", ", buf, 2u);
  }

  v9 = os_signpost_id_generate(*(os_log_t *)(a1 + 40));
  v10 = *(id *)(a1 + 40);
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-ExtractSearchResults", ", buf, 2u);
  }

  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v12 = v3;
  v13 = v12;
  if (!objc_msgSend(*(id *)(a1 + 32), "legacyDisableTopAssetsAndTopCollections"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke_1;
    v22[3] = &unk_1E366B7D0;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 48);
    v23 = *(id *)(a1 + 40);
    v26 = v9;
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v15, "_extractSearchResultsFromGroupResults:withQuery:resultsHandler:", v13, v14, v22);

    goto LABEL_23;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_23;
  }
  v16 = objc_msgSend(*(id *)(a1 + 32), "searchResultTypes");
  v17 = objc_msgSend(*(id *)(a1 + 32), "searchResultTypes");
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "_topAssetSearchResultFromGroupResults:", v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v18 & 2) != 0)
      goto LABEL_17;
LABEL_19:
    v20 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_20;
  }
  v19 = 0;
  if ((v17 & 2) == 0)
    goto LABEL_19;
LABEL_17:
  objc_msgSend(*(id *)(a1 + 48), "_collectionSearchResultsFromGroupResults:query:", v13, *(_QWORD *)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
  v21 = *(_QWORD *)(a1 + 56);
  if (v21)
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *, void *, _QWORD))(v21 + 16))(v21, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v20, v19, MEMORY[0x1E0C9AA60]);

LABEL_23:
}

void __103__PLSearchProcessor_performQuery_disableWildcardMatchesForUserControlledCategories_withResultsHandler___block_invoke_1(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = *(id *)(a1 + 32);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "SearchProcessor-ExtractSearchResults", ", buf, 2u);
  }

  v19 = objc_msgSend(*(id *)(a1 + 40), "isCanceled");
  PLSearchBackendQueryGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v21)
    {
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: query was cancelled: %@", buf, 0xCu);
    }
  }
  else if (v21)
  {
    v27 = *(_QWORD *)(a1 + 40);
    v23 = objc_msgSend(v11, "count");
    v24 = objc_msgSend(v13, "count");
    v25 = objc_msgSend(v14, "assetCount");
    v26 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 138413314;
    v29 = v27;
    v30 = 2048;
    v31 = v23;
    v32 = 2048;
    v33 = v24;
    v34 = 2048;
    v35 = v25;
    v36 = 2048;
    v37 = v26;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Photos Search Processor: extracted results for search query: %@ and got %lu asset results, %lu collection results, %lu top asset results, %lu top collection results", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (id)_OCRProcessedGroupResultsFromGroupResults:(id)a3 query:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v16, "exclusivelyContainsOCRGroups", (_QWORD)v21))
        {
          objc_msgSend(v9, "addObject:", v16);
          objc_msgSend(v8, "removeObject:", v16);
          objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(a1, "_groupResultFromCombinedGroupResults:query:", v17, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v8, "addObject:", v18);
  objc_msgSend(a1, "_singleOCRGroupResultFromOCRGroupResults:query:", v10, v7, (_QWORD)v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v8, "addObject:", v19);

  return v8;
}

+ (id)_singleOCRGroupResultFromOCRGroupResults:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v5;
    v7 = v5;
    v27 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    v8 = 0;
    v9 = 0;
    if (v27)
    {
      v10 = *(_QWORD *)v37;
      v29 = v7;
      v26 = *(_QWORD *)v37;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          v28 = v11;
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v12, "groups", v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                if (objc_msgSend(v18, "category") == 1203
                  || objc_msgSend(v18, "category") == 1204)
                {
                  objc_msgSend(v18, "contentString");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((unint64_t)objc_msgSend(v19, "length") >= 3)
                  {
                    objc_msgSend(v31, "searchText");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v19, "isEqualToString:", v20);

                    if ((v21 & 1) != 0)
                    {
                      objc_msgSend(v12, "setSelectedForOCRCompletion:", 1);
                      v6 = v12;

                      goto LABEL_27;
                    }
                    if (!v9 || (v22 = objc_msgSend(v19, "length"), v22 < objc_msgSend(v8, "length")))
                    {
                      v23 = v12;

                      v24 = v19;
                      v8 = v24;
                      v9 = v23;
                    }
                  }

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v15)
                continue;
              break;
            }
          }

          v11 = v28 + 1;
          v7 = v29;
          v10 = v26;
        }
        while (v28 + 1 != v27);
        v27 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v27);
    }

    objc_msgSend(v9, "setSelectedForOCRCompletion:", 1);
    v9 = v9;
    v6 = v9;
LABEL_27:

    v5 = v30;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_groupResultFromCombinedGroupResults:(id)a3 query:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  PSIGroupResult *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFArray *v22;
  const __CFArray *v23;
  CFIndex Count;
  CFIndex v25;
  CFIndex j;
  CFMutableArrayRef Mutable;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t spid;
  const __CFAllocator *allocator;
  unint64_t v40;
  void *v41;
  id v42;
  CFArrayRef cf;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "searchProcessorLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v7;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SearchProcessor-_groupResultFromCombinedGroupResults", ", buf, 2u);
  }

  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v12 = (PSIGroupResult *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = v9 - 1;
      v41 = v6;
      spid = v9;
      v13 = (void *)objc_opt_new();
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      cf = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v42 = v5;
      v15 = v5;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v20, "groups");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObjectsFromArray:", v21);

            v22 = (const __CFArray *)objc_msgSend(v20, "assetIds");
            if (v22)
            {
              v23 = v22;
              Count = CFArrayGetCount(v22);
              if (Count)
              {
                v25 = Count;
                for (j = 0; j != v25; ++j)
                  objc_msgSend(v13, "addIndex:", CFArrayGetValueAtIndex(v23, j));
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v17);
      }

      Mutable = CFArrayCreateMutable(allocator, 0, 0);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __64__PLSearchProcessor__groupResultFromCombinedGroupResults_query___block_invoke;
      v44[3] = &__block_descriptor_40_e12_v24__0Q8_B16l;
      v44[4] = Mutable;
      objc_msgSend(v13, "enumerateIndexesUsingBlock:", v44);
      objc_msgSend(v15, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (Mutable)
      {
        v12 = -[PSIGroupResult initWithQueue:]([PSIGroupResult alloc], "initWithQueue:", 0);
        -[PSIGroupResult setDelegate:](v12, "setDelegate:", v29);
        -[PSIGroupResult setIsMergedOCRResult:](v12, "setIsMergedOCRResult:", 1);
        -[PSIGroupResult setGroups:](v12, "setGroups:", v14);
        -[PSIGroupResult setAssetIds:](v12, "setAssetIds:", Mutable);
        -[PSIGroupResult setCollectionIds:](v12, "setCollectionIds:", cf);
        v6 = v41;
        objc_msgSend(v41, "searchText");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "length"))
        {
          objc_msgSend(v41, "searchText");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
          v32 = v29;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSIGroupResult setContentStringsOverride:](v12, "setContentStringsOverride:", v33);

          v29 = v32;
        }
        else
        {
          -[PSIGroupResult setContentStringsOverride:](v12, "setContentStringsOverride:", 0);
        }
        v34 = v40;

        v5 = v42;
      }
      else
      {
        v12 = 0;
        v6 = v41;
        v5 = v42;
        v34 = v40;
      }
      CFRelease(Mutable);
      CFRelease(cf);
      v35 = v11;
      v36 = v35;
      if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v36, OS_SIGNPOST_INTERVAL_END, spid, "SearchProcessor-_groupResultFromCombinedGroupResults", ", buf, 2u);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)searchProcessorLog
{
  if (searchProcessorLog_onceToken != -1)
    dispatch_once(&searchProcessorLog_onceToken, &__block_literal_global_54_50318);
  return (id)searchProcessorLog_searchProcessorLog;
}

void __39__PLSearchProcessor_searchProcessorLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.search", "SearchProcessor");
  v1 = (void *)searchProcessorLog_searchProcessorLog;
  searchProcessorLog_searchProcessorLog = (uint64_t)v0;

}

void __64__PLSearchProcessor__groupResultFromCombinedGroupResults_query___block_invoke(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), a2);
}

@end
