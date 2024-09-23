@implementation WBSSiteMetadataManager

- (id)registerRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5
{
  return -[WBSSiteMetadataManager registerRequest:priority:queue:responseHandler:](self, "registerRequest:priority:queue:responseHandler:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

uint64_t __55__WBSSiteMetadataManager_registerSiteMetadataProvider___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProviderDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", *(_QWORD *)(a1 + 32));
}

- (id)registerRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WBSSiteMetadataManager_registerRequest_priority_queue_responseHandler___block_invoke;
  v7[3] = &__block_descriptor_40_e31_v16__0___WBSSiteMetadataToken_8l;
  v7[4] = a4;
  -[WBSSiteMetadataManager _registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:](self, "_registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:", a3, 0, a5, a6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __46__WBSSiteMetadataManager__providerForRequest___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "canHandleRequest:", a1[5], (_QWORD)v8))
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

void __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchResponse:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(NSObject **)(v4 + 64);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke_2;
    v6[3] = &unk_1E5441848;
    v6[4] = v4;
    v7 = v3;
    dispatch_barrier_async(v5, v6);

  }
}

void __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dispatchResponse:", *(_QWORD *)(a1 + 32));
}

void __77__WBSSiteMetadataManager_preloadRequests_withPriority_queue_responseHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  _WBSSiteMetadataToken *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_providerForRequest:", v7, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[_WBSSiteMetadataToken initWithRequest:isOneTimeRequest:queue:responseHandler:]([_WBSSiteMetadataToken alloc], "initWithRequest:isOneTimeRequest:queue:responseHandler:", v7, 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        -[_WBSSiteMetadataToken setPriority:](v9, "setPriority:", *(_QWORD *)(a1 + 64));
        objc_msgSend(*(id *)(a1 + 40), "_registerToken:isCacheRequest:withProvider:", v9, 0, v8);
        objc_msgSend(v8, "prepareResponseForRequest:allowDelayedResponse:", v7, 0);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __98__WBSSiteMetadataManager__registerRequest_isOneTimeRequest_queue_responseHandler_tokenSetUpBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "_registerToken:isCacheRequest:withProvider:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 48), "prepareResponseForRequest:allowDelayedResponse:", *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 72) == 0);
}

uint64_t __73__WBSSiteMetadataManager_registerRequest_priority_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPriority:", *(_QWORD *)(a1 + 32));
}

- (id)_registerRequest:(id)a3 isOneTimeRequest:(BOOL)a4 queue:(id)a5 responseHandler:(id)a6 tokenSetUpBlock:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void (**v14)(id, void *);
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  _WBSSiteMetadataToken *v19;
  BOOL v20;
  _WBSSiteMetadataToken *v21;
  NSObject *internalQueue;
  _WBSSiteMetadataToken *v23;
  void *v24;
  _QWORD v26[4];
  _WBSSiteMetadataToken *v27;
  WBSSiteMetadataManager *v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  char v33;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  v15 = a7;
  -[WBSSiteMetadataManager _providerForRequest:](self, "_providerForRequest:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v16, "responseForRequest:willProvideUpdates:", v12, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 || (v18 = 0, !v33))
  {
    v14[2](v14, v17);
    v18 = v33 == 0;
  }
  v19 = 0;
  if (v17)
    v20 = v10;
  else
    v20 = 0;
  if (!v20 && !v18)
  {
    v21 = -[_WBSSiteMetadataToken initWithRequest:isOneTimeRequest:queue:responseHandler:]([_WBSSiteMetadataToken alloc], "initWithRequest:isOneTimeRequest:queue:responseHandler:", v12, v10, v13, v14);
    internalQueue = self->_internalQueue;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __98__WBSSiteMetadataManager__registerRequest_isOneTimeRequest_queue_responseHandler_tokenSetUpBlock___block_invoke;
    v26[3] = &unk_1E5445FA8;
    v31 = v15;
    v23 = v21;
    v27 = v23;
    v28 = self;
    v29 = v16;
    v30 = v12;
    v32 = v10;
    dispatch_barrier_async(internalQueue, v26);
    v24 = v30;
    v19 = v23;

  }
  return v19;
}

- (id)_providerForRequest:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *siteMetadataProvidersAccessQueue;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__22;
  v22 = __Block_byref_object_dispose__22;
  v23 = 0;
  v5 = MEMORY[0x1E0C809B0];
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__WBSSiteMetadataManager__providerForRequest___block_invoke;
  block[3] = &unk_1E54460E8;
  block[4] = self;
  v7 = v4;
  v16 = v7;
  v17 = &v18;
  dispatch_sync(siteMetadataProvidersAccessQueue, block);
  objc_msgSend(v7, "activity");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __46__WBSSiteMetadataManager__providerForRequest___block_invoke_2;
  v12[3] = &unk_1E5444748;
  v13 = v7;
  v14 = &v18;
  v9 = v7;
  os_activity_apply(v8, v12);

  v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __103__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_ofType_didReceiveNewData_forRequests___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 1)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = *(id *)(a1 + 48);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v16 = 0u;
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", v8, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "requestTokens");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v17 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
                if ((objc_msgSend(v15, "isOneTimeRequest") & 1) == 0)
                  objc_msgSend(*(id *)(a1 + 32), "_scheduleDelayedResponse:forRequestToken:", *(_QWORD *)(a1 + 40), v15);
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v12);
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v5);
    }

  }
  else if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sendResponse:toResponseHandlersForRequests:didReceiveNewData:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  }
}

