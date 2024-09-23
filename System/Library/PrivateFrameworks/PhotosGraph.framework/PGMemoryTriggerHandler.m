@implementation PGMemoryTriggerHandler

- (PGMemoryTriggerHandler)initWithWorkingContext:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4
{
  id v6;
  id v7;
  PGMemoryTriggerHandler *v8;
  os_log_t v9;
  OS_os_log *loggingConnection;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  id v13;
  void *v14;
  uint64_t v15;
  CLSHolidayCalendarEventService *holidayService;
  PGMemoryTriggerUpcomingCalendarEvent *v17;
  PGMemoryTriggerUpcomingCalendarEvent *v18;
  PGMemoryTriggerLastWeekend *v19;
  PGMemoryTriggerLastWeek *v20;
  PGMemoryTriggerRecentBreakoutOfRoutine *v21;
  PGMemoryTriggerUpcomingPersonCentricHoliday *v22;
  PGMemoryTriggerUpcomingBirthday *v23;
  PGMemoryTriggerUpcomingAnniversary *v24;
  PGMemoryTriggerRecentTrendsMoment *v25;
  uint64_t v26;
  NSArray *allMemoryTriggers;
  void *v29;
  void *v30;
  PGMemoryTriggerRecentMeaningfulEvent *v31;
  PGMemoryTriggerRecentSyndicatedAssets *v32;
  PGMemoryTriggerUpcomingHoliday *v33;
  PGMemoryTriggerRecentHighlights *v34;
  PGMemoryTriggerPersonAnniversary *v35;
  PGMemoryTriggerRecentTrip *v36;
  PGMemoryTriggerRecentMomentWithSocialGroup *v37;
  PGMemoryTriggerRecentHolidayCelebration *v38;
  PGMemoryTriggerThrowbackWeekInHistory *v39;
  PGMemoryTriggerRecentMomentWithPerson *v40;
  PGMemoryTriggerSeasonInHistory *v41;
  PGMemoryTriggerBeginningOfSeason *v42;
  PGMemoryTriggerBeginningOfMonth *v43;
  PGMemoryTriggerEndOfYear *v44;
  PGMemoryTriggerSameDayInHistory *v45;
  PGMemoryTriggerFeatureCentricHoliday *v46;
  PGMemoryTriggerPersonBirthday *v47;
  PGMemoryTriggerHoliday *v48;
  id v49;
  objc_super v50;
  _QWORD v51[28];

  v51[26] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PGMemoryTriggerHandler;
  v8 = -[PGMemoryTriggerHandler init](&v50, sel_init);
  if (v8)
  {
    v9 = os_log_create("com.apple.PhotosGraph", "MemoryTriggerHandler");
    loggingConnection = v8->_loggingConnection;
    v8->_loggingConnection = (OS_os_log *)v9;

    objc_msgSend(v6, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v11;

    v13 = objc_alloc(MEMORY[0x1E0D4B180]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithLocale:", v14);
    holidayService = v8->_holidayService;
    v8->_holidayService = (CLSHolidayCalendarEventService *)v15;

    v48 = -[PGHolidayMemoryTrigger initWithLoggingConnection:holidayService:]([PGMemoryTriggerHoliday alloc], "initWithLoggingConnection:holidayService:", v8->_loggingConnection, v8->_holidayService);
    v51[0] = v48;
    v47 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerPersonBirthday alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[1] = v47;
    v46 = -[PGHolidayMemoryTrigger initWithLoggingConnection:holidayService:]([PGMemoryTriggerFeatureCentricHoliday alloc], "initWithLoggingConnection:holidayService:", v8->_loggingConnection, v8->_holidayService);
    v51[2] = v46;
    v45 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerSameDayInHistory alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[3] = v45;
    v44 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerEndOfYear alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[4] = v44;
    v43 = -[PGMemoryTriggerBeginningOfMonth initWithLoggingConnection:momentNodesWithBlockedFeatureCache:]([PGMemoryTriggerBeginningOfMonth alloc], "initWithLoggingConnection:momentNodesWithBlockedFeatureCache:", v8->_loggingConnection, v7);
    v51[5] = v43;
    v42 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerBeginningOfSeason alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[6] = v42;
    v41 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerSeasonInHistory alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[7] = v41;
    v40 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentMomentWithPerson alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[8] = v40;
    v39 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerThrowbackWeekInHistory alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[9] = v39;
    v38 = -[PGHolidayMemoryTrigger initWithLoggingConnection:holidayService:]([PGMemoryTriggerRecentHolidayCelebration alloc], "initWithLoggingConnection:holidayService:", v8->_loggingConnection, v8->_holidayService);
    v51[10] = v38;
    v37 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentMomentWithSocialGroup alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[11] = v37;
    v36 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentTrip alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[12] = v36;
    v35 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerPersonAnniversary alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[13] = v35;
    v34 = -[PGMemoryTriggerRecentHighlights initWithLoggingConnection:momentNodesWithBlockedFeatureCache:]([PGMemoryTriggerRecentHighlights alloc], "initWithLoggingConnection:momentNodesWithBlockedFeatureCache:", v8->_loggingConnection, v7);
    v51[14] = v34;
    v33 = -[PGMemoryTriggerUpcomingHoliday initWithLoggingConnection:holidayService:]([PGMemoryTriggerUpcomingHoliday alloc], "initWithLoggingConnection:holidayService:", v8->_loggingConnection, v8->_holidayService);
    v51[15] = v33;
    v32 = -[PGMemoryTriggerRecentSyndicatedAssets initWithLoggingConnection:photoLibrary:momentNodesWithBlockedFeatureCache:]([PGMemoryTriggerRecentSyndicatedAssets alloc], "initWithLoggingConnection:photoLibrary:momentNodesWithBlockedFeatureCache:", v8->_loggingConnection, v8->_photoLibrary, v7);
    v51[16] = v32;
    v31 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentMeaningfulEvent alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[17] = v31;
    v17 = [PGMemoryTriggerUpcomingCalendarEvent alloc];
    objc_msgSend(v6, "serviceManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PGMemoryTriggerUpcomingCalendarEvent initWithServiceManager:locationCache:loggingConnection:](v17, "initWithServiceManager:locationCache:loggingConnection:", v30, v29, v8->_loggingConnection);
    v51[18] = v18;
    v19 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerLastWeekend alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[19] = v19;
    v20 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerLastWeek alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[20] = v20;
    v49 = v6;
    v21 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentBreakoutOfRoutine alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[21] = v21;
    v22 = -[PGHolidayMemoryTrigger initWithLoggingConnection:holidayService:]([PGMemoryTriggerUpcomingPersonCentricHoliday alloc], "initWithLoggingConnection:holidayService:", v8->_loggingConnection, v8->_holidayService);
    v51[22] = v22;
    v23 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerUpcomingBirthday alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[23] = v23;
    v24 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerUpcomingAnniversary alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[24] = v24;
    v25 = -[PGMemoryTrigger initWithLoggingConnection:]([PGMemoryTriggerRecentTrendsMoment alloc], "initWithLoggingConnection:", v8->_loggingConnection);
    v51[25] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 26);
    v26 = objc_claimAutoreleasedReturnValue();
    allMemoryTriggers = v8->_allMemoryTriggers;
    v8->_allMemoryTriggers = (NSArray *)v26;

    v6 = v49;
  }

  return v8;
}

- (id)allTriggeredMemoriesWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  return -[PGMemoryTriggerHandler allTriggeredMemoriesWithContext:forTriggerType:inGraph:progressReporter:](self, "allTriggeredMemoriesWithContext:forTriggerType:inGraph:progressReporter:", a3, 0, a4, a5);
}

- (id)allTriggeredMemoriesWithContext:(id)a3 forTriggerType:(unint64_t)a4 inGraph:(id)a5 progressReporter:(id)a6
{
  id v10;
  NSUInteger v11;
  NSObject *loggingConnection;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint32_t numer;
  uint32_t denom;
  NSObject *v37;
  NSObject *v38;
  objc_class *v39;
  char *v40;
  NSObject *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  double v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  uint32_t v64;
  uint32_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  void *v69;
  id v70;
  os_signpost_id_t spid;
  uint64_t v73;
  unint64_t v74;
  NSObject *v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  PGMemoryTriggerHandler *v80;
  id v81;
  id v82;
  NSArray *obj;
  NSObject *v84;
  uint64_t v85;
  void *context;
  void *v87;
  id v88;
  uint64_t v89;
  id v90;
  _QWORD v91[4];
  id v92;
  NSArray *v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  mach_timebase_info v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  mach_timebase_info info;
  uint8_t v105[128];
  uint8_t buf[4];
  const char *v107;
  __int16 v108;
  double v109;
  __int16 v110;
  double v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v81 = a5;
  v82 = a6;
  v11 = -[NSArray count](self->_allMemoryTriggers, "count");
  v80 = self;
  loggingConnection = self->_loggingConnection;
  if (v11)
  {
    v13 = loggingConnection;
    v14 = os_signpost_id_generate(v13);
    v15 = v13;
    v16 = v15;
    v74 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MemoryElectionAllTrigeredMemories", ", buf, 2u);
    }
    spid = v14;
    v75 = v16;

    info = 0;
    mach_timebase_info(&info);
    v73 = mach_absolute_time();
    v90 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v88 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = -[NSArray count](v80->_allMemoryTriggers, "count");
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v82);
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v80->_allMemoryTriggers;
    v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
    v78 = v18;
    if (v19)
    {
      v20 = v19;
      v21 = 1.0 / (double)v17;
      v22 = *(_QWORD *)v101;
      v23 = 0.0;
      v76 = *(_QWORD *)v101;
      v77 = a4;
      while (2)
      {
        v24 = 0;
        v79 = v20;
        do
        {
          if (*(_QWORD *)v101 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v24);
          v26 = (void *)MEMORY[0x1CAA4EB2C]();
          v23 = fmin(v21 + v23, 1.0);
          objc_msgSend(v18, "childProgressReporterToCheckpoint:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v25, "triggerType");
          if ((!a4 || v89 == a4)
            && (!objc_msgSend(v10, "futureLookup")
             || objc_msgSend(v25, "supportsFutureLookup")))
          {
            context = v26;
            v87 = v27;
            v85 = v24;
            v28 = v80->_loggingConnection;
            v29 = os_signpost_id_generate(v28);
            v30 = v28;
            v31 = v30;
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MemoryElectionTrigger", ", buf, 2u);
            }

            v99 = 0;
            mach_timebase_info(&v99);
            v32 = mach_absolute_time();
            objc_msgSend(v25, "resultsTriggeredWithContext:inGraph:progressReporter:", v10, v81, v87);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v82, "isCancelled") & 1) != 0)
            {

              objc_autoreleasePoolPop(context);
              v70 = (id)MEMORY[0x1E0C9AA60];
              v66 = v75;
              goto LABEL_47;
            }
            v34 = mach_absolute_time();
            numer = v99.numer;
            denom = v99.denom;
            v37 = v31;
            v38 = v37;
            if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
            {
              v39 = (objc_class *)objc_opt_class();
              NSStringFromClass(v39);
              v40 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v107 = v40;
              _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_END, v29, "MemoryElectionTrigger", "%@", buf, 0xCu);

            }
            v41 = v38;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = (void *)MEMORY[0x1E0CB3940];
              v43 = (objc_class *)objc_opt_class();
              NSStringFromClass(v43);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithFormat:", CFSTR("%@"), v44);
              v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 136315650;
              v107 = "MemoryElectionTrigger";
              v108 = 2112;
              v109 = v45;
              v110 = 2048;
              v111 = (float)((float)((float)((float)(v34 - v32) * (float)numer) / (float)denom) / 1000000.0);
              _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

            }
            v84 = v41;

            v97 = 0u;
            v98 = 0u;
            v95 = 0u;
            v96 = 0u;
            v46 = v33;
            v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v96;
              do
              {
                for (i = 0; i != v48; ++i)
                {
                  if (*(_QWORD *)v96 != v49)
                    objc_enumerationMutation(v46);
                  v51 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
                  objc_msgSend(v51, "memoryNode");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "categoriesDeniedForContextual");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v54 = objc_msgSend(v53, "containsIndex:", objc_msgSend(v52, "memoryCategory"));

                  if ((v54 & 1) == 0)
                  {
                    v55 = v10;
                    objc_msgSend(v52, "uniqueMemoryIdentifier");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "objectForKeyedSubscript:", v56);
                    v57 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v57)
                    {
                      v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                      objc_msgSend(v90, "setObject:forKeyedSubscript:", v57, v56);
                    }
                    objc_msgSend(v51, "validityInterval");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v89);
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, v59);

                    objc_msgSend(v88, "setObject:forKeyedSubscript:", v52, v56);
                    v10 = v55;
                  }

                }
                v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v95, v105, 16);
              }
              while (v48);
            }

            a4 = v77;
            v18 = v78;
            v20 = v79;
            v22 = v76;
            v24 = v85;
            v26 = context;
            v27 = v87;
          }

          objc_autoreleasePoolPop(v26);
          ++v24;
        }
        while (v24 != v20);
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
        if (v20)
          continue;
        break;
      }
    }

    objc_msgSend((id)objc_opt_class(), "creationDateWithContext:", v10);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __98__PGMemoryTriggerHandler_allTriggeredMemoriesWithContext_forTriggerType_inGraph_progressReporter___block_invoke;
    v91[3] = &unk_1E8430348;
    v92 = v88;
    obj = v60;
    v93 = obj;
    v62 = v61;
    v94 = v62;
    objc_msgSend(v90, "enumerateKeysAndObjectsUsingBlock:", v91);
    v63 = mach_absolute_time();
    v64 = info.numer;
    v65 = info.denom;
    v66 = v75;
    v67 = v75;
    v68 = v67;
    if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v68, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionAllTrigeredMemories", ", buf, 2u);
    }

    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v107 = "MemoryElectionAllTrigeredMemories";
      v108 = 2048;
      v109 = (float)((float)((float)((float)(v63 - v73) * (float)v64) / (float)v65) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v68, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v69 = v94;
    v70 = v62;

    v18 = v78;
LABEL_47:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMemoryTriggerHandler] No memory triggers initialized.", buf, 2u);
    }
    v70 = (id)MEMORY[0x1E0C9AA60];
  }

  return v70;
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3 forTriggerType:(unint64_t)a4
{
  id v6;
  PGGraphFeatureNodeCollection *v7;
  void *v8;
  PGGraphFeatureNodeCollection *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [PGGraphFeatureNodeCollection alloc];
  objc_msgSend(v6, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAElementCollection initWithGraph:](v7, "initWithGraph:", v8);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = self->_allMemoryTriggers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v15, "triggerType", (_QWORD)v18) == a4)
        {
          objc_msgSend(v15, "relevantFeatureNodesInFeatureNodes:", v6);
          v16 = objc_claimAutoreleasedReturnValue();

          v9 = (PGGraphFeatureNodeCollection *)v16;
          goto LABEL_11;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v9;
}

