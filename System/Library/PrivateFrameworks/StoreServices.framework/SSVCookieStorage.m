@implementation SSVCookieStorage

- (id)cookieArrayBySettingFeatureEnablerWithArray:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  SSVCookieStorage *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = (id)objc_msgSend(a3, "mutableCopy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v24 = self;
    v25 = v6;
    v10 = *(_QWORD *)v31;
    v11 = -1;
    while (2)
    {
      v12 = 0;
      v13 = v11 + v9;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("itfe"));

        if (v16)
        {
          v17 = v14;
          v13 = v11 + v12 + 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v11 = v13;
      if (v9)
        continue;
      break;
    }
    v17 = 0;
LABEL_11:
    self = v24;
    v6 = v25;
  }
  else
  {
    v17 = 0;
    v13 = -1;
  }

  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__SSVCookieStorage_cookieArrayBySettingFeatureEnablerWithArray_key___block_invoke;
  v26[3] = &unk_1E47BD9F8;
  v27 = v17;
  v19 = v7;
  v28 = v19;
  v29 = v13;
  v20 = v17;
  -[SSVCookieStorage synchronizeFeatureEnablerCookieWithCookieValue:key:result:](self, "synchronizeFeatureEnablerCookieWithCookieValue:key:result:", v18, v6, v26);

  v21 = v28;
  v22 = v19;

  return v22;
}

void __78__SSVCookieStorage_synchronizeFeatureEnablerCookieWithCookieValue_key_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v5, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __68__SSVCookieStorage_cookieArrayBySettingFeatureEnablerWithArray_key___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (!v5 && v7)
    {
      v9 = 0;
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", *(_QWORD *)(a1 + 48));
LABEL_9:
      v6 = v9;
      goto LABEL_10;
    }
    if (v5)
    {
      v8 = *(void **)(a1 + 40);
      v9 = v6;
      if (v7)
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v6, *(_QWORD *)(a1 + 48));
      else
        objc_msgSend(v8, "addObject:", v6);
      goto LABEL_9;
    }
  }
LABEL_10:

}

void __33__SSVCookieStorage_sharedStorage__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_sharedStorageLocationPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v1, "stringByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

    v4 = objc_alloc((Class)objc_opt_class());
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithStorageLocation:", v5);
    v7 = (void *)sharedStorage_sSharedStorage;
    sharedStorage_sSharedStorage = v6;

  }
  else
  {
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      LODWORD(v19) = 138412290;
      *(_QWORD *)((char *)&v19 + 4) = objc_opt_class();
      v10 = *(id *)((char *)&v19 + 4);
      LODWORD(v18) = 12;
      v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
        goto LABEL_4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v19, v18, v19);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v11);
      SSFileLog(v2, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v5);
    }
  }

LABEL_4:
}

- (void)synchronizeFeatureEnablerCookieWithCookieValue:(id)a3 key:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  char v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  NSObject *v53;
  int v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void (**v68)(id, uint64_t, void *);
  void *v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  int v80;
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[6];
  _QWORD v86[6];
  _BYTE v87[128];
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  -[SSVCookieStorage fetchDefaults](self, "fetchDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __78__SSVCookieStorage_synchronizeFeatureEnablerCookieWithCookieValue_key_result___block_invoke;
  v78[3] = &unk_1E47B89D8;
  v13 = v12;
  v79 = v13;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v78);
  if (MGGetBoolAnswer())
  {
    v14 = objc_msgSend(v13, "count");
    if (!v8 || v14)
    {
      if (objc_msgSend(v13, "count"))
      {
        v73 = v9;
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("+"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v13, "count");
        v70 = v31;
        if (v32 != objc_msgSend(v31, "count"))
          goto LABEL_28;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v33 = v31;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        if (v34)
        {
          v35 = v34;
          v68 = v10;
          v71 = v8;
          v36 = 0;
          v37 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v75 != v37)
                objc_enumerationMutation(v33);
              objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "BOOLValue");

              v36 |= v40 ^ 1;
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
          }
          while (v35);

          v8 = v71;
          v10 = v68;
          if ((v36 & 1) != 0)
          {
LABEL_28:
            objc_msgSend(v13, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "componentsJoinedByString:", CFSTR("+"));
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = objc_alloc(MEMORY[0x1E0CB3670]);
            v43 = *MEMORY[0x1E0CB2B78];
            v85[0] = *MEMORY[0x1E0CB2B90];
            v85[1] = v43;
            v86[0] = CFSTR("itfe");
            v86[1] = CFSTR(".apple.com");
            v44 = *MEMORY[0x1E0CB2BC0];
            v85[2] = *MEMORY[0x1E0CB2BA0];
            v85[3] = v44;
            v86[2] = CFSTR("/");
            v86[3] = v41;
            v72 = (void *)v41;
            v86[4] = MEMORY[0x1E0C9AAB0];
            v45 = *MEMORY[0x1E0CB2B80];
            v85[4] = *MEMORY[0x1E0CB2BB8];
            v85[5] = v45;
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31536000.0);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v86[5] = v46;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 6);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v42, "initWithProperties:", v47);

            v67 = (void *)v48;
            v84 = v48;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v73;
            -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v49, v73);

            +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v50)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v51 = objc_msgSend(v50, "shouldLog");
            if (objc_msgSend(v50, "shouldLogToDisk"))
              v52 = v51 | 2;
            else
              v52 = v51;
            objc_msgSend(v50, "OSLogObject");
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              v54 = v52;
            else
              v54 = v52 & 2;
            if (v54)
            {
              v55 = (void *)objc_opt_class();
              v80 = 138412546;
              v81 = v55;
              v82 = 2112;
              v83 = v72;
              v56 = v8;
              v57 = v55;
              LODWORD(v66) = 22;
              v58 = (void *)_os_log_send_and_compose_impl();

              v8 = v56;
              v59 = v70;
              if (!v58)
              {
LABEL_41:

                v10[2](v10, 1, v67);
                goto LABEL_17;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v58, 4, &v80, v66);
              v53 = objc_claimAutoreleasedReturnValue();
              free(v58);
              SSFileLog(v50, CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v53);
            }
            else
            {
              v59 = v70;
            }

            goto LABEL_41;
          }
        }
        else
        {

        }
        v9 = v73;
      }
      v10[2](v10, 0, 0);
      goto LABEL_17;
    }
  }
  v88 = *MEMORY[0x1E0CB2B90];
  v89[0] = CFSTR("itfe");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage removeCookiesWithProperties:](self, "removeCookiesWithProperties:", v15);

  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v16, "shouldLog");
  if (objc_msgSend(v16, "shouldLogToDisk"))
    v18 = v17 | 2;
  else
    v18 = v17;
  objc_msgSend(v16, "OSLogObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    v20 = v18;
  else
    v20 = v18 & 2;
  if (!v20)
    goto LABEL_15;
  v21 = (void *)objc_opt_class();
  v80 = 138412290;
  v81 = v21;
  v22 = v8;
  v23 = v21;
  LODWORD(v66) = 12;
  v24 = (void *)_os_log_send_and_compose_impl();

  v8 = v22;
  if (v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v80, v66);
    v19 = objc_claimAutoreleasedReturnValue();
    free(v24);
    SSFileLog(v16, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v19);
LABEL_15:

  }
  v10[2](v10, 1, 0);
