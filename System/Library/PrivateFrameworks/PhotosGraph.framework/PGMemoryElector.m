@implementation PGMemoryElector

- (PGMemoryElector)initWithWorkingContext:(id)a3 userFeedbackCalculator:(id)a4
{
  id v7;
  id v8;
  PGMemoryElector *v9;
  PGMemoryElector *v10;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  uint64_t v13;
  OS_os_log *loggingConnection;
  uint64_t v15;
  PGCurationManager *curationManager;
  id v17;
  uint64_t v18;
  CLSCurationContext *curationContext;
  PGRemoteConfiguration *v20;
  PGRemoteConfiguration *remoteConfiguration;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PGMemoryElector;
  v9 = -[PGMemoryElector init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    objc_msgSend(v7, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v11;

    objc_msgSend(v7, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v13;

    objc_msgSend(v7, "curationManager");
    v15 = objc_claimAutoreleasedReturnValue();
    curationManager = v10->_curationManager;
    v10->_curationManager = (PGCurationManager *)v15;

    objc_storeStrong((id *)&v10->_userFeedbackCalculator, a4);
    v17 = objc_alloc_init(MEMORY[0x1E0D77E18]);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithUserFeedbackCalculator:curationSession:", v10->_userFeedbackCalculator, v17);
    curationContext = v10->_curationContext;
    v10->_curationContext = (CLSCurationContext *)v18;

    v20 = -[PGRemoteConfiguration initWithTrialNamespace:onDiskResourceFile:]([PGRemoteConfiguration alloc], "initWithTrialNamespace:onDiskResourceFile:", 1, 0);
    remoteConfiguration = v10->_remoteConfiguration;
    v10->_remoteConfiguration = v20;

  }
  return v10;
}

- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 progressReporter:(id)a5
{
  OS_os_log *v9;
  id v10;
  id v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *loggingConnection;
  NSObject *v19;
  int v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = self->_loggingConnection;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = os_signpost_id_generate((os_log_t)v9);
  v14 = v9;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "MemoryElection", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v16 = mach_absolute_time();
  -[PGMemoryElector generateEnrichedMemoriesWithConfiguration:graph:plannerPastSource:plannerFutureSource:progressReporter:](self, "generateEnrichedMemoriesWithConfiguration:graph:plannerPastSource:plannerFutureSource:progressReporter:", v12, v11, 0, 0, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v19 = loggingConnection;
    v20 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v20;
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Generated %d memories", buf, 8u);

  }
  v21 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v24 = v15;
  v25 = v24;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v13, "MemoryElection", " enableTelemetry=YES ", buf, 2u);
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "MemoryElection";
    v30 = 2048;
    v31 = (float)((float)((float)((float)(v21 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v17;
}

- (id)generateEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4 plannerPastSource:(id)a5 plannerFutureSource:(id)a6 progressReporter:(id)a7
{
  id v12;
  id v13;
  id v14;
  PGMemoryTriggerHandler *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v21;
  PGMemoryPlannerPhotoKitSource *v22;
  PGMemoryPlannerPhotoKitSource *v23;
  PGMemoryTriggerHandler *v24;
  PGMemoryPlanner *v25;
  void *v26;
  PGMemoryContext *v27;
  void *v28;
  void *v29;
  void *v30;
  PGMemoryContext *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  id v54;
  PGMemoryTriggerHandler *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  PGMemoryContext *v62;
  PGMemoryPlanner *v63;
  PGMemoryTriggerHandler *v64;
  PGMemoryPlannerPhotoKitSource *v65;
  PGMemoryMomentNodesWithBlockedFeatureCache *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  PGMemoryTriggerHandler *v73;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (PGMemoryTriggerHandler *)a6;
  v16 = a7;
  if (objc_msgSend(v12, "requestedMemoryCategory"))
    goto LABEL_5;
  objc_msgSend(v12, "requestedUniqueMemoryIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {
    v18 = objc_msgSend(v12, "requestedTriggerType");

    if (v18)
      goto LABEL_5;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v16);
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.1);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.3);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.4);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.6);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.8);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 0.9);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "childProgressReporterToCheckpoint:", 1.0);
    v67 = objc_claimAutoreleasedReturnValue();
    v66 = -[PGMemoryMomentNodesWithBlockedFeatureCache initWithUserFeedbackCalculator:loggingConnection:]([PGMemoryMomentNodesWithBlockedFeatureCache alloc], "initWithUserFeedbackCalculator:loggingConnection:", self->_userFeedbackCalculator, self->_loggingConnection);
    v73 = -[PGMemoryTriggerHandler initWithWorkingContext:momentNodesWithBlockedFeatureCache:]([PGMemoryTriggerHandler alloc], "initWithWorkingContext:momentNodesWithBlockedFeatureCache:", self->_workingContext, v66);
    if (v14)
      v22 = (PGMemoryPlannerPhotoKitSource *)v14;
    else
      v22 = -[PGMemoryPlannerPhotoKitSource initWithPhotoLibrary:loggingConnection:]([PGMemoryPlannerPhotoKitSource alloc], "initWithPhotoLibrary:loggingConnection:", self->_photoLibrary, self->_loggingConnection);
    v23 = v22;
    if (v15)
      v24 = v15;
    else
      v24 = v73;
    v64 = v24;
    v65 = v23;
    v25 = -[PGMemoryPlanner initWithPastSource:futureSource:configuration:graph:loggingConnection:progressReporter:]([PGMemoryPlanner alloc], "initWithPastSource:futureSource:configuration:graph:loggingConnection:progressReporter:", v23, v64, v12, v13, self->_loggingConnection, v74);
    if ((objc_msgSend(v16, "isCancelled") & 1) != 0)
    {
      v19 = (id)MEMORY[0x1E0C9AA60];
      v26 = (void *)v67;
LABEL_47:

      goto LABEL_6;
    }
    v61 = v21;
    v27 = -[PGMemoryContext initWithMemoryPlanner:photoLibrary:]([PGMemoryContext alloc], "initWithMemoryPlanner:photoLibrary:", v25, self->_photoLibrary);
    -[PGMemoryTriggerHandler allTriggeredMemoriesWithContext:inGraph:progressReporter:](v73, "allTriggeredMemoriesWithContext:inGraph:progressReporter:", v27, v13, v72);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v27;
    v63 = v25;
    if ((objc_msgSend(v16, "isCancelled") & 1) != 0)
    {
      v19 = (id)MEMORY[0x1E0C9AA60];
      v26 = (void *)v67;
      v29 = v28;
      v23 = v65;
    }
    else
    {
      -[PGMemoryPlanner filterMemories:forTriggerCollisionsWithTriggerHandler:graph:progressReporter:](v25, "filterMemories:forTriggerCollisionsWithTriggerHandler:graph:progressReporter:", v28, v73, v13, v71);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v16, "isCancelled") & 1) == 0)
      {
        v58 = v14;
        -[PGMemoryTriggerHandler holidayService](v73, "holidayService");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v27;
        +[PGMemoryTriggerHandler fallbackTriggeredMemoriesWithContext:excludingTriggeredMemories:inGraph:holidayService:](PGMemoryTriggerHandler, "fallbackTriggeredMemoriesWithContext:excludingTriggeredMemories:inGraph:holidayService:", v27, v29, v13, v30);
        v32 = v29;
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v57 = (void *)v34;
        -[PGMemoryElector filterAndSortTriggeredMemories:withPlanner:context:configuration:progressReporter:](self, "filterAndSortTriggeredMemories:withPlanner:context:configuration:progressReporter:", v34, v63, v31, v12, v70);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v35;
        if ((objc_msgSend(v16, "isCancelled") & 1) != 0)
        {
          v19 = (id)MEMORY[0x1E0C9AA60];
          v14 = v58;
          v21 = v61;
          v26 = (void *)v67;
          v23 = v65;
        }
        else
        {
          v56 = v33;
          v36 = -[PGMemoryElector targetNumberOfMemoriesFromConfigurator:graph:context:](self, "targetNumberOfMemoriesFromConfigurator:graph:context:", v12, v13, v31);
          v75 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v35, "firstObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "memoryCategory");

          if (v38 == 8)
          {
            v53 = v36;
            v54 = v16;
            v55 = v15;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v39 = v35;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v77 != v42)
                    objc_enumerationMutation(v39);
                  v44 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                  objc_msgSend(v44, "triggerTypes");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = objc_msgSend(v45, "containsIndex:", 5);

                  if (v46)
                    objc_msgSend(v75, "addObject:", v44);
                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
              }
              while (v41);
            }

            v14 = v58;
            if (objc_msgSend(v75, "count"))
            {
              v36 = v53;
              -[PGMemoryElector electAndEnrichSortedTriggeredMemories:alreadyEnrichedMemories:targetNumberOfMemories:configuration:graph:planner:context:progressReporter:](self, "electAndEnrichSortedTriggeredMemories:alreadyEnrichedMemories:targetNumberOfMemories:configuration:graph:planner:context:progressReporter:", v75, MEMORY[0x1E0C9AA60], v53, v12, v13, v63, v62, v68);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v54;
              v15 = v55;
            }
            else
            {
              v47 = (void *)MEMORY[0x1E0C9AA60];
              v16 = v54;
              v15 = v55;
              v36 = v53;
            }
          }
          else
          {
            v47 = (void *)MEMORY[0x1E0C9AA60];
            v14 = v58;
          }
          v48 = v47;
          if (objc_msgSend(v47, "count") >= v36)
          {
            v59 = v48;
          }
          else
          {
            v49 = v36;
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v60);
            objc_msgSend(v50, "removeObjectsInArray:", v75);
            -[PGMemoryElector electAndEnrichSortedTriggeredMemories:alreadyEnrichedMemories:targetNumberOfMemories:configuration:graph:planner:context:progressReporter:](self, "electAndEnrichSortedTriggeredMemories:alreadyEnrichedMemories:targetNumberOfMemories:configuration:graph:planner:context:progressReporter:", v50, v48, v49, v12, v13, v63, v62, v69);
            v51 = objc_claimAutoreleasedReturnValue();

            v59 = (void *)v51;
          }
          v21 = v61;
          v26 = (void *)v67;
          v23 = v65;
          if ((objc_msgSend(v16, "isCancelled") & 1) != 0
            || objc_msgSend(v12, "shouldPersist")
            && (-[PGMemoryElector persistEnrichedMemories:pendingState:graph:progressReporter:](self, "persistEnrichedMemories:pendingState:graph:progressReporter:", v59, objc_msgSend(v12, "pendingState"), v13, v67), (objc_msgSend(v16, "isCancelled") & 1) != 0))
          {
            v19 = (id)MEMORY[0x1E0C9AA60];
            v52 = v59;
          }
          else
          {
            v52 = v59;
            v19 = v59;
          }

          v33 = v56;
        }

        v29 = v57;
        goto LABEL_46;
      }
      v19 = (id)MEMORY[0x1E0C9AA60];
      v26 = (void *)v67;
      v23 = v65;
    }
    v21 = v61;
