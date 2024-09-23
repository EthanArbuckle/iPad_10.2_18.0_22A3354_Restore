@implementation SignpostCAProcessStallAggregation

- (void)_iterateTypeStatsWithBlock:(id)a3
{
  unsigned __int8 v4;
  unsigned int v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v7 = (void (**)(id, _QWORD, void *))a3;
  v4 = 0;
  do
  {
    v5 = v4;
    -[SignpostCAProcessStallAggregation _statsForType:initIfMissing:](self, "_statsForType:initIfMissing:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7[2](v7, v4, v6);

    ++v4;
  }
  while (v5 < 0xA);

}

- (unint64_t)_totalStallDurationNs
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SignpostCAProcessStallAggregation__totalStallDurationNs__block_invoke;
  v4[3] = &unk_1E4601648;
  v4[4] = &v5;
  -[SignpostCAProcessStallAggregation _iterateTypeStatsWithBlock:](self, "_iterateTypeStatsWithBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__SignpostCAProcessStallAggregation__totalStallDurationNs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "totalIntervalDurationNs");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)_initAsSystemAggregation
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SignpostCAProcessStallAggregation;
  result = -[SignpostCAProcessStallAggregation init](&v3, sel_init);
  if (result)
    *((_BYTE *)result + 8) = 1;
  return result;
}

- (id)_initWithProcessExecutablePath:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v7;
  SignpostCAProcessStallAggregation *v8;
  SignpostCAProcessStallAggregation *v9;
  uint64_t v10;
  NSString *processName;
  uint64_t v12;
  NSMutableSet *pids;
  NSMutableSet *v14;
  void *v15;
  objc_super v17;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SignpostCAProcessStallAggregation;
  v8 = -[SignpostCAProcessStallAggregation init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_processExecutablePath, a3);
    objc_msgSend(v7, "lastPathComponent");
    v10 = objc_claimAutoreleasedReturnValue();
    processName = v9->_processName;
    v9->_processName = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    pids = v9->_pids;
    v9->_pids = (NSMutableSet *)v12;

    v14 = v9->_pids;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v14, "addObject:", v15);

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostCAProcessStallAggregation *v4;
  uint64_t v5;
  NSString *processName;
  uint64_t v7;
  NSString *processExecutablePath;
  void *v9;
  uint64_t v10;
  NSMutableSet *pids;
  void *v12;
  uint64_t v13;
  SignpostCAIntervalAggregationStats *longCommitStats;
  void *v15;
  uint64_t v16;
  SignpostCAIntervalAggregationStats *longHIDLatencyStats;
  void *v18;
  uint64_t v19;
  SignpostCAIntervalAggregationStats *longFrameLatencyStats;
  void *v21;
  uint64_t v22;
  SignpostCAIntervalAggregationStats *longRenderForTimeStats;
  void *v24;
  uint64_t v25;
  SignpostCAIntervalAggregationStats *longTransactionLifetimeStats;
  void *v27;
  uint64_t v28;
  SignpostCAIntervalAggregationStats *longFrameLifetimeStats;
  void *v30;
  uint64_t v31;
  SignpostCAIntervalAggregationStats *longResponsibleFrameLifetimeStats;
  void *v33;
  uint64_t v34;
  SignpostCAIntervalAggregationStats *glitchStats;
  void *v36;
  uint64_t v37;
  SignpostCAIntervalAggregationStats *responsibleGlitchStats;
  uint64_t v39;
  SignpostCAIntervalAggregationStats *firstFrameGlitchStats;
  void *v41;
  uint64_t v42;
  SignpostCAIntervalAggregationStats *responsibleFirstFrameGlitchStats;
  void *v44;
  uint64_t v45;
  SignpostCAIntervalAggregationStats *responsibleNonFirstFrameNonSkipGlitchStats;
  void *v47;
  uint64_t v48;
  SignpostCAIntervalAggregationStats *responsibleNonFirstFrameNonSkipPerceivedGlitchStats;

  v4 = -[SignpostCAProcessStallAggregation init](+[SignpostCAProcessStallAggregation allocWithZone:](SignpostCAProcessStallAggregation, "allocWithZone:", a3), "init");
  -[SignpostCAProcessStallAggregation processName](self, "processName");
  v5 = objc_claimAutoreleasedReturnValue();
  processName = v4->_processName;
  v4->_processName = (NSString *)v5;

  -[SignpostCAProcessStallAggregation processExecutablePath](self, "processExecutablePath");
  v7 = objc_claimAutoreleasedReturnValue();
  processExecutablePath = v4->_processExecutablePath;
  v4->_processExecutablePath = (NSString *)v7;

  -[SignpostCAProcessStallAggregation pids](self, "pids");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  pids = v4->_pids;
  v4->_pids = (NSMutableSet *)v10;

  v4->_isSystemAggregation = -[SignpostCAProcessStallAggregation isSystemAggregation](self, "isSystemAggregation");
  -[SignpostCAProcessStallAggregation longCommitStats](self, "longCommitStats");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copy");
  longCommitStats = v4->_longCommitStats;
  v4->_longCommitStats = (SignpostCAIntervalAggregationStats *)v13;

  -[SignpostCAProcessStallAggregation longHIDLatencyStats](self, "longHIDLatencyStats");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "copy");
  longHIDLatencyStats = v4->_longHIDLatencyStats;
  v4->_longHIDLatencyStats = (SignpostCAIntervalAggregationStats *)v16;

  -[SignpostCAProcessStallAggregation longFrameLatencyStats](self, "longFrameLatencyStats");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  longFrameLatencyStats = v4->_longFrameLatencyStats;
  v4->_longFrameLatencyStats = (SignpostCAIntervalAggregationStats *)v19;

  -[SignpostCAProcessStallAggregation longRenderForTimeStats](self, "longRenderForTimeStats");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  longRenderForTimeStats = v4->_longRenderForTimeStats;
  v4->_longRenderForTimeStats = (SignpostCAIntervalAggregationStats *)v22;

  -[SignpostCAProcessStallAggregation longTransactionLifetimeStats](self, "longTransactionLifetimeStats");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  longTransactionLifetimeStats = v4->_longTransactionLifetimeStats;
  v4->_longTransactionLifetimeStats = (SignpostCAIntervalAggregationStats *)v25;

  -[SignpostCAProcessStallAggregation longFrameLifetimeStats](self, "longFrameLifetimeStats");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  longFrameLifetimeStats = v4->_longFrameLifetimeStats;
  v4->_longFrameLifetimeStats = (SignpostCAIntervalAggregationStats *)v28;

  -[SignpostCAProcessStallAggregation longResponsibleFrameLifetimeStats](self, "longResponsibleFrameLifetimeStats");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copy");
  longResponsibleFrameLifetimeStats = v4->_longResponsibleFrameLifetimeStats;
  v4->_longResponsibleFrameLifetimeStats = (SignpostCAIntervalAggregationStats *)v31;

  -[SignpostCAProcessStallAggregation glitchStats](self, "glitchStats");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copy");
  glitchStats = v4->_glitchStats;
  v4->_glitchStats = (SignpostCAIntervalAggregationStats *)v34;

  -[SignpostCAProcessStallAggregation responsibleGlitchStats](self, "responsibleGlitchStats");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "copy");
  responsibleGlitchStats = v4->_responsibleGlitchStats;
  v4->_responsibleGlitchStats = (SignpostCAIntervalAggregationStats *)v37;

  -[SignpostCAProcessStallAggregation firstFrameGlitchStats](self, "firstFrameGlitchStats");
  v39 = objc_claimAutoreleasedReturnValue();
  firstFrameGlitchStats = v4->_firstFrameGlitchStats;
  v4->_firstFrameGlitchStats = (SignpostCAIntervalAggregationStats *)v39;

  -[SignpostCAProcessStallAggregation responsibleFirstFrameGlitchStats](self, "responsibleFirstFrameGlitchStats");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "copy");
  responsibleFirstFrameGlitchStats = v4->_responsibleFirstFrameGlitchStats;
  v4->_responsibleFirstFrameGlitchStats = (SignpostCAIntervalAggregationStats *)v42;

  -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipGlitchStats](self, "responsibleNonFirstFrameNonSkipGlitchStats");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "copy");
  responsibleNonFirstFrameNonSkipGlitchStats = v4->_responsibleNonFirstFrameNonSkipGlitchStats;
  v4->_responsibleNonFirstFrameNonSkipGlitchStats = (SignpostCAIntervalAggregationStats *)v45;

  -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipPerceivedGlitchStats](self, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "copy");
  responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v4->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
  v4->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats = (SignpostCAIntervalAggregationStats *)v48;

  return v4;
}