LABEL_17:

}

- (BOOL)performingMigration
{
  return self->_performingMigration;
}

- (SSVCookieStorage)initWithStorageLocation:(id)a3
{
  id v4;
  SSVCookieStorage *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v36;
  NSURL *storageLocation;
  int v38;
  __CFNotificationCenter *DarwinNotifyCenter;
  int *v41;
  uint64_t v42;
  objc_super v43;
  int v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Storage location must be a file URL"));
  v43.receiver = self;
  v43.super_class = (Class)SSVCookieStorage;
  v5 = -[SSVCookieStorage init](&v43, sel_init);
  if (!v5)
  {
    v6 = v4;
    goto LABEL_33;
  }
  if (objc_msgSend((id)objc_opt_class(), "_currentProcessShouldUseRescuedStorageLocationForLocation:", v4))
  {
    objc_msgSend((id)objc_opt_class(), "_rescuedStorageLocationForLocation:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v44 = 138412290;
      v45 = v6;
      LODWORD(v42) = 12;
      v41 = &v44;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v44, v42);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
  v6 = v4;
LABEL_18:
  v5->_performingMigration = 0;
  objc_msgSend(v6, "absoluteString", v41);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "containsString:", CFSTR("backup"));

  if (!v20)
    goto LABEL_31;
  +[SSLogConfig sharedAccountsCookiesConfig](SSLogConfig, "sharedAccountsCookiesConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = objc_msgSend(v21, "shouldLog");
  if (objc_msgSend(v21, "shouldLogToDisk"))
    v23 = v22 | 2;
  else
    v23 = v22;
  objc_msgSend(v21, "OSLogObject");
  v24 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    v23 &= 2u;
  if (!v23)
    goto LABEL_29;
  v25 = (void *)objc_opt_class();
  v44 = 138543362;
  v45 = v25;
  v26 = v25;
  LODWORD(v42) = 12;
  v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v44, v42);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v27);
    SSFileLog(v21, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v24);
LABEL_29:

  }
  v5->_performingMigration = 1;
LABEL_31:
  v34 = dispatch_queue_create("com.apple.StoreServices.SSVCookieStorage", 0);
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v34;

  v36 = objc_msgSend(v6, "copy");
  storageLocation = v5->_storageLocation;
  v5->_storageLocation = (NSURL *)v36;

  v38 = objc_msgSend((id)objc_opt_class(), "_fileURLRepresentsSharedStorageLocation:", v5->_storageLocation);
  v5->_usesSharedCookieDatabase = v38;
  if (v38)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SSVCookieStorageHandleSharedCookieDatabaseDidChangeDarwinNotification, CFSTR("SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification"), 0, (CFNotificationSuspensionBehavior)1028);
  }
LABEL_33:

  return v5;
}

- (id)fetchDefaults
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.storeservices.itfe"));
  v2 = (id)CFPreferencesCopyAppValue(CFSTR("features"), CFSTR("com.apple.storeservices.itfe"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("additionalFeatures"), CFSTR("com.apple.storeservices.itfe"));
    if (v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = (void *)objc_msgSend(v2, "mutableCopy");
        objc_msgSend(v4, "addEntriesFromDictionary:", v3);

        v2 = v4;
      }
    }
    v2 = v2;

    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allCookiesForUserIdentifier:(id)a3 scope:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;

  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SSVCookieStorage _copyCookiesWithKey:](self, "_copyCookiesWithKey:", v5);
  -[SSVCookieStorage cookieArrayBySettingFeatureEnablerWithArray:key:](self, "cookieArrayBySettingFeatureEnablerWithArray:key:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allCookiesForAccount:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "accountScope");
  else
    v6 = 0;
  objc_msgSend(v5, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage allCookiesForUserIdentifier:scope:](self, "allCookiesForUserIdentifier:scope:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_copyCookiesWithKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, sqlite3_stmt *);
  void *v19;
  id v20;
  uint64_t *v21;
  id v22;
  id location;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ams_cookies");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__42;
    v28 = __Block_byref_object_dispose__42;
    v29 = 0;
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __40__SSVCookieStorage__copyCookiesWithKey___block_invoke;
    v19 = &unk_1E47BDAA8;
    objc_copyWeak(&v22, &location);
    v6 = v4;
    v20 = v6;
    v21 = &v24;
    objc_msgSend(v5, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT discard, domain, expire_time, name, path, secure, value, version FROM cookies WHERE user=? AND user_scope=?;"),
      0,
      &v16);

    if (-[SSVCookieStorage performingMigration](self, "performingMigration", v16, v17, v18, v19))
    {
      objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedAccountsCookiesConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "OSLogObject");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (id)objc_opt_class();
        v10 = objc_msgSend((id)v25[5], "count");
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v31 = v9;
        v32 = 2048;
        v33 = v10;
        v34 = 2114;
        v35 = v12;
        _os_log_impl(&dword_1A24BC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Someone is migrating the cookies. We found %lu cookie(s) in the database for %{public}@.", buf, 0x20u);

      }
    }
    v13 = (id)v25[5];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v24, 8);

  }
  return v13;
}

