@implementation SSCAMetalLayerClientSessionAccumulator

+ (BOOL)filterSupportsCAMetalLayerClientSessionAccumulation:(id)a3
{
  return objc_msgSend(a3, "passesSubsystem:category:", kSSCAMLFramePacingSubsystem, kSSCAMLFramePacingCategory);
}

+ (void)addNeededSCToAllowlist:(id)a3
{
  objc_msgSend(a3, "addSubsystem:category:", kSSCAMLFramePacingSubsystem, kSSCAMLFramePacingCategory);
}

- (id)configuredExtractor
{
  SignpostSupportObjectExtractor *v3;
  uint64_t v4;
  SignpostSupportSubsystemCategoryAllowlist *v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke;
  v9[3] = &unk_1E46010B8;
  v9[4] = self;
  -[SignpostSupportObjectExtractor setIntervalCompletionProcessingBlock:](v3, "setIntervalCompletionProcessingBlock:", v9);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_2;
  v8[3] = &unk_1E46010E0;
  v8[4] = self;
  -[SignpostSupportObjectExtractor setEmitEventProcessingBlock:](v3, "setEmitEventProcessingBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_3;
  v7[3] = &unk_1E4601108;
  v7[4] = self;
  -[SignpostSupportObjectExtractor setDeviceRebootProcessingBlock:](v3, "setDeviceRebootProcessingBlock:", v7);
  v5 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  objc_msgSend((id)objc_opt_class(), "addNeededSCToAllowlist:", v5);
  -[SignpostSupportObjectExtractor setSubsystemCategoryFilter:](v3, "setSubsystemCategoryFilter:", v5);

  return v3;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "processInterval:", a2);
  return 1;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "processEvent:", a2);
  return 1;
}

uint64_t __61__SSCAMetalLayerClientSessionAccumulator_configuredExtractor__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "processDeviceReboot");
  return 1;
}

- (void)processDeviceReboot
{
  SSDeviceBootSession *v3;
  id v4;

  -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](self, "mutableBootSessions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SSDeviceBootSession initWithIncludeTimelines:]([SSDeviceBootSession alloc], "initWithIncludeTimelines:", -[SSCAMetalLayerClientSessionAccumulator includeTimelines](self, "includeTimelines"));
  objc_msgSend(v4, "addObject:", v3);

}

- (void)_processLayerMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "processID");
  objc_msgSend(v16, "timebaseRatio");
  objc_msgSend(v5, "_clientSessionForPID:timebaseRatio:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v16, "beginEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProcessName:", v11);

  }
  v12 = objc_msgSend(v16, "signpostId");
  objc_msgSend(v16, "timebaseRatio");
  objc_msgSend(v8, "_metalLayerSessionForID:timebaseRatio:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_ingestConfigurationInterval:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SSCAMetalLayerClientSessionAccumulator mutableProcessingErrors](self, "mutableProcessingErrors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v14);

  }
}

- (void)_processOnGlassDrawableInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (-[SSCAMetalLayerClientSessionAccumulator includeTimelines](self, "includeTimelines"))
  {
    -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "processID");
    objc_msgSend(v16, "timebaseRatio");
    objc_msgSend(v5, "_clientSessionForPID:timebaseRatio:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v16, "beginEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "processName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setProcessName:", v11);

    }
    v12 = objc_msgSend(v16, "signpostId");
    objc_msgSend(v16, "timebaseRatio");
    objc_msgSend(v8, "_metalLayerSessionForID:timebaseRatio:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_ingestOnGlassDrawableInterval:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[SSCAMetalLayerClientSessionAccumulator mutableProcessingErrors](self, "mutableProcessingErrors");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

    }
  }

}

- (void)_processFPInterval:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  SignpostAggregation *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", kSSCAMLFramePacingLayerMetadataName);

  if (v6)
  {
    -[SSCAMetalLayerClientSessionAccumulator _processLayerMetadata:](self, "_processLayerMetadata:", v4);
  }
  else
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", kSSCAMLFramePacingOnGlassDrawableIntervalName);

    if (v8)
    {
      -[SSCAMetalLayerClientSessionAccumulator _processOnGlassDrawableInterval:](self, "_processOnGlassDrawableInterval:", v4);
    }
    else
    {
      objc_msgSend(v4, "subsystem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[SSInflightCAMetalLayerIntervalStats isInterestingAggregationSubsystem:category:name:](SSInflightCAMetalLayerIntervalStats, "isInterestingAggregationSubsystem:category:name:", v9, v10, v11);

      if (v12)
      {
        v27 = 0;
        v13 = -[SignpostAggregation initWithInterval:errorsOut:]([SignpostAggregation alloc], "initWithInterval:errorsOut:", v4, &v27);
        v14 = v27;
        if (objc_msgSend(v14, "count"))
        {
          -[SSCAMetalLayerClientSessionAccumulator mutableProcessingErrors](self, "mutableProcessingErrors");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObjectsFromArray:", v14);
        }
        else
        {
          -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "beginEvent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "processID");
          objc_msgSend(v4, "timebaseRatio");
          objc_msgSend(v17, "_clientSessionForPID:timebaseRatio:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "processName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            objc_msgSend(v4, "beginEvent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "processName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setProcessName:", v22);

          }
          v23 = objc_msgSend(v4, "signpostId");
          objc_msgSend(v4, "timebaseRatio");
          objc_msgSend(v15, "_metalLayerSessionForID:timebaseRatio:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "timebaseRatio");
          objc_msgSend(v24, "_ingestAggregation:timebaseRatio:parentClientSession:parentAccumulator:", v13, v15, self);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            -[SSCAMetalLayerClientSessionAccumulator mutableProcessingErrors](self, "mutableProcessingErrors");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObjectsFromArray:", v25);

          }
        }

      }
    }
  }

}

