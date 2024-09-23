@implementation ATXShadowMetricsComputer

- (ATXShadowMetricsComputer)initWithDataSource:(id)a3
{
  id v5;
  ATXShadowMetricsComputer *v6;
  ATXShadowMetricsComputer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXShadowMetricsComputer;
  v6 = -[ATXShadowMetricsComputer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)computeResultAsTrendPlotFromStartDate:(id)a3 toEndDate:(id)a4 resultGranularity:(int64_t)a5
{
  id v8;
  id v9;
  ATXTrendPlot *v10;
  void *v11;
  uint64_t v12;
  ATXShadowMetricsDataSource *dataSource;
  ATXTrendPlot *v14;
  ATXTrendPlot *v15;
  _QWORD v17[8];
  _QWORD v18[5];
  ATXTrendPlot *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = -[ATXTrendPlot initWithStartDate:endDate:granularity:binInitialDataProvider:]([ATXTrendPlot alloc], "initWithStartDate:endDate:granularity:binInitialDataProvider:", v8, v9, a5, &__block_literal_global_18);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__9;
  v27[4] = __Block_byref_object_dispose__9;
  v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__9;
  v25[4] = __Block_byref_object_dispose__9;
  v26 = (id)objc_opt_new();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__9;
  v23[4] = __Block_byref_object_dispose__9;
  -[ATXTrendPlot bins](v10, "bins");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  dataSource = self->_dataSource;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_6;
  v18[3] = &unk_1E57CFB68;
  v18[4] = self;
  v20 = v23;
  v21 = v27;
  v22 = v25;
  v14 = v10;
  v19 = v14;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_8;
  v17[3] = &unk_1E57CFBE0;
  v17[4] = self;
  v17[5] = v23;
  v17[6] = v27;
  v17[7] = v25;
  -[ATXShadowMetricsDataSource replayHistoryBetweenStartDate:endDate:shadowEventHandler:predictionCacheHandler:](dataSource, "replayHistoryBetweenStartDate:endDate:shadowEventHandler:predictionCacheHandler:", v8, v9, v18, v17);
  v15 = v14;

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  return v15;
}

id __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke()
{
  return (id)objc_opt_new();
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_6(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "next");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "next");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "absoluteTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "earlierDate:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "next");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v11)
        break;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "next");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v15 = objc_msgSend(*(id *)(a1[4] + 8), "numberOfPredictionsInCache:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "data");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setNumberOfCachedPredictions:", v15);

      v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "numberOfPredictionsWithConfidence:", 4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "data");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setNumberOfCachedHighConfidencePredictions:", v17);

      v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "numberOfPredictionsWithConfidence:", 3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "data");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setNumberOfCachedMediumConfidencePredictions:", v19);

      v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "numberOfPredictionsWithConfidence:", 2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "data");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNumberOfCachedLowConfidencePredictions:", v21);

      objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "next");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v5);
  }
  v23 = (void *)a1[5];
  objc_msgSend(v3, "absoluteTimestamp");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "binAtDate:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfShadowEvents:", objc_msgSend(v26, "numberOfShadowEvents") + 1);

    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      v27 = objc_msgSend(*(id *)(a1[4] + 8), "cacheHitIndexForShadowEvent:predictionCache:", v3);
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v27;
        objc_msgSend(v25, "data");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setNumberOfShadowEventCacheHits:", objc_msgSend(v29, "numberOfShadowEventCacheHits") + 1);

        if (v28)
        {
          if (v28 != 1)
          {
            if (v28 > 3)
            {
              v30 = 0;
              v34 = 0;
              v36 = 0;
              v37 = 0;
              v38 = 0;
              if (v28 > 7)
              {
LABEL_16:
                objc_msgSend(v25, "data");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "sumOfShadowEventCacheHitReciprocalRanks");
                objc_msgSend(v39, "setSumOfShadowEventCacheHitReciprocalRanks:", 1.0 / (double)(v28 + 1) + v40);

                v41 = objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "confidenceCategoryForPredictionAtIndex:", v28);
                v42 = v41;
                switch(v41)
                {
                  case 2:
                    objc_msgSend(v25, "data");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setNumberOfShadowEventLowConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventLowConfidenceCacheHits") + 1);
                    break;
                  case 4:
                    objc_msgSend(v25, "data");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setNumberOfShadowEventHighConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventHighConfidenceCacheHits") + 1);
                    break;
                  case 3:
                    objc_msgSend(v25, "data");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "setNumberOfShadowEventMediumConfidenceCacheHits:", objc_msgSend(v43, "numberOfShadowEventMediumConfidenceCacheHits") + 1);
                    break;
                  default:
                    goto LABEL_23;
                }

LABEL_23:
                objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "identifierForPredictionAtIndex:", v28);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v44)
                {
                  __atxlog_handle_metrics();
                  v47 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                    __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_6_cold_1(v47);
LABEL_34:

                  goto LABEL_35;
                }
                if ((objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "containsObject:", v44) & 1) != 0)
                {
LABEL_35:

                  goto LABEL_36;
                }
                objc_msgSend(*(id *)(*(_QWORD *)(a1[8] + 8) + 40), "addObject:", v44);
                objc_msgSend(v25, "data");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "setNumberOfCorrectCachedPredictions:", objc_msgSend(v45, "numberOfCorrectCachedPredictions") + 1);

                if (v28)
                {
                  if (!v37)
                    goto LABEL_27;
                }
                else
                {
                  objc_msgSend(v25, "data");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "setNumberOfCorrectTop1CachedPrediction:", objc_msgSend(v48, "numberOfCorrectTop1CachedPrediction") + 1);

                  if (!v37)
                  {
LABEL_27:
                    if (!v38)
                      goto LABEL_28;
                    goto LABEL_44;
                  }
                }
                objc_msgSend(v25, "data");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setNumberOfCorrectTop2CachedPredictions:", objc_msgSend(v49, "numberOfCorrectTop2CachedPredictions") + 1);

                if (!v38)
                {
LABEL_28:
                  if (!v36)
                    goto LABEL_30;
                  goto LABEL_29;
                }
