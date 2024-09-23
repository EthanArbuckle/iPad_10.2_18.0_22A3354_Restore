@implementation ATXModeExerciseFeaturizer

- (id)provideFeatures
{
  ATXModeFeatureSet *v3;

  v3 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v3, "setValue:forBinaryFeatureOfType:", -[ATXModeExerciseFeaturizer isInWorkout](self, "isInWorkout"), 3);
  return v3;
}

- (void)beginListening
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "Failed to register Core Duet contextual change handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  ATXModeFeatureSet *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D15CB8]);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject value](v6, "value");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        objc_msgSend(MEMORY[0x1E0D15C58], "sessionState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_modes();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138412290;
          v30 = v11;
          _os_log_impl(&dword_1D2C00000, v12, OS_LOG_TYPE_DEFAULT, "Workout state string: %@", (uint8_t *)&v29, 0xCu);
        }

        __HKWorkoutSessionStateName(2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "isEqualToString:", v13);

        objc_msgSend(WeakRetained, "setIsInWorkout:", v14);
        v15 = objc_alloc_init(ATXModeFeatureSet);
        -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v15, "setValue:forBinaryFeatureOfType:", v14, 3);
        objc_msgSend(WeakRetained, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "featurizer:didUpdateFeatures:", WeakRetained, v15);

      }
      else
      {
        __atxlog_handle_modes();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_3((uint64_t)v7, v9, v23, v24, v25, v26, v27, v28);
      }

    }
    else
    {
      __atxlog_handle_modes();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_2((uint64_t)v4, v8, v17, v18, v19, v20, v21, v22);
    }

  }
  else
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_1();
  }

}

- (void)stopListening
{
  _CDContextualChangeRegistration *registration;

  if (self->_registration)
  {
    -[_CDClientContext deregisterCallback:](self->_userContext, "deregisterCallback:");
    registration = self->_registration;
    self->_registration = 0;

  }
}

- (id)_createWorkoutPredicate
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)getHKWorkoutClass_softClass;
  v16 = getHKWorkoutClass_softClass;
  if (!getHKWorkoutClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getHKWorkoutClass_block_invoke;
    v12[3] = &unk_1E942DF08;
    v12[4] = &v13;
    __getHKWorkoutClass_block_invoke((uint64_t)v12);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v3, "_allWorkoutActivityTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_opt_new();
    __HKWorkoutSessionStateName(2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v5, "addObject:", v6);

    __HKWorkoutSessionStateName(3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v5, "addObject:", v7);

    v8 = (void *)MEMORY[0x1E0D15CA0];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForFirstPartyWorkoutMatchingTypes:states:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXModeExerciseFeaturizer _createWorkoutPredicate].cold.1();
    v10 = 0;
  }

  return v10;
}

- (void)_setUpContextIfNecessary
{
  _CDClientContext *v3;
  _CDClientContext *userContext;

  if (!self->_userContext)
  {
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v3 = (_CDClientContext *)objc_claimAutoreleasedReturnValue();
    userContext = self->_userContext;
    self->_userContext = v3;

  }
}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isInWorkout
{
  return self->_isInWorkout;
}

- (void)setIsInWorkout:(BOOL)a3
{
  self->_isInWorkout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_registration, 0);
  objc_storeStrong((id *)&self->_userContext, 0);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "self went away", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D2C00000, a2, a3, "No workout payload: %@", a5, a6, a7, a8, 2u);
}

void __43__ATXModeExerciseFeaturizer_beginListening__block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D2C00000, a2, a3, "Workout payload is not dictionary: %@", a5, a6, a7, a8, 2u);
}

- (void)_createWorkoutPredicate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1D2C00000, v0, v1, "Unable to retrieve all workout types from HealthKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_4();
}

@end