- (id)_accountForKey:(id)a3
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "scope");
  v5 = (_QWORD *)MEMORY[0x1E0CFD7A0];
  if (v4)
    v5 = (_QWORD *)MEMORY[0x1E0CFD7A8];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v3, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToNumber:", &unk_1E481E768),
        v9,
        v8,
        !v10))
  {
    objc_msgSend(v3, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_iTunesAccountWithDSID:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "ams_localiTunesAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)sharedStorage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSVCookieStorage_sharedStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStorage_sOnce != -1)
    dispatch_once(&sharedStorage_sOnce, block);
  return (id)sharedStorage_sSharedStorage;
}

+ (id)_sharedStorageLocationPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Cookies"), CFSTR("com.apple.itunesstored.2.sqlitedb"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)_fileURLRepresentsSharedStorageLocation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("rescued."), &stru_1E47D72B0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_sharedStorageLocationPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v8);

  }
  else
  {
    v7 = 0;
    v4 = v3;
  }

  return v7;
}

+ (BOOL)_fileIsOwnedByRoot:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "integerValue") == 0;
  else
    v10 = 0;

  return v10;
}

+ (BOOL)_currentProcessShouldUseRescuedStorageLocationForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  int v9;

  v4 = a3;
  if (objc_msgSend(a1, "_fileIsOwnedByRoot:", v4))
  {
    objc_msgSend(a1, "_rescuedStorageLocationForLocation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if ((v8 & 1) != 0)
      LOBYTE(v9) = 1;
    else
      v9 = objc_msgSend(a1, "_currentProcessIsRoot") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (SSVCookieStorage)init
{
  return -[SSVCookieStorage initWithStorageLocation:](self, "initWithStorageLocation:", 0);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  if (self->_usesSharedCookieDatabase)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification"), 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSVCookieStorage;
  -[SSVCookieStorage dealloc](&v4, sel_dealloc);
}

- (id)allCookiesForUserIdentifier:(id)a3
{
  return -[SSVCookieStorage allCookiesForUserIdentifier:scope:](self, "allCookiesForUserIdentifier:scope:", a3, 0);
}

- (id)cookieHeadersForURL:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "accountScope");
  else
    v9 = 0;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage cookieHeadersForURL:userIdentifier:scope:](self, "cookieHeadersForURL:userIdentifier:scope:", v6, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4
{
  return -[SSVCookieStorage cookieHeadersForURL:userIdentifier:scope:](self, "cookieHeadersForURL:userIdentifier:scope:", a3, a4, 0);
}

- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[4];

  v8 = a3;
  v9 = a4;
  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SSVCookieStorage _copyCookieDictionaryForURL:key:](self, "_copyCookieDictionaryForURL:key:", v8, v10);
  if (-[SSVCookieStorage _shouldAddITFECookieToURL:](self, "_shouldAddITFECookieToURL:", v8))
    -[SSVCookieStorage setFeatureEnablerInDictionary:key:](self, "setFeatureEnablerInDictionary:key:", v11, v10);
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __61__SSVCookieStorage_cookieHeadersForURL_userIdentifier_scope___block_invoke;
    v19 = &unk_1E47BC248;
    v21 = v22;
    v13 = v12;
    v20 = v13;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", &v16);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, CFSTR("Cookie"), 0, v16, v17, v18, v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v22, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __61__SSVCookieStorage_cookieHeadersForURL_userIdentifier_scope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("; "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("="));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (id)cookiesForURL:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "accountScope");
  else
    v9 = 0;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage cookiesForURL:userIdentifier:scope:](self, "cookiesForURL:userIdentifier:scope:", v6, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4
{
  return -[SSVCookieStorage cookiesForURL:userIdentifier:scope:](self, "cookiesForURL:userIdentifier:scope:", a3, a4, 0);
}

- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  uint64_t v12;

  v8 = a3;
  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SSVCookieStorage _copyCookieObjectsForURL:key:](self, "_copyCookieObjectsForURL:key:", v8, v9);
  v11 = -[SSVCookieStorage _shouldAddITFECookieToURL:](self, "_shouldAddITFECookieToURL:", v8);

  if (v11)
  {
    -[SSVCookieStorage cookieArrayBySettingFeatureEnablerWithArray:key:](self, "cookieArrayBySettingFeatureEnablerWithArray:key:", v10, v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }

  return v10;
}

- (void)removeAllCookies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "ams_iTunesAccounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v5;
    objc_msgSend(v4, "ams_iTunesSandboxAccounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v25 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
                objc_msgSend(v16, "ams_removeAllCookies");
                if (objc_msgSend(v16, "isDirty"))
                  v17 = (id)objc_msgSend(v4, "ams_saveAccount:verifyCredentials:", v16, 0);
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v13);
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __36__SSVCookieStorage_removeAllCookies__block_invoke;
    v21 = &unk_1E47BD8E0;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v3, "prepareStatementForSQL:cache:usingBlock:", CFSTR("DELETE FROM cookies"), 0, &v18);

    -[SSVCookieStorage _cookieDatabaseDidChange](self, "_cookieDatabaseDidChange", v18, v19, v20, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __36__SSVCookieStorage_removeAllCookies__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statementHasRowAfterStepping:", a2);

}

- (void)removeCookiesWithProperties:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_removeCookiesMatchingProperties:error:", v17, 0);

  }
  else
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 1;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = v17;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[SSVCookieStorage _columnNameForCookieProperty:](self, "_columnNameForCookieProperty:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@=?)"), v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v10);

            objc_msgSend(v4, "objectForKey:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v11);

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v5);
    }

    if (objc_msgSend(v19, "count"))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(" AND "));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("DELETE FROM cookies WHERE %@"), v13);

      objc_initWeak(&location, self);
      -[SSVCookieStorage _database](self, "_database");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__SSVCookieStorage_removeCookiesWithProperties___block_invoke;
      v20[3] = &unk_1E47BD908;
      objc_copyWeak(&v23, &location);
      v22 = &v29;
      v21 = v18;
      objc_msgSend(v15, "prepareStatementForSQL:cache:usingBlock:", v14, 0, v20);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

    }
    -[SSVCookieStorage _cookieDatabaseDidChange](self, "_cookieDatabaseDidChange");
    if (!*((_BYTE *)v30 + 24))
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid property value(s)"));

    _Block_object_dispose(&v29, 8);
  }

}

