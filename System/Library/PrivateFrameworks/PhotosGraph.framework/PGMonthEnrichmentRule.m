@implementation PGMonthEnrichmentRule

- (PGMonthEnrichmentRule)initWithModelReader:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMonthEnrichmentRule *v9;
  PGMonthEnrichmentRule *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGMonthEnrichmentRule;
  v9 = -[PGMonthEnrichmentRule init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelReader, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
  }

  return v10;
}

- (double)promotionScoreForHighlightItemList:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
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
  objc_msgSend(a3, "sortedChildHighlightItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "promotionScore");
        if (v7 < v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)keyAssetForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSObject *loggingConnection;
  int v10;
  id v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGHighlightItemModelReader contextualKeyAssetForHighlightItem:sharingFilter:](self->_modelReader, "contextualKeyAssetForHighlightItem:sharingFilter:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "No contextual key asset for highlight item list %@, using highest promotion score as a fallback.", (uint8_t *)&v10, 0xCu);
    }
    -[PGMonthEnrichmentRule fallbackKeyAssetWithHighlightItemList:sharingFilter:](self, "fallbackKeyAssetWithHighlightItemList:sharingFilter:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)fallbackKeyAssetWithHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  BOOL v21;
  id v22;
  id v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(v25, "childHighlightItemsForHighlightFilter:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v27;
    v11 = 0.0;
    v12 = -1.79769313e308;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (MEMORY[0x1CAA4E418](-[PGHighlightItemModelReader visibilityStateForHighlightItem:sharingFilter:](self->_modelReader, "visibilityStateForHighlightItem:sharingFilter:", v14, v4)))
        {
          objc_msgSend(v14, "promotionScore");
          v16 = v15;
          objc_msgSend(v14, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceDate:", v18);
          v20 = v19;

          if (v16 > v12 || (v16 == v12 ? (v21 = v20 <= v11) : (v21 = 1), v16 = v12, !v21))
          {
            v22 = v14;

            v11 = v20;
            v12 = v16;
            v9 = v22;
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "keyAssetForHighlightFilter:", v4);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[PGMonthEnrichmentRule enumerateChildVisibilityStateForHighlightItemList:sharingFilter:withGraph:neighborScoreComputer:usingBlock:maximumNumberOfVisibleItems:maximumNumberOfVisibleRegularItems:](self, "enumerateChildVisibilityStateForHighlightItemList:sharingFilter:withGraph:neighborScoreComputer:usingBlock:maximumNumberOfVisibleItems:maximumNumberOfVisibleRegularItems:", v15, v9, v14, v13, v12, +[PGUserDefaults maximumNumberOfVisibleItems](PGUserDefaults, "maximumNumberOfVisibleItems"), +[PGUserDefaults maximumNumberOfVisibleRegularItems](PGUserDefaults, "maximumNumberOfVisibleRegularItems"));

}

- (void)enumerateChildVisibilityStateForHighlightItemList:(id)a3 sharingFilter:(unsigned __int16)a4 withGraph:(id)a5 neighborScoreComputer:(id)a6 usingBlock:(id)a7 maximumNumberOfVisibleItems:(unint64_t)a8 maximumNumberOfVisibleRegularItems:(unint64_t)a9
{
  void (**v12)(id, _QWORD, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  double v60;
  double v61;
  void *v63;
  void *v64;
  uint64_t v65;
  double v66;
  void *v67;
  void *v68;
  char v69;
  NSObject *loggingConnection;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  PGMonthEnrichmentRule *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t k;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t m;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t n;
  void *v102;
  double v103;
  uint64_t v104;
  unsigned int v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t ii;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  id v130;
  void *v131;
  void *v133;
  void *v134;
  unsigned int obj;
  id obja;
  void *v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[4];
  __int16 v165;
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[5];
  uint8_t v169[128];
  uint8_t buf[4];
  void *v171;
  _BYTE v172[128];
  _BYTE v173[128];
  _QWORD v174[4];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[4];
  _QWORD v178[2];
  _QWORD v179[5];

  obj = a4;
  v179[3] = *MEMORY[0x1E0C80C00];
  v127 = a3;
  v125 = a5;
  v130 = a6;
  v12 = (void (**)(id, _QWORD, uint64_t))a7;
  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("type"), 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v179[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("type"), 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v179[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    v19 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
    v20 = (void *)v18;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v178[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v178[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "andPredicateWithSubpredicates:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = v24;
  }
  if (obj > 2)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", off_1E842EED8[obj], 0);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v127, "sortedChildHighlightItems");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "childHighlightItemsForHighlightFilter:", obj);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __195__PGMonthEnrichmentRule_enumerateChildVisibilityStateForHighlightItemList_sharingFilter_withGraph_neighborScoreComputer_usingBlock_maximumNumberOfVisibleItems_maximumNumberOfVisibleRegularItems___block_invoke;
  v164[3] = &__block_descriptor_34_e44_B24__0___PGHighlightItem__8__NSDictionary_16l;
  v165 = obj;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v164);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = v26;
  objc_msgSend(v26, "filteredArrayUsingPredicate:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = v28;
  v122 = (void *)v18;
  objc_msgSend(v28, "filteredArrayUsingPredicate:", v18);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("promotionScore"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v177[0] = v29;
  v177[1] = v25;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v177[2] = v30;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v177[3] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v177, 4);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("promotionScore"), 0x3FECCCCCCCCCCCCDLL);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = _os_feature_enabled_impl();
  v34 = (void *)MEMORY[0x1E0CB3528];
  if (v33)
  {
    v176[0] = v32;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v176[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v176, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "orPredicateWithSubpredicates:", v36);
  }
  else
  {
    v175[0] = v32;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("type"), 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v175[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "andPredicateWithSubpredicates:", v36);
  }
  v37 = objc_claimAutoreleasedReturnValue();

  v118 = (void *)v37;
  objc_msgSend(v126, "filteredArrayUsingPredicate:", v37);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMonthEnrichmentRule sortedItemsByWeekOfMonthFromItems:sortDescriptors:](self, "sortedItemsByWeekOfMonthFromItems:sortDescriptors:");
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v38;
  -[PGMonthEnrichmentRule bestItemsFromSortedItemsByWeekOfMonth:previouslySelectedItemsCountByWeek:maximumNumberOfItems:sortDescriptors:](self, "bestItemsFromSortedItemsByWeekOfMonth:previouslySelectedItemsCountByWeek:maximumNumberOfItems:sortDescriptors:", v38, v39, a8, v128);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v174[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("promotionScore"), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v41;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v174[2] = v42;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v174[3] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v174, 4);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = v40;
  v45 = objc_msgSend(v40, "count");
  v121 = (void *)v25;
  if (a8 <= v45)
  {
    v79 = self;
  }
  else
  {
    v111 = a8 - v45;
    v112 = v45;
    v138 = v40;
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v126, "count"));
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v47 = v126;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v161;
      do
      {
        for (i = 0; i != v49; ++i)
        {
          if (*(_QWORD *)v161 != v50)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * i), "uuid");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v52);

        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v160, v173, 16);
      }
      while (v49);
    }

    v115 = v46;
    +[PGGraphHighlightNodeCollection highlightNodesForArrayOfUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForArrayOfUUIDs:inGraph:", v46, v125);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "highlightNodeByHighlightUUID");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMonthEnrichmentRule _momentNodesAtWorkWithGraph:](self, "_momentNodesAtWorkWithGraph:", v125);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v53 = v47;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
    v55 = v40;
    if (v54)
    {
      v56 = v54;
      v57 = *(_QWORD *)v157;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v157 != v57)
            objc_enumerationMutation(v53);
          v59 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
          objc_msgSend(v59, "promotionScore");
          v61 = v60;
          if ((objc_msgSend(v55, "containsObject:", v59) & 1) == 0
            && objc_msgSend(v59, "type") != 3
            && v61 > 0.25)
          {
            objc_msgSend(v59, "uuid");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "objectForKeyedSubscript:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            if (v64)
            {
              if (v61 >= 0.5
                || (v65 = objc_msgSend(v64, "numberOfRegularGemAssets"),
                    (unint64_t)(objc_msgSend(v64, "numberOfShinyGemAssets") + v65) > 1)
                || (unint64_t)objc_msgSend(v59, "numberOfAssetsInExtendedForSharingFilter:", obj) > 4
                || (objc_msgSend(v130, "neighborScoreWithHighlightNode:", v64), v66 >= 0.4))
              {
                objc_msgSend(v64, "collection");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "momentNodes");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v133, "containsCollection:", v68);

                v55 = v138;
                if ((v69 & 1) == 0)
                  objc_msgSend(v131, "addObject:", v59);
              }
            }
            else
            {
              loggingConnection = self->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v171 = v59;
                _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "Could not find highlight node for highlight %@: Graph might be out of date.", buf, 0xCu);
              }
            }

          }
        }
        v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
      }
      while (v56);
    }

    v71 = +[PGUserDefaults minimumNumberOfVisibleItems](PGUserDefaults, "minimumNumberOfVisibleItems");
    v72 = v131;
    if (objc_msgSend(v131, "count") + v112 >= v71)
    {
      -[PGMonthEnrichmentRule sortedItemsByWeekOfMonthFromItems:sortDescriptors:](self, "sortedItemsByWeekOfMonthFromItems:sortDescriptors:", v131, v124);
      v123 = objc_claimAutoreleasedReturnValue();
      v80 = v111;
      if (v111 >= a9)
        v80 = a9;
      v113 = v80;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = 0u;
      v153 = 0u;
      v154 = 0u;
      v155 = 0u;
      obja = v55;
      v81 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
      if (v81)
      {
        v82 = v81;
        v139 = *(_QWORD *)v153;
        do
        {
          for (k = 0; k != v82; ++k)
          {
            if (*(_QWORD *)v153 != v139)
              objc_enumerationMutation(obja);
            objc_msgSend(*(id *)(*((_QWORD *)&v152 + 1) + 8 * k), "startDate");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "components:fromDate:", 4096, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v85, "weekOfMonth"));
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v75, "objectForKeyedSubscript:", v86);
            v88 = v78;
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "numberWithUnsignedInteger:", objc_msgSend(v89, "unsignedIntegerValue") + 1);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setObject:forKeyedSubscript:", v90, v86);

            v78 = v88;
          }
          v82 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
        }
        while (v82);
      }

      v79 = self;
      v74 = (void *)v123;
      -[PGMonthEnrichmentRule bestItemsFromSortedItemsByWeekOfMonth:previouslySelectedItemsCountByWeek:maximumNumberOfItems:sortDescriptors:](self, "bestItemsFromSortedItemsByWeekOfMonth:previouslySelectedItemsCountByWeek:maximumNumberOfItems:sortDescriptors:", v123, v75, v113, v124);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "arrayByAddingObjectsFromArray:", v91);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = v131;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %f"), CFSTR("promotionScore"), 0x3FD0000000000000);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "filteredArrayUsingPredicate:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v74, "sortedArrayUsingDescriptors:", v128);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "count");
      if (v71 >= v76)
        v77 = v76;
      else
        v77 = v71;
      objc_msgSend(v75, "subarrayWithRange:", 0, v77);
      v78 = v55;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = self;
    }

  }
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v92 = v44;
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v149;
    do
    {
      for (m = 0; m != v94; ++m)
      {
        if (*(_QWORD *)v149 != v95)
          objc_enumerationMutation(v92);
        v12[2](v12, *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * m), -[PGMonthEnrichmentRule _visibilityStateForItemPromotedToMonths:](v79, "_visibilityStateForItemPromotedToMonths:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * m)));
      }
      v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
    }
    while (v94);
  }

  objc_msgSend(v129, "arrayByExcludingObjectsInArray:", v92);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v144, v167, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v145;
    do
    {
      for (n = 0; n != v99; ++n)
      {
        if (*(_QWORD *)v145 != v100)
          objc_enumerationMutation(v97);
        v102 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * n);
        objc_msgSend(v102, "promotionScore");
        if (v103 >= 0.25)
        {
          v105 = objc_msgSend(v102, "type");
          v104 = 0;
          if (v105 <= 7)
          {
            if (((1 << v105) & 0xA9) != 0)
            {
              v104 = 1;
            }
            else if (((1 << v105) & 0x16) != 0)
            {
              v104 = _os_feature_enabled_impl();
            }
          }
        }
        else
        {
          v104 = 0;
        }
        ((void (**)(id, void *, uint64_t))v12)[2](v12, v102, v104);
      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v144, v167, 16);
    }
    while (v99);
  }
  objc_msgSend(v120, "arrayByExcludingObjectsInArray:", v129);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v140, v166, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v141;
    do
    {
      for (ii = 0; ii != v108; ++ii)
      {
        if (*(_QWORD *)v141 != v109)
          objc_enumerationMutation(v106);
        v12[2](v12, *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * ii), 0);
      }
      v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v140, v166, 16);
    }
    while (v108);
  }

}

