@implementation SPGeneralQueryTask

+ (id)contactEntityFromQueryContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "searchEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isContactEntitySearch"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)initForSession:(id)a3 withQuery:(id)a4
{
  id v6;
  id v7;
  SPGeneralQueryTask *v8;
  SPGeneralQueryTask *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[SPQueryTask init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[SPQueryTask setQuery:](v8, "setQuery:", v7);
    -[SPGeneralQueryTask setSession:](v9, "setSession:", v6);
  }

  return v9;
}

- (void)updateResultsWithContactHeader
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  -[SPQueryTask previousQueryContext](self, "previousQueryContext");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactEntityFromQueryContext:", v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "contactEntityFromQueryContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (updateResultsWithContactHeader_onceToken_0 != -1)
    dispatch_once(&updateResultsWithContactHeader_onceToken_0, &__block_literal_global_2);
  if (updateResultsWithContactHeader_isPeopleViewService_0
    || v6 && (!v3 || (objc_msgSend(v6, "hasSameContactAsContactEntity:", v3) & 1) == 0))
  {
    v7 = objc_alloc(MEMORY[0x24BE84970]);
    v8 = (void *)objc_msgSend(v7, "initWithSections:", MEMORY[0x24BDBD1A8]);
    -[SPQueryTask token](self, "token");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    -[SPGeneralQueryTask searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:](self, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v9, v8, 1, 1, 0, 0, 0.0, v10, 0, 0, 0);

  }
}

void __52__SPGeneralQueryTask_updateResultsWithContactHeader__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  updateResultsWithContactHeader_isPeopleViewService_0 = objc_msgSend(v0, "isEqualToString:", CFSTR("PeopleViewService"));

}

- (void)start
{
  __assert_rtn("-[SPGeneralQueryTask start]", "SPGeneralQueryTask.m", 212, "self.started == NO");
}

void __27__SPGeneralQueryTask_start__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint8_t v16[16];

  if (objc_msgSend(*(id *)(a1 + 32), "started"))
    __27__SPGeneralQueryTask_start__block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 1);
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "setMutableSections:", v2);

  v3 = objc_alloc(MEMORY[0x24BE84DB8]);
  objc_msgSend(*(id *)(a1 + 32), "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.searchd.frontend.query.start"), 0, objc_msgSend(v4, "queryIdent"));

  objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "query");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queryProcessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startQuery:queue:delegate:", v7, v8, *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setToken:", v9);

  objc_msgSend(*(id *)(a1 + 32), "updateResultsWithContactHeader");
  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "query");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reportFeedback:queryId:", v5, objc_msgSend(v11, "queryIdent"));

  SPLogForSPLogCategoryTelemetry();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "queryID");

  if (v14 && os_signpost_enabled(v12))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_2279CC000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "queryUI", " enableTelemetry=YES ", v16, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "token");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "queryID");
  kdebug_trace();

}

- (void)clear
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearInput:", v3);

}

- (void)cancel
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logWithBundleID:indexOperation:itemCount:reason:", CFSTR("com.apple.SpotlightUI"), 4, 1, CFSTR("UserInput"));

  objc_msgSend(MEMORY[0x24BE84960], "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelQuery:", v4);

}

- (id)searchString
{
  void *v2;
  void *v3;
  void *v4;

  -[SPQueryTask query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)mergeSections
{
  void *v2;
  void *v3;
  SPGeneralQueryTask *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t j;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  int v117;
  void *v118;
  int v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  int v133;
  uint64_t v134;
  void *v135;
  int v136;
  void *v137;
  int v138;
  void *v139;
  void *v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  os_log_type_t v145;
  _BOOL4 v146;
  os_log_type_t v147;
  const char *v148;
  NSObject *v149;
  uint32_t v150;
  void *v151;
  void *v152;
  id v153;
  uint64_t v154;
  id v155;
  id v156;
  void *v157;
  id obj;
  id v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  id v167;
  id v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
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
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  uint8_t buf[4];
  id v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _QWORD v201[2];
  _BYTE v202[128];
  _QWORD v203[2];
  _BYTE v204[128];
  _BYTE v205[128];
  _BYTE v206[128];
  uint64_t v207;

  v4 = self;
  v207 = *MEMORY[0x24BDAC8D0];
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v161 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v151 = v4;
  -[SPQueryTask mutableSections](v4, "mutableSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  if ((v4 & 1) == 0)
  {

    v8 = 0;
  }
  v152 = v8;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  objc_msgSend(v151, "mutableSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  obj = v11;
  v163 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v193, v206, 16);
  if (v163)
  {
    v162 = *(_QWORD *)v194;
    v171 = *MEMORY[0x24BEB04D0];
    v170 = *MEMORY[0x24BEB0358];
    v153 = v6;
    v154 = *MEMORY[0x24BEB04B8];
    do
    {
      for (i = 0; i != v163; ++i)
      {
        if (*(_QWORD *)v194 != v162)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * i);
        if (!objc_msgSend(v13, "resultsCount"))
          continue;
        objc_msgSend(v13, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = i;
        if (v14)
        {
          v15 = v13;
          objc_msgSend(v13, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uppercaseString");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            v19 = 0;
            goto LABEL_14;
          }
          v15 = v13;
          objc_msgSend(v13, "bundleIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v18 = (void *)v17;
        objc_msgSend(v161, "objectForKey:", v17);
        v19 = (id)objc_claimAutoreleasedReturnValue();

        v13 = v15;
LABEL_14:

        if ((objc_msgSend(v19, "doNotFold") & 1) != 0 || objc_msgSend(v13, "doNotFold"))
        {

LABEL_17:
          objc_msgSend(v6, "addObject:", v13);
          objc_msgSend(v13, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v13, "title");
            v21 = v13;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uppercaseString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "setObject:forKey:", v21, v23);

            i = v164;
            goto LABEL_142;
          }
          objc_msgSend(v13, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          i = v164;
          if (v24)
          {
            objc_msgSend(v13, "bundleIdentifier");
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v13;
            v22 = (void *)v25;
            objc_msgSend(v161, "setObject:forKey:", v26, v25);
            goto LABEL_142;
          }
          continue;
        }
        if (!v19)
          goto LABEL_17;
        v27 = v19;
        v28 = objc_msgSend(v6, "indexOfObject:", v27);
        v169 = v27;
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_141;
        v29 = v28;
        v30 = objc_msgSend(v13, "maxInitiallyVisibleResults");
        if (v30 <= objc_msgSend(v27, "maxInitiallyVisibleResults"))
          v31 = v27;
        else
          v31 = v13;
        objc_msgSend(v27, "setMaxInitiallyVisibleResults:", objc_msgSend(v31, "maxInitiallyVisibleResults"));
        v157 = v13;
        objc_msgSend(v13, "setMaxInitiallyVisibleResults:", objc_msgSend(v27, "maxInitiallyVisibleResults"));
        objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v29, v27);
        v172 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend(v27, "resultSet");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
        v33 = v27;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "sectionBundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        v37 = v154;
        if (v35)
        {
          v156 = v35;
        }
        else
        {
          objc_msgSend(v33, "resultSet");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "applicationBundleIdentifier");
          v156 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v157, "resultSet");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sectionBundleIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (v42)
        {
          v155 = v42;
        }
        else
        {
          objc_msgSend(v157, "resultSet");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectAtIndexedSubscript:", 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "applicationBundleIdentifier");
          v155 = (id)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_msgSend(v156, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) != 0
          || objc_msgSend(v155, "isEqualToString:", CFSTR("com.apple.Maps")))
        {
          v46 = v157;
          if (objc_msgSend(v156, "isEqualToString:", CFSTR("com.apple.Maps")))
          {
            objc_msgSend(v169, "results");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (id)objc_msgSend(v47, "copy");

            objc_msgSend(v169, "clearResults");
            objc_msgSend(v157, "results");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              objc_msgSend(v157, "results");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "addResultsFromArray:", v50);

            }
            objc_msgSend(v157, "clearResults");
            if (v48)
              objc_msgSend(v157, "addResultsFromArray:", v48);
            v51 = objc_msgSend(v157, "domain");
            objc_msgSend(v157, "setDomain:", objc_msgSend(v169, "domain"));
            objc_msgSend(v169, "setDomain:", v51);
            objc_msgSend(v157, "title");
            v52 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "title");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "setTitle:", v53);

            v54 = (void *)v52;
            objc_msgSend(v169, "setTitle:", v52);
LABEL_77:

          }
          goto LABEL_78;
        }
        if (objc_msgSend(v169, "domain") != 2)
        {
          objc_msgSend(v169, "resultSet");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "applicationBundleIdentifier");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v57;
          if (v57)
          {
            v48 = v57;
          }
          else
          {
            objc_msgSend(v169, "resultSet");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "sectionBundleIdentifier");
            v48 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v157, "resultSet");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", 0);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "applicationBundleIdentifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v63;
          if (v63)
          {
            v160 = v63;
          }
          else
          {
            objc_msgSend(v157, "resultSet");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "sectionBundleIdentifier");
            v160 = (id)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v157, "title");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "uppercaseString");
          v165 = (void *)objc_claimAutoreleasedReturnValue();

          v191 = 0u;
          v192 = 0u;
          v189 = 0u;
          v190 = 0u;
          objc_msgSend(v152, "resultSet");
          v167 = (id)objc_claimAutoreleasedReturnValue();
          v68 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
          if (!v68)
          {
            v54 = v160;
            goto LABEL_76;
          }
          v69 = v68;
          v70 = *(_QWORD *)v190;
          v159 = v48;
          v54 = v160;
          while (1)
          {
            for (j = 0; j != v69; ++j)
            {
              if (*(_QWORD *)v190 != v70)
                objc_enumerationMutation(v167);
              v72 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * j);
              objc_msgSend(v72, "title");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v73)
                goto LABEL_72;
              if (v48)
              {
                objc_msgSend(v72, "resultBundleId");
                v3 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v3, "isEqualToString:", v48) & 1) != 0)
                  goto LABEL_60;
              }
              if (v54)
              {
                objc_msgSend(v72, "resultBundleId");
                v2 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v2, "isEqualToString:", v54))
                {

                  if (v48)
LABEL_60:

LABEL_71:
                  objc_msgSend(v172, "addObject:", v73);
                  goto LABEL_72;
                }
                if (!v165)
                {
                  v74 = 0;
LABEL_67:

                  goto LABEL_68;
                }
              }
              else if (!v165)
              {
                v74 = 0;
                goto LABEL_68;
              }
              v75 = v2;
              v76 = v3;
              objc_msgSend(v72, "sectionHeader");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "uppercaseString");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v74 = objc_msgSend(v78, "isEqual:", v165);

              v3 = v76;
              v2 = v75;
              v48 = v159;
              v54 = v160;
              if (v160)
                goto LABEL_67;
