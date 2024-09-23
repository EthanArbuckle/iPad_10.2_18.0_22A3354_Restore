@implementation PPTemporalClusterStorage

- (PPTemporalClusterStorage)initWithEventStore:(id)a3 topicStore:(id)a4 entityStore:(id)a5 locationStore:(id)a6 contactStore:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PPTemporalClusterStorage *v17;
  PPTemporalClusterStorage *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PPTemporalClusterStorage;
  v17 = -[PPTemporalClusterStorage init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_eventStore, a3);
    objc_storeStrong((id *)&v18->_topicStore, a4);
    objc_storeStrong((id *)&v18->_entityStore, a5);
    objc_storeStrong((id *)&v18->_locationStore, a6);
    objc_storeStrong((id *)&v18->_contactStore, a7);
  }

  return v18;
}

- (id)rankedTemporalClusterForStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  PPTemporalClusterStorage *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v33 = 0;
  -[PPTemporalClusterStorage createTemporalClusterForEvent:startDate:endDate:error:](self, 0, v8, v9, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v33;
  v27 = v10;
  objc_msgSend(v10, "addObject:", v11);

  v13 = self;
  v24 = v9;
  v25 = v8;
  -[PPTemporalClusterStorage eventsWithStartDate:endDate:](self, "eventsWithStartDate:endDate:", v8, v9);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        v18 = v12;
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "endDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v18;
        -[PPTemporalClusterStorage createTemporalClusterForEvent:startDate:endDate:error:](v13, v19, v20, v21, &v28);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v28;

        objc_msgSend(v27, "addObject:", v22);
        if (a5 && v12)
          *a5 = objc_retainAutorelease(v12);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v15);
  }

  return v27;
}

