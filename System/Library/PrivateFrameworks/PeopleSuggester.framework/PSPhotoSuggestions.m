@implementation PSPhotoSuggestions

void __39___PSPhotoSuggestions_sharedMADService__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v1 = (void *)getMADServiceClass_softClass;
  v9 = getMADServiceClass_softClass;
  if (!getMADServiceClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMADServiceClass_block_invoke;
    v5[3] = &unk_1E43FEA00;
    v5[4] = &v6;
    __getMADServiceClass_block_invoke((uint64_t)v5);
    v1 = (void *)v7[3];
  }
  v2 = objc_retainAutorelease(v1);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v2, "service");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sharedMADService__pasExprOnceResult;
  sharedMADService__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __49___PSPhotoSuggestions_allOutstandingRequestsLock__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_alloc(MEMORY[0x1E0D815F0]);
  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v1, "initWithGuardedData:", v2);
  v4 = (void *)allOutstandingRequestsLock__pasExprOnceResult;
  allOutstandingRequestsLock__pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v0);
}

void __79___PSPhotoSuggestions_mdPersonIDsOfPeopleInSharedPhotoAttachments_forBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

BOOL __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "photoAnalysisRequestType") != 0;
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_254(uint64_t a1, int a2, void *a3)
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *obj;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint8_t v49[4];
  uint64_t v50;
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE v56[24];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  +[_PSPhotoSuggestions allOutstandingRequestsLock](_PSPhotoSuggestions, "allOutstandingRequestsLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_2_255;
  v43[3] = &unk_1E4401D28;
  v43[4] = &v45;
  v44 = a2;
  objc_msgSend(v5, "runWithLockAcquired:", v43);

  if (*((_BYTE *)v46 + 24))
  {
    if (v29)
    {
      if (objc_msgSend(v29, "isEqual:", *(_QWORD *)(a1 + 48)))
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A07F4000, v6, OS_LOG_TYPE_DEFAULT, "Media Analysis request was cancelled (due to timeout or other reasons)", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v29, "localizedDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_254_cold_1(v22, (uint64_t)v56, v6);
        }
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "results");
      v7 = objc_claimAutoreleasedReturnValue();
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = -[NSObject count](v7, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "Got results back from MAD, fetched %tu people in photo", (uint8_t *)&buf, 0xCu);
      }

      v6 = v7;
      if (-[NSObject count](v7, "count"))
      {
        v10 = (void *)objc_opt_new();
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        obj = v7;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
        if (v11)
        {
          v31 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v40 != v31)
                objc_enumerationMutation(obj);
              v13 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              objc_msgSend(v13, "resultItems");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v57, 16);
              if (v15)
              {
                v16 = *(_QWORD *)v36;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v36 != v16)
                      objc_enumerationMutation(v14);
                    v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                    if (*(_BYTE *)(a1 + 72))
                      objc_msgSend(v18, "mdID");
                    else
                      objc_msgSend(v18, "personIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v19)
                      objc_msgSend(v10, "addObject:", v19);

                  }
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v57, 16);
                }
                while (v15);
              }

            }
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v58, 16);
          }
          while (v11);
        }

        if (objc_msgSend(v10, "count"))
        {
          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138477827;
            *(_QWORD *)((char *)&buf + 4) = v10;
            _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "Adding personIdentifiers: %{private}@", (uint8_t *)&buf, 0xCu);
          }

          v21 = *(void **)(a1 + 40);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_257;
          v33[3] = &unk_1E4401D50;
          v34 = v10;
          objc_msgSend(v21, "runWithLockAcquired:", v33);

        }
        v6 = obj;
      }
    }

    v23 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    do
    {
      v24 = __ldaxr(v23);
      v25 = v24 - 1;
    }
    while (__stlxr(v25, v23));
    if (!v25)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__19;
      v54 = __Block_byref_object_dispose__19;
      v55 = 0;
      v26 = *(void **)(a1 + 40);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_259;
      v32[3] = &unk_1E4401D78;
      v32[4] = &buf;
      objc_msgSend(v26, "runWithLockAcquired:", v32);
      +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v49 = 138477827;
        v50 = v28;
        _os_log_impl(&dword_1A07F4000, v27, OS_LOG_TYPE_DEFAULT, "IDsOfPeopleInSharedPhotoAssets invoking callback with identifiers %{private}@", v49, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      _Block_object_dispose(&buf, 8);

    }
  }
  _Block_object_dispose(&v45, 8);

}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_2_255(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;

  v3 = a2;
  v15 = v3;
  if (v3)
  {
    if (*((_BYTE *)v3 + 8))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      goto LABEL_6;
    }
    v4 = (void *)*((_QWORD *)v3 + 2);
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(unsigned int *)(a1 + 40);
  v7 = v4;
  objc_msgSend(v5, "numberWithInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9 != 0;

  v3 = v15;
  if (!v15)
  {
    v10 = 0;
    goto LABEL_7;
  }
LABEL_6:
  *((_BYTE *)v3 + 8) = 0;
  v10 = (void *)*((_QWORD *)v3 + 2);
LABEL_7:
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = *(unsigned int *)(a1 + 40);
  v13 = v10;
  objc_msgSend(v11, "numberWithInt:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v14);

}

uint64_t __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_257(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionSet:", *(_QWORD *)(a1 + 32));
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_261(uint64_t a1, void *a2)
{
  _BYTE *v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD *);
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE buf[24];
  void *v52;
  uint64_t *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v3[8] = 1;
  v5 = (void *)MEMORY[0x1A1AFCBF8](*(_QWORD *)(a1 + 64));
  v6 = objc_msgSend(*(id *)(a1 + 32), "photoAnalysisRequestType");
  switch(v6)
  {
    case 1:
      goto LABEL_7;
    case 2:
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "photoLocalIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        *(_QWORD *)&buf[4] = v18;
        _os_log_impl(&dword_1A07F4000, v17, OS_LOG_TYPE_DEFAULT, "Fetching attachment info from photoLocalIdentifier: %{private}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 80), "sharedMADService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "photoLocalIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v46 = &v45;
      v47 = 0x2050000000;
      v21 = (void *)getPHPhotoLibraryClass_softClass_1;
      v48 = getPHPhotoLibraryClass_softClass_1;
      if (!getPHPhotoLibraryClass_softClass_1)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPHPhotoLibraryClass_block_invoke_1;
        v52 = &unk_1E43FEA00;
        v53 = &v45;
        __getPHPhotoLibraryClass_block_invoke_1((uint64_t)buf);
        v21 = (void *)v46[3];
      }
      v22 = objc_retainAutorelease(v21);
      _Block_object_dispose(&v45, 8);
      objc_msgSend(v22, "systemPhotoLibraryURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v10, "performRequests:onAssetWithLocalIdentifier:fromPhotoLibraryWithURL:completionHandler:", v19, v20, v23, v5);

      v12 = (uint64_t)v5;
      goto LABEL_15;
    case 0:
      __break(1u);
LABEL_7:
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "contentURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "photoLocalIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1A07F4000, v7, OS_LOG_TYPE_DEFAULT, "Fetching attachment info from fileURL: %{private}@ (photoLocalIdentifier: %{private}@)", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "contentURLSandboxExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bytes");
      v11 = sandbox_extension_consume();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2810000000;
      v52 = &unk_1A09197BE;
      LOBYTE(v53) = 0;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_263;
      v41[3] = &unk_1E4401DC8;
      v43 = buf;
      v44 = v11;
      v42 = *(id *)(a1 + 64);
      v12 = MEMORY[0x1A1AFCBF8](v41);

      objc_msgSend(*(id *)(a1 + 80), "sharedMADService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "contentURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "photoLocalIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v13, "performRequests:onImageURL:withIdentifier:completionHandler:", v14, v15, v16, v12);

      _Block_object_dispose(buf, 8);
LABEL_15:

      v5 = (void *)v12;
      break;
  }
  if (v4 && *((_BYTE *)v4 + 8))
  {
    *((_BYTE *)v4 + 8) = 0;
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_265;
    v37 = &unk_1E4401DF0;
    v24 = *(id *)(a1 + 64);
    v26 = a1 + 72;
    v25 = *(_QWORD *)(a1 + 72);
    v39 = v24;
    v40 = v25;
    v38 = *(id *)(a1 + 48);
    v27 = (void *)MEMORY[0x1A1AFCBF8](&v34);
    v28 = (void *)MEMORY[0x1E0CB37E8];
    v29 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v30 = *((id *)v4 + 2);
    objc_msgSend(v28, "numberWithInt:", v29, v34, v35, v36, v37);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, v31);

    v32 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v26 + 8) + 24));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

  }
}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_263(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(1u, v4));
  if ((v5 & 1) == 0)
    sandbox_extension_release();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_265(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24), a1[4]);
}

void __46___PSPhotoSuggestions_cancelRequestWithToken___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a2)
    v3 = *(void **)(a2 + 16);
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __95___PSPhotoSuggestions_peopleInSharedPhotoAttachments_forBundleID_shouldUseMDID_withCompletion___block_invoke_254_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a3, (uint64_t)a3, "Media Analysis returned an error %@", (uint8_t *)a2);

}

@end
