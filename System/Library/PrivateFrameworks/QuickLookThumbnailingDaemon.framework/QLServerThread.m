@implementation QLServerThread

- (id)cacheThreadForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLServerThread cacheThreadForProviderDomainID:](self, "cacheThreadForProviderDomainID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "fileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quicklookSandboxWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLServerThread cacheThreadForFileIdentifier:atURL:](self, "cacheThreadForFileIdentifier:atURL:", v9, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)cacheThreadForFileIdentifier:(id)a3 atURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v6 = a4;
  v10 = objc_msgSend(a3, "fsid");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v10, "{fsid=[2i]}");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_cacheInitLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_fsidsToCaches, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[QLServerThread uncachedCacheThreadForFileAtURL:](self, "uncachedCacheThreadForFileAtURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fsidsToCaches, "setObject:forKeyedSubscript:", v8, v7);
  }
  os_unfair_lock_unlock(&self->_cacheInitLock);

  return v8;
}

- (id)uncachedCacheThreadForFileAtURL:(id)a3
{
  BOOL v6;
  BOOL v7;
  BOOL v8;
  _QLCacheThread *v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  int v34;
  NSObject *v35;
  int v37;
  uint64_t v38;
  void *v39;
  QLServerThread *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;
  _BYTE v60[19];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  objc_msgSend(v41, "getFileSystemRepresentation:maxLength:", &v59, 1024);
  v6 = v59 == 0x657461766972702FLL
    && *(_QWORD *)v60 == 0x7265502F7261762FLL
    && *(_QWORD *)&v60[8] == 0x756C6F56616E6F73
    && *(_QWORD *)&v60[11] == 0x73656D756C6F5661;
  if (v6
    || (v59 == 0x7265502F7261762FLL ? (v7 = *(_QWORD *)v60 == 0x756C6F56616E6F73) : (v7 = 0),
        v7 ? (v8 = *(_QWORD *)&v60[3] == 0x73656D756C6F5661) : (v8 = 0),
        v8))
  {
    v10 = objc_msgSend(v41, "startAccessingSecurityScopedResource");
    v51 = 0;
    v11 = *MEMORY[0x1E0C99D08];
    v12 = objc_msgSend(v41, "getResourceValue:forKey:error:", &v51, *MEMORY[0x1E0C99D08], 0);
    v13 = v51;
    if (v12
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_volumesToCaches, "objectForKeyedSubscript:", v13),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      if (v10)
        objc_msgSend(v41, "stopAccessingSecurityScopedResource");
      -[NSMutableDictionary objectForKeyedSubscript:](self->_volumesToCaches, "objectForKeyedSubscript:", v13);
      v9 = (_QLCacheThread *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = self;
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v15, "listAllPersonaAttributesWithError:", &v50);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v50;

      if (v17)
      {
        _log_3();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[QLServerThread uncachedCacheThreadForFileAtURL:].cold.2();

      }
      v38 = v11;
      v39 = v13;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v20 = v16;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      if (v21)
      {
        v22 = v21;
        v37 = v10;
        v23 = *(_QWORD *)v47;
LABEL_30:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v47 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v24);
          objc_msgSend(v25, "personaLayoutPathURL");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v45 = 0;
            objc_msgSend(v25, "personaLayoutPathURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v17;
            v28 = objc_msgSend(v19, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v45, v27, v41, &v44);
            v29 = v44;

            if ((v28 & 1) != 0)
            {
              if (!v45)
              {
                objc_msgSend(v25, "userPersonaUniqueString");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                  goto LABEL_50;
                v43 = 0;
                -[QLServerThread makeCacheThreadForPersonaString:containerURL:](v40, "makeCacheThreadForPersonaString:containerURL:", v32, &v43);
                v9 = (_QLCacheThread *)objc_claimAutoreleasedReturnValue();
                v33 = v43;
                v42 = 0;
                v34 = objc_msgSend(v33, "getResourceValue:forKey:error:", &v42, v38, 0);
                v13 = v42;

                if (v34)
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v40->_volumesToCaches, "setObject:forKeyedSubscript:", v9, v13);
                if (v37)
                  objc_msgSend(v41, "stopAccessingSecurityScopedResource");

                goto LABEL_53;
              }
            }
            else
            {
              _log_3();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v25, "personaLayoutPathURL");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v53 = v31;
                v54 = 2112;
                v55 = v41;
                v56 = 2112;
                v57 = v29;
                _os_log_error_impl(&dword_1D54AE000, v30, OS_LOG_TYPE_ERROR, "Could not get relationship between %@ and %@, error: %@", buf, 0x20u);

              }
            }
            v17 = v29;
          }
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
            if (v22)
              goto LABEL_30;
            break;
          }
        }
      }

      v29 = v17;
LABEL_50:
      v13 = v39;
      _log_3();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[QLServerThread uncachedCacheThreadForFileAtURL:].cold.1();

      v9 = v40->_cacheThread;
LABEL_53:

    }
  }
  else
  {
    v9 = self->_cacheThread;
  }

  return v9;
}

- (id)cacheThreadForProviderDomainID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_cacheInitLock);
  -[NSMutableDictionary objectForKey:](self->_domainsToCaches, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[QLServerThread uncachedCacheThreadForProviderDomainID:](self, "uncachedCacheThreadForProviderDomainID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsToCaches, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_cacheInitLock);

  return v5;
}

- (void)queueThumbnailRequest:(id)a3 tryCache:(BOOL)a4 tryAdditionsFirst:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  QLServerThread *v28;
  _QWORD v29[4];
  id v30;
  QLServerThread *v31;
  _QWORD block[4];
  id v33;
  QLServerThread *v34;
  os_activity_scope_state_s buf;
  uint64_t v36;

  v5 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _log_3();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.opaque[0]) = 138412290;
    *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v7;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "Enqueuing thumbnail request: %@", (uint8_t *)&buf, 0xCu);
  }

  if (objc_msgSend(v7, "hasHandledAllRequestedTypesOrMostRepresentativeType"))
  {
    -[QLServerThread _completeHandledThumbnailRequest:](self, "_completeHandledThumbnailRequest:", v7);
  }
  else
  {
    if (!objc_msgSend(v7, "cancelled"))
    {
      if ((objc_msgSend(v8, "isValid") & 1) == 0)
      {
        dispatch_get_global_queue(0, 0);
        v17 = objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26;
        v29[3] = &unk_1E99D2CD0;
        v30 = v7;
        v31 = self;
        dispatch_async(v17, v29);

        goto LABEL_18;
      }
      if (v5)
      {
        objc_msgSend(v7, "topActivity");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = _os_activity_create(&dword_1D54AE000, "Cache Lookup", v11, OS_ACTIVITY_FLAG_DEFAULT);

        buf.opaque[0] = 0;
        buf.opaque[1] = 0;
        os_activity_scope_enter(v12, &buf);
        objc_msgSend(v7, "setActivity:", v12);
        objc_msgSend(v8, "fileIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "version");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isDefaultVersion");

        if (v15)
          objc_msgSend((id)objc_opt_class(), "updateThumbnailRequestThumbnailVersionWithThirdPartyGeneratorInformationIfNeeded:", v8);
        -[QLServerThread cacheThreadForRequest:](self, "cacheThreadForRequest:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "addThumbnailRequest:", v7) & 1) != 0)
        {

          os_activity_scope_leave(&buf);
          goto LABEL_18;
        }
        _log_3();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[QLServerThread queueThumbnailRequest:tryCache:tryAdditionsFirst:].cold.1();

        objc_msgSend(v7, "setActivity:", 0);
        os_activity_scope_leave(&buf);

      }
      objc_msgSend(v7, "topActivity");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = _os_activity_create(&dword_1D54AE000, "Thumbnail Generation", v19, OS_ACTIVITY_FLAG_DEFAULT);

      buf.opaque[0] = 0;
      buf.opaque[1] = 0;
      os_activity_scope_enter(v20, &buf);
      objc_msgSend(v7, "setActivity:", v20);
      v21 = (void *)MEMORY[0x1E0CB34C8];
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28;
      v26 = &unk_1E99D2CD0;
      v27 = v7;
      v28 = self;
      objc_msgSend(v21, "blockOperationWithBlock:", &v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSOperationQueue addOperation:](self->_uncachedThumbnailRetrievalQueue, "addOperation:", v22, v23, v24, v25, v26);

      os_activity_scope_leave(&buf);
      goto LABEL_18;
    }
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke;
    block[3] = &unk_1E99D2CD0;
    v33 = v7;
    v34 = self;
    dispatch_async(v10, block);

  }
LABEL_18:

}

+ (void)updateThumbnailRequestThumbnailVersionWithThirdPartyGeneratorInformationIfNeeded:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[QLThumbnailExtensionMonitor shared](QLThumbnailExtensionMonitor, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bestExtensionFor:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "generatorIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "generatorVersion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v12, "fileIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "version");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setGeneratorID:", v6);

        objc_msgSend(v12, "fileIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "version");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setGeneratorVersion:", v7);

      }
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }

  }
}

- (void)_completeHandledThumbnailRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "All requested thumbnail types for request %@ have been handled.", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__QLServerThread__completeHandledThumbnailRequest___block_invoke;
  block[3] = &unk_1E99D2D70;
  block[4] = self;
  v11 = v4;
  v12 = v6;
  v8 = v6;
  v9 = v4;
  dispatch_async(queue, block);

}

- (void)completeThumbnailRequest:(id)a3 thumbnailData:(id)a4 updatedMetadata:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;

  v25 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[QLDiskCacheEnumerator cachedThumbnailDataIsLowQuality:forThumbnailRequest:](QLDiskCacheEnumerator, "cachedThumbnailDataIsLowQuality:forThumbnailRequest:", v25, v10))
  {
    v11 = 1;
  }
  else
  {
    v11 = 2;
  }

  objc_msgSend(v25, "bitmapData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (!v8)
  {
    objc_msgSend(v25, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v25, "contentRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = objc_msgSend(v25, "flavor");
  objc_msgSend(v25, "bitmapFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  -[QLServerThread completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:](self, "completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:", v9, v12, v13, v11, v22, v23, v15, v17, v19, v21, v24);

  if (!v8)
}

- (void)completeThumbnailRequest:(id)a3 bitmapData:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 format:(id)a9 clientShouldTakeOwnership:(BOOL)a10
{
  uint64_t v11;
  double height;
  double width;
  double y;
  double x;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v11 = *(_QWORD *)&a8;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v20 = (void *)MEMORY[0x1E0CD32A8];
  v21 = a5;
  v22 = a3;
  objc_msgSend(v20, "imageWithFormat:data:", a9, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLServerThread completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:](self, "completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:", v22, v24, v21, a7, v11, a10, x, y, width, height);

}

- (void)perform:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (void)_addThumbnailRequestBatchToQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *completionBlocksQueue;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id obj;
  _QWORD block[5];
  id v25;
  id v26;
  os_activity_scope_state_s state;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22 = a4;
  v7 = dispatch_group_create();
  -[QLServerThread _installRequestsFinishedWatchdog](self, "_installRequestsFinishedWatchdog");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "request");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v7);
        kdebug_trace();
        objc_msgSend(v11, "setBatchDispatchGroup:", v7);
        v13 = _os_activity_create(&dword_1D54AE000, "Thumbnail Request Enqueued", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v13, &state);
        objc_msgSend(v11, "setTopActivity:", v13);
        -[QLServerThread pendingRequests](self, "pendingRequests");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v15);

        v16 = objc_msgSend(v12, "forceGeneration");
        if ((v16 & 1) != 0)
          v17 = 0;
        else
          v17 = objc_msgSend(v11, "cacheEnabled");
        -[QLServerThread queueThumbnailRequest:tryCache:tryAdditionsFirst:](self, "queueThumbnailRequest:tryCache:tryAdditionsFirst:", v11, v17, v16 ^ 1u);
        os_activity_scope_leave(&state);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  completionBlocksQueue = self->_completionBlocksQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__QLServerThread__addThumbnailRequestBatchToQueue_completionHandler___block_invoke;
  block[3] = &unk_1E99D3250;
  block[4] = self;
  v26 = v22;
  v19 = obj;
  v25 = v19;
  v20 = v22;
  dispatch_group_notify(v7, completionBlocksQueue, block);
  _log_3();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[QLServerThread _addThumbnailRequestBatchToQueue:completionHandler:].cold.1();

}

- (NSMutableDictionary)pendingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)_installRequestsFinishedWatchdog
{
  NSObject *watchdogTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  watchdogTimer = self->_watchdogTimer;
  if (watchdogTimer)
    dispatch_source_cancel(watchdogTimer);
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  v5 = self->_watchdogTimer;
  self->_watchdogTimer = v4;

  objc_initWeak(&location, self);
  v6 = self->_watchdogTimer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke;
  v9[3] = &unk_1E99D2EB0;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v6, v9);
  v7 = self->_watchdogTimer;
  v8 = dispatch_time(0, 600000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x45D964B800uLL);
  dispatch_activate((dispatch_object_t)self->_watchdogTimer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__QLServerThread__completeHandledThumbnailRequest___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  objc_msgSend(*(id *)(a1 + 40), "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __51__QLServerThread__completeHandledThumbnailRequest___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_removeRequestFromPendingRequests:", *(_QWORD *)(a1 + 40));
  _log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *v2;
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_INFO, "Leaving group for request %@", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*v2, "batchDispatchGroup");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v10);

}

- (void)_removeRequestFromPendingRequests:(id)a3
{
  NSObject *queue;
  id v5;
  NSMutableDictionary *pendingRequests;
  void *v7;
  void *v8;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  pendingRequests = self->_pendingRequests;
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](pendingRequests, "setObject:forKeyedSubscript:", 0, v8);

  if (!-[NSMutableDictionary count](self->_pendingRequests, "count"))
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_domainsToCaches, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_76);
    -[_QLCacheThread serverIsIdle](self->_cacheThread, "serverIsIdle");
  }
}

- (id)cacheThreadForVolume:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_volumesToCaches, "objectForKeyedSubscript:", a3);
}

- (void)_downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  QLServerThread *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *pendingDownloadsQueue;
  _QWORD block[4];
  id v24;
  QLServerThread *v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(v6, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerDomainID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (((objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0
     || (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0
     || objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.SMBClientProvider.FileProvider")))
    && (objc_msgSend(v8, "fp_isContainer") & 1) == 0)
  {
    _log_9();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1D54AE000, v16, OS_LOG_TYPE_INFO, "Item provider doesn't support fetching thumbnails for %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self;
    v14 = v6;
    v15 = v11;
    goto LABEL_12;
  }
  objc_msgSend(v8, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLServerThread cacheThreadForProviderDomainID:](self, "cacheThreadForProviderDomainID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "itemIsMissingRemoteThumbnail:", v8))
  {
    _log_9();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "We cached there is no thumbnail on the server for %@, failing", buf, 0xCu);
    }

    v13 = self;
    v14 = v6;
    v15 = 0;
LABEL_12:
    -[QLServerThread failedDownloadErrorForRequest:underlyingError:](v13, "failedDownloadErrorForRequest:underlyingError:", v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v17);
    goto LABEL_16;
  }
  objc_msgSend(v6, "setDownloadCompletionHandler:", v7);
  _log_9();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[QLServerThread(UbiquitousRequests) _downloadThumbnailForRequest:completionHandler:].cold.1();

  objc_msgSend(v6, "generationHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uuid");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "didUpdateStatus:ofThumbnailGenerationWithUUID:", 1, v21);

  pendingDownloadsQueue = self->_pendingDownloadsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke;
  block[3] = &unk_1E99D2D70;
  v24 = v6;
  v25 = self;
  v26 = v8;
  dispatch_async(pendingDownloadsQueue, block);

  v17 = v24;
LABEL_16:

}

uint64_t __52__QLServerThread__removeRequestFromPendingRequests___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "serverIsIdle");
}

