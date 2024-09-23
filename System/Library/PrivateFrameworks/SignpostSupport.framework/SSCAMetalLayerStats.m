@implementation SSCAMetalLayerStats

- (double)startSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerStats startMachContinuousTime](self, "startMachContinuousTime");
  -[SSCAMetalLayerStats timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (double)endSeconds
{
  unint64_t v3;
  double v4;

  v3 = -[SSCAMetalLayerStats endMachContinuousTime](self, "endMachContinuousTime");
  -[SSCAMetalLayerStats timebaseRatio](self, "timebaseRatio");
  return v4 * (double)v3 / 1000000000.0;
}

- (unint64_t)durationMachContinuousTime
{
  unint64_t v3;

  v3 = -[SSCAMetalLayerStats endMachContinuousTime](self, "endMachContinuousTime");
  return v3 - -[SSCAMetalLayerStats startMachContinuousTime](self, "startMachContinuousTime");
}

- (float)durationSeconds
{
  double v3;
  double v4;
  double v5;

  -[SSCAMetalLayerStats endSeconds](self, "endSeconds");
  v4 = v3;
  -[SSCAMetalLayerStats startSeconds](self, "startSeconds");
  return v4 - v5;
}

- (unint64_t)startNanoseconds
{
  double v2;

  -[SSCAMetalLayerStats startSeconds](self, "startSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)endNanoseconds
{
  double v2;

  -[SSCAMetalLayerStats endSeconds](self, "endSeconds");
  return (unint64_t)(v2 * 1000000000.0);
}

- (unint64_t)durationNanoseconds
{
  float v2;

  -[SSCAMetalLayerStats durationSeconds](self, "durationSeconds");
  return (unint64_t)(float)(v2 * 1000000000.0);
}

- (double)startMs
{
  double v2;

  -[SSCAMetalLayerStats startSeconds](self, "startSeconds");
  return v2 * 1000.0;
}

- (double)endMs
{
  double v2;

  -[SSCAMetalLayerStats endSeconds](self, "endSeconds");
  return v2 * 1000.0;
}

- (double)durationMs
{
  float v2;

  -[SSCAMetalLayerStats durationSeconds](self, "durationSeconds");
  return (float)(v2 * 1000.0);
}

- (BOOL)includeTimelines
{
  return 1;
}

- (void)_updateStatsWithPresentedFrameStatsAggregation:(id)a3 skippedAggregation:(id)a4 lateClientPresentAggregation:(id)a5 lateOnGlassPresentAggregation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SSCAMetalLayerFrameStats *v14;
  SSCAMetalLayerFrameStats *presentedFrameStats;
  SSCAMLDurationStats *v16;
  SSCAMLDurationStats *frameOnGlassIntervalStats;
  SSCAMetalLayerFrameStats *v18;
  SSCAMetalLayerFrameStats *skippedFrameStats;
  SSCAMLDurationStats *v20;
  SSCAMLDurationStats *lateClientPresentStats;
  SSCAMLDurationStats *v22;
  SSCAMLDurationStats *lateOnGlassPresentStats;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SSCAMetalLayerFrameStats initWithSignpostAggregation:parentIntervalStats:]([SSCAMetalLayerFrameStats alloc], "initWithSignpostAggregation:parentIntervalStats:", v13, self);
  presentedFrameStats = self->_presentedFrameStats;
  self->_presentedFrameStats = v14;

  _durationStat(v13, kSSCAMLFPGroup_PresentedFrameIntervals, kSSCAMLFPType_TimeOnGlass);
  v16 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  frameOnGlassIntervalStats = self->_frameOnGlassIntervalStats;
  self->_frameOnGlassIntervalStats = v16;

  v18 = -[SSCAMetalLayerFrameStats initWithSignpostAggregation:parentIntervalStats:]([SSCAMetalLayerFrameStats alloc], "initWithSignpostAggregation:parentIntervalStats:", v12, self);
  skippedFrameStats = self->_skippedFrameStats;
  self->_skippedFrameStats = v18;

  _durationStat(v11, kSSCAMLFPGroup_LateClientDrawablePresents, kSSCAMLFPType_Lateness);
  v20 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  lateClientPresentStats = self->_lateClientPresentStats;
  self->_lateClientPresentStats = v20;

  _durationStat(v10, kSSCAMLFPGroup_LateOnGlassPresents, kSSCAMLFPType_Lateness);
  v22 = (SSCAMLDurationStats *)objc_claimAutoreleasedReturnValue();

  lateOnGlassPresentStats = self->_lateOnGlassPresentStats;
  self->_lateOnGlassPresentStats = v22;

}

- (id)_initEmpty:(double)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSCAMetalLayerStats;
  result = -[SSCAMetalLayerStats init](&v5, sel_init);
  if (result)
  {
    *(_OWORD *)((char *)result + 88) = xmmword_1A1A706E0;
    *((double *)result + 15) = a3;
  }
  return result;
}

