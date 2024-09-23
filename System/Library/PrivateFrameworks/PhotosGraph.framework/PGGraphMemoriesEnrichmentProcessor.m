@implementation PGGraphMemoriesEnrichmentProcessor

- (PGGraphMemoriesEnrichmentProcessor)init
{
  return -[PGGraphMemoriesEnrichmentProcessor initWithNumberOfMemoriesToEnrich:](self, "initWithNumberOfMemoriesToEnrich:", 0);
}

- (PGGraphMemoriesEnrichmentProcessor)initWithNumberOfMemoriesToEnrich:(unint64_t)a3
{
  PGGraphMemoriesEnrichmentProcessor *v4;
  PGGraphMemoriesEnrichmentProcessor *v5;
  os_log_t v6;
  OS_os_log *loggingConnection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PGGraphMemoriesEnrichmentProcessor;
  v4 = -[PGGraphMemoriesEnrichmentProcessor init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_numberOfMemoriesToEnrich = a3;
    v6 = os_log_create("com.apple.PhotosGraph", "MemoriesEnrichment");
    loggingConnection = v5->_loggingConnection;
    v5->_loggingConnection = (OS_os_log *)v6;

  }
  return v5;
}

- (BOOL)runWithGraphManager:(id)a3 incrementalChange:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  char v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "workingContextForMemories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierInPhotoLibrary:](PGGraphMemoryProcessorHelper, "localMemoryByUniqueIdentifierInPhotoLibrary:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_incrementalChange_progressReporter_error___block_invoke;
  v24[3] = &unk_1E842E378;
  v24[4] = self;
  v16 = v11;
  v25 = v16;
  v17 = v15;
  v26 = v17;
  v18 = v12;
  v27 = v18;
  v19 = v14;
  v28 = v19;
  v20 = v13;
  v29 = v20;
  v30 = &v31;
  objc_msgSend(v20, "performSynchronousConcurrentGraphReadUsingBlock:", v24);
  v21 = objc_msgSend(v18, "isCancelled") ^ 1;
  if (!a6)
    LOBYTE(v21) = 1;
  if ((v21 & 1) == 0)
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -4);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = *((_BYTE *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return v22;
}

- (id)runWithGraphManager:(id)a3 forMemoryCategory:(unint64_t)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "workingContextForMemories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__39280;
  v38 = __Block_byref_object_dispose__39281;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__39280;
  v32 = __Block_byref_object_dispose__39281;
  v33 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryCategory_progressReporter_error___block_invoke;
  v21[3] = &unk_1E8435160;
  v27 = a4;
  v21[4] = self;
  v25 = &v28;
  v14 = v13;
  v22 = v14;
  v26 = &v34;
  v15 = v12;
  v23 = v15;
  v16 = v11;
  v24 = v16;
  objc_msgSend(v15, "performSynchronousConcurrentGraphReadUsingBlock:", v21);
  if (a6)
  {
    v17 = (void *)v29[5];
    if (v17)
    {
      v18 = objc_retainAutorelease(v17);
LABEL_6:
      *a6 = v18;
      goto LABEL_7;
    }
    if (objc_msgSend(v16, "isCancelled"))
    {
      +[PGError errorForCode:](PGError, "errorForCode:", -4);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:
  v19 = (id)v35[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

- (id)runWithGraphManager:(id)a3 forMemoryUUIDs:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  PGGraphMemoriesEnrichmentProcessor *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "workingContextForMemories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierForMemoryUUIDs:inPhotoLibrary:](PGGraphMemoryProcessorHelper, "localMemoryByUniqueIdentifierForMemoryUUIDs:inPhotoLibrary:", v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__39280;
  v46 = __Block_byref_object_dispose__39281;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__39280;
  v40 = __Block_byref_object_dispose__39281;
  v41 = 0;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __96__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryUUIDs_progressReporter_error___block_invoke;
  v28 = &unk_1E842E3A0;
  v29 = self;
  v17 = v16;
  v30 = v17;
  v34 = &v36;
  v18 = v11;
  v31 = v18;
  v35 = &v42;
  v19 = v13;
  v32 = v19;
  v20 = v12;
  v33 = v20;
  objc_msgSend(v19, "performSynchronousConcurrentGraphReadUsingBlock:", &v25);
  if (a6)
  {
    v21 = (void *)v37[5];
    if (v21)
    {
      v22 = objc_retainAutorelease(v21);
LABEL_6:
      *a6 = v22;
      goto LABEL_7;
    }
    if (objc_msgSend(v20, "isCancelled", v25, v26, v27, v28, v29, v30, v31, v32))
    {
      +[PGError errorForCode:](PGError, "errorForCode:", -4);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:
  v23 = (id)v43[5];

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23;
}

- (id)enrichMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 workingContext:(id)a5 graph:(id)a6 progressReporter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  PGMemoryElectorConfiguration *v19;
  PGGraphLocationHelper *v20;
  PGMemoryCurationSession *v21;
  void *v22;
  PGMemoryCurationSession *v23;
  PGEnrichedMemoryFactory *v24;
  void *v25;
  id v26;
  PGMemoryDate *v27;
  void *v28;
  PGMemoryDate *v29;
  void *v30;
  unint64_t v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
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
  id v46;
  PGGraphLocationHelper *v47;
  void *v48;
  void *v49;
  char v50;
  NSObject *loggingConnection;
  PGMemoryCurationSession *v53;
  void *v54;
  id v55;
  PGGraphLocationHelper *v56;
  PGMemoryDate *v57;
  id v58;
  PGMemoryPhotoKitPersister *v59;
  id v60;
  void *v61;
  id v62;
  id obj;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  PGEnrichedMemoryFactory *v68;
  PGMemoryElectorConfiguration *v69;
  void *v70;
  PGGraphMemoriesEnrichmentProcessor *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  unint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v58 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "count");
  v61 = v15;
  v71 = self;
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v15);
  v64 = -[PGGraphMemoriesEnrichmentProcessor _targetNumberOfMemoriesToEnrichWithPhotoLibrary:](self, "_targetNumberOfMemoriesToEnrichWithPhotoLibrary:", v16);
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v16);
  v59 = -[PGMemoryPhotoKitPersister initWithPhotoLibrary:]([PGMemoryPhotoKitPersister alloc], "initWithPhotoLibrary:", v16);
  v19 = objc_alloc_init(PGMemoryElectorConfiguration);
  v20 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v14);
  v21 = [PGMemoryCurationSession alloc];
  objc_msgSend(v13, "curationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)v18;
  v56 = v20;
  v23 = -[PGMemoryCurationSession initWithCurationManager:photoLibrary:curationContext:locationHelper:](v21, "initWithCurationManager:photoLibrary:curationContext:locationHelper:", v22, v16, v18, v20);

  v24 = [PGEnrichedMemoryFactory alloc];
  objc_msgSend(v13, "serviceManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  v68 = -[PGEnrichedMemoryFactory initWithMemoryCurationSession:graph:serviceManager:](v24, "initWithMemoryCurationSession:graph:serviceManager:", v23, v14, v25);

  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = [PGMemoryDate alloc];
  -[PGMemoryElectorConfiguration localDate](v19, "localDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[PGMemoryDate initWithLocalDate:](v27, "initWithLocalDate:", v28);

  v69 = v19;
  -[PGMemoryElectorConfiguration timeZone](v19, "timeZone");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v29;
  -[PGMemoryDate universalDateInTimeZone:](v29, "universalDateInTimeZone:", v30);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v12;
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  v31 = 0;
  if (v66)
  {
    v32 = 0.6 / (double)v17 * 0.5;
    v65 = *(_QWORD *)v74;
    v33 = 0.0;
    v54 = v16;
    v55 = v13;
    v53 = v23;
LABEL_3:
    v34 = v26;
    v35 = 0;
    v36 = v60;
    v37 = v61;
    while (1)
    {
      if (*(_QWORD *)v74 != v65)
        objc_enumerationMutation(obj);
      v38 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v35);
      v39 = (void *)MEMORY[0x1CAA4EB2C]();
      v33 = v32 + v33;
      objc_msgSend(v72, "childProgressReporterToCheckpoint:", v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphMemoriesEnrichmentProcessor enrichedMemoryFromMemoryNode:atCreationDate:configuration:curationContext:enrichedMemoryFactory:graph:progressReporter:](v71, "enrichedMemoryFromMemoryNode:atCreationDate:configuration:curationContext:enrichedMemoryFactory:graph:progressReporter:", v38, v67, v69, v70, v68, v36, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "isCancelled"))
        break;
      if (v41)
      {
        v31 += objc_msgSend(v41, "failedEnrichment") ^ 1;
        objc_msgSend(v34, "addObject:", v41);
        objc_msgSend(v38, "uniqueMemoryIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_msgSend(v62, "addObject:", v42);
          v33 = v32 + v33;
          if ((unint64_t)objc_msgSend(v34, "count") > 0x31 || v31 >= v64)
          {
            objc_msgSend(v72, "childProgressReporterToCheckpoint:", v33);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v34;
            -[PGGraphMemoriesEnrichmentProcessor insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:](v71, "insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:", v34, v58, v59, v43);
            if (objc_msgSend(v37, "isCancelled"))
            {

              objc_autoreleasePoolPop(v39);
              v45 = obj;

              v46 = 0;
              v13 = v55;
              v36 = v60;
              goto LABEL_22;
            }
            v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            v36 = v60;
            v37 = v61;
          }
          if (v31 >= v64)
          {

            objc_autoreleasePoolPop(v39);
            v16 = v54;
            v13 = v55;
            v23 = v53;
            v26 = v34;
            goto LABEL_23;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Memory's uniqueMemoryIdentifier is nil", buf, 2u);
        }

      }
      objc_autoreleasePoolPop(v39);
      if (v66 == ++v35)
      {
        v16 = v54;
        v13 = v55;
        v23 = v53;
        v26 = v34;
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        if (v66)
          goto LABEL_3;
        goto LABEL_23;
      }
    }

    objc_autoreleasePoolPop(v39);
    v45 = obj;

    v46 = 0;
    v13 = v55;
LABEL_22:
    v23 = v53;
    v16 = v54;
    v47 = v56;
    v48 = v62;
    goto LABEL_29;
  }
LABEL_23:

  if (objc_msgSend(v26, "count")
    && (objc_msgSend(v72, "childProgressReporterToCheckpoint:", 0.7),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PGGraphMemoriesEnrichmentProcessor insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:](v71, "insertOrUpdateLocalMemoriesForEnrichedMemories:localMemoryByUniqueIdentifier:memoryPersister:progressReporter:", v26, v58, v59, v49), v50 = objc_msgSend(v61, "isCancelled"), v49, (v50 & 1) != 0))
  {
    v34 = v26;
    v46 = 0;
    v36 = v60;
    v47 = v56;
    v48 = v62;
    v45 = obj;
  }
  else
  {
    v34 = v26;
    loggingConnection = v71->_loggingConnection;
    v47 = v56;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v78 = v31;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Enriched %tu Memory nodes.", buf, 0xCu);
    }
    v48 = v62;
    v46 = v62;
    v36 = v60;
    v45 = obj;
  }
LABEL_29:

  return v46;
}