uint64_t __99__QLServerThread_generateSuccessiveThumbnailRepresentationsForGeneratorRequests_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addThumbnailRequestBatchToQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __69__QLServerThread__addThumbnailRequestBatchToQueue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callCompletionHandler:ofThumbnailRequestBatch:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__QLServerThread_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)QLServerThreadInstance;
}

- (void)cancelThumbnailRequests:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  QLServerThread *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__QLServerThread_cancelThumbnailRequests___block_invoke;
  block[3] = &unk_1E99D2CD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_callCompletionHandler:(id)a3 ofThumbnailRequestBatch:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a3;
  _log_3();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v10;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "%@%@", (uint8_t *)&v11, 0x16u);

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_completionBlocksQueue);
  v8[2](v8);

}

- (void)generateSuccessiveThumbnailRepresentationsForGeneratorRequests:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _QLCacheThread *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *queue;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[QLServerThread generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:].cold.1();

  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  v32 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "request");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLServerThread cacheThreadForRequest:](self, "cacheThreadForRequest:", v15);
        v16 = (_QLCacheThread *)objc_claimAutoreleasedReturnValue();

        if (v16 != self->_cacheThread)
        {
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v12, "addObject:", v16);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  -[_QLCacheThread serverIsWorking](self->_cacheThread, "serverIsWorking");
  if (v12)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v12;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "serverIsWorking");
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v19);
    }

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__QLServerThread_generateSuccessiveThumbnailRepresentationsForGeneratorRequests_completionHandler___block_invoke;
  block[3] = &unk_1E99D31E8;
  block[4] = self;
  v26 = v9;
  v27 = v7;
  v23 = v7;
  v24 = v9;
  dispatch_sync(queue, block);

}

void __42__QLServerThread_cancelThumbnailRequests___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412290;
    v14 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "pendingRequests", v14, (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        _log_3();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "Cancelling request that is part of the pending requests: %@", buf, 0xCu);
          }

          objc_msgSend(v11, "cancel");
        }
        else
        {
          if (v13)
          {
            *(_DWORD *)buf = v14;
            v20 = v8;
            _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "Can't cancel thumbnail request because it was not found in the pending requests: %@", buf, 0xCu);
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }

}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t v92[4];
  uint64_t v93;
  uint8_t v94[128];
  _BYTE buf[24];
  double v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setGenerationError:", v3);
  objc_msgSend(WeakRetained, "thumbnailImages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 88))
    v8 = 0;
  else
    v8 = objc_msgSend(*(id *)(a1 + 40), "resultIsLowQuality");
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "CGImage");

  _log_3();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v12)
    {
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Failed to generate a thumbnail from a local file with QLPreviewThumbnailGenerator for request: %@ URL: %@.", buf, 0x16u);
    }

    v15 = *(_QWORD *)(a1 + 72);
    generationFailedErrorWithUnderlyingError(*(void **)(a1 + 32), v3, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v8)
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Did generate a low quality thumbnail from a local file with QLPreviewThumbnailGenerator for request, but was expecting a full representation thumbnail: %@ URL: %@.", buf, 0x16u);
    }

    v15 = *(_QWORD *)(a1 + 72);
    generationFailedError(*(void **)(a1 + 32));
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v19 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v16);

    goto LABEL_43;
  }
  if (v12)
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v21;
    _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Did generate a thumbnail from a local file with QLPreviewThumbnailGenerator for request: %@ URL: %@.", buf, 0x16u);
  }

  v85 = WeakRetained;
  v84 = v7;
  if ((objc_msgSend(*(id *)(a1 + 40), "resultIsLowQuality") & 1) != 0
    || !objc_msgSend(*v4, "cacheEnabled")
    || *(_BYTE *)(a1 + 89))
  {
    v83 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "contentRect");
    *(_QWORD *)buf = v23;
    *(_QWORD *)&buf[8] = v24;
    *(_QWORD *)&buf[16] = v25;
    v96 = v26;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v27 = v7;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
    v86 = v22;
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v89 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 56), "imageDataForImage:", objc_msgSend(v32, "CGImage"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD32A0], "bitmapFormatWithBitmapImage:", objc_msgSend(v32, "CGImage"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 64), "iconMode"))
          {
            if ((objc_msgSend(*(id *)(a1 + 40), "resultHasIconModeApplied") & 1) == 0)
            {
              objc_msgSend(v22, "firstObject");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v35)
              {
                v87 = 0;
                objc_msgSend(*(id *)(a1 + 64), "size");
                v37 = v36;
                v39 = v38;
                objc_msgSend(*(id *)(a1 + 64), "scale");
                v41 = v40;
                v42 = objc_msgSend(*(id *)(a1 + 40), "flavor");
                objc_msgSend(*(id *)(a1 + 40), "extensionBadge");
                v43 = v27;
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v82) = objc_msgSend(*(id *)(a1 + 64), "provideLowQualityThumbnail");
                +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](QLPreviewThumbnailGenerator, "generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:", v33, v34, &v87, buf, v42, v44, v37, v39, v41, v82, objc_msgSend(*(id *)(a1 + 64), "iconVariant"));
                v45 = objc_claimAutoreleasedReturnValue();
                v46 = v87;

                v27 = v43;
                v34 = v46;
                v22 = v86;
                v33 = (void *)v45;
              }
            }
          }
          objc_msgSend(MEMORY[0x1E0CD32A8], "imageWithFormat:data:", v34, v33);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v47);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
      }
      while (v29);
    }

    objc_msgSend(v22, "firstObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 64), "wantsBaseline"))
    {
      objc_msgSend(*(id *)(a1 + 40), "generatedProperties");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "baseline");

      if (v50 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v48)
        {
          objc_msgSend(v48, "format");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "width");
          objc_msgSend(v51, "height");
          objc_msgSend(v51, "bitsPerComponent");
          objc_msgSend(v51, "bitsPerPixel");
          objc_msgSend(v51, "bytesPerRow");
          objc_msgSend(v51, "bitmapInfo");
          objc_msgSend(v48, "data");
          v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v52, "bytes");
          v53 = _QLThumbnailComputeBaselineFromData();

          objc_msgSend(*(id *)(a1 + 40), "generatedProperties");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setBaseline:", v53);

        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "generatedProperties");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      v56 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(*(id *)(a1 + 40), "generatedProperties");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "archivedDataWithRootObject:requiringSecureCoding:error:", v57, 1, 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v58 = 0;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "resultIsLowQuality"))
      v59 = 1;
    else
      v59 = 2;
    _log_3();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      v61 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v92 = 138412290;
      v93 = v61;
      _os_log_impl(&dword_1D54AE000, v60, OS_LOG_TYPE_INFO, "completing thumbnail request %@ after generation without caching", v92, 0xCu);
    }

    v62 = *(void **)(a1 + 56);
    v63 = *(_QWORD *)(a1 + 32);
    v64 = objc_msgSend(*(id *)(a1 + 40), "flavor");
    v65 = v86;
    objc_msgSend(v62, "completeThumbnailRequest:images:metadata:contentRect:thumbnailRepresentation:iconFlavor:clientShouldTakeOwnership:", v63, v86, v58, v59, v64, 1, *(double *)buf, *(double *)&buf[8], *(double *)&buf[16], v96);

    v3 = v83;
  }
  else
  {
    _log_3();
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2_cold_1();

    objc_msgSend(v7, "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "imageDataForImage:", objc_msgSend(v65, "CGImage"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD32A0], "bitmapFormatWithBitmapImage:", objc_msgSend(v65, "CGImage"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "contentRect");
    v71 = v70;
    v73 = v72;
    v75 = v74;
    v77 = v76;
    v78 = objc_msgSend(*(id *)(a1 + 40), "resultHasIconModeApplied");
    v79 = objc_msgSend(*(id *)(a1 + 40), "flavor");
    objc_msgSend(*(id *)(a1 + 40), "extensionBadge");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "generatedProperties");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v67, v68, v78, v79, v80, v81, v71, v73, v75, v77, *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 90))
      objc_msgSend(*(id *)(a1 + 56), "_saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:", *(_QWORD *)(a1 + 48), objc_msgSend(v65, "CGImage"), 1);

  }
  WeakRetained = v85;

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v4 = (id *)(a1 + 32);
  v7 = v84;
LABEL_43:
  objc_msgSend(*v4, "setGenerator:", 0);

}

void __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_downloadThumbnailForRequest:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    _log_9();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32));

    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed to generate a thumbnail for request %@ and could not download thumbnail: no backing ubiquitous item found (%@)"), v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E08];
    v16 = *MEMORY[0x1E0CB2938];
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB3388]);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(*(id *)(a1 + 32), "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithCode:request:additionalUserInfo:", 0, v14, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);

  }
}

void __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_10:
    v6();
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelled"))
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 48);
    cancelledError(*(void **)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isUbiquitous"))
    {
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 40), "downloadThumbnailForRequest:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
LABEL_11:

}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id location;

  v3 = a2;
  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "cancelled");
    _log_3();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v6)
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_1();

      v9 = a1 + 32;
      v7 = *(void **)(a1 + 32);
      v8 = *(void **)(v9 + 8);
      cancelledError(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "failedToCompleteThumbnailRequest:error:", v7, v10);

    }
    else
    {
      if (v6)
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_2();

      objc_initWeak(&location, *(id *)(a1 + 32));
      v12 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 40);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_31;
      v13[3] = &unk_1E99D3278;
      v13[4] = v11;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v11, "findUncachedThumbnailInGenStoreOrDownload:completionHandler:", v12, v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_2();

    v6 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    generationFailedErrorWithUnderlyingError(v6, v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failedToCompleteThumbnailRequest:error:", v6, v7);

  }
  else
  {
    v8 = (id *)(a1 + 32);
    v9 = objc_msgSend(*(id *)(a1 + 32), "isDownloaded");
    _log_3();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = *v8;
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "%@ is downloaded. Trying to generate a thumbnail locally", buf, 0xCu);
      }

      if (objc_msgSend(*v8, "cancelled"))
      {
        _log_3();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = *v8;
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1D54AE000, v13, OS_LOG_TYPE_INFO, "Before generateThumbnailForThumbnailRequest: thumbnail request %@ cancelled", buf, 0xCu);
        }

        v16 = *(void **)(a1 + 32);
        v15 = *(void **)(a1 + 40);
        cancelledError(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "failedToCompleteThumbnailRequest:error:", v16, v17);

      }
      else
      {
        v21 = *(void **)(a1 + 32);
        v22 = *(void **)(a1 + 40);
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30;
        v27[3] = &unk_1E99D2ED8;
        v23 = v21;
        v24 = *(_QWORD *)(a1 + 40);
        v28 = v23;
        v29 = v24;
        objc_msgSend(v22, "generateThumbnailForThumbnailRequest:shouldUpdateGenstore:completionHandler:", v23, 0, v27);

      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_1();

      v18 = (uint64_t *)(a1 + 32);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v19 = *(void **)(a1 + 40);
      v20 = *v18;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_33;
      v25[3] = &unk_1E99D3278;
      v25[4] = v19;
      objc_copyWeak(&v26, (id *)buf);
      objc_msgSend(v19, "findUncachedThumbnailInGenStoreOrDownload:completionHandler:", v20, v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v3 = objc_claimAutoreleasedReturnValue();
  os_activity_scope_enter(v3, &state);

  if (objc_msgSend(*v2, "cancelled"))
  {
    _log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28_cold_1();

    v6 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    cancelledError(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "failedToCompleteThumbnailRequest:error:", v6, v7);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29;
    v11[3] = &unk_1E99D2ED8;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = v9;
    v13 = v10;
    objc_msgSend(v9, "computeUbiquitousnessWithCompletionHandler:", v11);
    v7 = v12;
  }

  os_activity_scope_leave(&state);
}

- (id)failedDownloadErrorForRequest:(id)a3 underlyingError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isDownloaded"))
    v8 = CFSTR("Could not generate thumbnail for %@, and could not download a thumbnail either");
  else
    v8 = CFSTR("Could not download a thumbnail for cloud item %@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB2938];
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB2938]);
  if (v6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CB3388]);
  v12 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(v5, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithCode:request:additionalUserInfo:", 3, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)downloadThumbnailForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  QLServerThread *v20;
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDownloadingAllowed");

  if ((v9 & 1) != 0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E99D3B48;
    v19 = v6;
    v20 = self;
    v21 = v7;
    objc_msgSend(v19, "fetchFPItemWithCompletionHandler:", v18);

    v10 = v19;
  }
  else
  {
    _log_9();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Will not add thumbnail-download to queue because downloading is not allowed for request: %@.", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Failed to generate a thumbnail for request %@ and thumbnail downloading is not allowed for this request"), v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v6, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CB2938];
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithCode:request:additionalUserInfo:", 0, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (void)generateThumbnailForThumbnailRequest:(id)a3 shouldUpdateGenstore:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  QLPreviewThumbnailGenerator *v26;
  void *v27;
  uint64_t v28;
  QLPreviewThumbnailGenerator *v29;
  id v30;
  NSObject *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  QLPreviewThumbnailGenerator *v35;
  id v36;
  QLServerThread *v37;
  id v38;
  id v39;
  id v40;
  char v41;
  char v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  id v47;
  uint64_t v48;

  v6 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = a5;
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  if (v6)
  {
    objc_msgSend(v10, "scale");
    v12 = 1024.0 / v11;
    objc_msgSend(v10, "scale");
    objc_msgSend(v10, "setSize:", v12, 1024.0 / v13);
  }
  objc_msgSend(v8, "taggedLogicalURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isDataBased");
  _log_3();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v47 = v8;
      _os_log_impl(&dword_1D54AE000, v16, OS_LOG_TYPE_INFO, "About to generate a thumbnail locally for data request: %@", buf, 0xCu);
    }

    v18 = objc_alloc(MEMORY[0x1E0CD32D8]);
    objc_msgSend(v10, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithData:contentType:", v19, v20);
    goto LABEL_14;
  }
  if (v17)
  {
    *(_DWORD *)buf = 138412290;
    v47 = v14;
    _os_log_impl(&dword_1D54AE000, v16, OS_LOG_TYPE_INFO, "About to generate a thumbnail locally from URL: %@", buf, 0xCu);
  }

  if (objc_msgSend(v10, "isFileBased"))
  {
    objc_msgSend(v10, "genericSandboxWrapper");
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v22;
    v23 = objc_alloc(MEMORY[0x1E0CD32D8]);
    objc_msgSend(v10, "parentDirectorySandboxWrapper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v23, "initWithURLWrapper:parentDirectoryWrapper:contentType:", v19, v20, v24);

LABEL_14:
    if (objc_msgSend(v10, "provideLowQualityThumbnail"))
      v25 = objc_msgSend(v8, "needsLowQualityThumbnailGeneration");
    else
      v25 = 0;
    v26 = -[QLPreviewThumbnailGenerator initWithGeneratorRequest:lowQuality:thumbnailItem:]([QLPreviewThumbnailGenerator alloc], "initWithGeneratorRequest:lowQuality:thumbnailItem:", v8, v25, v21);
    -[QLPreviewThumbnailGenerator setGenerationQueue:](v26, "setGenerationQueue:", self->_previewThumbnailGeneratorQueue);
    objc_initWeak((id *)buf, v26);
    objc_msgSend(v8, "request");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    kdebug_trace();

    objc_msgSend(v8, "setGenerator:", v26);
    v28 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke;
    v44[3] = &unk_1E99D33B0;
    v45 = v8;
    v33[0] = v28;
    v33[1] = 3221225472;
    v33[2] = __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2;
    v33[3] = &unk_1E99D33D8;
    v34 = v45;
    objc_copyWeak(&v40, (id *)buf);
    v41 = v25;
    v29 = v26;
    v35 = v29;
    v36 = v14;
    v30 = v32;
    v42 = v15;
    v39 = v30;
    v37 = self;
    v38 = v10;
    v43 = v6;
    -[QLPreviewThumbnailGenerator generateWithWillStartBlock:completionBlock:](v29, "generateWithWillStartBlock:completionBlock:", v44, v33);

    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);

    goto LABEL_18;
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v14, 1, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  _log_3();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
    -[QLServerThread generateThumbnailForThumbnailRequest:shouldUpdateGenstore:completionHandler:].cold.1();

  generationFailedErrorWithUnderlyingError(v8, 0, CFSTR("Item does not have a file URL, cannot generate thumbnail locally"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v32 + 2))(v32, v21);
LABEL_18:

}