- (void)_sendResponse:(id)a3 toResponseHandlersForRequests:(id)a4 didReceiveNewData:(BOOL)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v37;
  _QWORD block[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v7;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v50;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(obj);
        v34 = v9;
        v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v9);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v10, v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "requestTokens");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v46 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
              if (a5 || objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "isOneTimeRequest"))
              {
                objc_msgSend(v8, "addObject:", v17);
                objc_msgSend(v17, "setDelayTimer:", 0);
                objc_msgSend(v17, "setDidReceiveResponse:", 1);
                if (objc_msgSend(v17, "isOneTimeRequest"))
                {
                  v18 = objc_alloc(MEMORY[0x1E0D8A160]);
                  objc_msgSend(v10, "activity");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = (void *)objc_msgSend(v18, "initWithFirst:second:", v17, v19);
                  objc_msgSend(v37, "addObject:", v20);

                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v14);
        }

        v9 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v33);
  }

  v21 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_2;
  v43[3] = &unk_1E5446060;
  v35 = v30;
  v44 = v35;
  -[WBSSiteMetadataManager _enumerateTokens:usingSetUpBlock:dispatchBlock:](self, "_enumerateTokens:usingSetUpBlock:dispatchBlock:", v8, &__block_literal_global_22_0, v43);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v37;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v27, "second", v30);
        v28 = objc_claimAutoreleasedReturnValue();
        block[0] = v21;
        block[1] = 3221225472;
        block[2] = __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_3;
        block[3] = &unk_1E5441CB8;
        block[4] = v27;
        os_activity_apply(v28, block);

        objc_msgSend(v27, "first");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSiteMetadataManager _internalCancelRequestWithToken:](self, "_internalCancelRequestWithToken:", v29);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v24);
  }

}

void __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "first");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 141558275;
    v7 = 1752392040;
    v8 = 2117;
    v9 = v5;
    _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Canceling request with token %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);

  }
}

- (void)_scheduleDelayedResponse:(id)a3 forRequestToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  WBSSiteMetadataManager *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "didReceiveResponse") & 1) == 0)
  {
    objc_msgSend(v7, "setDidReceiveResponse:", 1);
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E0D8A110];
    objc_msgSend(v7, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke;
    v14 = &unk_1E5441970;
    objc_copyWeak(&v17, &location);
    v15 = v6;
    v16 = self;
    objc_msgSend(v8, "timerWithInterval:repeats:queue:handler:", 0, v9, &v11, 0.03);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setDelayTimer:", v10, v11, v12, v13, v14);
    objc_msgSend(v10, "schedule");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)_enumerateTokens:(id)a3 usingSetUpBlock:(id)a4 dispatchBlock:(id)a5
{
  id v7;
  unsigned int (**v8)(id, void *);
  CFMutableDictionaryRef Mutable;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (unsigned int (**)(id, void *))a4;
  v20 = a5;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v8[2](v8, v15))
        {
          objc_msgSend(v15, "queue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFDictionary objectForKeyedSubscript:](Mutable, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "queue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v17, v18);

          }
          objc_msgSend(v17, "addObject:", v15, v20);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke;
  v21[3] = &unk_1E5446138;
  v22 = v20;
  v19 = v20;
  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](Mutable, "enumerateKeysAndObjectsUsingBlock:", v21);

}

uint64_t __88__WBSSiteMetadataManager__sendResponse_toResponseHandlersForRequests_didReceiveNewData___block_invoke()
{
  return 1;
}

- (void)_internalCancelRequestWithToken:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_tokens, "containsObject:", v4))
  {
    v5 = v4;
    -[NSMutableSet removeObject:](self->_tokens, "removeObject:", v5);
    objc_msgSend(v5, "setDelayTimer:", 0);
    objc_msgSend(v5, "request");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "canStopWatchingRequestAfterRemovingToken:", v5))
    {
      objc_msgSend(v28, "provider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "stopWatchingUpdatesForRequest:", v29);

    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v5, "parentRequests", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v46 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToSubrequestTokens, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObject:", v5);
          if (!objc_msgSend(v12, "count"))
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToSubrequestTokens, "setObject:forKeyedSubscript:", 0, v11);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v8);
    }

    objc_msgSend(v28, "tokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
    {
      -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", v29);
    }
    else
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToSubrequestTokens, "objectForKeyedSubscript:", v29);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_msgSend(v19, "removeParentRequest:", v29);
            objc_msgSend(v19, "parentRequests");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");

            if (v21)
            {
              v40 = 0u;
              v38 = 0u;
              v39 = 0u;
              v37 = 0u;
              objc_msgSend(v19, "parentRequests");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              if (v23)
              {
                v24 = *(_QWORD *)v38;
                do
                {
                  for (k = 0; k != v23; ++k)
                  {
                    if (*(_QWORD *)v38 != v24)
                      objc_enumerationMutation(v22);
                    -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k));
                  }
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                }
                while (v23);
              }

            }
            else
            {
              -[WBSSiteMetadataManager _internalCancelRequestWithToken:](self, "_internalCancelRequestWithToken:", v19);
            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v16);
      }

      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__22;
      v35 = __Block_byref_object_dispose__22;
      objc_msgSend(v28, "operation");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (v32[5])
      {
        objc_msgSend(v29, "activity");
        v26 = objc_claimAutoreleasedReturnValue();
        os_activity_apply(v26, &__block_literal_global_25_0);

        -[NSCountedSet removeObject:](self->_activeOperations, "removeObject:", v32[5]);
        if (!-[NSCountedSet countForObject:](self->_activeOperations, "countForObject:", v32[5]))
          objc_msgSend((id)v32[5], "cancel");
      }
      objc_msgSend(v28, "setOperation:", 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToSubrequestTokens, "setObject:forKeyedSubscript:", 0, v29);
      -[NSMutableDictionary removeObjectForKey:](self->_requestsToRequestInfos, "removeObjectForKey:", v29);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke_26;
      block[3] = &unk_1E54424C0;
      block[4] = &v31;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      _Block_object_dispose(&v31, 8);

    }
    v4 = v27;
  }

}