- (id)enrichedMemoryFromMemoryNode:(id)a3 atCreationDate:(id)a4 configuration:(id)a5 curationContext:(id)a6 enrichedMemoryFactory:(id)a7 graph:(id)a8 progressReporter:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PGTriggeredMemory *v20;
  PGTriggeredMemory *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  NSObject *loggingConnection;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  int v39;
  void *v40;
  __int16 v41;
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a9;
  v18 = a6;
  v19 = a4;
  v20 = [PGTriggeredMemory alloc];
  v21 = -[PGTriggeredMemory initWithMemoryNode:validityIntervalByTriggerType:creationDate:](v20, "initWithMemoryNode:validityIntervalByTriggerType:creationDate:", v14, MEMORY[0x1E0C9AA70], v19);

  objc_msgSend(v14, "memoryFeatureNodes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "memoryMomentNodes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMemoryFeatureBlocking blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:](PGMemoryFeatureBlocking, "blockableFeaturesForFeatureNodes:momentNodes:memoryCategory:", v22, v23, objc_msgSend(v14, "memoryCategory"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "userFeedbackCalculator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "memoryFeaturesWithNegativeFeedbackForMemoryFeatures:", v24);
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString count](v26, "count"))
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)MEMORY[0x1E0CD1630];
      v29 = loggingConnection;
      objc_msgSend(v28, "stringForCategory:", objc_msgSend(v14, "memoryCategory"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138412546;
      v40 = v30;
      v41 = 2112;
      v42 = v26;
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Not enriching memory of category %@ because it contains blocked features %@", (uint8_t *)&v39, 0x16u);

    }
    v31 = 0;
  }
  else
  {
    -[PGTriggeredMemory setBlockableFeatures:](v21, "setBlockableFeatures:", v24);
    objc_msgSend(v16, "debugEnrichedMemoryWithTriggeredMemory:withConfiguration:progressReporter:", v21, v15, v17);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "failedEnrichment"))
    {
      v32 = self->_loggingConnection;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = objc_msgSend(v31, "failureReason");
        if (v34 > 8)
          v35 = CFSTR("PGEnrichedMemoryFailureReasonUnknown");
        else
          v35 = off_1E842EBC0[v34];
        v36 = v35;
        v39 = 138412546;
        v40 = v31;
        v41 = 2112;
        v42 = v36;
        _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Failed to enrich memory %@ (%@): Persisting empty memory", (uint8_t *)&v39, 0x16u);

      }
      objc_msgSend(v31, "uniqueMemoryIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTitle:", v37);

    }
  }

  return v31;
}