- (id)genStoreThumbnailForRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "taggedLogicalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v16 = 0;
    v15 = 0;
    v18 = 0;
    if (!a4)
      goto LABEL_24;
    goto LABEL_19;
  }
  v9 = objc_msgSend(v7, "startAccessingSecurityScopedResource");
  v10 = _CFURLPromiseCopyPhysicalURL();
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v8;
  v13 = v12;

  _log_3();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v23 = v8;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1D54AE000, v14, OS_LOG_TYPE_INFO, "Trying GenStore for file at URL: %@ (physical: %@).", buf, 0x16u);
  }

  v21 = 0;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD32B0]), "initWithAdditionsPresentOnURL:error:", v13, &v21);
  v16 = v21;
  if (v16)
  {
    _log_3();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v16;
      _os_log_impl(&dword_1D54AE000, v17, OS_LOG_TYPE_INFO, "Did not retrieve thumbnail from GenStore with error: %@", buf, 0xCu);
    }

  }
  if (v9)
    objc_msgSend(v8, "stopAccessingSecurityScopedResource");

  if (!v15)
  {
    if (!a4)
      goto LABEL_23;
LABEL_19:
    generationFailedErrorWithUnderlyingError(v6, v16, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v15 = 0;
LABEL_22:
    v18 = 0;
    *a4 = v19;
    goto LABEL_24;
  }
  if (!-[QLServerThread _canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:](self, "_canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:", v15, v6, v8))
  {
    if (a4)
    {
      generationFailedErrorWithUnderlyingError(v6, 0, CFSTR("Stored thumbnail version in Generational Storage is invalid for this version of the file"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_23:
    v18 = 0;
    goto LABEL_24;
  }
  v15 = v15;
  v18 = v15;
LABEL_24:

  return v18;
}

- (void)findUncachedThumbnailInGenStoreOrDownload:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  QLServerThread *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke;
  aBlock[3] = &unk_1E99D32A0;
  v9 = v7;
  v20 = v9;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v11 = _Block_copy(aBlock);
  objc_msgSend(v10, "taggedLogicalURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_35;
    v15[3] = &unk_1E99D32C8;
    v16 = v11;
    -[QLServerThread findUncachedThumbnailInGenStoreForRequest:completionHandler:](self, "findUncachedThumbnailInGenStoreForRequest:completionHandler:", v10, v15);
    v13 = v16;
  }
  else
  {
    _log_3();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[QLServerThread findUncachedThumbnailInGenStoreOrDownload:completionHandler:].cold.1();

    generationFailedErrorWithUnderlyingError(v10, 0, CFSTR("Unmaterialized file cannot have thumbnails stored on disk"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v11 + 2))(v11, 0, v13);
  }

}

- (void)findUncachedThumbnailInGenStoreForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v10 = 0;
  v7 = (void (**)(id, id))a4;
  -[QLServerThread genStoreThumbnailForRequest:error:](self, "genStoreThumbnailForRequest:error:", v6, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (v8)
    -[QLServerThread findThumbnailInAddition:request:completionHandler:](self, "findThumbnailInAddition:request:completionHandler:", v8, v6, v7);
  else
    v7[2](v7, v9);

}

- (void)failedToCompleteThumbnailRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "setGenerationError:", v7);
  _log_3();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[QLServerThread failedToCompleteThumbnailRequest:error:].cold.1();

  objc_msgSend(v6, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requestedMostRepresentativeType");
  LOBYTE(v11) = 1;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v6, 0, 0, 0, v10, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v11, v7);

}

- (void)findUncachedThumbnailInExternalThumbnailCacheForRequest:(id)a3 item:(id)a4 URL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  QLServerThread *v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  _log_3();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[QLServerThread(ExternalCache) findUncachedThumbnailInExternalThumbnailCacheForRequest:item:URL:completionHandler:].cold.1();

  objc_msgSend(v10, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke;
  v20[3] = &unk_1E99D2CA8;
  v24 = self;
  v25 = v12;
  v21 = v10;
  v22 = v11;
  v23 = v15;
  v16 = v15;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  -[QLServerThread getExternalThumbnailCacheConnectionForItem:atURL:completionHandler:](self, "getExternalThumbnailCacheConnectionForItem:atURL:completionHandler:", v17, v13, v20);

}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2;
    v26[3] = &unk_1E99D2C58;
    v28 = *(id *)(a1 + 64);
    v27 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v26);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _log_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(void **)(a1 + 40);
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2;
    v20[3] = &unk_1E99D2C80;
    v21 = v13;
    v22 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v23 = v14;
    v24 = v15;
    objc_msgSend(v5, "getThumbnailURLForItem:completion:", v21, v20);

  }
  else
  {
    v16 = *(_QWORD *)(a1 + 64);
    v17 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(*(id *)(a1 + 32), "request");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithCode:request:additionalUserInfo:", 0, v19, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  }
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1();

  v5 = (void *)MEMORY[0x1E0CD32D0];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB3388];
  v11[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithCode:request:additionalUserInfo:", 0, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v9);

}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  const __CFURL *v5;
  id v6;
  NSObject *v7;
  CGImageSourceRef v8;
  CGImageSourceRef v9;
  double v10;
  double v11;
  CGImage *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_5();

    v8 = CGImageSourceCreateWithURL(v5, 0);
    if (v8)
    {
      v9 = v8;
      QLThumbnailingImageIOGetSizeFromImageSourceAtIndex();
      if (v11 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not decode an image from thumbnail data at %@ for %@: image size is zero"), v5, *(_QWORD *)(a1 + 40));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _log_3();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_2();

        v31 = *(_QWORD *)(a1 + 64);
        v32 = (void *)MEMORY[0x1E0CD32D0];
        objc_msgSend(*(id *)(a1 + 40), "request");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *MEMORY[0x1E0CB2938];
        v43 = v29;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithCode:request:additionalUserInfo:", 0, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v31 + 16))(v31, v35);

        CFRelease(v9);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "size");
        objc_msgSend(*(id *)(a1 + 48), "minimumDimension");
        objc_msgSend(*(id *)(a1 + 48), "scale");
        objc_msgSend(*(id *)(a1 + 48), "interpolationQuality");
        v13 = (CGImage *)QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
        _log_3();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_4();

          objc_msgSend(*(id *)(a1 + 56), "imageDataForImage:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD32A0], "bitmapFormatWithBitmapImage:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 56), "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v16, v17, 0, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *(_QWORD *)(a1 + 40));
          CGImageRelease(v13);
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_3();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not decode an image from thumbnail data at %@ for %@"), v5, *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *(_QWORD *)(a1 + 64);
          v37 = (void *)MEMORY[0x1E0CD32D0];
          objc_msgSend(*(id *)(a1 + 40), "request");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *MEMORY[0x1E0CB2938];
          v41 = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "errorWithCode:request:additionalUserInfo:", 0, v17, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v36 + 16))(v36, v39);

        }
        CFRelease(v9);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not decode an image from thumbnail data at %@ for %@"), v5, *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _log_3();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1();

      v24 = *(_QWORD *)(a1 + 64);
      v25 = (void *)MEMORY[0x1E0CD32D0];
      objc_msgSend(*(id *)(a1 + 40), "request");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *MEMORY[0x1E0CB2938];
      v45[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithCode:request:additionalUserInfo:", 0, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v28);

    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 64);
    v19 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(*(id *)(a1 + 40), "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithCode:request:additionalUserInfo:", 0, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v21);

  }
}

- (void)receivedExternalCacheConnection:(id)a3 error:(id)a4 forProviderDomainID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *queue;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  QLServerThread *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFF47518);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRemoteObjectInterface:", v11);

    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke;
    v25[3] = &unk_1E99D2CD0;
    v13 = v10;
    v26 = v13;
    v27 = self;
    objc_msgSend(v8, "setInvalidationHandler:", v25);
    objc_msgSend(v8, "resume");
    objc_msgSend(v8, "remoteObjectProxy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_19;
    v22[3] = &unk_1E99D2CF8;
    v22[4] = self;
    v23 = v13;
    v24 = v8;
    v15 = v13;
    objc_msgSend(v14, "getThumbnailCacheURLWrappersWithCompletion:", v22);

    v16 = v26;
  }
  else
  {
    _log_3();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[QLServerThread(ExternalCache) receivedExternalCacheConnection:error:forProviderDomainID:].cold.1();

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_21;
    block[3] = &unk_1E99D2CD0;
    block[4] = self;
    v21 = v10;
    v19 = v10;
    dispatch_sync(queue, block);
    -[QLServerThread _updateInformationForProviderAndCallPendingBlocksForProviderDomainID:withConnection:inboxURL:thumbnailsURL:](self, "_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:withConnection:inboxURL:thumbnailsURL:", v19, 0, 0, 0);
    v16 = v21;
  }

}

uint64_t __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(a1 + 40), "_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:withConnection:inboxURL:thumbnailsURL:", *(_QWORD *)(a1 + 32), 0, 0, 0);
}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "url");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startAccessingSecurityScopedResource");
  objc_msgSend(*(id *)(a1 + 32), "_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:withConnection:inboxURL:thumbnailsURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, v6);

}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_21(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "knownDomainsWithoutExternalThumbnailCaches");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)_updateInformationForProviderAndCallPendingBlocksForProviderDomainID:(id)a3 withConnection:(id)a4 inboxURL:(id)a5 thumbnailsURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__0;
  v37 = __Block_byref_object_dispose__0;
  v38 = 0;
  -[QLServerThread queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __140__QLServerThread_ExternalCache___updateInformationForProviderAndCallPendingBlocksForProviderDomainID_withConnection_inboxURL_thumbnailsURL___block_invoke;
  block[3] = &unk_1E99D2D20;
  block[4] = self;
  v15 = v10;
  v28 = v15;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v18 = v13;
  v31 = v18;
  v32 = &v33;
  dispatch_sync(v14, block);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = (id)v34[5];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v19);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22) + 16))(*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v22));
        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    }
    while (v20);
  }

  _Block_object_dispose(&v33, 8);
}

void __140__QLServerThread_ExternalCache___updateInformationForProviderAndCallPendingBlocksForProviderDomainID_withConnection_inboxURL_thumbnailsURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCaches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheInboxURLs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 40));

  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheThumbnailURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheAvailablePendingBlocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheAvailablePendingBlocks");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

}

- (void)getExternalThumbnailCacheConnectionForItem:(id)a3 atURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *queue;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v8 = a3;
  v28 = a4;
  v9 = a5;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__0;
  v53 = __Block_byref_object_dispose__0;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  objc_msgSend(v8, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("QLEnableExternalThumbnailCache"));

  if ((v12 & 1) != 0)
  {
    queue = self->_queue;
    v14 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke;
    block[3] = &unk_1E99D2D48;
    block[4] = self;
    v15 = v10;
    v35 = v15;
    v38 = &v45;
    v16 = v9;
    v37 = v16;
    v39 = &v41;
    v40 = &v49;
    v17 = v8;
    v36 = v17;
    dispatch_sync(queue, block);
    if (!*((_BYTE *)v42 + 24))
    {
      if (*((_BYTE *)v46 + 24))
      {
        (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
      }
      else
      {
        v18 = v50[5];
        if (v18)
        {
          -[QLServerThread externalThumbnailCacheInboxURLs](self, "externalThumbnailCacheInboxURLs");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "providerDomainID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, v18, v21);

        }
        else
        {
          v22 = (void *)MEMORY[0x1E0C99DE8];
          v23 = _Block_copy(v16);
          objc_msgSend(v22, "arrayWithObject:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = self->_queue;
          v31[0] = v14;
          v31[1] = 3221225472;
          v31[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_2;
          v31[3] = &unk_1E99D2D70;
          v31[4] = self;
          v26 = v15;
          v32 = v26;
          v19 = v24;
          v33 = v19;
          dispatch_sync(v25, v31);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = v14;
          v29[1] = 3221225472;
          v29[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_3;
          v29[3] = &unk_1E99D2DC0;
          v29[4] = self;
          v30 = v26;
          objc_msgSend(v27, "getFileProviderServicesForItemAtURL:completionHandler:", v28, v29);

        }
      }
    }

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "knownDomainsWithoutExternalThumbnailCaches");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "member:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheAvailablePendingBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v5 = _Block_copy(*(const void **)(a1 + 56));
      objc_msgSend(v10, "addObject:", v5);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCaches");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "providerDomainID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheAvailablePendingBlocks");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.filesystems.LiveItemThumbnails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("com.apple.filesystems.LiveItemThumbnails"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_4;
    v10[3] = &unk_1E99D2D98;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    objc_msgSend(v8, "getFileProviderConnectionWithCompletionHandler:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "receivedExternalCacheConnection:error:forProviderDomainID:", 0, v6, *(_QWORD *)(a1 + 40));
  }

}

uint64_t __100__QLServerThread_ExternalCache__getExternalThumbnailCacheConnectionForItem_atURL_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedExternalCacheConnection:error:forProviderDomainID:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)storeImage:(CGImage *)a3 inExternalThumbnailCacheForItem:(id)a4 atURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  CGImage *v13;

  v8 = a4;
  v9 = a5;
  CGImageRetain(a3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke;
  v11[3] = &unk_1E99D2E38;
  v12 = v8;
  v13 = a3;
  v11[4] = self;
  v10 = v8;
  -[QLServerThread getExternalThumbnailCacheConnectionForItem:atURL:completionHandler:](self, "getExternalThumbnailCacheConnectionForItem:atURL:completionHandler:", v10, v9, v11);

}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "externalThumbnailCacheQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_2;
    v8[3] = &unk_1E99D2E10;
    v12 = *(_QWORD *)(a1 + 48);
    v9 = v6;
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    dispatch_async(v7, v8);

  }
  else
  {
    CGImageRelease(*(CGImageRef *)(a1 + 48));
  }

}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0CD3290], "writeThumbnailImage:inInboxAtURL:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(*(CGImageRef *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3;
  v5[3] = &unk_1E99D2DE8;
  v6 = v4;
  objc_msgSend(v3, "storeThumbnailAtURL:forItem:completion:", v2, v6, v5);

}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _log_3();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "Store thumbnail for %@ in external thumbnail cache", (uint8_t *)&v7, 0xCu);
  }

}

