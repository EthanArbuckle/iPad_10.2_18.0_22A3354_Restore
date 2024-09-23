@implementation TUMapsMetadataCacheDataProvider

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  id v18;
  void *v19;
  dispatch_queue_t v20;
  void *v21;
  _QWORD v22[5];
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "handle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "normalizedValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "length"))
        {
          v16 = CFPhoneNumberCreate();
          if (v16)
          {
            v17 = (const void *)v16;
            objc_msgSend(v8, "addObject:", v16);
            CFRelease(v17);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
  {
    dispatch_group_enter(v7);
    v18 = objc_alloc_init((Class)CUTWeakLinkClass());
    objc_msgSend(v18, "_setAllowPhoneNumberLookupUsingCellular:", 1);
    objc_msgSend(v8, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setPhoneNumbers:", v19);

    v20 = dispatch_queue_create("com.apple.telephonyutilities.metadatacache.mapsQueue", 0);
    v21 = (void *)objc_msgSend(objc_alloc((Class)CUTWeakLinkClass()), "initWithRequest:", v18);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__TUMapsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
    v22[3] = &unk_1E38A37E8;
    v22[4] = self;
    v23 = v7;
    objc_msgSend(v21, "_phoneOnlyStartWithCompletionHandler:queue:", v22, v20);

  }
}

void __75__TUMapsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  TUMetadataDestinationID *v15;
  uint64_t v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a2, "mapItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    v6 = &off_1E389E000;
    do
    {
      v7 = 0;
      v23 = v4;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          objc_msgSend(v8, "phoneNumber");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "length");

          if (!v11)
            goto LABEL_15;
          objc_msgSend(v8, "phoneNumber");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "length"))
          {
            objc_msgSend(v8, "placemark");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "countryCode");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6[485], "normalizedPhoneNumberHandleForValue:isoCountryCode:", v9, v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = -[TUMetadataDestinationID initWithHandle:]([TUMetadataDestinationID alloc], "initWithHandle:", v14);
              if (v15)
              {
                v16 = v5;
                v17 = v2;
                v18 = v6;
                v19 = *(void **)(a1 + 32);
                objc_msgSend(v8, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v19;
                v6 = v18;
                v2 = v17;
                v5 = v16;
                v4 = v23;
                objc_msgSend(v21, "setObject:forDestinationID:", v20, v15);

              }
            }

          }
        }

LABEL_15:
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

@end
