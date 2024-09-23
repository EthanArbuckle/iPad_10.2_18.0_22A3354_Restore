@implementation SSCAMetalLayerSession

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerSession startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerSession timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerSession endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerSession timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerSession endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerSession startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerSession endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerSession startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerSession startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerSession endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerSession durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerSession startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerSession endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerSession durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (SSCAMetalLayerSession)initWithID:(unint64_t)a3 includeTimelines:(BOOL)a4 timebaseRatio:(double)a5
{
  SSCAMetalLayerSession *v8;
  SSCAMetalLayerSession *v9;
  NSMutableArray *v10;
  NSMutableArray *mutableStatsTimeline;
  NSMutableArray *v12;
  NSMutableArray *mutableConfigurationTimeline;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SSCAMetalLayerSession;
  v8 = -[SSCAMetalLayerSession init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_includeTimelines = a4;
    v8->_layerID = a3;
    v8->_timebaseRatio = a5;
    if (-[SSCAMetalLayerSession includeTimelines](v8, "includeTimelines"))
    {
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      mutableStatsTimeline = v9->_mutableStatsTimeline;
      v9->_mutableStatsTimeline = v10;

    }
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutableConfigurationTimeline = v9->_mutableConfigurationTimeline;
    v9->_mutableConfigurationTimeline = v12;

  }
  return v9;
}