void __48__SSVCookieStorage_removeCookiesWithProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)objc_opt_class(), "_bindStatement:withValues:", a2, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    do
    {
      objc_msgSend(WeakRetained, "_database");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "statementHasRowAfterStepping:", a2);

    }
    while ((v5 & 1) != 0);
  }

}

- (void)removeCookiesWithAccount:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "accountScope");
    v4 = v7;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage removeCookiesWithUserIdentifier:scope:](self, "removeCookiesWithUserIdentifier:scope:", v6, v5);

}

- (void)removeCookiesWithUserIdentifier:(id)a3
{
  -[SSVCookieStorage removeCookiesWithUserIdentifier:scope:](self, "removeCookiesWithUserIdentifier:scope:", a3, 0);
}

- (void)removeCookiesWithUserIdentifier:(id)a3 scope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30[2];
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
      && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
    {
      +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v6, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "ams_removeAllCookies");
        if (objc_msgSend(v24, "isDirty"))
        {
          objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)objc_msgSend(v25, "ams_saveAccount:verifyCredentials:", v24, 0);

        }
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM cookies WHERE user=? AND user_scope=?"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, self);
      -[SSVCookieStorage _database](self, "_database");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __58__SSVCookieStorage_removeCookiesWithUserIdentifier_scope___block_invoke;
      v28[3] = &unk_1E47BD930;
      objc_copyWeak(v30, location);
      v29 = v6;
      v30[1] = (id)a4;
      objc_msgSend(v8, "prepareStatementForSQL:cache:usingBlock:", v7, 0, v28);

      -[SSVCookieStorage _cookieDatabaseDidChange](self, "_cookieDatabaseDidChange");
      objc_destroyWeak(v30);
      objc_destroyWeak(location);

    }
  }
  else
  {
    +[SSLogConfig sharedAccountsCookiesConfig](SSLogConfig, "sharedAccountsCookiesConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      v13 = *(id *)((char *)location + 4);
      LODWORD(v27) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

      }
    }
    else
    {

    }
  }

}

void __58__SSVCookieStorage_removeCookiesWithUserIdentifier_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_opt_class();
  v10[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_bindStatement:withValues:", a2, v7);

  do
  {
    objc_msgSend(WeakRetained, "_database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "statementHasRowAfterStepping:", a2);

  }
  while ((v9 & 1) != 0);

}

+ (BOOL)responseHasSetCookies:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_getSetCookiesForResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "_getUserSetCookiesForResponse:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      v6 = 1;
      v5 = v7;
    }
    else
    {
      objc_msgSend(a1, "_getGlobalSetCookiesForResponse:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "count") != 0;
    }
  }

  return v6;
}

- (void)setCookies:(id)a3 forAccount:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "accountScope");
  else
    v8 = 0;
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v11, v10);
}

- (void)setCookies:(id)a3 forUserIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", a4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v6, v7);

}

- (void)setCookiesForHTTPResponse:(id)a3 account:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "accountScope");
  else
    v8 = 0;
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVCookieStorage setCookiesForHTTPResponse:userIdentifier:scope:](self, "setCookiesForHTTPResponse:userIdentifier:scope:", v10, v9, v8);

}

- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4
{
  -[SSVCookieStorage setCookiesForHTTPResponse:userIdentifier:scope:](self, "setCookiesForHTTPResponse:userIdentifier:scope:", a3, a4, 0);
}

- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_getSetCookiesForResponse:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v9, v10);

  }
  objc_msgSend((id)objc_opt_class(), "_getUserSetCookiesForResponse:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v11, v12);

  }
  objc_msgSend((id)objc_opt_class(), "_getGlobalSetCookiesForResponse:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", &unk_1E481E768, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVCookieStorage _setCookies:forKey:](self, "_setCookies:forKey:", v13, v14);

  }
}

- (void)setCookiesFromCookieStorage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "_database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke;
  v16[3] = &unk_1E47BD958;
  v8 = v4;
  v17 = v8;
  v9 = v5;
  v18 = v9;
  objc_msgSend(v6, "performTransactionWithBlock:", v16);

  objc_initWeak(&location, self);
  -[SSVCookieStorage _database](self, "_database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_2;
  v12[3] = &unk_1E47BD9A8;
  objc_copyWeak(&v14, &location);
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "performTransactionWithBlock:", v12);

  -[SSVCookieStorage _cookieDatabaseDidChange](self, "_cookieDatabaseDidChange");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_allCookieKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
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
        v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyCookiesWithKey:", v7);
        if (v8)
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return 1;
}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_3;
  v5[3] = &unk_1E47BD980;
  v5[4] = WeakRetained;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  return 1;
}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertCookies:forKey:", a3, a2);
}

- (NSURL)storageLocation
{
  return self->_storageLocation;
}

- (void)_handleSharedCookieDatabaseDidChangeDarwinNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SSVCookieStorageSharedCookiesDidChangeNotification"), self);

}

- (void)setFeatureEnablerInDictionary:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("itfe"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SSVCookieStorage_setFeatureEnablerInDictionary_key___block_invoke;
  v11[3] = &unk_1E47BD9D0;
  v12 = v8;
  v13 = v6;
  v9 = v6;
  v10 = v8;
  -[SSVCookieStorage synchronizeFeatureEnablerCookieWithCookieValue:key:result:](self, "synchronizeFeatureEnablerCookieWithCookieValue:key:result:", v10, v7, v11);

}

void __54__SSVCookieStorage_setFeatureEnablerInDictionary_key___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (a2)
  {
    if (!v5 && *(_QWORD *)(a1 + 32))
    {
      v7 = 0;
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", CFSTR("itfe"));
LABEL_7:
      v5 = v7;
      goto LABEL_8;
    }
    if (v5)
    {
      v7 = v5;
      objc_msgSend(v5, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("itfe"));

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)_shouldAddITFECookieToURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v3, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("https"));

  LOBYTE(v7) = v8 & objc_msgSend(v5, "hasSuffix:", CFSTR(".apple.com"));
  return (char)v7;
}

