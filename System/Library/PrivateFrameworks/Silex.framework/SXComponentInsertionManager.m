@implementation SXComponentInsertionManager

- (SXComponentInsertionManager)initWithComponentInserterManager:(id)a3 conditionEngine:(id)a4 blueprintAnalyzer:(id)a5 unitConverterFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SXComponentInsertionManager *v15;
  SXComponentInsertionManager *v16;
  uint64_t v17;
  NSMutableArray *cache;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXComponentInsertionManager;
  v15 = -[SXComponentInsertionManager init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inserterManager, a3);
    objc_storeStrong((id *)&v16->_conditionEngine, a4);
    objc_storeStrong((id *)&v16->_blueprintAnalyzer, a5);
    objc_storeStrong((id *)&v16->_unitConverterFactory, a6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    cache = v16->_cache;
    v16->_cache = (NSMutableArray *)v17;

  }
  return v16;
}

- (id)insertComponentsForBlueprint:(id)a3 DOMObjectProvider:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  SXComponentInsertionLayoutProvider *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t n;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t ii;
  void *v80;
  void *v81;
  void *v82;
  BOOL v83;
  id *v84;
  void *v85;
  SXComponentInsertionLayoutProvider *v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  void *v92;
  SXComponentInsertionLayoutProvider *v93;
  uint64_t v94;
  id obj;
  id obja;
  uint64_t v97;
  id v98;
  void *v99;
  uint64_t m;
  uint64_t v101;
  void *v102;
  id v103;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[5];
  _QWORD v118[5];
  _QWORD v119[4];
  id v120;
  id v121;
  id v122;
  SXComponentInsertionLayoutProvider *v123;
  __int128 *p_buf;
  uint64_t *v125;
  uint64_t *v126;
  id v127;
  id location;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void (*v145)(uint64_t);
  id v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint8_t v158[128];
  uint8_t v159[4];
  uint64_t v160;
  __int16 v161;
  id v162;
  __int128 buf;
  uint64_t v164;
  uint64_t (*v165)(uint64_t, uint64_t);
  void (*v166)(uint64_t);
  id v167;
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  obj = 0;
  v102 = v5;
  if (v5 && v6)
  {
    v103 = v6;
    v7 = SXInsertionLog;
    if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_217023000, v7, OS_LOG_TYPE_DEFAULT, "Initiating component insertion for layout blueprint: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v8 = [SXComponentInsertionLayoutProvider alloc];
    -[SXComponentInsertionManager unitConverterFactory](self, "unitConverterFactory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = -[SXComponentInsertionLayoutProvider initWithBlueprint:DOMObjectProvider:unitConverterFactory:](v8, "initWithBlueprint:DOMObjectProvider:unitConverterFactory:", v5, v103, v9);

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v164 = 0x3032000000;
    v165 = __Block_byref_object_copy__4;
    v166 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v167 = (id)objc_claimAutoreleasedReturnValue();
    v147 = 0;
    v148 = &v147;
    v149 = 0x3032000000;
    v150 = __Block_byref_object_copy__4;
    v151 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v152 = (id)objc_claimAutoreleasedReturnValue();
    v141 = 0;
    v142 = &v141;
    v143 = 0x3032000000;
    v144 = __Block_byref_object_copy__4;
    v145 = __Block_byref_object_dispose__4;
    -[SXComponentInsertionManager inserterManager](self, "inserterManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inserters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = (id)objc_msgSend(v11, "mutableCopy");

    v12 = (id)SXInsertionLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend((id)v142[5], "count");
      *(_DWORD *)v159 = 134218240;
      v160 = v13;
      v161 = 2050;
      v162 = v5;
      _os_log_impl(&dword_217023000, v12, OS_LOG_TYPE_DEFAULT, "Initial queue of inserters contains %lu inserter(s), blueprint=%{public}p", v159, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    -[SXComponentInsertionManager cache](self, "cache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v138 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * i);
          -[SXFullscreenCaption caption](v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXTangierTextRenderCollectorItem storage](v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "validateCache:DOMObjectProvider:", v21, v103);

          v23 = (id)SXInsertionLog;
          v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              -[SXFullscreenCaption text](v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v159 = 138543618;
              v160 = (uint64_t)v25;
              v161 = 2050;
              v162 = v102;
              _os_log_impl(&dword_217023000, v23, OS_LOG_TYPE_DEFAULT, "Using cached results from %{public}@ inserter, blueprint=%{public}p", v159, 0x16u);

            }
            v26 = (void *)v142[5];
            -[SXFullscreenCaption text](v19);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v27);

            -[SXTangierTextRenderCollectorItem storage](v19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "addObjectsFromArray:", v28);
          }
          else
          {
            if (v24)
            {
              -[SXFullscreenCaption text](v19);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v159 = 138543618;
              v160 = (uint64_t)v29;
              v161 = 2050;
              v162 = v102;
              _os_log_impl(&dword_217023000, v23, OS_LOG_TYPE_DEFAULT, "Cached results no longer valid for from %{public}@ inserter, blueprint=%{public}p", v159, 0x16u);

            }
            -[SXComponentInsertionManager cache](self, "cache");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObject:", v19);
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v137, v158, 16);
      }
      while (v16);
    }

    objc_msgSend(v103, "components");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allComponents");
    v92 = (void *)objc_claimAutoreleasedReturnValue();

    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    obja = (id)v142[5];
    v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
    if (v31)
    {
      v97 = *(_QWORD *)v134;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v134 != v97)
            objc_enumerationMutation(obja);
          v33 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
          objc_msgSend(v33, "conditionEngine");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_opt_respondsToSelector();

          if ((v35 & 1) != 0)
          {
            objc_msgSend(v33, "conditionEngine");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "prepareWithComponents:layoutProvider:DOMObjectProvider:", v92, v93, v103);

          }
          objc_msgSend(v33, "conditionsForDOMObjectProvider:", v103);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          v38 = v37;
          v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
          if (v39)
          {
            v40 = *(_QWORD *)v130;
            do
            {
              for (k = 0; k != v39; ++k)
              {
                if (*(_QWORD *)v130 != v40)
                  objc_enumerationMutation(v38);
                v42 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * k);
                -[SXComponentInsertionManager conditionEngine](self, "conditionEngine");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addCondition:", v42);

              }
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v129, v156, 16);
            }
            while (v39);
          }

          v44 = (void *)v148[5];
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKey:", v45, v33);

        }
        v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
      }
      while (v31);
    }

    -[SXComponentInsertionManager conditionEngine](self, "conditionEngine");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "prepareWithComponents:layoutProvider:DOMObjectProvider:", v92, v93, v103);

    v47 = (id)SXInsertionLog;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = objc_msgSend((id)v142[5], "count");
      *(_DWORD *)v159 = 134349312;
      v160 = v48;
      v161 = 2050;
      v162 = v102;
      _os_log_impl(&dword_217023000, v47, OS_LOG_TYPE_DEFAULT, "Starting blueprint analyzing with %{public}lu inserter(s), blueprint=%{public}p", v159, 0x16u);
    }

    objc_initWeak(&location, self);
    -[SXComponentInsertionManager blueprintAnalyzer](self, "blueprintAnalyzer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = MEMORY[0x24BDAC760];
    v119[0] = MEMORY[0x24BDAC760];
    v119[1] = 3221225472;
    v119[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke;
    v119[3] = &unk_24D68DF50;
    objc_copyWeak(&v127, &location);
    v88 = v99;
    v120 = v88;
    v121 = v102;
    p_buf = &buf;
    v125 = &v141;
    v122 = v103;
    v87 = v93;
    v123 = v87;
    v126 = &v147;
    v117[4] = &v141;
    v118[0] = v50;
    v118[1] = 3221225472;
    v118[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_6;
    v118[3] = &unk_24D68DF78;
    v118[4] = &v141;
    v117[0] = v50;
    v117[1] = 3221225472;
    v117[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_2;
    v117[3] = &unk_24D68DFA0;
    v91 = v121;
    v98 = v122;
    objc_msgSend(v49, "analyzeBlueprint:DOMObjectProvider:onMarkerFound:then:onEndReached:", v121, v122, v119, v118, v117);

    objc_msgSend(v98, "DOM");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)objc_msgSend(v51, "mutableCopy");

    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "reverseObjectEnumerator");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v113, v155, 16);
    if (v53)
    {
      v89 = v52;
      v90 = *(_QWORD *)v114;
      do
      {
        v94 = v53;
        for (m = 0; m != v94; ++m)
        {
          if (*(_QWORD *)v114 != v90)
            objc_enumerationMutation(v89);
          v54 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * m);
          -[SXFullscreenCaption text](v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXFullscreenCaption caption](v54);
          v56 = objc_claimAutoreleasedReturnValue();
          -[SXComponentInsertionManager updateDOM:layoutBlueprint:insert:marker:](self, "updateDOM:layoutBlueprint:insert:marker:", obj, v91, v55, v56);

          -[SXComponentInsertionManager conditionEngine](self, "conditionEngine");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v56) = objc_opt_respondsToSelector();

          if ((v56 & 1) != 0)
          {
            -[SXComponentInsertionManager conditionEngine](self, "conditionEngine");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXFullscreenCaption text](v54);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "component");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[SXFullscreenCaption caption](v54);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "approximateLocation");
            objc_msgSend(v58, "insertedComponent:approximateLocation:", v60);

          }
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          -[SXComponentInsertionManager inserterManager](self, "inserterManager");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "inserters");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v109, v154, 16);
          if (v64)
          {
            v65 = *(_QWORD *)v110;
            do
            {
              for (n = 0; n != v64; ++n)
              {
                if (*(_QWORD *)v110 != v65)
                  objc_enumerationMutation(v63);
                v67 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * n);
                objc_msgSend(v67, "conditionEngine");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_opt_respondsToSelector();

                if ((v69 & 1) != 0)
                {
                  objc_msgSend(v67, "conditionEngine");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SXFullscreenCaption text](v54);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "component");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SXFullscreenCaption caption](v54);
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "approximateLocation");
                  objc_msgSend(v70, "insertedComponent:approximateLocation:", v72);

                }
              }
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v109, v154, 16);
            }
            while (v64);
          }

        }
        v52 = v89;
        v53 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v113, v155, 16);
      }
      while (v53);
    }

    v74 = (id)SXInsertionLog;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
      *(_DWORD *)v159 = 134349312;
      v160 = v75;
      v161 = 2050;
      v162 = v91;
      _os_log_impl(&dword_217023000, v74, OS_LOG_TYPE_DEFAULT, "Finished DOM mutation for %{public}lu insert(s), blueprint=%{public}p", v159, 0x16u);
    }

    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    -[SXComponentInsertionManager inserterManager](self, "inserterManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "inserters");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v105, v153, 16);
    if (v78)
    {
      v101 = *(_QWORD *)v106;
      do
      {
        for (ii = 0; ii != v78; ++ii)
        {
          if (*(_QWORD *)v106 != v101)
            objc_enumerationMutation(v77);
          v80 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * ii);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend((id)v148[5], "objectForKey:", v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "cacheValidatorForCache:DOMObjectProvider:", v81, v98);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v81, "count"))
              v83 = v82 == 0;
            else
              v83 = 1;
            if (!v83)
            {
              v84 = -[SXComponentInsertionCacheItem initWithInserter:validator:results:]((id *)[SXComponentInsertionCacheItem alloc], v80, v82, v81);
              -[SXComponentInsertionManager cache](self, "cache");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v84);

            }
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v80, "componentInsertionCompleted");
        }
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v105, v153, 16);
      }
      while (v78);
    }

    objc_destroyWeak(&v127);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v141, 8);
    _Block_object_dispose(&v147, 8);

    _Block_object_dispose(&buf, 8);
    v6 = v103;
  }

  return obj;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id to;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 88));
  v4 = objc_loadWeakRetained(&to);
  v5 = v4 == 0;

  if (v5)
  {
    v19 = 0;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[SXFullscreenCaption caption](v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToMarker:", v3, (_QWORD)v24);

          if (v12)
          {
            v20 = (id)SXInsertionLog;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              -[SXFullscreenCaption text](v10);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = *(void **)(a1 + 40);
              *(_DWORD *)buf = 138543874;
              v30 = v21;
              v31 = 2114;
              v32 = v3;
              v33 = 2050;
              v34 = v22;
              _os_log_impl(&dword_217023000, v20, OS_LOG_TYPE_DEFAULT, "Inserting cached insert %{public}@ for marker: %{public}@, blueprint=%{public}p", buf, 0x20u);

            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v10);
            v19 = 2;
            goto LABEL_17;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
        if (v7)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained(&to);
    objc_msgSend(v13, "insertForMarker:inserter:DOMObjectProvider:layoutProvider:", v3, v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = SXInsertionLog;
      if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v30 = v14;
        v31 = 2114;
        v32 = v3;
        v33 = 2114;
        v34 = v6;
        v35 = 2050;
        v36 = v16;
        _os_log_impl(&dword_217023000, v15, OS_LOG_TYPE_DEFAULT, "Adding insert %{public}@ at marker %{public}@ for inserter: %{public}@, blueprint=%{public}p", buf, 0x2Au);
      }
      v17 = -[SXComponentInsertionResult initWithInsert:marker:]((id *)[SXComponentInsertionResult alloc], v14, v3);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v17);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "objectForKey:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v17);

      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
LABEL_17:

  }
  objc_destroyWeak(&to);

  return v19;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2 != 1)
    return 0;
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") < 2)
    return 0;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObject:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

  return 1;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_2(uint64_t a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") < 2)
    return 2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "removeObjectAtIndex:", 0);

  return 1;
}

