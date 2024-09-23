@implementation PGRelationshipTripAnalyzer

- (NSString)name
{
  return (NSString *)CFSTR("PGRelationshipTripAnalyzer");
}

- (PGRelationshipTripAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4;
  PGRelationshipTripAnalyzer *v5;
  PGRelationshipTripAnalyzer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipTripAnalyzer;
  v5 = -[PGRelationshipTripAnalyzer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_processor, v4);

  return v6;
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  void *v35;
  uint64_t v36;
  PGGraphMomentNodeCollection *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double Current;
  char *v49;
  void *v50;
  unint64_t v51;
  PGGraphMomentNodeCollection *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  uint64_t k;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void (**v75)(void *, _BYTE *, double);
  void *v76;
  void *v77;
  id v78;
  id obj;
  id obja;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  PGGraphPersonNodeCollection *v86;
  PGGraphMomentNodeCollection *v87;
  PGGraphMomentNodeCollection *v88;
  void *v89;
  void *context;
  char *contexta;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[4];
  id v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  char v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t buf[4];
  int v133;
  __int16 v134;
  const char *v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    objc_msgSend(WeakRetained, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trips");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "weekends");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = 0x1E0C99000uLL;
    v13 = (void *)MEMORY[0x1E0C99E20];
    v76 = (void *)v11;
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v77 = v15;
    if (!objc_msgSend(v15, "count"))
    {
LABEL_75:

      goto LABEL_76;
    }
    v74 = WeakRetained;
    v75 = v5;
    v73 = v4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v9;
    objc_msgSend(v9, "meNode");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = 0u;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v72 = v10;
    obj = v10;
    v92 = v16;
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
    if (v83)
    {
      v81 = *(_QWORD *)v123;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v123 != v81)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * v17);
          v19 = MEMORY[0x1CAA4EB2C]();
          objc_msgSend(*(id *)(v12 + 3616), "set");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v12 + 3616), "set");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = 0u;
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v21 = v18;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
          v94 = v17;
          context = (void *)v19;
          if (v22)
          {
            v23 = v22;
            v24 = 0;
            v25 = *(_QWORD *)v119;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v119 != v25)
                  objc_enumerationMutation(v21);
                v27 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
                v28 = (void *)MEMORY[0x1CAA4EB2C]();
                objc_msgSend(v27, "personNodes");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "count");
                v31 = objc_msgSend(v29, "containsObject:", v98);
                if (v30 == 1)
                  v32 = v31;
                else
                  v32 = 1;
                if (v30 == 2)
                  v33 = v31;
                else
                  v33 = 0;
                if (v32 == 1 && v33 == 0)
                {
                  v36 = v30 > 1;
                }
                else
                {
                  objc_msgSend(v29, "allObjects");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v96, "addObjectsFromArray:", v35);

                  objc_msgSend(v20, "addObject:", v27);
                  v36 = 1;
                }
                v24 += v36;

                objc_autoreleasePoolPop(v28);
              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v118, v130, 16);
            }
            while (v23);
          }
          else
          {
            v24 = 0;
          }

          v37 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v20, v85);
          v86 = -[MAElementCollection initWithSet:graph:]([PGGraphPersonNodeCollection alloc], "initWithSet:graph:", v96, v85);
          v88 = v37;
          +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = 0u;
          v115 = 0u;
          v116 = 0u;
          v117 = 0u;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
          if (v39)
          {
            v40 = v39;
            v41 = *(_QWORD *)v115;
            do
            {
              for (j = 0; j != v40; ++j)
              {
                if (*(_QWORD *)v115 != v41)
                  objc_enumerationMutation(v38);
                v43 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
                if ((objc_msgSend(v43, "isMeNode") & 1) == 0
                  && (double)(unint64_t)objc_msgSend(v38, "countForObject:", v43) / (double)v24 >= 0.75)
                {
                  objc_msgSend(v43, "localIdentifier");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "objectForKeyedSubscript:", v44);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v45, "unsignedIntegerValue") + 1);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v92, "setObject:forKeyedSubscript:", v46, v44);
                  objc_msgSend(v93, "addObject:", v21);

                }
              }
              v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v114, v129, 16);
            }
            while (v40);
          }

          objc_autoreleasePoolPop(context);
          v17 = v94 + 1;
          v16 = v92;
          v12 = 0x1E0C99000;
        }
        while (v94 + 1 != v83);
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v131, 16);
      }
      while (v83);
    }

    objc_msgSend(v77, "minusSet:", v93);
    v47 = objc_msgSend(v93, "count");
    v5 = v75;
    if (v75)
    {
      Current = CFAbsoluteTimeGetCurrent();
      WeakRetained = v74;
      v9 = v85;
      if (Current - v6 >= 0.01)
      {
        v126 = 0;
        v75[2](v75, &v126, 0.5);
        if (v126)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v133 = 105;
            v134 = 2080;
            v135 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = v72;
          v4 = v73;
LABEL_74:

          goto LABEL_75;
        }
        v6 = Current;
      }
    }
    else
    {
      WeakRetained = v74;
      v9 = v85;
    }
    v111[0] = MEMORY[0x1E0C809B0];
    v111[1] = 3221225472;
    v111[2] = __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v111[3] = &unk_1E842B5A8;
    v82 = WeakRetained;
    v112 = v82;
    v113 = v47;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v111);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v77, "count");
    v107 = 0u;
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v78 = v77;
    v84 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
    if (v84)
    {
      obja = *(id *)v108;
      do
      {
        v49 = 0;
        do
        {
          if (*(id *)v108 != obja)
            objc_enumerationMutation(v78);
          contexta = v49;
          v50 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)v49);
          v89 = (void *)MEMORY[0x1CAA4EB2C]();
          v51 = objc_msgSend(v50, "count");
          v52 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v50, v9);
          objc_msgSend(v82, "personNodes");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = v52;
          +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v55 = v54;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
          if (v56)
          {
            v57 = v56;
            v58 = *(_QWORD *)v104;
            v59 = (double)v51;
            do
            {
              for (k = 0; k != v57; ++k)
              {
                if (*(_QWORD *)v104 != v58)
                  objc_enumerationMutation(v55);
                v61 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
                v62 = objc_msgSend(v55, "countForObject:", v61);
                objc_msgSend(v61, "localIdentifier");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "objectForKeyedSubscript:", v63);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v64, "unsignedIntegerValue") + 1);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v95, "setObject:forKeyedSubscript:", v65, v63);

                objc_msgSend(v97, "objectForKeyedSubscript:", v63);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v66, "doubleValue");
                objc_msgSend(v67, "numberWithDouble:", (double)v62 / v59 + v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "setObject:forKeyedSubscript:", v69, v63);

              }
              v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v103, v127, 16);
            }
            while (v57);
          }

          objc_autoreleasePoolPop(v89);
          v49 = contexta + 1;
          v9 = v85;
        }
        while (contexta + 1 != (char *)v84);
        v84 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
      }
      while (v84);
    }

    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke_2;
    v99[3] = &unk_1E842B5D0;
    v100 = v82;
    v101 = v95;
    v102 = v71;
    v70 = v95;
    objc_msgSend(v97, "enumerateKeysAndObjectsUsingBlock:", v99);
    v4 = v73;
    WeakRetained = v74;
    v5 = v75;
    v10 = v72;
    v16 = v92;
    if (v75)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v126 = 0;
        v75[2](v75, &v126, 1.0);
        if (v126)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v133 = 148;
            v134 = 2080;
            v135 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_74;
  }
  v126 = 0;
  v5[2](v5, &v126, 0.0);
  if (!v126)
  {
    v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v133 = 34;
    v134 = 2080;
    v135 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peopl"
           "e Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_76:

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_processor);
}

void __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v5, "registerOneOnOneTripAppearance:amongOneOnOneTrips:", objc_msgSend(v6, "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));

}

void __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "relationshipAnalyzerPropertiesForPersonLocalIdentifier:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v6, "registerNumberOfTrips:withTripsScore:amongTrips:", v8, *(_QWORD *)(a1 + 48));

  }
}

@end