- (unsigned)_legacyVisibilityStateForItemPromotedToMonths:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "type");
  if (v3 > 7)
    return 0;
  else
    return word_1CA8EDB20[v3];
}

- (unsigned)_visibilityStateForItemPromotedToMonths:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned __int16 v7;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = objc_msgSend(v4, "type");

    if (v5 >= 8)
      return 0;
    else
      return word_1CA8EDB30[v5];
  }
  else
  {
    v7 = -[PGMonthEnrichmentRule _legacyVisibilityStateForItemPromotedToMonths:](self, "_legacyVisibilityStateForItemPromotedToMonths:", v4);

    return v7;
  }
}

- (id)_momentNodesAtWorkWithGraph:(id)a3
{
  PGGraphMomentNodeCollection *momentNodesAtWork;
  void *v5;
  void *v6;
  void *v7;
  PGGraphMomentNodeCollection *v8;
  PGGraphMomentNodeCollection *v9;

  momentNodesAtWork = self->_momentNodesAtWork;
  if (!momentNodesAtWork)
  {
    objc_msgSend(a3, "meNodeCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "momentNodes");
    v8 = (PGGraphMomentNodeCollection *)objc_claimAutoreleasedReturnValue();
    v9 = self->_momentNodesAtWork;
    self->_momentNodesAtWork = v8;

    momentNodesAtWork = self->_momentNodesAtWork;
  }
  return momentNodesAtWork;
}

- (id)bestItemsFromSortedItemsByWeekOfMonth:(id)a3 previouslySelectedItemsCountByWeek:(id)a4 maximumNumberOfItems:(unint64_t)a5 sortDescriptors:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  unint64_t v43;
  id v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v44 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a5;
  if (objc_msgSend(v11, "count") < a5)
  {
    v45 = a5;
    v42 = v11;
    v50 = v12;
    v48 = v13;
    do
    {
      if (!objc_msgSend(v9, "count", v42))
        break;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      obj = v14;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v53;
        v47 = *(_QWORD *)v53;
        do
        {
          v18 = 0;
          v49 = v16;
          do
          {
            if (*(_QWORD *)v53 != v17)
              objc_enumerationMutation(obj);
            v19 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v18);
            objc_msgSend(v9, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21)
            {
              v23 = objc_msgSend(v21, "unsignedIntegerValue");
              if (v23 == 1)
              {
                objc_msgSend(v10, "removeObjectForKey:", v19);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23 - 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v19);

              }
            }
            else
            {
              v25 = v10;
              v26 = v9;
              objc_msgSend(v20, "firstObject");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "startDate");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "components:fromDate:", 16, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v29, "day"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v50, "containsObject:", v30) & 1) == 0)
                objc_msgSend(v46, "addObject:", v27);
              if (objc_msgSend(v20, "count") == 1)
                objc_msgSend(v26, "removeObjectForKey:", v19);
              else
                objc_msgSend(v20, "removeObject:", v27);

              v9 = v26;
              v10 = v25;
              v17 = v47;
              v16 = v49;
            }

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v16);
      }
      v31 = v46;
      v32 = objc_msgSend(v46, "count");
      v33 = v45 >= v32 ? v32 : v45;
      objc_msgSend(v46, "sortUsingDescriptors:", v44);
      v11 = v42;
      v13 = v48;
      if (v33)
      {
        for (i = 0; i != v33; ++i)
        {
          objc_msgSend(v31, "objectAtIndexedSubscript:", i);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v35);
          objc_msgSend(v35, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "components:fromDate:", 16, v36);
          v37 = v13;
          v38 = v11;
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v39, "day"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "addObject:", v40);

          v31 = v46;
          v11 = v38;
          v13 = v37;

        }
      }
      v45 -= v33;

      v12 = v50;
    }
    while (objc_msgSend(v11, "count") < v43);
  }

  return v11;
}