LABEL_46:

    v25 = v63;
    goto LABEL_47;
  }

LABEL_5:
  -[PGMemoryElector _requestedEnrichedMemoriesWithConfiguration:graph:](self, "_requestedEnrichedMemoriesWithConfiguration:graph:", v12, v13);
  v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v19;
}

- (id)filterAndSortTriggeredMemories:(id)a3 withPlanner:(id)a4 context:(id)a5 configuration:(id)a6 progressReporter:(id)a7
{
  id v12;
  OS_os_log *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  uint8_t v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *loggingConnection;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  unint64_t v69;
  uint64_t v70;
  uint32_t numer;
  uint32_t denom;
  NSObject *v73;
  NSObject *v74;
  unint64_t v75;
  NSObject *v76;
  os_signpost_id_t v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  mach_timebase_info v85;
  NSObject *v86;
  NSObject *v87;
  id v88;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  os_signpost_id_t spid;
  unint64_t v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  PGMemoryElector *v107;
  void *v108;
  void *v109;
  id v110;
  NSObject *obj;
  uint64_t v112;
  uint64_t v113;
  void *context;
  _QWORD v115[4];
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  PGMemoryElector *v121;
  id v122;
  uint64_t *v123;
  uint8_t *v124;
  double v125;
  mach_timebase_info v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  double *v136;
  uint64_t v137;
  uint64_t v138;
  uint8_t buf[8];
  uint8_t *v140;
  uint64_t v141;
  char v142;
  mach_timebase_info info;
  uint8_t v144[128];
  uint8_t v145[4];
  _BYTE v146[18];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v106 = a4;
  v103 = a5;
  v105 = a6;
  v101 = v12;
  v102 = a7;
  if (!objc_msgSend(v12, "count"))
  {
    v88 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_90;
  }
  v107 = self;
  v13 = self->_loggingConnection;
  v14 = os_signpost_id_generate((os_log_t)v13);
  v15 = v13;
  v16 = v15;
  spid = v14;
  v94 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MemoryElectionFilterAndSortFilter", ", buf, 2u);
  }
  v95 = v16;

  info = 0;
  mach_timebase_info(&info);
  v90 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v103, "numberOfDaysSinceMemoryUpgrade");
  v91 = objc_msgSend(v105, "numberOfDaysToFocusOnNewMemoryTypes");
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[PGRemoteConfiguration arrayValueForKey:withFallbackValue:](self->_remoteConfiguration, "arrayValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.election.blockedMemoryCategorySubcategories"), MEMORY[0x1E0C9AA60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(v17, "initWithArray:", v18);

  v110 = v102;
  *(_QWORD *)buf = 0;
  v140 = buf;
  v141 = 0x2020000000;
  v142 = 0;
  v135 = 0;
  v136 = (double *)&v135;
  v137 = 0x2020000000;
  v138 = 0;
  v19 = objc_msgSend(v12, "count");
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v20 = v12;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
  if (!v21)
    goto LABEL_65;
  v22 = 0.5 / (double)v19;
  v112 = *(_QWORD *)v132;
  obj = v20;
  while (2)
  {
    v113 = v21;
    for (i = 0; i != v113; ++i)
    {
      if (*(_QWORD *)v132 != v112)
        objc_enumerationMutation(obj);
      v24 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      v136[3] = v22 + v136[3];
      if (v140[24])
      {
        v140[24] = 1;
LABEL_13:
        v26 = 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v145 = 67109378;
          *(_DWORD *)v146 = 212;
          *(_WORD *)&v146[4] = 2080;
          *(_QWORD *)&v146[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Memories/PGMemoryElector.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v145, 0x12u);
        }
        goto LABEL_61;
      }
      v25 = objc_msgSend(v110, "isCancelledWithProgress:");
      v140[24] = v25;
      if ((v25 & 1) != 0)
        goto LABEL_13;
      if (objc_msgSend(v108, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "memoryCategorySubcategory"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v108, "containsObject:", v27);

        if (v28)
        {
          v29 = v107->_loggingConnection;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v24, "uniqueMemoryIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v24, "memoryCategorySubcategory");
            *(_DWORD *)v145 = 138478083;
            *(_QWORD *)v146 = v30;
            *(_WORD *)&v146[8] = 2048;
            *(_QWORD *)&v146[10] = v31;
            _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory %{private}@ of type %lu because it is blocked", v145, 0x16u);

          }
          goto LABEL_23;
        }
      }
      if (!objc_msgSend(v106, "tooSoonToElectMemory:", v24))
      {
        objc_msgSend(v105, "collidableSuggestions");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v104, "count"))
        {
          v33 = -[PGMemoryElector _shouldCheckForSuggestionCollisionsForTriggeredMemory:](v107, "_shouldCheckForSuggestionCollisionsForTriggeredMemory:", v24);

          if (!v33)
            goto LABEL_39;
          objc_msgSend(v24, "memoryMomentNodes");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "universalDateInterval");
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v104, "startDate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "endDate");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v129 = 0u;
          v130 = 0u;
          v128 = 0u;
          v127 = 0u;
          objc_msgSend(v105, "collidableSuggestions");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
          if (v37)
          {
            v38 = *(_QWORD *)v128;
            while (2)
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v128 != v38)
                  objc_enumerationMutation(v36);
                v40 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * j);
                objc_msgSend(v40, "universalEndDate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v35, "compare:", v41) == 1)
                {

                }
                else
                {
                  objc_msgSend(v40, "universalStartDate");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v109, "compare:", v42) == -1;

                  if (!v43)
                  {

                    loggingConnection = v107->_loggingConnection;
                    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)v145 = 138412546;
                      *(_QWORD *)v146 = v35;
                      *(_WORD *)&v146[8] = 2112;
                      *(_QWORD *)&v146[10] = v109;
                      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory with moment nodes start date %@ and end date %@ because it collides with a suggestion", v145, 0x16u);
                    }

                    goto LABEL_24;
                  }
                }
              }
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v127, v144, 16);
              if (v37)
                continue;
              break;
            }
          }

        }