LABEL_44:
                objc_msgSend(v25, "data");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setNumberOfCorrectTop4CachedPredictions:", objc_msgSend(v50, "numberOfCorrectTop4CachedPredictions") + 1);

                if (!v36)
                {
LABEL_30:
                  switch(v42)
                  {
                    case 2:
                      objc_msgSend(v25, "data");
                      v47 = objc_claimAutoreleasedReturnValue();
                      -[NSObject setNumberOfCorrectLowConfidenceCachedPredictions:](v47, "setNumberOfCorrectLowConfidenceCachedPredictions:", -[NSObject numberOfCorrectLowConfidenceCachedPredictions](v47, "numberOfCorrectLowConfidenceCachedPredictions")+ 1);
                      break;
                    case 4:
                      objc_msgSend(v25, "data");
                      v47 = objc_claimAutoreleasedReturnValue();
                      -[NSObject setNumberOfCorrectHighConfidenceCachedPredictions:](v47, "setNumberOfCorrectHighConfidenceCachedPredictions:", -[NSObject numberOfCorrectHighConfidenceCachedPredictions](v47, "numberOfCorrectHighConfidenceCachedPredictions")+ 1);
                      break;
                    case 3:
                      objc_msgSend(v25, "data");
                      v47 = objc_claimAutoreleasedReturnValue();
                      -[NSObject setNumberOfCorrectMediumConfidenceCachedPredictions:](v47, "setNumberOfCorrectMediumConfidenceCachedPredictions:", -[NSObject numberOfCorrectMediumConfidenceCachedPredictions](v47, "numberOfCorrectMediumConfidenceCachedPredictions")+ 1);
                      break;
                    default:
                      goto LABEL_35;
                  }
                  goto LABEL_34;
                }
LABEL_29:
                objc_msgSend(v25, "data");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setNumberOfCorrectTop8CachedPredictions:", objc_msgSend(v46, "numberOfCorrectTop8CachedPredictions") + 1);

                goto LABEL_30;
              }
LABEL_15:
              objc_msgSend(v25, "data");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setNumberOfShadowEventTop8CacheHits:", objc_msgSend(v35, "numberOfShadowEventTop8CacheHits") + 1);

              v36 = 1;
              v37 = v30;
              v38 = v34;
              goto LABEL_16;
            }
            v30 = 0;
LABEL_14:
            objc_msgSend(v25, "data");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setNumberOfShadowEventTop4CacheHits:", objc_msgSend(v33, "numberOfShadowEventTop4CacheHits") + 1);

            v34 = 1;
            goto LABEL_15;
          }
        }
        else
        {
          objc_msgSend(v25, "data");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setNumberOfShadowEventTop1CacheHits:", objc_msgSend(v31, "numberOfShadowEventTop1CacheHits") + 1);

        }
        objc_msgSend(v25, "data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setNumberOfShadowEventTop2CacheHits:", objc_msgSend(v32, "numberOfShadowEventTop2CacheHits") + 1);

        v30 = 1;
        goto LABEL_14;
      }
    }
  }
