@implementation SSInflightCAMetalLayerIntervalStats

- (SSInflightCAMetalLayerIntervalStats)initWithAggregation:(id)a3 parentSession:(id)a4 timebaseRatio:(double)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  SSInflightCAMetalLayerIntervalStats *v12;
  SSInflightCAMetalLayerIntervalStats *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDate *intervalBeginDate;
  uint64_t v18;
  NSDate *intervalEndDate;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SSInflightCAMetalLayerIntervalStats;
  v12 = -[SSInflightCAMetalLayerIntervalStats init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_parentSession, v11);
    objc_msgSend(v10, "rawIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13->_intervalBeginMCT = objc_msgSend(v15, "startMachContinuousTime");
    v13->_intervalEndMCT = objc_msgSend(v15, "endMachContinuousTime");
    objc_msgSend(v15, "beginDate");
    v16 = objc_claimAutoreleasedReturnValue();
    intervalBeginDate = v13->_intervalBeginDate;
    v13->_intervalBeginDate = (NSDate *)v16;

    objc_msgSend(v15, "endDate");
    v18 = objc_claimAutoreleasedReturnValue();
    intervalEndDate = v13->_intervalEndDate;
    v13->_intervalEndDate = (NSDate *)v18;

    v13->_timebaseRatio = a5;
    if (a6)
      *a6 = 0;

  }
  return v13;
}

+ (BOOL)isInterestingAggregationSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  BOOL v9;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "isEqualToString:", kSSCAMLFramePacingSubsystem)
    && objc_msgSend(v7, "isEqualToString:", kSSCAMLFramePacingCategory)
    && ((objc_msgSend(v8, "isEqualToString:", kSSCAMLFramePacingPresentedFrameStatsName) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", kSSCAMLFramePacingSkippedFrameStatsName) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", kSSCAMLFramePacingLateClientPresentStatsName) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", kSSCAMLFramePacingLateOnGlassStatsName));

  return v9;
}

- (id)_checkCollision:(id)a3 existing:(id)a4 label:(id)a5
{
  void *v5;
  void *v6;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Collision on %@ aggregation"), a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_missingGroupError:(id)a3 label:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Aggregation for %@ missing group '%@'"), a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_missingGroupMeasuredValueError:(id)a3 groupName:(id)a4 label:(id)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Aggregation for %@, group '%@', missing values for '%@'"), a5, a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_checkAggregation:(id)a3 forGroupName:(id)a4 withMeasuredValues:(id)a5 label:(id)a6 accumulatedErrors:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(a3, "groupNameToGroupDict");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v30 = v14;
    v31 = v15;
    v18 = v12;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v13;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23);
          objc_msgSend(v17, "measuredValueTypeToMeasuredValueDict");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
          {
            -[SSInflightCAMetalLayerIntervalStats _missingGroupMeasuredValueError:groupName:label:](self, "_missingGroupMeasuredValueError:groupName:label:", v24, v18, v30);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v27);

          }
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v21);
    }

    v12 = v18;
    v13 = v29;
    v14 = v30;
    v15 = v31;
  }
  else
  {
    -[SSInflightCAMetalLayerIntervalStats _missingGroupError:label:](self, "_missingGroupError:label:", v12, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v28);

  }
}

- (void)_checkFrameStatsAggregation:(id)a3 existing:(id)a4 label:(id)a5 accumulatedErrors:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[SSInflightCAMetalLayerIntervalStats _checkCollision:existing:label:](self, "_checkCollision:existing:label:", v12, a4, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v10, "addObject:", v13);

  v14 = kSSCAMLFPGroup_Frames;
  v16[0] = kSSCAMLFPType_TotalEndToEndWalltime;
  v16[1] = kSSCAMLFPType_CPUEndToEndWalltime;
  v16[2] = kSSCAMLFPType_GPUEndToEndWalltime;
  v16[3] = kSSCAMLFPType_TotalOnGPUWalltime;
  v16[4] = kSSCAMLFPType_GPUDoneToCompletion;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:](self, "_checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:", v12, v14, v15, v11, v10);

  -[SSInflightCAMetalLayerIntervalStats _checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:](self, "_checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:", v12, kSSCAMLFPGroup_FrameCommandBuffers, MEMORY[0x1E0C9AA60], v11, v10);
}