LABEL_39:
        v44 = objc_msgSend(v24, "memoryCategory");
        objc_msgSend(v24, "memoryFeatureNodes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphNodeCollection subsetInCollection:](PGGraphPersonNodeCollection, "subsetInCollection:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v46, "count") == 1)
        {
          objc_msgSend(v46, "uuids");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "anyObject");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v48, "length")
            && (-[PHUserFeedbackCalculator userFeedbackTypeForPersonUUID:](v107->_userFeedbackCalculator, "userFeedbackTypeForPersonUUID:", v48) & 0xFFFFFFFFFFFFFFFELL) == 2)
          {
            v49 = v107->_loggingConnection;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v44);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v145 = 138412546;
              *(_QWORD *)v146 = v50;
              *(_WORD *)&v146[8] = 2112;
              *(_QWORD *)&v146[10] = v48;
              _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ featuring persons with uuid %@", v145, 0x16u);

            }
            v26 = 3;
            goto LABEL_59;
          }

        }
        if (-[PGMemoryElector _memoryContainsNegativeFeedbackPets:](v107, "_memoryContainsNegativeFeedbackPets:", v24))
        {
          v26 = 3;
LABEL_60:

          goto LABEL_61;
        }
        objc_msgSend(v24, "memoryFeatureNodes");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "memoryMomentNodes");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:](PGMemoryFeatureBlocking, "blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:", v51, v52, v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setBlockableFeatures:", v48);
        -[PHUserFeedbackCalculator memoryFeaturesWithNegativeFeedbackForMemoryFeatures:](v107->_userFeedbackCalculator, "memoryFeaturesWithNegativeFeedbackForMemoryFeatures:", v48);
        v49 = objc_claimAutoreleasedReturnValue();
        if (-[NSObject count](v49, "count"))
        {
          v53 = v107->_loggingConnection;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v44);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v145 = 138412546;
            *(_QWORD *)v146 = v54;
            *(_WORD *)&v146[8] = 2112;
            *(_QWORD *)&v146[10] = v49;
            _os_log_impl(&dword_1CA237000, v53, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ because it contains blocked features %@", v145, 0x16u);

          }
          v26 = 3;
        }
        else
        {
          +[PGMemoryTriggerHandler triggerScoreForTriggeredMemory:](PGMemoryTriggerHandler, "triggerScoreForTriggeredMemory:", v24);
          v57 = v56;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setObject:forKey:", v58, v24);

          objc_msgSend(v106, "collisionScoreForMemory:", v24);
          v60 = v59;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "setObject:forKey:", v61, v24);

          objc_msgSend(v106, "avoidScoreForMemory:", v24);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setObject:forKey:", v62, v24);

          objc_msgSend(v24, "memoryMomentNodes");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "averageContentScore");
          v65 = v64;

          if (v92 <= v91)
          {
            -[PGMemoryElector _contentScoreWeightForNewMemoryFocusWithCategory:](v107, "_contentScoreWeightForNewMemoryFocusWithCategory:", v44);
            v65 = v65 * v66;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setObject:forKey:", v67, v24);

          objc_msgSend(v24, "setElectionScore:", v57 + v60 * 0.01 + v65 * 0.001);
          objc_msgSend(v24, "validityIntervalByTriggerType");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = +[PGMemoryTriggerHandler maximumValidityPeriodForValidityIntervalByTriggerType:context:](PGMemoryTriggerHandler, "maximumValidityPeriodForValidityIntervalByTriggerType:context:", v68, v103);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v69);
          v53 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setObject:forKey:", v53, v24);
          v26 = 0;
        }

