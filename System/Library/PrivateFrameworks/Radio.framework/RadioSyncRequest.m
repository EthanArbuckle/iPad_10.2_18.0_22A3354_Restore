@implementation RadioSyncRequest

- (RadioSyncRequest)init
{
  void *v3;
  RadioSyncRequest *v4;

  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RadioSyncRequest initWithGlobalVersion:](self, "initWithGlobalVersion:", objc_msgSend(v3, "globalVersion"));

  return v4;
}

- (RadioSyncRequest)initWithGlobalVersion:(unint64_t)a3
{
  RadioSyncRequest *v4;
  RadioSyncRequest *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *artworkQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RadioSyncRequest;
  v4 = -[RadioRequest init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_globalVersion = a3;
    v6 = dispatch_queue_create("com.apple.Radio.RadioSyncRequest.artworkQueue", 0);
    artworkQueue = v5->_artworkQueue;
    v5->_artworkQueue = (OS_dispatch_queue *)v6;

  }
  return v5;
}

- (void)cancel
{
  -[SSURLConnectionRequest cancel](self->_request, "cancel");
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[16];

  v4 = a3;
  -[RadioRequest requestContext](self, "requestContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RadioModel sharedModel](RadioModel, "sharedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "databaseVersion");

  if (v7 != 3)
  {
    v8 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2105F8000, v8, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Doing a full sync for a database version update...", buf, 2u);
    }

    self->_globalVersion = 0;
    self->_isAutomaticUpdate = 0;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke;
  v11[3] = &unk_24CA2E458;
  v12 = v5;
  v13 = v4;
  v11[4] = self;
  v14 = v7 != 3;
  v9 = v5;
  v10 = v4;
  -[RadioRequest _loadRadioStoreBagWithCompletionHandler:](self, "_loadRadioStoreBagWithCompletionHandler:", v11);

}

- (id)responseDictionary
{
  return self->_responseDictionary;
}

- (id)changeList
{
  return 0;
}

- (id)matchDictionary
{
  return 0;
}

- (id)_sortedChangesByType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
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
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("change-type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "integerValue") == 1)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v7);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKey:", CFSTR("change-type"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "integerValue") == 2)
          objc_msgSend(v4, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v14);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
        objc_msgSend(v24, "objectForKey:", CFSTR("change-type"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v25, "integerValue") == 3)
          objc_msgSend(v4, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v21);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v36 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * m);
        objc_msgSend(v31, "objectForKey:", CFSTR("change-type"), (_QWORD)v35);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v32, "integerValue") == 4)
          objc_msgSend(v4, "addObject:", v31);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v28);
  }

  v33 = (void *)objc_msgSend(v4, "copy");
  return v33;
}

- (id)_stationSortOrderForChanges:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("change-type"), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "integerValue") == 4)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("sort-order"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)_updateModel:(id)a3 withChangeDictionary:(id)a4 changeType:(int64_t *)a5 loadArtworkSynchronously:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  NSObject *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "objectForKey:", CFSTR("change-type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = objc_msgSend(v10, "integerValue");
    v12 = v11;
    if (a5)
      *a5 = v11;
    if (v11 == 4)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("sort-order"));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = v13;
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              if ((objc_opt_respondsToSelector() & 1) == 0)
              {
                v18 = v13;
                goto LABEL_27;
              }
            }
            v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v15)
              continue;
            break;
          }
        }

        -[NSObject valueForKey:](v13, "valueForKey:", CFSTR("longLongValue"), v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setStationSortOrdering:", v18);
LABEL_27:

      }
      goto LABEL_28;
    }
    v20 = v11 - 1;
    if ((unint64_t)(v11 - 1) > 2)
    {
      v13 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        v32 = v12;
        v33 = 2112;
        v34 = v9;
        _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Unknown change type (%ld): %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("station-dict"));
      v13 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject objectForKey:](v13, "objectForKey:", CFSTR("station-id"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_msgSend(v21, "longLongValue");
          if (v20 > 1)
          {
            v25 = v22;
            _RadioLogCategoryRequests();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v32 = v25;
              _os_log_impl(&dword_2105F8000, v26, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Deleting station with id: %llu", buf, 0xCu);
            }

            objc_msgSend(v8, "deleteStationWithID:", v25);
          }
          else
          {
            v19 = (void *)objc_msgSend(v8, "newStationWithDictionary:", v13);
            if (v19)
            {
LABEL_35:

              goto LABEL_29;
            }
            _RadioLogCategoryRequests();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v13;
              _os_log_impl(&dword_2105F8000, v23, OS_LOG_TYPE_ERROR, "Error: Unable to create station with dictionary: %@", buf, 0xCu);
            }

          }
        }
        v19 = 0;
        goto LABEL_35;
      }
    }