- (void)_registerToken:(id)a3 isCacheRequest:(BOOL)a4 withProvider:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  _WBSSiteMetadataRequestInfo *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  -[NSMutableSet addObject:](self->_tokens, "addObject:", v11);
  objc_msgSend(v11, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v9);
  v10 = (_WBSSiteMetadataRequestInfo *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = -[_WBSSiteMetadataRequestInfo initWithProvider:]([_WBSSiteMetadataRequestInfo alloc], "initWithProvider:", v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestsToRequestInfos, "setObject:forKeyedSubscript:", v10, v9);
  }
  if (v6)
    -[_WBSSiteMetadataRequestInfo addCacheRequestToken:](v10, "addCacheRequestToken:", v11);
  else
    -[_WBSSiteMetadataRequestInfo addRequestToken:](v10, "addRequestToken:", v11);
  -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", v9);

}

- (void)_updatePriorityOfRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSiteMetadataManager _reprioritizeOperationForRequest:](self, "_reprioritizeOperationForRequest:", v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToSubrequestTokens, "objectForKeyedSubscript:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "parentRequests");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WBSSiteMetadataManager _highestRequestPriorityForRequests:](self, "_highestRequestPriorityForRequests:", v11);

        if (objc_msgSend(v10, "priority") != v12)
        {
          objc_msgSend(v10, "setPriority:", v12);
          objc_msgSend(v10, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_reprioritizeOperationForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  int64_t v16;

  v12 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WBSSiteMetadataManager _highestRequestPriorityForRequests:](self, "_highestRequestPriorityForRequests:", v6);

    objc_msgSend(v12, "activity");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WBSSiteMetadataManager__reprioritizeOperationForRequest___block_invoke;
    block[3] = &unk_1E5444D10;
    v9 = v5;
    v14 = v9;
    v15 = v12;
    v16 = v7;
    os_activity_apply(v8, block);

    v10 = -4;
    if (v7 != 1)
      v10 = 0;
    if (v7)
      v11 = v10;
    else
      v11 = -8;
    objc_msgSend(v9, "setQueuePriority:", v11);

  }
}

- (void)registerSiteMetadataProvider:(id)a3
{
  id v4;
  void *v5;
  NSObject *siteMetadataProvidersAccessQueue;
  _QWORD v7[4];
  id v8;
  WBSSiteMetadataManager *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__WBSSiteMetadataManager_registerSiteMetadataProvider___block_invoke;
    v7[3] = &unk_1E5441848;
    v8 = v4;
    v9 = self;
    dispatch_barrier_async(siteMetadataProvidersAccessQueue, v7);

  }
}

uint64_t __67__WBSSiteMetadataManager__scheduleDelayedResponse_forRequestToken___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_requestIsCancelledForToken:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "setDelayTimer:", 0);
  return result;
}

- (BOOL)_requestIsCancelledForToken:(id)a3
{
  if (a3)
    return -[NSMutableSet containsObject:](self->_tokens, "containsObject:") ^ 1;
  else
    return 1;
}

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequest:(id)a7
{
  _BOOL8 v8;
  void *v12;
  id v13;
  id v14;
  id v15;

  v8 = a6;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "setWithObject:", a7);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataManager siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequests:](self, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequests:", v14, v13, a5, v8, v15);

}

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 ofType:(int64_t)a5 didReceiveNewData:(BOOL)a6 forRequests:(id)a7
{
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  int64_t v19;
  BOOL v20;

  v11 = a4;
  v12 = a7;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_ofType_didReceiveNewData_forRequests___block_invoke;
  block[3] = &unk_1E5446160;
  block[4] = self;
  v17 = v11;
  v18 = v12;
  v19 = a5;
  v20 = a6;
  v14 = v12;
  v15 = v11;
  dispatch_barrier_async(internalQueue, block);

}

