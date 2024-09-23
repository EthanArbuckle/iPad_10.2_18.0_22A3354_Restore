@implementation PNPersonDeduperStep

- (PNPersonDeduperStep)initWithPersonClusterManager:(id)a3 invalidCandidatesMapping:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNPersonDeduperStep *v12;
  PNPersonDeduperStep *v13;
  uint64_t v14;
  NSMapTable *mergeRelations;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PNPersonDeduperStep;
  v12 = -[PNPersonDeduperStep init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personClusterManager, a3);
    objc_storeStrong((id *)&v13->_invalidCandidatesMapping, a4);
    objc_storeStrong((id *)&v13->_profile, a5);
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    mergeRelations = v13->_mergeRelations;
    v13->_mergeRelations = (NSMapTable *)v14;

  }
  return v13;
}

- (NSString)name
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperStep.m"), 55, CFSTR("%s needs to be implemented by subclasses"), "-[PNPersonDeduperStep name]");

  abort();
}

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperStep.m"), 62, CFSTR("%s needs to be implemented by subclasses"), "-[PNPersonDeduperStep dedupePersons:withOtherPersons:updateBlock:resultBlock:]");

  abort();
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperStep.m"), 68, CFSTR("%s needs to be implemented by subclasses"), "-[PNPersonDeduperStep isPersonSimilar:withOtherPerson:withDistance:minAgeType:]");

  abort();
}

- (NSString)metricsKey
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperStep.m"), 75, CFSTR("%s needs to be implemented by subclasses"), "-[PNPersonDeduperStep metricsKey]");

  abort();
}

- (BOOL)shouldStopWithUpdateBlock:(id)a3
{
  void (**v4)(id, BOOL *);
  BOOL shouldStop;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, BOOL *))a3;
  if (self->_shouldStop && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_fault_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Progress reported again but it should have stop. %@", (uint8_t *)&v9, 0xCu);

  }
  -[PNPersonDeduperStep progress](self, "progress");
  v4[2](v4, &self->_shouldStop);
  if (self->_shouldStop)
  {
    shouldStop = 1;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[PNPersonDeduperStep name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Step %@ got cancelled.", (uint8_t *)&v9, 0xCu);

      shouldStop = self->_shouldStop;
    }
  }
  else
  {
    shouldStop = 0;
  }

  return shouldStop;
}

- (id)_resolveMergeCandidate:(id)a3 forPerson:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  float v17;
  id v18;
  float v19;
  float v20;
  id v21;
  void *v22;
  void *v24;
  id obj;
  id v26;
  void *v27;
  id v28;
  id v29;
  __int16 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v6, "removeObjectForKey:", v7);
    -[PNPersonDeduperStep personClusterManager](self, "personClusterManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v8, "mutableCopy");
    v26 = v7;
    objc_msgSend(v7, "localIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v27, 0);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v24 = v8;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v15, "localIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mergeConfidenceBetweenPersonLocalIdentifier:andCandidateLocalIdentifiers:", v16, v10);
          if (v17 == -1.0)
          {
            v18 = v6;
            v30 = 0;
            v29 = 0;
            objc_msgSend(v9, "distanceBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:", v15, v26, 1, &v30, &__block_literal_global_604, &v29);
            v20 = v19;
            v21 = v29;
            if (v21)
            {
              v20 = 1.0;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v36 = v27;
                v37 = 2112;
                v38 = v16;
                v39 = 2112;
                v40 = v21;
                _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "error updating confidence cache between %@ and %@: %@", buf, 0x20u);
              }
            }
            objc_msgSend(v9, "updateConfidenceCacheBetweenPersonLocalIdentifier:andOtherPersonLocalIdentifier:withDistance:", v16, v27, v20);

            v6 = v18;
          }
          -[PNPersonDeduperStep _resolveMergeCandidate:forPerson:](self, "_resolveMergeCandidate:forPerson:", v6, v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "unionSet:", v22);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v12);
    }

    v7 = v26;
    v8 = v24;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