- (QLServerThread)init
{
  int64_t v3;
  void *v4;
  QLServerThread *v5;

  v3 = +[_QLCacheThread defaultCacheSize](_QLCacheThread, "defaultCacheSize");
  +[QLDiskCache defaultLocation](QLDiskCache, "defaultLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[QLServerThread initWithCacheSize:location:](self, "initWithCacheSize:location:", v3, v4);

  return v5;
}

- (QLServerThread)initWithCacheSize:(int64_t)a3 location:(id)a4
{
  id v6;
  QLServerThread *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *completionBlocksQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *genstoreCachingQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *pendingRequests;
  NSOperationQueue *v19;
  NSOperationQueue *downloadsOperationQueue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *pendingDownloadsQueue;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *downloadResponseProcessingQueue;
  NSOperationQueue *v27;
  NSOperationQueue *uncachedThumbnailRetrievalQueue;
  NSOperationQueue *v29;
  NSOperationQueue *downscaledThumbnailGenerationQueue;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *previewThumbnailGeneratorQueue;
  NSObject *v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *externalThumbnailCacheQueue;
  NSMutableDictionary *v38;
  NSMutableDictionary *volumesToCaches;
  OS_dispatch_source *watchdogTimer;
  NSMutableSet *v41;
  NSMutableSet *knownDomainsWithoutExternalThumbnailCaches;
  NSMutableDictionary *v43;
  NSMutableDictionary *domainsToCaches;
  NSMutableDictionary *v45;
  NSMutableDictionary *externalThumbnailCacheAvailablePendingBlocks;
  NSMutableDictionary *v47;
  NSMutableDictionary *queuedDownloadRequests;
  NSMutableDictionary *v49;
  NSMutableDictionary *externalThumbnailCaches;
  NSMutableDictionary *v51;
  NSMutableDictionary *externalThumbnailCacheInboxURLs;
  NSMutableDictionary *v53;
  NSMutableDictionary *externalThumbnailCacheThumbnailURLs;
  _QLCacheThread *v55;
  _QLCacheThread *cacheThread;
  _QLCacheThread *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  objc_super v62;
  statfs v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v62.receiver = self;
  v62.super_class = (Class)QLServerThread;
  v7 = -[QLServerThread init](&v62, sel_init);
  if (v7)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.quicklook.server", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.quicklook.servercompletionblocks", v11);
    completionBlocksQueue = v7->_completionBlocksQueue;
    v7->_completionBlocksQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.quicklook.genstorecaching", v14);
    genstoreCachingQueue = v7->_genstoreCachingQueue;
    v7->_genstoreCachingQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v7->_pendingRequests;
    v7->_pendingRequests = v17;

    v19 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    downloadsOperationQueue = v7->_downloadsOperationQueue;
    v7->_downloadsOperationQueue = v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.quicklook.fpthumbnailspending", v21);
    pendingDownloadsQueue = v7->_pendingDownloadsQueue;
    v7->_pendingDownloadsQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.quicklook.fpthumbnailsresponse", v24);
    downloadResponseProcessingQueue = v7->_downloadResponseProcessingQueue;
    v7->_downloadResponseProcessingQueue = (OS_dispatch_queue *)v25;

    v7->_drainScheduled = 0;
    atomic_store(0, (unsigned int *)&v7->_thumbnailDownloadsInFlight);
    -[NSOperationQueue setQualityOfService:](v7->_downloadsOperationQueue, "setQualityOfService:", 17);
    v27 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    uncachedThumbnailRetrievalQueue = v7->_uncachedThumbnailRetrievalQueue;
    v7->_uncachedThumbnailRetrievalQueue = v27;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_uncachedThumbnailRetrievalQueue, "setMaxConcurrentOperationCount:", 4);
    v29 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    downscaledThumbnailGenerationQueue = v7->_downscaledThumbnailGenerationQueue;
    v7->_downscaledThumbnailGenerationQueue = v29;

    -[NSOperationQueue setQualityOfService:](v7->_downscaledThumbnailGenerationQueue, "setQualityOfService:", 9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_downscaledThumbnailGenerationQueue, "setMaxConcurrentOperationCount:", 1);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.quicklook.previewthumbnailgeneration", v31);
    previewThumbnailGeneratorQueue = v7->_previewThumbnailGeneratorQueue;
    v7->_previewThumbnailGeneratorQueue = (OS_dispatch_queue *)v32;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v34 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v34, QOS_CLASS_BACKGROUND, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create("com.apple.quicklook.externalcache", v35);
    externalThumbnailCacheQueue = v7->_externalThumbnailCacheQueue;
    v7->_externalThumbnailCacheQueue = (OS_dispatch_queue *)v36;

    v38 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    volumesToCaches = v7->_volumesToCaches;
    v7->_volumesToCaches = v38;

    watchdogTimer = v7->_watchdogTimer;
    v7->_watchdogTimer = 0;

    v41 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownDomainsWithoutExternalThumbnailCaches = v7->_knownDomainsWithoutExternalThumbnailCaches;
    v7->_knownDomainsWithoutExternalThumbnailCaches = v41;

    v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    domainsToCaches = v7->_domainsToCaches;
    v7->_domainsToCaches = v43;

    v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalThumbnailCacheAvailablePendingBlocks = v7->_externalThumbnailCacheAvailablePendingBlocks;
    v7->_externalThumbnailCacheAvailablePendingBlocks = v45;

    v47 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queuedDownloadRequests = v7->_queuedDownloadRequests;
    v7->_queuedDownloadRequests = v47;

    v49 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalThumbnailCaches = v7->_externalThumbnailCaches;
    v7->_externalThumbnailCaches = v49;

    v51 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalThumbnailCacheInboxURLs = v7->_externalThumbnailCacheInboxURLs;
    v7->_externalThumbnailCacheInboxURLs = v51;

    v53 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalThumbnailCacheThumbnailURLs = v7->_externalThumbnailCacheThumbnailURLs;
    v7->_externalThumbnailCacheThumbnailURLs = v53;

    v7->_cacheInitLock._os_unfair_lock_opaque = 0;
    v55 = -[_QLCacheThread initWithServerThread:cacheSize:location:]([_QLCacheThread alloc], "initWithServerThread:cacheSize:location:", v7, a3, v6);
    cacheThread = v7->_cacheThread;
    v7->_cacheThread = v55;

    v57 = v7->_cacheThread;
    if (v57)
    {
      -[_QLCacheThread openCache](v57, "openCache");
    }
    else
    {
      _log_3();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[QLServerThread initWithCacheSize:location:].cold.1(v58);

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_volumesToCaches, "setObject:forKeyedSubscript:", v7->_cacheThread, v59);
    memset(&v63, 0, 512);
    if (!statfs("/", &v63))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v63.f_fsid, "{fsid=[2i]}");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_fsidsToCaches, "setObject:forKeyedSubscript:", v7->_cacheThread, v60);

    }
  }

  return v7;
}

void __32__QLServerThread_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1D82731C0]();
  v3 = objc_alloc_init(*(Class *)(a1 + 32));
  v4 = (void *)QLServerThreadInstance;
  QLServerThreadInstance = (uint64_t)v3;

  objc_msgSend((id)QLServerThreadInstance, "cacheThread");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)QLCacheThreadInstance;
  QLCacheThreadInstance = v5;

  objc_autoreleasePoolPop(v2);
}

- (void)perform:(id)a3 afterDelay:(int64_t)a4
{
  dispatch_time_t v6;
  dispatch_block_t block;

  block = a3;
  v6 = dispatch_time(0, a4);
  dispatch_after(v6, (dispatch_queue_t)self->_queue, block);

}

- (id)makeCacheThreadForPersonaString:(id)a3 containerURL:(id *)a4
{
  _QLCacheThread *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[QLServerThread overrideBasePersonaVolumesURLForTesting](self, "overrideBasePersonaVolumesURLForTesting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[QLServerThread overrideBasePersonaVolumesURLForTesting](self, "overrideBasePersonaVolumesURLForTesting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
    objc_msgSend(v10, "URLByAppendingPathComponent:", *MEMORY[0x1E0CD3390]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v10);
    +[QLDiskCache setupCacheAtLocationIfNecessary:](QLDiskCache, "setupCacheAtLocationIfNecessary:", v25);
    v4 = -[_QLCacheThread initWithServerThread:cacheSize:location:]([_QLCacheThread alloc], "initWithServerThread:cacheSize:location:", self, +[_QLCacheThread defaultCacheSize](_QLCacheThread, "defaultCacheSize"), v25);

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentPersona");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend(v12, "userPersonaUniqueString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 == v7
    || (objc_msgSend(v13, "isEqualToString:", v7) & 1) != 0
    || !voucher_process_can_use_arbitrary_personas())
  {
    v19 = 0;
  }
  else
  {
    v27 = 0;
    v15 = (void *)objc_msgSend(v12, "copyCurrentPersonaContextWithError:", &v27);
    v16 = v27;
    v17 = v28;
    v28 = v15;

    if (v16)
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[QLServerThread makeCacheThreadForPersonaString:containerURL:].cold.3();

    }
    objc_msgSend(v12, "generateAndRestorePersonaContextWithPersonaUniqueString:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[QLServerThread makeCacheThreadForPersonaString:containerURL:].cold.2();

    }
  }
  v21 = (void *)container_create_or_lookup_path_for_current_user();
  if (v21)
  {
    _log_3();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v7;
      v31 = 2080;
      v32 = v21;
      _os_log_impl(&dword_1D54AE000, v22, OS_LOG_TYPE_INFO, "Creating cache for persona %@ in container %s", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v21, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    free(v21);
  }
  else
  {
    _log_3();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[QLServerThread makeCacheThreadForPersonaString:containerURL:].cold.1();

    v4 = self->_cacheThread;
    v10 = 0;
  }

  _FPRestorePersona();
  if (v21)
    goto LABEL_23;
LABEL_26:

  return v4;
}

- (id)uncachedCacheThreadForProviderDomainID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QLCacheThread *v12;
  id v13;
  NSObject *v14;
  uint64_t v16;
  id v17;
  id v18;

  v4 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CAACA8], "providerDomainWithID:cachePolicy:error:", v4, 1, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (!v5)
  {
    _log_3();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[QLServerThread uncachedCacheThreadForProviderDomainID:].cold.1();

    goto LABEL_11;
  }
  objc_msgSend(v5, "personaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_11:
    v12 = self->_cacheThread;
    goto LABEL_14;
  }
  v8 = (void *)MEMORY[0x1E0DC5F00];
  objc_msgSend(v5, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaAttributesForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(v10, "isDataSeparatedPersona") & 1) != 0)
  {
    objc_msgSend(v5, "personaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[QLServerThread makeCacheThreadForPersonaString:containerURL:](self, "makeCacheThreadForPersonaString:containerURL:", v11, &v17);
    v12 = (_QLCacheThread *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    v16 = 0;
    if (objc_msgSend(v13, "getResourceValue:forKey:error:", &v16, *MEMORY[0x1E0C99D08], 0))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_volumesToCaches, "setObject:forKeyedSubscript:", v12, v16);
    -[_QLCacheThread openCache](v12, "openCache");

  }
  else
  {
    v12 = self->_cacheThread;
  }

LABEL_14:
  return v12;
}

- (void)generateSuccessiveThumbnailRepresentationsForRequests:(id)a3 generationHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  QLTGeneratorThumbnailRequest *v18;
  QLTGeneratorThumbnailRequest *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
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
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        v18 = [QLTGeneratorThumbnailRequest alloc];
        v19 = -[QLTGeneratorThumbnailRequest initWithRequest:generationHandler:](v18, "initWithRequest:generationHandler:", v17, v9, (_QWORD)v20);
        objc_msgSend(v11, "addObject:", v19);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  -[QLServerThread generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:](self, "generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:", v11, v10);
}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[16], "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_4);
    WeakRetained = v2;
  }

}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = v6;

  if (v7 < -600.0)
  {
    _log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2_cold_1();

  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_cold_1();

  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(v5 + 8);
  cancelledError(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failedToCompleteThumbnailRequest:error:", v3, v6);

}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26_cold_1();

  v5 = a1 + 32;
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(v5 + 8);
  v6 = (void *)MEMORY[0x1E0CD32D0];
  objc_msgSend(v3, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithCode:request:additionalUserInfo:", 4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "failedToCompleteThumbnailRequest:error:", v3, v8);
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_31(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  id WeakRetained;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (id *)(a1 + 40);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(v2, "failedToCompleteThumbnailRequest:error:", WeakRetained, v4);

  }
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  id *v3;
  id v4;
  id WeakRetained;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = (id *)(a1 + 40);
    v4 = a2;
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(v2, "failedToCompleteThumbnailRequest:error:", WeakRetained, v4);

  }
}

uint64_t __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0, a2);
}