void __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke(uint64_t a1, NSObject *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WBSSiteMetadataManager__enumerateTokens_usingSetUpBlock_dispatchBlock___block_invoke_2;
  v7[3] = &unk_1E5443108;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  dispatch_async(a2, v7);

}

- (WBSSiteMetadataManager)initWithInjectedBundleURL:(id)a3
{
  id v5;
  WBSSiteMetadataManager *v6;
  WBSSiteMetadataManager *v7;
  uint64_t v8;
  NSMutableArray *siteMetadataProviders;
  NSOperationQueue *v10;
  NSOperationQueue *operationQueue;
  void *v12;
  uint64_t v13;
  NSCountedSet *activeOperations;
  uint64_t v15;
  NSMutableSet *usedWebViews;
  uint64_t v17;
  NSMutableSet *reusableWebViews;
  id v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *internalQueue;
  id v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *siteMetadataProvidersAccessQueue;
  uint64_t v27;
  NSMutableSet *tokens;
  uint64_t v29;
  NSMutableDictionary *requestsToRequestInfos;
  uint64_t v31;
  NSMutableDictionary *requestsToSubrequestTokens;
  uint64_t v33;
  NSMutableDictionary *requestsToCacheRequestTokens;
  WBSSiteMetadataManager *v35;
  objc_super v37;

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)WBSSiteMetadataManager;
  v6 = -[WBSSiteMetadataManager init](&v37, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_injectedBundleURL, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    siteMetadataProviders = v7->_siteMetadataProviders;
    v7->_siteMetadataProviders = (NSMutableArray *)v8;

    v10 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v10;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", -[WBSSiteMetadataManager _numberOfConcurrentRequests](v7, "_numberOfConcurrentRequests"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.operationQueue"), objc_opt_class(), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v7->_operationQueue, "setName:", v12);

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    activeOperations = v7->_activeOperations;
    v7->_activeOperations = (NSCountedSet *)v13;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    usedWebViews = v7->_usedWebViews;
    v7->_usedWebViews = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    reusableWebViews = v7->_reusableWebViews;
    v7->_reusableWebViews = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.InternalQueue"), objc_opt_class(), v7);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    v21 = MEMORY[0x1E0C80D50];
    v22 = dispatch_queue_create(v20, MEMORY[0x1E0C80D50]);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.siteMetadataProvidersAccessQueue"), objc_opt_class(), v7);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = dispatch_queue_create((const char *)objc_msgSend(v24, "UTF8String"), v21);
    siteMetadataProvidersAccessQueue = v7->_siteMetadataProvidersAccessQueue;
    v7->_siteMetadataProvidersAccessQueue = (OS_dispatch_queue *)v25;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    tokens = v7->_tokens;
    v7->_tokens = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    requestsToRequestInfos = v7->_requestsToRequestInfos;
    v7->_requestsToRequestInfos = (NSMutableDictionary *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    requestsToSubrequestTokens = v7->_requestsToSubrequestTokens;
    v7->_requestsToSubrequestTokens = (NSMutableDictionary *)v31;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    requestsToCacheRequestTokens = v7->_requestsToCacheRequestTokens;
    v7->_requestsToCacheRequestTokens = (NSMutableDictionary *)v33;

    v35 = v7;
  }

  return v7;
}

void __46__WBSSiteMetadataManager__providerForRequest___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v5 = 138412803;
    v6 = v4;
    v7 = 2160;
    v8 = 1752392040;
    v9 = 2117;
    v10 = v3;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_INFO, "Found provider %@ to handle request %{sensitive, mask.hash}@", (uint8_t *)&v5, 0x20u);
  }
}

- (unint64_t)_numberOfConcurrentRequests
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "processorCount") == 1)
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5
{
  -[WBSSiteMetadataManager preloadRequests:withPriority:queue:responseHandler:](self, "preloadRequests:withPriority:queue:responseHandler:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (void)cancelRequestWithToken:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSSiteMetadataManager cancelRequestsWithTokens:completionHandler:](self, "cancelRequestsWithTokens:completionHandler:", v6, 0, v7, v8);
  }
}

- (void)preloadRequests:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  WBSSiteMetadataManager *v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__WBSSiteMetadataManager_preloadRequests_withPriority_queue_responseHandler___block_invoke;
  block[3] = &unk_1E54452C8;
  v18 = v10;
  v19 = self;
  v20 = v11;
  v21 = v12;
  v22 = a4;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_barrier_async(internalQueue, block);

}

- (WBSSiteMetadataManager)init
{
  return -[WBSSiteMetadataManager initWithInjectedBundleURL:](self, "initWithInjectedBundleURL:", 0);
}

- (void)setSuspended:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__WBSSiteMetadataManager_setSuspended___block_invoke;
  v4[3] = &unk_1E5445F60;
  v4[4] = self;
  v5 = a3;
  dispatch_barrier_async(internalQueue, v4);
}

