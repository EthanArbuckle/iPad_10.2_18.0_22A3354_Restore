@implementation ATXUIFeedbackMetricsComputer

- (ATXUIFeedbackMetricsComputer)init
{
  void *v3;
  ATXUIFeedbackMetricsComputer *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXUIFeedbackMetricsComputer initWithUIFeedbackResultStream:](self, "initWithUIFeedbackResultStream:", v3);

  return v4;
}

- (ATXUIFeedbackMetricsComputer)initWithUIFeedbackResultStream:(id)a3
{
  id v5;
  ATXUIFeedbackMetricsComputer *v6;
  ATXUIFeedbackMetricsComputer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUIFeedbackMetricsComputer;
  v6 = -[ATXUIFeedbackMetricsComputer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (id)computeResultForQuery:(id)a3 resultSpecification:(id)a4
{
  id v6;
  id v7;
  ATXBiomeProactiveSuggestionUIFeedbackResultStream *stream;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "clientModelType") || objc_msgSend(v6, "consumerSubType"))
  {
    stream = self->_stream;
    objc_msgSend(v6, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    -[ATXBiomeProactiveSuggestionUIFeedbackResultStream publisherFromStartTime:](stream, "publisherFromStartTime:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "clientModelType"))
    {
      +[ATXProactiveSuggestionClientModel clientModelIdFromClientModelType:](ATXProactiveSuggestionClientModel, "clientModelIdFromClientModelType:", objc_msgSend(v6, "clientModelType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXUIFeedbackMetricsComputer _computeResultForClientModel:query:publisher:resultSpecification:](self, "_computeResultForClientModel:query:publisher:resultSpecification:", v11, v6, v10, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ATXUIFeedbackMetricsComputer _computeResultForConsumerSubType:query:publisher:resultSpecification:](self, "_computeResultForConsumerSubType:query:publisher:resultSpecification:", objc_msgSend(v6, "consumerSubType"), v6, v10, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    __atxlog_handle_metrics();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXUIFeedbackMetricsComputer computeResultForQuery:resultSpecification:].cold.1(v14);

    v12 = 0;
  }

  return v12;
}

- (id)_computeResultForClientModel:(id)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  ATXUIFeedbackMetricsResult *v17;
  void *v18;
  void *v19;
  ATXUIFeedbackMetricsResult *v20;
  ATXUIFeedbackMetricsResult *v21;
  id v22;
  id v23;
  ATXUIFeedbackMetricsResult *v24;
  ATXUIFeedbackMetricsResult *v25;
  _QWORD v27[4];
  id v28;
  ATXUIFeedbackMetricsComputer *v29;
  ATXUIFeedbackMetricsResult *v30;
  _QWORD v31[4];
  id v32;
  id v33;

  v10 = a3;
  v11 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke;
  v31[3] = &unk_1E57CE910;
  v13 = v11;
  v32 = v13;
  v33 = v10;
  v14 = v10;
  v15 = a6;
  objc_msgSend(a5, "filterWithIsIncluded:", v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [ATXUIFeedbackMetricsResult alloc];
  objc_msgSend(v13, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ATXUIFeedbackMetricsResult initWithSpecification:startDate:endDate:](v17, "initWithSpecification:startDate:endDate:", v15, v18, v19);

  v27[0] = v12;
  v27[1] = 3221225472;
  v27[2] = __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_7;
  v27[3] = &unk_1E57CE958;
  v28 = v13;
  v29 = self;
  v21 = v20;
  v30 = v21;
  v22 = v13;
  v23 = (id)objc_msgSend(v16, "sinkWithCompletion:shouldContinue:", &__block_literal_global_2, v27);
  v24 = v30;
  v25 = v21;

  return v25;
}

uint64_t __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  int v14;
  BOOL v15;
  char v16;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
    goto LABEL_5;
  v10 = *(void **)(a1 + 40);
  objc_msgSend(v3, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientModelId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v12);

  if (!(_DWORD)v10)
  {
LABEL_5:
    v16 = 0;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "consumerSubType"))
  {
    objc_msgSend(v3, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "consumerSubType");
    v15 = v14 != objc_msgSend(*(id *)(a1 + 32), "consumerSubType");

    v16 = !v15;
  }
  else
  {
    v16 = 1;
  }

  return v16 & 1;
}

void __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(v2);

  }
}

BOOL __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_7(id *a1, void *a2)
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

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(a1[5], "_updateNonTrendPlotSectionsInResult:withFeedbackResult:", a1[6], v3);
    objc_msgSend(a1[6], "trendPlot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionEndDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "binAtDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shownSuggestions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setImpressionCount:", objc_msgSend(v11, "impressionCount") + objc_msgSend(v12, "count"));

      objc_msgSend(v10, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "engagedSuggestions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setEngagementCount:", objc_msgSend(v13, "engagementCount") + objc_msgSend(v14, "count"));

      objc_msgSend(v10, "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rejectedSuggestions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRejectionCount:", objc_msgSend(v15, "rejectionCount") + objc_msgSend(v16, "count"));

    }
  }

  return v6 != v7;
}