- (id)futureMemoriesForConfiguration:(id)a3 withGraph:(id)a4 progressReporter:(id)a5
{
  id v7;
  void *v8;
  double v9;
  uint64_t v10;
  OS_os_log *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint32_t numer;
  uint32_t denom;
  NSObject *v30;
  NSObject *v31;
  os_signpost_id_t spid;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *context;
  void *v44;
  void *v46;
  PGMemoryContext *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _BYTE *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  mach_timebase_info info;
  _BYTE buf[24];
  char v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v41 = a4;
  v37 = v7;
  v38 = a5;
  objc_msgSend(v7, "futureMemoryCollisionUniversalDateInterval");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "startDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "endDate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v49;
  objc_msgSend(v49, "timeIntervalSinceDate:", v42);
  v10 = (uint64_t)(v9 / 86400.0);
  if (v10 < 1)
  {
    v50 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v11 = self->_loggingConnection;
    v12 = os_signpost_id_generate((os_log_t)v11);
    v13 = v11;
    v14 = v13;
    v36 = v12 - 1;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "MemoryElectionFutureMemories", ", buf, 2u);
    }
    spid = v12;
    v35 = v14;

    info = 0;
    mach_timebase_info(&info);
    v34 = mach_absolute_time();
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v38);
    objc_msgSend(v37, "timeZone");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (objc_msgSend(v49, "compare:", v42) == -1)
    {
      v8 = v49;
    }
    else
    {
      v16 = 1.0 / (double)((v10 & (unint64_t)~(v10 >> 63)) + 1);
      do
      {
        context = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v49, v44);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = -[PGMemoryContext initWithFutureLocalDate:timeZone:photoLibrary:]([PGMemoryContext alloc], "initWithFutureLocalDate:timeZone:photoLibrary:", v48, v44, self->_photoLibrary);
        objc_msgSend(v40, "childProgressReporterToCheckpoint:", v16);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGMemoryTriggerHandler allTriggeredMemoriesWithContext:inGraph:progressReporter:](self, "allTriggeredMemoriesWithContext:inGraph:progressReporter:", v47, v41, v46);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v56 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
              v23 = (void *)MEMORY[0x1CAA4EB2C]();
              objc_msgSend(v22, "uniqueMemoryIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v61 = 1;
              objc_msgSend(v22, "triggerTypes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __84__PGMemoryTriggerHandler_futureMemoriesForConfiguration_withGraph_progressReporter___block_invoke;
              v51[3] = &unk_1E842D1C0;
              v52 = v15;
              v26 = v24;
              v53 = v26;
              v54 = buf;
              objc_msgSend(v25, "enumerateIndexesUsingBlock:", v51);

              if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                objc_msgSend(v50, "addObject:", v22);

              _Block_object_dispose(buf, 8);
              objc_autoreleasePoolPop(v23);
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
          }
          while (v19);
        }

        objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v49);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(context);
        v16 = 1.0 / (double)((v10 & (unint64_t)~(v10 >> 63)) + 1) + v16;
        v49 = v8;
      }
      while (objc_msgSend(v8, "compare:", v42) != -1);
    }
    v27 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v30 = v35;
    v31 = v30;
    if (v36 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, spid, "MemoryElectionFutureMemories", ", buf, 2u);
    }

    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "MemoryElectionFutureMemories";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v27 - v34) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  return v50;
}