uint64_t __39__WBSSiteMetadataManager_setSuspended___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setSuspended:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isSuspended
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__WBSSiteMetadataManager_isSuspended__block_invoke;
  v5[3] = &unk_1E5444748;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__WBSSiteMetadataManager_isSuspended__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isSuspended");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_processPool
{
  WKProcessPool *v3;
  WKProcessPool *v4;
  WKProcessPool *v5;
  id v6;
  WKProcessPool *v7;
  WKProcessPool *processPool;

  v3 = self->_processPool;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CEF6C0]);
    objc_msgSend(v6, "setInjectedBundleURL:", self->_injectedBundleURL);
    v7 = (WKProcessPool *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF5F8]), "_initWithConfiguration:", v6);
    processPool = self->_processPool;
    self->_processPool = v7;

    v5 = self->_processPool;
  }

  return v5;
}

- (id)_popReusableWebView
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = -[NSMutableSet count](self->_usedWebViews, "count");
  v4 = -[NSMutableSet count](self->_reusableWebViews, "count") + v3;
  if (v4 >= -[WBSSiteMetadataManager _numberOfConcurrentRequests](self, "_numberOfConcurrentRequests"))
  {
    -[NSMutableSet anyObject](self->_reusableWebViews, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[NSMutableSet removeObject:](self->_reusableWebViews, "removeObject:", v5);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_discardWebViewSoon:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = dispatch_time(0, 100000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WBSSiteMetadataManager__discardWebViewSoon___block_invoke;
  v7[3] = &unk_1E5441848;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

}

void __46__WBSSiteMetadataManager__discardWebViewSoon___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count")
    && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = 0;

  }
}

- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 responseHandler:(id)a5
{
  return -[WBSSiteMetadataManager registerOneTimeRequest:priority:queue:responseHandler:](self, "registerOneTimeRequest:priority:queue:responseHandler:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (id)registerOneTimeRequest:(id)a3 priority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  _QWORD v7[5];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__WBSSiteMetadataManager_registerOneTimeRequest_priority_queue_responseHandler___block_invoke;
  v7[3] = &__block_descriptor_40_e31_v16__0___WBSSiteMetadataToken_8l;
  v7[4] = a4;
  -[WBSSiteMetadataManager _registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:](self, "_registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:", a3, 1, a5, a6, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __80__WBSSiteMetadataManager_registerOneTimeRequest_priority_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPriority:", *(_QWORD *)(a1 + 32));
}

- (id)_registerSubrequest:(id)a3 isOneTimeRequest:(BOOL)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_msgSend(a5, "copy");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__WBSSiteMetadataManager__registerSubrequest_isOneTimeRequest_forRequests_queue_responseHandler___block_invoke;
  v19[3] = &unk_1E5445FD0;
  v19[4] = self;
  v20 = v15;
  v16 = v15;
  -[WBSSiteMetadataManager _registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:](self, "_registerRequest:isOneTimeRequest:queue:responseHandler:tokenSetUpBlock:", v14, v9, v13, v12, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __97__WBSSiteMetadataManager__registerSubrequest_isOneTimeRequest_forRequests_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setPriority:", objc_msgSend(*(id *)(a1 + 32), "_highestRequestPriorityForRequests:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v3, "setParentRequests:", *(_QWORD *)(a1 + 40));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", v10, v9);
        }
        objc_msgSend(v10, "addObject:", v3);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 responseHandler:(id)a5
{
  -[WBSSiteMetadataManager preloadRequest:withPriority:queue:responseHandler:](self, "preloadRequest:withPriority:queue:responseHandler:", a3, a4, MEMORY[0x1E0C80D38], a5);
}

- (void)preloadRequest:(id)a3 withPriority:(int64_t)a4 queue:(id)a5 responseHandler:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a6;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSSiteMetadataManager preloadRequests:withPriority:responseHandler:](self, "preloadRequests:withPriority:responseHandler:", v12, a4, v10, v13, v14);
}

- (void)cacheData:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSSiteMetadataManager_cacheData_forRequest___block_invoke;
  block[3] = &unk_1E5441870;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_async(internalQueue, block);

}

void __47__WBSSiteMetadataManager_cacheData_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  _WBSSiteMetadataToken *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_providerForRequest:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
    }
    v3 = -[_WBSSiteMetadataToken initWithRequest:isOneTimeRequest:queue:responseHandler:]([_WBSSiteMetadataToken alloc], "initWithRequest:isOneTimeRequest:queue:responseHandler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), &__block_literal_global_38);
    -[_WBSSiteMetadataToken setPriority:](v3, "setPriority:", 0);
    if ((objc_msgSend(v4, "cacheData:forRequest:usingToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3) & 1) != 0)
    {
      objc_msgSend(v2, "addObject:", v3);
      objc_msgSend(*(id *)(a1 + 32), "_registerToken:isCacheRequest:withProvider:", v3, 1, v4);
    }
    else
    {
      -[_WBSSiteMetadataToken setCancelled:](v3, "setCancelled:", 1);
    }

  }
}

- (void)_sendRequiresDownloadResponse:(id)a3 toResponseHandlersForRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v6 = a3;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestTokens");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke;
    v11[3] = &unk_1E5446038;
    v11[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke_2;
    v9[3] = &unk_1E5446060;
    v10 = v6;
    -[WBSSiteMetadataManager _enumerateTokens:usingSetUpBlock:dispatchBlock:](self, "_enumerateTokens:usingSetUpBlock:dispatchBlock:", v8, v11, v9);

  }
}

uint64_t __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isOneTimeRequest") & 1) != 0 || (objc_msgSend(v3, "didReceiveResponse") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "setDidReceiveResponse:", 1);
    v4 = objc_msgSend(*(id *)(a1 + 32), "_requestIsCancelledForToken:", v3) ^ 1;
  }

  return v4;
}