LABEL_59:
        goto LABEL_60;
      }
      v29 = v107->_loggingConnection;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v24, "uniqueMemoryIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v145 = 138477827;
        *(_QWORD *)v146 = v32;
        _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[PGMemoryElector] Not considering to elect memory %{private}@ because it is too soon since we last elected it", v145, 0xCu);

      }
LABEL_23:

LABEL_24:
      v26 = 3;
LABEL_61:
      objc_autoreleasePoolPop(context);
      if (v26 != 3 && v26)
      {
        v88 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_88;
      }
    }
    v20 = obj;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v131, v147, 16);
    if (v21)
      continue;
    break;
  }
LABEL_65:

  v70 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v73 = v95;
  v74 = v73;
  if (v94 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
  {
    *(_WORD *)v145 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v74, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFilterAndSortFilter", ", v145, 2u);
  }

  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v145 = 136315394;
    *(_QWORD *)v146 = "MemoryElectionFilterAndSortFilter";
    *(_WORD *)&v146[8] = 2048;
    *(double *)&v146[10] = (float)((float)((float)((float)(v70 - v90) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v74, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v145, 0x16u);
  }
  if (objc_msgSend(v100, "count"))
  {
    v75 = objc_msgSend(v100, "count");
    v76 = v107->_loggingConnection;
    v77 = os_signpost_id_generate(v76);
    v78 = v76;
    v79 = v78;
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_WORD *)v145 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v79, OS_SIGNPOST_INTERVAL_BEGIN, v77, "MemoryElectionFilterAndSortSort", ", v145, 2u);
    }

    v126 = 0;
    mach_timebase_info(&v126);
    v80 = mach_absolute_time();
    objc_msgSend(v100, "keyEnumerator");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "allObjects");
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __101__PGMemoryElector_filterAndSortTriggeredMemories_withPlanner_context_configuration_progressReporter___block_invoke;
    v115[3] = &unk_1E8433D88;
    v125 = 0.5 / (double)v75;
    v123 = &v135;
    v124 = buf;
    v116 = v110;
    v117 = v98;
    v118 = v99;
    v119 = v100;
    v120 = v96;
    v121 = v107;
    v122 = v97;
    objc_msgSend(v82, "sortedArrayUsingComparator:", v115);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = mach_absolute_time();
    v85 = v126;
    v86 = v79;
    v87 = v86;
    if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
    {
      *(_WORD *)v145 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v87, OS_SIGNPOST_INTERVAL_END, v77, "MemoryElectionFilterAndSortSort", ", v145, 2u);
    }
    obj = v87;

    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v145 = 136315394;
      *(_QWORD *)v146 = "MemoryElectionFilterAndSortSort";
      *(_WORD *)&v146[8] = 2048;
      *(double *)&v146[10] = (float)((float)((float)((float)(v84 - v80) * (float)v85.numer) / (float)v85.denom)
                                   / 1000000.0);
      _os_log_impl(&dword_1CA237000, v87, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v145, 0x16u);
    }
    if (v140[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v145 = 67109378;
        *(_DWORD *)v146 = 407;
        *(_WORD *)&v146[4] = 2080;
        *(_QWORD *)&v146[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Memories/PGMemoryElector.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v145, 0x12u);
      }
      v88 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v88 = v83;
    }

LABEL_88:
  }
  else
  {
    v88 = (id)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v135, 8);
  _Block_object_dispose(buf, 8);

LABEL_90:
  return v88;
}

- (BOOL)_memoryContainsNegativeFeedbackPets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *loggingConnection;
  void *v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "memoryFeatureNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection subsetInCollection:](PGGraphPetNodeCollection, "subsetInCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") != 1)
    goto LABEL_8;
  v7 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v6, "localIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuidFromLocalIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "length")
    || (-[PHUserFeedbackCalculator userFeedbackTypeForPersonUUID:](self->_userFeedbackCalculator, "userFeedbackTypeForPersonUUID:", v10) & 0xFFFFFFFFFFFFFFFELL) != 2)
  {

LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)MEMORY[0x1E0CD1630];
    v13 = loggingConnection;
    objc_msgSend(v12, "stringForCategory:", objc_msgSend(v4, "memoryCategory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Not considering to elect memory of category %@ featuring pets with uuid %@", (uint8_t *)&v17, 0x16u);

  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (double)_contentScoreWeightForNewMemoryFocusWithCategory:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (a3 - 25 >= 6 && a3 != 10)
    return 0.5;
  return result;
}

- (BOOL)_shouldCheckForSuggestionCollisionsForTriggeredMemory:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v7;
  void *v8;
  uint64_t v9;
  NSObject *loggingConnection;
  uint8_t v12[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "memoryCategory");
  if (v5 > 0x13 || ((1 << v5) & 0x90002) == 0)
  {
    objc_msgSend(v4, "memoryMomentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "[PGMemoryElector] Triggered memory has only one moment but isn't of type single moment or meaningful event. Please update -[PGMemoryElector _shouldCheckForSuggestionCollisionsForTriggeredMemory:]", v12, 2u);
      }
    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)targetNumberOfMemoriesFromConfigurator:(id)a3 graph:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[PGGraphNodeCollection filter](PGGraphMemoryNodeCollection, "filter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "numberOfNodesMatchingFilter:", v10);

  v12 = objc_msgSend(v9, "targetNumberOfMemoriesWithMemoryContext:totalNumberOfMemoryNodes:referenceNumberOfDays:", v7, v11, objc_msgSend(v9, "numberOfDaysToLookInPast"));
  return v12;
}

