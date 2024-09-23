@implementation RTElevationProvider

- (RTElevationProvider)initWithAltimeter:(id)a3
{
  id v5;
  RTElevationProvider *v6;
  RTElevationProvider *v7;
  RTElevationProvider *v8;
  NSObject *v9;
  const char *v10;
  id v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTElevationProvider;
  v6 = -[RTElevationProvider init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (const char *)-[RTElevationProvider UTF8String](objc_retainAutorelease(v8), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v8);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = (const char *)objc_msgSend(v11, "UTF8String");

    }
    v12 = dispatch_queue_create(v10, v9);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_altimeter, a3);
  }

  return v7;
}

- (void)_fetchElevations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  uint64_t v9;
  uint64_t v10;
  CMAltimeter *altimeter;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[5];
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t buf[8];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[RTElevationProvider hasAltimeter](self, "hasAltimeter"))
  {
    v8 = dispatch_semaphore_create(0);
    v9 = objc_msgSend(v6, "batchSize");
    if (v9)
      v10 = v9;
    else
      v10 = 100;
    altimeter = self->_altimeter;
    objc_msgSend(v6, "dateInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __48__RTElevationProvider__fetchElevations_handler___block_invoke;
    v34[3] = &unk_1E9298908;
    v34[4] = self;
    v36 = v7;
    v16 = v8;
    v35 = v16;
    v37 = v10;
    -[CMAltimeter queryElevationProfileFromDate:toDate:withBatchSize:withHandler:](altimeter, "queryElevationProfileFromDate:toDate:withBatchSize:withHandler:", v13, v15, v10, v34);

    v17 = v16;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v17, v19))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceDate:", v18);
      v21 = v20;
      v22 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0D18598];
      v38 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v38, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 15, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
    }

  }
  else
  {
    v32 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = objc_msgSend(v32, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 1, 0);
    (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, MEMORY[0x1E0C9AA60], v17);
  }

}

void __48__RTElevationProvider__fetchElevations_handler___block_invoke(uint64_t a1, void *a2, _BYTE *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  void *v34;
  _BYTE *v35;
  id v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v44 = v34;
      v45 = 2112;
      v46 = (uint64_t)v8;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@: received error from queryElevationProfileFromDate: %@", buf, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v35 = a3;
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v36 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v40;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v40 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v14);
          v16 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v15, "timestamp");
          v17 = (void *)objc_msgSend(v16, "initWithTimeIntervalSinceReferenceDate:");
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v17, -2.56);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v18, v17);
          v20 = objc_alloc(MEMORY[0x1E0D18370]);
          objc_msgSend(v15, "altitude");
          v22 = v21;
          objc_msgSend(v15, "accuracy");
          v24 = (void *)objc_msgSend(v20, "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v19, 0, v22, v23);
          if (objc_msgSend(v24, "isValid"))
          {
            objc_msgSend(v38, "addObject:", v24);
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityElevation);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v44 = v37;
              v45 = 2112;
              v46 = (uint64_t)v24;
              _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "%@: received invalid elevation, %@", buf, 0x16u);

            }
          }

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v12);
    }

    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v38, "count");
      v31 = *(_QWORD *)(a1 + 56);
      v32 = *v35;
      *(_DWORD *)buf = 138413058;
      v44 = v29;
      v45 = 2048;
      v46 = v30;
      v47 = 2048;
      v48 = v31;
      v49 = 2048;
      v50 = v32;
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, "%@: received elevations, %lu, batchSize: %lu, lastBatch, %lu", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = 0;
    if (*v35)
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

    v7 = v36;
  }

}

- (void)fetchElevations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTElevationProvider queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTElevationProvider_fetchElevations_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __47__RTElevationProvider_fetchElevations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchElevations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)hasAltimeter
{
  return self->_altimeter != 0;
}

- (CMAltimeter)altimeter
{
  return self->_altimeter;
}

- (void)setAltimeter:(id)a3
{
  objc_storeStrong((id *)&self->_altimeter, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_altimeter, 0);
}

@end