- (void)processLargeThumbnailData:(id)a3 withContentType:(id)a4 isAppContainer:(BOOL)a5 forRequest:(id)a6 fromGenStore:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  const void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CGImage *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void **v41;
  uint64_t *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  NSObject *genstoreCachingQueue;
  BOOL v63;
  void *v64;
  id v65;
  _QWORD block[5];
  id v67;
  id v68;
  const void *v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint8_t buf[4];
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;
  uint64_t v87;
  _QWORD v88[4];

  v11 = a5;
  v88[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  if (!v17)
    -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.1();
  v18 = (void (**)(_QWORD, _QWORD))v17;
  if (!v14)
  {
    _log_3();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.2();

    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "request");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", CFSTR("Could not generate thumbnail: retrieved thumbnail had nil data for thumbnail request %@"), v37);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v16, "request");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = *MEMORY[0x1E0CB2938];
    v88[0] = v26;
    v40 = (void *)MEMORY[0x1E0C99D80];
    v41 = (void **)v88;
    v42 = &v87;
    goto LABEL_19;
  }
  v19 = QLThumbnailingImageIOCreateImageSourceFromData();
  if (!v19)
  {
    _log_3();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v82 = v14;
      v83 = 2112;
      v84 = v15;
      v85 = 2112;
      v86 = v16;
      _os_log_error_impl(&dword_1D54AE000, v43, OS_LOG_TYPE_ERROR, "Received thumbnail data which ImageIO is unable to read (%@ %@) for %@", buf, 0x20u);
    }

    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "request");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("Unable to decode thumbnail image data (of type %@) for thumbnail request %@"), v15, v45);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v16, "request");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = *MEMORY[0x1E0CB2938];
    v80 = v26;
    v40 = (void *)MEMORY[0x1E0C99D80];
    v41 = &v80;
    v42 = &v79;
LABEL_19:
    objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithCode:request:additionalUserInfo:", 0, v39, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
    ((void (**)(_QWORD, void *))v18)[2](v18, v47);

    goto LABEL_24;
  }
  v20 = (const void *)v19;
  QLThumbnailingImageIOGetSizeFromImageSourceAtIndex();
  v23 = v22;
  v24 = v21;
  if (v22 == *MEMORY[0x1E0C9D820] && v21 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    _log_3();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.3();

    v49 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "request");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stringWithFormat:", CFSTR("Unable to decode thumbnail image data (of type %@) for thumbnail request %@"), v15, v50);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v16, "request");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = *MEMORY[0x1E0CB2938];
    v78 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "errorWithCode:request:additionalUserInfo:", 0, v52, v53);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v20);
    goto LABEL_23;
  }
  v65 = v15;
  objc_msgSend(v16, "request");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "size");
  QLAdaptSizeInSize();
  v28 = v27;
  v30 = v29;
  objc_msgSend(v26, "size");
  objc_msgSend(v26, "minimumDimension");
  objc_msgSend(v26, "scale");
  v31 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
  if (v31)
  {
    v32 = (CGImage *)v31;
    v63 = a7;
    -[QLServerThread imageDataForImage:](self, "imageDataForImage:", v31);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD32A0], "bitmapFormatWithBitmapImage:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _log_3();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.5();

    -[QLServerThread addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:](self, "addImageData:withBitmapFormat:contentRect:hasIconModeApplied:flavor:extensionBadge:metadata:toCacheAndCompleteRequest:", v64, v33, v11, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v16);
    CGImageRelease(v32);

    if (v11)
    {
      CFRelease(v20);
    }
    else
    {
      genstoreCachingQueue = self->_genstoreCachingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke;
      block[3] = &unk_1E99D3310;
      block[4] = self;
      v67 = v14;
      v68 = v16;
      v69 = v20;
      v70 = v23;
      v71 = v24;
      v72 = v28;
      v73 = v30;
      v74 = v63;
      dispatch_async(genstoreCachingQueue, block);

    }
    v15 = v65;
    v18[2](v18, 0);
  }
  else
  {
    v54 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "request");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "stringWithFormat:", CFSTR("Unable to decode thumbnail image data (of type %@) for thumbnail request %@"), v15, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = (void *)MEMORY[0x1E0CD32D0];
    objc_msgSend(v16, "request");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = *MEMORY[0x1E0CB2938];
    v76 = v56;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "errorWithCode:request:additionalUserInfo:", 0, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    _log_3();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:].cold.4();

    ((void (**)(_QWORD, void *))v18)[2](v18, v60);
    CFRelease(v20);

    v15 = v65;
  }
LABEL_24:

}

uint64_t __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke_2;
  v9 = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v10 = v4;
  return objc_msgSend(v2, "_cacheThumbnailData:forRequest:imageSource:actualSize:resultSize:fromGenStore:completionHandler:", v1, v3, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

void __117__QLServerThread_processLargeThumbnailData_withContentType_isAppContainer_forRequest_fromGenStore_completionHandler___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)_cacheThumbnailData:(id)a3 forRequest:(id)a4 imageSource:(CGImageSource *)a5 actualSize:(CGSize)a6 resultSize:(CGSize)a7 fromGenStore:(BOOL)a8 completionHandler:(id)a9
{
  double height;
  double width;
  double v13;
  double v14;
  id v18;
  id v19;
  void (**v20)(id, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD v29[4];
  id v30;
  QLServerThread *v31;
  id v32;
  id v33;
  void (**v34)(id, _QWORD);
  CGImageSource *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;

  height = a7.height;
  width = a7.width;
  v13 = a6.height;
  v14 = a6.width;
  v18 = a3;
  v19 = a4;
  v20 = (void (**)(id, _QWORD))a9;
  objc_msgSend(v19, "taggedLogicalURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "request");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21)
  {
    if (!a8)
      -[QLServerThread _saveLargeThumbnailToGenstoreWithData:url:](self, "_saveLargeThumbnailToGenstoreWithData:url:", v18, v21);
    v20[2](v20, 0);
  }
  else
  {
    if (objc_msgSend(v22, "isUbiquitous"))
    {
      objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "item");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke;
      v29[3] = &unk_1E99D3338;
      v30 = v23;
      v40 = a8;
      v34 = v20;
      v31 = self;
      v32 = v18;
      v33 = v19;
      v35 = a5;
      v36 = v14;
      v37 = v13;
      v38 = width;
      v39 = height;
      objc_msgSend(v24, "fetchURLForItem:creatingPlaceholderIfMissing:completionHandler:", v25, 0, v29);

      v26 = v30;
    }
    else
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_2;
      v27[3] = &unk_1E99D2A68;
      v28 = v20;
      -[QLServerThread _addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:](self, "_addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:", v19, a5, v27, v14, v13, width, height);
      v26 = v28;
    }

  }
}

void __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "item");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1D54AE000, v7, OS_LOG_TYPE_ERROR, "Error fetching URL for item %@ (got %@): %@", buf, 0x20u);

    }
  }
  else
  {
    if (!v5)
    {
      v8 = *(void **)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_53;
      v12[3] = &unk_1E99D2A68;
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 72);
      v13 = *(id *)(a1 + 64);
      objc_msgSend(v8, "_addAllThumbnailsSizesToCacheForRequest:withImageSource:imageSize:alreadyCachedSize:completionHandler:", v9, v10, v12, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));

      goto LABEL_6;
    }
    if (!*(_BYTE *)(a1 + 112))
      objc_msgSend(*(id *)(a1 + 40), "_saveLargeThumbnailToGenstoreWithData:url:", *(_QWORD *)(a1 + 48), v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_6:

}

uint64_t __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __114__QLServerThread__cacheThumbnailData_forRequest_imageSource_actualSize_resultSize_fromGenStore_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_saveLargeThumbnailToGenstoreWithData:(id)a3 url:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  char v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  unsigned int v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v25 = 0;
  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a3;
  objc_msgSend(v6, "_QLTemporaryURLWithExtension:openingFileHandle:inDirectoryAtURL:", CFSTR("jpg"), &v25, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3608]);
  v10 = (void *)objc_msgSend(v9, "initWithFileDescriptor:closeOnDealloc:", v25, 1);
  v24 = 0;
  v11 = objc_msgSend(v10, "writeData:error:", v7, &v24);

  v12 = v24;
  if (v11)
  {
    v23 = 0;
    v13 = objc_msgSend(v10, "closeAndReturnError:", &v23);
    v14 = v23;

    if ((v13 & 1) != 0)
    {
      v15 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
      v16 = (void *)_CFURLPromiseCopyPhysicalURL();
      v17 = (void *)MEMORY[0x1E0CD32B0];
      v26 = *MEMORY[0x1E0C998A8];
      v27[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      v19 = objc_msgSend(v17, "associateThumbnailImagesDictionary:serializedQuickLookMetadata:withDocumentAtURL:error:", v18, 0, v16, &v22);
      v12 = v22;

      if ((v19 & 1) == 0)
      {
        _log_3();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[QLServerThread _saveLargeThumbnailToGenstoreWithData:url:].cold.1();

      }
      if (v15)
        objc_msgSend(v5, "stopAccessingSecurityScopedResource");
      goto LABEL_13;
    }
    v12 = v14;
  }
  _log_3();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[QLServerThread _saveLargeThumbnailToGenstoreWithData:url:].cold.2();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeItemAtURL:error:", v8, 0);
LABEL_13:

}

- (void)_saveLargeThumbnailForDocumentAtURL:(id)a3 toGenstoreWithImage:(CGImage *)a4 automaticallyGenerated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v5 = a5;
  v7 = a3;
  v10 = 0;
  LOBYTE(a4) = objc_msgSend(MEMORY[0x1E0CD32B0], "associateImage:metadata:automaticallyGenerated:withURL:error:", a4, 0, v5, v7, &v10);
  v8 = v10;
  if ((a4 & 1) == 0)
  {
    _log_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[QLServerThread _saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:].cold.1();

  }
}

- (void)_addAllThumbnailsSizesToCacheForRequest:(id)a3 withImageSource:(CGImageSource *)a4 imageSize:(CGSize)a5 alreadyCachedSize:(CGSize)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSOperationQueue *downscaledThumbnailGenerationQueue;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  QLServerThread *v24;
  id v25;
  id v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGImageSource *v31;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v14 = a3;
  v15 = a7;
  if (a4)
    CFRetain(a4);
  objc_msgSend(v14, "request");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLServerThread cacheThreadForRequest:](self, "cacheThreadForRequest:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  downscaledThumbnailGenerationQueue = self->_downscaledThumbnailGenerationQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke;
  v22[3] = &unk_1E99D3388;
  v27 = v11;
  v28 = v10;
  v29 = width;
  v30 = height;
  v31 = a4;
  v23 = v14;
  v24 = self;
  v25 = v17;
  v26 = v15;
  v19 = v15;
  v20 = v17;
  v21 = v14;
  -[NSOperationQueue addOperationWithBlock:](downscaledThumbnailGenerationQueue, "addOperationWithBlock:", v22);

}

void __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v7;
  uint64_t v8;
  CGImage *v9;
  void *v10;
  double Width;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  const void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v2 = 0;
  v36 = *MEMORY[0x1E0C80C00];
  v33 = xmmword_1D55009C0;
  v34 = xmmword_1D55009D0;
  v35 = 0x4061800000000000;
  v29 = 0;
  v30 = 0;
  v31 = xmmword_1D55009E0;
  v32 = 0x4050400000000000;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    QLAdaptSizeInSize();
    if (v5 != *(double *)(a1 + 80) || v4 != *(double *)(a1 + 88))
    {
      objc_msgSend(*(id *)(a1 + 32), "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scale");
      objc_msgSend(v7, "interpolationQuality");
      v8 = QLThumbnailingImageIOCreateThumbnailOfMinimumSizeWithImageSource();
      if (v8)
      {
        v9 = (CGImage *)v8;
        objc_msgSend(*(id *)(a1 + 32), "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        Width = (double)CGImageGetWidth(v9);
        v12 = (void *)objc_msgSend(v10, "copyWithSize:", Width, (double)CGImageGetHeight(v9));

        objc_msgSend(*(id *)(a1 + 40), "imageDataForImage:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD32A0], "bitmapFormatWithBitmapImage:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRelease(v9);
        v15 = *(void **)(a1 + 48);
        v22[0] = v3;
        v22[1] = 3221225472;
        v22[2] = __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke_2;
        v22[3] = &unk_1E99D3360;
        v16 = v15;
        v23 = v16;
        v24 = v12;
        v25 = v14;
        v26 = v13;
        v27 = *(id *)(a1 + 32);
        v28 = v7;
        v17 = v13;
        v18 = v14;
        v19 = v12;
        objc_msgSend(v16, "enqueueWriting:", v22);

      }
    }
    v2 += 8;
  }
  while (v2 != 40);
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(void))(v20 + 16))();
  v21 = *(const void **)(a1 + 96);
  if (v21)
    CFRelease(v21);
}

uint64_t __120__QLServerThread__addAllThumbnailsSizesToCacheForRequest_withImageSource_imageSize_alreadyCachedSize_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = objc_msgSend(*(id *)(a1 + 64), "badgeType");
  v7 = objc_msgSend(*(id *)(a1 + 72), "externalThumbnailGeneratorDataHash");
  return objc_msgSend(v2, "addThumbnailIntoCache:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v3, v4, v5, 0, 0, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v7);
}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "generationHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didUpdateStatus:ofThumbnailGenerationWithUUID:", 0, v3);

}

- (void)findThumbnailInAddition:(id)a3 request:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;

  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0C998A8];
  v11 = a3;
  objc_msgSend(v11, "thumbnailDataForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "thumbnailURLForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v14 = *MEMORY[0x1E0C99AD0];
  v19 = 0;
  v15 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v20, v14, &v19);
  v16 = v20;
  v17 = v19;
  if ((v15 & 1) == 0)
  {
    _log_3();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[QLServerThread findThumbnailInAddition:request:completionHandler:].cold.1();

  }
  -[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:](self, "processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:", v12, v16, 0, v8, 1, v9);

}

- (void)addImageData:(id)a3 toCacheForRequest:(id)a4 withBitmapFormat:(id)a5 contentRect:(CGRect)a6 flavor:(int)a7 metadata:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  int v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a8;
  objc_msgSend(v18, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "forceGeneration");

  if ((v22 & 1) == 0)
  {
    _log_3();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v18;
      _os_log_impl(&dword_1D54AE000, v23, OS_LOG_TYPE_INFO, "Will add image to cache for request: %@.", buf, 0xCu);
    }

    objc_msgSend(v18, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLServerThread cacheThreadForRequest:](self, "cacheThreadForRequest:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__QLServerThread_addImageData_toCacheForRequest_withBitmapFormat_contentRect_flavor_metadata___block_invoke;
    v27[3] = &unk_1E99D3400;
    v28 = v18;
    v29 = v19;
    v30 = v17;
    v31 = v25;
    v32 = v20;
    v37 = a7;
    v33 = x;
    v34 = y;
    v35 = width;
    v36 = height;
    v26 = v25;
    objc_msgSend(v26, "enqueueWriting:", v27);

  }
}