LABEL_68:
              if (v48)

              if ((v74 & 1) != 0)
                goto LABEL_71;
LABEL_72:

            }
            v69 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v189, v205, 16);
            if (!v69)
            {
LABEL_76:

              v46 = v157;
              goto LABEL_77;
            }
          }
        }
        v46 = v157;
LABEL_78:
        v168 = v3;
        objc_msgSend(v46, "bundleIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "isEqualToString:", *MEMORY[0x24BE84A98]);

        if (v80)
        {
          v166 = v2;
          v81 = (void *)objc_opt_new();
          v185 = 0u;
          v186 = 0u;
          v187 = 0u;
          v188 = 0u;
          objc_msgSend(v169, "resultSet");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v185, v204, 16);
          if (v83)
          {
            v84 = v83;
            v85 = *(_QWORD *)v186;
            do
            {
              for (k = 0; k != v84; ++k)
              {
                if (*(_QWORD *)v186 != v85)
                  objc_enumerationMutation(v82);
                v87 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * k);
                objc_msgSend(v87, "resultBundleId");
                v88 = objc_claimAutoreleasedReturnValue();
                if (v88)
                {
                  v89 = (void *)v88;
                  objc_msgSend(v87, "completion");
                  v90 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v90)
                  {
                    objc_msgSend(v87, "resultBundleId");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    v203[0] = v91;
                    objc_msgSend(v87, "completion");
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    v203[1] = v92;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v203, 2);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v81, "setObject:forKeyedSubscript:", v87, v93);
                  }
                }
              }
              v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v185, v204, 16);
            }
            while (v84);
          }

          v183 = 0u;
          v184 = 0u;
          v181 = 0u;
          v182 = 0u;
          objc_msgSend(v157, "resultSet");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v202, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v182;
            do
            {
              for (m = 0; m != v96; ++m)
              {
                if (*(_QWORD *)v182 != v97)
                  objc_enumerationMutation(v94);
                v99 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * m);
                objc_msgSend(v99, "resultBundleId");
                v100 = objc_claimAutoreleasedReturnValue();
                if (v100)
                {
                  v101 = (void *)v100;
                  objc_msgSend(v99, "completion");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v102)
                  {
                    objc_msgSend(v99, "resultBundleId");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[0] = v103;
                    objc_msgSend(v99, "completion");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v201[1] = v104;
                    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v201, 2);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "objectForKeyedSubscript:", v105);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v106)
                      objc_msgSend(v169, "addResults:", v99);

                  }
                }
              }
              v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v181, v202, 16);
            }
            while (v96);
          }

          v37 = v154;
          v2 = v166;
        }
        v179 = 0u;
        v180 = 0u;
        v177 = 0u;
        v178 = 0u;
        objc_msgSend(v169, "resultSet");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v200, 16);
        if (v108)
        {
          v109 = v108;
          v110 = *(_QWORD *)v178;
          do
          {
            v111 = 0;
            do
            {
              if (*(_QWORD *)v178 != v110)
                objc_enumerationMutation(v107);
              v112 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * v111);
              objc_msgSend(v112, "resultBundleId");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = objc_msgSend(v113, "isEqualToString:", v37);

              if (v114)
              {
                objc_msgSend(v112, "contentURL");
                v115 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v112, "resultBundleId");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                v117 = objc_msgSend(v116, "isEqualToString:", v171);

                if (v117
                  || (objc_msgSend(v112, "contentType"),
                      v118 = (void *)objc_claimAutoreleasedReturnValue(),
                      v119 = objc_msgSend(v118, "isEqualToString:", v170),
                      v118,
                      v119))
                {
                  objc_msgSend(v112, "identifier");
                  v115 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v112, "title");
                  v121 = objc_claimAutoreleasedReturnValue();
                  if (!v121)
                    goto LABEL_114;
                  v122 = (void *)v121;
                  objc_msgSend(v112, "title");
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v123, "text");
                  v124 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v124)
                    goto LABEL_114;
                  objc_msgSend(v112, "title");
                  v115 = objc_claimAutoreleasedReturnValue();
                }
              }
              v120 = (void *)v115;
              if (v115)
              {
                objc_msgSend(v172, "addObject:", v115);

              }
