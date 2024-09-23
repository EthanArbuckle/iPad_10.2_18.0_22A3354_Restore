@implementation ATXLocationManagerRoutineCR

- (ATXLocationManagerRoutineCR)init
{
  void *v3;
  ATXLocationManagerRoutineCR *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXLocationManagerRoutineCR initWithRoutineManager:](self, "initWithRoutineManager:", v3);

  return v4;
}

- (ATXLocationManagerRoutineCR)initWithRoutineManager:(id)a3
{
  id v5;
  ATXLocationManagerRoutineCR *v6;
  ATXLocationManagerRoutineCR *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXLocationManagerRoutineCR;
  v6 = -[ATXLocationManagerRoutineCR init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_routineManager, a3);

  return v7;
}

- (void)fetchClosestLOIWithinDistance:(double)a3 ofLocation:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  RTRoutineManager *routineManager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  routineManager = self->_routineManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__ATXLocationManagerRoutineCR_fetchClosestLOIWithinDistance_ofLocation_reply___block_invoke;
  v13[3] = &unk_1E942DD50;
  v14 = v8;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](routineManager, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v11, v13, a3);

}

void __78__ATXLocationManagerRoutineCR_fetchClosestLOIWithinDistance_ofLocation_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    +[ATXLocationManagerRoutineCR closestLOI:toLocation:](ATXLocationManagerRoutineCR, "closestLOI:toLocation:", a2, *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    createLOIFromRTLOI(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)fetchLOILocationOfType:(int64_t)a3 reply:(id)a4
{
  id v6;
  RTRoutineManager *routineManager;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  routineManager = self->_routineManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__ATXLocationManagerRoutineCR_fetchLOILocationOfType_reply___block_invoke;
  v9[3] = &unk_1E942DD78;
  v10 = v6;
  v8 = v6;
  -[RTRoutineManager fetchLocationsOfInterestOfType:withHandler:](routineManager, "fetchLocationsOfInterestOfType:withHandler:", a3, v9);

}

void __60__ATXLocationManagerRoutineCR_fetchLOILocationOfType_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a2, "firstObject");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v4 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v11, "location");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "latitude");
      v7 = v6;
      objc_msgSend(v11, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "longitude");
      v10 = (void *)objc_msgSend(v4, "initWithLatitude:longitude:", v7, v9);

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
}

- (void)fetchLOIVisitedDuring:(id)a3 reply:(id)a4
{
  id v6;
  RTRoutineManager *routineManager;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  routineManager = self->_routineManager;
  v8 = a3;
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__ATXLocationManagerRoutineCR_fetchLOIVisitedDuring_reply___block_invoke;
  v12[3] = &unk_1E942DD78;
  v13 = v6;
  v11 = v6;
  -[RTRoutineManager fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:](routineManager, "fetchLocationsOfInterestVisitedBetweenStartDate:endDate:withHandler:", v9, v10, v12);

}

void __59__ATXLocationManagerRoutineCR_fetchLOIVisitedDuring_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1D82448B0](v9);
          createLOIFromRTLOI(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15, (_QWORD)v16);

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v10 = v9;
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)fetchNextPredictedLOIFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 requireHighConfidence:(BOOL)a6 reply:(id)a7
{
  id v12;
  RTRoutineManager *routineManager;
  id v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v12 = a7;
  routineManager = self->_routineManager;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke;
  v15[3] = &unk_1E942DDC8;
  v16 = v12;
  v17 = a6;
  v14 = v12;
  -[RTRoutineManager fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:](routineManager, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", a3, a4, v15, a5);

}

void __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE buf[24];
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v23 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v26 = a1;
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1D82448B0]();
          objc_msgSend(v10, "locationOfInterest");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "type");

          __atxlog_handle_dailyroutines();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "locationOfInterest");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "type");
            objc_msgSend(v10, "confidence");
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = v17;
            _os_log_impl(&dword_1D2C00000, v14, OS_LOG_TYPE_INFO, "Predicted next loi type: %ld, confidence: %lf", buf, 0x16u);

          }
          if (*(_BYTE *)(v26 + 40))
          {
            objc_msgSend(v10, "confidence");
            v19 = v18 >= 1.0;
          }
          else
          {
            v19 = 1;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v33 = 1;
          objc_msgSend(v10, "sources");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke_4;
          v27[3] = &unk_1E942DDA0;
          v27[4] = buf;
          objc_msgSend(v20, "enumerateObjectsUsingBlock:", v27);

          if (v19 && *(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            objc_msgSend(v10, "locationOfInterest");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            createLOIFromRTLOIAndType(v21, v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v22);

          }
          _Block_object_dispose(buf, 8);
          objc_autoreleasePoolPop(v11);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }

    (*(void (**)(void))(*(_QWORD *)(v26 + 32) + 16))();
    v6 = 0;
  }

}