- (id)eventsWithStartDate:(id)a3 endDate:(id)a4
{
  PPLocalEventStore *eventStore;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  eventStore = self->_eventStore;
  v7 = a4;
  v8 = a3;
  -[PPLocalEventStore eventsFromDate:toDate:](eventStore, "eventsFromDate:toDate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPLocalEventStore nlEventsFromDate:toDate:](self->_eventStore, "nlEventsFromDate:toDate:", v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (id)createTemporalClusterForEvent:(void *)a3 startDate:(void *)a4 endDate:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  uint64_t v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  char isKindOfClass;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  BOOL v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t k;
  uint64_t v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  void *v125;
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  id obj;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  _QWORD *v148;
  id v149;
  id v150;
  id v151;
  void *context;
  void *contexta;
  void *contextb;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD v158[4];
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  id v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _QWORD v187[5];
  id v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  void (*v193)(uint64_t);
  id v194;
  id v195;
  id v196;
  id v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  uint8_t v203[128];
  uint8_t v204[4];
  id v205;
  __int128 buf;
  void (*v207)(uint64_t, void *);
  void *v208;
  id v209;
  id v210;
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v132 = a2;
  v8 = a3;
  v9 = a4;
  v134 = v8;
  v135 = v9;
  if (!a1)
  {
    v125 = 0;
    goto LABEL_115;
  }
  v10 = v9;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setFromDate:", v8);
  objc_msgSend(v11, "setToDate:", v10);
  objc_msgSend(v11, "setScoringDate:", v10);
  objc_msgSend(v11, "setFilterByRelevanceDate:", 1);
  v148 = a1;
  v12 = (void *)a1[2];
  v196 = 0;
  v131 = v11;
  objc_msgSend(v12, "rankedTopicsWithQuery:error:", v11, &v196);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v196;
  if (!v13)
  {
    pp_temporal_clusters_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Topics Store query returned nil.", (uint8_t *)&buf, 2u);
    }

    if (v14)
    {
      pp_temporal_clusters_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Topics Store query error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v14);
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }
  v137 = (void *)objc_opt_new();
  objc_msgSend(v137, "setFromDate:", v134);
  objc_msgSend(v137, "setToDate:", v135);
  objc_msgSend(v137, "setScoringDate:", v135);
  v17 = (void *)MEMORY[0x1C3BD6630](objc_msgSend(v137, "setFilterByRelevanceDate:", 1));
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E5A950, 0);
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v137, "setExcludingAlgorithms:", v18);

  v19 = (void *)v148[3];
  v195 = v14;
  objc_msgSend(v19, "rankedNamedEntitiesWithQuery:error:", v137, &v195);
  v139 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v195;

  if (!v139)
  {
    pp_temporal_clusters_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1C392E000, v21, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Named Entities Store query returned nil.", (uint8_t *)&buf, 2u);
    }

    if (v20)
    {
      pp_temporal_clusters_log_handle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v20;
        _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Named Entities Store query error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v20);
    }
    v139 = (id)MEMORY[0x1E0C9AA60];
  }
  v136 = (void *)objc_opt_new();
  objc_msgSend(v136, "setFromDate:", v134);
  objc_msgSend(v136, "setToDate:", v135);
  objc_msgSend(v136, "setScoringDate:", v135);
  objc_msgSend(v136, "setFilterByRelevanceDate:", 1);
  v189 = 0;
  v190 = &v189;
  v191 = 0x3032000000;
  v192 = __Block_byref_object_copy__23441;
  v193 = __Block_byref_object_dispose__23442;
  v194 = 0;
  v194 = (id)objc_opt_new();
  v23 = (void *)v148[4];
  v188 = v20;
  v187[0] = MEMORY[0x1E0C809B0];
  v187[1] = 3221225472;
  v187[2] = __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke;
  v187[3] = &unk_1E7E1FA50;
  v187[4] = &v189;
  objc_msgSend(v23, "iterRankedLocationsWithQuery:error:block:", v136, &v188, v187);
  v24 = v188;

  if (!objc_msgSend((id)v190[5], "count") && v24)
  {
    pp_temporal_clusters_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Locations Store query error: %@", (uint8_t *)&buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v24);
  }
  v26 = (void *)objc_opt_new();
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  obj = v13;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v203, 16);
  if (v27)
  {
    v142 = *(_QWORD *)v184;
    do
    {
      v155 = 0;
      v145 = v27;
      do
      {
        if (*(_QWORD *)v184 != v142)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v155);
        context = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v28, "item");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "mostRelevantRecord");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "source");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "metadata");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "contactHandleCount") == 0;

        if (!v33)
        {
          v34 = (void *)v148[5];
          objc_msgSend(v28, "item");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "mostRelevantRecord");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "source");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v182 = v24;
          objc_msgSend(v34, "contactHandlesForSource:error:", v37, &v182);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v149 = v182;

          if (!v38)
          {
            pp_temporal_clusters_log_handle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v149;
              _os_log_error_impl(&dword_1C392E000, v39, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }

          }
          v180 = 0u;
          v181 = 0u;
          v178 = 0u;
          v179 = 0u;
          v40 = v38;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v178, v202, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v179;
            do
            {
              for (i = 0; i != v41; ++i)
              {
                if (*(_QWORD *)v179 != v42)
                  objc_enumerationMutation(v40);
                v44 = *(_QWORD *)(*((_QWORD *)&v178 + 1) + 8 * i);
                v45 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v26, "objectForKeyedSubscript:", v44);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "doubleValue");
                v48 = v47;
                objc_msgSend(v28, "score");
                objc_msgSend(v45, "numberWithDouble:", v48 + v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v50, v44);

              }
              v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v178, v202, 16);
            }
            while (v41);
          }

          v24 = v149;
        }
        objc_autoreleasePoolPop(context);
        ++v155;
      }
      while (v155 != v145);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v183, v203, 16);
    }
    while (v27);
  }

  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v140 = v139;
  v51 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v174, v201, 16);
  if (v51)
  {
    v143 = *(_QWORD *)v175;
    do
    {
      v156 = 0;
      v146 = v51;
      do
      {
        if (*(_QWORD *)v175 != v143)
          objc_enumerationMutation(v140);
        v52 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v156);
        contexta = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v52, "item");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "mostRelevantRecord");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "source");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "metadata");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "contactHandleCount") == 0;

        if (!v57)
        {
          v58 = (void *)v148[5];
          objc_msgSend(v52, "item");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "mostRelevantRecord");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "source");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = v24;
          objc_msgSend(v58, "contactHandlesForSource:error:", v61, &v173);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = v173;

          if (!v62)
          {
            pp_temporal_clusters_log_handle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v150;
              _os_log_error_impl(&dword_1C392E000, v63, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }

          }
          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          v64 = v62;
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v170;
            do
            {
              for (j = 0; j != v65; ++j)
              {
                if (*(_QWORD *)v170 != v66)
                  objc_enumerationMutation(v64);
                v68 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * j);
                v69 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v26, "objectForKeyedSubscript:", v68);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "doubleValue");
                v72 = v71;
                objc_msgSend(v52, "score");
                objc_msgSend(v69, "numberWithDouble:", v72 + v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v74, v68);

              }
              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v169, v200, 16);
            }
            while (v65);
          }

          v24 = v150;
        }
        objc_autoreleasePoolPop(contexta);
        ++v156;
      }
      while (v156 != v146);
      v51 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v174, v201, 16);
    }
    while (v51);
  }

  v75 = v132;
  if (v75)
  {
    v76 = v75;
    if (objc_msgSend(v75, "suggestedEventCategory") != 8)
    {
      v130 = (void *)MEMORY[0x1E0C9AA60];
LABEL_91:
      v75 = v76;
      goto LABEL_92;
    }
    v77 = (void *)objc_opt_new();
    v78 = (void *)v148[1];
    objc_msgSend(v76, "eventIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "customObjectForKey:eventIdentifier:", *MEMORY[0x1E0D70F30], v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v89 = 0;
      goto LABEL_82;
    }
    v81 = v80;
    objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
        v85 = objc_claimAutoreleasedReturnValue();
        -[NSObject firstObject](v85, "firstObject");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        if (v87)
        {
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("name"));
          v89 = (id)objc_claimAutoreleasedReturnValue();

LABEL_81:
LABEL_82:
          if (objc_msgSend(v89, "length"))
          {
            objc_msgSend(v89, "lowercaseString");
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            v91 = (void *)objc_opt_new();
            v92 = (void *)MEMORY[0x1C3BD6630]();
            v93 = objc_alloc(MEMORY[0x1E0C99E60]);
            v94 = (void *)objc_msgSend(v93, "initWithObjects:", *MEMORY[0x1E0D70E30], 0);
            objc_autoreleasePoolPop(v92);
            objc_msgSend(v91, "setMatchingSourceBundleIds:", v94);

            v95 = (void *)v148[3];
            v197 = 0;
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v207 = __53__PPTemporalClusterStorage_fetchRelatedMediaRecords___block_invoke;
            v208 = &unk_1E7E1FAE0;
            v89 = v90;
            v209 = v89;
            v210 = v77;
            LOBYTE(v95) = objc_msgSend(v95, "iterNamedEntityRecordsWithQuery:error:block:", v91, &v197, &buf);
            v96 = v197;
            if ((v95 & 1) == 0)
            {
              pp_temporal_clusters_log_handle();
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v204 = 138412290;
                v205 = v96;
                _os_log_error_impl(&dword_1C392E000, v97, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage fetchRelatedMediaItems: Entity Store query error: %@", v204, 0xCu);
              }

              v130 = (void *)MEMORY[0x1E0C9AA60];
              goto LABEL_90;
            }

          }
          else
          {
            v96 = 0;
          }
          v130 = (void *)objc_msgSend(v77, "copy");
LABEL_90:

          goto LABEL_91;
        }

      }
    }
    pp_temporal_clusters_log_handle();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      _os_log_debug_impl(&dword_1C392E000, v85, OS_LOG_TYPE_DEBUG, "PPTemporalClusterStorage ticketReservationFromMetadata: Couldn't fetch anything from the reservationFor schemaOrg property.", (uint8_t *)&buf, 2u);
    }
    v89 = 0;
    goto LABEL_81;
  }
  v130 = (void *)MEMORY[0x1E0C9AA60];