- (id)_checkPresentedFramesAggregation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SSInflightCAMetalLayerIntervalStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkFrameStatsAggregation:existing:label:accumulatedErrors:](self, "_checkFrameStatsAggregation:existing:label:accumulatedErrors:", v5, v7, CFSTR("presented frame stats"), v6);

  v8 = kSSCAMLFPGroup_PresentedFrameIntervals;
  v13[0] = kSSCAMLFPType_TimeOnGlass;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:](self, "_checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:", v5, v8, v9, CFSTR("frame-on-glass interval stats"), v6);

  if (objc_msgSend(v6, "count"))
    v10 = v6;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)_ingestPresentedFramesAggregation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SSInflightCAMetalLayerIntervalStats _checkPresentedFramesAggregation:](self, "_checkPresentedFramesAggregation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
  }
  else
  {
    -[SSInflightCAMetalLayerIntervalStats setPresentedFrameStatsAggregation:](self, "setPresentedFrameStatsAggregation:", v4);
    v6 = 0;
  }

  return v6;
}

- (id)_checkSkippedFramesAggregation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[SSInflightCAMetalLayerIntervalStats skippedFrameStatsAggregation](self, "skippedFrameStatsAggregation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkFrameStatsAggregation:existing:label:accumulatedErrors:](self, "_checkFrameStatsAggregation:existing:label:accumulatedErrors:", v5, v7, CFSTR("skipped frame stats"), v6);

  if (objc_msgSend(v6, "count"))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (id)_ingestSkippedFramesAggregation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SSInflightCAMetalLayerIntervalStats _checkSkippedFramesAggregation:](self, "_checkSkippedFramesAggregation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
  }
  else
  {
    -[SSInflightCAMetalLayerIntervalStats setSkippedFrameStatsAggregation:](self, "setSkippedFrameStatsAggregation:", v4);
    v6 = 0;
  }

  return v6;
}

- (id)_checkLatenessAggregation:(id)a3 existing:(id)a4 groupName:(id)a5 label:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E0C99DE8];
  v13 = a5;
  v14 = a4;
  v15 = objc_alloc_init(v12);
  -[SSInflightCAMetalLayerIntervalStats _checkCollision:existing:label:](self, "_checkCollision:existing:label:", v10, v14, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v15, "addObject:", v16);

  v21[0] = kSSCAMLFPType_Lateness;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:](self, "_checkAggregation:forGroupName:withMeasuredValues:label:accumulatedErrors:", v10, v13, v17, v11, v15);

  if (objc_msgSend(v15, "count"))
    v18 = v15;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

- (id)_ingestLateClientPresentAggregation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SSInflightCAMetalLayerIntervalStats lateClientPresentStatsAggregation](self, "lateClientPresentStatsAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkLatenessAggregation:existing:groupName:label:](self, "_checkLatenessAggregation:existing:groupName:label:", v4, v5, kSSCAMLFPGroup_LateClientDrawablePresents, CFSTR("late client drawable present stats"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    -[SSInflightCAMetalLayerIntervalStats setLateClientPresentStatsAggregation:](self, "setLateClientPresentStatsAggregation:", v4);
    v7 = 0;
  }

  return v7;
}

- (id)_ingestLatePresentOnGlassAggregation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SSInflightCAMetalLayerIntervalStats latePresentOnGlassStatsAggregation](self, "latePresentOnGlassStatsAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSInflightCAMetalLayerIntervalStats _checkLatenessAggregation:existing:groupName:label:](self, "_checkLatenessAggregation:existing:groupName:label:", v4, v5, kSSCAMLFPGroup_LateOnGlassPresents, CFSTR("late on-glass present stats"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    -[SSInflightCAMetalLayerIntervalStats setLatePresentOnGlassStatsAggregation:](self, "setLatePresentOnGlassStatsAggregation:", v4);
    v7 = 0;
  }

  return v7;
}