- (CLSHolidayCalendarEventService)holidayService
{
  return self->_holidayService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_allMemoryTriggers, 0);
}

void __84__PGMemoryTriggerHandler_futureMemoriesForConfiguration_withGraph_progressReporter___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v9, "containsObject:", a1[5]))
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    else
      objc_msgSend(v9, "addObject:", a1[5]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", a1[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

void __98__PGMemoryTriggerHandler_allTriggeredMemoriesWithContext_forTriggerType_inGraph_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  PGTriggeredMemory *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[PGTriggeredMemory initWithMemoryNode:validityIntervalByTriggerType:creationDate:]([PGTriggeredMemory alloc], "initWithMemoryNode:validityIntervalByTriggerType:creationDate:", v8, v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
}

+ (id)fallbackTriggeredMemoriesWithContext:(id)a3 excludingTriggeredMemories:(id)a4 inGraph:(id)a5 holidayService:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31 = a6;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMemoryNodeCollection, "nodesInGraph:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v11;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "uniqueMemoryIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifiers:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesWithUniqueIdentifiers:inGraph:", v14, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectionBySubtracting:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "memoryNodesAllowedToBeFallbackFromMemoryNodes:withContext:inGraph:holidayService:", v22, v10, v12, v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "creationDateWithContext:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __113__PGMemoryTriggerHandler_fallbackTriggeredMemoriesWithContext_excludingTriggeredMemories_inGraph_holidayService___block_invoke;
  v32[3] = &unk_1E842D170;
  v33 = v24;
  v26 = v25;
  v34 = v26;
  v27 = v24;
  objc_msgSend(v23, "enumerateNodesUsingBlock:", v32);
  v28 = v34;
  v29 = v26;

  return v29;
}