LABEL_28:
    v19 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v19 = 0;
LABEL_30:

  return v19;
}

- (BOOL)disableArtworkLoading
{
  return self->_disableArtworkLoading;
}

- (void)setDisableArtworkLoading:(BOOL)a3
{
  self->_disableArtworkLoading = a3;
}

- (BOOL)includeCleanTracksOnly
{
  return self->_includeCleanTracksOnly;
}

- (void)setIncludeCleanTracksOnly:(BOOL)a3
{
  self->_includeCleanTracksOnly = a3;
}

- (BOOL)isAutomaticUpdate
{
  return self->_isAutomaticUpdate;
}

- (void)setIsAutomaticUpdate:(BOOL)a3
{
  self->_isAutomaticUpdate = a3;
}

- (NSString)referer
{
  return self->_referer;
}

- (void)setReferer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)resultingOverrideBagDictionary
{
  return self->_resultingOverrideBagDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingOverrideBagDictionary, 0);
  objc_storeStrong((id *)&self->_referer, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_artworkQueue, 0);
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  char v40;
  _QWORD block[5];
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("sync"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v6;
      _os_log_impl(&dword_2105F8000, v7, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Request URL: %@", buf, 0xCu);
    }

    v35 = (void *)v6;
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB1F30], "newForRadioRequestURL:", v6);
    objc_msgSend(v8, "setShouldProcessProtocol:", 0);
    v9 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("global-version"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "changeList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("change-list"));
    v34 = v12;
    objc_msgSend(*(id *)(a1 + 32), "matchDictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("match"));
    v33 = (void *)v13;
    objc_msgSend(v3, "radioConfigurationDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("show-explicit-toggle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v15, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 105));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("clean"));

    }
    +[RadioModel backgroundModel](RadioModel, "backgroundModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "globalHash");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("global-hash"));
    v19 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v19 + 106))
    {
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("auto-update"));
      v19 = *(_QWORD *)(a1 + 32);
    }
    if (objc_msgSend(*(id *)(v19 + 112), "length"))
      objc_msgSend(v8, "setValue:forHTTPHeaderField:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), CFSTR("Referer"));
    v20 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v11;
      _os_log_impl(&dword_2105F8000, v20, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Request parameters: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCE50], "dataForRadioRequestParameters:isAsynchronousBackgroundRequest:error:", v11, objc_msgSend(*(id *)(a1 + 32), "isAsynchronousBackgroundRequest"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHTTPBody:", v21);
    +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "beginUsingNetwork");

    v23 = objc_msgSend(MEMORY[0x24BEB2000], "newRadioRequestWithRequestContext:requestProperties:storeBag:", *(_QWORD *)(a1 + 40), v8, v3);
    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 88);
    *(_QWORD *)(v24 + 88) = v23;

    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    v28 = *(void **)(v26 + 88);
    v36[0] = MEMORY[0x24BDAC760];
    v36[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_30;
    v36[3] = &unk_24CA2E430;
    v36[1] = 3221225472;
    v36[4] = v26;
    v37 = v17;
    v40 = *(_BYTE *)(a1 + 56);
    v38 = v27;
    v39 = *(id *)(a1 + 48);
    v29 = v17;
    objc_msgSend(v28, "startWithConnectionResponseBlock:", v36);

    v30 = v35;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setStatus:", 5);
    dispatch_get_global_queue(0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_2;
    block[3] = &unk_24CA2E9B0;
    v32 = *(id *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    v42 = v32;
    dispatch_async(v31, block);

    v30 = v42;
  }

}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), *(_QWORD *)(a1 + 32));

}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  RadioGetFeaturedStationsRequest *v37;
  dispatch_semaphore_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD block[4];
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  _QWORD v59[4];
  NSObject *v60;
  uint8_t v61[8];
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  id v65;
  __int128 *p_buf;
  _QWORD *v67;
  uint64_t v68;
  char v69;
  _QWORD v70[5];
  id v71;
  id v72;
  id v73;
  __int128 buf;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  _QWORD v80[4];

  v80[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  +[RadioNetworkObserver sharedNetworkObserver](RadioNetworkObserver, "sharedNetworkObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endUsingNetwork");

  v8 = v6;
  v9 = v8;
  if (v5)
  {
    v10 = objc_msgSend(v5, "statusCode");
  }
  else
  {
    objc_msgSend(v8, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "integerValue");

  }
  v13 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Status code: %lli", (uint8_t *)&buf, 0xCu);
  }

  if ((unint64_t)(v10 - 300) <= 0xFFFFFFFFFFFFFF9BLL)
  {
    v14 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_2105F8000, v14, OS_LOG_TYPE_ERROR, "Error: Unable to read station listing (%@)", (uint8_t *)&buf, 0xCu);
    }

    v15 = v9;
    if (!v9)
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v79 = *MEMORY[0x24BEB24A8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEB24A0], 109, v18);
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (v10 <= 399)
    {
      v19 = 1;
      if (v10 == 200 || v10 == 204)
        goto LABEL_30;
    }
    else
    {
      switch(v10)
      {
        case 404:
          goto LABEL_15;
        case 401:
          v19 = 2;
          goto LABEL_30;
        case 400:
LABEL_15:
          v19 = 4;
LABEL_30:
          objc_msgSend(*(id *)(a1 + 32), "setStatus:", v19);
          v25 = 0;
          goto LABEL_57;
      }
    }
    v19 = 3;
    goto LABEL_30;
  }
  objc_msgSend(v5, "radio_decompressedBodyData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    v72 = 0;
    v73 = v9;
    objc_msgSend(v20, "propertyListForRadioResponseReturningError:unparsedResponseDictionary:", &v73, &v72);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v73;

    v21 = v72;
    v52 = v72;
    if (v52)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v21);
      objc_msgSend(v52, "objectForKey:", CFSTR("error"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
        v22 = v51;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "objectForKey:", CFSTR("error-value"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v24 = (int)objc_msgSend(v23, "intValue");
          else
            v24 = 0;

        }
        else
        {
          v24 = 0;
        }

        objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", v24);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RadioRequestErrorDomain"), v24, 0);
        v41 = objc_claimAutoreleasedReturnValue();

        v40 = os_log_create("com.apple.amp.radio", "Requests");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v22;
          _os_log_impl(&dword_2105F8000, v40, OS_LOG_TYPE_ERROR, "Error: Sync request failed (%@)", (uint8_t *)&buf, 0xCu);
        }
        v25 = 0;
        v15 = (id)v41;
      }
      else
      {
        objc_msgSend(v53, "objectForKey:", CFSTR("global-version"));
        v50 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = -[NSObject unsignedLongLongValue](v50, "unsignedLongLongValue");
          objc_msgSend(*(id *)(a1 + 40), "setGlobalVersion:", v25);
        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(v53, "objectForKey:", CFSTR("bag"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = objc_msgSend(v49, "copy");
          v28 = *(_QWORD *)(a1 + 32);
          v29 = *(void **)(v28 + 120);
          *(_QWORD *)(v28 + 120) = v27;

        }
        objc_msgSend(v53, "objectForKey:", CFSTR("global-hash"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 40), "setGlobalHash:", v48);
        objc_msgSend(v53, "objectForKey:", CFSTR("type"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = objc_msgSend(v47, "unsignedIntValue");
          v31 = os_log_create("com.apple.amp.radio", "Requests");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v30;
            _os_log_impl(&dword_2105F8000, v31, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Sync type: %lli", (uint8_t *)&buf, 0xCu);
          }
          v46 = v30;

        }
        else
        {
          v46 = 1;
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v75 = 0x3032000000;
        v76 = __Block_byref_object_copy__220;
        v77 = __Block_byref_object_dispose__221;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v78 = (id)objc_claimAutoreleasedReturnValue();
        v70[0] = 0;
        v70[1] = v70;
        v70[2] = 0x3032000000;
        v70[3] = __Block_byref_object_copy__220;
        v70[4] = __Block_byref_object_dispose__221;
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v71 = (id)objc_claimAutoreleasedReturnValue();
        v32 = *(void **)(a1 + 40);
        v62[0] = MEMORY[0x24BDAC760];
        v62[1] = 3221225472;
        v62[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_41;
        v62[3] = &unk_24CA2E3B8;
        v33 = v53;
        v34 = *(_QWORD *)(a1 + 32);
        v35 = *(void **)(a1 + 40);
        v63 = v33;
        v64 = v34;
        v65 = v35;
        p_buf = &buf;
        v67 = v70;
        v68 = v46;
        v69 = *(_BYTE *)(a1 + 64);
        objc_msgSend(v32, "performWriteTransactionWithBlock:", v62);
        if (v46 == 2)
        {
          v36 = os_log_create("com.apple.amp.radio", "Requests");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v61 = 0;
            _os_log_impl(&dword_2105F8000, v36, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Synchronously fetching featured stations...", v61, 2u);
          }

          v37 = objc_alloc_init(RadioGetFeaturedStationsRequest);
          -[RadioRequest setRequestContext:](v37, "setRequestContext:", *(_QWORD *)(a1 + 48));
          -[RadioGetFeaturedStationsRequest setDisableArtworkLoading:](v37, "setDisableArtworkLoading:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104));
          v38 = dispatch_semaphore_create(0);
          v59[0] = MEMORY[0x24BDAC760];
          v59[1] = 3221225472;
          v59[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_48;
          v59[3] = &unk_24CA2E3E0;
          v39 = v38;
          v60 = v39;
          -[RadioGetFeaturedStationsRequest startWithCompletionHandler:](v37, "startWithCompletionHandler:", v59);
          dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);

        }
        objc_msgSend(*(id *)(a1 + 32), "setStatus:", 1);

        _Block_object_dispose(v70, 8);
        _Block_object_dispose(&buf, 8);

        v40 = v50;
      }

    }
    else
    {
      v26 = os_log_create("com.apple.amp.radio", "Requests");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_2105F8000, v26, OS_LOG_TYPE_ERROR, "Error: Unable to deserialize station listing (%@)", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 3);
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
    v15 = v9;
  }

LABEL_57:
  v42 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_2105F8000, v42, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Sync completed", (uint8_t *)&buf, 2u);
  }

  dispatch_get_global_queue(0, 0);
  v43 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_50;
  block[3] = &unk_24CA2E408;
  v57 = *(id *)(a1 + 56);
  v58 = v25;
  v44 = *(_QWORD *)(a1 + 32);
  v55 = v15;
  v56 = v44;
  v45 = v15;
  dispatch_async(v43, block);

}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_41(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[16];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("change-list"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_37;
  objc_msgSend(*(id *)(a1 + 40), "_sortedChangesByType:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_stationSortOrderForChanges:", v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 48), "userStations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = v3;
  v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  v23 = v2;
  if (!v6)
    goto LABEL_25;
  v7 = v6;
  v8 = *(_QWORD *)v31;
  v22 = a1 + 64;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v31 != v8)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v25)
        {
          objc_msgSend(v10, "objectForKey:", CFSTR("station-dict"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "objectForKey:", CFSTR("station-id"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              v13 = (unint64_t)objc_msgSend(v25, "indexOfObject:", v12) < 2;
            else
              v13 = 0;

            v2 = v23;
          }
          else
          {
            v13 = 0;
          }

        }
        else
        {
          v13 = 0;
        }
        *(_QWORD *)buf = 1;
        objc_msgSend(*(id *)(a1 + 40), "_updateModel:withChangeDictionary:changeType:loadArtworkSynchronously:", *(_QWORD *)(a1 + 48), v10, buf, v13, v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v24, "removeObject:", v14);
          v15 = a1 + 56;
          if (*(_QWORD *)buf == 1)
            goto LABEL_21;
          if (*(_QWORD *)buf == 2)
          {
            v15 = v22;
LABEL_21:
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 40), "addObject:", v14);
          }
        }

        continue;
      }
    }
    v7 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v7);
LABEL_25:

  if (*(_QWORD *)(a1 + 72) == 2)
  {
    v16 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_2105F8000, v16, OS_LOG_TYPE_INFO, "[RadioSyncRequest] Removing stations after full sync: %@", buf, 0xCu);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v24;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(a1 + 48), "deleteStationWithID:", objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "stationID", v22));
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v19);
    }

    v2 = v23;
  }

LABEL_37:
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 48), "setDatabaseVersion:", 3);

}

intptr_t __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_48(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __47__RadioSyncRequest_startWithCompletionHandler___block_invoke_50(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[7], a1[4]);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RadioRequestDidFinishNotification"), a1[5]);

}

@end
