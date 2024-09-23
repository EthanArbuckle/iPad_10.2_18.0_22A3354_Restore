@implementation PGMemoryPlanner

- (PGMemoryPlanner)initWithPastSource:(id)a3 futureSource:(id)a4 configuration:(id)a5 graph:(id)a6 loggingConnection:(id)a7 progressReporter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PGMemoryPlanner *v20;
  PGMemoryPlanner *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSArray *pastMemories;
  id v27;
  void *v28;
  uint64_t v29;
  NSArray *futureMemoriesGroupedByTrigger;
  uint64_t v31;
  NSArray *memoriesToAvoid;
  PGMemoryDate *v33;
  void *v34;
  PGMemoryDate *v35;
  void *v36;
  uint64_t v37;
  NSDate *currentUniversalMemoryDate;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  MARelation *secondaryFeatureOfFeature;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  objc_super v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)PGMemoryPlanner;
  v20 = -[PGMemoryPlanner init](&v58, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_loggingConnection, a7);
    objc_storeStrong((id *)&v21->_configuration, a5);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v19);
    objc_msgSend(v22, "childProgressReporterToCheckpoint:", 0.3);
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "childProgressReporterToCheckpoint:", 0.6);
    v24 = objc_claimAutoreleasedReturnValue();
    v52 = v22;
    objc_msgSend(v22, "childProgressReporterToCheckpoint:", 1.0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v23;
    objc_msgSend(v14, "pastMemoriesForConfiguration:withGraph:progressReporter:", v21->_configuration, v17, v23);
    v25 = objc_claimAutoreleasedReturnValue();
    pastMemories = v21->_pastMemories;
    v21->_pastMemories = (NSArray *)v25;

    if ((objc_msgSend(v19, "isCancelled") & 1) == 0)
    {
      objc_msgSend(v15, "futureMemoriesForConfiguration:withGraph:progressReporter:", v21->_configuration, v17, v24);
      v27 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "groupFutureMemoriesPerTrigger:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      futureMemoriesGroupedByTrigger = v21->_futureMemoriesGroupedByTrigger;
      v21->_futureMemoriesGroupedByTrigger = (NSArray *)v29;

      v19 = v27;
    }
    v50 = (void *)v24;
    v54 = v18;
    v55 = v16;
    v56 = v15;
    v53 = v19;
    if ((objc_msgSend(v19, "isCancelled") & 1) == 0)
    {
      objc_msgSend(v14, "memoriesToAvoidForConfiguration:withGraph:progressReporter:", v21->_configuration, v17, v57);
      v31 = objc_claimAutoreleasedReturnValue();
      memoriesToAvoid = v21->_memoriesToAvoid;
      v21->_memoriesToAvoid = (NSArray *)v31;

    }
    v33 = [PGMemoryDate alloc];
    -[PGMemoryElectorConfiguration localDate](v21->_configuration, "localDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[PGMemoryDate initWithLocalDate:](v33, "initWithLocalDate:", v34);

    -[PGMemoryElectorConfiguration timeZone](v21->_configuration, "timeZone");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryDate universalDateInTimeZone:](v35, "universalDateInTimeZone:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    currentUniversalMemoryDate = v21->_currentUniversalMemoryDate;
    v21->_currentUniversalMemoryDate = (NSDate *)v37;

    v39 = (void *)MEMORY[0x1E0D42A68];
    +[PGGraphCalendarUnitNodeCollection filter](PGGraphYearNodeCollection, "filter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "relation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v41;
    +[PGGraphOverTheYearsNode filter](PGGraphOverTheYearsNode, "filter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "relation");
    v43 = v14;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v45 = v17;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "union:", v46);
    v47 = objc_claimAutoreleasedReturnValue();
    secondaryFeatureOfFeature = v21->_secondaryFeatureOfFeature;
    v21->_secondaryFeatureOfFeature = (MARelation *)v47;

    v17 = v45;
    v14 = v43;

    v16 = v55;
    v15 = v56;
    v19 = v53;
    v18 = v54;
  }

  return v21;
}

- (id)timeDecayScoreByPastMemoryCreationDate
{
  -[PGMemoryPlanner _computeIfNeededTimeDecayScoreForPastMemories](self, "_computeIfNeededTimeDecayScoreForPastMemories");
  return self->_timeDecayScoreByPastMemoryCreationDate;
}

- (id)maximumTimeDecayScoreByPastMemoryIdentifier
{
  -[PGMemoryPlanner _computeIfNeededTimeDecayScoreForPastMemories](self, "_computeIfNeededTimeDecayScoreForPastMemories");
  return self->_maximumTimeDecayScoreByPastMemoryIdentifier;
}

- (void)_computeIfNeededTimeDecayScoreForPastMemories
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSMutableDictionary *timeDecayScoreByPastMemoryCreationDate;
  NSMutableDictionary *v21;
  NSMutableDictionary *maximumTimeDecayScoreByPastMemoryIdentifier;
  NSArray *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_timeDecayScoreByPastMemoryCreationDate)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = self->_pastMemories;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
          -[PGMemoryPlanner timeDecayScoreForTriggeredMemory:numberOfDaysToLook:](self, "timeDecayScoreForTriggeredMemory:numberOfDaysToLook:", v9, -[PGMemoryElectorConfiguration numberOfDaysToLookInPast](self->_configuration, "numberOfDaysToLookInPast"));
          v11 = v10;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "creationDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v13);

          objc_msgSend(v9, "uniqueMemoryIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          if (v17 >= v11)
            v18 = v17;
          else
            v18 = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, v14);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }

    timeDecayScoreByPastMemoryCreationDate = self->_timeDecayScoreByPastMemoryCreationDate;
    self->_timeDecayScoreByPastMemoryCreationDate = v3;
    v21 = v3;

    maximumTimeDecayScoreByPastMemoryIdentifier = self->_maximumTimeDecayScoreByPastMemoryIdentifier;
    self->_maximumTimeDecayScoreByPastMemoryIdentifier = v4;

  }
}

