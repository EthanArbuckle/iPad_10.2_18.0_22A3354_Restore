@implementation PGSharedLibraryAssetPropertiesMetricEvent

- (PGSharedLibraryAssetPropertiesMetricEvent)initWithWorkingContext:(id)a3 questionMetricType:(unsigned __int16)a4 metricEventFetchHelper:(id)a5
{
  uint64_t v6;
  id v9;
  PGSharedLibraryAssetPropertiesMetricEvent *v10;
  PGSharedLibraryAssetPropertiesMetricEvent *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *payloadByAssetIdentifier;
  objc_super v15;

  v6 = a4;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGSharedLibraryAssetPropertiesMetricEvent;
  v10 = -[PGPhotosChallengeMetricEvent initWithWorkingContext:questionMetricType:metricEventFetchHelper:](&v15, sel_initWithWorkingContext_questionMetricType_metricEventFetchHelper_, v9, v6, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workingContext, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payloadByAssetIdentifier = v11->_payloadByAssetIdentifier;
    v11->_payloadByAssetIdentifier = v12;

  }
  return v11;
}

- (NSString)identifier
{
  return (NSString *)CFSTR("com.apple.Photos.Intelligence.PhotosChallenge.SharedLibraryAssets");
}

- (NSArray)payloads
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PGSharedLibraryAssetPropertiesMetricEvent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSMutableDictionary *payloadByAssetIdentifier;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_payloadByAssetIdentifier, "count"))
  {
    -[NSMutableDictionary allKeys](self->_payloadByAssetIdentifier, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "mutableCopy");

    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v6;
    v22 = (void *)v4;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v9 = self;
    v28.receiver = self;
    v28.super_class = (Class)PGSharedLibraryAssetPropertiesMetricEvent;
    -[PGPhotosChallengeMetricEvent payload](&v28, sel_payload);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = (void *)objc_msgSend(v10, "mutableCopy");
          payloadByAssetIdentifier = v9->_payloadByAssetIdentifier;
          objc_msgSend(v15, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](payloadByAssetIdentifier, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addEntriesFromDictionary:", v19);

          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("assets"));
          objc_msgSend(v8, "addObject:", v16);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v8;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  void (**v4)(void *, _BYTE *, double);
  double v5;
  double Current;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void *, _BYTE *, double);
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  const __CFString *v25;
  void *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(void *, _BYTE *, double))_Block_copy(a3);
  v5 = 0.0;
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v24 = 0;
      v4[2](v4, &v24, 0.0);
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29 = 62;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      v5 = Current;
    }
  }
  -[NSDictionary allKeys](self->_resultsByAssetIdentifier, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "pha_shuffle");
    v17 = v8;
    v18 = v4;
    if ((unint64_t)objc_msgSend(v8, "count") <= 0x64)
    {
      v9 = v8;
    }
    else
    {
      objc_msgSend(v8, "subarrayWithRange:", 0, 100);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v25 = CFSTR("result");
          -[NSDictionary objectForKeyedSubscript:](self->_resultsByAssetIdentifier, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_payloadByAssetIdentifier, "setObject:forKeyedSubscript:", v16, v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
      }
      while (v11);
    }

    v8 = v17;
    v4 = v18;
    if (v18)
    {
      if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
      {
        v24 = 0;
        v18[2](v18, &v24, 1.0);
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v29 = 79;
            v30 = 2080;
            v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metr"
                  "ics/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

  }
  else if (v4)
  {
    if (CFAbsoluteTimeGetCurrent() - v5 >= 0.01)
    {
      v24 = 0;
      v4[2](v4, &v24, 1.0);
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29 = 66;
          v30 = 2080;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Metric"
                "s/MetricEvents/PGSharedLibraryAssetPropertiesMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_30:
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharedLibraryAssetPropertiesMetricEvent identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSharedLibraryAssetPropertiesMetricEvent payloads](self, "payloads");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@:\nIdentifier:%@\nPayloads:%@"), v4, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSDictionary)resultsByAssetIdentifier
{
  return self->_resultsByAssetIdentifier;
}

- (void)setResultsByAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resultsByAssetIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadByAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

@end