- (id)insertForMarker:(id)a3 inserter:(id)a4 DOMObjectProvider:(id)a5 layoutProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SXComponentInsertionManager conditionEngine](self, "conditionEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "validateMarker:componentTraits:layoutProvider:", v10, objc_msgSend(v11, "componentTraits"), v13);

  if (!v15)
    goto LABEL_10;
  objc_msgSend(v11, "conditionEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "validateMarker:componentTraits:layoutProvider:", v10, objc_msgSend(v11, "componentTraits"), v13))
  {

  }
  else
  {
    objc_msgSend(v11, "conditionEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
LABEL_10:
      v19 = 0;
      goto LABEL_11;
    }
  }
  if (!objc_msgSend(v11, "validateMarker:DOMObjectProvider:layoutProvider:", v10, v12, v13))
    goto LABEL_10;
  objc_msgSend(v11, "componentInsertForMarker:DOMObjectProvider:layoutProvider:", v10, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18
    || (objc_msgSend(v18, "component"), (v20 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v21 = (void *)v20,
        objc_msgSend(v19, "componentLayout"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        !v22))
  {

    goto LABEL_10;
  }
LABEL_11:

  return v19;
}

- (void)updateDOM:(id)a3 layoutBlueprint:(id)a4 insert:(id)a5 marker:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v12, "path", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v18), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v16);
  }

  objc_msgSend(v9, "components");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsForContainerComponentWithPath:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "component");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(v11, "component");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIdentifier:", v26);

  }
  objc_msgSend(v22, "layout");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(v11, "component");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLayout:", v30);

  }
  objc_msgSend(v22, "anchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    objc_msgSend(v11, "component");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAnchor:", v33);

  }
  objc_msgSend(v11, "component");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertComponent:afterComponent:", v34, v35);

  objc_msgSend(v9, "componentLayouts");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentLayout");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "layout");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKey:", v37, v38);

  objc_msgSend(v12, "componentAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "targetComponentIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v12, "componentAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "targetComponentIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateSizeForComponentWithIdentifier:", v42);

  }
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (SXComponentInserterManager)inserterManager
{
  return self->_inserterManager;
}

- (SXBlueprintAnalyzer)blueprintAnalyzer
{
  return self->_blueprintAnalyzer;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (NSMutableArray)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_blueprintAnalyzer, 0);
  objc_storeStrong((id *)&self->_inserterManager, 0);
  objc_storeStrong((id *)&self->_conditionEngine, 0);
}

@end