- (SSCAMetalLayerStats)initWithInFlightStats:(id)a3
{
  id v4;
  SSCAMetalLayerStats *v5;
  SSCAMetalLayerStats *v6;
  uint64_t v7;
  NSDate *startDate;
  uint64_t v9;
  NSDate *endDate;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SignpostAggregation *presentedFrameStatsAggregation;
  void *v19;
  uint64_t v20;
  SignpostAggregation *skippedFrameStatsAggregation;
  void *v22;
  uint64_t v23;
  SignpostAggregation *lateClientPresentStatsAggregation;
  void *v25;
  uint64_t v26;
  SignpostAggregation *latePresentOnGlassStatsAggregation;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)SSCAMetalLayerStats;
  v5 = -[SSCAMetalLayerStats init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_intervalCount = 1;
    v5->_startMachContinuousTime = objc_msgSend(v4, "intervalBeginMCT");
    objc_msgSend(v4, "intervalBeginDate");
    v7 = objc_claimAutoreleasedReturnValue();
    startDate = v6->_startDate;
    v6->_startDate = (NSDate *)v7;

    v6->_endMachContinuousTime = objc_msgSend(v4, "intervalEndMCT");
    objc_msgSend(v4, "intervalEndDate");
    v9 = objc_claimAutoreleasedReturnValue();
    endDate = v6->_endDate;
    v6->_endDate = (NSDate *)v9;

    objc_msgSend(v4, "timebaseRatio");
    v6->_timebaseRatio = v11;
    objc_msgSend(v4, "presentedFrameStatsAggregation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "skippedFrameStatsAggregation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lateClientPresentStatsAggregation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latePresentOnGlassStatsAggregation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCAMetalLayerStats _updateStatsWithPresentedFrameStatsAggregation:skippedAggregation:lateClientPresentAggregation:lateOnGlassPresentAggregation:](v6, "_updateStatsWithPresentedFrameStatsAggregation:skippedAggregation:lateClientPresentAggregation:lateOnGlassPresentAggregation:", v12, v13, v14, v15);

    objc_msgSend(v4, "presentedFrameStatsAggregation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    presentedFrameStatsAggregation = v6->_presentedFrameStatsAggregation;
    v6->_presentedFrameStatsAggregation = (SignpostAggregation *)v17;

    objc_msgSend(v4, "skippedFrameStatsAggregation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    skippedFrameStatsAggregation = v6->_skippedFrameStatsAggregation;
    v6->_skippedFrameStatsAggregation = (SignpostAggregation *)v20;

    objc_msgSend(v4, "lateClientPresentStatsAggregation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    lateClientPresentStatsAggregation = v6->_lateClientPresentStatsAggregation;
    v6->_lateClientPresentStatsAggregation = (SignpostAggregation *)v23;

    objc_msgSend(v4, "latePresentOnGlassStatsAggregation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    latePresentOnGlassStatsAggregation = v6->_latePresentOnGlassStatsAggregation;
    v6->_latePresentOnGlassStatsAggregation = (SignpostAggregation *)v26;

  }
  return v6;
}

- (void)_dropOverallIntervals
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dropRawIntervals");

  -[SSCAMetalLayerStats skippedFrameStatsAggregation](self, "skippedFrameStatsAggregation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dropRawIntervals");

  -[SSCAMetalLayerStats lateClientPresentStatsAggregation](self, "lateClientPresentStatsAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dropRawIntervals");

  -[SSCAMetalLayerStats latePresentOnGlassStatsAggregation](self, "latePresentOnGlassStatsAggregation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dropRawIntervals");

}

- (id)_accumulateNewAggregations:(id)a3 skippedFrameStatsAggregation:(id)a4 lateClientPresentStatsAggregation:(id)a5 latePresentOnGlassStatsAggregation:(id)a6 intervalBeginMCT:(unint64_t)a7 intervalEndMCT:(unint64_t)a8 intervalBeginDate:(id)a9 intervalEndDate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v50;
  id v51;
  id v52;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v52 = a9;
  v51 = a10;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = a8;
  if (v16)
  {
    -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addAggregation:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v23 == 0;
      if (v23)
      {
        objc_msgSend(v20, "addObject:", v23);
        v24 = 0;
      }
    }
    else
    {
      v23 = (void *)objc_msgSend(v16, "copy");
      -[SSCAMetalLayerStats setPresentedFrameStatsAggregation:](self, "setPresentedFrameStatsAggregation:", v23);
      v24 = 1;
    }

    if (v17)
    {
LABEL_9:
      -[SSCAMetalLayerStats skippedFrameStatsAggregation](self, "skippedFrameStatsAggregation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[SSCAMetalLayerStats skippedFrameStatsAggregation](self, "skippedFrameStatsAggregation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAggregation:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          objc_msgSend(v20, "addObject:", v27);
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        v27 = (void *)objc_msgSend(v17, "copy");
        -[SSCAMetalLayerStats setSkippedFrameStatsAggregation:](self, "setSkippedFrameStatsAggregation:", v27);
      }
      v24 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v24 = 0;
    if (v17)
      goto LABEL_9;
  }
LABEL_15:
  if (!v18)
    goto LABEL_22;
  -[SSCAMetalLayerStats lateClientPresentStatsAggregation](self, "lateClientPresentStatsAggregation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v30 = (void *)objc_msgSend(v18, "copy");
    -[SSCAMetalLayerStats setLateClientPresentStatsAggregation:](self, "setLateClientPresentStatsAggregation:", v30);
    goto LABEL_20;
  }
  -[SSCAMetalLayerStats lateClientPresentStatsAggregation](self, "lateClientPresentStatsAggregation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAggregation:", v18);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
LABEL_20:
    v24 = 1;
    goto LABEL_21;
  }
  objc_msgSend(v20, "addObject:", v30);
LABEL_21:

LABEL_22:
  if (!v19)
    goto LABEL_29;
  -[SSCAMetalLayerStats latePresentOnGlassStatsAggregation](self, "latePresentOnGlassStatsAggregation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    v33 = (void *)objc_msgSend(v19, "copy");
    -[SSCAMetalLayerStats setLatePresentOnGlassStatsAggregation:](self, "setLatePresentOnGlassStatsAggregation:", v33);
    goto LABEL_27;
  }
  -[SSCAMetalLayerStats latePresentOnGlassStatsAggregation](self, "latePresentOnGlassStatsAggregation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addAggregation:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
LABEL_27:
    v24 = 1;
    goto LABEL_28;
  }
  objc_msgSend(v20, "addObject:", v33);
LABEL_28:

LABEL_29:
  if (objc_msgSend(v20, "count"))
  {
    v34 = v20;
  }
  else
  {
    v35 = -[SSCAMetalLayerStats startMachContinuousTime](self, "startMachContinuousTime");
    if (v35 >= a7)
      v36 = a7;
    else
      v36 = v35;
    if (v35 + 1 >= 2)
      v37 = v36;
    else
      v37 = a7;
    -[SSCAMetalLayerStats setStartMachContinuousTime:](self, "setStartMachContinuousTime:", v37);
    v38 = -[SSCAMetalLayerStats endMachContinuousTime](self, "endMachContinuousTime");
    if (v38 <= v50)
      v39 = v50;
    else
      v39 = v38;
    if (v38 + 1 >= 2)
      v40 = v39;
    else
      v40 = v50;
    -[SSCAMetalLayerStats setEndMachContinuousTime:](self, "setEndMachContinuousTime:", v40);
    -[SSCAMetalLayerStats startDate](self, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    _getEarliestDate(v41, v52);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCAMetalLayerStats setStartDate:](self, "setStartDate:", v42);

    -[SSCAMetalLayerStats endDate](self, "endDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _getLatestDate(v43, v51);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSCAMetalLayerStats setEndDate:](self, "setEndDate:", v44);

    if (v24)
    {
      -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerStats skippedFrameStatsAggregation](self, "skippedFrameStatsAggregation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerStats lateClientPresentStatsAggregation](self, "lateClientPresentStatsAggregation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerStats latePresentOnGlassStatsAggregation](self, "latePresentOnGlassStatsAggregation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSCAMetalLayerStats _updateStatsWithPresentedFrameStatsAggregation:skippedAggregation:lateClientPresentAggregation:lateOnGlassPresentAggregation:](self, "_updateStatsWithPresentedFrameStatsAggregation:skippedAggregation:lateClientPresentAggregation:lateOnGlassPresentAggregation:", v45, v46, v47, v48);

      v34 = 0;
      ++self->_intervalCount;
    }
    else
    {
      v34 = 0;
    }
  }

  return v34;
}

- (id)accumulateFinishedInFlightStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "presentedFrameStatsAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skippedFrameStatsAggregation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lateClientPresentStatsAggregation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latePresentOnGlassStatsAggregation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "intervalBeginMCT");
  v10 = objc_msgSend(v4, "intervalEndMCT");
  objc_msgSend(v4, "intervalBeginDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intervalEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSCAMetalLayerStats _accumulateNewAggregations:skippedFrameStatsAggregation:lateClientPresentStatsAggregation:latePresentOnGlassStatsAggregation:intervalBeginMCT:intervalEndMCT:intervalBeginDate:intervalEndDate:](self, "_accumulateNewAggregations:skippedFrameStatsAggregation:lateClientPresentStatsAggregation:latePresentOnGlassStatsAggregation:intervalBeginMCT:intervalEndMCT:intervalBeginDate:intervalEndDate:", v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)accumulateNewStats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "presentedFrameStatsAggregation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skippedFrameStatsAggregation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lateClientPresentStatsAggregation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latePresentOnGlassStatsAggregation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "startMachContinuousTime");
  v10 = objc_msgSend(v4, "endMachContinuousTime");
  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSCAMetalLayerStats _accumulateNewAggregations:skippedFrameStatsAggregation:lateClientPresentStatsAggregation:latePresentOnGlassStatsAggregation:intervalBeginMCT:intervalEndMCT:intervalBeginDate:intervalEndDate:](self, "_accumulateNewAggregations:skippedFrameStatsAggregation:lateClientPresentStatsAggregation:latePresentOnGlassStatsAggregation:intervalBeginMCT:intervalEndMCT:intervalBeginDate:intervalEndDate:", v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)totalDurationSeconds
{
  float v2;

  -[SSCAMetalLayerStats durationSeconds](self, "durationSeconds");
  return v2;
}