- (SSOnGlassCAMetalDrawableStats)onGlassDrawableIntervalStats
{
  void *v3;
  void *v4;
  SSOnGlassCAMetalDrawableStats *v5;
  void *v6;
  SSOnGlassCAMetalDrawableStats *v7;

  -[SSCAMetalLayerSession cachedStats](self, "cachedStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SSCAMetalLayerSession onGlassDrawableIntervalTimeline](self, "onGlassDrawableIntervalTimeline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = [SSOnGlassCAMetalDrawableStats alloc];
      -[SSCAMetalLayerSession onGlassDrawableIntervalTimeline](self, "onGlassDrawableIntervalTimeline");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[SSOnGlassCAMetalDrawableStats initWithOnGlassDrawableIntervals:](v5, "initWithOnGlassDrawableIntervals:", v6);
      -[SSCAMetalLayerSession setCachedStats:](self, "setCachedStats:", v7);

    }
  }
  -[SSCAMetalLayerSession cachedStats](self, "cachedStats");
  return (SSOnGlassCAMetalDrawableStats *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_ingestConfigurationInterval:(id)a3
{
  id v4;
  SSCAMetalLayerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[SSCAMetalLayerConfiguration initWithInterval:]([SSCAMetalLayerConfiguration alloc], "initWithInterval:", v4);

  -[SSCAMetalLayerSession mutableConfigurationTimeline](self, "mutableConfigurationTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "hasEqualConfiguration:", v5))
  {
    objc_msgSend(v7, "updateTimeRange:", v5);
  }
  else
  {
    -[SSCAMetalLayerSession mutableConfigurationTimeline](self, "mutableConfigurationTimeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

  }
  return 0;
}

- (id)_ingestOnGlassDrawableInterval:(id)a3
{
  id v4;
  SSCAMetalLayerOnGlassDrawableInterval *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[SSCAMetalLayerOnGlassDrawableInterval initWithSignpostInterval:]([SSCAMetalLayerOnGlassDrawableInterval alloc], "initWithSignpostInterval:", v4);

  if (v5)
  {
    -[SSCAMetalLayerSession mutableOnGlassDrawableIntervalTimeline](self, "mutableOnGlassDrawableIntervalTimeline");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[SSCAMetalLayerSession setMutableOnGlassDrawableIntervalTimeline:](self, "setMutableOnGlassDrawableIntervalTimeline:", v7);

    }
    -[SSCAMetalLayerSession mutableOnGlassDrawableIntervalTimeline](self, "mutableOnGlassDrawableIntervalTimeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, CFSTR("Malformed on-glass CAMetalDrawable interval"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_ingestAggregation:(id)a3 timebaseRatio:(double)a4 parentClientSession:(id)a5 parentAccumulator:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *totalSessionStats;
  SSInflightCAMetalLayerIntervalStats *v22;
  void *v23;
  void *v24;
  void *v25;
  SSCAMetalLayerStats *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v29;
  SSCAMetalLayerStats *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v36;
  void *v37;
  unsigned int v38;
  SSCAMetalLayerStats *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  _QWORD block[4];
  id v44;
  SSCAMetalLayerSession *v45;
  SSCAMetalLayerStats *v46;
  void (**v47)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  char v48;
  id v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "subsystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[SSInflightCAMetalLayerIntervalStats isInterestingAggregationSubsystem:category:name:](SSInflightCAMetalLayerIntervalStats, "isInterestingAggregationSubsystem:category:name:", v13, v14, v15);

  if (v16)
  {
    -[SSCAMetalLayerSession inFlightStats](self, "inFlightStats");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      || (v49 = 0,
          v22 = -[SSInflightCAMetalLayerIntervalStats initWithAggregation:parentSession:timebaseRatio:errorOut:]([SSInflightCAMetalLayerIntervalStats alloc], "initWithAggregation:parentSession:timebaseRatio:errorOut:", v10, self, &v49, a4), v19 = v49, -[SSCAMetalLayerSession setInFlightStats:](self, "setInFlightStats:", v22), v22, !v19))
    {
      v48 = 0;
      -[SSCAMetalLayerSession inFlightStats](self, "inFlightStats");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ingestAggregation:isFinalizedOut:", v10, &v48);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v19, "count"))
      {
        if (v48)
        {
          -[SSCAMetalLayerSession inFlightStats](self, "inFlightStats");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSCAMetalLayerSession setInFlightStats:](self, "setInFlightStats:", 0);
          -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "accumulateFinishedInFlightStats:", v23);
            totalSessionStats = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(totalSessionStats, "count"))
            {

              goto LABEL_27;
            }
            -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "_dropOverallIntervals");

          }
          else
          {
            v26 = -[SSCAMetalLayerStats initWithInFlightStats:]([SSCAMetalLayerStats alloc], "initWithInFlightStats:", v23);
            totalSessionStats = self->_totalSessionStats;
            self->_totalSessionStats = v26;
          }

          objc_msgSend(v12, "layerStatsProcessingBlock");
          v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "processingBlockTargetQueue");
          v29 = objc_claimAutoreleasedReturnValue();
          if (-[SSCAMetalLayerSession includeTimelines](self, "includeTimelines") || v28)
          {
            v30 = -[SSCAMetalLayerStats initWithInFlightStats:]([SSCAMetalLayerStats alloc], "initWithInFlightStats:", v23);
            if (v28)
            {
              if (v29)
              {
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __96__SSCAMetalLayerSession__ingestAggregation_timebaseRatio_parentClientSession_parentAccumulator___block_invoke;
                block[3] = &unk_1E4601768;
                v47 = v28;
                v44 = v11;
                v45 = self;
                v46 = v30;
                dispatch_async(v29, block);

                v31 = v47;
              }
              else
              {
                v38 = objc_msgSend(v11, "processID");
                objc_msgSend(v11, "processName");
                v42 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "bundleID");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "bundleVersion");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "bundleShortVersion");
                v39 = v30;
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = -[SSCAMetalLayerSession layerID](self, "layerID");
                -[SSCAMetalLayerSession configurationTimeline](self, "configurationTimeline");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "lastObject");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, void *, SSCAMetalLayerStats *))v28)[2](v28, v38, v42, v41, v40, v32, v36, v33, v39);

                v30 = v39;
                v31 = (void *)v42;
              }

            }
            if (-[SSCAMetalLayerSession includeTimelines](self, "includeTimelines"))
            {
              -[SSCAMetalLayerSession mutableStatsTimeline](self, "mutableStatsTimeline");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v30);

            }
          }

        }
        totalSessionStats = 0;
        goto LABEL_27;
      }
      -[SSCAMetalLayerSession setInFlightStats:](self, "setInFlightStats:", 0);
      v20 = v19;
    }
    else
    {
      v50[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    totalSessionStats = v20;
LABEL_27:

    goto LABEL_28;
  }
  totalSessionStats = 0;
LABEL_28:

  return totalSessionStats;
}