- (id)electAndEnrichSortedTriggeredMemories:(id)a3 alreadyEnrichedMemories:(id)a4 targetNumberOfMemories:(unint64_t)a5 configuration:(id)a6 graph:(id)a7 planner:(id)a8 context:(id)a9 progressReporter:(id)a10
{
  id v16;
  PGEnrichedMemoryFactory *v17;
  void *v18;
  NSObject *loggingConnection;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OS_os_log *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  double v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  int v37;
  char v38;
  id v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32_t numer;
  uint32_t denom;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v52;
  os_signpost_id_t spid;
  unint64_t v54;
  uint64_t v55;
  id v56;
  PGGraphLocationHelper *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  PGMemoryCurationSession *v64;
  id v65;
  PGEnrichedMemoryFactory *v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  NSObject *v73;
  id v74;
  PGEnrichedMemoryFactory *v75;
  id v76;
  id v77;
  id v78;
  PGMemoryElector *v79;
  _BYTE *v80;
  uint64_t *v81;
  uint8_t *v82;
  uint8_t *v83;
  double v84;
  uint64_t v85;
  double v86;
  unint64_t v87;
  uint8_t v88[8];
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  mach_timebase_info info;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  void *v101;
  _BYTE v102[24];
  uint64_t v103;
  uint8_t buf[8];
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v60 = a3;
  v62 = a4;
  v67 = a6;
  v16 = a7;
  v65 = a8;
  v56 = a9;
  v61 = a10;
  v63 = v16;
  v57 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v16);
  v64 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:]([PGMemoryCurationSession alloc], "initWithCurationManager:photoLibrary:curationContext:locationHelper:", self->_curationManager, self->_photoLibrary, self->_curationContext, v57);
  v17 = [PGEnrichedMemoryFactory alloc];
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = -[PGEnrichedMemoryFactory initWithMemoryCurationSession:graph:serviceManager:](v17, "initWithMemoryCurationSession:graph:serviceManager:", v64, v63, v18);

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a5;
    _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[MemoryElector] targetNumberOfMemories: %d", buf, 8u);
  }
  if (!a5)
  {
    v58 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_38;
  }
  v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v21 = v62;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v98 != v23)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "keyAssetUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v20, "addObject:", v25);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
    }
    while (v22);
  }

  v55 = objc_msgSend(v67, "maximumNumberOfMemoriesWithGuestAssets");
  *(_QWORD *)buf = 0;
  v105 = buf;
  v106 = 0x2020000000;
  v107 = 0;
  v68 = v61;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = 0;
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v21);
  v27 = (void *)objc_msgSend(v60, "mutableCopy");
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPersonContext:", 1);
  objc_msgSend(v28, "setIncludedDetectionTypes:", &unk_1E84EA7F8);
  v59 = v28;
  v29 = self->_loggingConnection;
  v30 = os_signpost_id_generate((os_log_t)v29);
  v31 = v29;
  v32 = v31;
  spid = v30;
  v54 = v30 - 1;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v88 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MemoryElectionElectAndEnrich", ", v88, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v52 = mach_absolute_time();
  *(_QWORD *)v88 = 0;
  v89 = v88;
  v90 = 0x2020000000;
  v91 = 0;
  v33 = 0.0;
  v34 = MEMORY[0x1E0C81028];
  v58 = (id)MEMORY[0x1E0C9AA60];
  while (objc_msgSend(v26, "count", v52) < a5 && objc_msgSend(v27, "count") && v33 <= 1.0)
  {
    v35 = (void *)MEMORY[0x1CAA4EB2C]();
    v36 = v32;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v42 = objc_msgSend(v26, "count");
      v43 = objc_msgSend(v27, "count");
      *(_DWORD *)v102 = 134218496;
      *(_QWORD *)&v102[4] = v42;
      *(_WORD *)&v102[12] = 2048;
      *(_QWORD *)&v102[14] = v43;
      *(_WORD *)&v102[22] = 2048;
      v103 = *(_QWORD *)&v33;
      _os_log_debug_impl(&dword_1CA237000, v36, OS_LOG_TYPE_DEBUG, "electedEnrichedMemories: %lu, sortedRemainingTriggeredMemories: %lu, currentCommonalityThreshold: %.3f", v102, 0x20u);
    }

    if (*((_BYTE *)v94 + 24))
    {
      *((_BYTE *)v94 + 24) = 1;
LABEL_25:
      v38 = 1;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v102 = 67109378;
        *(_DWORD *)&v102[4] = 533;
        *(_WORD *)&v102[8] = 2080;
        *(_QWORD *)&v102[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMemoryElector.m";
        _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v102, 0x12u);
      }
      goto LABEL_28;
    }
    v37 = objc_msgSend(v68, "isCancelledWithProgress:", *((double *)v89 + 3));
    *((_BYTE *)v94 + 24) = v37;
    if (v37)
      goto LABEL_25;
    *(_QWORD *)v102 = 0;
    *(_QWORD *)&v102[8] = v102;
    *(_QWORD *)&v102[16] = 0x2020000000;
    v103 = 0x7FEFFFFFFFFFFFFFLL;
    v39 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke;
    v69[3] = &unk_1E8433DD8;
    v70 = v26;
    v40 = v39;
    v71 = v40;
    v72 = v65;
    v41 = v36;
    v84 = v33;
    v73 = v41;
    v80 = v102;
    v81 = &v93;
    v74 = v68;
    v82 = v88;
    v75 = v66;
    v76 = v67;
    v83 = buf;
    v85 = v55;
    v77 = v20;
    v78 = v59;
    v79 = self;
    v86 = 1.0 / (double)a5;
    v87 = a5;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v69);
    v33 = *(double *)(*(_QWORD *)&v102[8] + 24);
    objc_msgSend(v27, "removeObjectsAtIndexes:", v40);

    _Block_object_dispose(v102, 8);
    v38 = 0;
