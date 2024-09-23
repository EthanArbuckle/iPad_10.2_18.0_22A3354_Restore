@implementation RTBackgroundInertialOdometryManager

- (RTBackgroundInertialOdometryManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBackgroundInertialOdometryStore_);
}

- (RTBackgroundInertialOdometryManager)initWithBackgroundInertialOdometryStore:(id)a3
{
  id v5;
  RTBackgroundInertialOdometryManager *v6;
  RTBackgroundInertialOdometryManager *v7;
  RTBackgroundInertialOdometryManager *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTBackgroundInertialOdometryManager;
    v6 = -[RTNotifier init](&v11, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_inertialOdometryStore, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inertialOdometryStore", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (void)_fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTBackgroundInertialOdometryManager inertialOdometryStore](self, "inertialOdometryStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchStoredBackgroundInertialOdometrySamplesWithOptions:handler:", v7, v6);

}

- (void)fetchBackgroundInertialOdometrySamplesWithOptions:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[RTBackgroundInertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:]";
    v19 = 1024;
    v20 = 53;
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTBackgroundInertialOdometryManager fetchBackgroundInertialOdometrySamplesWithOptions:handler:]";
      v19 = 1024;
      v20 = 54;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__RTBackgroundInertialOdometryManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

uint64_t __97__RTBackgroundInertialOdometryManager_fetchBackgroundInertialOdometrySamplesWithOptions_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchBackgroundInertialOdometrySamplesWithOptions:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    -[RTBackgroundInertialOdometryManager inertialOdometryStore](self, "inertialOdometryStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__RTBackgroundInertialOdometryManager__addBackgroundInertialOdometrySamples_handler___block_invoke;
    v14[3] = &unk_1E9298100;
    v14[4] = self;
    v16 = a2;
    v15 = v8;
    objc_msgSend(v9, "storeWritableObjects:handler:", v7, v14);

  }
  else if (v8)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D18598];
    v17 = *MEMORY[0x1E0CB2D50];
    v18[0] = CFSTR("requires valid inertial odometry samples.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v13);

  }
}

void __85__RTBackgroundInertialOdometryManager__addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "%@:%@,error,%@", (uint8_t *)&v9, 0x20u);

    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)addBackgroundInertialOdometrySamples:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  RTBackgroundInertialOdometryManager *v17;
  id v18;
  SEL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[RTBackgroundInertialOdometryManager addBackgroundInertialOdometrySamples:handler:]";
    v22 = 1024;
    v23 = 91;
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: samples (in %s:%d)", buf, 0x12u);
  }

  if (!v9)
  {
LABEL_7:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTBackgroundInertialOdometryManager addBackgroundInertialOdometrySamples:handler:]";
      v22 = 1024;
      v23 = 92;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_10:
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke;
  v15[3] = &unk_1E9297590;
  v16 = v7;
  v17 = self;
  v18 = v9;
  v19 = a2;
  v13 = v9;
  v14 = v7;
  dispatch_async(v12, v15);

}

uint64_t __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2;
  v5[3] = &unk_1E929EAC0;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 40);
  v5[5] = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  return objc_msgSend(*(id *)(a1 + 40), "_addBackgroundInertialOdometrySamples:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

void __84__RTBackgroundInertialOdometryManager_addBackgroundInertialOdometrySamples_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@:%@, %@: %@", (uint8_t *)&v10, 0x2Au);

  }
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  RTBackgroundInertialOdometryManager *v16;
  id v17;
  int64_t v18;
  SEL v19;

  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke;
  block[3] = &unk_1E92971C8;
  v17 = v10;
  v18 = a3;
  v15 = v9;
  v16 = self;
  v19 = a2;
  v12 = v10;
  v13 = v9;
  dispatch_async(v11, block);

}

void __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 56) <= 2uLL && (v2 = *(id *)(a1 + 32)) != 0)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "inertialOdometryStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke_2;
    v5[3] = &unk_1E92971A0;
    v7 = *(_QWORD *)(a1 + 64);
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v4, "purgeBackgroundInertialOdometrySamplesPredating:handler:", v3, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __83__RTBackgroundInertialOdometryManager_performPurgeOfType_referenceDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBackgroundInertialOdometry);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, performPurgeOfType, error, %@", (uint8_t *)&v6, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)vendedClasses
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)vendedClasses_vendedClasses_2;
  if (!vendedClasses_vendedClasses_2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    v4 = (void *)vendedClasses_vendedClasses_2;
    vendedClasses_vendedClasses_2 = v3;

    v2 = (void *)vendedClasses_vendedClasses_2;
  }
  return v2;
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  RTBackgroundInertialOdometryManager *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88__RTBackgroundInertialOdometryManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
    v12[3] = &unk_1E92994E0;
    v13 = v8;
    v14 = self;
    v15 = v9;
    v16 = a4;
    dispatch_async(v10, v12);

    v11 = v13;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

void __88__RTBackgroundInertialOdometryManager_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "enumeratedType");
    objc_msgSend((id)objc_opt_class(), "vendedClasses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "member:", v3);

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "inertialOdometryStore");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchEnumerableObjectsWithOptions:offset:handler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

      return;
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v14 = *MEMORY[0x1E0CB2D50];
    v15 = CFSTR("the type specified by options is not vended by this manager");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v15;
    v10 = &v14;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D18598];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("options cannot be nil");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = (const __CFString **)v17;
    v10 = &v16;
  }
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (CLLocationManagerRoutine)routineLocationManager
{
  return self->_routineLocationManager;
}

- (void)setRoutineLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineLocationManager, a3);
}

- (RTBackgroundInertialOdometryStore)inertialOdometryStore
{
  return self->_inertialOdometryStore;
}

- (void)setInertialOdometryStore:(id)a3
{
  objc_storeStrong((id *)&self->_inertialOdometryStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inertialOdometryStore, 0);
  objc_storeStrong((id *)&self->_routineLocationManager, 0);
}

@end
