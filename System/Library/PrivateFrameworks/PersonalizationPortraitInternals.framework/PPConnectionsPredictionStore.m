@implementation PPConnectionsPredictionStore

- (PPConnectionsPredictionStore)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  PPConnectionsPredictionStore *v11;

  +[PPConnectionsParameters sharedInstance](PPConnectionsParameters, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsPasteboardSource sharedInstance](PPConnectionsPasteboardSource, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsCalendarSource sharedInstance](PPConnectionsCalendarSource, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsDuetSource sharedInstance](PPConnectionsDuetSource, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsNamedEntitySource sharedInstance](PPConnectionsNamedEntitySource, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsFoundInAppsSource sharedInstance](PPConnectionsFoundInAppsSource, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPConnectionsMetricsTracker sharedInstance](PPConnectionsMetricsTracker, "sharedInstance");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v3 && v4 && v5 && v6 && v7 && v8 && v9)
  {
    self = -[PPConnectionsPredictionStore initWithParameters:pasteboardSource:calendarSource:duetSource:namedEntitySource:fiaSource:metricsTracker:](self, "initWithParameters:pasteboardSource:calendarSource:duetSource:namedEntitySource:fiaSource:metricsTracker:", v3, v4, v5, v6, v7, v8, v9);
    v11 = self;
  }

  return v11;
}

- (PPConnectionsPredictionStore)initWithParameters:(id)a3 pasteboardSource:(id)a4 calendarSource:(id)a5 duetSource:(id)a6 namedEntitySource:(id)a7 fiaSource:(id)a8 metricsTracker:(id)a9
{
  id v16;
  id v17;
  PPConnectionsPredictionStore *v18;
  PPConnectionsPredictionStore *v19;
  uint64_t v20;
  OS_dispatch_queue *predictionQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v16 = a8;
  v17 = a9;
  v28.receiver = self;
  v28.super_class = (Class)PPConnectionsPredictionStore;
  v18 = -[PPConnectionsPredictionStore init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_parameters, a3);
    objc_storeStrong((id *)&v19->_pasteboardSource, a4);
    objc_storeStrong((id *)&v19->_calendarSource, a5);
    objc_storeStrong((id *)&v19->_duetSource, a6);
    objc_storeStrong((id *)&v19->_namedEntitySource, a7);
    objc_storeStrong((id *)&v19->_fiaSource, a8);
    objc_storeStrong((id *)&v19->_metricsTracker, a9);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPConnectionsPredictionStore.prediction", 25);
    v20 = objc_claimAutoreleasedReturnValue();
    predictionQueue = v19->_predictionQueue;
    v19->_predictionQueue = (OS_dispatch_queue *)v20;

  }
  return v19;
}