uint64_t __94__QLServerThread_addImageData_toCacheForRequest_withBitmapFormat_contentRect_flavor_metadata___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _log_3();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_impl(&dword_1D54AE000, v2, OS_LOG_TYPE_INFO, "Adding image to cache for request: %@.", buf, 0xCu);
  }

  v4 = objc_msgSend(*(id *)(a1 + 40), "bytesPerRow");
  v5 = objc_msgSend(*(id *)(a1 + 40), "height") * v4;
  v6 = *(id *)(a1 + 48);
  if (v5 < objc_msgSend(*(id *)(a1 + 48), "length"))
  {
    v7 = (v5 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
    if (v7 == objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      objc_msgSend(*(id *)(a1 + 48), "subdataWithRange:", 0, v5);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v8;
    }
  }
  v9 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(unsigned int *)(a1 + 104);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = objc_msgSend(*(id *)(a1 + 32), "badgeType");
  objc_msgSend(*(id *)(a1 + 32), "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "addThumbnailIntoCache:bitmapFormat:bitmapData:metadata:flavor:contentRect:badgeType:externalGeneratorDataHash:", v10, v13, v6, v11, v12, v14, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), objc_msgSend(v15, "externalThumbnailGeneratorDataHash"));

  return v16;
}

- (void)addImageData:(id)a3 withBitmapFormat:(id)a4 contentRect:(CGRect)a5 hasIconModeApplied:(BOOL)a6 flavor:(int)a7 extensionBadge:(id)a8 metadata:(id)a9 toCacheAndCompleteRequest:(id)a10
{
  uint64_t v12;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v12 = *(_QWORD *)&a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v36 = a8;
  v22 = a9;
  v23 = a10;
  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  objc_msgSend(v23, "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "iconMode") && !a6)
  {
    v37 = 0;
    objc_msgSend(v24, "size");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v24, "scale");
    v30 = v29;
    LOBYTE(v35) = objc_msgSend(v24, "provideLowQualityThumbnail");
    +[QLPreviewThumbnailGenerator generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:](QLPreviewThumbnailGenerator, "generateIconDataFromThumbnailData:inputFormat:outputFormat:outputContentRect:desiredSize:desiredScale:desiredFlavor:extensionBadge:wantsLowQuality:iconVariant:", v20, v21, &v37, &v38, v12, v36, v26, v28, v30, v35, objc_msgSend(v24, "iconVariant"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v37;

    v21 = v32;
    v20 = (id)v31;
  }
  if (objc_msgSend(v24, "wantsBaseline") && objc_msgSend(v22, "baseline") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v21, "width");
    objc_msgSend(v21, "height");
    objc_msgSend(v21, "bitsPerComponent");
    objc_msgSend(v21, "bitsPerPixel");
    objc_msgSend(v21, "bytesPerRow");
    objc_msgSend(v21, "bitmapInfo");
    objc_msgSend(objc_retainAutorelease(v20), "bytes");
    objc_msgSend(v22, "setBaseline:", _QLThumbnailComputeBaselineFromData());
  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v22, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  _log_3();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v23;
    _os_log_impl(&dword_1D54AE000, v34, OS_LOG_TYPE_INFO, "completing thumbnail request %@ in addImageData", buf, 0xCu);
  }

  LOBYTE(v35) = 1;
  -[QLServerThread completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:](self, "completeThumbnailRequest:bitmapData:metadata:contentRect:thumbnailRepresentation:iconFlavor:format:clientShouldTakeOwnership:", v23, v20, v33, 2, v12, v21, v38, v39, v40, v41, v35);
  -[QLServerThread addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:](self, "addImageData:toCacheForRequest:withBitmapFormat:contentRect:flavor:metadata:", v20, v23, v21, v12, v33, v38, v39, v40, v41);

}

- (id)imageDataForImage:(CGImage *)a3
{
  CGDataProvider *DataProvider;

  if (!a3)
    return 0;
  DataProvider = CGImageGetDataProvider(a3);
  return CGDataProviderCopyData(DataProvider);
}

- (void)completeThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 thumbnailRepresentation:(int64_t)a7 iconFlavor:(int)a8 clientShouldTakeOwnership:(BOOL)a9
{
  _BOOL8 v9;
  uint64_t v10;
  double height;
  double width;
  double y;
  double x;
  id v19;
  NSObject *queue;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v9 = a9;
  v10 = *(_QWORD *)&a8;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  queue = self->_queue;
  v21 = a5;
  v22 = a4;
  dispatch_assert_queue_not_V2(queue);
  _log_3();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v19;
    _os_log_impl(&dword_1D54AE000, v23, OS_LOG_TYPE_INFO, "completeThumbnailRequest -> sendResultForThumbnailRequest %@", buf, 0xCu);
  }

  LOBYTE(v24) = 1;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v19, v22, v21, v10, a7, v9, x, y, width, height, v24, 0);

}

- (void)thumbnailRequestWasCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "thumbnailRequestWasCancelled %@", (uint8_t *)&v7, 0xCu);
  }

  cancelledError(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLServerThread failedToCompleteThumbnailRequest:error:](self, "failedToCompleteThumbnailRequest:error:", v4, v6);

}

- (void)didNotFindLowQualityEntryInCachedForThumbnailRequest:(id)a3 error:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  queue = self->_queue;
  v8 = a4;
  dispatch_assert_queue_V2(queue);
  _log_3();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "didNotFindLowQualityEntryInCachedForThumbnailRequest -> sendResultForThumbnailRequest %@", buf, 0xCu);
  }

  LOBYTE(v10) = 0;
  -[QLServerThread sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:](self, "sendResultForThumbnailRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:reenqueueRequest:error:", v6, 0, 0, 0, 1, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v10, v8);

}

- (void)sendResultForThumbnailRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 reenqueueRequest:(BOOL)a10 error:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *queue;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  QLServerThread *v34;
  id v35;
  int64_t v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  int v41;
  BOOL v42;
  BOOL v43;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a11;
  queue = self->_queue;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke;
  v30[3] = &unk_1E99D3428;
  v31 = v21;
  v32 = v22;
  v33 = v24;
  v34 = self;
  v35 = v23;
  v36 = a8;
  v37 = x;
  v38 = y;
  v39 = width;
  v40 = height;
  v41 = a7;
  v42 = a9;
  v43 = a10;
  v26 = v23;
  v27 = v24;
  v28 = v22;
  v29 = v21;
  dispatch_async(queue, v30);

}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  os_activity_scope_state_s state;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "topActivity");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = _os_activity_create(&dword_1D54AE000, "Completion", v3, OS_ACTIVITY_FLAG_DEFAULT);

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  objc_msgSend(*(id *)v2, "addTypeToHandledTypes:", *(_QWORD *)(v2 + 40));
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(*(id *)(a1 + 32), "addTypeToSuccessfullyHandledTypes:", *(_QWORD *)(a1 + 72));
  v5 = *(id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "resultShouldBeSavedToDisk");
  if (v6)
    v9 = v8;
  else
    v9 = 0;
  if (v9 != 1)
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(*(id *)v2, "hasHandledAllRequestedTypesOrMostRepresentativeType");

  if (!v10)
  {
LABEL_11:
    _log_3();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 56), "_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 112), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 116), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), v5);
    goto LABEL_14;
  }
  v11 = *(void **)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 32);
  v21 = 0;
  v13 = objc_msgSend(v11, "_saveResultForThumbnailRequest:withImage:error:", v12, v6, &v21);
  v14 = v21;

  if (v13)
  {
    v5 = v14;
    goto LABEL_11;
  }
  _log_3();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_2();

  v17 = *(void **)(a1 + 56);
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v18, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "requestedMostRepresentativeType");
  objc_msgSend(v17, "_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:", v18, 0, 0, 0, v20, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), v14);

  v5 = v14;
LABEL_14:
  if (*(_BYTE *)(a1 + 117))
    objc_msgSend(*(id *)(a1 + 56), "queueThumbnailRequest:tryCache:tryAdditionsFirst:", *(_QWORD *)(a1 + 32), 0, 0);

  os_activity_scope_leave(&state);
}

- (void)_notifyGenerationHandlerOfThumbnailGenerationForRequest:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailRepresentation:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10
{
  _BOOL8 v10;
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;

  v10 = a9;
  v12 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a10;
  objc_msgSend(v19, "request");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();

  objc_msgSend(v19, "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v19, "generationHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didGenerateThumbnailForRequestWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:", v26, v20, v21, v12, a8, v10, x, y, width, height);

  }
  else
  {
    if (!v22)
    {
      objc_msgSend(v19, "generationError");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v19, "successfullyHandldedRequestedTypes");
      if (!v22)
      {
        if (v27 == *MEMORY[0x1E0CD3370])
        {
          _log_3();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[QLServerThread _notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:].cold.1();

          generationFailedError(v19);
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
      }
    }
    objc_msgSend(v19, "generationHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "failedToGenerateThumbnailOfType:forRequestWithUUID:error:", a8, v30, v22);

  }
}

- (BOOL)_saveResultForThumbnailRequest:(id)a3 withImage:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *queue;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  const __CFURL *v16;
  CGImageDestination *v17;
  __CFData *v18;
  NSObject *v19;
  void *v20;
  char v21;
  BOOL v22;
  void *v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  __CFString *v50;
  id v51;
  int v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  queue = self->_queue;
  v10 = a4;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v8, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveURLContentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)QLImageCreateForDefaultThumbnailGenerationFromData();
  if (v15)
  {
    if (v12)
    {
      v52 = objc_msgSend(v12, "startAccessingSecurityScopedResource");
      v55 = 0;
      objc_msgSend(MEMORY[0x1E0C99E98], "_QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:", v12, 0, &v55);
      v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
      v51 = v55;
      if (!v16)
      {
        _log_3();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.5();

        v18 = 0;
        v16 = 0;
LABEL_23:
        _log_3();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.2();

        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CD32D0], "errorWithCode:request:additionalUserInfo:", 1, v11, 0);
          v21 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
LABEL_28:
            if (v51)
              objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", v51);
            if (v52)
              objc_msgSend(v12, "stopAccessingSecurityScopedResource");

            goto LABEL_33;
          }
        }
        else
        {
          v21 = 0;
          if (!v10)
            goto LABEL_28;
        }
LABEL_27:
        CFRelease(v15);
        goto LABEL_28;
      }
      v17 = CGImageDestinationCreateWithURL(v16, v14, 1uLL, 0);
      v18 = 0;
      if (!v17)
        goto LABEL_23;
    }
    else
    {
      v18 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
      v17 = CGImageDestinationCreateWithData(v18, v14, 1uLL, 0);
      v52 = 0;
      v51 = 0;
      v16 = 0;
      if (!v17)
        goto LABEL_23;
    }
    v50 = v14;
    v68 = *MEMORY[0x1E0CBC7A0];
    v69 = MEMORY[0x1E0C9AAB0];
    CGImageDestinationAddImage(v17, (CGImageRef)v15, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
    v22 = CGImageDestinationFinalize(v17);
    CFRelease(v17);
    if (!v22)
    {
      _log_3();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.4();

      if (a5)
      {
        v48 = (id)MEMORY[0x1E0CD32D0];
        v66 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save thumbnail for %@ to %@"), v11, v12);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorWithCode:request:additionalUserInfo:", 1, v11, v31);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v21 = 0;
      }
      else
      {
        v21 = 1;
      }
      v14 = v50;
      if (!v10)
        goto LABEL_28;
      goto LABEL_27;
    }
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0;
      v21 = objc_msgSend(v35, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v12, v16, 0, 0, 0, &v53);
      v36 = v53;

      v14 = v50;
      if ((v21 & 1) == 0)
      {
        v49 = v36;
        _log_3();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.3();

        v36 = v49;
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save thumbnail for %@ to %@"), v8, v12);
          v38 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v38;
          if (v49)
          {
            v39 = *MEMORY[0x1E0CB3388];
            v58[0] = *MEMORY[0x1E0CB2938];
            v58[1] = v39;
            v59[0] = v38;
            v59[1] = v49;
            v40 = (void *)MEMORY[0x1E0C99D80];
            v41 = v59;
            v42 = v58;
            v43 = 2;
          }
          else
          {
            v56 = *MEMORY[0x1E0CB2938];
            v57 = v38;
            v40 = (void *)MEMORY[0x1E0C99D80];
            v41 = &v57;
            v42 = &v56;
            v43 = 1;
          }
          objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD32D0], "errorWithCode:request:additionalUserInfo:", 1, v11, v45);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v36 = v49;
          *a5 = objc_retainAutorelease(v49);

        }
      }

      v18 = 0;
      if (!v10)
        goto LABEL_28;
      goto LABEL_27;
    }
    objc_msgSend(v11, "saveFileHandle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0;
    v24 = objc_msgSend(v23, "writeData:error:", v18, &v54);
    v47 = v54;

    _log_3();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if ((v24 & 1) != 0)
    {
      v14 = v50;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        goto LABEL_48;
      v27 = -[__CFData length](v18, "length");
      objc_msgSend(v11, "saveFileHandle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v61 = v27;
      v62 = 2112;
      v63 = v28;
      v64 = 2112;
      v65 = v8;
      _os_log_debug_impl(&dword_1D54AE000, v26, OS_LOG_TYPE_DEBUG, "Successfully wrote data of length %llu to file handle %@ for request %@", buf, 0x20u);
    }
    else
    {
      v14 = v50;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v44 = -[__CFData length](v18, "length");
      objc_msgSend(v11, "saveFileHandle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v61 = v44;
      v62 = 2112;
      v63 = v28;
      v64 = 2112;
      v65 = v47;
      _os_log_error_impl(&dword_1D54AE000, v26, OS_LOG_TYPE_ERROR, "Could not write saved thumbnail (length: %llu) to file handle %@: %@", buf, 0x20u);
    }

    v14 = v50;
LABEL_48:

    v21 = 1;
    if (!v10)
      goto LABEL_28;
    goto LABEL_27;
  }
  _log_3();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[QLServerThread _saveResultForThumbnailRequest:withImage:error:].cold.1();

  if (!a5)
  {
    v21 = 0;
    goto LABEL_34;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode thumbnail data to save for %@"), v11);
  v18 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CD32D0];
  v70 = *MEMORY[0x1E0CB2938];
  v71[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
  v16 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithCode:request:additionalUserInfo:", 1, v11, v16);
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

LABEL_34:
  return v21;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *domainsToCaches;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *completionBlocksQueue;
  id v19;
  id v20;
  QLServerThread *v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[5];
  id v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  v7 = (void *)objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke;
  v31[3] = &unk_1E99D3490;
  v10 = v7;
  v32 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](domainsToCaches, "enumerateKeysAndObjectsUsingBlock:", v31);
  v21 = self;
  objc_msgSend(v10, "addObject:", self->_cacheThread);
  v11 = dispatch_group_create();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
        dispatch_group_enter(v11);
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_2;
        v24[3] = &unk_1E99D34B8;
        v24[4] = v17;
        v25 = v6;
        v26 = v11;
        objc_msgSend(v17, "enqueueWriting:", v24);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v14);
  }

  completionBlocksQueue = v21->_completionBlocksQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_3;
  block[3] = &unk_1E99D2A68;
  v23 = v20;
  v19 = v20;
  dispatch_group_notify(v11, completionBlocksQueue, block);

}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "locked_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  return v2;
}