LABEL_114:
              ++v111;
            }
            while (v109 != v111);
            v125 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v177, v200, 16);
            v109 = v125;
          }
          while (v125);
        }

        v175 = 0u;
        v176 = 0u;
        v173 = 0u;
        v174 = 0u;
        objc_msgSend(v157, "resultSet");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v173, v199, 16);
        if (!v127)
          goto LABEL_140;
        v128 = v127;
        v129 = *(_QWORD *)v174;
        do
        {
          v130 = 0;
          do
          {
            if (*(_QWORD *)v174 != v129)
              objc_enumerationMutation(v126);
            v131 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * v130);
            objc_msgSend(v131, "resultBundleId");
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = objc_msgSend(v132, "isEqualToString:", v37);

            if (v133)
            {
              objc_msgSend(v131, "contentURL");
              v134 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v131, "resultBundleId");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = objc_msgSend(v135, "isEqualToString:", v171);

              if (v136
                || (objc_msgSend(v131, "contentType"),
                    v137 = (void *)objc_claimAutoreleasedReturnValue(),
                    v138 = objc_msgSend(v137, "isEqualToString:", v170),
                    v137,
                    v138))
              {
                objc_msgSend(v131, "identifier");
                v134 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v131, "title");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v139)
                  goto LABEL_133;
                objc_msgSend(v131, "title");
                v140 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v140, "text");
                v141 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v141)
                {
                  v139 = 0;
                  goto LABEL_133;
                }
                objc_msgSend(v131, "title");
                v134 = objc_claimAutoreleasedReturnValue();
              }
            }
            v139 = (void *)v134;
            if (v134 && (objc_msgSend(v172, "containsObject:", v134) & 1) == 0)
              objc_msgSend(v169, "addResults:", v131);
LABEL_133:

            ++v130;
          }
          while (v128 != v130);
          v142 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v173, v199, 16);
          v128 = v142;
        }
        while (v142);
LABEL_140:

        v6 = v153;
        v3 = v168;
LABEL_141:
        i = v164;
        v22 = v169;

LABEL_142:
      }
      v163 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v193, v206, 16);
    }
    while (v163);
  }

  if (_os_feature_enabled_impl() && objc_msgSend(v6, "count"))
    objc_msgSend(v151, "relatedContentSectionMerging:", v6);
  v143 = objc_msgSend(v6, "count");
  objc_msgSend(v151, "setMutableSections:", v6);
  SPLogForSPLogCategoryDefault();
  v144 = objc_claimAutoreleasedReturnValue();
  v145 = *MEMORY[0x24BE84B00] ^ 1;
  v146 = os_log_type_enabled(v144, v145);
  if (v143)
  {
    if (v146)
    {
      *(_DWORD *)buf = 138412290;
      v198 = v6;
      v147 = v145;
      v148 = "Merge sections %@";
      v149 = v144;
      v150 = 12;
LABEL_153:
      _os_log_impl(&dword_2279CC000, v149, v147, v148, buf, v150);
    }
  }
  else if (v146)
  {
    *(_WORD *)buf = 0;
    v147 = v145;
    v148 = "Empty after updates";
    v149 = v144;
    v150 = 2;
    goto LABEL_153;
  }

}

- (void)relatedContentSectionMerging:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v4 = relatedContentSectionMerging__onceToken_0;
  v5 = a3;
  v7 = v5;
  if (v4 == -1)
  {
    v6 = v5;
  }
  else
  {
    dispatch_once(&relatedContentSectionMerging__onceToken_0, &__block_literal_global_81);
    v6 = v7;
  }
  -[SPGeneralQueryTask mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:](self, "mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:", v6, relatedContentSectionMerging__webBundles_0, SectionMergingBlendedWeb);
  -[SPGeneralQueryTask mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:](self, "mergeRelatedContentFromSections:bundlesToMerge:mergedSectionId:", v7, relatedContentSectionMerging__musicBundles_0, SectionMergingBlendedMusic);

}

void __51__SPGeneralQueryTask_relatedContentSectionMerging___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BEB0450];
  v12[0] = *MEMORY[0x24BEB04B8];
  v12[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)relatedContentSectionMerging__webBundles_0;
  relatedContentSectionMerging__webBundles_0 = v3;

  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *MEMORY[0x24BEB0498];
  v11[0] = *MEMORY[0x24BEB0400];
  v11[1] = v6;
  v7 = *MEMORY[0x24BEB0410];
  v11[2] = *MEMORY[0x24BEB0438];
  v11[3] = v7;
  v11[4] = *MEMORY[0x24BEB0420];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)relatedContentSectionMerging__musicBundles_0;
  relatedContentSectionMerging__musicBundles_0 = v9;

}

- (void)mergeRelatedContentFromSections:(id)a3 bundlesToMerge:(id)a4 mergedSectionId:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "results");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v15 = objc_msgSend(v8, "containsObject:", v13);

        if (v15)
          objc_msgSend(v10, "addObject:", v12);
      }
      else
      {

      }
      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      v42 = v16;
      v43 = v9;
      logForCSLogCategoryDefault();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v10;
        _os_log_impl(&dword_2279CC000, v17, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Merging sections %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v20 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v20, v42);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "maxInitiallyVisibleResults");
          if (!v22)
          {
            objc_msgSend(v21, "results");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");

            if (v24 >= 3)
              v22 = 3;
            else
              v22 = v24;
          }
          objc_msgSend(v21, "results");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v22 <= v26)
          {
            objc_msgSend(v21, "results");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "subarrayWithRange:", 0, v22);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObjectsFromArray:", v28);

          }
          objc_msgSend(v21, "results");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "count");

          if (v30 > v22)
          {
            objc_msgSend(v21, "results");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "results");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "subarrayWithRange:", v22, objc_msgSend(v32, "count") - v22);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObjectsFromArray:", v33);

          }
          objc_msgSend(v21, "clearResults");

          ++v20;
        }
        while (v20 < objc_msgSend(v10, "count"));
      }
      v16 = v42;
      objc_msgSend(v42, "addResultsFromArray:", v18, v42);
      objc_msgSend(v16, "addResultsFromArray:", v19);
      objc_msgSend(v16, "setMaxInitiallyVisibleResults:", objc_msgSend(v18, "count"));

      v9 = v43;
    }
    if (objc_msgSend(v9, "isEqualToString:", SectionMergingBlendedWeb))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TITLE_BLENDED_WEB"), &stru_24F01C208, CFSTR("SpotlightServices"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v35);

      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v36 = (_QWORD *)MEMORY[0x24BEB04B8];