- (id)mergeCandidatePersonsWithUpdateBlock:(id)a3
{
  void *v4;
  NSMapTable *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  BOOL v17;
  unint64_t v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t k;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  int v70;
  _BOOL4 v71;
  id v72;
  unint64_t v73;
  float v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  uint64_t v82;
  void *v83;
  float v84;
  float v85;
  id v86;
  void *v87;
  void *v88;
  int v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t n;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  id v105;
  __int128 v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  NSMapTable *v113;
  void *v114;
  PNPersonDeduperStep *v115;
  void *v116;
  id v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  void *v131;
  id obj;
  id obja;
  id objb;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  unsigned __int16 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  unsigned __int16 v153;
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
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  void *v176;
  uint8_t v177[128];
  uint8_t buf[4];
  _BYTE v179[18];
  __int16 v180;
  double v181;
  __int16 v182;
  _BYTE v183[10];
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v112 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep personClusterManager](self, "personClusterManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 0);
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  -[PNPersonDeduperStep mergeRelations](self, "mergeRelations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v166, v184, 16);
  v113 = v5;
  v115 = self;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v167;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v167 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * i);
        if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v112))
        {
          v99 = v107;
          v101 = v107;
          v102 = obj;
LABEL_113:

          goto LABEL_114;
        }
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isVerified");
        v16 = objc_msgSend(v14, "isVerified");
        if (v15)
          v17 = v16 == 0;
        else
          v17 = 1;
        if (v17)
        {
          if ((v16 & 1) != 0
            || ((v18 = objc_msgSend(v13, "faceCount"), v18 >= objc_msgSend(v14, "faceCount")) ? (v19 = 1) : (v19 = v15),
                (v19 & 1) == 0))
          {
            objc_msgSend(v12, "lastObject");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "firstObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v179 = v20;
              *(_WORD *)&v179[8] = 2112;
              *(_QWORD *)&v179[10] = v21;
              _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Swaping source person and person to merge: %@ merging in to %@", buf, 0x16u);
            }
          }
          else
          {
            v20 = v14;
            v21 = v13;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v115, CFSTR("PNPersonDeduperStep.m"), 176, CFSTR("Person source should be type of PNPersonCluster"));

          }
          -[PNPersonDeduperStep mergeRelations](v115, "mergeRelations");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "floatValue");
          v26 = v25;

          v27 = objc_msgSend(v4, "numberOfAssetsInCommonBetweenPerson:andPerson:", v21, v20);
          v28 = objc_msgSend(v4, "numberOfMomentsInCommonBetweenPerson:andPerson:", v21, v20);
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "localIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)v179 = v30;
            *(_WORD *)&v179[8] = 2112;
            *(_QWORD *)&v179[10] = v31;
            v180 = 2048;
            v181 = v26;
            v182 = 1024;
            *(_DWORD *)v183 = v27;
            *(_WORD *)&v183[4] = 1024;
            *(_DWORD *)&v183[6] = v28;
            _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Resolving merge %@ into %@]\nDistance: %.3f, common assets: %d, common moments: %d", buf, 0x2Cu);

            v5 = v113;
          }
          -[NSMapTable objectForKey:](v5, "objectForKey:", v21);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v22 = v29;
            objc_msgSend(v29, "addObject:", v20);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v22, v21);
          }
          v14 = v20;
          v13 = v21;
          self = v115;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduperStep.m"), 164, CFSTR("It's impossible at this point to merge two verified persons together."));
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v166, v184, 16);
      if (v9)
        continue;
      break;
    }
  }

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  NSAllMapTableKeys(v5);
  v108 = (id)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v177, 16);
  if (v110)
  {
    v34 = MEMORY[0x24BDACB70];
    v109 = *(_QWORD *)v163;
    *(_QWORD *)&v33 = 67109378;
    v106 = v33;
    while (2)
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v163 != v109)
        {
          v36 = v35;
          objc_enumerationMutation(v108);
          v35 = v36;
        }
        v111 = v35;
        v37 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v35);
        if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v112, v106))
        {
          v99 = v107;
          v103 = v107;
          v102 = v108;
          goto LABEL_113;
        }
        v131 = v37;
        -[PNPersonDeduperStep _resolveMergeCandidate:forPerson:](self, "_resolveMergeCandidate:forPerson:", v5, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = v38;
        if ((unint64_t)objc_msgSend(v38, "count") >= 2)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v89 = objc_msgSend(v38, "count");
            *(_DWORD *)buf = v106;
            *(_DWORD *)v179 = v89;
            *(_WORD *)&v179[4] = 2112;
            *(_QWORD *)&v179[6] = v131;
            _os_log_debug_impl(&dword_243C3E000, v34, OS_LOG_TYPE_DEBUG, "Resolving %d potential conflicts for %@", buf, 0x12u);
          }
          v39 = (void *)objc_msgSend(v38, "mutableCopy");
          objc_msgSend(v39, "addObject:", v131);
          objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = v40;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v176, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sortedArrayUsingDescriptors:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v160 = 0u;
          v161 = 0u;
          v158 = 0u;
          v159 = 0u;
          v128 = v42;
          v43 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v158, v175, 16);
          v5 = v113;
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v159;
            v124 = *(_QWORD *)v159;
            do
            {
              v46 = 0;
              v126 = v44;
              do
              {
                if (*(_QWORD *)v159 != v45)
                  objc_enumerationMutation(v128);
                v47 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v46);
                v48 = (void *)MEMORY[0x249506444]();
                if (objc_msgSend(v39, "containsObject:", v47))
                {
                  obja = v48;
                  v49 = (void *)objc_opt_new();
                  v154 = 0u;
                  v155 = 0u;
                  v156 = 0u;
                  v157 = 0u;
                  v50 = v39;
                  v51 = v39;
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = *(_QWORD *)v155;
                    do
                    {
                      for (j = 0; j != v53; ++j)
                      {
                        if (*(_QWORD *)v155 != v54)
                          objc_enumerationMutation(v51);
                        v56 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
                        if (v47 != v56)
                        {
                          objc_msgSend(v56, "backingAssetIdentifiers");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v49, "unionSet:", v57);

                        }
                      }
                      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v154, v174, 16);
                    }
                    while (v53);
                  }

                  objc_msgSend(v47, "backingAssetIdentifiers");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v4, "assetsOverlapBetweenPersonAssetIdentifiers:andPersonAssetIdentifiers:", v58, v49);

                  v5 = v113;
                  if (v59)
                  {
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v179 = v47;
                      _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Found a conflict for %@, removing.", buf, 0xCu);
                    }
                    objc_msgSend(v116, "removeObject:", v47);
                    objc_msgSend(v51, "removeObject:", v47);
                  }

                  v39 = v50;
                  v45 = v124;
                  v44 = v126;
                  v48 = obja;
                }
                objc_autoreleasePoolPop(v48);
                ++v46;
              }
              while (v46 != v44);
              v44 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v158, v175, 16);
            }
            while (v44);
          }

          self = v115;
          v38 = v116;
          v34 = MEMORY[0x24BDACB70];
        }
        if (objc_msgSend(v38, "count"))
        {
          v153 = 0;
          v60 = (id)objc_msgSend(v4, "representativeFaceObservationForPerson:ageType:", v131, &v153);
          objc_msgSend(v131, "representativeFaceByFaceIdentifiers");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "allValues");
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          v63 = (void *)objc_msgSend(v38, "copy");
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v117 = v63;
          v120 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v149, v173, 16);
          if (v120)
          {
            v119 = *(_QWORD *)v150;
            v114 = v62;
            do
            {
              for (k = 0; k != v120; ++k)
              {
                if (*(_QWORD *)v150 != v119)
                  objc_enumerationMutation(v117);
                objb = *(id *)(*((_QWORD *)&v149 + 1) + 8 * k);
                objc_msgSend(objb, "representativeFaceByFaceIdentifiers");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "allValues");
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend(v62, "count") > 1
                  || (unint64_t)objc_msgSend(v66, "count") >= 2)
                {
                  v121 = k;
                  v67 = objc_msgSend(v62, "count");
                  v68 = objc_msgSend(v66, "count");
                  v148 = 0;
                  v69 = (id)objc_msgSend(v4, "representativeFaceObservationForPerson:ageType:", objb, &v148);
                  v70 = objc_msgSend(v4, "minAgeTypeForFaceAgeType:andFaceAgeType:", v153, v148);
                  v144 = 0u;
                  v145 = 0u;
                  v71 = (v70 - 1) < 2;
                  v146 = 0u;
                  v147 = 0u;
                  v72 = v62;
                  v127 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v144, v172, 16);
                  if (v127)
                  {
                    v122 = v72;
                    v73 = 0;
                    v118 = vcvtps_u32_f32((float)(unint64_t)(v68 * v67) * 0.5);
                    v74 = flt_243FA9DD0[v71];
                    v123 = *(_QWORD *)v145;
                    v125 = v66;
                    do
                    {
                      v75 = 0;
                      do
                      {
                        if (*(_QWORD *)v145 != v123)
                          objc_enumerationMutation(v122);
                        v129 = v75;
                        v76 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * v75);
                        v140 = 0u;
                        v141 = 0u;
                        v142 = 0u;
                        v143 = 0u;
                        v77 = v66;
                        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
                        if (v78)
                        {
                          v79 = v78;
                          v80 = *(_QWORD *)v141;
                          do
                          {
                            for (m = 0; m != v79; ++m)
                            {
                              if (*(_QWORD *)v141 != v80)
                                objc_enumerationMutation(v77);
                              v82 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * m);
                              objc_msgSend(v4, "visionHelper");
                              v83 = (void *)objc_claimAutoreleasedReturnValue();
                              v139 = 0;
                              objc_msgSend(v83, "distanceBetweenFaceObservation:andFaceObservation:error:", v76, v82, &v139);
                              v85 = v84;
                              v86 = v139;

                              if (v85 > v74)
                              {
                                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                                {
                                  objc_msgSend(v131, "localIdentifier");
                                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(objb, "localIdentifier");
                                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)buf = 138413058;
                                  *(_QWORD *)v179 = v87;
                                  *(_WORD *)&v179[8] = 2112;
                                  *(_QWORD *)&v179[10] = v88;
                                  v180 = 2048;
                                  v181 = v85;
                                  v182 = 2048;
                                  *(double *)v183 = v74;
                                  _os_log_debug_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Found suspicious merge between %@ and %@, distance %.3f > %.2f.", buf, 0x2Au);

                                  v34 = MEMORY[0x24BDACB70];
                                }
                                ++v73;
                              }

                            }
                            v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v140, v171, 16);
                          }
                          while (v79);
                        }

                        v75 = v129 + 1;
                        v66 = v125;
                      }
                      while (v129 + 1 != v127);
                      v127 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v144, v172, 16);
                    }
                    while (v127);

                    v62 = v114;
                    self = v115;
                    k = v121;
                    if (v73 > v118)
                    {
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134218498;
                        *(_QWORD *)v179 = v73;
                        *(_WORD *)&v179[8] = 2048;
                        *(_QWORD *)&v179[10] = v118;
                        v180 = 2112;
                        v181 = *(double *)&objb;
                        _os_log_impl(&dword_243C3E000, v34, OS_LOG_TYPE_DEFAULT, "Found %tu suspicious merges (threshold %tu) for %@, removing.", buf, 0x20u);
                      }
                      objc_msgSend(v116, "removeObject:", objb);
                    }
                  }
                  else
                  {

                    k = v121;
                  }
                }

              }
              v120 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v149, v173, 16);
            }
            while (v120);
          }

          v5 = v113;
          v38 = v116;
        }
        if (objc_msgSend(v38, "count"))
          -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v38, v131);

        v35 = v111 + 1;
      }
      while (v111 + 1 != v110);
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v162, v177, 16);
      if (v110)
        continue;
      break;
    }
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  NSAllMapTableKeys(v5);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v135, v170, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v136;
    while (2)
    {
      for (n = 0; n != v92; ++n)
      {
        if (*(_QWORD *)v136 != v93)
          objc_enumerationMutation(v90);
        v95 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * n);
        v96 = (void *)MEMORY[0x249506444]();
        if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v112))
        {
          v99 = v107;
          v105 = v107;
          objc_autoreleasePoolPop(v96);

          goto LABEL_116;
        }
        -[PNPersonDeduperStep _resolveMergeCandidate:forPerson:](self, "_resolveMergeCandidate:forPerson:", v113, v95);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v97, "count"))
        {
          objc_msgSend(v4, "mergePersons:withPerson:", v97, v95);
          objc_msgSend(v107, "unionSet:", v97);
        }

        objc_autoreleasePoolPop(v96);
      }
      v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v135, v170, 16);
      if (v92)
        continue;
      break;
    }
  }

  -[PNPersonDeduperStep mergeRelations](self, "mergeRelations");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "removeAllObjects");

  v99 = v107;
  v100 = v107;
