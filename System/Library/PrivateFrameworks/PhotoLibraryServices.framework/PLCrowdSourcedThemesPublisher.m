@implementation PLCrowdSourcedThemesPublisher

+ (id)publishedUUIDsInStream:(unint64_t)a3 pathManager:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  uint8_t v22[4];
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "_biomeStreamForStream:pathManager:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "publisherFromStartTime:", 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__24587;
    v29 = __Block_byref_object_dispose__24588;
    v30 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke;
    v21[3] = &unk_1E3666D30;
    v21[4] = &buf;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke_1;
    v19 = &unk_1E3666D58;
    v10 = v8;
    v20 = v10;
    v11 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v21, &v16);
    if (-[NSObject count](v10, "count", v16, v17, v18, v19) || !*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v12 = v10;
    }
    else
    {
      PLBackendGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v22 = 134218242;
        v23 = a3;
        v24 = 2112;
        v25 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Error reading published items from stream %tu: %@.", v22, 0x16u);
      }

      v12 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = a3;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create a biome stream for stream %tu.", (uint8_t *)&buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

+ (void)publishUUIDs:(id)a3 stream:(unint64_t)a4 pathManager:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  PLCrowdSourcedThemesAssetEvent *v18;
  PLCrowdSourcedThemesAssetEvent *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "_biomeStreamForStream:pathManager:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "source");
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v18 = [PLCrowdSourcedThemesAssetEvent alloc];
          v19 = -[PLCrowdSourcedThemesAssetEvent initWithUUID:](v18, "initWithUUID:", v17, (_QWORD)v20);
          -[NSObject sendEvent:](v11, "sendEvent:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v26 = a4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create a biome stream with name %tu.", buf, 0xCu);
    }
  }

}

+ (id)_nameForStream:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("com.apple.photos.geoanalytics.sent");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return (id)v3;
  else
    return CFSTR("com.apple.photos.geoanalytics");
}

+ (id)_biomeStreamForStream:(unint64_t)a3 pathManager:(id)a4
{
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  objc_msgSend(a4, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 1, 0, 1, &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D024C0], "newPrivateStreamDefaultConfigurationWithStoreBasePath:", v6);
    if (a3 == 1)
    {
      v15 = objc_alloc(MEMORY[0x1E0D024B0]);
      v10 = -[NSObject segmentSize](v8, "segmentSize");
      v11 = 7776000.0;
      v12 = v15;
      v13 = 1;
    }
    else
    {
      if (a3)
      {
LABEL_10:
        objc_msgSend(a1, "_nameForStream:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:eventDataClass:", v17, v8, 0);
        }
        else
        {
          PLBackendGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v22 = a3;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Stream %tu is not supported.", buf, 0xCu);
          }

          v14 = 0;
        }

        goto LABEL_16;
      }
      v9 = objc_alloc(MEMORY[0x1E0D024B0]);
      v10 = -[NSObject segmentSize](v8, "segmentSize");
      v11 = 0.0;
      v12 = v9;
      v13 = 0;
    }
    v16 = (void *)objc_msgSend(v12, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, v13, v10, v11);
    -[NSObject setPruningPolicy:](v8, "setPruningPolicy:", v16);

    goto LABEL_10;
  }
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v22 = (unint64_t)v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Failed to create private directory for Biome stream data. Error: %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_16:

  return v14;
}

void __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "PLCrowdSourcedThemesAssetEvent: Publish error: %@.", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "PLCrowdSourcedThemesAssetEvent: Publish completed.", (uint8_t *)&v10, 2u);
  }

}

void __68__PLCrowdSourcedThemesPublisher_publishedUUIDsInStream_pathManager___block_invoke_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "eventBody");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
