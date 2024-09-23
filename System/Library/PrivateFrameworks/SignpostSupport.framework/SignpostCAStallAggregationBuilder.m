@implementation SignpostCAStallAggregationBuilder

- (void)_initializeCAInstrumentationProcessor
{
  SignpostCAInstrumentationProcessor *v3;
  SignpostCAInstrumentationProcessor *caInstrumentationProcessor;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  v3 = objc_alloc_init(SignpostCAInstrumentationProcessor);
  caInstrumentationProcessor = self->_caInstrumentationProcessor;
  self->_caInstrumentationProcessor = v3;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke;
  v13[3] = &unk_1E4601240;
  objc_copyWeak(&v14, &location);
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommitIntervalBlock:", v13);

  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_2;
  v11[3] = &unk_1E4601290;
  objc_copyWeak(&v12, &location);
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransactionLifetimeBlock:", v11);

  objc_copyWeak(&v10, &location);
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor", v5, 3221225472, __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_3, &unk_1E4601330);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrameLifetimeBlock:", &v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke(uint64_t a1, void *a2, int a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a3)
  {
    v3 = (id *)(a1 + 32);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_handleLongCommit:", v4);

  }
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a3)
  {
    v3 = (id *)(a1 + 32);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_handleLongTransactionLifetime:", v4);

  }
}

void __74__SignpostCAStallAggregationBuilder__initializeCAInstrumentationProcessor__block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  if (a3)
  {
    v3 = (id *)(a1 + 32);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "_handleLongFrameLifetime:", v4);

  }
}

- (SignpostCAStallAggregationBuilder)init
{
  SignpostCAStallAggregationBuilder *v2;
  SignpostCAStallAggregation *v3;
  SignpostCAStallAggregation *stallAggregation;
  dispatch_queue_t v5;
  OS_dispatch_queue *syncQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostCAStallAggregationBuilder;
  v2 = -[SignpostCAStallAggregationBuilder init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SignpostCAStallAggregation);
    stallAggregation = v2->_stallAggregation;
    v2->_stallAggregation = v3;

    v5 = dispatch_queue_create("SignpostCAStallAggregator sync queue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v5;

    -[SignpostCAStallAggregationBuilder _initializeCAInstrumentationProcessor](v2, "_initializeCAInstrumentationProcessor");
  }
  return v2;
}

- (void)handleDeviceReboot
{
  id v2;

  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleDeviceReboot");

}

- (void)addSubsystemCategoriesOfInterestToAllowlist:(id)a3
{
  +[SignpostCAInstrumentationProcessor addNeededSCToAllowlist:](SignpostCAInstrumentationProcessor, "addNeededSCToAllowlist:", a3);
}

- (void)_processDurationNs:(unint64_t)a3 type:(unsigned __int8)a4 processExecutablePath:(id)a5 pid:(int)a6 aggregateForSystem:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  id v12;
  void *v13;
  NSObject *v14;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = a4;
  v12 = a5;
  if (v12)
  {
    -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_addDuration:ofType:procExecutablePath:responsiblePID:aggregateForSystem:", a3, v9, v12, v8, v7);

  }
  else
  {
    _signpost_debug_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:].cold.1(v14);

  }
}

- (SignpostCAStallAggregation)stallAggregationSnapshot
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[SignpostCAStallAggregationBuilder syncQueue](self, "syncQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SignpostCAStallAggregationBuilder_stallAggregationSnapshot__block_invoke;
  v6[3] = &unk_1E46016E0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SignpostCAStallAggregation *)v4;
}

void __61__SignpostCAStallAggregationBuilder_stallAggregationSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stallAggregation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_isOverThreshold:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;

  v4 = a3;
  -[SignpostCAStallAggregationBuilder maxDurationSec](self, "maxDurationSec");
  v9 = 0;
  if (v5 != 0.0)
  {
    objc_msgSend(v4, "durationSeconds");
    v7 = v6;
    -[SignpostCAStallAggregationBuilder maxDurationSec](self, "maxDurationSec");
    if (v7 > v8)
      v9 = 1;
  }

  return v9;
}