LABEL_31:
        objc_msgSend(v16, "setPreMergeBundleIdentifier:", *v36);
        goto LABEL_32;
      }
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", SectionMergingBlendedMusic))
      {
LABEL_33:
        logForCSLogCategoryDefault();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = v41;
          v46 = 2112;
          v47 = v9;
          _os_log_impl(&dword_2279CC000, v40, OS_LOG_TYPE_DEFAULT, "[release2023SectionMerging] Section %@ becomes %@", buf, 0x16u);

        }
        objc_msgSend(v16, "setBundleIdentifier:", v9);

        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("DOMAIN_TITLE_BLENDED_MUSIC"), &stru_24F01C208, CFSTR("SpotlightServices"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v38);

      if ((unint64_t)objc_msgSend(v10, "count") >= 2)
      {
        v36 = (_QWORD *)MEMORY[0x24BEB0400];
        goto LABEL_31;
      }
    }
    objc_msgSend(v16, "bundleIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreMergeBundleIdentifier:", v39);

LABEL_32:
    objc_msgSend(v16, "setMaxInitiallyVisibleResults:", 3);
    goto LABEL_33;
  }
LABEL_36:

}

- (void)truncateSuggestionsSectionToFit:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SPQueryTask maxUISuggestions](self, "maxUISuggestions");
  objc_msgSend(v4, "resultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDBCEE0]);
  v8 = objc_msgSend(v4, "resultsCount");
  if (v8 >= v5)
    v9 = v5;
  else
    v9 = v8;
  v10 = (void *)objc_msgSend(v7, "initWithCapacity:", v9);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v18, "type", (_QWORD)v21) == 21)
        {
          if (v14)
            v19 = v14;
          else
            v19 = v18;
          v20 = v19;

          v14 = v20;
        }
        else if (v15 < v5)
        {
          objc_msgSend(v10, "addObject:", v18);
          ++v15;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);

    if (v14)
    {
      if (v15 && v15 >= v5)
        objc_msgSend(v10, "replaceObjectAtIndex:withObject:", v15 - 1, v14);
      else
        objc_msgSend(v10, "addObject:", v14);
    }
  }
  else
  {

    v14 = 0;
  }
  objc_msgSend(v4, "setResultSet:", v10, (_QWORD)v21);

}

- (void)handleOptionsForNewSections:(id)a3
{
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  NSObject *v7;
  _BYTE *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t jj;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  char v91;
  uint64_t v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t n;
  void *v104;
  void *v105;
  int v106;
  void *v107;
  char v108;
  uint64_t v109;
  void *v110;
  int v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  int v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t ii;
  void *v125;
  void *v126;
  uint64_t v127;
  void *v128;
  BOOL v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t kk;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  void *v145;
  BOOL v146;
  void *v147;
  void *v148;
  BOOL v149;
  void *v150;
  void *v151;
  char v152;
  uint64_t v153;
  uint64_t v154;
  SPGeneralQueryTask *v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  id obj;
  id obja;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  id v169;
  id v170;
  uint64_t v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  _QWORD block[4];
  id v180;
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
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  uint8_t v225[128];
  uint8_t buf[4];
  id v227;
  __int16 v228;
  int v229;
  uint64_t v230;

  v230 = *MEMORY[0x24BDAC8D0];
  v157 = a3;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v4, v5))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v227 = v6;
    v228 = 1024;
    v229 = objc_msgSend(v157, "count");
    _os_log_impl(&dword_2279CC000, v4, v5, "[%p] handleOptions for sections (%d)", buf, 0x12u);

  }
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (_BYTE *)MEMORY[0x24BE84B00];
  v9 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v7, v9))
  {
    *(_DWORD *)buf = 138412290;
    v227 = v157;
    _os_log_impl(&dword_2279CC000, v7, v9, "handleOptionsForNewSections: %@", buf, 0xCu);
  }

  if (objc_msgSend(v157, "count"))
  {
    -[SPQueryTask queryProcessor](self, "queryProcessor");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v10);

    SPLogForSPLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *v8 ^ 1;
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      v227 = v157;
      _os_log_impl(&dword_2279CC000, v11, v12, "handleOptionsForNewSections: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPQueryTask query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchEntities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v156 = v16;
    v17 = objc_msgSend(v16, "isServerEntitySearch");
    v213 = 0u;
    v214 = 0u;
    v215 = 0u;
    v216 = 0u;
    v155 = self;
    -[SPQueryTask mutableSections](self, "mutableSections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v213, v225, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v214;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v214 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * i);
          objc_msgSend(v23, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("com.apple.parsec."));

          if (v25)
          {
            objc_msgSend(v23, "results");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setDoNotFold:", objc_msgSend(v27, "doNotFold"));

          }
          createDedupeDicts(v23, v173, v178, v176, v177, v175, v174, v17);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v213, v225, 16);
      }
      while (v20);
    }

    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    obj = v157;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v224, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v210;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v210 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * j);
          objc_msgSend(v32, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "hasPrefix:", CFSTR("com.apple.parsec."));

          if (v34)
          {
            objc_msgSend(v32, "results");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "firstObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setDoNotFold:", objc_msgSend(v36, "doNotFold"));

          }
          createDedupeDicts(v32, v173, v178, v176, v177, v175, v174, v17);
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v209, v224, 16);
      }
      while (v29);
    }

    v37 = objc_msgSend(obj, "count");
    if (v37)
    {
      v38 = v37;
      v169 = (id)*MEMORY[0x24BEB04E0];
      v167 = *MEMORY[0x24BEB0500];
      v154 = *MEMORY[0x24BEB0358];
      v171 = *MEMORY[0x24BEB0380];
      v165 = *MEMORY[0x24BEB0448];
      v39 = *MEMORY[0x24BEB0440];
      while (1)
      {
        objc_msgSend(obj, "objectAtIndex:", --v38, v154);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "hasPrefix:", CFSTR("com.apple.parsec."));

        if (v42)
        {
          objc_msgSend(v40, "results");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "count");

          if (!v44)
            goto LABEL_78;
          v158 = v38;
          objc_msgSend(v40, "results");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "copy");

          objc_msgSend(v40, "clearResults");
          v207 = 0u;
          v208 = 0u;
          v205 = 0u;
          v206 = 0u;
          v47 = v46;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v205, v223, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v206;
            do
            {
              for (k = 0; k != v49; ++k)
              {
                if (*(_QWORD *)v206 != v50)
                  objc_enumerationMutation(v47);
                v52 = *(void **)(*((_QWORD *)&v205 + 1) + 8 * k);
                objc_msgSend(v40, "bundleIdentifier");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "hasPrefix:", CFSTR("com.apple.parsec."));

                if (!v54)
                  goto LABEL_41;
                objc_msgSend(v52, "storeIdentifier");
                v55 = objc_claimAutoreleasedReturnValue();
                if (v55)
                {
                  v56 = (void *)v55;
                  objc_msgSend(v52, "storeIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v178, "objectForKey:", v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v58)
                    goto LABEL_40;
                }
                objc_msgSend(v52, "calendarIdentifier");
                v59 = objc_claimAutoreleasedReturnValue();
                if (!v59)
                  goto LABEL_41;
                v60 = (void *)v59;
                objc_msgSend(v52, "calendarIdentifier");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v176, "objectForKey:", v61);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                {
LABEL_40:
                  handleHiddenResult();

                }
                else
                {
LABEL_41:
                  objc_msgSend(v40, "addResults:", v52);
                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v205, v223, 16);
            }
            while (v49);
          }
          v38 = v158;
          goto LABEL_77;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.dictionary"));

        if (v63)
        {
          objc_msgSend(v40, "results");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (!v65)
            goto LABEL_78;
          objc_msgSend(v40, "results");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = (void *)objc_msgSend(v66, "copy");

          objc_msgSend(v40, "clearResults");
          v203 = 0u;
          v204 = 0u;
          v201 = 0u;
          v202 = 0u;
          v47 = v67;
          v68 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v201, v222, 16);
          if (v68)
          {
            v69 = v68;
            v70 = v38;
            v71 = *(_QWORD *)v202;
            do
            {
              for (m = 0; m != v69; ++m)
              {
                if (*(_QWORD *)v202 != v71)
                  objc_enumerationMutation(v47);
                v73 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * m);
                objc_msgSend(v73, "identifier");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v74
                  || (objc_msgSend(v177, "objectForKey:", v74),
                      v75 = (void *)objc_claimAutoreleasedReturnValue(),
                      v75,
                      !v75))
                {
                  objc_msgSend(v40, "addResults:", v73);
                }

              }
              v69 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v201, v222, 16);
            }
            while (v69);
            goto LABEL_76;
          }
          goto LABEL_77;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v76, "isEqualToString:", v169))
          break;
        objc_msgSend(v40, "bundleIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "isEqualToString:", v167);

        if (v78)
          goto LABEL_61;
        objc_msgSend(v40, "bundleIdentifier");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = objc_msgSend(v96, "isEqualToString:", *MEMORY[0x24BE84A98]);

        if (v97)
        {
          v159 = v38;
          v161 = objc_alloc_init(MEMORY[0x24BDD1698]);
          v193 = 0u;
          v194 = 0u;
          v195 = 0u;
          v196 = 0u;
          objc_msgSend(v40, "results");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
          if (v99)
          {
            v100 = v99;
            v101 = 0;
            v102 = *(_QWORD *)v194;
            do
            {
              for (n = 0; n != v100; ++n)
              {
                if (*(_QWORD *)v194 != v102)
                  objc_enumerationMutation(v98);
                v104 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * n);
                objc_msgSend(v104, "identifier");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = objc_msgSend(v105, "hasPrefix:", v171);

                if (v106)
                {
                  objc_msgSend(v104, "sectionBundleIdentifier");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  v108 = objc_msgSend(v107, "isEqualToString:", v169);

                  v109 = v39;
                  if ((v108 & 1) != 0
                    || (objc_msgSend(v104, "sectionBundleIdentifier", v39),
                        v110 = (void *)objc_claimAutoreleasedReturnValue(),
                        v111 = objc_msgSend(v110, "isEqualToString:", v167),
                        v110,
                        v109 = v165,
                        v111))
                  {
                    objc_msgSend(v175, "objectForKey:", v109);
                    v112 = objc_claimAutoreleasedReturnValue();
                    if (v112)
                    {
                      v113 = (void *)v112;
                      handleHiddenResult();
                      objc_msgSend(v161, "addIndex:", v101 + n);

                    }
                  }
                }
              }
              v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v193, v220, 16);
              v101 += n;
            }
            while (v100);
          }

          objc_msgSend(v40, "resultSet");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "removeObjectsAtIndexes:", v161);

          -[SPGeneralQueryTask truncateSuggestionsSectionToFit:](v155, "truncateSuggestionsSectionToFit:", v40);
          v38 = v159;
          goto LABEL_80;
        }
        objc_msgSend(v40, "bundleIdentifier");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = objc_msgSend(v115, "isEqualToString:", v154);

        if (v116)
        {
          objc_msgSend(v40, "results");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = objc_msgSend(v117, "count");

          if (v118)
          {
            objc_msgSend(v40, "results");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = (void *)objc_msgSend(v119, "copy");

            objc_msgSend(v40, "clearResults");
            v191 = 0u;
            v192 = 0u;
            v189 = 0u;
            v190 = 0u;
            v47 = v120;
            v121 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v219, 16);
            if (v121)
            {
              v122 = v121;
              v70 = v38;
              v123 = *(_QWORD *)v190;
              do
              {
                for (ii = 0; ii != v122; ++ii)
                {
                  if (*(_QWORD *)v190 != v123)
                    objc_enumerationMutation(v47);
                  v125 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * ii);
                  objc_msgSend(v125, "applicationBundleIdentifier");
                  v126 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v174, "objectForKey:", v126);
                  v127 = objc_claimAutoreleasedReturnValue();
                  v128 = (void *)v127;
                  if (v126)
                    v129 = v127 == 0;
                  else
                    v129 = 1;
                  if (v129)
                    objc_msgSend(v40, "addResults:", v125);
                  else
                    handleHiddenResult();

                }
                v122 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v189, v219, 16);
              }
              while (v122);
              goto LABEL_76;
            }