- (id)_computeResultForConsumerSubType:(unsigned __int8)a3 query:(id)a4 publisher:(id)a5 resultSpecification:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  ATXUIFeedbackMetricsResult *v15;
  void *v16;
  void *v17;
  ATXUIFeedbackMetricsResult *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  ATXUIFeedbackMetricsResult *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  ATXUIFeedbackMetricsResult *v29;
  _QWORD v31[4];
  id v32;
  ATXUIFeedbackMetricsComputer *v33;
  ATXUIFeedbackMetricsResult *v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[4];
  id v42;
  unsigned __int8 v43;

  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke;
  v41[3] = &unk_1E57CE980;
  v13 = v10;
  v42 = v13;
  v43 = a3;
  objc_msgSend(a5, "filterWithIsIncluded:", v41);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [ATXUIFeedbackMetricsResult alloc];
  objc_msgSend(v13, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXUIFeedbackMetricsResult initWithSpecification:startDate:endDate:](v15, "initWithSpecification:startDate:endDate:", v11, v16, v17);

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__1;
  v39[4] = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v20 = (void *)objc_opt_new();
  v21 = (void *)objc_opt_new();
  v31[0] = v12;
  v31[1] = 3221225472;
  v31[2] = __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_12;
  v31[3] = &unk_1E57CE9C8;
  v22 = v13;
  v32 = v22;
  v33 = self;
  v23 = v18;
  v34 = v23;
  v38 = v39;
  v24 = v19;
  v35 = v24;
  v25 = v20;
  v36 = v25;
  v26 = v21;
  v37 = v26;
  v27 = (id)objc_msgSend(v14, "sinkWithCompletion:shouldContinue:", &__block_literal_global_11, v31);
  v28 = v37;
  v29 = v23;

  _Block_object_dispose(v39, 8);
  return v29;
}

BOOL __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earlierDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v9)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "consumerSubType") == *(unsigned __int8 *)(a1 + 40);

  }
  return v11;
}

void __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_metrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(v2);

  }
}