- (id)_statsForType:(unsigned __int8)a3 initIfMissing:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SignpostCAProcessStallAggregation *v8;
  void *v9;
  SignpostCAIntervalAggregationStats *v10;
  SignpostCAIntervalAggregationStats *longCommitStats;
  void *v13;
  SignpostCAIntervalAggregationStats *v14;
  SignpostCAIntervalAggregationStats *longHIDLatencyStats;
  void *v16;
  SignpostCAIntervalAggregationStats *v17;
  SignpostCAIntervalAggregationStats *longFrameLatencyStats;
  void *v19;
  SignpostCAIntervalAggregationStats *v20;
  SignpostCAIntervalAggregationStats *longRenderForTimeStats;
  void *v22;
  SignpostCAIntervalAggregationStats *v23;
  SignpostCAIntervalAggregationStats *longTransactionLifetimeStats;
  void *v25;
  SignpostCAIntervalAggregationStats *v26;
  SignpostCAIntervalAggregationStats *longFrameLifetimeStats;
  void *v28;
  SignpostCAIntervalAggregationStats *v29;
  SignpostCAIntervalAggregationStats *longResponsibleFrameLifetimeStats;
  void *v31;
  SignpostCAIntervalAggregationStats *v32;
  SignpostCAIntervalAggregationStats *glitchStats;
  void *v34;
  SignpostCAIntervalAggregationStats *v35;
  SignpostCAIntervalAggregationStats *responsibleGlitchStats;
  void *v37;
  SignpostCAIntervalAggregationStats *v38;
  SignpostCAIntervalAggregationStats *firstFrameGlitchStats;
  void *v40;
  SignpostCAIntervalAggregationStats *v41;
  SignpostCAIntervalAggregationStats *responsibleFirstFrameGlitchStats;
  void *v43;
  SignpostCAIntervalAggregationStats *v44;
  SignpostCAIntervalAggregationStats *responsibleNonFirstFrameNonSkipGlitchStats;
  void *v46;
  SignpostCAIntervalAggregationStats *v47;
  SignpostCAIntervalAggregationStats *responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
  uint64_t v49;
  uint64_t v50;

  v49 = v5;
  v50 = v4;
  v8 = self;
  switch(a3)
  {
    case 0u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longCommitStats](self, "longCommitStats");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          v10 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longCommitStats = v8->_longCommitStats;
          v8->_longCommitStats = v10;

        }
      }
      -[SignpostCAProcessStallAggregation longCommitStats](v8, "longCommitStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 1u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longHIDLatencyStats](self, "longHIDLatencyStats");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longHIDLatencyStats = v8->_longHIDLatencyStats;
          v8->_longHIDLatencyStats = v14;

        }
      }
      -[SignpostCAProcessStallAggregation longHIDLatencyStats](v8, "longHIDLatencyStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longFrameLatencyStats](self, "longFrameLatencyStats");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v17 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longFrameLatencyStats = v8->_longFrameLatencyStats;
          v8->_longFrameLatencyStats = v17;

        }
      }
      -[SignpostCAProcessStallAggregation longFrameLatencyStats](v8, "longFrameLatencyStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 3u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longRenderForTimeStats](self, "longRenderForTimeStats");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longRenderForTimeStats = v8->_longRenderForTimeStats;
          v8->_longRenderForTimeStats = v20;

        }
      }
      -[SignpostCAProcessStallAggregation longRenderForTimeStats](v8, "longRenderForTimeStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 4u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longTransactionLifetimeStats](self, "longTransactionLifetimeStats");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v23 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longTransactionLifetimeStats = v8->_longTransactionLifetimeStats;
          v8->_longTransactionLifetimeStats = v23;

        }
      }
      -[SignpostCAProcessStallAggregation longTransactionLifetimeStats](v8, "longTransactionLifetimeStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 5u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longFrameLifetimeStats](self, "longFrameLifetimeStats");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v26 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longFrameLifetimeStats = v8->_longFrameLifetimeStats;
          v8->_longFrameLifetimeStats = v26;

        }
      }
      -[SignpostCAProcessStallAggregation longFrameLifetimeStats](v8, "longFrameLifetimeStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 6u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation longResponsibleFrameLifetimeStats](self, "longResponsibleFrameLifetimeStats");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          v29 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          longResponsibleFrameLifetimeStats = v8->_longResponsibleFrameLifetimeStats;
          v8->_longResponsibleFrameLifetimeStats = v29;

        }
      }
      -[SignpostCAProcessStallAggregation longResponsibleFrameLifetimeStats](v8, "longResponsibleFrameLifetimeStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 7u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation glitchStats](self, "glitchStats");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
        {
          v32 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          glitchStats = v8->_glitchStats;
          v8->_glitchStats = v32;

        }
      }
      -[SignpostCAProcessStallAggregation glitchStats](v8, "glitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 8u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation responsibleGlitchStats](self, "responsibleGlitchStats");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34)
        {
          v35 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleGlitchStats = v8->_responsibleGlitchStats;
          v8->_responsibleGlitchStats = v35;

        }
      }
      -[SignpostCAProcessStallAggregation responsibleGlitchStats](v8, "responsibleGlitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 9u:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation firstFrameGlitchStats](self, "firstFrameGlitchStats");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
          v38 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          firstFrameGlitchStats = v8->_firstFrameGlitchStats;
          v8->_firstFrameGlitchStats = v38;

        }
      }
      -[SignpostCAProcessStallAggregation firstFrameGlitchStats](v8, "firstFrameGlitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xAu:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation responsibleFirstFrameGlitchStats](self, "responsibleFirstFrameGlitchStats");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          v41 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleFirstFrameGlitchStats = v8->_responsibleFirstFrameGlitchStats;
          v8->_responsibleFirstFrameGlitchStats = v41;

        }
      }
      -[SignpostCAProcessStallAggregation responsibleFirstFrameGlitchStats](v8, "responsibleFirstFrameGlitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xBu:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipGlitchStats](self, "responsibleNonFirstFrameNonSkipGlitchStats");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v43)
        {
          v44 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleNonFirstFrameNonSkipGlitchStats = v8->_responsibleNonFirstFrameNonSkipGlitchStats;
          v8->_responsibleNonFirstFrameNonSkipGlitchStats = v44;

        }
      }
      -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipGlitchStats](v8, "responsibleNonFirstFrameNonSkipGlitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    case 0xCu:
      if (a4)
      {
        -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipPerceivedGlitchStats](self, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {
          v47 = objc_alloc_init(SignpostCAIntervalAggregationStats);
          responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v8->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
          v8->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats = v47;

        }
      }
      -[SignpostCAProcessStallAggregation responsibleNonFirstFrameNonSkipPerceivedGlitchStats](v8, "responsibleNonFirstFrameNonSkipPerceivedGlitchStats", v49, v50, v6, v7);
      self = (SignpostCAProcessStallAggregation *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return self;
  }
  return self;
}