- (double)activeSeconds
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double result;

  -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3, v5 = -[SSCAMetalLayerStats intervalCount](self, "intervalCount"), v4, v5 >= 2))
  {
    -[SSCAMetalLayerStats presentedFrameStatsAggregation](self, "presentedFrameStatsAggregation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "durationSeconds");
    v8 = v7;

    return v8;
  }
  else
  {
    -[SSCAMetalLayerStats totalDurationSeconds](self, "totalDurationSeconds");
  }
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _timeIntervalDict(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SSCAMetalLayerStats intervalCount](self, "intervalCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kSSCAMLStatsKey_IntervalCount);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerStats totalDurationSeconds](self, "totalDurationSeconds");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kSSCAMLStatsKey_TotalDurationSeconds);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SSCAMetalLayerStats activeSeconds](self, "activeSeconds");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, kSSCAMLStatsKey_ActiveSeconds);

  -[SSCAMetalLayerStats presentedFrameStats](self, "presentedFrameStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kSSCAMLStatsKey_PresentedFrame);

  -[SSCAMetalLayerStats skippedFrameStats](self, "skippedFrameStats");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, kSSCAMLStatsKey_SkippedFrameStats);

  -[SSCAMetalLayerStats frameOnGlassIntervalStats](self, "frameOnGlassIntervalStats");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, kSSCAMLStatsKey_FrameOnGlassIntervalStats);

  -[SSCAMetalLayerStats lateClientPresentStats](self, "lateClientPresentStats");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, kSSCAMLStatsKey_LateClientPresentStats);

  -[SSCAMetalLayerStats lateOnGlassPresentStats](self, "lateOnGlassPresentStats");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, kSSCAMLStatsKey_LateOnGlassPresents);

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)-[SSCAMetalLayerStats jsonDescription:](self, "jsonDescription:", 3);
}