BOOL __101__ATXUIFeedbackMetricsComputer__computeResultForConsumerSubType_query_publisher_resultSpecification___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "laterDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionEndDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_updateNonTrendPlotSectionsInResult:withFeedbackResult:", *(_QWORD *)(a1 + 48), v3);
    objc_msgSend(v3, "sessionStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));

    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
      objc_msgSend(*(id *)(a1 + 72), "removeAllObjects");
      objc_msgSend(v3, "sessionStartDate");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(*(id *)(a1 + 48), "trendPlot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionEndDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "binAtDate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v50 = v7;
      v51 = v6;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      objc_msgSend(v3, "shownSuggestions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v61 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
            v22 = *(void **)(a1 + 56);
            objc_msgSend(v21, "executableIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v22) = objc_msgSend(v22, "containsObject:", v23);

            if ((v22 & 1) == 0)
            {
              objc_msgSend(v15, "data");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setImpressionCount:", objc_msgSend(v24, "impressionCount") + 1);

              v25 = *(void **)(a1 + 56);
              objc_msgSend(v21, "executableIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v26);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        }
        while (v18);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      objc_msgSend(v3, "engagedSuggestions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v57;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v57 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
            v33 = *(void **)(a1 + 64);
            objc_msgSend(v32, "executableIdentifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v33) = objc_msgSend(v33, "containsObject:", v34);

            if ((v33 & 1) == 0)
            {
              objc_msgSend(v15, "data");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setEngagementCount:", objc_msgSend(v35, "engagementCount") + 1);

              v36 = *(void **)(a1 + 64);
              objc_msgSend(v32, "executableIdentifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "addObject:", v37);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
        }
        while (v29);
      }

      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(v3, "rejectedSuggestions");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v53;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v53 != v41)
              objc_enumerationMutation(v38);
            v43 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * k);
            v44 = *(void **)(a1 + 72);
            objc_msgSend(v43, "executableIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v44) = objc_msgSend(v44, "containsObject:", v45);

            if ((v44 & 1) == 0)
            {
              objc_msgSend(v15, "data");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "setRejectionCount:", objc_msgSend(v46, "rejectionCount") + 1);

              v47 = *(void **)(a1 + 72);
              objc_msgSend(v43, "executableIdentifier");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "addObject:", v48);

            }
          }
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
        }
        while (v40);
      }

      v7 = v50;
      v6 = v51;
    }

  }
  return v6 != v7;
}

- (void)_updateNonTrendPlotSectionsInResult:(id)a3 withFeedbackResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "sectionForShownSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shownSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUIFeedbackMetricsComputer _updateResultSection:withSuggestions:clientModelId:consumerSubType:](self, "_updateResultSection:withSuggestions:clientModelId:consumerSubType:", v8, v9, v10, objc_msgSend(v6, "consumerSubType"));

  objc_msgSend(v7, "sectionForEngagedSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "engagedSuggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUIFeedbackMetricsComputer _updateResultSection:withSuggestions:clientModelId:consumerSubType:](self, "_updateResultSection:withSuggestions:clientModelId:consumerSubType:", v11, v12, v13, objc_msgSend(v6, "consumerSubType"));

  objc_msgSend(v7, "sectionForRejectedSuggestions");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "rejectedSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v6, "consumerSubType");

  -[ATXUIFeedbackMetricsComputer _updateResultSection:withSuggestions:clientModelId:consumerSubType:](self, "_updateResultSection:withSuggestions:clientModelId:consumerSubType:", v17, v14, v15, v16);
}

- (void)_updateResultSection:(id)a3 withSuggestions:(id)a4 clientModelId:(id)a5 consumerSubType:(unsigned __int8)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v6 = a6;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "clientModelBreakdown");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  objc_msgSend(v12, "incrementCountForCategory:by:", v11, objc_msgSend(v10, "count"));

  objc_msgSend(v9, "consumerSubTypeBreakdown");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "incrementCountForCategory:by:", v14, objc_msgSend(v10, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v18);
        objc_msgSend(v9, "scoreDistribution");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "scoreSpecification");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rawScore");
        objc_msgSend(v20, "recordScore:");

        objc_msgSend(v9, "confidenceBreakdown");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v19, "scoreSpecification");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "suggestedConfidenceCategory"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "incrementCountForCategory:by:", v25, 1);

        v26 = objc_msgSend(v19, "predictionReasons");
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __99__ATXUIFeedbackMetricsComputer__updateResultSection_withSuggestions_clientModelId_consumerSubType___block_invoke;
        v29[3] = &unk_1E57CE9F0;
        v30 = v9;
        ATXSuggestionPredictionReasonEnumerateReasonCodes(v26, v29);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v16);
  }

}

void __99__ATXUIFeedbackMetricsComputer__updateResultSection_withSuggestions_clientModelId_consumerSubType___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "predictionReasonCodeBreakdown");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incrementCountForCategory:by:", v3, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)computeResultForQuery:(os_log_t)log resultSpecification:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "ATXUIFeedbackMetricsComputer: Malformed query -- both query.clientModelType and query.consumerSubType are unknown!", v1, 2u);
}

void __97__ATXUIFeedbackMetricsComputer__computeResultForClientModel_query_publisher_resultSpecification___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1AA841000, v2, v3, "ATXUIFeedbackMetricsComputer: Biome query completed with error %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