+ (id)memoryNodesAllowedToBeFallbackFromMemoryNodes:(id)a3 withContext:(id)a4 inGraph:(id)a5 holidayService:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
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
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;

  v10 = a4;
  v11 = a5;
  v67 = a6;
  v12 = a3;
  objc_msgSend(v10, "categoriesDeniedForFallback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNodeCollection memoryNodesOfCategories:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategories:inGraph:", v13, v11);
  v14 = objc_claimAutoreleasedReturnValue();

  v71 = (void *)v14;
  objc_msgSend(v12, "collectionBySubtracting:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v10, "localDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphYearNodeCollection yearNodesForYear:inGraph:](PGGraphYearNodeCollection, "yearNodesForYear:inGraph:", objc_msgSend(v16, "yearFromDate:", v17), v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = v18;
  objc_msgSend(v18, "featureNodeCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "memoryNodes");
  v20 = objc_claimAutoreleasedReturnValue();

  v69 = (void *)v20;
  objc_msgSend(v15, "collectionBySubtracting:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v10, "localDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "seasonNameForLocalDate:locale:", v23, 0);
  v24 = objc_claimAutoreleasedReturnValue();

  +[PGGraphNodeCollection nodesInGraph:](PGGraphSeasonNodeCollection, "nodesInGraph:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)v24;
  if (v24)
  {
    +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:inGraph:](PGGraphSeasonNodeCollection, "seasonNodesForSeasonName:inGraph:", v24, v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "collectionBySubtracting:", v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v27;
  }
  v60 = v25;
  objc_msgSend(v25, "featureNodeCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "memoryNodes");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "collectionBySubtracting:", v65);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "personMemoryNodesFeaturingMeNodeInGraph:", v11);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "collectionBySubtracting:", v64);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 17, v11);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphHolidayNodeCollection, "nodesInGraph:", v11);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "featureNodeCollection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "memoryNodes");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "collectionByIntersecting:", v63);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "collectionBySubtracting:", v62);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphFeatureNodeCollection memoryOfFeature](PGGraphFeatureNodeCollection, "memoryOfFeature");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "adjacencyWithSources:relation:targetsClass:", v61, v34, objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v35, "sources");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "holidayNames");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v10, "localDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZone");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "universalDateFromLocalDate:inTimeZone:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "dateByAddingTimeInterval:", -5259600.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "dateByAddingTimeInterval:", 5259600.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v10, "timeZone");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localDateFromUniversalDate:inTimeZone:", v57, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(v10, "timeZone");
  v58 = v10;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localDateFromUniversalDate:inTimeZone:", v41, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __107__PGMemoryTriggerHandler_memoryNodesAllowedToBeFallbackFromMemoryNodes_withContext_inGraph_holidayService___block_invoke;
  v72[3] = &unk_1E842D198;
  v73 = v48;
  v49 = v48;
  objc_msgSend(v67, "enumerateEventRulesForAllCountriesWithNames:betweenLocalDate:andLocalDate:usingBlock:", v56, v44, v47, v72);

  +[PGGraphHolidayNodeCollection holidayNodesWithNames:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithNames:inGraph:", v49, v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v11;
  v51 = v35;
  objc_msgSend(v35, "subtractingSourcesWith:", v50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "targets");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "collectionBySubtracting:", v53);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  return v55;
}