void __116__ATXLocationManagerRoutineCR_fetchNextPredictedLOIFromLocation_startDate_timeInterval_requireHighConfidence_reply___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)fetchPredictedExitDatesFromLocation:(id)a3 onDate:(id)a4 requireHighConfidence:(BOOL)a5 reply:(id)a6
{
  id v10;
  RTRoutineManager *routineManager;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  v10 = a6;
  routineManager = self->_routineManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__ATXLocationManagerRoutineCR_fetchPredictedExitDatesFromLocation_onDate_requireHighConfidence_reply___block_invoke;
  v13[3] = &unk_1E942DDC8;
  v14 = v10;
  v15 = a5;
  v12 = v10;
  -[RTRoutineManager fetchPredictedExitDatesFromLocation:onDate:withHandler:](routineManager, "fetchPredictedExitDatesFromLocation:onDate:withHandler:", a3, a4, v13);

}

void __102__ATXLocationManagerRoutineCR_fetchPredictedExitDatesFromLocation_onDate_requireHighConfidence_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          __atxlog_handle_dailyroutines();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "date");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "uncertainty");
            v16 = v15;
            objc_msgSend(v12, "confidence");
            *(_DWORD *)buf = 138412802;
            v26 = v14;
            v27 = 2048;
            v28 = v16;
            v29 = 2048;
            v30 = v17;
            _os_log_impl(&dword_1D2C00000, v13, OS_LOG_TYPE_INFO, "Predicted Exit Time: %@, uncertainty: %lf, confidence %lf", buf, 0x20u);

          }
          if (*(_BYTE *)(a1 + 40))
          {
            objc_msgSend(v12, "confidence");
            if (v18 < 0.75)
              continue;
          }
          objc_msgSend(v12, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v19);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v20;
  }

}

- (unint64_t)fetchRoutineModeFromLocation:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  RTRoutineManager *routineManager;
  NSObject *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = dispatch_semaphore_create(0);
  routineManager = self->_routineManager;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke;
  v13 = &unk_1E942DDF0;
  v15 = &v16;
  v7 = v5;
  v14 = v7;
  -[RTRoutineManager fetchRoutineModeFromLocation:withHandler:](routineManager, "fetchRoutineModeFromLocation:withHandler:", v4, &v10);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:onAcquire:onTimeout:", v7, 0, &__block_literal_global_5, 1.0, v10, v11, v12, v13);
  v8 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  if (!v5)
  {
    switch(a2)
    {
      case 0:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        goto LABEL_12;
      case 2:
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = 1;
        break;
      case 1:
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = 2;
        break;
      default:
        goto LABEL_12;
    }
    *(_QWORD *)(v7 + 24) = v8;
    goto LABEL_12;
  }
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_cold_1((uint64_t)v5, v6);

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9()
{
  NSObject *v0;

  __atxlog_handle_default();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9_cold_1(v0);

}

+ (id)closestLOI:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v27;
    v11 = INFINITY;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v13, "location");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "latitude");
        v17 = v16;
        objc_msgSend(v13, "location");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "longitude");
        v20 = (void *)objc_msgSend(v14, "initWithLatitude:longitude:", v17, v19);

        objc_msgSend(v6, "distanceFromLocation:", v20);
        if (v21 < v11)
        {
          v22 = v21;
          v23 = v13;

          v11 = v22;
          v9 = v23;
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_ERROR, "Error while fetching routine mode from CoreRoutine. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ATXLocationManagerRoutineCR_fetchRoutineModeFromLocation___block_invoke_9_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "CoreRoutine did not return any routine mode. Returning ATXRoutineModeUnknown.", v1, 2u);
}

@end