uint64_t __85__WBSSiteMetadataManager__sendRequiresDownloadResponse_toResponseHandlersForRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dispatchResponse:", *(_QWORD *)(a1 + 32));
}

void __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A840B000, v0, OS_LOG_TYPE_DEFAULT, "Canceling pending fetch operation", v1, 2u);
  }
}

void __58__WBSSiteMetadataManager__internalCancelRequestWithToken___block_invoke_26(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)cancelRequestsWithTokens:(id)a3
{
  -[WBSSiteMetadataManager cancelRequestsWithTokens:completionHandler:](self, "cancelRequestsWithTokens:completionHandler:", a3, 0);
}

- (void)cancelRequestsWithTokens:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *internalQueue;
  _QWORD block[4];
  id v15;
  WBSSiteMetadataManager *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12++), "setCancelled:", 1);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__WBSSiteMetadataManager_cancelRequestsWithTokens_completionHandler___block_invoke;
    block[3] = &unk_1E54432C0;
    v15 = v6;
    v16 = self;
    v17 = v8;
    dispatch_barrier_async(internalQueue, block);

  }
  else if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
  }

}

uint64_t __69__WBSSiteMetadataManager_cancelRequestsWithTokens_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_internalCancelRequestWithToken:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_internalSetPriority:(int64_t)a3 ofRequestWithToken:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "priority") != a3)
  {
    objc_msgSend(v7, "setPriority:", a3);
    objc_msgSend(v7, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", v6);

  }
}

- (void)setPriority:(int64_t)a3 ofRequestWithToken:(id)a4
{
  id v6;
  void *v7;
  NSObject *internalQueue;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__WBSSiteMetadataManager_setPriority_ofRequestWithToken___block_invoke;
    block[3] = &unk_1E5444D10;
    block[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_barrier_async(internalQueue, block);

  }
}

uint64_t __57__WBSSiteMetadataManager_setPriority_ofRequestWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internalSetPriority:ofRequestWithToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)setPriority:(int64_t)a3 ofRequestsWithTokens:(id)a4
{
  id v6;
  void *v7;
  NSObject *internalQueue;
  _QWORD block[4];
  id v10;
  WBSSiteMetadataManager *v11;
  int64_t v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__WBSSiteMetadataManager_setPriority_ofRequestsWithTokens___block_invoke;
    block[3] = &unk_1E5444D10;
    v10 = v6;
    v11 = self;
    v12 = a3;
    dispatch_barrier_async(internalQueue, block);

  }
}

void __59__WBSSiteMetadataManager_setPriority_ofRequestsWithTokens___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "_internalSetPriority:ofRequestWithToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)emptyProviderCaches
{
  -[WBSSiteMetadataManager emptyProviderCachesIncludingFavicons:](self, "emptyProviderCachesIncludingFavicons:", 1);
}

- (void)emptyProviderCachesIncludingFavicons:(BOOL)a3
{
  NSObject *siteMetadataProvidersAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__WBSSiteMetadataManager_emptyProviderCachesIncludingFavicons___block_invoke;
  v4[3] = &unk_1E5445F60;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(siteMetadataProvidersAccessQueue, v4);
}

void __63__WBSSiteMetadataManager_emptyProviderCachesIncludingFavicons___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((*(_BYTE *)(a1 + 40)
           || (objc_opt_respondsToSelector() & 1) == 0
           || (objc_msgSend(v7, "providesFavicons", (_QWORD)v8) & 1) == 0)
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "emptyCaches");
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)savePendingProviderChangesBeforeTermination
{
  NSObject *siteMetadataProvidersAccessQueue;
  _QWORD block[5];

  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSSiteMetadataManager_savePendingProviderChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_sync(siteMetadataProvidersAccessQueue, block);
}

void __69__WBSSiteMetadataManager_savePendingProviderChangesBeforeTermination__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "savePendingChangesBeforeTermination", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)savePendingProviderChangesWithCompletion:(id)a3
{
  id v4;
  NSObject *siteMetadataProvidersAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WBSSiteMetadataManager_savePendingProviderChangesWithCompletion___block_invoke;
  v7[3] = &unk_1E5443108;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(siteMetadataProvidersAccessQueue, v7);

}

uint64_t __67__WBSSiteMetadataManager_savePendingProviderChangesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "savePendingChangesBeforeTermination", (_QWORD)v9);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performMaintenanceWork
{
  NSObject *siteMetadataProvidersAccessQueue;
  _QWORD block[5];

  siteMetadataProvidersAccessQueue = self->_siteMetadataProvidersAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSSiteMetadataManager_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E5441CB8;
  block[4] = self;
  dispatch_async(siteMetadataProvidersAccessQueue, block);
}

void __48__WBSSiteMetadataManager_performMaintenanceWork__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "performMaintenanceWork", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (int64_t)_highestRequestPriorityForRequests:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tokens");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "priority");
              if (v17 == 2)
              {

                v7 = 2;
                goto LABEL_21;
              }
              if (v7 <= v17)
                v7 = v17;
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
LABEL_21:

  return v7;
}