uint64_t __123__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithRemainingFileProviderIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *domainsToCaches;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *completionBlocksQueue;
  id v19;
  id v20;
  QLServerThread *v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[5];
  id v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  v7 = (void *)objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v9 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke;
  v31[3] = &unk_1E99D3490;
  v10 = v7;
  v32 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](domainsToCaches, "enumerateKeysAndObjectsUsingBlock:", v31);
  v21 = self;
  objc_msgSend(v10, "addObject:", self->_cacheThread);
  v11 = dispatch_group_create();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v16);
        dispatch_group_enter(v11);
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_2;
        v24[3] = &unk_1E99D34B8;
        v24[4] = v17;
        v25 = v6;
        v26 = v11;
        objc_msgSend(v17, "enqueueWriting:", v24);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v14);
  }

  completionBlocksQueue = v21->_completionBlocksQueue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_3;
  block[3] = &unk_1E99D2A68;
  v23 = v20;
  v19 = v20;
  dispatch_group_notify(v11, completionBlocksQueue, block);

}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "locked_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  return v2;
}

uint64_t __102__QLServerThread_removeCachedThumbnailsFromUninstalledFileProvidersWithIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)_canUseAdditionToProvideThumbnail:(id)a3 forThumbnailRequest:(id)a4 taggedLogicalURL:(id)a5
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E0CD32F8];
    v8 = a3;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithFileURL:automaticallyGenerated:", v6, 1);
    v10 = objc_msgSend(v8, "shouldBeInvalidatedByThumbnailVersion:", v9);

    _log_3();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_INFO, "not trusting thumbnail in GenStore for %@ because it is not for the right version", (uint8_t *)&v17, 0xCu);
      }

      if (!v6
        || (objc_msgSend(MEMORY[0x1E0CD3308], "contentTypeForURL:", v6),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = +[QLPreviewThumbnailGenerator canGenerateThumbnailForContentType:atSize:](QLPreviewThumbnailGenerator, "canGenerateThumbnailForContentType:atSize:", v13, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8)), v13, v14))
      {
        v15 = 0;
LABEL_14:

        goto LABEL_15;
      }
      _log_3();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[QLServerThread _canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:].cold.1(v12);
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[QLServerThread _canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:].cold.2();
    }

    v15 = 1;
    goto LABEL_14;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __23__QLServerThread_reset__block_invoke;
  v2[3] = &unk_1E99D2B88;
  v2[4] = self;
  -[QLServerThread perform:](self, "perform:", v2);
}

uint64_t __23__QLServerThread_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forEachCacheThread:", &__block_literal_global_81);
}

uint64_t __23__QLServerThread_reset__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

- (void)setLastHitDateOfAllCachedThumbnailsToDate:(id)a3
{
  -[_QLCacheThread setLastHitDateOfAllCachedThumbnailsToDate:](self->_cacheThread, "setLastHitDateOfAllCachedThumbnailsToDate:", a3);
}

- (void)forEachCacheThread:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *domainsToCaches;
  uint64_t v7;
  id v8;
  id v9;
  NSMutableDictionary *volumesToCaches;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  QLServerThread *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  QLServerThread *v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  domainsToCaches = self->_domainsToCaches;
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __37__QLServerThread_forEachCacheThread___block_invoke;
  v17[3] = &unk_1E99D3500;
  v8 = v4;
  v20 = v8;
  v9 = v5;
  v18 = v9;
  v19 = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](domainsToCaches, "enumerateKeysAndObjectsUsingBlock:", v17);
  volumesToCaches = self->_volumesToCaches;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __37__QLServerThread_forEachCacheThread___block_invoke_2;
  v13[3] = &unk_1E99D3528;
  v11 = v9;
  v14 = v11;
  v12 = v8;
  v15 = self;
  v16 = v12;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](volumesToCaches, "enumerateKeysAndObjectsUsingBlock:", v13);
  if (objc_msgSend(v11, "containsObject:", self->_cacheThread))
    (*((void (**)(id, _QLCacheThread *))v12 + 2))(v12, self->_cacheThread);

}

uint64_t __37__QLServerThread_forEachCacheThread___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
}

void __37__QLServerThread_forEachCacheThread___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  }

}

- (id)allKnownDataSeparatedVolumes
{
  return (id)-[NSMutableDictionary allKeys](self->_volumesToCaches, "allKeys");
}

- (NSMutableDictionary)externalThumbnailCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExternalThumbnailCaches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)queuedDownloadRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setQueuedDownloadRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)overrideBasePersonaVolumesURLForTesting
{
  return (NSURL *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOverrideBasePersonaVolumesURLForTesting:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (void)setPendingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_dispatch_queue)completionBlocksQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionBlocksQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCacheThread:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)domainsToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDomainsToCaches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)volumesToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setVolumesToCaches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableDictionary)fsidsToCaches
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFsidsToCaches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (os_unfair_lock_s)cacheInitLock
{
  return self->_cacheInitLock;
}

- (NSMutableDictionary)externalThumbnailCacheInboxURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExternalThumbnailCacheInboxURLs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)externalThumbnailCacheThumbnailURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExternalThumbnailCacheThumbnailURLs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)externalThumbnailCacheAvailablePendingBlocks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExternalThumbnailCacheAvailablePendingBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableSet)knownDomainsWithoutExternalThumbnailCaches
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setKnownDomainsWithoutExternalThumbnailCaches:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_dispatch_queue)externalThumbnailCacheQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExternalThumbnailCacheQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsidsToCaches, 0);
  objc_storeStrong((id *)&self->_volumesToCaches, 0);
  objc_storeStrong((id *)&self->_domainsToCaches, 0);
  objc_storeStrong((id *)&self->_cacheThread, 0);
  objc_storeStrong((id *)&self->_overrideBasePersonaVolumesURLForTesting, 0);
  objc_storeStrong((id *)&self->_previewThumbnailGeneratorQueue, 0);
  objc_storeStrong((id *)&self->_downscaledThumbnailGenerationQueue, 0);
  objc_storeStrong((id *)&self->_uncachedThumbnailRetrievalQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_genstoreCachingQueue, 0);
  objc_storeStrong((id *)&self->_completionBlocksQueue, 0);
  objc_storeStrong((id *)&self->_knownDomainsWithoutExternalThumbnailCaches, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheAvailablePendingBlocks, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheThumbnailURLs, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheInboxURLs, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCaches, 0);
  objc_storeStrong((id *)&self->_queuedDownloadRequests, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_externalThumbnailCacheQueue, 0);
  objc_storeStrong((id *)&self->_downloadResponseProcessingQueue, 0);
  objc_storeStrong((id *)&self->_pendingDownloadsQueue, 0);
  objc_storeStrong((id *)&self->_downloadsOperationQueue, 0);
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke(id *a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _log_9();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v2;
    _os_log_impl(&dword_1D54AE000, v3, OS_LOG_TYPE_INFO, "Adding thumbnail-download to queue for request: %@", buf, 0xCu);
  }

  objc_msgSend(a1[5], "queuedDownloadRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "providerDomainID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(a1[6], "providerDomainID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
  objc_msgSend(a1[6], "itemIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(a1[6], "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, v11);

  }
  objc_msgSend(a1[6], "itemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", a1[4]);

  if ((unint64_t)objc_msgSend(v6, "count") > 9)
  {
    _log_9();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_cold_1();

    objc_msgSend(a1[5], "drainDownloadsQueueIfNeeded");
  }
  else if (!*((_BYTE *)a1[5] + 24))
  {
    v14 = dispatch_time(0, 100000000);
    v15 = a1[5];
    v16 = *((_QWORD *)v15 + 2);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_14;
    v18[3] = &unk_1E99D2CD0;
    v18[4] = v15;
    v19 = v2;
    dispatch_after(v14, v16, v18);
    *((_BYTE *)a1[5] + 24) = 1;

  }
}

uint64_t __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_14(uint64_t a1)
{
  NSObject *v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  _log_9();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_14_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 32), "drainDownloadsQueueIfNeeded");
}

- (BOOL)downloadThumbnails:(id)a3 forProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  int *p_thumbnailDownloadsInFlight;
  unsigned int v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  QLServerThread *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  QLServerThread *v44;
  id v45;
  id v46;
  id v47;
  id location;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingDownloadsQueue);
  if (objc_msgSend(v6, "count"))
  {
    v33 = v7;
    -[QLServerThread cacheThreadForProviderDomainID:](self, "cacheThreadForProviderDomainID:", v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v6, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v50;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v12), "anyObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "item");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v10);
    }

    _log_9();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[QLServerThread(UbiquitousRequests) downloadThumbnails:forProvider:].cold.1(v6, (uint64_t)self, v15);

    _log_9();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
    v18 = objc_msgSend(v8, "count");
    p_thumbnailDownloadsInFlight = &self->_thumbnailDownloadsInFlight;
    do
      v20 = __ldaxr((unsigned int *)p_thumbnailDownloadsInFlight);
    while (__stlxr(v20 + v18, (unsigned int *)p_thumbnailDownloadsInFlight));
    objc_msgSend(MEMORY[0x1E0CAAC80], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "thumbnailsFetchOperationForItems:withSize:scale:", v8, 1024.0, 1024.0, 2.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_24;
    v42[3] = &unk_1E99D3BD8;
    objc_copyWeak(&v47, &location);
    v26 = v6;
    v43 = v26;
    v44 = self;
    v27 = v23;
    v45 = v27;
    v28 = v24;
    v46 = v28;
    objc_msgSend(v22, "setPerThumbnailCompletionBlock:", v42);
    v35[0] = v25;
    v35[1] = 3221225472;
    v35[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_27;
    v35[3] = &unk_1E99D3C50;
    objc_copyWeak(&v41, &location);
    v36 = v26;
    v37 = self;
    v29 = v34;
    v38 = v29;
    v30 = v27;
    v39 = v30;
    v31 = v28;
    v40 = v31;
    objc_msgSend(v22, "setThumbnailsFetchCompletionBlock:", v35);
    -[NSOperationQueue addOperation:](self->_downloadsOperationQueue, "addOperation:", v22);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&location);
    v7 = v33;
  }

  return 1;
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  _log_9();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_cold_1((uint64_t)v4);

}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  char *WeakRetained;
  void *v14;
  unsigned int *v15;
  unsigned int v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 64));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    v15 = (unsigned int *)(WeakRetained + 28);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    v17 = *((_QWORD *)WeakRetained + 4);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2;
    block[3] = &unk_1E99D3BB0;
    v22 = v10;
    v23 = v11;
    objc_copyWeak(&v30, (id *)(a1 + 64));
    v24 = *(id *)(a1 + 32);
    v25 = v9;
    v18 = v12;
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(void **)(a1 + 48);
    v26 = v18;
    v27 = v19;
    v28 = v20;
    v29 = *(id *)(a1 + 56);
    dispatch_async(v17, block);

    objc_destroyWeak(&v30);
  }

}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *m;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD);
  void *v36;
  uint64_t v37;
  void *k;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void (**v42)(_QWORD, _QWORD);
  uint64_t v43;
  void *n;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void (**v49)(_QWORD, _QWORD);
  NSObject *v50;
  uint64_t *v51;
  void *v52;
  void *v53;
  id WeakRetained;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, void *);
  void *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE state[22];
  os_activity_scope_state_s buf;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v55 = *(id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  if (WeakRetained)
  {
    v51 = (uint64_t *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "anyObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "item");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    _log_9();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_3(v51);

    if (v53)
    {
      if (v2)
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v53, "allObjects");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v70 != v7)
                objc_enumerationMutation(v5);
              v9 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
              *(_QWORD *)&state[8] = 0;
              *(_QWORD *)state = 0;
              objc_msgSend(v9, "activity");
              v10 = objc_claimAutoreleasedReturnValue();
              os_activity_scope_enter(v10, (os_activity_scope_state_t)state);

              _log_9();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf.opaque[0]) = 138412290;
                *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v9;
                _os_log_impl(&dword_1D54AE000, v11, OS_LOG_TYPE_INFO, "Downloaded thumbnail for %@; adding to cache",
                  (uint8_t *)&buf,
                  0xCu);
              }

              os_activity_scope_leave((os_activity_scope_state_t)state);
            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
          }
          while (v6);
        }

        v12 = objc_msgSend(v52, "isContainer");
        objc_msgSend(*(id *)(a1 + 88), "addObject:", v52);
        if ((objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CAAAD8]) & 1) != 0
          || objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CAAAE0]))
        {
          objc_msgSend(v53, "anyObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "request");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "size");
          v16 = v15;
          v18 = v17;
          objc_msgSend(v14, "scale");
          objc_msgSend(WeakRetained, "processedPNGAppIconDataForData:ofType:size:scale:", v2, v55, v16, v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
          v21 = objc_claimAutoreleasedReturnValue();

          v55 = (id)v21;
          v2 = (id)v20;
        }
        if (v2)
        {
          v67 = 0uLL;
          v68 = 0uLL;
          v65 = 0uLL;
          v66 = 0uLL;
          objc_msgSend(v53, "allObjects");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v66;
            v25 = MEMORY[0x1E0C809B0];
            do
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v66 != v24)
                  objc_enumerationMutation(v22);
                v27 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
                v60 = v25;
                v61 = 3221225472;
                v62 = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_25;
                v63 = &unk_1E99D2DE8;
                v64 = v27;
                objc_msgSend(WeakRetained, "processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:", v2, v55, v12);
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
            }
            while (v23);
          }
        }
        else
        {
          v58 = 0uLL;
          v59 = 0uLL;
          v56 = 0uLL;
          v57 = 0uLL;
          objc_msgSend(v53, "allObjects");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
          if (v2)
          {
            v37 = *(_QWORD *)v57;
            do
            {
              for (k = 0; k != v2; k = (char *)k + 1)
              {
                if (*(_QWORD *)v57 != v37)
                  objc_enumerationMutation(v22);
                v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)k);
                *(_QWORD *)&state[8] = 0;
                *(_QWORD *)state = 0;
                objc_msgSend(v39, "activity");
                v40 = objc_claimAutoreleasedReturnValue();
                os_activity_scope_enter(v40, (os_activity_scope_state_t)state);

                _log_9();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf.opaque[0]) = 138412290;
                  *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v39;
                  _os_log_error_impl(&dword_1D54AE000, v41, OS_LOG_TYPE_ERROR, "Unable to process icon data for %@", (uint8_t *)&buf, 0xCu);
                }

                objc_msgSend(v39, "downloadCompletionHandler");
                v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                v42[2](v42, *(_QWORD *)(a1 + 64));

                os_activity_scope_leave((os_activity_scope_state_t)state);
              }
              v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
            }
            while (v2);
          }
        }
      }
      else if (*(_QWORD *)(a1 + 64))
      {
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        objc_msgSend(v53, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
        if (v2)
        {
          v29 = *(_QWORD *)v78;
          do
          {
            for (m = 0; m != v2; m = (char *)m + 1)
            {
              if (*(_QWORD *)v78 != v29)
                objc_enumerationMutation(v22);
              v31 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)m);
              buf.opaque[1] = 0;
              buf.opaque[0] = 0;
              objc_msgSend(v31, "activity");
              v32 = objc_claimAutoreleasedReturnValue();
              os_activity_scope_enter(v32, &buf);

              _log_9();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                v34 = *(_QWORD *)(a1 + 64);
                *(_DWORD *)state = 138412546;
                *(_QWORD *)&state[4] = v31;
                *(_WORD *)&state[12] = 2112;
                *(_QWORD *)&state[14] = v34;
                _os_log_impl(&dword_1D54AE000, v33, OS_LOG_TYPE_INFO, "No thumbnail for %@: thumbnail download failed [%@]", state, 0x16u);
              }

              objc_msgSend(v31, "downloadCompletionHandler");
              v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 72), "failedDownloadErrorForRequest:underlyingError:", v31, *(_QWORD *)(a1 + 64));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v35)[2](v35, v36);

              os_activity_scope_leave(&buf);
            }
            v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
          }
          while (v2);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 80), "addObject:", v52);
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        objc_msgSend(v53, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
        if (v2)
        {
          v43 = *(_QWORD *)v74;
          do
          {
            for (n = 0; n != v2; n = (char *)n + 1)
            {
              if (*(_QWORD *)v74 != v43)
                objc_enumerationMutation(v22);
              v45 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)n);
              *(_QWORD *)&state[8] = 0;
              *(_QWORD *)state = 0;
              objc_msgSend(v45, "activity");
              v46 = objc_claimAutoreleasedReturnValue();
              os_activity_scope_enter(v46, (os_activity_scope_state_t)state);

              _log_9();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf.opaque[0]) = 138412290;
                *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v45;
                _os_log_impl(&dword_1D54AE000, v47, OS_LOG_TYPE_INFO, "No thumbnail in the cloud for %@", (uint8_t *)&buf, 0xCu);
              }

              objc_msgSend(*(id *)(a1 + 72), "failedDownloadErrorForRequest:underlyingError:", v45, 0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "downloadCompletionHandler");
              v49 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v49)[2](v49, v48);

              os_activity_scope_leave((os_activity_scope_state_t)state);
            }
            v2 = (id)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
          }
          while (v2);
        }
      }

      _log_9();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_2();

      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 56));
    }
    else
    {
      _log_9();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_1(v51, v28);

    }
  }

}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD);

  v3 = a2;
  if (v3)
  {
    _log_9();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_25_cold_1(a1, v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "downloadCompletionHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v3);

}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_27(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_28;
    v8[3] = &unk_1E99D3C28;
    v8[4] = WeakRetained;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    dispatch_async(v4, v8);

  }
}