- (unint64_t)_targetNumberOfMemoriesToEnrichWithPhotoLibrary:(id)a3
{
  id v4;
  unint64_t numberOfMemoriesToEnrich;
  NSObject *loggingConnection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t buf[4];
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  numberOfMemoriesToEnrich = self->_numberOfMemoriesToEnrich;
  if (numberOfMemoriesToEnrich)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v16 = numberOfMemoriesToEnrich;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Target overriden: Will try to enrich %tu memory nodes.", buf, 0xCu);
      numberOfMemoriesToEnrich = self->_numberOfMemoriesToEnrich;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -21600.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludeLocalMemories:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("lastEnrichmentDate > %@"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInternalPredicate:", v9);

    objc_msgSend(MEMORY[0x1E0CD1630], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = v11;
    if (v11 >= 0x12C)
      numberOfMemoriesToEnrich = 300;
    else
      numberOfMemoriesToEnrich = 300 - v11;
    v13 = self->_loggingConnection;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v16 = numberOfMemoriesToEnrich;
      v17 = 2048;
      v18 = v12;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Will try to enrich %tu memory nodes (%tu recently enriched).", buf, 0x16u);
    }

  }
  return numberOfMemoriesToEnrich;
}

- (id)sortedMemoryNodesToEnrichForIncrementalForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *loggingConnection;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __128__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForIncrementalForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke;
  v32 = &unk_1E842E3C8;
  v16 = v8;
  v33 = v16;
  v17 = v13;
  v34 = v17;
  v18 = v15;
  v35 = v18;
  v19 = v14;
  v36 = v19;
  objc_msgSend(v11, "enumerateNodesUsingBlock:", &v29);

  -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v17, 0, v10, v29, v30, v31, v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v20);

  -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v18, v16, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v21);

  -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v19, v16, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addObjectsFromArray:", v22);
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v24 = loggingConnection;
    v25 = objc_msgSend(v12, "count");
    v26 = objc_msgSend(v17, "count");
    v27 = objc_msgSend(v19, "count");
    *(_DWORD *)buf = 134218496;
    v38 = v25;
    v39 = 2048;
    v40 = v26;
    v41 = 2048;
    v42 = v27;
    _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Found %lu Memory nodes to enrich out of %lu without local memories and %lu with local memories whose lastEnrichmentDate is nil.", buf, 0x20u);

  }
  return v12;
}