- (BOOL)tooSoonToElectMemory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  -[PGMemoryPlanner maximumTimeDecayScoreByPastMemoryIdentifier](self, "maximumTimeDecayScoreByPastMemoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueMemoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9 == 1.0;
}

- (id)filterMemories:(id)a3 forTriggerCollisionsWithTriggerHandler:(id)a4 graph:(id)a5 progressReporter:(id)a6
{
  id v10;
  id v11;
  OS_os_log *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *loggingConnection;
  id v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  unint64_t v29;
  id v30;
  double v31;
  double v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint32_t numer;
  uint32_t denom;
  NSObject *v62;
  NSObject *v63;
  id v64;
  os_signpost_id_t spid;
  uint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  id obj;
  PGMemoryPlanner *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
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
  __int128 v104;
  _QWORD v105[4];
  id v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v114[18];
  __int16 v115;
  void *v116;
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v90 = a4;
  v74 = a5;
  v11 = a6;
  v75 = v10;
  v73 = v11;
  if (objc_msgSend(v10, "count"))
  {
    v84 = v11;
    v12 = self->_loggingConnection;
    v13 = os_signpost_id_generate((os_log_t)v12);
    v14 = v12;
    v15 = v14;
    v68 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MemoryElectionFilterMemoriesTriggerCollision", ", buf, 2u);
    }
    spid = v13;
    v72 = v15;

    info = 0;
    mach_timebase_info(&info);
    v67 = mach_absolute_time();
    -[PGMemoryPlanner _overallDateIntervalForTriggeredMemories:](self, "_overallDateIntervalForTriggeredMemories:", v10);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryElectorConfiguration pastMemoryCollisionUniversalDateInterval](self->_configuration, "pastMemoryCollisionUniversalDateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v18 = objc_claimAutoreleasedReturnValue();

    v70 = (void *)v18;
    v71 = v16;
    if (objc_msgSend(v16, "compare:", v18) == -1)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v114 = v16;
        *(_WORD *)&v114[8] = 2112;
        *(_QWORD *)&v114[10] = v18;
        _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryPlanner] The overall valid date interval for all triggered memories (startDate: %@) extends past the past memories date interval (startDate: %@)", buf, 0x16u);
      }
    }
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v77 = self;
    v21 = self->_pastMemories;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v109;
      v25 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v109 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          objc_msgSend(v27, "triggerTypes", spid);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = v25;
          v105[1] = 3221225472;
          v105[2] = __96__PGMemoryPlanner_filterMemories_forTriggerCollisionsWithTriggerHandler_graph_progressReporter___block_invoke;
          v105[3] = &unk_1E84348D0;
          v106 = v20;
          v107 = v27;
          objc_msgSend(v28, "enumerateIndexesUsingBlock:", v105);

        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      }
      while (v23);
    }

    v29 = objc_msgSend(v75, "count");
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    obj = v75;
    v78 = v30;
    v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
    if (v80)
    {
      v31 = 1.0 / (double)v29;
      v79 = *(_QWORD *)v102;
      v32 = 0.0;
      v82 = v20;
      while (2)
      {
        for (j = 0; j != v80; ++j)
        {
          if (*(_QWORD *)v102 != v79)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
          v35 = (void *)MEMORY[0x1CAA4EB2C]();
          v92 = v34;
          objc_msgSend(v34, "validityIntervalByTriggerType");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v37 = v36;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v98;
            v85 = j;
            v86 = v35;
            v89 = v37;
            v81 = *(_QWORD *)v98;
            do
            {
              v41 = 0;
              v83 = v39;
              do
              {
                if (*(_QWORD *)v98 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v41);
                objc_msgSend(v20, "objectForKeyedSubscript:", v42, spid);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v43, "count"))
                {
                  v88 = v41;
                  v91 = objc_msgSend(v42, "unsignedIntegerValue");
                  objc_msgSend(v37, "objectForKeyedSubscript:", v42);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = 0u;
                  v94 = 0u;
                  v95 = 0u;
                  v96 = 0u;
                  v87 = v43;
                  v45 = v43;
                  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                  if (v46)
                  {
                    v47 = v46;
                    v48 = *(_QWORD *)v94;
                    while (2)
                    {
                      for (k = 0; k != v47; ++k)
                      {
                        if (*(_QWORD *)v94 != v48)
                          objc_enumerationMutation(v45);
                        v50 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
                        objc_msgSend(v50, "creationDate");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        v52 = objc_msgSend(v44, "containsDate:", v51);

                        if (v52)
                        {
                          objc_msgSend(v92, "memoryFeatureNodes");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v90, "relevantFeatureNodesInFeatureNodes:forTriggerType:", v53, v91);
                          v54 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v50, "memoryFeatureNodes");
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v55, "collectionByIntersecting:", v54);
                          v56 = (void *)objc_claimAutoreleasedReturnValue();
                          v57 = objc_msgSend(v56, "count");

                          if (v57 == objc_msgSend(v54, "count"))
                          {
                            v58 = v77->_loggingConnection;
                            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                            {
                              *(_DWORD *)buf = 138412802;
                              *(_QWORD *)v114 = v92;
                              *(_WORD *)&v114[8] = 2112;
                              *(_QWORD *)&v114[10] = v50;
                              v115 = 2112;
                              v116 = v44;
                              _os_log_debug_impl(&dword_1CA237000, v58, OS_LOG_TYPE_DEBUG, "[PGMemoryPlanner] Triggered memory (%@) collides with past triggered memory (%@) in validity interval %@", buf, 0x20u);
                            }

                            v37 = v89;
                            v20 = v82;
                            v30 = v78;
                            j = v85;
                            v35 = v86;
                            goto LABEL_43;
                          }

                        }
                      }
                      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v117, 16);
                      if (v47)
                        continue;
                      break;
                    }
                  }

                  v40 = v81;
                  v20 = v82;
                  v41 = v88;
                  v37 = v89;
                  v39 = v83;
                  v43 = v87;
                }

                ++v41;
              }
              while (v41 != v39);
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v97, v118, 16);
              v30 = v78;
              j = v85;
              v35 = v86;
            }
            while (v39);
          }

          objc_msgSend(v30, "addObject:", v92);