- (id)ingestAggregation:(id)a3 isFinalizedOut:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "rawIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "startMachContinuousTime");
  if (v9 == -[SSInflightCAMetalLayerIntervalStats intervalBeginMCT](self, "intervalBeginMCT")
    && (v10 = objc_msgSend(v8, "endMachContinuousTime"),
        v10 == -[SSInflightCAMetalLayerIntervalStats intervalEndMCT](self, "intervalEndMCT")))
  {
    *a4 = 0;
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", kSSCAMLFramePacingPresentedFrameStatsName);

    if (v12)
    {
      -[SSInflightCAMetalLayerIntervalStats _ingestPresentedFramesAggregation:](self, "_ingestPresentedFramesAggregation:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "count"))
        *a4 = 1;
    }
    else
    {
      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", kSSCAMLFramePacingSkippedFrameStatsName);

      if (v20)
      {
        -[SSInflightCAMetalLayerIntervalStats _ingestSkippedFramesAggregation:](self, "_ingestSkippedFramesAggregation:", v6);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", kSSCAMLFramePacingLateClientPresentStatsName);

        if (v23)
        {
          -[SSInflightCAMetalLayerIntervalStats _ingestLateClientPresentAggregation:](self, "_ingestLateClientPresentAggregation:", v6);
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v6, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", kSSCAMLFramePacingLateOnGlassStatsName);

          if (!v25)
          {
            v13 = 0;
            goto LABEL_7;
          }
          -[SSInflightCAMetalLayerIntervalStats _ingestLatePresentOnGlassAggregation:](self, "_ingestLatePresentOnGlassAggregation:", v6);
          v21 = objc_claimAutoreleasedReturnValue();
        }
      }
      v13 = (void *)v21;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Aggregation '%@': Misaligned aggregation intervals: %llu -> %llu (aggregation) vs. %llu -> %llu (stats)"), v15, objc_msgSend(v8, "startMachContinuousTime"), objc_msgSend(v8, "endMachContinuousTime"), -[SSInflightCAMetalLayerIntervalStats intervalBeginMCT](self, "intervalBeginMCT"), -[SSInflightCAMetalLayerIntervalStats intervalEndMCT](self, "intervalEndMCT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v13;
}

- (SSCAMetalLayerSession)parentSession
{
  return (SSCAMetalLayerSession *)objc_loadWeakRetained((id *)&self->_parentSession);
}

- (unint64_t)intervalBeginMCT
{
  return self->_intervalBeginMCT;
}

- (unint64_t)intervalEndMCT
{
  return self->_intervalEndMCT;
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (NSDate)intervalBeginDate
{
  return self->_intervalBeginDate;
}

- (NSDate)intervalEndDate
{
  return self->_intervalEndDate;
}

- (SignpostAggregation)presentedFrameStatsAggregation
{
  return self->_presentedFrameStatsAggregation;
}

- (void)setPresentedFrameStatsAggregation:(id)a3
{
  objc_storeStrong((id *)&self->_presentedFrameStatsAggregation, a3);
}

- (SignpostAggregation)skippedFrameStatsAggregation
{
  return self->_skippedFrameStatsAggregation;
}

- (void)setSkippedFrameStatsAggregation:(id)a3
{
  objc_storeStrong((id *)&self->_skippedFrameStatsAggregation, a3);
}

- (SignpostAggregation)lateClientPresentStatsAggregation
{
  return self->_lateClientPresentStatsAggregation;
}

- (void)setLateClientPresentStatsAggregation:(id)a3
{
  objc_storeStrong((id *)&self->_lateClientPresentStatsAggregation, a3);
}

- (SignpostAggregation)latePresentOnGlassStatsAggregation
{
  return self->_latePresentOnGlassStatsAggregation;
}

- (void)setLatePresentOnGlassStatsAggregation:(id)a3
{
  objc_storeStrong((id *)&self->_latePresentOnGlassStatsAggregation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latePresentOnGlassStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStatsAggregation, 0);
  objc_storeStrong((id *)&self->_skippedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_presentedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_intervalEndDate, 0);
  objc_storeStrong((id *)&self->_intervalBeginDate, 0);
  objc_destroyWeak((id *)&self->_parentSession);
}

@end