- (void)_addDuration:(unint64_t)a3 ofType:(unsigned __int8)a4
{
  id v5;

  -[SignpostCAProcessStallAggregation _statsForType:initIfMissing:](self, "_statsForType:initIfMissing:", a4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addDurationNsToAggregation:", a3);

}

- (void)_addOtherProcessStallAggregation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SignpostCAProcessStallAggregation__addOtherProcessStallAggregation___block_invoke;
  v10[3] = &unk_1E4601670;
  v10[4] = self;
  objc_msgSend(v4, "_iterateTypeStatsWithBlock:", v10);
  objc_msgSend(v4, "pids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[SignpostCAProcessStallAggregation pids](self, "pids");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pids");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
}

void __70__SignpostCAProcessStallAggregation__addOtherProcessStallAggregation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "_statsForType:initIfMissing:", a2, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_addAggregationStats:", v5);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[SignpostCAProcessStallAggregation isSystemAggregation](self, "isSystemAggregation"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("System Aggregation:\n"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[SignpostCAProcessStallAggregation pids](self, "pids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v26;
      v8 = 1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(v5);
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "unsignedIntegerValue");
          if ((v8 & 1) != 0)
            v11 = CFSTR("%lu");
          else
            v11 = CFSTR(", %lu");
          objc_msgSend(v4, "appendFormat:", v11, v10);
          v8 = 0;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v8 = 0;
      }
      while (v6);
    }

    v12 = (void *)MEMORY[0x1E0CB37A0];
    -[SignpostCAProcessStallAggregation processName](self, "processName");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("Unknown Process");
    if (v13)
      v15 = (const __CFString *)v13;
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ [%@]:\n"), v15, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__SignpostCAProcessStallAggregation_description__block_invoke;
  v18[3] = &unk_1E4601698;
  v16 = v3;
  v19 = v16;
  v20 = &v21;
  -[SignpostCAProcessStallAggregation _iterateTypeStatsWithBlock:](self, "_iterateTypeStatsWithBlock:", v18);
  if (!*((_BYTE *)v22 + 24))
    objc_msgSend(v16, "appendString:", CFSTR("\tNo stalls\n"));

  _Block_object_dispose(&v21, 8);
  return v16;
}