+ (id)personMemoryNodesFeaturingMeNodeInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", 3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "featureNodeCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memoryNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "collectionByIntersecting:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)creationDateWithContext:(id)a3
{
  id v3;
  PGMemoryDate *v4;
  void *v5;
  PGMemoryDate *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [PGMemoryDate alloc];
  objc_msgSend(v3, "localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGMemoryDate initWithLocalDate:](v4, "initWithLocalDate:", v5);

  objc_msgSend(v3, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMemoryDate universalDateInTimeZone:](v6, "universalDateInTimeZone:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (double)triggerScoreForTriggeredMemory:(id)a3
{
  id v4;
  void *v5;
  double v6;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(v4, "triggerTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__PGMemoryTriggerHandler_triggerScoreForTriggeredMemory___block_invoke;
  v8[3] = &unk_1E842D1E8;
  v8[4] = &v9;
  v8[5] = a1;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

+ (double)scoreForTriggerType:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 1 <= 0x1A)
    return dbl_1CA8ECB20[a3 - 1];
  return result;
}

+ (unint64_t)maximumValidityPeriodForValidityIntervalByTriggerType:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "localDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v6);
        v16 = v15;

        if (v10 <= ((uint64_t)(v16 / 86400.0) & (unint64_t)~((uint64_t)(v16 / 86400.0) >> 63)))
          v10 = (uint64_t)(v16 / 86400.0) & ~((uint64_t)(v16 / 86400.0) >> 63);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

double __57__PGMemoryTriggerHandler_triggerScoreForTriggeredMemory___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(*(id *)(a1 + 40), "scoreForTriggerType:", a2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __107__PGMemoryTriggerHandler_memoryNodesAllowedToBeFallbackFromMemoryNodes_withContext_inGraph_holidayService___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __113__PGMemoryTriggerHandler_fallbackTriggeredMemoriesWithContext_excludingTriggeredMemories_inGraph_holidayService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGTriggeredMemory *v4;
  PGTriggeredMemory *v5;

  v3 = a2;
  v4 = [PGTriggeredMemory alloc];
  v5 = -[PGTriggeredMemory initWithMemoryNode:validityIntervalByTriggerType:creationDate:](v4, "initWithMemoryNode:validityIntervalByTriggerType:creationDate:", v3, MEMORY[0x1E0C9AA70], *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
}

@end