LABEL_43:
          v32 = v31 + v32;
          if (objc_msgSend(v84, "isCancelledWithProgress:", v32, spid))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v114 = 226;
              *(_WORD *)&v114[4] = 2080;
              *(_QWORD *)&v114[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Memories/PGMemoryPlanner.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            objc_autoreleasePoolPop(v35);
            v64 = (id)MEMORY[0x1E0C9AA60];
            goto LABEL_55;
          }

          objc_autoreleasePoolPop(v35);
        }
        v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v119, 16);
        if (v80)
          continue;
        break;
      }
    }

    v59 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v62 = v72;
    v63 = v62;
    if (v68 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v63, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFilterMemoriesTriggerCollision", ", buf, 2u);
    }

    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v114 = "MemoryElectionFilterMemoriesTriggerCollision";
      *(_WORD *)&v114[8] = 2048;
      *(double *)&v114[10] = (float)((float)((float)((float)(v59 - v67) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v63, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v30 = v78;
    v64 = v78;
LABEL_55:

  }
  else
  {
    v64 = (id)MEMORY[0x1E0C9AA60];
  }

  return v64;
}

- (id)_overallDateIntervalForTriggeredMemories:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PGMemoryDate *v11;
  void *v12;
  PGMemoryDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16113;
  v29 = __Block_byref_object_dispose__16114;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v22;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "validityIntervalByTriggerType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v8;
        v20[1] = 3221225472;
        v20[2] = __60__PGMemoryPlanner__overallDateIntervalForTriggeredMemories___block_invoke;
        v20[3] = &unk_1E8429CE8;
        v20[4] = &v25;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v6);
  }

  v11 = [PGMemoryDate alloc];
  -[PGMemoryElectorConfiguration localDate](self->_configuration, "localDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGMemoryDate initWithLocalDate:](v11, "initWithLocalDate:", v12);

  -[PGMemoryElectorConfiguration timeZone](self->_configuration, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryDate universalDateInTimeZone:](v13, "universalDateInTimeZone:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "earlierDate:", v26[5]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "laterDate:", v26[5]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v16, v17);

  _Block_object_dispose(&v25, 8);
  return v18;
}

- (id)creationDateOfLastMemory
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = self->_pastMemories;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "creationDate", (_QWORD)v12);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v5)
        {
          objc_msgSend(v5, "laterDate:", v8);
          v10 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v10;
        }
        else
        {
          v5 = (void *)v8;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfDaysSinceMemoryUpgrade
{
  OS_os_log *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t spid;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = self->_loggingConnection;
  v4 = os_signpost_id_generate((os_log_t)v3);
  v5 = v3;
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade", ", buf, 2u);
  }
  spid = v4;

  info = 0;
  mach_timebase_info(&info);
  v26 = mach_absolute_time();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_pastMemories;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "photosGraphVersion", spid);
        if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
        {
          v15 = (void *)MEMORY[0x1E0D4B130];
          objc_msgSend(v14, "creationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "startOfDayForDate:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v17);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v11);
  }

  v18 = objc_msgSend(v8, "count");
  v19 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v22 = v6;
  v23 = v22;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, spid, "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade", ", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "PGMemoryPlannerNumberOfDaysSinceMemoryUpgrade";
    v34 = 2048;
    v35 = (float)((float)((float)((float)(v19 - v26) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v18;
}

- (double)timeDecayScoreForTriggeredMemory:(id)a3 numberOfDaysToLook:(unint64_t)a4
{
  void *v6;
  double v7;
  double v8;

  objc_msgSend(a3, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_currentUniversalMemoryDate);
  v8 = fabs(v7);

  return fmax(fmin((v8 / 86400.0 - (double)a4)/ ((double)-[PGMemoryElectorConfiguration minimumNumberOfDaysBeforeTimeDecay](self->_configuration, "minimumNumberOfDaysBeforeTimeDecay")- (double)a4), 1.0), 0.0);
}

- (double)collisionScoreForMemory:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSArray *obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *context;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  -[PGMemoryPlanner _computeIfNeededTimeDecayScoreForPastMemories](self, "_computeIfNeededTimeDecayScoreForPastMemories");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v4 = self->_pastMemories;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (!v5)
  {

    v8 = 0.0;
    v20 = v46;
LABEL_12:
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = self->_futureMemoriesGroupedByTrigger;
    v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
    if (v43)
    {
      v42 = *(_QWORD *)v53;
LABEL_14:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v42)
          objc_enumerationMutation(obj);
        v44 = v21;
        v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v21);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v47 = v22;
        v23 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v49;
          v26 = 1.0;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v49 != v25)
                objc_enumerationMutation(v47);
              v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              objc_msgSend(v20, "uniqueMemoryIdentifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "uniqueMemoryIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v29, "isEqualToString:", v30) & 1) != 0)
              {
                objc_msgSend(v20, "triggerTypes");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "triggerTypes");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v31, "containsIndexes:", v32);

                v20 = v46;
                if ((v33 & 1) != 0)
                {
                  v26 = 0.0;
                  goto LABEL_32;
                }
              }
              else
              {

              }
              -[PGMemoryPlanner commonalityScoreComparingMemory:toMemory:](self, "commonalityScoreComparingMemory:toMemory:", v20, v28);
              v35 = v34;
              -[PGMemoryPlanner timeDecayScoreForTriggeredMemory:numberOfDaysToLook:](self, "timeDecayScoreForTriggeredMemory:numberOfDaysToLook:", v28, -[PGMemoryElectorConfiguration numberOfDaysToLookInFuture](self->_configuration, "numberOfDaysToLookInFuture"));
              v37 = v36;
              +[PGMemoryTriggerHandler triggerScoreForTriggeredMemory:](PGMemoryTriggerHandler, "triggerScoreForTriggeredMemory:", v28);
              v39 = fmin(v35 * v37 * v38, 1.0);
              if (v39 < v26)
                v26 = v39;
            }
            v24 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
          }
          while (v24);
        }
        else
        {
          v26 = 1.0;
        }