- (id)sortedMemoryNodesToEnrichForMemoryNodes:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  OS_os_log *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__39280;
  v52 = __Block_byref_object_dispose__39281;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__39280;
  v46 = __Block_byref_object_dispose__39281;
  v47 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke;
  v36[3] = &unk_1E842E3F0;
  v14 = v9;
  v37 = v14;
  v15 = v11;
  v38 = v15;
  v40 = &v48;
  v41 = &v42;
  v16 = v12;
  v39 = v16;
  v32 = v8;
  objc_msgSend(v8, "enumerateNodesUsingBlock:", v36);
  v17 = objc_msgSend(v16, "count");
  if (v17)
  {
    -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v16, 0, v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v18);

  }
  v19 = objc_msgSend(v15, "count");
  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB3880];
    v34[0] = v13;
    v34[1] = 3221225472;
    v34[2] = __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke_2;
    v34[3] = &unk_1E842E418;
    v21 = v14;
    v35 = v21;
    objc_msgSend(v20, "predicateWithBlock:", v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphMemoriesEnrichmentProcessor _memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:](self, "_memoryNodesSortedForEnrichment:localMemoryByUniqueIdentifier:graph:", v23, v21, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v24);

  }
  v25 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v10, "count");
    v27 = v49[5];
    v28 = v43[5];
    *(_DWORD *)buf = 134219010;
    v55 = v26;
    v56 = 2048;
    v57 = v17;
    v58 = 2048;
    v59 = v19;
    v60 = 2112;
    v61 = v27;
    v62 = 2112;
    v63 = v28;
    _os_log_impl(&dword_1CA237000, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Found %lu Memory nodes to enrich out of %lu without local memories and %lu with local memories.\n\tEnrichment date range: %@ - %@", buf, 0x34u);
  }

  v29 = v39;
  v30 = v10;

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v30;
}