LABEL_92:
  v127 = v75;

  objc_msgSend(v130, "_pas_mappedArrayWithTransform:", &__block_literal_global_23448);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPTemporalClusterStorage enrichEntities:mediaRecords:](PPTemporalClusterStorage, "enrichEntities:mediaRecords:", v140, v130);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = 0u;
  v168 = 0u;
  v166 = 0u;
  v165 = 0u;
  v138 = (id)v190[5];
  v98 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
  if (v98)
  {
    v144 = *(_QWORD *)v166;
    do
    {
      v157 = 0;
      v147 = v98;
      do
      {
        if (*(_QWORD *)v166 != v144)
          objc_enumerationMutation(v138);
        v99 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * v157);
        contextb = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v99, "location");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "mostRelevantRecord");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "source");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "metadata");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "contactHandleCount") == 0;

        if (!v104)
        {
          v105 = (void *)v148[5];
          objc_msgSend(v99, "location");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "mostRelevantRecord");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "source");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = v24;
          objc_msgSend(v105, "contactHandlesForSource:error:", v108, &v164);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = v164;

          if (!v109)
          {
            pp_temporal_clusters_log_handle();
            v110 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v151;
              _os_log_error_impl(&dword_1C392E000, v110, OS_LOG_TYPE_ERROR, "PPTemporalClusterStorage: Contact Store query error: %@", (uint8_t *)&buf, 0xCu);
            }

          }
          v162 = 0u;
          v163 = 0u;
          v160 = 0u;
          v161 = 0u;
          v111 = v109;
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v160, v198, 16);
          if (v112)
          {
            v113 = *(_QWORD *)v161;
            do
            {
              for (k = 0; k != v112; ++k)
              {
                if (*(_QWORD *)v161 != v113)
                  objc_enumerationMutation(v111);
                v115 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * k);
                v116 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v26, "objectForKeyedSubscript:", v115);
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "doubleValue");
                v119 = v118;
                objc_msgSend(v99, "score");
                objc_msgSend(v116, "numberWithDouble:", v119 + v120);
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v121, v115);

              }
              v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v160, v198, 16);
            }
            while (v112);
          }

          v24 = v151;
        }
        objc_autoreleasePoolPop(contextb);
        ++v157;
      }
      while (v157 != v147);
      v98 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v165, v199, 16);
    }
    while (v98);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v24);
  v122 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v158[0] = MEMORY[0x1E0C809B0];
  v158[1] = 3221225472;
  v158[2] = __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_24;
  v158[3] = &unk_1E7E1FAB8;
  v123 = v122;
  v159 = v123;
  objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v158);
  objc_msgSend(v123, "sortUsingSelector:", sel_reverseCompare_);
  v124 = objc_alloc(MEMORY[0x1E0D70CA8]);
  v125 = (void *)objc_msgSend(v124, "initWithEvent:startDate:endDate:score:topics:entities:locations:contacts:contactHandles:mediaItems:", v127, v134, v135, obj, v128, v190[5], 1.0, MEMORY[0x1E0C9AA60], v123, v129);

  _Block_object_dispose(&v189, 8);