LABEL_32:

        v8 = fmax(v8, v26);
        objc_autoreleasePoolPop(context);
        if (v26 == 1.0)
          break;
        v21 = v44 + 1;
        if (v44 + 1 == v43)
        {
          v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
          if (v43)
            goto LABEL_14;
          break;
        }
      }
    }

    goto LABEL_36;
  }
  v6 = v5;
  v7 = *(_QWORD *)v57;
  v8 = 0.0;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v7)
      objc_enumerationMutation(v4);
    v10 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v9);
    v11 = (void *)MEMORY[0x1CAA4EB2C]();
    -[PGMemoryPlanner commonalityScoreComparingMemory:toMemory:](self, "commonalityScoreComparingMemory:toMemory:", v46, v10);
    v13 = v12;
    -[PGMemoryPlanner timeDecayScoreByPastMemoryCreationDate](self, "timeDecayScoreByPastMemoryCreationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    v19 = v13 * v18;
    v8 = fmax(v8, v19);
    objc_autoreleasePoolPop(v11);
    if (v19 >= 1.0)
      break;
    if (v6 == ++v9)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v6)
        goto LABEL_3;
      break;
    }
  }

  v20 = v46;
  if (v8 < 1.0)
    goto LABEL_12;
LABEL_36:

  return v8;
}