- (void)_handleLongCommit:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SignpostCAStallAggregationBuilder _isOverThreshold:](self, "_isOverThreshold:"))
  {
    ++self->_commitCount;
    v4 = objc_msgSend(v6, "durationNanoseconds");
    objc_msgSend(v6, "executablePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v4, 0, v5, objc_msgSend(v6, "pid"), 1);

  }
}

- (void)_handleLongTransactionLifetime:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[SignpostCAStallAggregationBuilder _isOverThreshold:](self, "_isOverThreshold:"))
  {
    ++self->_transactionLifetimeCount;
    v4 = objc_msgSend(v6, "durationNanoseconds");
    objc_msgSend(v6, "executablePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v4, 4, v5, objc_msgSend(v6, "pid"), 1);

  }
}

- (void)_handleLongFrameLifetime:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  SignpostCAStallAggregationBuilder *v67;
  int obj;
  id obja;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SignpostCAStallAggregationBuilder _isOverThreshold:](self, "_isOverThreshold:", v4))
  {
    ++self->_frameLifetimeCount;
    objc_msgSend(v4, "hidLatencyInterval");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v4, "hidLatencyIsLong");

      if (v7)
      {
        objc_msgSend(v4, "contextInfoForHIDInput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v4, "hidLatencyInterval");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "durationNanoseconds");
          objc_msgSend(v4, "contextInfoForHIDInput");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "executablePath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contextInfoForHIDInput");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v10, 1, v12, objc_msgSend(v13, "pid"), 1);

        }
        else
        {
          -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "hidLatencyInterval");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_addSystemDuration:ofType:", objc_msgSend(v11, "durationNanoseconds"), 1);
        }

      }
    }
    objc_msgSend(v4, "renderInterval");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend(v4, "renderIntervalIsLong");

      if (v16)
      {
        -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "renderInterval");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_addSystemDuration:ofType:", objc_msgSend(v18, "durationNanoseconds"), 3);

      }
    }
    objc_msgSend(v4, "frameLatencyInterval");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)v19;
      v21 = objc_msgSend(v4, "frameLatencyIsLong");

      if (v21)
      {
        -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "frameLatencyInterval");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_addSystemDuration:ofType:", objc_msgSend(v23, "durationNanoseconds"), 2);

      }
    }
    objc_msgSend(v4, "frameOverrunInactiveDisplayInterval");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "discrepancyFrameOverrunInactiveDisplayInterval");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v4, "mayBeFirstFrame");
    v26 = objc_msgSend(v4, "frameStallSkipRequest");
    v27 = 12;
    if (!v24 && v25)
    {
      v24 = v25;
      v27 = 11;
    }
    objc_msgSend(v4, "earliestTimeContextInfo");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      obj = v26;
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "earliestTimeContextInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithInt:", objc_msgSend(v30, "pid"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_msgSend(v4, "durationNanoseconds");
      objc_msgSend(v4, "earliestTimeContextInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "executablePath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "earliestTimeContextInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v32, 6, v34, objc_msgSend(v35, "pid"), 0);

      if (v24)
      {
        v36 = objc_msgSend(v24, "durationNanoseconds");
        objc_msgSend(v4, "earliestTimeContextInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "executablePath");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "earliestTimeContextInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v36, 8, v38, objc_msgSend(v39, "pid"), 0);

        if (((v66 | obj) & 1) == 0)
        {
          v40 = objc_msgSend(v24, "durationNanoseconds");
          objc_msgSend(v4, "earliestTimeContextInfo");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "executablePath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "earliestTimeContextInfo");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v40, v27, v42, objc_msgSend(v43, "pid"), 0);

        }
        if (v66)
        {
          v44 = objc_msgSend(v24, "durationNanoseconds");
          objc_msgSend(v4, "earliestTimeContextInfo");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "executablePath");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "earliestTimeContextInfo");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](self, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v44, 10, v46, objc_msgSend(v47, "pid"), 0);

        }
      }
      v65 = v25;
      v67 = self;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v4, "contributingPIDs");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v71 != v50)
              objc_enumerationMutation(obja);
            v52 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
            if ((objc_msgSend(v52, "isEqualToNumber:", v31) & 1) == 0)
            {
              objc_msgSend(v4, "pidToContextInfoArrayDict");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectForKeyedSubscript:", v52);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "firstObject");
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              v56 = objc_msgSend(v4, "durationNanoseconds");
              objc_msgSend(v55, "executablePath");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v56, 5, v57, objc_msgSend(v55, "pid"), 0);

              if (v24)
              {
                v58 = objc_msgSend(v24, "durationNanoseconds");
                objc_msgSend(v55, "executablePath");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v58, 7, v59, objc_msgSend(v55, "pid"), 0);

                if (v66)
                {
                  v60 = objc_msgSend(v24, "durationNanoseconds");
                  objc_msgSend(v55, "executablePath");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SignpostCAStallAggregationBuilder _processDurationNs:type:processExecutablePath:pid:aggregateForSystem:](v67, "_processDurationNs:type:processExecutablePath:pid:aggregateForSystem:", v60, 9, v61, objc_msgSend(v55, "pid"), 0);

                }
              }

            }
          }
          v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
        }
        while (v49);
      }

      self = v67;
      v25 = v65;
    }
    -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "_addSystemDuration:ofType:", objc_msgSend(v4, "durationNanoseconds"), 5);

    if (v24)
    {
      -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "_addSystemDuration:ofType:", objc_msgSend(v24, "durationNanoseconds"), 7);

      if (v66)
      {
        -[SignpostCAStallAggregationBuilder stallAggregation](self, "stallAggregation");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "_addSystemDuration:ofType:", objc_msgSend(v24, "durationNanoseconds"), 9);

      }
    }

  }
}