LABEL_28:
    objc_autoreleasePoolPop(v35);
    if ((v38 & 1) != 0)
      goto LABEL_36;
  }
  v44 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v47 = v32;
  v48 = v47;
  if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)v102 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v48, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionElectAndEnrich", ", v102, 2u);
  }

  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v102 = 136315394;
    *(_QWORD *)&v102[4] = "MemoryElectionElectAndEnrich";
    *(_WORD *)&v102[12] = 2048;
    *(double *)&v102[14] = (float)((float)((float)((float)(v44 - v52) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v102, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sortUsingDescriptors:", v50);

  v58 = v26;
LABEL_36:
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(buf, 8);

LABEL_38:
  return v58;
}

- (id)_requestedEnrichedMemoriesWithConfiguration:(id)a3 graph:(id)a4
{
  id v6;
  id v7;
  id v8;
  PGGraphLocationHelper *v9;
  PGMemoryCurationSession *v10;
  PGEnrichedMemoryFactory *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  PGGraphMemoryNodeCollection *v17;
  void *v18;
  PGGraphMemoryNodeCollection *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  PGGraphFeatureNodeCollection *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  PGMemoryContext *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PGMemoryTriggerHandler *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  NSObject *loggingConnection;
  NSObject *v59;
  int v60;
  id v61;
  id v62;
  void *v63;
  PGMemoryTriggerHandler *v64;
  PGMemoryMomentNodesWithBlockedFeatureCache *v65;
  void *v66;
  PGGraphLocationHelper *v67;
  uint64_t v68;
  id v69;
  PGMemoryCurationSession *v70;
  PGMemoryElector *v71;
  PGEnrichedMemoryFactory *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  PGEnrichedMemoryFactory *v79;
  id v80;
  _BYTE v81[128];
  void *v82;
  uint8_t buf[4];
  int v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v7);
  v10 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:]([PGMemoryCurationSession alloc], "initWithCurationManager:photoLibrary:curationContext:locationHelper:", self->_curationManager, self->_photoLibrary, self->_curationContext, v9);
  v11 = [PGEnrichedMemoryFactory alloc];
  v71 = self;
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v10;
  v72 = -[PGEnrichedMemoryFactory initWithMemoryCurationSession:graph:serviceManager:](v11, "initWithMemoryCurationSession:graph:serviceManager:", v10, v7, v12);

  v13 = objc_msgSend(v6, "requestedMemoryCategory");
  objc_msgSend(v6, "requestedUniqueMemoryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 | objc_msgSend(v14, "length");

  v16 = objc_msgSend(v6, "requestedTriggerType");
  if (!v15)
  {
LABEL_10:
    if (v16)
    {
      v67 = v9;
      v36 = v8;
      v37 = [PGMemoryContext alloc];
      objc_msgSend(v6, "localDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeZone");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[PGMemoryContext initWithLocalDate:timeZone:photoLibrary:](v37, "initWithLocalDate:timeZone:photoLibrary:", v38, v39, v71->_photoLibrary);

      v65 = -[PGMemoryMomentNodesWithBlockedFeatureCache initWithUserFeedbackCalculator:loggingConnection:]([PGMemoryMomentNodesWithBlockedFeatureCache alloc], "initWithUserFeedbackCalculator:loggingConnection:", v71->_userFeedbackCalculator, v71->_loggingConnection);
      v41 = -[PGMemoryTriggerHandler initWithWorkingContext:momentNodesWithBlockedFeatureCache:]([PGMemoryTriggerHandler alloc], "initWithWorkingContext:momentNodesWithBlockedFeatureCache:", v71->_workingContext, v65);
      v42 = objc_msgSend(v6, "requestedTriggerType");
      objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v41;
      v66 = (void *)v40;
      v69 = v7;
      -[PGMemoryTriggerHandler allTriggeredMemoriesWithContext:forTriggerType:inGraph:progressReporter:](v41, "allTriggeredMemoriesWithContext:forTriggerType:inGraph:progressReporter:", v40, v42, v7, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v45 = v44;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v47; ++i)
          {
            if (*(_QWORD *)v74 != v48)
              objc_enumerationMutation(v45);
            v50 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
            v51 = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGEnrichedMemoryFactory enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:](v72, "enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:", v50, v6, v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            if (v53)
              objc_msgSend(v36, "addObject:", v53);

            objc_autoreleasePoolPop(v51);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        }
        while (v47);
      }

      v8 = v36;
      v9 = v67;
      v7 = v69;
    }
    if (objc_msgSend(v6, "shouldPersist"))
    {
      v54 = objc_msgSend(v6, "pendingState");
      objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGMemoryElector persistEnrichedMemories:pendingState:graph:progressReporter:](v71, "persistEnrichedMemories:pendingState:graph:progressReporter:", v8, v54, v7, v55);

    }
    v56 = v8;
    goto LABEL_24;
  }
  v17 = -[MAElementCollection initWithGraph:]([PGGraphMemoryNodeCollection alloc], "initWithGraph:", v7);
  if (!v13)
  {
LABEL_7:
    objc_msgSend(v6, "requestedUniqueMemoryIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      objc_msgSend(v6, "requestedUniqueMemoryIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v31 = v6;
      v32 = v8;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesWithUniqueIdentifierArray:inGraph:", v33, v7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAElementCollection collectionByFormingUnionWith:](v17, "collectionByFormingUnionWith:", v34);
      v35 = objc_claimAutoreleasedReturnValue();

      v8 = v32;
      v6 = v31;

      v17 = (PGGraphMemoryNodeCollection *)v35;
    }
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __69__PGMemoryElector__requestedEnrichedMemoriesWithConfiguration_graph___block_invoke;
    v77[3] = &unk_1E8433E00;
    v78 = v6;
    v79 = v72;
    v80 = v8;
    -[MANodeCollection enumerateNodesUsingBlock:](v17, "enumerateNodesUsingBlock:", v77);

    goto LABEL_10;
  }
  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", objc_msgSend(v6, "requestedMemoryCategory"), v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection collectionByFormingUnionWith:](v17, "collectionByFormingUnionWith:", v18);
  v19 = (PGGraphMemoryNodeCollection *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requestedFeature");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
  {
LABEL_6:

    v17 = v19;
    goto LABEL_7;
  }
  objc_msgSend(v20, "nodeInGraph:", v7);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = -[MANodeCollection initWithNode:]([PGGraphFeatureNodeCollection alloc], "initWithNode:", v22);
    -[PGGraphFeatureNodeCollection memoryNodes](v24, "memoryNodes");
    v25 = v6;
    v26 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAElementCollection collectionByIntersecting:](v19, "collectionByIntersecting:", v27);
    v68 = objc_claimAutoreleasedReturnValue();

    v8 = v26;
    v6 = v25;

    v19 = (PGGraphMemoryNodeCollection *)v68;
    goto LABEL_6;
  }
  loggingConnection = v71->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    v59 = loggingConnection;
    v60 = objc_msgSend(v21, "type");
    objc_msgSend(v21, "name");
    v61 = v6;
    v62 = v8;
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v84 = v60;
    v85 = 2112;
    v86 = v63;
    _os_log_error_impl(&dword_1CA237000, v59, OS_LOG_TYPE_ERROR, "[PGMemoryElector] Error fetching graph node for feature of type %d, name %@", buf, 0x12u);

    v8 = v62;
    v6 = v61;

  }
  v56 = (id)MEMORY[0x1E0C9AA60];