void __59__WBSSiteMetadataManager__reprioritizeOperationForRequest___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    v4 = objc_opt_class();
    v5 = (void *)a1[4];
    v6 = a1[5];
    v7 = objc_msgSend(v5, "queuePriority");
    v8 = a1[6];
    v9 = -4;
    if (v8 != 1)
      v9 = 0;
    v12 = 138544643;
    v10 = v8 == 0;
    v11 = -8;
    v13 = v4;
    if (!v10)
      v11 = v9;
    v14 = 2048;
    v15 = v5;
    v16 = 2160;
    v17 = 1752392040;
    v18 = 2117;
    v19 = v6;
    v20 = 2048;
    v21 = v7;
    v22 = 2048;
    v23 = v11;
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_INFO, "Reprioritizing operation <%{public}@, %p> for request %{sensitive, mask.hash}@ from %ld to %ld", (uint8_t *)&v12, 0x3Eu);

  }
}

- (BOOL)_updateOperationForRequestIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "operation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v7 != 0;
    if (v7 && (objc_msgSend(v7, "isFinished") & 1) == 0)
      -[WBSSiteMetadataManager _updatePriorityOfRequest:](self, "_updatePriorityOfRequest:", v4);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_setUpOperationForRequest:(id)a3 withSiteMetadataProvider:(id)a4 usingOperationBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!-[WBSSiteMetadataManager _updateOperationForRequestIfPossible:](self, "_updateOperationForRequestIfPossible:", v8))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestsToRequestInfos, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet member:](self->_activeOperations, "member:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "cancel");
      -[NSCountedSet addObject:](self->_activeOperations, "addObject:", v13);
      objc_msgSend(v11, "setOperation:", v13);
    }
    else
    {
      -[NSCountedSet addObject:](self->_activeOperations, "addObject:", v12);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[WBSSiteMetadataManager _highestRequestPriorityForRequests:](self, "_highestRequestPriorityForRequests:", v14);
      v16 = -4;
      if (v15 != 1)
        v16 = 0;
      if (v15)
        v17 = v16;
      else
        v17 = -8;
      objc_msgSend(v12, "setQueuePriority:", v17);

      objc_initWeak(&location, v12);
      v18 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke;
      v24[3] = &unk_1E5446110;
      v24[4] = self;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v12, "setCompletionBlock:", v24);
      objc_msgSend(v8, "activity");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_3;
      block[3] = &unk_1E5441848;
      v20 = v12;
      v22 = v20;
      v23 = v8;
      os_activity_apply(v19, block);

      objc_msgSend(v11, "setOperation:", v20);
      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v20);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }

  }
}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_2;
  v3[3] = &unk_1E5442448;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_barrier_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v4 = WeakRetained;
  while (objc_msgSend(v3, "countForObject:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v4);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }

}

void __97__WBSSiteMetadataManager__setUpOperationForRequest_withSiteMetadataProvider_usingOperationBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = v2;
    v4 = objc_opt_class();
    v6 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138544387;
    v8 = v4;
    v9 = 2048;
    v10 = v6;
    v11 = 2160;
    v12 = 1752392040;
    v13 = 2117;
    v14 = v5;
    v15 = 2048;
    v16 = objc_msgSend(v6, "queuePriority");
    _os_log_impl(&dword_1A840B000, v3, OS_LOG_TYPE_INFO, "Enqueuing operation <%{public}@, %p> for request %{sensitive, mask.hash}@ with priority %ld", (uint8_t *)&v7, 0x34u);

  }
}

- (id)_makeWebViewOfSize:(CGSize)a3 withConfiguration:(id)a4
{
  double height;
  double width;
  objc_class *v7;
  id v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  v7 = (objc_class *)MEMORY[0x1E0CEF630];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithFrame:configuration:", v8, 0.0, 0.0, width, height);

  objc_msgSend(v9, "setInspectable:", 0);
  -[NSMutableSet addObject:](self->_usedWebViews, "addObject:", v9);
  return v9;
}

- (void)siteMetadataProvider:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5 beginOperationUsingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *internalQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_forRequest_beginOperationUsingBlock___block_invoke;
  block[3] = &unk_1E5446188;
  block[4] = self;
  v20 = v12;
  v22 = v11;
  v23 = v13;
  v21 = v10;
  v15 = v11;
  v16 = v13;
  v17 = v10;
  v18 = v12;
  dispatch_barrier_async(internalQueue, block);

}

uint64_t __102__WBSSiteMetadataManager_siteMetadataProvider_didReceiveResponse_forRequest_beginOperationUsingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUpOperationForRequest:withSiteMetadataProvider:usingOperationBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequiresDownloadResponse:toResponseHandlersForRequest:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (id)siteMetadataProvider:(id)a3 registerSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  return -[WBSSiteMetadataManager _registerSubrequest:isOneTimeRequest:forRequests:queue:responseHandler:](self, "_registerSubrequest:isOneTimeRequest:forRequests:queue:responseHandler:", a4, 0, a5, a6, a7);
}