void __96__SSCAMetalLayerSession__ingestAggregation_timebaseRatio_parentClientSession_parentAccumulator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = objc_msgSend(*(id *)(a1 + 32), "processID");
  objc_msgSend(*(id *)(a1 + 32), "processName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleShortVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 40), "layerID");
  objc_msgSend(*(id *)(a1 + 40), "configurationTimeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, v10, v4, v5, v6, v7, v9, *(_QWORD *)(a1 + 48));

}

- (id)_dictionaryRepresentation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  _timeIntervalDict(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerSession layerID](self, "layerID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kSSCAMLSessionKey_LayerID);

  -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, kSSCAMLSessionKey_TotalSessionStats);

  }
  -[SSCAMetalLayerSession configurationTimeline](self, "configurationTimeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[SSCAMetalLayerSession configurationTimeline](self, "configurationTimeline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v50;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v17), "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v15);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, kSSCAMLSessionKey_ConfigurationTimeline);
  }
  if (v3)
  {
    -[SSCAMetalLayerSession statsTimeline](self, "statsTimeline");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    if (v20)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[SSCAMetalLayerSession statsTimeline](self, "statsTimeline");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v46;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v46 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v26), "dictionaryRepresentation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v27);

            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        }
        while (v24);
      }

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, kSSCAMLSessionKey_StatsTimeline);
    }
    -[SSCAMetalLayerSession onGlassDrawableIntervalTimeline](self, "onGlassDrawableIntervalTimeline");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      -[SSCAMetalLayerSession onGlassDrawableIntervalTimeline](self, "onGlassDrawableIntervalTimeline", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v42;
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v42 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v35), "dictionaryRepresentation");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v36);

            ++v35;
          }
          while (v33 != v35);
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v33);
      }

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, kSSCAMLSessionKey_OnGlassDrawableTimeline);
    }
  }
  -[SSCAMetalLayerSession onGlassDrawableIntervalStats](self, "onGlassDrawableIntervalStats");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[SSCAMetalLayerSession onGlassDrawableIntervalStats](self, "onGlassDrawableIntervalStats");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, kSSCAMLSessionKey_OnGlassDrawableStats);

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return -[SSCAMetalLayerSession _dictionaryRepresentation:](self, "_dictionaryRepresentation:", 1);
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerSession jsonDescription:](self, "jsonDescription:", 3);
}