- (id)_memoryNodesSortedForEnrichment:(id)a3 localMemoryByUniqueIdentifier:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "categoriesOfMemoriesToPrioritize");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphMemoriesEnrichmentProcessor uniqueMemoryIdentifiersToPrioritizeWithGraph:](self, "uniqueMemoryIdentifiersToPrioritizeWithGraph:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__PGGraphMemoriesEnrichmentProcessor__memoryNodesSortedForEnrichment_localMemoryByUniqueIdentifier_graph___block_invoke;
  v18[3] = &unk_1E842E440;
  v19 = v8;
  v20 = v11;
  v21 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v8;
  objc_msgSend(v10, "sortedArrayUsingComparator:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)uniqueMemoryIdentifiersToPrioritizeWithGraph:(id)a3
{
  NSSet *uniqueMemoryIdentifiersToPrioritize;
  void *v5;
  id v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  uniqueMemoryIdentifiersToPrioritize = self->_uniqueMemoryIdentifiersToPrioritize;
  if (!uniqueMemoryIdentifiersToPrioritize)
  {
    v5 = (void *)MEMORY[0x1E0D77F10];
    v6 = a3;
    objc_msgSend(v5, "eventElectionMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGEventElector memoryUniqueIdentifiersToElectWithGraph:electionMode:error:](PGEventElector, "memoryUniqueIdentifiersToElectWithGraph:electionMode:error:", v6, v7, 0);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();

    v9 = self->_uniqueMemoryIdentifiersToPrioritize;
    self->_uniqueMemoryIdentifiersToPrioritize = v8;

    uniqueMemoryIdentifiersToPrioritize = self->_uniqueMemoryIdentifiersToPrioritize;
  }
  return uniqueMemoryIdentifiersToPrioritize;
}

- (void)deleteNoLongerExistingMemoryNodes:(id)a3 fromLocalMemoryByUniqueIdentifier:(id)a4 inPhotoLibrary:(id)a5 progressReporter:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  int v23;
  char *v24;
  NSObject *loggingConnection;
  char v26;
  char v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t *v36;
  uint64_t *v37;
  double v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  uint8_t v47[8];
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v28 = a5;
  v12 = a6;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  if (objc_msgSend(v11, "count"))
  {
    *(_QWORD *)v47 = 0;
    *(_QWORD *)&v48 = v47;
    *((_QWORD *)&v48 + 1) = 0x2020000000;
    v49 = 0;
    v13 = objc_msgSend(v11, "count");
    objc_msgSend(v10, "uniqueMemoryIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke;
    v32[3] = &unk_1E842E468;
    v17 = v14;
    v33 = v17;
    v18 = v15;
    v34 = v18;
    v36 = v47;
    v38 = 0.5 / (double)v13;
    v37 = &v39;
    v19 = v12;
    v35 = v19;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v32);
    if (*((_BYTE *)v40 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v44 = 520;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
        v20 = MEMORY[0x1E0C81028];
LABEL_22:
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v21 = objc_msgSend(v18, "count");
      v22 = v21;
      if (v21)
      {
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke_212;
        v30[3] = &unk_1E8435668;
        v31 = v18;
        v29 = 0;
        v23 = objc_msgSend(v28, "performChangesAndWait:error:", v30, &v29);
        v24 = (char *)v29;
        loggingConnection = self->_loggingConnection;
        if (v23)
        {
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            v44 = v22;
            _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully deleted %d local memories.", buf, 8u);
          }
        }
        else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v44 = v22;
          v45 = 2112;
          v46 = v24;
          _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to delete %d local memories: %@", buf, 0x12u);
        }

      }
      if (*((_BYTE *)v40 + 24))
      {
        *((_BYTE *)v40 + 24) = 1;
      }
      else
      {
        v27 = objc_msgSend(v19, "isCancelledWithProgress:", 1.0);
        *((_BYTE *)v40 + 24) = v27;
        if ((v27 & 1) == 0)
          goto LABEL_23;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v44 = 535;
        v45 = 2080;
        v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
        v20 = MEMORY[0x1E0C81028];
        goto LABEL_22;
      }
    }
LABEL_23:

    _Block_object_dispose(v47, 8);
    goto LABEL_24;
  }
  if (*((_BYTE *)v40 + 24))
  {
    *((_BYTE *)v40 + 24) = 1;
  }
  else
  {
    v26 = objc_msgSend(v12, "isCancelledWithProgress:", 1.0);
    *((_BYTE *)v40 + 24) = v26;
    if ((v26 & 1) == 0)
      goto LABEL_24;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v47 = 67109378;
    *(_DWORD *)&v47[4] = 504;
    LOWORD(v48) = 2080;
    *(_QWORD *)((char *)&v48 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Data Model Enrichment/PGGraphMemoriesEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v47, 0x12u);
  }
LABEL_24:
  _Block_object_dispose(&v39, 8);

}

- (void)insertOrUpdateLocalMemoriesForEnrichedMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 memoryPersister:(id)a5 progressReporter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  int v29;
  id v30;
  NSObject *loggingConnection;
  uint64_t v32;
  int v33;
  int v34;
  NSObject *v35;
  void *v36;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v39 = a5;
  v38 = a6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v18, "uniqueMemoryIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = v11;
        if (v20)
        {
          objc_msgSend(v20, "photosGraphVersion");
          if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() < 0x400
            || (v22 = objc_msgSend(v20, "isRejected"), v21 = v12, v22)
            && (v23 = objc_msgSend(v18, "failedEnrichment"), v21 = v12, (v23 & 1) == 0))
          {
            objc_msgSend(v40, "addObject:", v20);
            v21 = v11;
          }
        }
        objc_msgSend(v21, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v15);
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v38);
  objc_msgSend(v24, "childProgressReporterToCheckpoint:", 0.5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "childProgressReporterToCheckpoint:", 1.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v11, "count");
  if (v27)
  {
    v28 = v27;
    v41 = 0;
    v36 = v25;
    v29 = objc_msgSend(v39, "persistLocalMemoriesFromEnrichedMemories:localMemoriesToDelete:progressReporter:error:", v11, v40, v25, &v41);
    v30 = v41;
    loggingConnection = self->_loggingConnection;
    if (v29)
    {
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v47 = v28;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully inserted %d memories.", buf, 8u);
      }
    }
    else if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v47 = v28;
      v48 = 2112;
      v49 = v30;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to insert %d memories (%@)", buf, 0x12u);
    }

    v25 = v36;
  }
  v32 = objc_msgSend(v12, "count");
  if (v32)
  {
    v33 = v32;
    v34 = objc_msgSend(v39, "updateExistingMemories:localMemoryByUniqueIdentifier:progressReporter:", v12, v10, v26);
    v35 = self->_loggingConnection;
    if (v34)
    {
      if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v47 = v33;
        _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] Successfully updated %d memories.", buf, 8u);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v47 = v33;
      _os_log_error_impl(&dword_1CA237000, v35, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Failed to update %d memories.", buf, 8u);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_uniqueMemoryIdentifiersToPrioritize, 0);
}

void __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  char v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(a1 + 48), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a4 = 1;

}