LABEL_77:

          }
        }
LABEL_78:
        if (!objc_msgSend(v40, "resultsCount"))
          objc_msgSend(obj, "removeObjectAtIndex:", v38);
LABEL_80:

        if (!v38)
          goto LABEL_112;
      }

LABEL_61:
      objc_msgSend(v40, "results");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "count");

      if (!v80)
        goto LABEL_78;
      v70 = v38;
      objc_msgSend(v40, "results");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = (void *)objc_msgSend(v81, "copy");

      objc_msgSend(v40, "clearResults");
      v199 = 0u;
      v200 = 0u;
      v197 = 0u;
      v198 = 0u;
      v47 = v82;
      v83 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v197, v221, 16);
      if (v83)
      {
        v84 = v83;
        v85 = *(_QWORD *)v198;
        do
        {
          for (jj = 0; jj != v84; ++jj)
          {
            if (*(_QWORD *)v198 != v85)
              objc_enumerationMutation(v47);
            v87 = *(void **)(*((_QWORD *)&v197 + 1) + 8 * jj);
            objc_msgSend(v87, "identifier");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = objc_msgSend(v88, "hasPrefix:", v171);

            if (v89)
            {
              objc_msgSend(v87, "sectionBundleIdentifier");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend(v90, "isEqualToString:", v169);

              v92 = v39;
              if ((v91 & 1) == 0
                && (objc_msgSend(v87, "sectionBundleIdentifier", v39),
                    v93 = (void *)objc_claimAutoreleasedReturnValue(),
                    v94 = objc_msgSend(v93, "isEqualToString:", v167),
                    v93,
                    v92 = v165,
                    !v94)
                || (objc_msgSend(v175, "objectForKey:", v92), (v95 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
              {
                objc_msgSend(v40, "addResults:", v87);
                v95 = 0;
              }

            }
            else
            {
              objc_msgSend(v40, "addResults:", v87);
            }
          }
          v84 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v197, v221, 16);
        }
        while (v84);
      }
LABEL_76:
      v38 = v70;
      goto LABEL_77;
    }
LABEL_112:
    objc_msgSend(v178, "removeAllObjects");
    objc_msgSend(v173, "removeAllObjects");
    objc_msgSend(v176, "removeAllObjects");
    objc_msgSend(v177, "removeAllObjects");
    objc_msgSend(v175, "removeAllObjects");
    objc_msgSend(v174, "removeAllObjects");
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v162 = obj;
    v166 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v185, v218, 16);
    if (!v166)
      goto LABEL_146;
    obja = *(id *)v186;
    v160 = *MEMORY[0x24BE849A8];
