@implementation HKSleepHealthStore

void __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v59 = (id)objc_opt_class();
    v3 = v59;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving sessions", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v59 = v6;
    v7 = v6;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking auth status", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "authorizationStatusForType:", v8);

  if (v9 == 1)
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v59 = v38;
      v39 = v38;
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] doesn't have write access for HKCategoryTypeIdentifierSleepAnalysis", buf, 0xCu);

    }
    v11 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD1540], "na_genericError");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithError:", v12);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = *(id *)(a1 + 48);
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v54;
      v40 = *(_QWORD *)v54;
      v41 = a1;
      do
      {
        v17 = 0;
        v42 = v15;
        do
        {
          if (*(_QWORD *)v54 != v16)
            objc_enumerationMutation(obj);
          v44 = v17;
          v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v17);
          HKSPLogForCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v59 = v20;
            v60 = 2112;
            v61 = v18;
            v21 = v20;
            _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] processing session: %@", buf, 0x16u);

          }
          objc_msgSend(v18, "interval");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          HKSPLogForCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v59 = v25;
              v26 = v25;
              _os_log_impl(&dword_21610C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating HealthKit samples", buf, 0xCu);

            }
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            objc_msgSend(v18, "sleepIntervals");
            v24 = objc_claimAutoreleasedReturnValue();
            v27 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v50 != v29)
                    objc_enumerationMutation(v24);
                  v31 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
                  v32 = (void *)MEMORY[0x24BDD3988];
                  objc_msgSend(v18, "metadata");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "hdsp_categorySampleForSleepSessionInterval:metadata:", v31, v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v13, "na_safeAddObject:", v34);
                }
                v28 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v28);
              v16 = v40;
              a1 = v41;
              v15 = v42;
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v35 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v59 = v35;
            v60 = 2112;
            v61 = v18;
            v36 = v35;
            _os_log_error_impl(&dword_21610C000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] skipping session due to missing bedtime or wake time: %@", buf, 0x16u);

          }
          v17 = v44 + 1;
        }
        while (v44 + 1 != v15);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
      }
      while (v15);
    }

    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke_187;
    v45[3] = &unk_24D4E5558;
    v37 = *(void **)(a1 + 40);
    v46 = *(id *)(a1 + 32);
    v47 = v13;
    v48 = v37;
    v12 = v13;
    objc_msgSend(v46, "saveSleepTrackingSamples:completion:", v12, v45);

  }
}

void __54__HKSleepHealthStore_HDSPSleep__hdsp_persistSessions___block_invoke_187(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(void **)(a1 + 40);
      v10 = v8;
      v14 = 138543618;
      v15 = v8;
      v16 = 2048;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] finished saving %lu samples", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v14 = 138543618;
    v15 = (id)objc_opt_class();
    v16 = 2114;
    v17 = (uint64_t)v5;
    v13 = v15;
    _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] saving samples to HealthKit failed with error: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  v11 = *(void **)(a1 + 48);
  NAEmptyResult();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "finishWithResult:error:", v12, v5);

}

@end