- (double)avoidScoreForMemory:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_memoriesToAvoid;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = 0.0;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v4, "uniqueMemoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueMemoryIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          objc_autoreleasePoolPop(v11);
          v8 = 1.0;
          goto LABEL_12;
        }
        -[PGMemoryPlanner _commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:](self, "_commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:", v4, v10, 1.0, 0.0, 0.0);
        v8 = fmax(v8, v15);
        objc_autoreleasePoolPop(v11);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0.0;
  }
LABEL_12:

  return v8;
}

- (double)featureCommonalityScoreComparingFeatureNodes:(id)a3 toFeatureNodes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  double v24;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "labels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "labels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMemoryPlanner similarFeatureSets](self, "similarFeatureSets");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v15, "intersectsSet:", v8) && (objc_msgSend(v15, "intersectsSet:", v9) & 1) != 0)
        {
          v24 = 1.0;
          v16 = v10;
          goto LABEL_18;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "collectionByIntersecting:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    v18 = v17;
    +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", v6, self->_secondaryFeatureOfFeature);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    v21 = objc_msgSend(v6, "count");
    if (!v20 || v21 == v20)
    {
      v24 = (double)v18 / (double)v21;
    }
    else
    {
      v26 = v21 - v20;
      +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", v16, self->_secondaryFeatureOfFeature);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      v24 = ((double)(v18 - v23) / (double)v26 + (double)v23 / (double)v20 * 0.5) / 1.5;

    }
  }
  else
  {
    v24 = 0.0;
  }
LABEL_18:

  return v24;
}

- (double)commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4
{
  double result;

  -[PGMemoryPlanner _commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:](self, "_commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:", a3, a4, 1.0, 0.75, 0.25);
  return result;
}