- (id)_sessionFromFilteredResults:(id)a3 configurationTimeline:(id)a4 errorOut:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  SSCAMetalLayerSession *v12;
  unint64_t v13;
  id *v14;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "count") || objc_msgSend(v9, "count"))
  {
    +[SSCAMetalLayerStats totalStatsFromStatsArray:errorOut:](SSCAMetalLayerStats, "totalStatsFromStatsArray:errorOut:", v9, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = [SSCAMetalLayerSession alloc];
      v13 = -[SSCAMetalLayerSession layerID](self, "layerID");
      -[SSCAMetalLayerSession timebaseRatio](self, "timebaseRatio");
      v14 = -[SSCAMetalLayerSession initWithID:includeTimelines:timebaseRatio:](v12, "initWithID:includeTimelines:timebaseRatio:", v13, 1);
      objc_storeStrong(v14 + 3, v11);
      objc_storeStrong(v14 + 6, a3);
      objc_storeStrong(v14 + 7, a4);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)layerSessionFilteredToStartDate:(id)a3 endDate:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  unsigned int v10;
  SSCAMetalLayerSession *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = _dateRangeIntersectionWithValidation(self, v8, v9, a5);
  v11 = 0;
  if (v10 >= 2 && v10 != 6)
  {
    if (v10 == 3)
    {
      v11 = self;
    }
    else
    {
      -[SSCAMetalLayerSession configurationTimeline](self, "configurationTimeline");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      _intervalsIntersectingDateRange(v8, v9, v12, 0, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;

      if (a5 && v14)
      {
        v11 = 0;
        *a5 = objc_retainAutorelease(v14);
      }
      else
      {
        -[SSCAMetalLayerSession statsTimeline](self, "statsTimeline");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        _intervalsIntersectingDateRange(v8, v9, v15, 1, &v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v19;

        if (a5 && v17)
        {
          v11 = 0;
          *a5 = objc_retainAutorelease(v17);
        }
        else
        {
          -[SSCAMetalLayerSession _sessionFromFilteredResults:configurationTimeline:errorOut:](self, "_sessionFromFilteredResults:configurationTimeline:errorOut:", v16, v13, a5);
          v11 = (SSCAMetalLayerSession *)objc_claimAutoreleasedReturnValue();
        }

      }
    }
  }

  return v11;
}

- (id)layerSessionFilteredToStartMCT:(unint64_t)a3 endMCT:(unint64_t)a4 errorOut:(id *)a5
{
  unsigned int v9;
  SSCAMetalLayerSession *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = _mctIntersectionWithValidation(self, a3, a4, a5);
  v10 = 0;
  if (v9 >= 2 && v9 != 6)
  {
    if (v9 == 3)
    {
      v10 = self;
    }
    else
    {
      -[SSCAMetalLayerSession configurationTimeline](self, "configurationTimeline");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _intervalsIntersectingMCTInterval(a3, a4, v11, 0, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[SSCAMetalLayerSession statsTimeline](self, "statsTimeline");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _intervalsIntersectingMCTInterval(a3, a4, v13, 1, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[SSCAMetalLayerSession _sessionFromFilteredResults:configurationTimeline:errorOut:](self, "_sessionFromFilteredResults:configurationTimeline:errorOut:", v14, v12, a5);
      v10 = (SSCAMetalLayerSession *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v10;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (unint64_t)startMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startMachContinuousTime");

  return v3;
}

- (unint64_t)endMachContinuousTime
{
  void *v2;
  unint64_t v3;

  -[SSCAMetalLayerSession totalSessionStats](self, "totalSessionStats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "endMachContinuousTime");

  return v3;
}

- (unint64_t)layerID
{
  return self->_layerID;
}

- (SSCAMetalLayerStats)totalSessionStats
{
  return self->_totalSessionStats;
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (SSInflightCAMetalLayerIntervalStats)inFlightStats
{
  return self->_inFlightStats;
}

- (void)setInFlightStats:(id)a3
{
  objc_storeStrong((id *)&self->_inFlightStats, a3);
}

- (NSMutableArray)mutableStatsTimeline
{
  return self->_mutableStatsTimeline;
}

- (NSMutableArray)mutableConfigurationTimeline
{
  return self->_mutableConfigurationTimeline;
}

- (NSMutableArray)mutableOnGlassDrawableIntervalTimeline
{
  return self->_mutableOnGlassDrawableIntervalTimeline;
}

- (void)setMutableOnGlassDrawableIntervalTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_mutableOnGlassDrawableIntervalTimeline, a3);
}

- (SSOnGlassCAMetalDrawableStats)cachedStats
{
  return self->_cachedStats;
}

- (void)setCachedStats:(id)a3
{
  objc_storeStrong((id *)&self->_cachedStats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStats, 0);
  objc_storeStrong((id *)&self->_mutableOnGlassDrawableIntervalTimeline, 0);
  objc_storeStrong((id *)&self->_mutableConfigurationTimeline, 0);
  objc_storeStrong((id *)&self->_mutableStatsTimeline, 0);
  objc_storeStrong((id *)&self->_inFlightStats, 0);
  objc_storeStrong((id *)&self->_totalSessionStats, 0);
}

@end
