@implementation ATXModeMicrolocationFeaturizer

- (id)provideFeatures
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20[2];
  id location;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "[%@][%@] Requesting feature set via pull based feature provider", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "MicroLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Localization");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D1E8, &unk_1E943D1E8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "filterWithIsIncluded:", &__block_literal_global_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2;
  v19[3] = &unk_1E942DB10;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a2;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_14;
  v18[3] = &unk_1E942DB38;
  v18[4] = buf;
  v15 = (id)objc_msgSend(v13, "sinkWithCompletion:receiveInput:", v19, v18);

  -[ATXModeMicrolocationFeaturizer _provideFeaturesWithLocalizationEvent:](self, "_provideFeaturesWithLocalizationEvent:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(v20);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
  return v16;
}

uint64_t __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("focus-mode"));

  return v4;
}

void __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2_cold_1((const char *)a1, v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (void *)objc_opt_class();
    v9 = *(const char **)(a1 + 40);
    v10 = v8;
    NSStringFromSelector(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Successfully fetched last event from BMMicroLocationRestrictedLocalizationStream", (uint8_t *)&v12, 0x16u);

  }
}

void __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_provideFeaturesWithLocalizationEvent:(id)a3
{
  id v3;
  ATXModeFeatureSet *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v59;
  ATXModeFeatureSet *v60;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(ATXModeFeatureSet);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "absoluteTimeStamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    if (v8 > 900.0)
    {
      __atxlog_handle_modes();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_opt_class();
        v11 = v10;
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v69 = v10;
        v70 = 2112;
        v71 = v12;
        v72 = 2048;
        v73 = 0x408C200000000000;
        _os_log_impl(&dword_1D2C00000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@] Warning: Localization scan was unexpectedly delayed by more than %f seconds", buf, 0x20u);

      }
    }
    v60 = v4;
    __atxlog_handle_modes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v14;
      v70 = 2112;
      v71 = v16;
      _os_log_impl(&dword_1D2C00000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@] Fetching predicted Microlocation for this device", buf, 0x16u);

    }
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v59 = v3;
    objc_msgSend(v3, "probabilityVector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v64 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v22, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("C9FC4298-DE04-494A-9791-71AB71B52E27"));
          objc_msgSend(v24, "UUIDString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "isEqual:", v25);

          if (v26)
          {
            __atxlog_handle_modes();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = (void *)objc_opt_class();
              v29 = v28;
              NSStringFromSelector(a2);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "probability");
              *(_DWORD *)buf = 138412803;
              v69 = v28;
              v70 = 2112;
              v71 = v30;
              v72 = 2049;
              v73 = v31;
              v32 = v27;
              v33 = "[%@][%@] Probability that this device is at a work microlocation: %{private}f";
LABEL_22:
              _os_log_impl(&dword_1D2C00000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 0x20u);

            }
          }
          else
          {
            objc_msgSend(v22, "label");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF"));
            objc_msgSend(v35, "UUIDString");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v34, "isEqual:", v36);

            if (v37)
            {
              __atxlog_handle_modes();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v38 = (void *)objc_opt_class();
                v29 = v38;
                NSStringFromSelector(a2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "probability");
                *(_DWORD *)buf = 138412803;
                v69 = v38;
                v70 = 2112;
                v71 = v30;
                v72 = 2049;
                v73 = v39;
                v32 = v27;
                v33 = "[%@][%@] Probability that this device is outside of a work microlocation: %{private}f";
                goto LABEL_22;
              }
            }
            else
            {
              objc_msgSend(v22, "label");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
              objc_msgSend(v41, "UUIDString");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v40, "isEqual:", v42);

              if (!v43)
                continue;
              __atxlog_handle_modes();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v44 = (void *)objc_opt_class();
                v29 = v44;
                NSStringFromSelector(a2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "probability");
                *(_DWORD *)buf = 138412803;
                v69 = v44;
                v70 = 2112;
                v71 = v30;
                v72 = 2049;
                v73 = v45;
                v32 = v27;
                v33 = "[%@][%@] Probability that this device is at an unknown microlocation: %{private}f";
                goto LABEL_22;
              }
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v19);
    }

    v3 = v59;
    objc_msgSend(v59, "maxProbabilityLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqualToString:", CFSTR("C9FC4298-DE04-494A-9791-71AB71B52E27")))
    {
      objc_msgSend(v59, "maxProbability");
      v48 = v47;

      if (v48 > 0.5)
      {
        __atxlog_handle_modes();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          v50 = (void *)objc_opt_class();
          v51 = v50;
          NSStringFromSelector(a2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v69 = v50;
          v70 = 2112;
          v71 = v52;
          _os_log_impl(&dword_1D2C00000, v49, OS_LOG_TYPE_DEFAULT, "[%@][%@] Device is predicted to be at a work microlocation", buf, 0x16u);

        }
        v53 = 1;
LABEL_38:
        v4 = v60;

        -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v60, "setValue:forBinaryFeatureOfType:", v53, 25);
        goto LABEL_39;
      }
    }
    else
    {

    }
    __atxlog_handle_modes();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v55 = (void *)objc_opt_class();
      v56 = v55;
      NSStringFromSelector(a2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v69 = v55;
      v70 = 2112;
      v71 = v57;
      _os_log_impl(&dword_1D2C00000, v49, OS_LOG_TYPE_DEFAULT, "[%@][%@] Device was predicted to not be at a work microlocation", buf, 0x16u);

    }
    v53 = 0;
    goto LABEL_38;
  }
  __atxlog_handle_modes();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    -[ATXModeMicrolocationFeaturizer _provideFeaturesWithLocalizationEvent:].cold.1((uint64_t)self, a2, v54);