- (double)commonalityScoreComparingMemory:(id)a3 toAlreadyElectedMemory:(id)a4
{
  double result;

  -[PGMemoryPlanner _commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:](self, "_commonalityScoreComparingMemory:toMemory:momentWeight:featureWeight:memoryCategoryWeight:", a3, a4, 0.5, 1.0, 1.0);
  return result;
}

- (double)_commonalityScoreComparingMemory:(id)a3 toMemory:(id)a4 momentWeight:(double)a5 featureWeight:(double)a6 memoryCategoryWeight:(double)a7
{
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v12 = a3;
  v13 = a4;
  v14 = 0.0;
  v15 = 0.0;
  if (a5 > 0.0)
  {
    v16 = (void *)objc_opt_class();
    objc_msgSend(v12, "memoryMomentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "memoryMomentNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_momentCommonalityScoreComparingMomentNodes:toMomentNodes:", v17, v18);
    v15 = v19;

  }
  if (a6 > 0.0)
  {
    objc_msgSend(v12, "memoryFeatureNodes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "memoryFeatureNodes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryPlanner featureCommonalityScoreComparingFeatureNodes:toFeatureNodes:](self, "featureCommonalityScoreComparingFeatureNodes:toFeatureNodes:", v20, v21);
    v14 = v22;

  }
  v23 = 0.0;
  v24 = 0.0;
  if (a7 > 0.0)
    -[PGMemoryPlanner categorySimilarityScoreBetweenMemory:andMemory:](self, "categorySimilarityScoreBetweenMemory:andMemory:", v12, v13, 0.0);
  v25 = a5 + a6 + a7;
  if (v25 > 0.0)
    v23 = (v14 * a6 + v15 * a5 + v24 * a7) / v25;

  return v23;
}

- (double)categorySimilarityScoreBetweenMemory:(id)a3 andMemory:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "memoryCategory");
  v9 = objc_msgSend(v7, "memoryCategory");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E98F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = objc_msgSend(v10, "containsObject:", v12);

    if (v14)
    {
      objc_msgSend(v6, "memoryFeatureNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "parentMeaningNodes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "collectionByFormingUnionWith:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "memoryFeatureNodes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection subsetInCollection:](PGGraphMeaningNodeCollection, "subsetInCollection:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "parentMeaningNodes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "collectionByFormingUnionWith:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "intersectsCollection:", v22))
        v23 = 1.0;
      else
        v23 = 0.0;

      goto LABEL_22;
    }
  }
  else
  {
    v13 = v10;

  }
  v23 = 1.0;
  if (v8 != v9)
  {
    -[PGMemoryPlanner similarCategorySets](self, "similarCategorySets");
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    v23 = 0.0;
    if (v25)
    {
      v26 = v25;
      v34 = v13;
      v35 = v7;
      v36 = v6;
      v27 = *(_QWORD *)v38;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v28);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v29, "containsObject:", v30) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v29, "containsObject:", v31);

            if ((v32 & 1) != 0)
            {
              v23 = 1.0;
              goto LABEL_20;
            }
          }
          else
          {

          }
          ++v28;
        }
        while (v26 != v28);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v26);
LABEL_20:
      v7 = v35;
      v6 = v36;
      v13 = v34;
    }

  }
LABEL_22:

  return v23;
}

- (id)similarCategorySets
{
  NSSet *similarCategorySets;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  similarCategorySets = self->_similarCategorySets;
  if (!similarCategorySets)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9910);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9928, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9940);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9958);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E84E9970);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v10);
    v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v12 = self->_similarCategorySets;
    self->_similarCategorySets = v11;

    similarCategorySets = self->_similarCategorySets;
  }
  return similarCategorySets;
}

- (id)similarFeatureSets
{
  NSSet *similarFeatureSets;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  similarFeatureSets = self->_similarFeatureSets;
  if (!similarFeatureSets)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = CFSTR("PlayTime");
    v11[1] = CFSTR("PersonToys");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_similarFeatureSets;
    self->_similarFeatureSets = v8;

    similarFeatureSets = self->_similarFeatureSets;
  }
  return similarFeatureSets;
}