LABEL_114:
    v130 = 0;
    while (1)
    {
      if (*(id *)v186 != obja)
        objc_enumerationMutation(v162);
      v131 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * v130);
      objc_msgSend(v131, "bundleIdentifier");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v132, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
        goto LABEL_120;
      objc_msgSend(v131, "bundleIdentifier");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v133, "isEqualToString:", v160))
        break;
      objc_msgSend(v131, "bundleIdentifier");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend(v151, "isEqualToString:", *MEMORY[0x24BE84A98]);

      if ((v152 & 1) != 0)
        goto LABEL_121;
LABEL_141:
      if (++v130 == v166)
      {
        v153 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v185, v218, 16);
        v166 = v153;
        if (!v153)
        {
LABEL_146:

          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke;
          block[3] = &unk_24F01B428;
          v180 = v162;
          dispatch_sync(MEMORY[0x24BDAC9B8], block);

          goto LABEL_147;
        }
        goto LABEL_114;
      }
    }

LABEL_120:
LABEL_121:
    v168 = v130;
    v172 = objc_alloc_init(MEMORY[0x24BDD1698]);
    v181 = 0u;
    v182 = 0u;
    v183 = 0u;
    v184 = 0u;
    v134 = v131;
    objc_msgSend(v131, "results");
    v170 = (id)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v181, v217, 16);
    if (v135)
    {
      v136 = v135;
      v137 = 0;
      v138 = *(_QWORD *)v182;
      do
      {
        for (kk = 0; kk != v136; ++kk)
        {
          if (*(_QWORD *)v182 != v138)
            objc_enumerationMutation(v170);
          v140 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * kk);
          updateDedupeDictsForResult(v140, v173, v178, v176, v177, v175, v174);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          v142 = v141;
          if (v141)
          {
            objc_msgSend(v141, "inlineCard");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "inlineCard");
            v144 = objc_claimAutoreleasedReturnValue();
            v145 = (void *)v144;
            if (v143)
              v146 = 1;
            else
              v146 = v144 == 0;
            if (!v146)
              objc_msgSend(v142, "setInlineCard:", v144);
            objc_msgSend(v142, "compactCard");
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v140, "compactCard");
            v148 = (void *)objc_claimAutoreleasedReturnValue();

            if (v147)
              v149 = 1;
            else
              v149 = v148 == 0;
            if (!v149)
              objc_msgSend(v142, "setCompactCard:", v148);
            handleHiddenResult();
            objc_msgSend(v172, "addIndex:", v137 + kk);

          }
        }
        v136 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v181, v217, 16);
        v137 += kk;
      }
      while (v136);
    }

    objc_msgSend(v134, "resultSet");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "removeObjectsAtIndexes:", v172);

    v130 = v168;
    goto LABEL_141;
  }
LABEL_147:

}

void __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v1)
  {
    v2 = v1;
    v18 = *MEMORY[0x24BE849A8];
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", --v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.spotlight.tophits")) & 1) != 0)
        goto LABEL_6;
      objc_msgSend(v3, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isEqualToString:", v18))
        break;
      objc_msgSend(v3, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE84A98]);

      if ((v17 & 1) != 0)
        goto LABEL_7;
LABEL_21:

      if (!v2)
        return;
    }

LABEL_6:
LABEL_7:
    v20 = v2;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          if (objc_msgSend(v11, "isLocalApplicationResult"))
          {
            if (SectionMergingBlendedMusic_block_invoke_onceToken != -1)
              dispatch_once(&SectionMergingBlendedMusic_block_invoke_onceToken, &__block_literal_global_100);
            v12 = (void *)SectionMergingBlendedMusic_block_invoke_sbsservice;
            objc_msgSend(v11, "applicationBundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "folderPathToIconWithBundleIdentifier:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if ((unint64_t)objc_msgSend(v14, "count") >= 2)
            {
              objc_msgSend(v14, "firstObject");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setAuxiliaryTopText:", v15);

            }
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v2 = v20;
    goto LABEL_21;
  }
}

void __50__SPGeneralQueryTask_handleOptionsForNewSections___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)SectionMergingBlendedMusic_block_invoke_sbsservice;
  SectionMergingBlendedMusic_block_invoke_sbsservice = v0;

}

- (void)addSections:(id)a3 delayedTopHit:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SPGeneralQueryTask handleOptionsForNewSections:](self, "handleOptionsForNewSections:");
  if (!a4)
  {
    -[SPQueryTask mutableSections](self, "mutableSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "count"))
  {
    -[SPQueryTask mutableSections](self, "mutableSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v7, 0);

LABEL_5:
  }
  -[SPGeneralQueryTask mergeSections](self, "mergeSections");

}

- (id)unsafeSessionEntityString
{
  void *v2;
  void *v3;

  -[SPGeneralQueryTask mutableSessionEntityString](self, "mutableSessionEntityString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (BOOL)readyToUpdate
{
  return -[SPQueryTask unsafeState](self, "unsafeState") != 0;
}

- (id)displayedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SPQueryTask query](self, "query");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasMarkedText") & 1) != 0)
  {
    objc_msgSend(v4, "markedTextArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_24F01C208);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPGeneralQueryTask searchString](self, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)processAppResults:(id)a3 maxAppResults:(unint64_t)a4 section:(id)a5 topHitsIndex:(unint64_t *)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

  objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE849A8]);

  if ((v13 & 1) != 0 || v11)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "results");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
LABEL_5:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
        if (objc_msgSend(v19, "isLocalApplicationResult") && (objc_msgSend(v19, "isAppClip") & 1) == 0)
        {
          objc_msgSend(v19, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setMaxLines:", 1);

          objc_msgSend(v9, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.spotlight.tophits"));

          if (v22)
          {
            ++*a6;
            objc_msgSend(v8, "insertObject:atIndex:", v19);
          }
          else
          {
            objc_msgSend(v8, "addObject:", v19);
          }
          if (objc_msgSend(v8, "count") >= a4)
            break;
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v16)
            goto LABEL_5;
          break;
        }
      }
    }

    objc_msgSend(v9, "setMaxInitiallyVisibleResults:", a4);
  }

}

