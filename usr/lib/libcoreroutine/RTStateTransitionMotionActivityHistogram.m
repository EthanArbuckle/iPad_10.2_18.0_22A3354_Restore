@implementation RTStateTransitionMotionActivityHistogram

- (RTStateTransitionMotionActivityHistogram)initWithMotionActivities:(id)a3 fromStartDate:(id)a4 toEndDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTStateTransitionMotionActivityHistogram *v11;
  NSMutableArray *v12;
  NSMutableArray *histogramBins;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  id v20;
  RTStateTransitionMotionActivityHistogram *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)RTStateTransitionMotionActivityHistogram;
  v11 = -[RTStateTransitionMotionActivityHistogram init](&v27, sel_init);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    histogramBins = v11->_histogramBins;
    v11->_histogramBins = v12;

    v11->_activityChangeCount = 0;
    v11->_cumulativeInterval = 0.0;
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v15 = v14;
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    v17 = v16;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__112;
    v25[4] = __Block_byref_object_dispose__112;
    v26 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__RTStateTransitionMotionActivityHistogram_initWithMotionActivities_fromStartDate_toEndDate___block_invoke;
    v19[3] = &unk_1E92A2308;
    v22 = v25;
    v23 = v15;
    v20 = v8;
    v24 = v17;
    v21 = v11;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v19);

    _Block_object_dispose(v25, 8);
  }

  return v11;
}

void __93__RTStateTransitionMotionActivityHistogram_initWithMotionActivities_fromStartDate_toEndDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  id v26;

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  v26 = v5;
  if (v5 && v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -4233600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "laterDate:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
    {
      objc_msgSend(v26, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "laterDate:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        v16 = *(double *)(a1 + 56);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v19 = v18;

        if (v16 <= v19)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v20 = v22;

        }
        else
        {
          v20 = *(double *)(a1 + 56);
        }
        if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 == a3)
        {
          v23 = *(double *)(a1 + 64);
        }
        else
        {
          objc_msgSend(v26, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceReferenceDate");
          v23 = v25;

        }
        objc_msgSend(*(id *)(a1 + 40), "addActivity:withInterval:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v23 - v20);
      }
    }
    else
    {

    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
  }
  *(_QWORD *)(v6 + 40) = v26;

}

- (void)addActivity:(id)a3 withInterval:(double)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  RTStateTransitionActivityHistogramElement *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__112;
    v27 = __Block_byref_object_dispose__112;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    -[RTStateTransitionMotionActivityHistogram histogramBins](self, "histogramBins");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__RTStateTransitionMotionActivityHistogram_addActivity_withInterval___block_invoke;
    v15[3] = &unk_1E929CB58;
    v8 = v6;
    v16 = v8;
    v17 = &v23;
    v18 = &v19;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);

    v9 = (void *)v24[5];
    if (!v9)
    {
      v10 = -[RTStateTransitionActivityHistogramElement initWithActivity:]([RTStateTransitionActivityHistogramElement alloc], "initWithActivity:", v8);
      v11 = (void *)v24[5];
      v24[5] = (uint64_t)v10;

      v9 = (void *)v24[5];
    }
    objc_msgSend(v9, "interval");
    objc_msgSend(v9, "setInterval:", v12 + a4);
    -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
    -[RTStateTransitionMotionActivityHistogram setCumulativeInterval:](self, "setCumulativeInterval:", v13 + a4);
    -[RTStateTransitionMotionActivityHistogram setActivityChangeCount:](self, "setActivityChangeCount:", -[RTStateTransitionMotionActivityHistogram activityChangeCount](self, "activityChangeCount") + 1);
    if (!*((_BYTE *)v20 + 24))
    {
      -[RTStateTransitionMotionActivityHistogram histogramBins](self, "histogramBins");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v24[5]);

    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);

  }
}

void __69__RTStateTransitionMotionActivityHistogram_addActivity_withInterval___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", a1[4]);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (void)show
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  int v9;
  int64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[RTStateTransitionMotionActivityHistogram histogramBins](self, "histogramBins");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v7 = -[RTStateTransitionMotionActivityHistogram activityChangeCount](self, "activityChangeCount");
        -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
        v9 = 134218240;
        v10 = v7;
        v11 = 2048;
        v12 = v8;
        _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "change count, %ld, cumulative interval, %f", (uint8_t *)&v9, 0x16u);
      }

      -[RTStateTransitionMotionActivityHistogram histogramBins](self, "histogramBins");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_54);

    }
  }
}

void __48__RTStateTransitionMotionActivityHistogram_show__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v2, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "interval");
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "%@, interval, %f", (uint8_t *)&v6, 0x16u);

  }
}

- (unint64_t)getDominantMotionActivityType
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  _QWORD v17[7];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  -[RTStateTransitionMotionActivityHistogram show](self, "show");
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = (double *)&v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[RTStateTransitionMotionActivityHistogram histogramBins](self, "histogramBins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__RTStateTransitionMotionActivityHistogram_getDominantMotionActivityType__block_invoke;
  v17[3] = &unk_1E92A2350;
  v17[4] = &v26;
  v17[5] = &v18;
  v17[6] = &v22;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v17);

  -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
  v4 = 0.0;
  v5 = 0.0;
  if (v6 <= 0.0)
    goto LABEL_7;
  v7 = v27[3];
  -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
  v9 = v8;
  v10 = v19[3];
  -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
  v12 = v11;
  v13 = v23[3];
  -[RTStateTransitionMotionActivityHistogram cumulativeInterval](self, "cumulativeInterval");
  v5 = v10 / v12;
  v4 = v13 / v14;
  if (v7 / v9 <= 0.2 || v5 >= 0.4 || v4 >= 0.4)
  {
LABEL_7:
    if (v5 > 0.4 || v4 > 0.4)
    {
      if (v5 <= v4)
        v15 = 3;
      else
        v15 = 2;
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 4;
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v15;
}

void __73__RTStateTransitionMotionActivityHistogram_getDominantMotionActivityType__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  int v4;
  double v5;
  void *v6;
  int v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "automotive");

  if (v4)
  {
    objc_msgSend(v12, "interval");
    *(double *)(*(_QWORD *)(a1[4] + 8) + 24) = v5 + *(double *)(*(_QWORD *)(a1[4] + 8) + 24);
  }
  objc_msgSend(v12, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "walking");

  if (v7)
  {
    objc_msgSend(v12, "interval");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v8 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  objc_msgSend(v12, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "running");

  if (v10)
  {
    objc_msgSend(v12, "interval");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v11 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
  }

}

- (NSMutableArray)histogramBins
{
  return self->_histogramBins;
}

- (void)setHistogramBins:(id)a3
{
  objc_storeStrong((id *)&self->_histogramBins, a3);
}

- (int64_t)activityChangeCount
{
  return self->_activityChangeCount;
}

- (void)setActivityChangeCount:(int64_t)a3
{
  self->_activityChangeCount = a3;
}

- (double)cumulativeInterval
{
  return self->_cumulativeInterval;
}

- (void)setCumulativeInterval:(double)a3
{
  self->_cumulativeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBins, 0);
}

@end