- (id)recentLocationsForConsumer:(unint64_t)a3 criteria:(id)a4 limit:(unint64_t)a5 explanationSet:(id)a6 timeout:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  PPConnectionsDuetSource *duetSource;
  void *v22;
  double v23;
  void *v24;
  PPConnectionsCalendarSource *calendarSource;
  void *v26;
  void *v27;
  PPConnectionsNamedEntitySource *namedEntitySource;
  void *v29;
  PPConnectionsFoundInAppsSource *fiaSource;
  void *v31;
  PPConnectionsPasteboardSource *pasteboardSource;
  void *v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *context;
  _QWORD v43[7];
  uint8_t v44[4];
  void *v45;
  _BYTE buf[24];
  unint64_t v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a6;
  context = (void *)MEMORY[0x1C3BD6630]();
  pp_connections_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (double)a7 / 1000000000.0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2048;
    v47 = a5;
    LOWORD(v48) = 2048;
    *(double *)((char *)&v48 + 2) = (double)a7 / 1000000000.0;
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: c:%tu cr:%@ l:%tu t:%f", buf, 0x2Au);
  }

  v17 = objc_alloc(MEMORY[0x1E0D815F0]);
  v18 = (void *)objc_opt_new();
  v19 = (void *)objc_msgSend(v17, "initWithGuardedData:", v18);

  v20 = dispatch_group_create();
  duetSource = self->_duetSource;
  v22 = (void *)MEMORY[0x1E0C99D68];
  -[PPConnectionsParameters userActivityExpirySeconds](self->_parameters, "userActivityExpirySeconds");
  objc_msgSend(v22, "dateWithTimeIntervalSinceNow:", -v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, duetSource, a3, v13, v24, 0, a5, v14);

  calendarSource = self->_calendarSource;
  v26 = (void *)MEMORY[0x1E0C99D68];
  -[PPConnectionsParameters calendarEventLocationLookaheadTimeSeconds](self->_parameters, "calendarEventLocationLookaheadTimeSeconds");
  objc_msgSend(v26, "dateWithTimeIntervalSinceNow:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, calendarSource, a3, v13, 0, v27, a5, v14);

  namedEntitySource = self->_namedEntitySource;
  -[PPConnectionsPredictionStore cutoffNamedEntityTime]((id *)&self->super.isa);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, namedEntitySource, a3, v13, v29, 0, a5, v14);

  fiaSource = self->_fiaSource;
  -[PPConnectionsPredictionStore cutoffNamedEntityTime]((id *)&self->super.isa);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, fiaSource, a3, v13, v31, 0, a5, v14);

  pasteboardSource = self->_pasteboardSource;
  v33 = (void *)MEMORY[0x1E0C99D68];
  -[PPConnectionsParameters pasteboardItemExpirySeconds](self->_parameters, "pasteboardItemExpirySeconds");
  objc_msgSend(v33, "dateWithTimeIntervalSinceNow:", -v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsPredictionStore _asyncFillLocationData:group:source:consumer:criteria:earliestDate:latestDate:limit:explanationSet:]((uint64_t)self, v19, v20, pasteboardSource, a3, v13, v35, 0, a5, v14);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v47 = (unint64_t)__Block_byref_object_copy__7883;
  *(_QWORD *)&v48 = __Block_byref_object_dispose__7884;
  *((_QWORD *)&v48 + 1) = 0;
  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v20, v16) == 1)
  {
    pp_connections_log_handle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_1C392E000, v36, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore recentLocationsForConsumer timed out before all sources responded.", v44, 2u);
    }

  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke;
  v43[3] = &unk_1E7E18560;
  v43[4] = buf;
  v43[5] = a3;
  v43[6] = a5;
  objc_msgSend(v19, "runWithLockAcquired:", v43);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_27);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "_pas_componentsJoinedByString:", CFSTR(", "));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  pp_connections_log_handle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v44 = 138412290;
    v45 = v38;
    _os_log_impl(&dword_1C392E000, v39, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: returning items from: %@", v44, 0xCu);
  }

  v40 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(context);
  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionQueue, 0);
  objc_storeStrong((id *)&self->_metricsTracker, 0);
  objc_storeStrong((id *)&self->_fiaSource, 0);
  objc_storeStrong((id *)&self->_namedEntitySource, 0);
  objc_storeStrong((id *)&self->_duetSource, 0);
  objc_storeStrong((id *)&self->_calendarSource, 0);
  objc_storeStrong((id *)&self->_pasteboardSource, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)_asyncFillLocationData:(NSObject *)a3 group:(void *)a4 source:(uint64_t)a5 consumer:(void *)a6 criteria:(void *)a7 earliestDate:(void *)a8 latestDate:(uint64_t)a9 limit:(void *)a10 explanationSet:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;

  v17 = a2;
  v18 = a4;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  if (a1)
  {
    v23 = *(NSObject **)(a1 + 64);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke;
    v24[3] = &unk_1E7E184F8;
    v25 = v18;
    v26 = v19;
    v27 = v20;
    v28 = v21;
    v31 = a9;
    v32 = a5;
    v29 = v22;
    v30 = v17;
    dispatch_group_async(a3, v23, v24);

  }
}

- (id)cutoffNamedEntityTime
{
  void *v1;
  double v2;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(a1[1], "namedEntitySourceLookBackSeconds");
    objc_msgSend(v1, "dateWithTimeIntervalSinceNow:", -v2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke(_QWORD *a1, void *a2)
{
  id *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_connections_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3[1], "count");
    v13 = 134217984;
    v14 = v5;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: recentLocationsForConsumer: %tu items total.", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v3[1], "sortUsingComparator:", &__block_literal_global_7893);
  if (a1[5] == 2)
    objc_msgSend(v3[1], "sortUsingComparator:", &__block_literal_global_25);
  v6 = v3[1];
  v7 = a1[6];
  v8 = objc_msgSend(v6, "count");
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(v6, "subarrayWithRange:", 0, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[4] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source");
}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("foundinapps")) & 1) != 0)
  {
    objc_msgSend(v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("namedentity"));

    if ((v8 & 1) != 0)
    {
      v9 = -1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("foundinapps")) & 1) != 0)
  {
    objc_msgSend(v4, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("namedentity"));

    v9 = v12;
  }
  else
  {

    v9 = 0;
  }
