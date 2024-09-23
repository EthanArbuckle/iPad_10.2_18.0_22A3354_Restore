@implementation ATXPOICategoryEventAggregator

- (id)groupVisitsFromPublisher:(id)a3 startTimestamp:(double)a4 endTimestamp:(double)a5
{
  id v7;
  void *v8;
  ATXPOICategoryEnterAndExitEvents *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  ATXPOICategoryGroupingResult *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  double v24;
  double v25;
  _QWORD v26[5];
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[ATXPOICategoryEnterAndExitEvents initWithCategoryEvents:exitEvent:]([ATXPOICategoryEnterAndExitEvents alloc], "initWithCategoryEvents:exitEvent:", 0, 0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__18;
  v32 = __Block_byref_object_dispose__18;
  v33 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke;
  v27[3] = &__block_descriptor_48_e22_B16__0__BMStoreEvent_8l;
  *(double *)&v27[4] = a4;
  *(double *)&v27[5] = a5;
  objc_msgSend(v7, "filterWithIsIncluded:", v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scanWithInitial:nextPartialResult:", v9, &__block_literal_global_19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v26[1] = 3221225472;
  v26[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_5;
  v26[3] = &unk_1E942F0E0;
  v26[4] = &v28;
  objc_msgSend(v12, "filterWithIsIncluded:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mapWithTransform:", &__block_literal_global_9_1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3;
  v22[3] = &unk_1E942F148;
  v23 = v8;
  v24 = a4;
  v25 = a5;
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_12;
  v20[3] = &unk_1E942F170;
  v15 = v23;
  v21 = v15;
  v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", v22, v20);

  objc_msgSend((id)v29[5], "visitEventAllowingMissingExit:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ATXPOICategoryGroupingResult initWithEvents:finalPOIWithoutExit:]([ATXPOICategoryGroupingResult alloc], "initWithEvents:finalPOIWithoutExit:", v15, v17);

  _Block_object_dispose(&v28, 8);
  return v18;
}

BOOL __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  _BOOL8 v5;
  double v6;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  if (v4 >= *(double *)(a1 + 32))
  {
    objc_msgSend(v3, "timestamp");
    v5 = v6 <= *(double *)(a1 + 40);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

ATXPOICategoryEnterAndExitEvents *__86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  ATXPOICategoryEnterAndExitEvents *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  ATXPOICategoryEnterAndExitEvents *v20;
  ATXPOICategoryEnterAndExitEvents *v21;
  ATXPOICategoryEnterAndExitEvents *v22;
  ATXPOICategoryEnterAndExitEvents *v23;
  void *v24;
  ATXPOICategoryEnterAndExitEvents *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  ATXPOICategoryEnterAndExitEvents *v32;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  id v63;
  _QWORD v64[2];

  v64[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "exitEvent");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "exitEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "poiCategory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ATXDefaultHeroPOICategory"));

    if ((v11 & 1) == 0)
    {
      v12 = [ATXPOICategoryEnterAndExitEvents alloc];
      objc_msgSend(v4, "exitEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ATXPOICategoryEnterAndExitEvents initWithCategoryEvents:exitEvent:](v12, "initWithCategoryEvents:exitEvent:", v14, 0);

      v4 = (id)v15;
    }
  }
  objc_msgSend(v4, "exitEvent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    objc_msgSend(v4, "categoryEnterEvents");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v5, "eventBody");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "poiCategory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("ATXDefaultHeroPOICategory"));

      if (v31)
        goto LABEL_13;
      objc_msgSend(v4, "categoryEnterEvents");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (!v35)
      {
        __atxlog_handle_anchor();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(v43, v44, v45, v46, v47, v48, v49, v50);

        v20 = [ATXPOICategoryEnterAndExitEvents alloc];
        goto LABEL_7;
      }
      objc_msgSend(v4, "categoryEnterEvents");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "eventBody");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "poiCategory");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventBody");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "poiCategory");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v39, "isEqualToString:", v41);

      if (v42)
      {
        v22 = (ATXPOICategoryEnterAndExitEvents *)v4;
        goto LABEL_8;
      }
      objc_msgSend(v4, "categoryEnterEvents");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "eventBody");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "timestamp");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "timeIntervalSinceReferenceDate");
      v56 = v55;
      objc_msgSend(v5, "eventBody");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "timestamp");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "timeIntervalSinceReferenceDate");
      v60 = v56 - v59;

      v61 = -v60;
      if (v60 >= 0.0)
        v61 = v60;
      if (v61 >= 2.22044605e-16)
      {
LABEL_13:
        v32 = [ATXPOICategoryEnterAndExitEvents alloc];
        objc_msgSend(v4, "categoryEnterEvents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v32;
        v26 = v24;
        v27 = v5;
        goto LABEL_14;
      }
      objc_msgSend(v4, "categoryEnterEvents");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v62, "mutableCopy");

      objc_msgSend(v24, "addObject:", v5);
      v25 = [ATXPOICategoryEnterAndExitEvents alloc];
LABEL_10:
      v26 = v24;
      v27 = 0;
LABEL_14:
      v23 = -[ATXPOICategoryEnterAndExitEvents initWithCategoryEvents:exitEvent:](v25, "initWithCategoryEvents:exitEvent:", v26, v27);

      goto LABEL_15;
    }
  }
  objc_msgSend(v5, "eventBody");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "poiCategory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ATXDefaultHeroPOICategory"));

  v20 = [ATXPOICategoryEnterAndExitEvents alloc];
  v21 = v20;
  if (!v19)
  {
    v63 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    goto LABEL_10;
  }
LABEL_7:
  v22 = -[ATXPOICategoryEnterAndExitEvents initWithCategoryEvents:exitEvent:](v20, "initWithCategoryEvents:exitEvent:", 0, 0);
LABEL_8:
  v23 = v22;
LABEL_15:

  return v23;
}

BOOL __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_5(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  ATXPOICategoryEnterAndExitEvents *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "visitEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "poiCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ATXDefaultHeroPOICategory"));

  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
  else if (v5)
  {
    v12 = [ATXPOICategoryEnterAndExitEvents alloc];
    objc_msgSend(v4, "exitEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ATXPOICategoryEnterAndExitEvents initWithCategoryEvents:exitEvent:](v12, "initWithCategoryEvents:exitEvent:", v14, 0);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

  return v5 != 0;
}

uint64_t __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "visitEvent");
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = 138412802;
    v11 = v7;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_INFO, "Successfully fetched %@ Biome events for POI Category between %f and %f", (uint8_t *)&v10, 0x20u);

  }
}

uint64_t __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_12(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1D2C00000, a1, a3, "Scanning POI Category stream produced empty array", a5, a6, a7, a8, 0);
}

void __86__ATXPOICategoryEventAggregator_groupVisitsFromPublisher_startTimestamp_endTimestamp___block_invoke_3_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v4;
  v9 = 2048;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D2C00000, a3, OS_LOG_TYPE_ERROR, "Error encountered while fetching events from Biome for POI Category between %f and %f: %@", (uint8_t *)&v7, 0x20u);

}

@end