- (id)_allCookieKeys
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[2];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
    v30 = 0u;
    objc_msgSend(v19, "ams_iTunesAccounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v7;
    objc_msgSend(v19, "ams_iTunesSandboxAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v9)
    {
      v21 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v27 != v14)
                  objc_enumerationMutation(v12);
                v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v16, "ams_DSID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v17, objc_msgSend(v16, "ams_isSandboxAccount"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v18);

                }
              }
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v13);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __34__SSVCookieStorage__allCookieKeys__block_invoke;
    v22[3] = &unk_1E47BDA20;
    objc_copyWeak(&v24, &location);
    v5 = v3;
    v23 = v5;
    objc_msgSend(v4, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT DISTINCT user, user_scope FROM cookies;"),
      0,
      v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __34__SSVCookieStorage__allCookieKeys__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "statementHasRowAfterStepping:", a2);

  if (v5)
  {
    do
    {
      v6 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
      v7 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 1);
      v8 = v7;
      if (v6 && v7)
      {
        +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v6, objc_msgSend(v7, "integerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

      }
      objc_msgSend(WeakRetained, "_database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "statementHasRowAfterStepping:", a2);

    }
    while ((v11 & 1) != 0);
  }

}

- (void)_bindInsertStatement:(sqlite3_stmt *)a3 forCookie:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a4;
  v7 = a5;
  sqlite3_bind_int(a3, 1, objc_msgSend(v16, "isSessionOnly"));
  objc_msgSend(v16, "domain");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, 2, (const char *)objc_msgSend(v8, "UTF8String"), -1, 0);

  objc_msgSend(v16, "expiresDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  sqlite3_bind_int(a3, 3, (int)v10);

  objc_msgSend(v16, "name");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, 4, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0);

  objc_msgSend(v16, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, 5, (const char *)objc_msgSend(v12, "UTF8String"), -1, 0);

  sqlite3_bind_int(a3, 6, objc_msgSend(v16, "isSecure"));
  objc_msgSend(v7, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a3, 7, objc_msgSend(v14, "longLongValue"));

  }
  else
  {
    sqlite3_bind_int64(a3, 7, 0);
  }

  sqlite3_bind_int(a3, 8, objc_msgSend(v7, "scope"));
  objc_msgSend(v16, "value");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a3, 9, (const char *)objc_msgSend(v15, "UTF8String"), -1, 0);

  sqlite3_bind_int(a3, 10, objc_msgSend(v16, "version"));
}

+ (BOOL)_bindStatement:(sqlite3_stmt *)a3 withValues:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  double v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = 1;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          sqlite3_bind_text(a3, v9 + i, (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), -1, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            sqlite3_bind_int(a3, v9 + i, objc_msgSend(v11, "intValue"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v13 = 0;
              goto LABEL_16;
            }
            objc_msgSend(v11, "timeIntervalSinceReferenceDate", (_QWORD)v15);
            sqlite3_bind_double(a3, v9 + i, v12);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v9 += i;
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (id)_columnNameForCookieProperty:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t i;
  uint64_t j;
  _QWORD v10[7];
  _OWORD v11[3];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11[0] = xmmword_1E47BDA40;
  v11[1] = *(_OWORD *)&off_1E47BDA50;
  v11[2] = xmmword_1E47BDA60;
  v12 = CFSTR("version");
  v10[0] = (id)*MEMORY[0x1E0CB2B70];
  v10[1] = (id)*MEMORY[0x1E0CB2B78];
  v10[2] = (id)*MEMORY[0x1E0CB2B90];
  v10[3] = (id)*MEMORY[0x1E0CB2BA0];
  v10[4] = (id)*MEMORY[0x1E0CB2BB8];
  v10[5] = (id)*MEMORY[0x1E0CB2BC0];
  v4 = 0;
  v10[6] = (id)*MEMORY[0x1E0CB2BC8];
  while (!objc_msgSend(a3, "isEqualToString:", v10[v4]))
  {
    if (++v4 == 7)
    {
      v5 = 0;
      goto LABEL_6;
    }
  }
  v5 = *(id *)((char *)v11 + v4 * 8);
LABEL_6:
  v6 = v5;
  for (i = 6; i != -1; --i)

  for (j = 48; j != -8; j -= 8)
  return v6;
}

- (void)_cookieDatabaseDidChange
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (self->_usesSharedCookieDatabase)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification"), 0, 0, 1u);
  }
}

- (id)_copyCookieDictionaryForURL:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v22 = v7;
    v9 = -[SSVCookieStorage _copyPrivateCookiesForURL:key:](self, "_copyPrivateCookiesForURL:key:", v6, v7);
    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cookiesForURL:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            objc_msgSend(v17, "value");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKey:", v20, v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v7 = v22;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_copyCookieObjectsForURL:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v31 = v8;
    v32 = v7;
    v9 = -[SSVCookieStorage _copyPrivateCookieObjectsForURL:key:](self, "_copyPrivateCookieObjectsForURL:key:", v6, v7);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v16, v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0CB3678], "sharedHTTPCookieStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cookiesForURL:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v25, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
            objc_msgSend(v10, "setObject:forKey:", v25, v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v22);
    }

    objc_msgSend(v10, "allValues");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");

    v8 = v31;
    v7 = v32;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)_copyCookiesForPreparedSQLStatement:(sqlite3_stmt *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  SSVCookieStorage *v28;
  _QWORD v29[4];
  id v30;
  sqlite3_stmt *v31;
  _QWORD v32[4];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = self;
  -[SSVCookieStorage _database](self, "_database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "statementHasRowAfterStepping:", a3);

  if (v6)
  {
    v26 = *MEMORY[0x1E0CB2B70];
    v25 = *MEMORY[0x1E0CB2BB8];
    v7 = *MEMORY[0x1E0CB2BC8];
    v24 = *MEMORY[0x1E0CB2B80];
    v8 = *MEMORY[0x1E0CB2B78];
    v9 = *MEMORY[0x1E0CB2B90];
    v10 = *MEMORY[0x1E0CB2BA0];
    v11 = *MEMORY[0x1E0CB2BC0];
    do
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (sqlite3_column_int(a3, 0))
        objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v26);
      if (sqlite3_column_int(a3, 5))
        objc_msgSend(v12, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v25);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(a3, 7));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v7);

      v14 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a3, 2);
      v15 = v14;
      if (v14)
      {
        v16 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v17, v24);

      }
      v32[0] = v8;
      v32[1] = v9;
      v33[0] = &unk_1E481E780;
      v33[1] = &unk_1E481E798;
      v32[2] = v10;
      v32[3] = v11;
      v33[2] = &unk_1E481E7B0;
      v33[3] = &unk_1E481E7C8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__SSVCookieStorage__copyCookiesForPreparedSQLStatement___block_invoke;
      v29[3] = &unk_1E47BDA80;
      v31 = a3;
      v19 = v12;
      v30 = v19;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v29);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3670]), "initWithProperties:", v19);
      if (v20)
        objc_msgSend(v27, "addObject:", v20);

      -[SSVCookieStorage _database](v28, "_database");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "statementHasRowAfterStepping:", a3);

    }
    while ((v22 & 1) != 0);
  }
  return v27;
}