uint64_t __138__PGGraphMemoriesEnrichmentProcessor_deleteNoLongerExistingMemoryNodes_fromLocalMemoryByUniqueIdentifier_inPhotoLibrary_progressReporter___block_invoke_212(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 32));
}

uint64_t __106__PGGraphMemoriesEnrichmentProcessor__memoryNodesSortedForEnrichment_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uniqueMemoryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueMemoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v5, "memoryCategory"));
  v12 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v6, "memoryCategory"));
  if (v11 && !v12)
    goto LABEL_3;
  if ((v12 ^ 1 | v11) != 1)
    goto LABEL_12;
  v14 = *(void **)(a1 + 48);
  objc_msgSend(v5, "uniqueMemoryIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  v17 = *(void **)(a1 + 48);
  objc_msgSend(v6, "uniqueMemoryIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  if (!v16 || v19)
  {
    if ((v19 ^ 1 | v16) != 1)
      goto LABEL_12;
    if (v9 || !v10)
    {
      if (v9 && !v10)
        goto LABEL_12;
      if (!v9 || !v10)
      {
LABEL_24:
        v13 = objc_msgSend(v7, "compare:", v8);
        goto LABEL_13;
      }
      v21 = objc_msgSend(v9, "photosGraphVersion");
      v22 = objc_msgSend(v10, "photosGraphVersion");
      if (v21 >= v22)
      {
        if (v22 >= v21)
        {
          objc_msgSend(v9, "lastEnrichmentDate");
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastEnrichmentDate");
          v24 = objc_claimAutoreleasedReturnValue();
          if (v23 | v24)
          {
            if (!v23 || objc_msgSend((id)v23, "compare:", v24) == -1)
            {
              v13 = -1;
            }
            else
            {
              if (v24 && objc_msgSend((id)v24, "compare:", v23) != -1)
                goto LABEL_23;
              v13 = 1;
            }

            goto LABEL_13;
          }
LABEL_23:

          goto LABEL_24;
        }
LABEL_12:
        v13 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_3:
  v13 = -1;
LABEL_13:

  return v13;
}

void __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v3 = a2;
  objc_msgSend(v3, "uniqueMemoryIdentifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

    objc_msgSend(v4, "lastEnrichmentDate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    if (v6)
    {
      objc_msgSend(v6, "earlierDate:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;
    }
    else
    {
      v10 = v3;
      v9 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v10;
    }

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    if (v12)
    {
      objc_msgSend(v12, "laterDate:", v3);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v16 = v3;
      v15 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v16;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
  }

}

BOOL __114__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  double v7;

  objc_msgSend(a2, "uniqueMemoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photosGraphVersion");
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x400)
  {
    objc_msgSend(v4, "lastEnrichmentDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceNow");
    v5 = fabs(v7) > 1209600.0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __128__PGGraphMemoriesEnrichmentProcessor_sortedMemoryNodesToEnrichForIncrementalForMemoryNodes_localMemoryByUniqueIdentifier_graph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "uniqueMemoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (id *)(a1 + 40);
    goto LABEL_7;
  }
  objc_msgSend(v6, "photosGraphVersion");
  if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() <= 0x3FF)
  {
    v7 = (id *)(a1 + 48);
LABEL_7:
    objc_msgSend(*v7, "addObject:", v9);
    goto LABEL_8;
  }
  objc_msgSend(v6, "lastEnrichmentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7 = (id *)(a1 + 56);
    goto LABEL_7;
  }
LABEL_8:

}

void __96__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryUUIDs_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = a2;
  v6 = os_signpost_id_generate(v4);
  v7 = v4;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  objc_msgSend(v5, "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphMemoryNodeCollection memoryNodesWithUniqueIdentifierArray:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesWithUniqueIdentifierArray:inGraph:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "enrichMemoryNodes:localMemoryByUniqueIdentifier:workingContext:graph:progressReporter:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v10, *(_QWORD *)(a1 + 64));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v20 = v8;
    v21 = v20;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_END, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", ", buf, 2u);
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "PGGraphMemoriesEnrichmentProcessorForUUIDs";
      v32 = 2048;
      v33 = (float)((float)((float)((float)(v17 - v9) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No memory nodes to enrich for %@"), *(_QWORD *)(a1 + 48));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pl_analysisErrorWithCode:localizedDescription:", 1, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    v27 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v31 = v28;
      _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Error: %@", buf, 0xCu);
    }
  }

}

void __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_forMemoryCategory_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  id v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = a2;
  v6 = os_signpost_id_generate(v4);
  v7 = v4;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  objc_msgSend(v5, "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMemoryNodeCollection memoryNodesOfCategory:inGraph:](PGGraphMemoryNodeCollection, "memoryNodesOfCategory:inGraph:", *(_QWORD *)(a1 + 80), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v31 = v9;
    objc_msgSend(v11, "uniqueMemoryIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:inPhotoLibrary:](PGGraphMemoryProcessorHelper, "localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:inPhotoLibrary:", v14, *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "enrichMemoryNodes:localMemoryByUniqueIdentifier:workingContext:graph:progressReporter:", v12, v15, *(_QWORD *)(a1 + 48), v10, *(_QWORD *)(a1 + 56));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v22 = v8;
    v23 = v22;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v6, "PGGraphMemoriesEnrichmentProcessorForUUIDs", ", buf, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "PGGraphMemoriesEnrichmentProcessorForUUIDs";
      v35 = 2048;
      v36 = (float)((float)((float)((float)(v19 - v31) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No memory nodes to enrich for category %zu"), *(_QWORD *)(a1 + 80));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pl_analysisErrorWithCode:localizedDescription:", 1, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    v29 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v34 = v30;
      _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "[PGGraphMemoriesEnrichmentProcessor] Error: %@", buf, 0xCu);
    }
  }

}

void __99__PGGraphMemoriesEnrichmentProcessor_runWithGraphManager_incrementalChange_progressReporter_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  unint64_t v33;
  void *v34;
  os_signpost_id_t v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  double v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  v8 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PGGraphMemoriesEnrichmentProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  objc_msgSend(v3, "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  if (v11)
    v12 = objc_msgSend(v11, "isResumingFullAnalysis");
  else
    v12 = 1;
  objc_msgSend((id)objc_opt_class(), "enrichableMemoryNodesInGraph:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 48);
  if (v12)
    objc_msgSend(v14, "sortedMemoryNodesToEnrichForMemoryNodes:localMemoryByUniqueIdentifier:graph:", v13, v15, v10);
  else
    objc_msgSend(v14, "sortedMemoryNodesToEnrichForIncrementalForMemoryNodes:localMemoryByUniqueIdentifier:graph:", v13, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "childProgressReporterFromStart:toEnd:", 0.0, 0.1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "deleteNoLongerExistingMemoryNodes:fromLocalMemoryByUniqueIdentifier:inPhotoLibrary:progressReporter:", v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  if ((objc_msgSend(*(id *)(a1 + 56), "isCancelled") & 1) == 0)
  {
    if (objc_msgSend(v16, "count"))
    {
      v38 = v9;
      objc_msgSend(*(id *)(a1 + 56), "childProgressReporterFromStart:toEnd:", 0.1, 1.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "enrichMemoryNodes:localMemoryByUniqueIdentifier:workingContext:graph:progressReporter:", v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), v10);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v40 != 0;
      if ((objc_msgSend(*(id *)(a1 + 56), "isCancelled") & 1) == 0)
      {
        if ((v12 & 1) == 0)
        {
          v33 = v5 - 1;
          v35 = v5;
          v36 = v7;
          v37 = v3;
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v34 = v16;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v43;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v43 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                v24 = (void *)MEMORY[0x1CAA4EB2C]();
                objc_msgSend(v23, "uniqueMemoryIdentifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addObject:", v25);

                objc_autoreleasePoolPop(v24);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
            }
            while (v20);
          }

          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "minusSet:", v26);

          }
          +[PGGraphMemoryProcessorHelper resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:localMemoryByUniqueIdentifierCache:inPhotoLibrary:](PGGraphMemoryProcessorHelper, "resetLocalMemoryLastEnrichmentDateOfMemoriesWithUniqueIdentifiers:localMemoryByUniqueIdentifierCache:inPhotoLibrary:", v17, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

          v7 = v36;
          v3 = v37;
          v16 = v34;
          v5 = v35;
          v8 = v33;
        }
        v27 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v30 = v7;
        v31 = v30;
        if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, v5, "PGGraphMemoriesEnrichmentProcessor", ", buf, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "PGGraphMemoriesEnrichmentProcessor";
          v49 = 2048;
          v50 = (float)((float)((float)((float)(v27 - v38) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }

    }
    else
    {
      v32 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "[PGGraphMemoriesEnrichmentProcessor] No memory nodes to enrich", buf, 2u);
      }
    }
  }

}

+ (id)categoriesOfMemoriesToPrioritize
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 31);
  objc_msgSend(v2, "addIndex:", 19);
  return v2;
}

+ (id)enrichableMemoryNodesInGraph:(id)a3
{
  return +[PGGraphNodeCollection nodesInGraph:](PGGraphMemoryNodeCollection, "nodesInGraph:", a3);
}

@end