uint64_t __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_28(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  unsigned int *v5;
  int v6;
  unsigned int v7;
  void *v8;
  _QWORD v10[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3;
  block[3] = &unk_1E99D2B88;
  block[4] = v2;
  dispatch_async(v3, block);
  v5 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 28);
  v6 = objc_msgSend(*(id *)(a1 + 40), "count");
  do
    v7 = __ldaxr(v5);
  while (__stlxr(v7 - v6, v5));
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_29;
  v10[3] = &unk_1E99D3C00;
  v8 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);
  objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 56), "noteRemoteThumbnailMissingForItems:", *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 56), "noteRemoteThumbnailPresentForItems:", *(_QWORD *)(a1 + 72));
}

uint64_t __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  _log_9();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "drainDownloadsQueueIfNeeded");
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  os_activity_scope_state_s state;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        objc_msgSend(v10, "activity");
        v11 = objc_claimAutoreleasedReturnValue();
        os_activity_scope_enter(v11, &state);

        _log_9();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v10;
          _os_log_error_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_ERROR, "Failing %@, which did not get a per-thumbnail download completion block", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "failedDownloadErrorForRequest:underlyingError:", v10, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "downloadCompletionHandler");
        v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v14)[2](v14, v13);

        os_activity_scope_leave(&state);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

}

- (void)drainDownloadsQueueIfNeeded
{
  NSMutableDictionary *queuedDownloadRequests;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingDownloadsQueue);
  queuedDownloadRequests = self->_queuedDownloadRequests;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__QLServerThread_UbiquitousRequests__drainDownloadsQueueIfNeeded__block_invoke;
  v4[3] = &unk_1E99D3C78;
  v4[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queuedDownloadRequests, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __65__QLServerThread_UbiquitousRequests__drainDownloadsQueueIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = (void *)objc_msgSend(v7, "mutableCopy");
  LODWORD(a1) = objc_msgSend(*(id *)(a1 + 32), "downloadThumbnails:forProvider:", v6, v5);

  if ((_DWORD)a1)
    objc_msgSend(v7, "removeAllObjects");

}

- (id)processedPNGAppIconDataForData:(id)a3 ofType:(id)a4 size:(CGSize)a5 scale:(double)a6
{
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  CGImage *v15;
  CGImage *v16;
  void *v17;
  NSObject *v18;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  _log_9();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[QLServerThread(UbiquitousRequests) processedPNGAppIconDataForData:ofType:size:scale:].cold.2();

  v14 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CAAAD8]);
  if (v14)
    v15 = -[QLServerThread _createUndecoratedAppIconForData:ofSize:scale:](self, "_createUndecoratedAppIconForData:ofSize:scale:", v11, width, height, a6);
  else
    v15 = (CGImage *)LICreateIconFromCachedBitmap();
  v16 = v15;
  if (v15)
  {
    QLCGImageRefPNGRepresentation();
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v16);
  }
  else
  {
    _log_9();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[QLServerThread(UbiquitousRequests) processedPNGAppIconDataForData:ofType:size:scale:].cold.1();

    v17 = 0;
  }
  return v17;
}

- (CGImage)_createUndecoratedAppIconForData:(id)a3 ofSize:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  void *v8;
  const __CFData *v9;
  const __CFDictionary *v10;
  CGImageSourceRef v11;
  CGImageRef ImageAtIndex;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  CGImage *v19;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  height = a4.height;
  width = a4.width;
  v23[1] = *MEMORY[0x1E0C80C00];
  v22 = *MEMORY[0x1E0CBD288];
  v23[0] = MEMORY[0x1E0C9AAB0];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (const __CFData *)a3;
  v10 = (const __CFDictionary *)objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v11 = CGImageSourceCreateWithData(v9, v10);

  if (!v11)
    return 0;
  if (!CGImageSourceGetCount(v11))
  {
    CFRelease(v11);
    return 0;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, v10);
  CFRelease(v11);
  if (!ImageAtIndex)
    return 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7C0]), "initWithCGImage:scale:", ImageAtIndex, 1.0);
  v14 = objc_alloc_init(MEMORY[0x1E0D3A830]);
  objc_msgSend(v14, "setSize:", width, height);
  objc_msgSend(v14, "setScale:", a5);
  v15 = objc_alloc(MEMORY[0x1E0D3A820]);
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithImages:", v16);

  objc_msgSend(v17, "prepareImageForDescriptor:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (CGImage *)objc_msgSend(v18, "CGImage");
  CGImageRetain(v19);
  CFRelease(ImageAtIndex);

  return v19;
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1D54AE000, a2, a3, "Got external cache for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Error while fetching thumbnail from external cache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Received thumbnail data which ImageIO is unable to read (%@).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Received thumbnail data which ImageIO is unable to read (%@): image size is zero.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not create image from thumbnail data at %@ for %@");
  OUTLINED_FUNCTION_5();
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "Found thumbnail for %@ in external cache: %@");
  OUTLINED_FUNCTION_5();
}

void __116__QLServerThread_ExternalCache__findUncachedThumbnailInExternalThumbnailCacheForRequest_item_URL_completionHandler___block_invoke_2_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "Got thumbnail URL %@ in external cache for %@");
  OUTLINED_FUNCTION_5();
}

void __91__QLServerThread_ExternalCache__receivedExternalCacheConnection_error_forProviderDomainID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D54AE000, a2, a3, "Connection to external thumbnail cache was invalidated for: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

void __82__QLServerThread_ExternalCache__storeImage_inExternalThumbnailCacheForItem_atURL___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Failed storing thumbnail for %@ in external thumbnail cache: %@");
  OUTLINED_FUNCTION_5();
}

- (void)initWithCacheSize:(os_log_t)log location:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D54AE000, log, OS_LOG_TYPE_ERROR, "Could not enable the thumbnails cache", v1, 2u);
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "failed creating container with error %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "[ERROR] Can't adopt persona %@: %@");
  OUTLINED_FUNCTION_5();
}

- (void)makeCacheThreadForPersonaString:containerURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "[ERROR] won't restore persona: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)uncachedCacheThreadForProviderDomainID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Failed to fetch domain for domain ID %@ (%@)");
  OUTLINED_FUNCTION_5();
}

- (void)uncachedCacheThreadForFileAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Could not retrieve container for %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)uncachedCacheThreadForFileAtURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Could not list persona, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)generateSuccessiveThumbnailRepresentationsForGeneratorRequests:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "generateSuccessiveThumbnailRepresentationsForRequests: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __50__QLServerThread__installRequestsFinishedWatchdog__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Request %@ has been pending for more than 10 minutes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_addThumbnailRequestBatchToQueue:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "thumbnail requests queued (%@), relinquishing server thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)queueThumbnailRequest:tryCache:tryAdditionsFirst:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "failed to queue %@ for cache; falling back", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Queuing thumbnail request %@: request is cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "%@ is not ubiquitous, but does not reference a valid file either", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Beginning uncached retrieval: thumbnail request %@ cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "File for %@ is not downloaded, trying genstore / download of the thumbnail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_29_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Could not determine if %@ is for an ubiquitous file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "generateThumbnailForThumbnailRequest completion: thumbnail request %@ cancelled. Additionally, hit error %@ while generating thumbnail");
  OUTLINED_FUNCTION_5();
}

void __67__QLServerThread_queueThumbnailRequest_tryCache_tryAdditionsFirst___block_invoke_30_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "Hit error %@ during generation of thumbnail for %@, so trying genstore / download");
  OUTLINED_FUNCTION_5();
}

- (void)findUncachedThumbnailInGenStoreOrDownload:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Skipping GenStore because %@ may not be materialized yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __78__QLServerThread_findUncachedThumbnailInGenStoreOrDownload_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "findUncachedThumbnailInGenStoreForRequest: thumbnail request %@ cancelled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.1()
{
  __assert_rtn("-[QLServerThread processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:]", "QLServerThread.m", 767, "completionHandler != nil");
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not generate thumbnail for %@ because received nil data (content type: %@)");
  OUTLINED_FUNCTION_5();
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Thumbnail size could not be determined from thumbnail data for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Failed to create thumbnail from image source for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)processLargeThumbnailData:withContentType:isAppContainer:forRequest:fromGenStore:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "processLargeThumbnailData: adding image data to cache and completing request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveLargeThumbnailToGenstoreWithData:url:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not associate large thumbnail to GS file at URL: %@ (%@)");
  OUTLINED_FUNCTION_5();
}

- (void)_saveLargeThumbnailToGenstoreWithData:url:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not save thumbnail data for %@ to genstore: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_saveLargeThumbnailForDocumentAtURL:toGenstoreWithImage:automaticallyGenerated:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not associate existing thumbnail image with the document at URL %@: %@");
  OUTLINED_FUNCTION_5();
}

- (void)generateThumbnailForThumbnailRequest:shouldUpdateGenstore:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  _os_log_fault_impl(&dword_1D54AE000, v0, OS_LOG_TYPE_FAULT, "No URL to generate thumbnail for %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __94__QLServerThread_generateThumbnailForThumbnailRequest_shouldUpdateGenstore_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "after generation: adding image data to cache and completing request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)findThumbnailInAddition:request:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Got error %@ trying to find content type for %@");
  OUTLINED_FUNCTION_5();
}

- (void)failedToCompleteThumbnailRequest:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "failedToCompleteThumbnailRequest -> sendResultForThumbnailRequest %@ [%@]");
  OUTLINED_FUNCTION_5();
}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Sending thumbnail data to the host for request %@ from pending requests and removing it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __160__QLServerThread_sendResultForThumbnailRequest_images_metadata_contentRect_iconFlavor_thumbnailRepresentation_clientShouldTakeOwnership_reenqueueRequest_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "Sending nil thumbnail data to the host for request %@ from pending requests and removing it because saving best representation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_notifyGenerationHandlerOfThumbnailGenerationForRequest:images:metadata:contentRect:iconFlavor:thumbnailRepresentation:clientShouldTakeOwnership:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Missing error during thumbnail request %@, using a generic error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "Failed to create thumbnail image to save at URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not save thumbnail at URL %@ for request %@: could not create CGImageDestinationRef");
  OUTLINED_FUNCTION_5();
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not save thumbnail at URL: %@. Error: %@");
  OUTLINED_FUNCTION_5();
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_6(&dword_1D54AE000, v0, v1, "CGImageDestinationFinalize failed to add image to URL: %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveResultForThumbnailRequest:withImage:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1D54AE000, v0, v1, "Could not save thumbnail at URL %@ for request %@: could not create CGImageDestinationRef because could not obtain temporary URL");
  OUTLINED_FUNCTION_5();
}

void __51__QLServerThread__completeHandledThumbnailRequest___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_8(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9_0();
  v3 = v0;
  _os_log_fault_impl(&dword_1D54AE000, v1, OS_LOG_TYPE_FAULT, "Request %@ is already completed at %@", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)_canUseAdditionToProvideThumbnail:(os_log_t)log forThumbnailRequest:taggedLogicalURL:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D54AE000, log, OS_LOG_TYPE_DEBUG, "using the thumbnail from GenStore anyway because we do not have a choice", v1, 2u);
}

- (void)_canUseAdditionToProvideThumbnail:forThumbnailRequest:taggedLogicalURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4(&dword_1D54AE000, v0, v1, "addition from GenStore is valid for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining the downloads queue because we have more than 10 thumbnails in queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __85__QLServerThread_UbiquitousRequests___downloadThumbnailForRequest_completionHandler___block_invoke_14_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_DEBUG, "Draining the downloads queue because 100ms have elapsed since %@ was enqueued", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __84__QLServerThread_UbiquitousRequests__downloadThumbnailForRequest_completionHandler___block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 138412546;
  v4 = v1;
  OUTLINED_FUNCTION_4_4();
  _os_log_error_impl(&dword_1D54AE000, v2, OS_LOG_TYPE_ERROR, "Could not fetch FPItem for request: %@ (error: %@)", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v1, v2, "download: %@ (%@)", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_FAULT, "perThumbnailCompletionBlock was called for %@, but this identifier wasn't in the requests or already received its perThumbnailCompletionBlock", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v0, v1, "clearing generatorRequests %@ for %@");
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_2_cold_3(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_3_1(&dword_1D54AE000, v1, v2, "perThumbnailCompletionBlock for %@, associated with requests %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_25_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D54AE000, a2, OS_LOG_TYPE_ERROR, "Unable to process thumbnail data for %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

void __69__QLServerThread_UbiquitousRequests__downloadThumbnails_forProvider___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "Draining downloads queue because a batch is finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