- (id)siteMetadataProvider:(id)a3 registerOneTimeSubrequest:(id)a4 forRequests:(id)a5 queue:(id)a6 responseHandler:(id)a7
{
  return -[WBSSiteMetadataManager _registerSubrequest:isOneTimeRequest:forRequests:queue:responseHandler:](self, "_registerSubrequest:isOneTimeRequest:forRequests:queue:responseHandler:", a4, 1, a5, a6, a7);
}

- (void)siteMetadataProvider:(id)a3 cancelRequestsWithTokens:(id)a4
{
  -[WBSSiteMetadataManager cancelRequestsWithTokens:](self, "cancelRequestsWithTokens:", a4);
}

- (void)siteMetadataProvider:(id)a3 didFinishCachingDataWithToken:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSSiteMetadataManager *v10;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__WBSSiteMetadataManager_siteMetadataProvider_didFinishCachingDataWithToken___block_invoke;
  v8[3] = &unk_1E5441848;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_barrier_async(internalQueue, v8);

}

void __77__WBSSiteMetadataManager_siteMetadataProvider_didFinishCachingDataWithToken___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "request");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 32));
  if (!objc_msgSend(v2, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKeyedSubscript:", 0, v3);
  objc_msgSend(*(id *)(a1 + 32), "setCancelled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_internalCancelRequestWithToken:", *(_QWORD *)(a1 + 32));

}

- (void)siteMetadataProvider:(id)a3 cacheData:(id)a4 forRequest:(id)a5
{
  -[WBSSiteMetadataManager cacheData:forRequest:](self, "cacheData:forRequest:", a4, a5);
}

- (void)siteMetadataProvider:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  void *v6;
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  WBSSiteMetadataManager *v35;
  id v36;
  CGFloat v37;
  CGFloat v38;

  height = a4.height;
  width = a4.width;
  v11 = a5;
  v12 = a6;
  -[WBSSiteMetadataManager _processPool](self, "_processPool");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProcessPool:", v13);

  -[WBSSiteMetadataManager _popReusableWebView](self, "_popReusableWebView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v11, "_setRelatedWebView:", v14);
    objc_msgSend(v15, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "websiteDataStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setWebsiteDataStore:", v17);
    objc_msgSend(v15, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processPool");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProcessPool:", v18);

LABEL_3:
    goto LABEL_4;
  }
  v26 = objc_opt_respondsToSelector();
  if ((v26 & 1) != 0)
  {
    objc_msgSend(v11, "_websiteDataStoreIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_17;
  }
  objc_msgSend(v11, "websiteDataStore");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "websiteDataStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isPersistent");

    if ((v26 & 1) != 0)
    {

      if ((v30 & 1) == 0)
      {
LABEL_11:
        v17 = 0;
        goto LABEL_4;
      }
    }
    else if (!v30)
    {
      goto LABEL_11;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CEF650], "safari_nonPersistentDataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWebsiteDataStore:", v6);
    v17 = 0;
    goto LABEL_3;
  }

  v17 = 0;
  if ((v26 & 1) != 0)
    goto LABEL_3;
LABEL_4:
  v19 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke;
  v33[3] = &unk_1E54461B0;
  v37 = width;
  v38 = height;
  v20 = v11;
  v34 = v20;
  v35 = self;
  v21 = v12;
  v36 = v21;
  v22 = MEMORY[0x1A85D45E4](v33);
  v23 = (void *)v22;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CEF650], "allWebsiteDataTypes");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v19;
    v31[1] = 3221225472;
    v31[2] = __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke_2;
    v31[3] = &unk_1E54423D0;
    v32 = v23;
    objc_msgSend(v17, "removeDataOfTypes:modifiedSince:completionHandler:", v24, v25, v31);

  }
  else
  {
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  }

}

void __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF630]), "initWithFrame:configuration:", *(_QWORD *)(a1 + 32), 0.0, 0.0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v2, "setInspectable:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __100__WBSSiteMetadataManager_siteMetadataProvider_getWebViewOfSize_withConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)siteMetadataProvider:(id)a3 didFinishUsingWebView:(id)a4
{
  NSMutableSet *reusableWebViews;
  id v6;

  reusableWebViews = self->_reusableWebViews;
  v6 = a4;
  -[NSMutableSet addObject:](reusableWebViews, "addObject:", v6);
  -[NSMutableSet removeObject:](self->_usedWebViews, "removeObject:", v6);
  -[WBSSiteMetadataManager _discardWebViewSoon:](self, "_discardWebViewSoon:", v6);

}

- (NSURL)injectedBundleURL
{
  return self->_injectedBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_injectedBundleURL, 0);
  objc_storeStrong((id *)&self->_requestsToCacheRequestTokens, 0);
  objc_storeStrong((id *)&self->_requestsToSubrequestTokens, 0);
  objc_storeStrong((id *)&self->_requestsToRequestInfos, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_siteMetadataProvidersAccessQueue, 0);
  objc_storeStrong((id *)&self->_siteMetadataProviders, 0);
  objc_storeStrong((id *)&self->_reusableWebViews, 0);
  objc_storeStrong((id *)&self->_usedWebViews, 0);
  objc_storeStrong((id *)&self->_processPool, 0);
}

@end