- (void)processInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](self, "mutableBootSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_updateDates:", v9);
  objc_msgSend(v9, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", kSSCAMLFramePacingSubsystem) & 1) != 0)
  {
    objc_msgSend(v9, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", kSSCAMLFramePacingCategory);

    if (v8)
      -[SSCAMetalLayerClientSessionAccumulator _processFPInterval:](self, "_processFPInterval:", v9);
  }
  else
  {

  }
}

- (void)_processFPEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  id v29;
  __CFString *v30;
  const __CFString *v31;
  id v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD block[5];
  id v44;
  id v45;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", kSSCAMLFramePacingClientBundleInfo);

  if (v6)
  {
    -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](self, "mutableBootSessions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "processID");
    objc_msgSend(v4, "timebaseRatio");
    objc_msgSend(v8, "_clientSessionForPID:timebaseRatio:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "bundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v10, "bundleVersion");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v10, "bundleShortVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_13;
LABEL_29:

        goto LABEL_30;
      }

    }
LABEL_13:
    objc_msgSend(v4, "placeholderTokenValueDictForTokenKey:", CFSTR("name"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    _objectValueForKey((uint64_t)CFSTR("BundleID"), v25, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (const __CFString *)v26;
    else
      v28 = CFSTR("Unknown");
    objc_msgSend(v10, "setBundleID:", v28);

    v29 = v25;
    objc_opt_class();
    _objectValueForKey((uint64_t)CFSTR("BundleVersion"), v29, 1);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v30)
      v31 = v30;
    else
      v31 = CFSTR("Unknown");
    objc_msgSend(v10, "setBundleVersion:", v31);

    v32 = v29;
    objc_opt_class();
    _objectValueForKey((uint64_t)CFSTR("BundleShortVersion"), v32, 1);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v33)
      v34 = v33;
    else
      v34 = CFSTR("Unknown");
    objc_msgSend(v10, "setBundleShortVersion:", v34);

    objc_msgSend(v10, "processName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      objc_msgSend(v4, "processName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProcessName:", v36);

    }
    goto LABEL_29;
  }
  objc_msgSend(v4, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", kSSCAMLFramePacingClientSystemResourceUsage);

  if (v17)
  {
    +[SSCAMetalLayerClientResourceUsageSnapshot snapshotFromSignpostEvent:](SSCAMetalLayerClientResourceUsageSnapshot, "snapshotFromSignpostEvent:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](self, "mutableBootSessions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v4, "processID");
      objc_msgSend(v4, "timebaseRatio");
      objc_msgSend(v19, "_clientSessionForPID:timebaseRatio:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "_handleResourceSnapshot:", v10);
      -[SSCAMetalLayerClientSessionAccumulator resourceUsageStatsProcessingBlock](self, "resourceUsageStatsProcessingBlock");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22 || !v21)
        goto LABEL_28;
      -[SSCAMetalLayerClientSessionAccumulator processingBlockTargetQueue](self, "processingBlockTargetQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[SSCAMetalLayerClientSessionAccumulator processingBlockTargetQueue](self, "processingBlockTargetQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __58__SSCAMetalLayerClientSessionAccumulator__processFPEvent___block_invoke;
        block[3] = &unk_1E46017E0;
        block[4] = self;
        v44 = v21;
        v45 = v10;
        dispatch_async(v24, block);

LABEL_28:
        goto LABEL_29;
      }
      -[SSCAMetalLayerClientSessionAccumulator resourceUsageStatsProcessingBlock](self, "resourceUsageStatsProcessingBlock");
      v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v21, "processID");
      objc_msgSend(v21, "processName");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleVersion");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundleShortVersion");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, uint64_t, void *, void *, void *, void *, void *))v37)[2](v37, v38, v39, v40, v41, v42, v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, CFSTR("Malformed resource usage snapshot event"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerClientSessionAccumulator mutableProcessingErrors](self, "mutableProcessingErrors");
      v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addObject:", v21);
    }

    goto LABEL_28;
  }
LABEL_30:

}