void __56__SSVCookieStorage__copyCookiesForPreparedSQLStatement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(*(sqlite3_stmt **)(a1 + 40), objc_msgSend(a3, "intValue"));
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

void __40__SSVCookieStorage__copyCookiesWithKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSSQLiteBindFoundationValueToStatement(a2, 1, v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "scope"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSSQLiteBindFoundationValueToStatement(a2, 2, v5);

  v6 = objc_msgSend(WeakRetained, "_copyCookiesForPreparedSQLStatement:", a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_copyPrivateCookiesForURL:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SSVCookieStorage _stopIncludingLocalCookies](self, "_stopIncludingLocalCookies")
      && (objc_msgSend(v29, "ams_isLocalAccount") & 1) == 0)
    {
      +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", &unk_1E481E768, objc_msgSend(v7, "scope"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      objc_msgSend(v28, "ams_cookies");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVCookieStorage _filterCookies:forURL:](self, "_filterCookies:forURL:", v11, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v41 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v16, "value");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v13);
      }

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v29, "ams_cookies");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVCookieStorage _filterCookies:forURL:](self, "_filterCookies:forURL:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v24, "value");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v26);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __50__SSVCookieStorage__copyPrivateCookiesForURL_key___block_invoke;
    v30[3] = &unk_1E47BDAD0;
    objc_copyWeak(&v34, &location);
    v31 = v6;
    v32 = v7;
    v33 = v8;
    objc_msgSend(v9, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT name, value FROM cookies WHERE ((NOT secure OR secure=?) AND ((user=? AND user_scope=?) OR (user=-1)) AND ((expire_time=0) OR (expire_time>=?)) AND (SUBSTR(?,-LENGTH(domain))=domain) AND (SUBSTR(?,1,LENGTH(path))=path))"), 1, v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __50__SSVCookieStorage__copyPrivateCookiesForURL_key___block_invoke(id *a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CFAbsoluteTime Current;
  id v10;
  id v11;
  void *v12;
  int v13;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  const unsigned __int8 *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[4], "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(a1[4], "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(a2, 1, objc_msgSend(v6, "isEqualToString:", CFSTR("https")));

  objc_msgSend(a1[5], "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[5], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 2, objc_msgSend(v8, "longLongValue"));

  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  sqlite3_bind_int(a2, 3, objc_msgSend(a1[5], "scope"));
  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_int(a2, 4, (int)Current);
  v10 = objc_retainAutorelease(v4);
  sqlite3_bind_text(a2, 5, (const char *)objc_msgSend(v10, "UTF8String"), -1, 0);
  objc_msgSend(a1[4], "path");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a2, 6, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0);

  objc_msgSend(WeakRetained, "_database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "statementHasRowAfterStepping:", a2);

  if (v13)
  {
    do
    {
      v14 = sqlite3_column_text(a2, 0);
      v15 = sqlite3_column_text(a2, 1);
      if (v14)
      {
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v16);
          objc_msgSend(a1[6], "setObject:forKey:", v18, v17);

        }
      }
      objc_msgSend(WeakRetained, "_database");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "statementHasRowAfterStepping:", a2);

    }
    while ((v20 & 1) != 0);
  }

}

- (id)_copyPrivateCookieObjectsForURL:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t *v32;
  id v33;
  id location;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
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
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SSVCookieStorage _stopIncludingLocalCookies](self, "_stopIncludingLocalCookies")
      && (objc_msgSend(v28, "ams_isLocalAccount") & 1) == 0)
    {
      +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", &unk_1E481E768, objc_msgSend(v7, "scope"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v11);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v27, "ams_cookies");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSVCookieStorage _filterCookies:forURL:](self, "_filterCookies:forURL:", v12, v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v17, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, v18);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        }
        while (v14);
      }

    }
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    v41 = 0u;
    objc_msgSend(v28, "ams_cookies");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSVCookieStorage _filterCookies:forURL:](self, "_filterCookies:forURL:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v24, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, v25);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v21);
    }

    objc_msgSend(v10, "allValues");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__42;
    v39 = __Block_byref_object_dispose__42;
    v40 = 0;
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56__SSVCookieStorage__copyPrivateCookieObjectsForURL_key___block_invoke;
    v29[3] = &unk_1E47BDAF8;
    objc_copyWeak(&v33, &location);
    v30 = v6;
    v31 = v7;
    v32 = &v35;
    objc_msgSend(v8, "prepareStatementForSQL:cache:usingBlock:", CFSTR("SELECT discard, domain, expire_time, name, path, secure, value, version FROM cookies WHERE ((NOT secure OR secure=?) AND ((user=? AND user_scope=?) OR (user=-1)) AND ((expire_time=0) OR (expire_time>=?)) AND (SUBSTR(?,-LENGTH(domain))=domain) AND (SUBSTR(?,1,LENGTH(path))=path))"), 1, v29);

    v9 = (id)v36[5];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v35, 8);

  }
  return v9;
}