LABEL_115:

  return v125;
}

uint64_t __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

void __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0D70C30];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  v11 = (id)objc_msgSend(v8, "initWithContactHandle:score:", v7, v10);
  objc_msgSend(v4, "addObject:", v11);

}

id __82__PPTemporalClusterStorage_createTemporalClusterForEvent_startDate_endDate_error___block_invoke_22(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "source");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__PPTemporalClusterStorage_fetchRelatedMediaRecords___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:", v5) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D70D00], "jaroSimilarityForString:other:", v5, *(_QWORD *)(a1 + 32)), v6 > 0.9))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

+ (id)defaultStorage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  const char *v15;
  void *v17;
  _QWORD block[4];
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v2)
  {
    pp_temporal_clusters_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v15 = "PPTemporalClusterStorage: Failed to obtain default Events Store";
LABEL_19:
    _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_20;
  }
  if (!v3)
  {
    pp_temporal_clusters_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v15 = "PPTemporalClusterStorage: Failed to obtain default Topics Store";
    goto LABEL_19;
  }
  if (!v4)
  {
    pp_temporal_clusters_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v15 = "PPTemporalClusterStorage: Failed to obtain default Named Entities Store";
    goto LABEL_19;
  }
  if (!v5)
  {
    pp_temporal_clusters_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v15 = "PPTemporalClusterStorage: Failed to obtain default Locations Store";
    goto LABEL_19;
  }
  if (!v6)
  {
    pp_temporal_clusters_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = "PPTemporalClusterStorage: Failed to obtain default Contacts Store";
      goto LABEL_19;
    }
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PPTemporalClusterStorage_defaultStorage__block_invoke;
  block[3] = &unk_1E7E1FA28;
  v8 = v2;
  v19 = v8;
  v9 = v3;
  v20 = v9;
  v10 = v4;
  v21 = v10;
  v11 = v5;
  v22 = v11;
  v12 = v7;
  v23 = v12;
  if (defaultStorage__pasOnceToken9 == -1)
  {
    v13 = v12;
    v17 = v9;
  }
  else
  {
    dispatch_once(&defaultStorage__pasOnceToken9, block);
    v11 = v22;
    v13 = v23;
    v10 = v21;
    v17 = v20;
    v8 = v19;
  }
  v14 = (id)defaultStorage__pasExprOnceResult_23485;

LABEL_21:
  return v14;
}

+ (id)enrichEntities:(id)a3 mediaRecords:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  id obj;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "entity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v43 = v5;
  v15 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v43);
        v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v20 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v19, "item");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v7, "containsObject:", v22);

        if (v23)
        {
          v24 = objc_alloc(MEMORY[0x1E0D70C38]);
          objc_msgSend(v19, "item");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithItem:score:", v25, 1.0);
          objc_msgSend(v14, "addObject:", v26);

          objc_msgSend(v19, "item");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v28);

        }
        else
        {
          objc_msgSend(v14, "addObject:", v19);
        }
        objc_autoreleasePoolPop(v20);
      }
      v16 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v16);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v29 = obj;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v45;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
        objc_msgSend(v34, "entity");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v7, "containsObject:", v36);

        if (v37)
        {
          v38 = objc_alloc(MEMORY[0x1E0D70C38]);
          objc_msgSend(v34, "entity");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v38, "initWithItem:score:", v39, 1.0);
          objc_msgSend(v14, "addObject:", v40);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v31);
  }

  return v14;
}

void __42__PPTemporalClusterStorage_defaultStorage__block_invoke(_QWORD *a1)
{
  void *v2;
  PPTemporalClusterStorage *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  v3 = -[PPTemporalClusterStorage initWithEventStore:topicStore:entityStore:locationStore:contactStore:]([PPTemporalClusterStorage alloc], "initWithEventStore:topicStore:entityStore:locationStore:contactStore:", a1[4], a1[5], a1[6], a1[7], a1[8]);
  v4 = (void *)defaultStorage__pasExprOnceResult_23485;
  defaultStorage__pasExprOnceResult_23485 = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

@end