LABEL_39:
  return v4;
}

- (void)_processLocalizationEvent:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] Pushing work microlocation prediction to mode heurisic classifier", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[ATXModeMicrolocationFeaturizer _provideFeaturesWithLocalizationEvent:](self, "_provideFeaturesWithLocalizationEvent:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "featurizer:didUpdateFeatures:", self, v11);
}

- (void)beginListening
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  id v7;
  void *v8;
  BMBiomeScheduler *v9;
  BMBiomeScheduler *scheduler;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BPSSink *v19;
  BPSSink *sink;
  _QWORD v22[4];
  id v23[2];
  _QWORD v24[4];
  id v25[2];
  id location;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.BiomeMicroLocationRestrictedLocalizationEvent.queue", v3);
    queue = self->_queue;
    self->_queue = v4;

  }
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_opt_class();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] registering for real time events from the BiomeMicroLocationRestrictedLocalizationEventStream", buf, 0x16u);

  }
  v9 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.Microlocation"), self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v9;

  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MicroLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "Localization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "atx_DSLPublisher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subscribeOn:", self->_scheduler);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterWithIsIncluded:", &__block_literal_global_22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2;
  v24[3] = &unk_1E942DB10;
  objc_copyWeak(v25, &location);
  v25[1] = (id)a2;
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_23;
  v22[3] = &unk_1E942DB80;
  objc_copyWeak(v23, &location);
  v23[1] = (id)a2;
  objc_msgSend(v17, "sinkWithCompletion:receiveInput:", v24, v22);
  v19 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v19;

  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

uint64_t __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("focus-mode"));

  return v4;
}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2_cold_1((const char *)a1, v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (void *)objc_opt_class();
    v9 = *(const char **)(a1 + 40);
    v10 = v8;
    NSStringFromSelector(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "[%@][%@] successfully finished listening to MicroLocation Localization events", (uint8_t *)&v12, 0x16u);

  }
}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  void *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = *(const char **)(a1 + 40);
    v8 = v6;
    NSStringFromSelector(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "[%@][%@] Received new MicroLocation Localization event: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v3, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_processLocalizationEvent:", v12);

  }
}

- (void)stopListening
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;

  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__ATXModeMicrolocationFeaturizer_provideFeatures__block_invoke_2_cold_1(const char *a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v4 = OUTLINED_FUNCTION_3((uint64_t)a1);
  v5 = (void *)objc_opt_class();
  v6 = OUTLINED_FUNCTION_4(v5);
  NSStringFromSelector(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1D2C00000, v9, v10, "[%@][%@] Error fetching last event: %@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_0();
}

- (void)_provideFeaturesWithLocalizationEvent:(NSObject *)a3 .cold.1(uint64_t a1, const char *a2, NSObject *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = v5;
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1D2C00000, a3, OS_LOG_TYPE_ERROR, "[%@][%@] Nil BMMicroLocationRestrictedLocalizationEvent", (uint8_t *)&v8, 0x16u);

}

void __48__ATXModeMicrolocationFeaturizer_beginListening__block_invoke_2_cold_1(const char *a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  v4 = OUTLINED_FUNCTION_3((uint64_t)a1);
  v5 = (void *)objc_opt_class();
  v6 = OUTLINED_FUNCTION_4(v5);
  NSStringFromSelector(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1D2C00000, v9, v10, "[%@][%@] listening to MicroLocation Localization events: %@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_1_0();
}

@end