void __56__SSVCookieStorage__copyPrivateCookieObjectsForURL_key___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CFAbsoluteTime Current;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int(a2, 1, objc_msgSend(v6, "isEqualToString:", CFSTR("https")));

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 2, objc_msgSend(v8, "longLongValue"));

  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  sqlite3_bind_int(a2, 3, objc_msgSend(*(id *)(a1 + 40), "scope"));
  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_int(a2, 4, (int)Current);
  v10 = objc_retainAutorelease(v4);
  sqlite3_bind_text(a2, 5, (const char *)objc_msgSend(v10, "UTF8String"), -1, 0);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  sqlite3_bind_text(a2, 6, (const char *)objc_msgSend(v11, "UTF8String"), -1, 0);

  v12 = objc_msgSend(WeakRetained, "_copyCookiesForPreparedSQLStatement:", a2);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

- (SSSQLiteDatabase)_database
{
  SSSQLiteDatabase *database;
  SSSQLiteDatabase *v4;
  SSSQLiteDatabase *v5;
  SSSQLiteDatabase *v6;
  SSSQLiteDatabase *v7;
  _QWORD v9[4];
  id v10;
  id location;

  database = self->__database;
  if (!database)
  {
    v4 = [SSSQLiteDatabase alloc];
    v5 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:protectionType:](v4, "initWithDatabaseURL:readOnly:protectionType:", self->_storageLocation, 0, *MEMORY[0x1E0CB2AC0]);
    v6 = self->__database;
    self->__database = v5;

    objc_initWeak(&location, self);
    v7 = self->__database;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __29__SSVCookieStorage__database__block_invoke;
    v9[3] = &unk_1E47BDB20;
    objc_copyWeak(&v10, &location);
    -[SSSQLiteDatabase setSetupBlock:](v7, "setSetupBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    database = self->__database;
  }
  return database;
}

void __29__SSVCookieStorage__database__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend((id)objc_opt_class(), "_setupCookieDatabase:forCookieStorage:", v4, WeakRetained);

}

- (id)_filterCookies:(id)a3 forURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  char v24;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSVCookieStorage.m"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = v7;
  v10 = v9;

  objc_msgSend(v8, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(v8, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("https"));

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __42__SSVCookieStorage__filterCookies_forURL___block_invoke;
  v21[3] = &unk_1E47BDB48;
  v24 = v15;
  v22 = v11;
  v23 = v13;
  v16 = v13;
  v17 = v11;
  objc_msgSend(v10, "_ss_filterUsingTest:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __42__SSVCookieStorage__filterCookies_forURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  CFAbsoluteTime v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;

  v3 = a2;
  if (objc_msgSend(v3, "isSecure"))
    v4 = *(unsigned __int8 *)(a1 + 48) == objc_msgSend(v3, "isSecure");
  else
    v4 = 1;
  objc_msgSend(v3, "expiresDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "expiresDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7 >= CFAbsoluteTimeGetCurrent();

  }
  else
  {
    v8 = 1;
  }

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "hasSuffix:", v10);

  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    objc_msgSend(v3, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "hasPrefix:", v13);

  }
  else
  {
    v14 = 1;
  }

  return (v4 && v8) & v14 & v11;
}

