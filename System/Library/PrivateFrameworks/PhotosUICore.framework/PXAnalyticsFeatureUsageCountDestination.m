@implementation PXAnalyticsFeatureUsageCountDestination

- (void)setPhotoLibrary:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);

    if (WeakRetained)
    {
      PXAssertGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v7 = 0;
        _os_log_error_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXAnalyticsFeatureUsageCountDestination - photo library is not nil", v7, 2u);
      }

    }
  }
  objc_storeWeak((id *)&self->_photoLibrary, v4);

}

- (void)processEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAnalyticsFeatureUsageCountDestination photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D09700]);

    if (v7)
    {
      v8 = (void *)objc_msgSend(v4, "copyRawPayload");
      if (objc_msgSend(v8, "count"))
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v12);
        }

        -[PXAnalyticsFeatureUsageCountDestination photoLibrary](self, "photoLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "photoAnalysisClient");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "recordFeatureUsageFromCounts:reply:", v9, &__block_literal_global_131165);

      }
    }
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
}

void __56__PXAnalyticsFeatureUsageCountDestination_processEvent___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v7 = "PXAnalyticsFeatureUsageCountDestination - recordFeatureUsageCounts completed";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 2;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v11 = 138412290;
    v12 = v4;
    v7 = "PXAnalyticsFeatureUsageCountDestination - recordFeatureUsageCounts failed. Error: %@";
    v8 = v6;
    v9 = OS_LOG_TYPE_ERROR;
    v10 = 12;
    goto LABEL_6;
  }

}

@end