- (id)unsafeSections
{
  NSObject *v3;
  os_log_type_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint8_t buf[16];

  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2279CC000, v3, v4, "unsafeSections", buf, 2u);
  }

  -[SPQueryTask mutableSections](self, "mutableSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

  if (v12)
  {
    objc_msgSend(v9, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      v15 = -[SPQueryTask maxTopHitAppResults](self, "maxTopHitAppResults");
      v26 = 0;
      -[SPGeneralQueryTask processAppResults:maxAppResults:section:topHitsIndex:](self, "processAppResults:maxAppResults:section:topHitsIndex:", 0, v15, v14, &v26);
      objc_msgSend(v14, "resultSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (v17 > v15)
      {
        objc_msgSend(v14, "resultSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resultSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectsInRange:", v15, objc_msgSend(v19, "count") - v15);

      }
    }
  }
  v20 = (void *)MEMORY[0x24BEB0308];
  -[SPQueryTask query](self, "query");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "queryContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPGeneralQueryTask showMoreInAppInfo](self, "showMoreInAppInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "buildSectionsWithSections:queryContext:searchInAppInfo:renderState:", v9, v22, v23, -[SPQueryTask unsafeState](self, "unsafeState"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)searchDaemonQuery:(id)a3 gotResultSet:(id)a4 replace:(BOOL)a5 partiallyComplete:(BOOL)a6 priorityFastPath:(BOOL)a7 update:(BOOL)a8 complete:(BOOL)a9 delayedTopHit:(BOOL)a10 unchanged:(BOOL)a11 forceStable:(BOOL)a12 blendingDuration:(double)a13 geoEntityString:(id)a14 supportedAppScopes:(id)a15 showMoreInAppInfo:(id)a16
{
  _BOOL4 v18;
  _BOOL4 v19;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *staleResultsTimer;
  OS_dispatch_source *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  void *v94;
  _BOOL4 v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  _QWORD v101[6];
  uint8_t buf[4];
  double v103;
  uint64_t v104;

  v18 = a7;
  v19 = a6;
  v95 = a5;
  v104 = *MEMORY[0x24BDAC8D0];
  v96 = a3;
  v22 = a4;
  v98 = a14;
  v23 = a15;
  v97 = a16;
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v24 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v24);

  v25 = objc_alloc(MEMORY[0x24BE84DB8]);
  -[SPQueryTask query](self, "query");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "initWithEvent:timeInterval:queryId:", CFSTR("com.apple.searchd.frontend.query.end"), 0, objc_msgSend(v26, "queryIdent"));

  objc_msgSend(MEMORY[0x24BE84968], "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)v27;
  objc_msgSend(v28, "reportFeedback:queryId:", v27, objc_msgSend(v29, "queryIdent"));

  staleResultsTimer = self->_staleResultsTimer;
  if (staleResultsTimer)
  {
    dispatch_source_cancel(staleResultsTimer);
    v31 = self->_staleResultsTimer;
    self->_staleResultsTimer = 0;

  }
  if (v19 || a8 || v18 || a9)
  {
    v32 = 2;
    if (!v19)
      v32 = 3;
    if (v18)
      v32 = 1;
    if (a9)
      v33 = 4;
    else
      v33 = v32;
    -[SPQueryTask setUnsafeState:](self, "setUnsafeState:", v33);
  }
  v34 = objc_msgSend(v23, "count");
  v35 = v23;
  v36 = v96;
  v37 = v98;
  if (v34)
    -[SPGeneralQueryTask setSupportedAppScopes:](self, "setSupportedAppScopes:", v35);
  v94 = v35;
  if (objc_msgSend(v97, "count"))
    -[SPGeneralQueryTask setShowMoreInAppInfo:](self, "setShowMoreInAppInfo:", v97);
  if ((-[SPQueryTask forceStableResults](self, "forceStableResults") || a12)
    && (objc_msgSend(v22, "stableSections"), (v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v39 = (void *)v38;
    objc_msgSend(v22, "stableSections");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v22, "resultSections");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v95)
  {
    -[SPQueryTask mutableSections](self, "mutableSections");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "removeAllObjects");

    -[SPGeneralQueryTask setMutableSessionEntityString:](self, "setMutableSessionEntityString:", 0);
  }
  if (v98)
    -[SPGeneralQueryTask setMutableSessionEntityString:](self, "setMutableSessionEntityString:", v98);
  if (objc_msgSend(v40, "count"))
  {
    if (!a11)
    {
      v42 = (void *)objc_msgSend(v40, "mutableCopy");
      -[SPGeneralQueryTask addSections:delayedTopHit:](self, "addSections:delayedTopHit:", v42, a10);

      objc_msgSend(v96, "queryID");
      kdebug_trace();
      if (-[SPGeneralQueryTask newQuery](self, "newQuery"))
      {
        -[SPGeneralQueryTask setNewQuery:](self, "setNewQuery:", 0);
        objc_msgSend(v96, "query");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "creationStamp");
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "bundleIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", "ttfr", v44, v46);

        v37 = v98;
      }
    }
  }
  -[SPGeneralQueryTask unsafeSections](self, "unsafeSections");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  SPLogForSPLogCategoryDefault();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = 2 * (*MEMORY[0x24BE84AF8] == 0);
  if (os_log_type_enabled(v48, v49))
  {
    *(_DWORD *)buf = 138412290;
    v103 = *(double *)&v47;
    _os_log_impl(&dword_2279CC000, v48, v49, "sections: %@", buf, 0xCu);
  }

  if (!a11 && -[SPGeneralQueryTask readyToUpdate](self, "readyToUpdate"))
  {
    if (!-[SPGeneralQueryTask didReceiveCompleteCallback](self, "didReceiveCompleteCallback"))
    {
      objc_msgSend(v96, "queryID");
      kdebug_trace();
      SPLogForSPLogCategoryTelemetry();
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v96, "queryID");
      if (v51)
      {
        v52 = v51;
        if (os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_2279CC000, v50, OS_SIGNPOST_INTERVAL_END, v52, "queryUI", " enableTelemetry=YES ", buf, 2u);
        }
      }

    }
    -[SPGeneralQueryTask session](self, "session");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)MEMORY[0x24BEB02E0];
    objc_msgSend(v96, "query");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "queryContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "queryIntent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "finishRanking:blendingDuration:spotlightQueryIntent:", v47, objc_msgSend(v54, "spotlightQueryIntent:", v57), a13);

    -[SPGeneralQueryTask setDidReceiveCompleteCallback:](self, "setDidReceiveCompleteCallback:", 1);
    if (v95)
      v58 = "session reset";
    else
      v58 = "session complete";
    objc_msgSend(v96, "query");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "creationStamp");
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "bundleIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = sp_analytics_log_timing_with_bundle_id((uint64_t)"com.apple.searchd.query.client", v58, v60, v62);

    SPLogForSPLogCategoryDefault();
    v64 = objc_claimAutoreleasedReturnValue();
    v65 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v64, v65))
    {
      *(_DWORD *)buf = 134217984;
      v103 = (double)v63 / 1000000000.0;
      _os_log_impl(&dword_2279CC000, v64, v65, "- SearchAgent time %gs", buf, 0xCu);
    }

    v36 = v96;
    v37 = v98;
  }
  objc_msgSend(v36, "query");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "queryContext");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "fetchL2Signals");

  if (v68)
  {
    v92 = v22;
    v69 = (void *)MEMORY[0x24BDD1618];
    -[SPQueryTask mutableSections](self, "mutableSections");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0;
    objc_msgSend(v69, "archivedDataWithRootObject:requiringSecureCoding:error:", v70, 1, &v100);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v100;

    if (v72)
    {
      SPLogForSPLogCategoryDefault();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[SPGeneralQueryTask searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:].cold.2((uint64_t)v72, v73, v74, v75, v76, v77, v78, v79);
      v80 = 0;
      v81 = v97;
    }
    else
    {
      v82 = (void *)MEMORY[0x24BDD1620];
      v83 = (void *)MEMORY[0x24BDBCF20];
      v101[0] = objc_opt_class();
      v101[1] = objc_opt_class();
      v101[2] = objc_opt_class();
      v101[3] = objc_opt_class();
      v101[4] = objc_opt_class();
      v101[5] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 6);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "setWithArray:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0;
      objc_msgSend(v82, "unarchivedObjectOfClasses:fromData:error:", v85, v71, &v99);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v99;

      if (!v72)
      {
        v81 = v97;
        goto LABEL_57;
      }
      SPLogForSPLogCategoryDefault();
      v73 = objc_claimAutoreleasedReturnValue();
      v81 = v97;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        -[SPGeneralQueryTask searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:].cold.1((uint64_t)v72, v73, v86, v87, v88, v89, v90, v91);
    }