+ (id)_getGlobalSetCookiesForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("X-Apple-Set-Cookie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("Set-Cookie"));
    v8 = (void *)MEMORY[0x1E0CB3670];
    objc_msgSend(v3, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cookiesWithResponseHeaderFields:forURL:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_getSetCookiesForResponse:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3670];
  v4 = a3;
  objc_msgSend(v4, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cookiesWithResponseHeaderFields:forURL:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_getUserSetCookiesForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "allHeaderFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("X-Apple-Set-User-Cookie"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("Set-Cookie"));
    v8 = (void *)MEMORY[0x1E0CB3670];
    objc_msgSend(v3, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cookiesWithResponseHeaderFields:forURL:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_insertCookies:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SSVCookieStorage _database](self, "_database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SSVCookieStorage__insertCookies_forKey___block_invoke;
  v11[3] = &unk_1E47BDB70;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "prepareStatementForSQL:cache:usingBlock:", CFSTR("INSERT OR REPLACE INTO cookies (discard, domain, expire_time, name, path, secure, user, user_scope, value, version) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), 1, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __42__SSVCookieStorage__insertCookies_forKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(WeakRetained, "_bindInsertStatement:forCookie:key:", a2, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), *(_QWORD *)(a1 + 40), (_QWORD)v11);
        objc_msgSend(WeakRetained, "_database");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "statementHasRowAfterStepping:", a2);

        sqlite3_reset(a2);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_setCookies:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CFDA48], "useNewCookieStorage")
    && !-[SSVCookieStorage performingMigration](self, "performingMigration"))
  {
    -[SSVCookieStorage _accountForKey:](self, "_accountForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ams_addCookies:", v6);
      if (objc_msgSend(v10, "isDirty"))
      {
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v10, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "waitUntilFinished");
      }
    }

  }
  else
  {
    objc_initWeak(&location, self);
    -[SSVCookieStorage _database](self, "_database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __39__SSVCookieStorage__setCookies_forKey___block_invoke;
    v16 = &unk_1E47BDB98;
    objc_copyWeak(&v19, &location);
    v17 = v6;
    v18 = v7;
    objc_msgSend(v8, "performTransactionWithBlock:", &v13);

    -[SSVCookieStorage _cookieDatabaseDidChange](self, "_cookieDatabaseDidChange", v13, v14, v15, v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

uint64_t __39__SSVCookieStorage__setCookies_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_insertCookies:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return 1;
}

- (BOOL)_stopIncludingLocalCookies
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  return CFPreferencesGetAppBooleanValue(CFSTR("stopIncludingLocalCookies"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

+ (BOOL)_setupCookieDatabase:(id)a3 forCookieStorage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18[2];
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_initWeak(&location, a1);
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke;
  v15[3] = &unk_1E47BDBE8;
  objc_copyWeak(v18, &location);
  v9 = v6;
  v16 = v9;
  v17 = &v20;
  v18[1] = a1;
  objc_msgSend(v9, "performTransactionWithBlock:", v15);
  v10 = objc_msgSend(v9, "executeSQL:", CFSTR("PRAGMA journal_mode=WAL;"));
  *((_BYTE *)v21 + 24) = v10;
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_2;
    v13[3] = &unk_1E47B8790;
    v14 = v7;
    dispatch_async(v11, v13);

    v10 = *((_BYTE *)v21 + 24) != 0;
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  return v10;
}

BOOL __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  char v4;
  _UNKNOWN **v5;
  char v6;
  void *v7;
  _UNKNOWN **v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  int v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 32), "userVersion");
  v4 = 0;
  v5 = &off_1E47B6000;
  while (1)
  {
    if (!v3)
    {
      v6 = objc_msgSend(WeakRetained, "_migrateToVersion1WithDatabase:", *(_QWORD *)(a1 + 32));
      v3 = 1;
      goto LABEL_8;
    }
    if (v3 == 1)
    {
      v6 = objc_msgSend(WeakRetained, "_migrateToVersion2WithDatabase:", *(_QWORD *)(a1 + 32));
      v3 = 2;
LABEL_8:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
      goto LABEL_9;
    }
    if (v3 == 2)
      break;
LABEL_9:
    if (!((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0) | v4 & 1))
    {
      objc_msgSend(v5[387], "sharedStoreServicesConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v5[387], "sharedConfig");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v8 = v5;
      v9 = objc_msgSend(v7, "shouldLog", v51);
      if (objc_msgSend(v7, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      objc_msgSend(v7, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        v12 = v10;
      else
        v12 = v10 & 2;
      if (v12)
      {
        v13 = (void *)objc_opt_class();
        v55 = 138543362;
        v56 = v13;
        v14 = v13;
        LODWORD(v52) = 12;
        v51 = &v55;
        v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15)
          goto LABEL_22;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v55, v52);
        v11 = objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog(v7, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v11);
      }

LABEL_22:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "executeSQL:", CFSTR("DROP TABLE cookies;"));
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        v3 = 0;
      v4 = 1;
      v5 = v8;
    }
  }
  v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0 && (v4 & 1) != 0)
  {
    objc_msgSend(v5[387], "sharedStoreServicesConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v5[387], "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v23, "shouldLog", v51);
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      v25 &= 2u;
    if (v25)
    {
      v27 = (void *)objc_opt_class();
      v55 = 138543362;
      v56 = v27;
      v28 = v27;
      LODWORD(v52) = 12;
      v51 = &v55;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v55, v52);
        v26 = objc_claimAutoreleasedReturnValue();
        free(v29);
        SSFileLog(v23, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v26);
        goto LABEL_36;
      }
    }
    else
    {
LABEL_36:

    }
    v22 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  if (!v22)
  {
    objc_msgSend(v5[387], "sharedStoreServicesConfig");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      objc_msgSend(v5[387], "sharedConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v39 = objc_msgSend(v38, "shouldLog", v51);
    if (objc_msgSend(v38, "shouldLogToDisk"))
      v40 = v39 | 2;
    else
      v40 = v39;
    objc_msgSend(v38, "OSLogObject");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      v40 &= 2u;
    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138412290;
      v56 = v42;
      LODWORD(v52) = 12;
      v43 = (void *)_os_log_send_and_compose_impl();

      if (!v43)
      {
LABEL_51:

        v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, &v55, v52);
      v41 = objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog(v38, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v41);
    }

    goto LABEL_51;
  }
  v36 = *(void **)(a1 + 32);
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_157;
  v53[3] = &unk_1E47BDBC0;
  v54 = v36;
  objc_msgSend(v54, "prepareStatementForSQL:cache:usingBlock:", CFSTR("DELETE FROM cookies WHERE ((expire_time!=0) AND (expire_time<?))"), 0, v53);
  objc_msgSend(*(id *)(a1 + 32), "setUserVersion:", 2);
  v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

LABEL_52:
  return v37 != 0;
}

uint64_t __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_157(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;
  uint64_t result;

  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  do
    result = objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2);
  while ((result & 1) != 0);
  return result;
}

uint64_t __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cookieDatabaseDidChange");
}

+ (BOOL)_migrateToVersion1WithDatabase:(id)a3
{
  return objc_msgSend(a3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS cookies(discard INTEGER DEFAULT 0, domain TEXT NOT NULL, expire_time REAL, name TEXT NOT NULL, path TEXT NOT NULL, secure INTEGER, user INTEGER DEFAULT 0, value TEXT NOT NULL, version INTEGER DEFAULT 1, PRIMARY KEY(name, domain, path, user))"));
}

+ (BOOL)_migrateToVersion2WithDatabase:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (!objc_msgSend(v3, "executeSQL:", CFSTR("CREATE TABLE IF NOT EXISTS tmp_cookies (discard INTEGER DEFAULT 0, domain TEXT NOT NULL, expire_time REAL, name TEXT NOT NULL, path TEXT NOT NULL, secure INTEGER, user INTEGER DEFAULT 0, user_scope INTEGER DEFAULT 0, value TEXT NOT NULL, version INTEGER DEFAULT 1, PRIMARY KEY(name, domain, path, user, user_scope));")))
    goto LABEL_6;
  if ((objc_msgSend(v3, "executeSQL:", CFSTR("INSERT INTO tmp_cookies (discard, domain, expire_time, name, path, secure, user, value, version) SELECT discard, domain, expire_time, name, path, secure, user, value, version FROM cookies;")) & 1) == 0)
  {
    objc_msgSend(v3, "executeSQL:", CFSTR("DROP TABLE tmp_cookies;"));
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "executeSQL:", CFSTR("DROP TABLE cookies;")))
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  v4 = objc_msgSend(v3, "executeSQL:", CFSTR("ALTER TABLE tmp_cookies RENAME TO cookies;"));
LABEL_7:

  return v4;
}

+ (BOOL)_currentProcessIsRoot
{
  return getuid() == 0;
}

+ (id)_rescuedStorageLocationForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((objc_msgSend(a1, "_fileIsOwnedByRoot:", v4) & 1) != 0)
  {
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("rescued."), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_rescuedStorageLocationForLocation:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

- (void)setPerformingMigration:(BOOL)a3
{
  self->_performingMigration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__database, 0);
  objc_storeStrong((id *)&self->_storageLocation, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