void __48__SignpostCAProcessStallAggregation_description__block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v4;
  const __CFString *v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if ((a2 - 1) > 0xB)
    v5 = CFSTR("Long Commits");
  else
    v5 = off_1E4601700[(char)(a2 - 1)];
  objc_msgSend(a3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\t%@: %@\n"), v5, v6);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)isSystemAggregation
{
  return self->_isSystemAggregation;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processExecutablePath
{
  return self->_processExecutablePath;
}

- (NSMutableSet)pids
{
  return self->_pids;
}

- (SignpostCAIntervalAggregationStats)longCommitStats
{
  return self->_longCommitStats;
}

- (SignpostCAIntervalAggregationStats)longTransactionLifetimeStats
{
  return self->_longTransactionLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)longHIDLatencyStats
{
  return self->_longHIDLatencyStats;
}

- (SignpostCAIntervalAggregationStats)longFrameLatencyStats
{
  return self->_longFrameLatencyStats;
}

- (SignpostCAIntervalAggregationStats)longRenderForTimeStats
{
  return self->_longRenderForTimeStats;
}

- (SignpostCAIntervalAggregationStats)longFrameLifetimeStats
{
  return self->_longFrameLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)longResponsibleFrameLifetimeStats
{
  return self->_longResponsibleFrameLifetimeStats;
}

- (SignpostCAIntervalAggregationStats)glitchStats
{
  return self->_glitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleGlitchStats
{
  return self->_responsibleGlitchStats;
}

- (SignpostCAIntervalAggregationStats)firstFrameGlitchStats
{
  return self->_firstFrameGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleFirstFrameGlitchStats
{
  return self->_responsibleFirstFrameGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipGlitchStats
{
  return self->_responsibleNonFirstFrameNonSkipGlitchStats;
}

- (SignpostCAIntervalAggregationStats)responsibleNonFirstFrameNonSkipPerceivedGlitchStats
{
  return self->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsibleNonFirstFrameNonSkipPerceivedGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleNonFirstFrameNonSkipGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleFirstFrameGlitchStats, 0);
  objc_storeStrong((id *)&self->_firstFrameGlitchStats, 0);
  objc_storeStrong((id *)&self->_responsibleGlitchStats, 0);
  objc_storeStrong((id *)&self->_glitchStats, 0);
  objc_storeStrong((id *)&self->_longResponsibleFrameLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longRenderForTimeStats, 0);
  objc_storeStrong((id *)&self->_longFrameLatencyStats, 0);
  objc_storeStrong((id *)&self->_longHIDLatencyStats, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimeStats, 0);
  objc_storeStrong((id *)&self->_longCommitStats, 0);
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_processExecutablePath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