void __58__SSCAMetalLayerClientSessionAccumulator__processFPEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, void *, void *, void *, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "resourceUsageStatsProcessingBlock");
  v7 = (void (**)(id, uint64_t, void *, void *, void *, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 40), "processID");
  objc_msgSend(*(id *)(a1 + 40), "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "bundleShortVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v2, v3, v4, v5, v6, *(_QWORD *)(a1 + 48));

}

- (void)processEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](self, "mutableBootSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_updateDates:", v9);
  objc_msgSend(v9, "subsystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", kSSCAMLFramePacingSubsystem) & 1) != 0)
  {
    objc_msgSend(v9, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", kSSCAMLFramePacingCategory);

    if (v8)
      -[SSCAMetalLayerClientSessionAccumulator _processFPEvent:](self, "_processFPEvent:", v9);
  }
  else
  {

  }
}

- (SSCAMetalLayerClientSessionAccumulator)initWithIncludeTimelines:(BOOL)a3
{
  SSCAMetalLayerClientSessionAccumulator *v4;
  SSCAMetalLayerClientSessionAccumulator *v5;
  NSMutableArray *v6;
  NSMutableArray *mutableBootSessions;
  void *v8;
  SSDeviceBootSession *v9;
  NSMutableArray *v10;
  NSMutableArray *mutableProcessingErrors;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SSCAMetalLayerClientSessionAccumulator;
  v4 = -[SSCAMetalLayerClientSessionAccumulator init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_includeTimelines = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableBootSessions = v5->_mutableBootSessions;
    v5->_mutableBootSessions = v6;

    -[SSCAMetalLayerClientSessionAccumulator mutableBootSessions](v5, "mutableBootSessions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SSDeviceBootSession initWithIncludeTimelines:]([SSDeviceBootSession alloc], "initWithIncludeTimelines:", -[SSCAMetalLayerClientSessionAccumulator includeTimelines](v5, "includeTimelines"));
    objc_msgSend(v8, "addObject:", v9);

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableProcessingErrors = v5->_mutableProcessingErrors;
    v5->_mutableProcessingErrors = v10;

  }
  return v5;
}

- (NSDate)earliestDateProcessed
{
  void *v2;
  void *v3;
  void *v4;

  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "earliestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSDate)latestDateProcessed
{
  void *v2;
  void *v3;
  void *v4;

  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SSCAMetalLayerClientSessionAccumulator earliestDateProcessed](self, "earliestDateProcessed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSCAMetalLayerClientSessionAccumulatorKey_EarliestDate);

  -[SSCAMetalLayerClientSessionAccumulator latestDateProcessed](self, "latestDateProcessed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSCAMetalLayerClientSessionAccumulatorKey_LatestDate);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SSCAMetalLayerClientSessionAccumulator includeTimelines](self, "includeTimelines"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, kSSCAMetalLayerClientSessionAccumulatorKey_IncludeTimelines);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kSSCAMetalLayerClientSessionAccumulatorKey_BootSessions);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SSCAMetalLayerClientSessionAccumulator processingErrors](self, "processingErrors", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "localizedDescription");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (const __CFString *)v22;
        else
          v24 = CFSTR("Unknown error");
        objc_msgSend(v16, "addObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, kSSCAMetalLayerClientSessionAccumulatorKey_ProcessingErrors);
  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerClientSessionAccumulator jsonDescription:](self, "jsonDescription:", 3);
}

- (id)coreAnalyticsEvents
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "coreAnalyticsEvents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;

  return v10;
}

+ (id)coreAnalyticsEventName
{
  return CFSTR("com.apple.SignpostSupport.CAMetalLayerClientSession");
}

+ (id)coreAnalyticsProcessingMetadataName
{
  return CFSTR("com.apple.SignpostSupport.CAMetalLayerClientSessionProcessingMetadata");
}

- (NSDictionary)processNameToClientSessions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SSCAMetalLayerClientSessionAccumulator bootSessions](self, "bootSessions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "processNameToClientSessions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __69__SSCAMetalLayerClientSessionAccumulator_processNameToClientSessions__block_invoke;
        v12[3] = &unk_1E4601808;
        v13 = v3;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

void __69__SSCAMetalLayerClientSessionAccumulator_processNameToClientSessions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  else
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);

}

- (id)layerStatsProcessingBlock
{
  return self->_layerStatsProcessingBlock;
}

- (void)setLayerStatsProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)resourceUsageStatsProcessingBlock
{
  return self->_resourceUsageStatsProcessingBlock;
}

- (void)setResourceUsageStatsProcessingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)processingBlockTargetQueue
{
  return self->_processingBlockTargetQueue;
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableBootSessions
{
  return self->_mutableBootSessions;
}

- (NSMutableArray)mutableProcessingErrors
{
  return self->_mutableProcessingErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProcessingErrors, 0);
  objc_storeStrong((id *)&self->_mutableBootSessions, 0);
  objc_storeStrong((id *)&self->_processingBlockTargetQueue, 0);
  objc_storeStrong(&self->_resourceUsageStatsProcessingBlock, 0);
  objc_storeStrong(&self->_layerStatsProcessingBlock, 0);
}

@end