- (PGMemoryElectorConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_similarFeatureSets, 0);
  objc_storeStrong((id *)&self->_secondaryFeatureOfFeature, 0);
  objc_storeStrong((id *)&self->_maximumTimeDecayScoreByPastMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_timeDecayScoreByPastMemoryCreationDate, 0);
  objc_storeStrong((id *)&self->_similarCategorySets, 0);
  objc_storeStrong((id *)&self->_currentUniversalMemoryDate, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_futureMemoriesGroupedByTrigger, 0);
  objc_storeStrong((id *)&self->_memoriesToAvoid, 0);
  objc_storeStrong((id *)&self->_pastMemories, 0);
}

void __60__PGMemoryPlanner__overallDateIntervalForTriggeredMemories___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a3, "startDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __96__PGMemoryPlanner_filterMemories_forTriggerCollisionsWithTriggerHandler_graph_progressReporter___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

+ (BOOL)_isFallbackMemory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "triggerTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "triggerTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsIndex:", 0);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (BOOL)canElectTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count") && (objc_msgSend(a1, "_isFallbackMemory:", v6) & 1) == 0)
  {
    objc_msgSend(v6, "triggerTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsIndex:", 5);

    if (v11)
    {
      v8 = objc_msgSend(a1, "canElectEndOfYearTriggeredMemory:withAlreadyElectedMemories:", v6, v7);
    }
    else
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v6, "triggerTypes", (_QWORD)v21);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "triggerTypes");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToIndexSet:", v19);

            if ((v20 & 1) != 0)
            {
              v8 = 0;
              goto LABEL_17;
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v14)
            continue;
          break;
        }
      }
      v8 = 1;
LABEL_17:

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)canElectEndOfYearTriggeredMemory:(id)a3 withAlreadyElectedMemories:(id)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "triggerTypes", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsIndex:", 5);

        if (!v10)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

+ (id)groupFutureMemoriesPerTrigger:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v21;
  uint64_t v22;
  id obj;
  int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_16141);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  v7 = 0;
  if (v25)
  {
    v8 = *(_QWORD *)v27;
    v22 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v9);
        if (!v10)
        {
LABEL_9:
          objc_msgSend(v6, "addObject:", v11);
          goto LABEL_12;
        }
        objc_msgSend(v10, "creationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "creationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "isDate:inSameDayAsDate:", v12, v13) & 1) != 0)
        {
          objc_msgSend(v10, "triggerTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "triggerTypes");
          v15 = v6;
          v16 = v5;
          v17 = v4;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v14, "containsIndexes:", v18);

          v4 = v17;
          v5 = v16;
          v6 = v15;
          v8 = v22;

          if (v24)
            goto LABEL_9;
        }
        else
        {

        }
        objc_msgSend(v4, "addObject:", v6);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
        v19 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v19;
LABEL_12:
        v7 = v11;

        ++v9;
        v10 = v7;
      }
      while (v25 != v9);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v25);
  }

  objc_msgSend(v4, "addObject:", v6);
  return v4;
}

+ (double)_momentCommonalityScoreComparingMomentNodes:(id)a3 toMomentNodes:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  double v8;

  v5 = a3;
  objc_msgSend(v5, "collectionByIntersecting:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7)
    v8 = (double)v7 / (double)(unint64_t)objc_msgSend(v5, "count");
  else
    v8 = 0.0;

  return v8;
}

uint64_t __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a2;
  v5 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  v25 = v8;
  v9 = v23[3];
  if (!v9)
  {
    objc_msgSend(v4, "triggerTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_2;
    v19 = &unk_1E8431330;
    v11 = v5;
    v20 = v11;
    v21 = &v22;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", &v16);

    if (!v23[3])
    {
      objc_msgSend(v4, "uniqueMemoryIdentifier", v16, v17, v18, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueMemoryIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);
      v23[3] = v14;

    }
    v9 = v23[3];
  }
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  _QWORD v7[7];

  objc_msgSend(*(id *)(a1 + 32), "triggerTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_3;
  v7[3] = &unk_1E8429D50;
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = a2;
  v7[6] = a3;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v7);

}

void __49__PGMemoryPlanner_groupFutureMemoriesPerTrigger___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "compare:", v7);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    **(_BYTE **)(a1 + 48) = 1;
    *a3 = 1;
  }
}

@end