LABEL_24:

  return v56;
}

- (void)persistEnrichedMemories:(id)a3 pendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  PGMemoryPhotoKitPersister *v13;
  void *v14;
  id v15;
  NSObject *loggingConnection;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v7 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[PGMemoryPhotoKitPersister initWithPhotoLibrary:]([PGMemoryPhotoKitPersister alloc], "initWithPhotoLibrary:", self->_photoLibrary);
  v17 = 0;
  -[PGMemoryPhotoKitPersister memoryLocalIdentifiersFromPersistingEnrichedMemories:withPendingState:graph:progressReporter:error:](v13, "memoryLocalIdentifiersFromPersistingEnrichedMemories:withPendingState:graph:progressReporter:error:", v12, v7, v11, v10, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  if (!v14)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryElector] error persisting enriched memories %@", buf, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConfiguration, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __69__PGMemoryElector__requestedEnrichedMemoriesWithConfiguration_graph___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PGTriggeredMemory *v4;
  void *v5;
  PGTriggeredMemory *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  v4 = [PGTriggeredMemory alloc];
  objc_msgSend(*(id *)(a1 + 32), "localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGTriggeredMemory initWithMemoryNode:validityIntervalByTriggerType:creationDate:](v4, "initWithMemoryNode:validityIntervalByTriggerType:creationDate:", v11, MEMORY[0x1E0C9AA70], v5);

  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

  objc_autoreleasePoolPop(v3);
}

void __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  unint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  double v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  mach_timebase_info v47;
  NSObject *v48;
  NSObject *v49;
  const char *v50;
  NSObject *v51;
  NSObject *v52;
  char *v53;
  double v54;
  os_signpost_id_t spid;
  uint64_t v56;
  int v57;
  _BYTE *v58;
  void *v59;
  void *v60;
  mach_timebase_info info;
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  double v73;
  __int16 v74;
  unint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (void *)MEMORY[0x1CAA4EB2C]();
  if (!+[PGMemoryPlanner canElectTriggeredMemory:withAlreadyElectedMemories:](PGMemoryPlanner, "canElectTriggeredMemory:withAlreadyElectedMemories:", v7, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
    goto LABEL_48;
  }
  v58 = a4;
  v60 = v8;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v9 = *(id *)(a1 + 32);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v67;
    v13 = 1.79769313e308;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "commonalityScoreComparingMemory:toAlreadyElectedMemory:", v7, v15);
        v17 = v16;
        v18 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = *(double *)(a1 + 144);
          v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
          *(_DWORD *)buf = 134218496;
          v71 = *(const char **)&v17;
          v72 = 2048;
          v73 = v19;
          v74 = 2048;
          v75 = v20;
          _os_log_debug_impl(&dword_1CA237000, v18, OS_LOG_TYPE_DEBUG, "commonalityScore: %.3f, currentCommonalityThreshold: %.3f, lowestCommonality: %.3f", buf, 0x20u);
        }
        if (v17 > *(double *)(a1 + 144))
        {
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = fmin(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112)+ 8)+ 24), v17);
          v21 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v52 = v21;
            objc_msgSend(v7, "uniqueMemoryIdentifier");
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "uniqueMemoryIdentifier");
            v54 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 138412546;
            v71 = v53;
            v72 = 2112;
            v73 = v54;
            _os_log_debug_impl(&dword_1CA237000, v52, OS_LOG_TYPE_DEBUG, "tooMuchOverlapWithElectedMemory: %@ - %@", buf, 0x16u);

          }
          goto LABEL_47;
        }
        v13 = fmin(v13, v17);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v13 = 1.79769313e308;
  }

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = fmin(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8)+ 24), v13);
  v22 = (void *)MEMORY[0x1E0D42A58];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke_182;
  v62[3] = &unk_1E8433DB0;
  v64 = *(_QWORD *)(a1 + 120);
  v23 = *(id *)(a1 + 64);
  v24 = *(_QWORD *)(a1 + 128);
  v63 = v23;
  v65 = v24;
  objc_msgSend(v22, "progressReporterWithProgressBlock:", v62);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 72), "enrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:", v7, *(_QWORD *)(a1 + 80), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  if (v26)
  {
    v27 = objc_msgSend(v26, "featuresGuestAssets");
    if (!v27
      || (v28 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24),
          v29 = *(_QWORD *)(a1 + 152),
          *(_QWORD *)&v28 < v29))
    {
      objc_msgSend(v26, "keyAssetUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        if (objc_msgSend(*(id *)(a1 + 88), "containsObject:", v30))
        {
          v31 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v71 = (const char *)v26;
            _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Discarding %@: key asset already used.", buf, 0xCu);
          }
LABEL_45:

          goto LABEL_46;
        }
        objc_msgSend(*(id *)(a1 + 88), "addObject:", v30);
      }
      v57 = v27;
      v59 = v30;
      v33 = *(id *)(a1 + 56);
      v34 = os_signpost_id_generate(v33);
      v35 = v33;
      v36 = v35;
      v37 = v34 - 1;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MemoryElectionUserFeedback", ", buf, 2u);
      }
      spid = v34;

      info = 0;
      mach_timebase_info(&info);
      v56 = mach_absolute_time();
      v38 = (void *)MEMORY[0x1E0CD16C0];
      objc_msgSend(v26, "curatedAssetUUIDs");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v39, *(_QWORD *)(a1 + 96));
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = *(void **)(*(_QWORD *)(a1 + 104) + 40);
      objc_msgSend(v40, "allKeys");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "keyAssetUUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "scoreForAssetUUIDs:keyAssetUUID:personsUUIDsByAssetUUIDs:memoryFeatures:", v42, v43, v40, 0);
      v45 = v44;

      v46 = mach_absolute_time();
      v47 = info;
      v48 = v36;
      v49 = v48;
      if (v37 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v49, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionUserFeedback", ", buf, 2u);
      }

      v30 = v59;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "MemoryElectionUserFeedback";
        v72 = 2048;
        v73 = (float)((float)((float)((float)(v46 - v56) * (float)v47.numer) / (float)v47.denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if ((objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v45, *MEMORY[0x1E0CD1E70], spid) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v26);
        if (v57)
        {
          v50 = (const char *)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);
          if (v50 == *(const char **)(a1 + 152))
          {
            v51 = *(NSObject **)(a1 + 56);
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v71 = v50;
              _os_log_impl(&dword_1CA237000, v51, OS_LOG_TYPE_DEFAULT, "[PGMemoryElector] Reached maximumNumberOfMemoriesWithGuestAssets %lu: mutating configuration to disallow guest asset.", buf, 0xCu);
            }
            objc_msgSend(*(id *)(a1 + 80), "setAllowGuestAsset:", 0);
          }
        }
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 160)
                                                                     + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128)
                                                                                             + 8)
                                                                                 + 24);
        if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(a1 + 168))
          *v58 = 1;
      }

      goto LABEL_45;
    }
    v32 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v71 = (const char *)v26;
      v72 = 2048;
      v73 = v28;
      v74 = 2048;
      v75 = v29;
      _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "[PGMemoryElector] Discarding %@: maximumNumberOfMemoriesWithGuestAssets %lu is at the limit %lu.", buf, 0x20u);
    }
  }