+ (id)totalStatsFromStatsArray:(id)a3 errorOut:(id *)a4
{
  id v5;
  SSCAMetalLayerStats *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v15 = 0;
    goto LABEL_20;
  }
  v6 = [SSCAMetalLayerStats alloc];
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timebaseRatio");
  v8 = -[SSCAMetalLayerStats _initEmpty:](v6, "_initEmpty:");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "accumulateNewStats:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count"))
        {
          if (a4)
          {
            objc_msgSend(v14, "firstObject");
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_17;
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (!objc_msgSend(v8, "intervalCount"))
    goto LABEL_17;
  objc_msgSend(v8, "startDate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v15 = v8;
      goto LABEL_18;
    }
LABEL_17:
    v15 = 0;
  }
LABEL_18:

LABEL_20:
  return v15;
}

- (unint64_t)intervalCount
{
  return self->_intervalCount;
}

- (SSCAMetalLayerFrameStats)presentedFrameStats
{
  return self->_presentedFrameStats;
}

- (SSCAMetalLayerFrameStats)skippedFrameStats
{
  return self->_skippedFrameStats;
}

- (SSCAMLDurationStats)frameOnGlassIntervalStats
{
  return self->_frameOnGlassIntervalStats;
}

- (SSCAMLDurationStats)lateClientPresentStats
{
  return self->_lateClientPresentStats;
}

- (SSCAMLDurationStats)lateOnGlassPresentStats
{
  return self->_lateOnGlassPresentStats;
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

- (unint64_t)startMachContinuousTime
{
  return self->_startMachContinuousTime;
}

- (void)setStartMachContinuousTime:(unint64_t)a3
{
  self->_startMachContinuousTime = a3;
}

- (unint64_t)endMachContinuousTime
{
  return self->_endMachContinuousTime;
}

- (void)setEndMachContinuousTime:(unint64_t)a3
{
  self->_endMachContinuousTime = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (double)timebaseRatio
{
  return self->_timebaseRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_latePresentOnGlassStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStatsAggregation, 0);
  objc_storeStrong((id *)&self->_skippedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_presentedFrameStatsAggregation, 0);
  objc_storeStrong((id *)&self->_lateOnGlassPresentStats, 0);
  objc_storeStrong((id *)&self->_lateClientPresentStats, 0);
  objc_storeStrong((id *)&self->_frameOnGlassIntervalStats, 0);
  objc_storeStrong((id *)&self->_skippedFrameStats, 0);
  objc_storeStrong((id *)&self->_presentedFrameStats, 0);
}

@end