LABEL_8:

  return v9;
}

uint64_t __103__PPConnectionsPredictionStore_recentLocationsForConsumer_criteria_limit_explanationSet_timeout_error___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  v4 = a3;
  objc_msgSend(a2, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("pasteboard"));

  if ((v6 & 1) != 0)
  {
    v7 = -1;
  }
  else
  {
    objc_msgSend(v4, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("pasteboard"));

    v7 = v9;
  }

  return v7;
}

void __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  pp_connections_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_connections_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v7;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "locationItemsWithCriteria:earliest:latest:limit:consumer:explanationSet:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pp_connections_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      v29 = 2048;
      v30 = v12;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: %@: %tu items", buf, 0x16u);

    }
    v13 = *(void **)(a1 + 72);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke_18;
    v23[3] = &unk_1E7E184D0;
    v24 = v8;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 88);
    v25 = v14;
    v26 = v15;
    objc_msgSend(v13, "runWithLockAcquired:", v23);
    pp_connections_signpost_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v18;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v17, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);

    }
    v19 = v24;
  }
  else
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v20;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsPredictionStore: %@: returned nil", buf, 0xCu);

    }
    pp_connections_signpost_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_END, v3, "PPConnectionsPredictionStore.recentLocationsForConsumer", "%@", buf, 0xCu);

    }
  }

}

void __131__PPConnectionsPredictionStore__asyncFillLocationData_group_source_consumer_criteria_earliestDate_latestDate_limit_explanationSet___block_invoke_18(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  NSObject *v32;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v37;
    v34 = *MEMORY[0x1E0D70E20];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        objc_msgSend(v8, "originatingBundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if (v11)
        {
          pp_connections_log_handle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 40), "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v41 = v13;
            v14 = v12;
            v15 = "PPConnectionsPredictionStore: rejecting location from %@ due to user settings.";
            goto LABEL_14;
          }
          goto LABEL_18;
        }
        v16 = *(_QWORD *)(a1 + 48);
        if (v16 == 4 || v16 == 2)
        {
          objc_msgSend(v8, "originatingBundleID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v34);

          if (v18)
          {
            pp_connections_log_handle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v41 = v13;
              v14 = v12;
              v15 = "PPConnectionsPredictionStore: rejecting location from %@ since its from Maps and Maps is the consumer.";
LABEL_14:
              _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);

            }
LABEL_18:

            goto LABEL_19;
          }
        }
        objc_msgSend(v8, "value");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = (void *)v3[2];
          objc_msgSend(v8, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v21) = objc_msgSend(v21, "containsObject:", v22);

          if ((v21 & 1) == 0)
          {
            v27 = v3;
            pp_connections_log_handle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v41 = v30;
              v31 = "PPConnectionsPredictionStore: using location from %@";
              goto LABEL_30;
            }
LABEL_31:

            v3 = v27;
            objc_msgSend((id)v27[1], "addObject:", v8);
            goto LABEL_32;
          }
        }
        objc_msgSend(v8, "value");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
          goto LABEL_18;
        objc_msgSend(v8, "mapItemURL");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)v23;
          v25 = (void *)v3[2];
          objc_msgSend(v8, "mapItemURL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "absoluteString");
          v27 = v3;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v25) = objc_msgSend(v25, "containsObject:", v28);

          v3 = v27;
          if ((v25 & 1) == 0)
          {
            pp_connections_log_handle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 40), "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v41 = v30;
              v31 = "PPConnectionsPredictionStore: using location with mapItemURL from %@";
LABEL_30:
              _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);

            }
            goto LABEL_31;
          }
        }
LABEL_19:
        ++v7;
      }
      while (v5 != v7);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      v5 = v29;
    }
    while (v29);
  }
LABEL_32:

}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  pthread_mutex_lock(&defaultStore_lock_7922);
  if (!defaultStore_instance_7923)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance_7923;
    defaultStore_instance_7923 = v2;

    if (!defaultStore_instance_7923)
    {
      pp_connections_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPConnectionsPredictionStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }

    }
  }
  v5 = (id)defaultStore_instance_7923;
  pthread_mutex_unlock(&defaultStore_lock_7922);
  return v5;
}

@end