- (id)sortedItemsByWeekOfMonthFromItems:(id)a3 sortDescriptors:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id obj;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "components:fromDate:", 4096, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "weekOfMonth"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v15);
        }
        objc_msgSend(v16, "addObject:", v12);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__PGMonthEnrichmentRule_sortedItemsByWeekOfMonthFromItems_sortDescriptors___block_invoke;
  v21[3] = &unk_1E842EEB8;
  v22 = v19;
  v17 = v19;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v21);

  return v6;
}

- (PGHighlightItemModelReader)modelReader
{
  return self->_modelReader;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_modelReader, 0);
  objc_storeStrong((id *)&self->_momentNodesAtWork, 0);
}

uint64_t __75__PGMonthEnrichmentRule_sortedItemsByWeekOfMonthFromItems_sortDescriptors___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "sortUsingDescriptors:", *(_QWORD *)(a1 + 32));
}

BOOL __195__PGMonthEnrichmentRule_enumerateChildVisibilityStateForHighlightItemList_sharingFilter_withGraph_neighborScoreComputer_usingBlock_maximumNumberOfVisibleItems_maximumNumberOfVisibleRegularItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "numberOfAssetsInExtendedForSharingFilter:", *(unsigned __int16 *)(a1 + 32)) != 0;
}

@end