LABEL_36:

}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_8(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfPredictionCacheRefreshes:", objc_msgSend(v4, "numberOfPredictionCacheRefreshes") + 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "next");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "next");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "earlierDate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "next");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v12)
        break;
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "next");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[5] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v16 = objc_msgSend(*(id *)(a1[4] + 8), "numberOfPredictionsInCache:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNumberOfCachedPredictions:", v16);

      v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "numberOfPredictionsWithConfidence:", 4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setNumberOfCachedHighConfidencePredictions:", v18);

      v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "numberOfPredictionsWithConfidence:", 3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setNumberOfCachedMediumConfidencePredictions:", v20);

      v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "numberOfPredictionsWithConfidence:", 2);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setNumberOfCachedLowConfidencePredictions:", v22);

      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "next");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v6);
  }
  v24 = (void *)objc_opt_new();
  v25 = v24;
  v26 = a1[6];
  v27 = *(_QWORD *)(*(_QWORD *)(v26 + 8) + 40);
  v28 = MEMORY[0x1E0C809B0];
  if (v27)
  {
    v29 = *(void **)(a1[4] + 8);
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_2;
    v65[3] = &unk_1E57CFB90;
    v67 = v26;
    v66 = v24;
    objc_msgSend(v29, "enumeratePredictionsInCache:usingBlock:", v27, v65);

  }
  v30 = (void *)objc_opt_new();
  v31 = *(void **)(a1[4] + 8);
  v59[0] = v28;
  v59[1] = 3221225472;
  v59[2] = __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_3;
  v59[3] = &unk_1E57CFBB8;
  v32 = v3;
  v60 = v32;
  v33 = v30;
  v61 = v33;
  v34 = v25;
  v62 = v34;
  v35 = *((_OWORD *)a1 + 3);
  v63 = *((_OWORD *)a1 + 2);
  v64 = v35;
  objc_msgSend(v31, "enumeratePredictionsInCache:usingBlock:", v32, v59);
  v36 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v37 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v56 != v40)
          objc_enumerationMutation(v37);
        v42 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        if ((objc_msgSend(v33, "containsObject:", v42) & 1) == 0)
          objc_msgSend(v36, "addObject:", v42);
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v39);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v43 = v36;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v52 != v46)
          objc_enumerationMutation(v43);
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "removeObject:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j), (_QWORD)v51);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v45);
  }

  v48 = *(_QWORD *)(a1[6] + 8);
  v49 = *(void **)(v48 + 40);
  *(_QWORD *)(v48 + 40) = v32;
  v50 = v32;

}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = a2;
  objc_msgSend(v5, "identifierForPredictionAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifierForPredictionAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "isPrediction:equalToPrediction:", v6, v10) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNumberOfCachedPredictions:", objc_msgSend(v7, "numberOfCachedPredictions") + 1);

    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "confidenceCategoryForPredictionAtIndex:", a3);
    switch(v8)
    {
      case 4:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNumberOfCachedHighConfidencePredictions:", objc_msgSend(v9, "numberOfCachedHighConfidencePredictions") + 1);
        break;
      case 3:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNumberOfCachedMediumConfidencePredictions:", objc_msgSend(v9, "numberOfCachedMediumConfidencePredictions") + 1);
        break;
      case 2:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNumberOfCachedLowConfidencePredictions:", objc_msgSend(v9, "numberOfCachedLowConfidencePredictions") + 1);
        break;
      default:
LABEL_10:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeObject:", v5);
        goto LABEL_11;
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (id)computeResultFromStartDate:(id)a3 toEndDate:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ATXShadowMetricsComputer computeResultAsTrendPlotFromStartDate:toEndDate:resultGranularity:](self, "computeResultAsTrendPlotFromStartDate:toEndDate:resultGranularity:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (ATXShadowMetricsDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __94__ATXShadowMetricsComputer_computeResultAsTrendPlotFromStartDate_toEndDate_resultGranularity___block_invoke_6_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "ATXShadowMetricsComputer: identifierForPredictionAtIndex unexpectedly returned nil.", v1, 2u);
}

@end
