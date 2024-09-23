@implementation NSFileManager(VoiceServices)

- (uint64_t)directorySize:()VoiceServices
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  id v28;
  NSObject *obj;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint64_t v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C99900];
  v43[0] = *MEMORY[0x1E0C99900];
  v7 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v8, 4, &v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;

  if (v10)
  {
    v11 = objc_msgSend(v10, "code");
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 260)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v4;
        _os_log_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_INFO, "No cache directory from which to get the size: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v4;
      v41 = 2112;
      v42 = v10;
      _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, "Error getting cache path: %@, error: %@", buf, 0x16u);
    }
    goto LABEL_20;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v9;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (!v14)
  {
    v10 = 0;
LABEL_20:
    v25 = 0;
    goto LABEL_21;
  }
  v15 = v14;
  v27 = v9;
  v28 = v4;
  v10 = 0;
  v30 = 0;
  v16 = *(_QWORD *)v33;
  obj = v13;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      v18 = v10;
      if (*(_QWORD *)v33 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      v37 = v6;
      v20 = v7;
      objc_msgSend(*(id *)(v7 + 3360), "arrayWithObjects:count:", &v37, 1, v27, v28);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v10;
      objc_msgSend(v19, "resourceValuesForKeys:error:", v21, &v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v31;

      if (v10)
      {
        VSGetLogDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v19, "path");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v24;
          v41 = 2112;
          v42 = v10;
          _os_log_error_impl(&dword_1DE15E000, v23, OS_LOG_TYPE_ERROR, "Unable to get URL: %@, URL resources: %@", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v22, "objectForKeyedSubscript:", v6);
        v23 = objc_claimAutoreleasedReturnValue();
        v30 += -[NSObject longLongValue](v23, "longLongValue");
      }

      v7 = v20;
    }
    v13 = obj;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  }
  while (v15);
  v9 = v27;
  v4 = v28;
  v25 = v30;
LABEL_21:

  return v25;
}

- (void)removeDirectory:()VoiceServices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v2, 0, 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(a1, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cleanDirectory:()VoiceServices withLRULimit:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  _QWORD v35[3];
  _BYTE v36[128];
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = *MEMORY[0x1E0C998D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v9, 5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") >= a4)
  {
    v21 = v7;
    v25 = v8;
    v26 = v6;
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_368);
    v24 = v10;
    v22 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subarrayWithRange:", 0, objc_msgSend(v10, "count") - a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          objc_msgSend(a1, "removeItemAtURL:error:", v16, &v27);
          v17 = v27;
          if (v17)
          {
            VSGetLogDefault();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v16;
              v34 = 2112;
              v35[0] = v17;
              _os_log_error_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_ERROR, "Can't remove file '%@', error: %@", buf, 0x16u);
            }

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v13);
    }
    VSGetLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    v8 = v25;
    v6 = v26;
    v10 = v24;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = mach_absolute_time() - v21;
      if (VSAbsoluteTimeToSecond_onceToken != -1)
        dispatch_once(&VSAbsoluteTimeToSecond_onceToken, &__block_literal_global_5);
      *(_DWORD *)buf = 138412802;
      v33 = v26;
      v34 = 1024;
      LODWORD(v35[0]) = v22;
      WORD2(v35[0]) = 2048;
      *(double *)((char *)v35 + 6) = *(double *)&VSAbsoluteTimeToSecond_clockFactor * (double)v20;
      _os_log_debug_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_DEBUG, "Cleaned directory: '%@', LRU limit: %d, latency: %f", buf, 0x1Cu);
    }

  }
}

- (void)cleanDirectory:()VoiceServices withDateOlderThan:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C998D0];
  v34[0] = *MEMORY[0x1E0C998D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = a1;
  v21 = (void *)v7;
  objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, v9, 5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v24 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v24, v8, 0);
        v17 = v24;
        objc_msgSend(v17, "timeIntervalSinceDate:", v6);
        if (v18 <= 0.0)
        {
          v23 = 0;
          objc_msgSend(v22, "removeItemAtURL:error:", v16, &v23);
          v19 = v23;
          if (v19)
          {
            VSGetLogDefault();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v30 = v16;
              v31 = 2112;
              v32 = v19;
              _os_log_error_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_ERROR, "Can't remove file '%@', error: %@", buf, 0x16u);
            }

          }
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v13);
  }

}

@end