LABEL_46:

LABEL_47:
  v8 = v60;
LABEL_48:
  objc_autoreleasePoolPop(v8);

}

uint64_t __157__PGMemoryElector_electAndEnrichSortedTriggeredMemories_alreadyEnrichedMemories_targetNumberOfMemories_configuration_graph_planner_context_progressReporter___block_invoke_182(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

uint64_t __101__PGMemoryElector_filterAndSortTriggeredMemories_withPlanner_context_configuration_progressReporter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;

  v5 = a2;
  v6 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 104)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                          + 24);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  if (v11 > 0.9 && v14 <= 0.9)
    goto LABEL_10;
  if (v14 > 0.9 && v11 <= 0.9)
    goto LABEL_15;
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v17 >= 1.0 && v20 < v17)
    goto LABEL_10;
  if (v20 >= 1.0 && v17 < v20)
    goto LABEL_15;
  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "doubleValue");
  v27 = v26;

  if (v24 == 1.0 && v27 < 1.0)
  {
LABEL_15:
    v21 = -1;
    goto LABEL_16;
  }
  if (v27 == 1.0 && v24 < 1.0)
    goto LABEL_10;
  if (v24 != 0.0 && v27 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "unsignedIntegerValue");

    objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedIntegerValue");

    if (v30 > v32)
      goto LABEL_10;
    if (v32 > v30)
      goto LABEL_15;
  }
  if (v17 == 0.0 && v20 > 0.25)
    goto LABEL_15;
  if (v20 == 0.0 && v17 > 0.25)
    goto LABEL_10;
  if (v24 != 0.0 || v27 != 0.0)
  {
    if (v24 > v27)
      goto LABEL_15;
    if (v27 > v24)
      goto LABEL_10;
  }
  if (objc_msgSend(v5, "generatedWithFallbackRequirements")
    && !objc_msgSend(v6, "generatedWithFallbackRequirements"))
  {
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "generatedWithFallbackRequirements") & 1) == 0
    && (objc_msgSend(v6, "generatedWithFallbackRequirements") & 1) != 0)
  {
    goto LABEL_15;
  }
  if (objc_msgSend(v5, "memoryCategory") == 9 && objc_msgSend(v6, "memoryCategory") != 9)
  {
LABEL_10:
    v21 = 1;
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "memoryCategory") != 9 && objc_msgSend(v6, "memoryCategory") == 9)
    goto LABEL_15;
  v33 = objc_msgSend((id)objc_opt_class(), "compareMemoryCategoryForMemory:toOtherMemory:", v5, v6);
  v34 = -1;
  if (v17 >= v20)
    v34 = 1;
  if (v33)
    v21 = v33;
  else
    v21 = v34;
  if (!v33 && v17 >= v20 && v20 >= v17)
  {
    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v37 = v36;

    objc_msgSend(*(id *)(a1 + 80), "objectForKey:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    if (v37 <= v40)
    {
      if (v40 <= v37)
      {
        objc_msgSend(v5, "uniqueMemoryIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueMemoryIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v41, "compare:", v42);

        goto LABEL_16;
      }
      goto LABEL_10;
    }
    goto LABEL_15;
  }
LABEL_16:

  return v21;
}

+ (int64_t)compareMemoryCategoryForMemory:(id)a3 toOtherMemory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int64_t v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "triggerTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "containsIndex:", 5) & 1) != 0)
  {
    objc_msgSend(v6, "triggerTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsIndex:", 5);

    if (v9)
    {
      if (objc_msgSend(v5, "memoryCategory") == 8 && objc_msgSend(v6, "memoryCategory") != 8)
        goto LABEL_27;
      if (objc_msgSend(v5, "memoryCategory") != 8 && objc_msgSend(v6, "memoryCategory") == 8)
        goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "triggerTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsIndex:", 4) & 1) != 0)
  {
    objc_msgSend(v6, "triggerTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsIndex:", 4);

    if (v12)
    {
      if (objc_msgSend(v5, "memoryCategory") == 23 && objc_msgSend(v6, "memoryCategory") == 1)
        goto LABEL_27;
      if (objc_msgSend(v5, "memoryCategory") == 1 && objc_msgSend(v6, "memoryCategory") == 23)
        goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "triggerTypes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsIndex:", 1) & 1) == 0)
  {

    goto LABEL_23;
  }
  objc_msgSend(v6, "triggerTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsIndex:", 1);

  if (!v15)
  {
LABEL_23:
    v16 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v5, "memoryCategory") != 16 || objc_msgSend(v6, "memoryCategory") != 17)
  {
    if (objc_msgSend(v5, "memoryCategory") == 17 && objc_msgSend(v6, "memoryCategory") == 16)
    {
LABEL_27:
      v16 = -1;
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_21:
  v16 = 1;
LABEL_24:

  return v16;
}

@end