- (void)handleSignpostEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSignpostEvent:", v4);

}

- (void)handleSignpostInterval:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSignpostInterval:", v4);

}

- (void)handleSignpostIntervalBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostCAStallAggregationBuilder caInstrumentationProcessor](self, "caInstrumentationProcessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleSignpostIntervalBegin:", v4);

}

- (id)newConfiguredExtractor
{
  SignpostSupportObjectExtractor *v3;
  SignpostSupportSubsystemCategoryAllowlist *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  -[SignpostCAStallAggregationBuilder addSubsystemCategoriesOfInterestToAllowlist:](self, "addSubsystemCategoriesOfInterestToAllowlist:", v4);
  -[SignpostSupportObjectExtractor setSubsystemCategoryFilter:](v3, "setSubsystemCategoryFilter:", v4);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke;
  v10[3] = &unk_1E46010B8;
  v10[4] = self;
  -[SignpostSupportObjectExtractor setIntervalCompletionProcessingBlock:](v3, "setIntervalCompletionProcessingBlock:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_2;
  v9[3] = &unk_1E46010E0;
  v9[4] = self;
  -[SignpostSupportObjectExtractor setBeginEventProcessingBlock:](v3, "setBeginEventProcessingBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_3;
  v8[3] = &unk_1E46010E0;
  v8[4] = self;
  -[SignpostSupportObjectExtractor setEmitEventProcessingBlock:](v3, "setEmitEventProcessingBlock:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_4;
  v7[3] = &unk_1E4601108;
  v7[4] = self;
  -[SignpostSupportObjectExtractor setDeviceRebootProcessingBlock:](v3, "setDeviceRebootProcessingBlock:", v7);

  return v3;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostInterval:", a2);
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostIntervalBegin:", a2);
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostEvent:", a2);
  return 1;
}

uint64_t __59__SignpostCAStallAggregationBuilder_newConfiguredExtractor__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleDeviceReboot");
  return 1;
}

- (float)maxDurationSec
{
  return self->_maxDurationSec;
}

- (void)setMaxDurationSec:(float)a3
{
  self->_maxDurationSec = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (SignpostCAStallAggregation)stallAggregation
{
  return self->_stallAggregation;
}

- (SignpostCAInstrumentationProcessor)caInstrumentationProcessor
{
  return self->_caInstrumentationProcessor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caInstrumentationProcessor, 0);
  objc_storeStrong((id *)&self->_stallAggregation, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

- (void)_processDurationNs:(os_log_t)log type:processExecutablePath:pid:aggregateForSystem:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A1A28000, log, OS_LOG_TYPE_DEBUG, "Nil process executable. Ignoring interval", v1, 2u);
}

@end