LABEL_116:
  v5 = v113;
LABEL_114:

  return v99;
}

- (BOOL)addPotentialMergeCandidateForPerson:(id)a3 withOtherPerson:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  double v24;
  double v25;
  NSMapTable *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  PNPersonDeduperStep *v42;
  char v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  unsigned __int16 v51;
  _BYTE v52[128];
  _QWORD v53[2];
  uint8_t buf[4];
  double v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "quarantined") & 1) != 0 || (objc_msgSend(v9, "quarantined") & 1) != 0)
    goto LABEL_5;
  -[PNPersonDeduperStep invalidCandidatesMapping](self, "invalidCandidatesMapping");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v14) & 1) == 0)
  {
    v45 = v10;
    -[PNPersonDeduperStep invalidCandidatesMapping](self, "invalidCandidatesMapping");
    v42 = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v19, "containsObject:", v20);

    if ((v43 & 1) != 0)
    {
      v15 = 0;
      v10 = v45;
      goto LABEL_6;
    }
    v51 = 0;
    -[PNPersonDeduperStep personClusterManager](v42, "personClusterManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v10 = v45;
    objc_msgSend(v21, "distanceWithOverlapCheckBetweenPerson:andPerson:useCommonMoments:minAgeType:updateBlock:error:", v8, v9, 1, &v51, v45, &v50);
    v23 = v22;
    v24 = COERCE_DOUBLE(v50);

    if (v24 == 0.0)
    {
      if (!-[PNPersonDeduperStep shouldStopWithUpdateBlock:](v42, "shouldStopWithUpdateBlock:", v45))
      {
        *(float *)&v25 = v23;
        if (-[PNPersonDeduperStep isPersonSimilar:withOtherPerson:withDistance:minAgeType:](v42, "isPersonSimilar:withOtherPerson:withDistance:minAgeType:", v8, v9, v51, v25))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            v55 = v23;
            v56 = 2112;
            v57 = v9;
            v58 = 2112;
            v59 = v8;
            _os_log_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Found a merge candidate with distance %.3f: %@ for %@", buf, 0x20u);
          }
          v53[0] = v8;
          v53[1] = v9;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
          v44 = objc_claimAutoreleasedReturnValue();
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          -[PNPersonDeduperStep mergeRelations](v42, "mergeRelations");
          v26 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          NSAllMapTableKeys(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v47;
LABEL_18:
            v31 = 0;
            while (1)
            {
              if (*(_QWORD *)v47 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v31);
              objc_msgSend(v32, "lastObject");
              v33 = (id)objc_claimAutoreleasedReturnValue();
              if (v33 == v9)
                break;

              if (v29 == ++v31)
              {
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
                if (v29)
                  goto LABEL_18;
                goto LABEL_29;
              }
            }
            -[PNPersonDeduperStep mergeRelations](v42, "mergeRelations");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKey:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "floatValue");
            v37 = v36;

            if (v37 > v23)
            {
              -[PNPersonDeduperStep mergeRelations](v42, "mergeRelations");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "removeObjectForKey:", v32);

              goto LABEL_29;
            }
            v40 = v9;
            v41 = (void *)v44;
          }
          else
          {
LABEL_29:

            -[PNPersonDeduperStep mergeRelations](v42, "mergeRelations");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v39 = v23;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)v44;
            objc_msgSend(v27, "setObject:forKey:", v40, v44);
          }

          v15 = 1;
          goto LABEL_26;
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v24;
      _os_log_error_impl(&dword_243C3E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "-[PNPersonClusterManager distanceWithOverlapCheckBetweenPerson:andPerson:useCommonMoments:error:] return an error: %@", buf, 0xCu);
    }
    v15 = 0;
LABEL_26:

    goto LABEL_6;
  }

LABEL_5:
  v15 = 0;
LABEL_6:

  return v15;
}

- (float)adjustedThreshold:(float)a3 forMinAgeType:(unsigned __int16)a4
{
  int v4;
  float v6;

  v4 = a4;
  if (-[PNPersonDeduperProfile shouldAdjustThresholdOnAgeType](self->_profile, "shouldAdjustThresholdOnAgeType"))
  {
    if (v4 == 2)
    {
      v6 = 0.8;
      return a3 * v6;
    }
    if (v4 == 1)
    {
      v6 = *(float *)"333?";
      return a3 * v6;
    }
  }
  return a3;
}

- (PNPersonClusterManager)personClusterManager
{
  return self->_personClusterManager;
}

- (NSDictionary)invalidCandidatesMapping
{
  return self->_invalidCandidatesMapping;
}

- (NSMapTable)mergeRelations
{
  return self->_mergeRelations;
}

- (PNPersonPromoterDelegate)delegate
{
  return (PNPersonPromoterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PNPersonDeduperProfile)profile
{
  return self->_profile;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergeRelations, 0);
  objc_storeStrong((id *)&self->_invalidCandidatesMapping, 0);
  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

@end
