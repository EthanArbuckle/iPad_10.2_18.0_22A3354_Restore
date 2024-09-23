@implementation PLFrequentLocationManager

- (PLFrequentLocationManager)initWithMomentGenerationDataManager:(id)a3
{
  id v4;
  PLFrequentLocationManager *v5;
  PLFrequentLocationManager *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFrequentLocationManager;
  v5 = -[PLFrequentLocationManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_invalidateCurrentFrequentLocations = 0;
    objc_storeWeak((id *)&v5->_momentGenerationDataManager, v4);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFrequentLocationManager setCurrentFrequentLocations:](v6, "setCurrentFrequentLocations:", v7);

  }
  return v6;
}

- (BOOL)frequentLocationsDidChangeFromUpdateWithAllMoments:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 invalidateCurrentFrequentLocations;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLFrequentLocationManager currentFrequentLocations](self, "currentFrequentLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    invalidateCurrentFrequentLocations = self->_invalidateCurrentFrequentLocations;

    if (!invalidateCurrentFrequentLocations)
    {
      v7 = 0;
      goto LABEL_28;
    }
  }
  else
  {

  }
  -[PLFrequentLocationManager currentFrequentLocations](self, "currentFrequentLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  -[PLFrequentLocationManager _createFrequentLocationsWithAllMoments:](self, "_createFrequentLocationsWithAllMoments:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFrequentLocationManager setCurrentFrequentLocations:](self, "setCurrentFrequentLocations:", v10);

  self->_invalidateCurrentFrequentLocations = 0;
  v11 = objc_msgSend(v9, "count");
  -[PLFrequentLocationManager currentFrequentLocations](self, "currentFrequentLocations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 == v13)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[PLFrequentLocationManager currentFrequentLocations](self, "currentFrequentLocations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      v26 = v4;
      while (1)
      {
        v18 = 0;
LABEL_9:
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v20 = v9;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (!v21)
          break;
        v22 = v21;
        v23 = *(_QWORD *)v28;
LABEL_13:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v24), "isSimilarToFrequentLocation:", v19) & 1) != 0)
            break;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v22)
              goto LABEL_13;
            goto LABEL_24;
          }
        }

        if (++v18 != v16)
          goto LABEL_9;
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        v7 = 0;
        v4 = v26;
        if (!v16)
          goto LABEL_26;
      }
LABEL_24:

      v7 = 1;
      v4 = v26;
    }
    else
    {
      v7 = 0;
    }
LABEL_26:

  }
  else
  {
    v7 = 1;
  }

LABEL_28:
  return v7;
}

- (void)invalidateCurrentFrequentLocations
{
  self->_invalidateCurrentFrequentLocations = 1;
}

- (id)_createFrequentLocationsWithAllMoments:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  uint32_t denom;
  uint32_t numer;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  float v21;
  void *v22;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMomentGenerationGetLog();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  info = 0;
  mach_timebase_info(&info);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CreateFrequentLocations", ", buf, 2u);
  }

  v9 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "locationsOfInterest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFrequentLocationProcessor processFrequentLocationsWithItems:locationsOfInterest:progressBlock:](PLFrequentLocationProcessor, "processFrequentLocationsWithItems:locationsOfInterest:progressBlock:", v10, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v17 = v8;
  v18 = v17;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134217984;
    v26 = (const char *)v19;
    _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v6, "CreateFrequentLocations", "[FrequentLocationGeneration] Creating Frequent Locations for %lu moments", buf, 0xCu);
  }

  v20 = v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (float)((float)((float)(v14 - v9) * (float)numer) / (float)denom) / 1000000.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[FrequentLocationGeneration] Creating Frequent Locations for %lu moments"), objc_msgSend(v4, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "CreateFrequentLocations";
    v27 = 2112;
    v28 = v22;
    v29 = 2048;
    v30 = v21;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  return v13;
}

- (PLMomentGenerationDataManagement)momentGenerationDataManager
{
  return (PLMomentGenerationDataManagement *)objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
}

- (void)setMomentGenerationDataManager:(id)a3
{
  objc_storeWeak((id *)&self->_momentGenerationDataManager, a3);
}

- (NSSet)currentFrequentLocations
{
  return self->_currentFrequentLocations;
}

- (void)setCurrentFrequentLocations:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrequentLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrequentLocations, 0);
  objc_destroyWeak((id *)&self->_momentGenerationDataManager);
}

@end