LABEL_57:
    -[SPQueryTask updateResultsThroughDelegate:state:unchanged:sections:](self, "updateResultsThroughDelegate:state:unchanged:sections:", 0, -[SPQueryTask unsafeState](self, "unsafeState"), a11, v80);

    v22 = v92;
    v37 = v98;
    goto LABEL_58;
  }
  -[SPQueryTask updateResultsThroughDelegate:state:unchanged:sections:](self, "updateResultsThroughDelegate:state:unchanged:sections:", 0, -[SPQueryTask unsafeState](self, "unsafeState"), a11, v47);
  v81 = v97;
LABEL_58:

}

- (void)searchDaemonQuery:(id)a3 encounteredError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[SPQueryTask queryProcessor](self, "queryProcessor");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SPQueryTask token](self, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "isEqual:", v6);

  if ((_DWORD)v8)
  {
    SPLogForSPLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SPGeneralQueryTask searchDaemonQuery:encounteredError:].cold.1((uint64_t)v7, (uint64_t)v6, v10);

  }
}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *staleResultsTimer;
  NSObject *v24;
  dispatch_time_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  uint8_t v30[8];
  _QWORD handler[4];
  id v32;
  id v33[2];
  uint8_t buf[8];

  v6 = a3;
  -[SPGeneralQueryTask session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPQueryTask query](self, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "queryKind") - 5;

  if (v10 < 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 1";
LABEL_11:
      _os_log_impl(&dword_2279CC000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 2";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  if (a4 != 1)
  {
    -[SPQueryTask query](self, "query");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLastSections:forQuery:", v6, v13);
    goto LABEL_13;
  }
  if (!self->_staleResultsFired)
  {
    if (objc_msgSend(v6, "count") != 1)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v11 = MEMORY[0x24BDACB70];
      v12 = "Skipped 4";
      goto LABEL_11;
    }
    objc_msgSend(v6, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

    if (v16)
    {
      -[SPQueryTask query](self, "query");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v7, "copyStaleSectionsForQuery:", v17);

      if (objc_msgSend(v18, "count"))
      {
        v19 = (void *)objc_msgSend(v18, "mutableCopy");
        objc_msgSend(v18, "objectAtIndex:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPQueryTask queryProcessor](self, "queryProcessor");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v21);
        staleResultsTimer = self->_staleResultsTimer;
        self->_staleResultsTimer = v22;

        v24 = self->_staleResultsTimer;
        v25 = dispatch_time(0, 750000000);
        dispatch_source_set_timer(v24, v25, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        v26 = self->_staleResultsTimer;
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __54__SPGeneralQueryTask_retainAndMergeSections_forState___block_invoke;
        handler[3] = &unk_24F01B450;
        objc_copyWeak(v33, (id *)buf);
        v33[1] = (id)1;
        v27 = v6;
        v32 = v27;
        dispatch_source_set_event_handler(v26, handler);
        dispatch_activate((dispatch_object_t)self->_staleResultsTimer);
        objc_msgSend(v20, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = objc_msgSend(v28, "isEqual:", CFSTR("com.apple.spotlight.tophits"));

        v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v26)
        {
          if (v29)
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Merged - case 1!", v30, 2u);
          }
          objc_msgSend(v19, "replaceObjectAtIndex:withObject:", 0, v13);
        }
        else
        {
          if (v29)
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Merged - case 2!", v30, 2u);
          }
          objc_msgSend(v19, "insertObject:atIndex:", v13, 0);
        }

        objc_destroyWeak(v33);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipped 6", buf, 2u);
        }
        v19 = v6;
      }

      v6 = v19;
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Skipped 5", buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v11 = MEMORY[0x24BDACB70];
    v12 = "Skipped 3";
    goto LABEL_11;
  }
LABEL_14:

  return v6;
}

void __54__SPGeneralQueryTask_retainAndMergeSections_forState___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2279CC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Clear stale results -- timeout", v4, 2u);
    }
    *((_BYTE *)WeakRetained + 200) = 1;
    dispatch_source_cancel(*((dispatch_source_t *)WeakRetained + 24));
    v3 = (void *)*((_QWORD *)WeakRetained + 24);
    *((_QWORD *)WeakRetained + 24) = 0;

    objc_msgSend(WeakRetained, "updateResultsThroughDelegate:state:unchanged:sections:", 0, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 32));
  }

}

- (SPClientSession)session
{
  return (SPClientSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NSString)mutableSessionEntityString
{
  return self->_mutableSessionEntityString;
}

- (void)setMutableSessionEntityString:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSessionEntityString, a3);
}

- (NSArray)showMoreInAppInfo
{
  return self->_showMoreInAppInfo;
}

- (void)setShowMoreInAppInfo:(id)a3
{
  objc_storeStrong((id *)&self->_showMoreInAppInfo, a3);
}

- (BOOL)didReceiveCompleteCallback
{
  return self->_didReceiveCompleteCallback;
}

- (void)setDidReceiveCompleteCallback:(BOOL)a3
{
  self->_didReceiveCompleteCallback = a3;
}

- (BOOL)newQuery
{
  return self->_newQuery;
}

- (void)setNewQuery:(BOOL)a3
{
  self->_newQuery = a3;
}

- (NSArray)supportedAppScopes
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSupportedAppScopes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAppScopes, 0);
  objc_storeStrong((id *)&self->_showMoreInAppInfo, 0);
  objc_storeStrong((id *)&self->_mutableSessionEntityString, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_staleResultsTimer, 0);
}

void __27__SPGeneralQueryTask_start__block_invoke_cold_1()
{
  __assert_rtn("-[SPGeneralQueryTask start]_block_invoke", "SPGeneralQueryTask.m", 218, "self.started == NO");
}

- (void)searchDaemonQuery:(uint64_t)a3 gotResultSet:(uint64_t)a4 replace:(uint64_t)a5 partiallyComplete:(uint64_t)a6 priorityFastPath:(uint64_t)a7 update:(uint64_t)a8 complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2279CC000, a2, a3, "mutable section unarchiving error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)searchDaemonQuery:(uint64_t)a3 gotResultSet:(uint64_t)a4 replace:(uint64_t)a5 partiallyComplete:(uint64_t)a6 priorityFastPath:(uint64_t)a7 update:(uint64_t)a8 complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2279CC000, a2, a3, "mutable section archiving error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)searchDaemonQuery:(os_log_t)log encounteredError:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2279CC000, log, OS_LOG_TYPE_ERROR, "Received search error %@ for query %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
