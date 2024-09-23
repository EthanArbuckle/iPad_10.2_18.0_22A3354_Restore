@implementation SWCManager

- (BOOL)_connectionIsEntitled:(id)a3 forMutation:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  char v7;
  _OWORD v9[2];

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "auditToken");
  else
    memset(v9, 0, sizeof(v9));
  v7 = _SWCIsAuditTokenEntitled(v9, v4);

  return v7;
}

- (void)getTrackingDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, void *);
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  if (v7 && !_NSIsNSSet(v7))
  {
LABEL_13:
    v8[2](v8, &__NSDictionary0__struct);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          if ((_NSIsNSString(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12)) & 1) == 0)
          {

            goto LABEL_13;
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000027A0;
    v14[3] = &unk_1000310B0;
    v15 = (id)os_transaction_create("com.apple.swc.tracking-domains");
    v16 = v8;
    v13 = v15;
    +[_SWCTrackingDomainInfo _getTrackingDomainInfoWithDomains:sources:completionHandler:](_SWCTrackingDomainInfo, "_getTrackingDomainInfoWithDomains:sources:completionHandler:", v9, a4, v14);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location[3];

  v5 = a4;
  v6 = -[SWCManager _connectionMayConnect:](self, "_connectionMayConnect:", v5);
  if (v6)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v7 = (id)qword_100037288;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)objc_msgSend(v5, "processIdentifier");
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Accepted connection: %llu", (uint8_t *)location, 0xCu);
    }

    v8 = _SWCGetServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v5, "setExportedInterface:", v9);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_initWeak(location, v5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100014A7C;
    v18[3] = &unk_100030D58;
    objc_copyWeak(&v19, location);
    objc_msgSend(v5, "setInterruptionHandler:", v18);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100014B88;
    v16 = &unk_100030D58;
    objc_copyWeak(&v17, location);
    objc_msgSend(v5, "setInvalidationHandler:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue", v13, v14, v15, v16));
    objc_msgSend(v5, "_setQueue:", v10);

    objc_msgSend(v5, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v11 = (id)qword_100037288;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 134217984;
      *(id *)((char *)location + 4) = (id)(int)objc_msgSend(v5, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "### Unentitled process %llu attempted to connect", (uint8_t *)location, 0xCu);
    }

  }
  return v6;
}

- (BOOL)_connectionMayConnect:(id)a3
{
  return -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", a3, 0);
}

- (SWCManager)initWithDatabase:(id)a3
{
  id v5;
  SWCManager *v6;
  SWCManager *v7;
  SWCDownloader *v8;
  SWCDownloader *downloader;
  SWCDownloadScheduler *v10;
  SWCDownloadScheduler *downloadScheduler;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SWCManager;
  v6 = -[SWCManager init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = objc_alloc_init(SWCDownloader);
    downloader = v7->_downloader;
    v7->_downloader = v8;

    -[SWCDownloader setDelegate:](v7->_downloader, "setDelegate:", v7);
    v10 = -[SWCDownloadScheduler initWithDownloader:database:]([SWCDownloadScheduler alloc], "initWithDownloader:database:", v7->_downloader, v7->_database);
    downloadScheduler = v7->_downloadScheduler;
    v7->_downloadScheduler = v10;

  }
  return v7;
}

+ (id)new
{
  abort();
}

- (SWCManager)init
{
  abort();
}

+ (id)beginListening
{
  if (qword_100037280 != -1)
    dispatch_once(&qword_100037280, &stru_100030E48);
  return (id)qword_100037278;
}

- (void)receiveSIGTERMSignal
{
  -[SWCDownloader receiveSIGTERMSignal](self->_downloader, "receiveSIGTERMSignal");
  -[SWCDatabase receiveSIGTERMSignal](self->_database, "receiveSIGTERMSignal");
}

- (void)updateEntriesForAllBundlesIgnoringCurrentState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  SWCEnterpriseContext *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  _BOOL8 v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;

  v3 = a3;
  v34 = (void *)os_transaction_create("com.apple.swc.enumerate-apps");
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v35 = 0;
  objc_msgSend(v6, "getKnowledgeUUID:andSequenceNumber:", 0, &v35);
  v7 = v35;

  v8 = objc_claimAutoreleasedReturnValue(-[SWCDatabase launchServicesDatabaseGeneration](self->_database, "launchServicesDatabaseGeneration"));
  v9 = (void *)v8;
  if (v7 && v8 && (objc_msgSend(v7, "isEqual:", v8, v34) & 1) != 0)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v10 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v37 = (uint64_t)v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "LS database generation is still %{public}@. No need to synchronize the SWC database to it.", buf, 0xCu);
    }
    v11 = 0;
  }
  else
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v12 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = (uint64_t)v9;
      v38 = 2114;
      v39 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "LS database generation has changed %{public}@ to %{public}@. Synchronizing SWC database to it.", buf, 0x16u);
    }
    v11 = 1;
  }

  v13 = objc_alloc_init(SWCEnterpriseContext);
  v14 = objc_claimAutoreleasedReturnValue(-[SWCEnterpriseContext state](v13, "state"));
  v15 = objc_claimAutoreleasedReturnValue(-[SWCDatabase enterpriseState](self->_database, "enterpriseState"));
  v16 = (void *)v15;
  if (!(v14 | v15))
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v21 = qword_100037288;
    if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v18 = "Enterprise state is still nil. No need to synchronize the SWC database to it.";
    v19 = v21;
    v20 = 2;
    goto LABEL_46;
  }
  if (v14 && v15 && (objc_msgSend((id)v14, "isEqual:", v15) & 1) != 0)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v17 = qword_100037288;
    if (!os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
      goto LABEL_25;
    *(_DWORD *)buf = 138543362;
    v37 = v14;
    v18 = "Enterprise state is still %{public}@. No need to synchronize the SWC database to it.";
    v19 = v17;
    v20 = 12;
LABEL_46:
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, buf, v20);
LABEL_25:
    v22 = 0;
    goto LABEL_31;
  }
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v23 = qword_100037288;
  if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v37 = (uint64_t)v16;
    v38 = 2114;
    v39 = v14;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Enterprise state has changed %{public}@ to %{public}@. Synchronizing SWC database to it.", buf, 0x16u);
  }
  v22 = 1;
LABEL_31:

  if (v3)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v24 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Was asked to resynchronize the entire SWC database regardless of current state.", buf, 2u);
    }
  }
  else if ((v11 | v22) != 1)
  {
    goto LABEL_44;
  }
  v25 = objc_alloc_init((Class)NSMutableOrderedSet);
  v26 = -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled");
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v27 = qword_100037288;
  if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v37) = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Developer mode enabled: %{BOOL}i", buf, 8u);
  }
  v28 = objc_autoreleasePoolPush();
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0));
  objc_msgSend(v29, "setErrorHandler:", &stru_100030E88);
  -[SWCManager _addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:](self, "_addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:", v29, v25, v13, v26);

  objc_autoreleasePoolPop(v28);
  v30 = objc_autoreleasePoolPush();
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _eligibleSystemPlaceholderRecords](self, "_eligibleSystemPlaceholderRecords"));
  if (objc_msgSend(v31, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectEnumerator"));
    -[SWCManager _addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:](self, "_addEntriesForAllBundlesWithEnumerator:toWorkingSet:enterpriseContext:developerModeEnabled:", v32, v25, v13, v26);

  }
  objc_autoreleasePoolPop(v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v33, "_LSClearSchemaCaches");

  -[SWCManager _updateAllEntries:](self, "_updateAllEntries:", v25);
  -[SWCDatabase setLaunchServicesDatabaseGeneration:](self->_database, "setLaunchServicesDatabaseGeneration:", v7);
  -[SWCDatabase setEnterpriseState:](self->_database, "setEnterpriseState:", v14);

LABEL_44:
  objc_autoreleasePoolPop(v5);

}

- (void)downloader:(id)a3 willDownloadAASAFileFromDomain:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014D40;
  v8[3] = &unk_1000307C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)downloader:(id)a3 didDownloadAASAFileContainingJSONObject:(id)a4 fromDomain:(id)a5 downloadRoute:(unsigned __int8)a6
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014E58;
  block[3] = &unk_100030DC8;
  block[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);

}

- (void)downloader:(id)a3 failedToDownloadAASAFileFromDomain:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(+[SWCDatabase queue](SWCDatabase, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014FD4;
  block[3] = &unk_100030DC8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  _QWORD v6[4];
  SWCManager *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015250;
  v6[3] = &unk_100030F10;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[SWCManager _waitForSiteApprovalWithServiceSpecifier:completionHandler:](v7, "_waitForSiteApprovalWithServiceSpecifier:completionHandler:", a3, v6);

}

- (void)getDetailsWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 callerAuditToken:(id)a6 completionHandler:(id)a7
{
  id v12;
  void (**v13)(id, id, _QWORD);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v25 = a3;
  v27 = a4;
  v12 = a6;
  v13 = (void (**)(id, id, _QWORD))a7;
  if (v12 && (v14 = objc_retainAutorelease(v12), !strcmp((const char *)objc_msgSend(v14, "objCType"), "{?=[8I]}")))
  {
    objc_msgSend(v14, "getValue:size:", &v35, 32);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v25));
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "auditToken");
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
    }
    v35 = v33;
    v36 = v34;

  }
  v32[0] = v35;
  v32[1] = v36;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _entriesWithServiceSpecifier:URL:limit:auditToken:](self, "_entriesWithServiceSpecifier:URL:limit:auditToken:", v25, v27, a5, v32, v25));
  v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _serviceDetailsWithEntry:](self, "_serviceDetailsWithEntry:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i)));
        if (v23)
          objc_msgSend(v18, "addObject:", v23);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v20);
  }

  v24 = objc_msgSend(v18, "copy");
  v13[2](v13, v24, 0);

}

- (void)addServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  SWCEntry *v16;
  SWCFields *v17;
  SWCDatabase *database;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];
  _QWORD v35[3];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v8, 1);

  if ((v9 & 1) != 0)
  {
    if (v6
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SWCApplicationIdentifier")),
          v10,
          v10))
    {
      v11 = objc_alloc((Class)LSApplicationRecord);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
      v13 = objc_msgSend(v11, "initWithBundleIdentifier:allowPlaceholder:error:", v12, 0, 0);

      if ((v13
         || (v14 = objc_alloc((Class)LSApplicationExtensionRecord),
             v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier")),
             v13 = objc_msgSend(v14, "initWithBundleIdentifier:error:", v15, 0),
             v15,
             v13))
        && (objc_msgSend(v6, "isFullySpecified") & 1) == 0)
      {
        -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:](self, "updateEntriesForAllBundlesIgnoringCurrentState:", 0);
        v7[2](v7, 1, 0);
      }
      else if (objc_msgSend(v6, "isFullySpecified"))
      {
        v16 = (SWCEntry *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v6));
        if (!v16)
        {
          v16 = objc_retainAutorelease(-[SWCEntry initWithServiceSpecifier:]([SWCEntry alloc], "initWithServiceSpecifier:", v6));
          v17 = -[SWCEntry fields](v16, "fields");
          *(_WORD *)v17 = *(_WORD *)v17 & 0xE3FF | 0x800;
          database = self->_database;
          v19 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithObject:", v16);
          -[SWCDatabase addEntries:](database, "addEntries:", v19);

        }
        v7[2](v7, 1, 0);

      }
      else
      {
        v26 = objc_alloc((Class)NSError);
        v32[0] = CFSTR("Line");
        v32[1] = CFSTR("Function");
        v33[0] = &off_1000328B8;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
        v33[1] = v27;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
        v29 = objc_msgSend(v26, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3, v28);
        ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v29);

      }
    }
    else
    {
      v23 = objc_alloc((Class)NSError);
      v30[0] = CFSTR("Line");
      v30[1] = CFSTR("Function");
      v31[0] = &off_1000328D0;
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
      v31[1] = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));
      v25 = objc_msgSend(v23, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v24);
      ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v25);

    }
  }
  else
  {
    v20 = objc_alloc((Class)NSError);
    v35[0] = &off_1000328A0;
    v34[0] = CFSTR("Line");
    v34[1] = CFSTR("Function");
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addServiceWithServiceSpecifier:completionHandler:]"));
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v13;
    v35[2] = CFSTR("Entitlement required to mutate SWC database");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
    v22 = objc_msgSend(v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v21);
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v22);

  }
}

- (void)removeServiceWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  unsigned __int8 v9;
  id v10;
  SWCDatabase *database;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  uint8_t buf[4];
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v9 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v8, 1);

  if ((v9 & 1) != 0)
  {
    if (v6)
    {
      v10 = objc_alloc_init((Class)NSMutableOrderedSet);
      database = self->_database;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100015FD4;
      v25[3] = &unk_100030F38;
      v12 = v10;
      v26 = v12;
      -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:](database, "enumerateEntriesMatchingServiceSpecifier:block:", v6, v25);
      if (objc_msgSend(v12, "count"))
      {
        -[SWCDatabase removeEntries:](self->_database, "removeEntries:", v12);
LABEL_5:
        v7[2](v7, 1, 0);
LABEL_16:
        v14 = v26;
        goto LABEL_17;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceType"));
      if (v18 || (v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SWCApplicationIdentifier"))) != 0)
      {

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SWCDomain"));

        if (!v24)
          goto LABEL_5;
      }
      if (qword_100037290 != -1)
        dispatch_once(&qword_100037290, &stru_1000311C0);
      v19 = qword_100037288;
      if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Service '%@' not found to remove", buf, 0xCu);
      }
      v20 = objc_alloc((Class)NSError);
      v29[0] = CFSTR("Line");
      v29[1] = CFSTR("Function");
      v30[0] = &off_100032900;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
      v30[1] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
      v23 = objc_msgSend(v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3, v22);
      ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v23);

      goto LABEL_16;
    }
    v16 = objc_alloc((Class)NSError);
    v27[0] = CFSTR("Line");
    v27[1] = CFSTR("Function");
    v28[0] = &off_100032918;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
    v28[1] = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v17 = objc_msgSend(v16, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v14);
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v17);

  }
  else
  {
    v13 = objc_alloc((Class)NSError);
    v34[0] = &off_1000328E8;
    v33[0] = CFSTR("Line");
    v33[1] = CFSTR("Function");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeServiceWithServiceSpecifier:completionHandler:]"));
    v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v12;
    v34[2] = CFSTR("Entitlement required to mutate SWC database");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
    v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v14);
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v15);

  }
LABEL_17:

}

- (void)setDetails:(id)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  void *v11;
  unsigned __int8 v12;
  SWCEntry *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  SWCDatabase *database;
  id v26;
  uint64_t v27;
  _QWORD v28[2];
  uint8_t buf[4];
  SWCEntry *v30;
  __int16 v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1);

  if ((v12 & 1) == 0)
  {
    v17 = objc_alloc((Class)NSError);
    v34[0] = &off_100032930;
    v33[0] = CFSTR("Line");
    v33[1] = CFSTR("Function");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]"));
    v33[2] = NSDebugDescriptionErrorKey;
    v34[1] = v18;
    v34[2] = CFSTR("Entitlement required to mutate SWC database");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
    v20 = objc_msgSend(v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v19);
    v10[2](v10, 0, v20);
LABEL_11:

    goto LABEL_20;
  }
  if (!objc_msgSend(v9, "isFullySpecified"))
  {
    v21 = objc_alloc((Class)NSError);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDetails:forServiceWithServiceSpecifier:completionHandler:]", CFSTR("Line"), CFSTR("Function"), &off_100032948));
    v28[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, &v27, 2));
    v20 = objc_msgSend(v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v19);
    v10[2](v10, 0, v20);
    goto LABEL_11;
  }
  v13 = (SWCEntry *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v9));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPatternList patternListWithDetailsDictionary:](_SWCPatternList, "patternListWithDetailsDictionary:", v8));
    -[SWCEntry setPatterns:](v13, "setPatterns:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:](_SWCSubstitutionVariableList, "substitutionVariableListWithDictionary:", v8));
    -[SWCEntry setSubstitutionVariables:](v13, "setSubstitutionVariables:", v15);

    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v16 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Set details on %@: %@", buf, 0x16u);
    }
    -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  }
  else
  {
    v13 = -[SWCEntry initWithServiceSpecifier:]([SWCEntry alloc], "initWithServiceSpecifier:", v9);
    if (v8)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPatternList patternListWithDetailsDictionary:](_SWCPatternList, "patternListWithDetailsDictionary:", v8));
      -[SWCEntry setPatterns:](v13, "setPatterns:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:](_SWCSubstitutionVariableList, "substitutionVariableListWithDictionary:", v8));
      -[SWCEntry setSubstitutionVariables:](v13, "setSubstitutionVariables:", v23);

    }
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v24 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v13;
      v31 = 2112;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Added %@ with details: %@", buf, 0x16u);
    }
    database = self->_database;
    v26 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithObject:", v13);
    -[SWCDatabase addEntries:](database, "addEntries:", v26);

  }
  v10[2](v10, 1, 0);
LABEL_20:

}

- (void)setUserApprovalState:(unsigned __int8)a3 forServiceWithServiceSpecifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, uint64_t, id);
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  SWCDatabase *database;
  _QWORD v22[5];
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[3];
  _QWORD v31[3];

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v10, 1);

  if ((v11 & 1) == 0)
  {
    v17 = objc_alloc((Class)NSError);
    v31[0] = &off_100032960;
    v30[0] = CFSTR("Line");
    v30[1] = CFSTR("Function");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]"));
    v30[2] = NSDebugDescriptionErrorKey;
    v31[1] = v18;
    v31[2] = CFSTR("Entitlement required to mutate SWC database");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    v16 = objc_msgSend(v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v19);

    goto LABEL_5;
  }
  if (v6 >= 3)
  {
    v12 = objc_alloc((Class)NSError);
    v29[0] = &off_100032978;
    v28[0] = CFSTR("Line");
    v28[1] = CFSTR("Function");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setUserApprovalState:forServiceWithServiceSpecifier:completionHandler:]"));
    v29[1] = v13;
    v29[2] = CFSTR("Unknown approval state specified by caller");
    v28[2] = NSDebugDescriptionErrorKey;
    v28[3] = CFSTR("ApprovalState");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v6));
    v29[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 4));
    v16 = objc_msgSend(v12, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v15);

LABEL_5:
    v20 = 0;
    goto LABEL_9;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  database = self->_database;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100016874;
  v22[3] = &unk_100030F60;
  v22[4] = &v24;
  v23 = v6;
  -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:](database, "enumerateEntriesMatchingServiceSpecifier:block:", v8, v22);
  if (*((_BYTE *)v25 + 24))
    -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  _Block_object_dispose(&v24, 8);
  v16 = 0;
  v20 = 1;
LABEL_9:
  v9[2](v9, v20, v16);

}

- (void)addAllAppsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _BOOL8, id);
  void *v5;
  _BOOL8 v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[3];
  _QWORD v14[3];

  v4 = (void (**)(id, _BOOL8, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v5, 1);

  if (v6)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v7 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Add all apps", v12, 2u);
    }
    v8 = 0;
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:](self, "updateEntriesForAllBundlesIgnoringCurrentState:", 1);
  }
  else
  {
    v9 = objc_alloc((Class)NSError);
    v14[0] = &off_100032990;
    v13[0] = CFSTR("Line");
    v13[1] = CFSTR("Function");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager addAllAppsWithCompletionHandler:]"));
    v13[2] = NSDebugDescriptionErrorKey;
    v14[1] = v10;
    v14[2] = CFSTR("Entitlement required to mutate SWC database");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
    v8 = objc_msgSend(v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v11);

  }
  v4[2](v4, v6, v8);

}

- (void)showWithVerbosity:(unsigned __int8)a3 isTTY:(BOOL)a4 fileDescriptor:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  unsigned int v8;
  id v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  int v13;
  FILE *v14;
  NSNumber *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SWCDatabase *database;
  id v26;
  SWCDownloader *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  SWCDownloader *downloader;
  id v33;
  void *v34;
  SWCDatabase *v35;
  id v36;
  SWCDatabase *v37;
  id v38;
  void **v39;
  void **v40;
  unint64_t v41;
  uint64_t v42;
  FILE *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD);
  id v55;
  void *context;
  id v57;
  id v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  __n128 (*v63)(__n128 *, __n128 *);
  void (*v64)(uint64_t);
  void *v65;
  _QWORD v66[3];
  _QWORD v67[4];
  id v68;
  _QWORD v69[6];
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  char v73;
  _QWORD v74[4];
  id v75;
  FILE *v76;
  _QWORD v77[6];
  char v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  Block_layout *v83;
  void **v84;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  if (v10)
  {
    if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_fd)
    {
      v12 = xpc_fd_dup(v10);
      v13 = v12;
      if ((v12 & 0x80000000) == 0)
      {
        if (v7)
          _SWCForceTTY(v12);
        v14 = fdopen(v13, "w");
        if (v14)
        {
          context = objc_autoreleasePoolPush();
          v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          _SWCLogValueForKey(v14, CFSTR("PID"), v16, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase storageURL](self->_database, "storageURL"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
          _SWCLogValueForKey(v14, CFSTR("Storage"), v18, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

          if (v8)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
            _SWCLogValueForKey(v14, CFSTR("Settings Generation"), v19, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase launchServicesDatabaseGeneration](self->_database, "launchServicesDatabaseGeneration"));
            _SWCLogValueForKey(v14, CFSTR("LS Generation"), v20, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            v21 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase enterpriseState](self->_database, "enterpriseState"));
            v22 = v21;
            if (v21)
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "base64EncodedStringWithOptions:", 0));
            else
              v23 = 0;

            _SWCLogValueForKey(v14, CFSTR("Enterprise SHA"), v23, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled")));
            _SWCLogValueForKey(v14, CFSTR("Developer Mode"), v24, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

          }
          _SWCLogHeader(v14, CFSTR("Database"));
          v79 = 0;
          v80 = &v79;
          v81 = 0x2020000000;
          v82 = 0;
          database = self->_database;
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_1000173C0;
          v77[3] = &unk_100030F88;
          v77[4] = &v79;
          v77[5] = v14;
          v78 = v8;
          -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", v77);
          if (!*((_BYTE *)v80 + 24))
            _SWCLogLine(v14, CFSTR("(empty)"), 8, 0xFFFFFFFFLL);
          _SWCLogHeader(v14, CFSTR("Network"));
          if (v8 < 2)
          {
            v31 = objc_alloc_init((Class)NSMutableArray);
            downloader = self->_downloader;
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472;
            v71[2] = sub_1000175B4;
            v71[3] = &unk_100030FD8;
            v73 = v8;
            v33 = v31;
            v72 = v33;
            -[SWCDownloader enumerateActiveAASAFileDownloadsWithBlock:](downloader, "enumerateActiveAASAFileDownloadsWithBlock:", v71);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", ")));
            _SWCLogLine(v14, v34, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

            if (!v8)
            {
LABEL_41:
              _Block_object_dispose(&v79, 8);
              objc_autoreleasePoolPop(context);
              fclose(v14);
              goto LABEL_3;
            }
          }
          else
          {
            v26 = objc_alloc_init((Class)NSByteCountFormatter);
            v27 = self->_downloader;
            v74[0] = _NSConcreteStackBlock;
            v74[1] = 3221225472;
            v74[2] = sub_10001743C;
            v74[3] = &unk_100030FB0;
            v75 = v26;
            v76 = v14;
            v28 = v26;
            -[SWCDownloader enumerateActiveAASAFileDownloadsWithBlock:](v27, "enumerateActiveAASAFileDownloadsWithBlock:", v74);

            _SWCLogHeader(v14, CFSTR("Preferences"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "descriptionOfAllPrefs"));
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472;
            v70[2] = sub_1000176C4;
            v70[3] = &unk_100030FF8;
            v70[4] = v14;
            objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v70);

          }
          _SWCLogHeader(v14, CFSTR("Settings"));
          v60 = 0;
          v61 = &v60;
          v62 = 0x2020000000;
          LOBYTE(v63) = 0;
          v35 = self->_database;
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_1000176D4;
          v69[3] = &unk_100031020;
          v69[4] = &v60;
          v69[5] = v14;
          -[SWCDatabase enumerateSettingsDictionariesWithBlock:](v35, "enumerateSettingsDictionariesWithBlock:", v69);
          if (!*((_BYTE *)v61 + 24))
            _SWCLogLine(v14, CFSTR("(empty)"), 8, 0xFFFFFFFFLL);
          _Block_object_dispose(&v60, 8);
          _SWCLogHeader(v14, CFSTR("Memory Usage"));
          v36 = objc_alloc_init((Class)NSMutableDictionary);
          v37 = self->_database;
          v67[0] = _NSConcreteStackBlock;
          v67[1] = 3221225472;
          v67[2] = sub_100017798;
          v67[3] = &unk_100030F38;
          v38 = v36;
          v68 = v38;
          v58 = v38;
          -[SWCDatabase enumerateEntriesWithBlock:](v37, "enumerateEntriesWithBlock:", v67);
          v60 = 0;
          v61 = &v60;
          v62 = 0x4812000000;
          v63 = sub_1000178E8;
          v64 = sub_10001790C;
          v65 = &unk_10002DD9E;
          memset(v66, 0, sizeof(v66));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_100017934;
          v59[3] = &unk_100031048;
          v59[4] = &v60;
          objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v59);
          v39 = (void **)v61[6];
          v40 = (void **)v61[7];
          v41 = 126 - 2 * __clz(((char *)v40 - (char *)v39) >> 4);
          v83 = &stru_100031088;
          if (v40 == v39)
            v42 = 0;
          else
            v42 = v41;
          sub_10001BEC0(v39, v40, (uint64_t)&v83, v42, 1);

          if (v61[6] == v61[7])
          {
            _SWCLogLine(v14, CFSTR("(empty)"), 8, 0xFFFFFFFFLL);
          }
          else
          {
            v54 = v11;
            v55 = v10;
            v43 = v14;
            v44 = v8;
            v57 = objc_alloc_init((Class)NSByteCountFormatter);
            v45 = v61[6];
            v46 = v61[7];
            while (v45 != v46)
            {
              if (*(_QWORD *)(v45 + 8))
              {
                v47 = *(id *)v45;
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(v45 + 8)));
                v49 = *(_QWORD *)(v45 + 8);
                if (v49 > 0x2000)
                  v50 = 0;
                else
                  v50 = 0xFFFFFFFFLL;
                if (v49 <= 0x2000)
                  v51 = 0xFFFFFFFFLL;
                else
                  v51 = 220;
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description"));
                if (v44 <= 1)
                {
                  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringForObjectValue:", v48));
                  _SWCLogValueForKey(v43, v52, v53, v50, v51);

                }
                else
                {
                  _SWCLogValueForKey(v43, v52, v48, v50, v51);
                }

                v38 = v58;
              }
              v45 += 16;
            }

            v14 = v43;
            v11 = v54;
            v10 = v55;
          }
          _Block_object_dispose(&v60, 8);
          v84 = (void **)v66;
          sub_10001BE54(&v84);

          goto LABEL_41;
        }
      }
    }
  }
LABEL_3:
  _SWCForceTTY(0xFFFFFFFFLL);
  v11[2](v11);

}

- (void)resetWithCompletionHandler:(id)a3
{
  uint64_t (**v4)(id, id, id);
  void *v5;
  unsigned __int8 v6;
  SWCDatabase *database;
  _BOOL8 v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[3];
  _QWORD v16[3];

  v4 = (uint64_t (**)(id, id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v6 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v5, 1);

  if ((v6 & 1) != 0)
  {
    -[SWCDatabase removeAllEntries](self->_database, "removeAllEntries");
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:](self, "updateEntriesForAllBundlesIgnoringCurrentState:", 1);
    database = self->_database;
    v14 = 0;
    v8 = -[SWCDatabase saveReturningError:](database, "saveReturningError:", &v14);
    v9 = v14;
    v10 = v4[2](v4, (id)v8, v9);
    xpc_transaction_exit_clean(v10);
  }
  else
  {
    v11 = objc_alloc((Class)NSError);
    v16[0] = &off_1000329A8;
    v15[0] = CFSTR("Line");
    v15[1] = CFSTR("Function");
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager resetWithCompletionHandler:]"));
    v15[2] = NSDebugDescriptionErrorKey;
    v16[1] = v9;
    v16[2] = CFSTR("Entitlement required to mutate SWC database");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
    v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v12);
    v4[2](v4, 0, v13);

  }
}

- (void)getServiceSettingsWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsDictionaryForServiceSpecifier:](self->_database, "settingsDictionaryForServiceSpecifier:", v6));
  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v6));

    if (!v9)
    {
      v14 = objc_alloc((Class)NSError);
      v18[0] = &off_1000329C0;
      v17[0] = CFSTR("Line");
      v17[1] = CFSTR("Function");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager getServiceSettingsWithServiceSpecifier:completionHandler:]"));
      v17[2] = NSDebugDescriptionErrorKey;
      v18[1] = v15;
      v18[2] = CFSTR("No services match the service specifier, so settings cannot be saved for it.");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
      v13 = objc_msgSend(v14, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3, v16);

      v8 = 0;
      v12 = 0;
      goto LABEL_5;
    }
    v8 = &__NSDictionary0__struct;
  }
  v10 = objc_alloc((Class)_SWCServiceSettings);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  v12 = objc_msgSend(v10, "_initWithServiceSpecifier:dictionary:generation:", v6, v8, v11);

  v13 = 0;
LABEL_5:
  v7[2](v7, v12, v13);

}

- (void)commitServiceSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  SWCDatabase *database;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[3];
  _QWORD v30[3];

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v10 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v9, 1);

  if ((v10 & 1) == 0)
  {
    v17 = objc_alloc((Class)NSError);
    v30[0] = &off_1000329D8;
    v29[0] = CFSTR("Line");
    v29[1] = CFSTR("Function");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager commitServiceSettings:completionHandler:]"));
    v29[2] = NSDebugDescriptionErrorKey;
    v30[1] = v18;
    v30[2] = CFSTR("Entitlement required to mutate SWC database");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    v20 = objc_msgSend(v17, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v19);

LABEL_7:
    v16 = 0;
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "generation"));
  v12 = objc_msgSend(v11, "isEqual:", v8);

  if ((v12 & 1) == 0)
  {
    v21 = objc_alloc((Class)NSError);
    v28[0] = &off_1000329F0;
    v27[0] = CFSTR("Line");
    v27[1] = CFSTR("Function");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager commitServiceSettings:completionHandler:]"));
    v28[1] = v22;
    v28[2] = CFSTR("Settings conflict detected. Try again.");
    v27[2] = NSDebugDescriptionErrorKey;
    v27[3] = CFSTR("Generation");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "generation"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description"));
    v28[3] = v24;
    v27[4] = CFSTR("ExpectedGeneration");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    v28[4] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 5));
    v20 = objc_msgSend(v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1000, v26);

    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceSpecifier"));
  if (v13)
  {
    database = self->_database;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionaryRepresentation"));
    -[SWCDatabase setSettingsDictionary:forServiceSpecifier:](database, "setSettingsDictionary:forServiceSpecifier:", v15, v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase settingsGeneration](self->_database, "settingsGeneration"));
  }
  else
  {
    v16 = 0;
  }

  v20 = 0;
LABEL_10:
  v7[2](v7, v16, v20);

}

- (void)removeSettingsForKeys:(id)a3 serviceType:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1);

  if ((v12 & 1) == 0)
  {
    v15 = objc_alloc((Class)NSError);
    v23[0] = &off_100032A08;
    v22[0] = CFSTR("Line");
    v22[1] = CFSTR("Function");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]"));
    v22[2] = NSDebugDescriptionErrorKey;
    v23[1] = v16;
    v23[2] = CFSTR("Entitlement required to mutate SWC database");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3));
    v18 = objc_msgSend(v15, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v17);
LABEL_8:
    v13 = v18;

    v14 = 0;
    goto LABEL_9;
  }
  if (!v9 || v8 && (_NSIsNSSet(v8) & 1) == 0)
  {
    v19 = objc_alloc((Class)NSError);
    v20[0] = CFSTR("Line");
    v20[1] = CFSTR("Function");
    v21[0] = &off_100032A20;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceType:completionHandler:]"));
    v21[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v18 = objc_msgSend(v19, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v17);
    goto LABEL_8;
  }
  v13 = 0;
  -[SWCDatabase removeSettingsForKeys:serviceType:](self->_database, "removeSettingsForKeys:serviceType:", v8, v9);
  v14 = 1;
LABEL_9:
  v10[2](v10, v14, v13);

}

- (void)removeSettingsForKeys:(id)a3 serviceSpecifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, void *);
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];
  _QWORD v26[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v12 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1);

  if ((v12 & 1) == 0)
  {
    v20 = objc_alloc((Class)NSError);
    v26[0] = &off_100032A38;
    v25[0] = CFSTR("Line");
    v25[1] = CFSTR("Function");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]"));
    v25[2] = NSDebugDescriptionErrorKey;
    v26[1] = v17;
    v26[2] = CFSTR("Entitlement required to mutate SWC database");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
    v19 = objc_msgSend(v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v18);
    goto LABEL_8;
  }
  if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "serviceType"));
    v14 = v13;
    if (v13)
    {
      if (v8)
      {
        v15 = _NSIsNSSet(v8);

        if ((v15 & 1) == 0)
          goto LABEL_6;
      }
      else
      {

      }
      v21 = 0;
      -[SWCDatabase removeSettingsForKeys:serviceSpecifier:](self->_database, "removeSettingsForKeys:serviceSpecifier:", v8, v9);
      v22 = 1;
      goto LABEL_9;
    }
  }
LABEL_6:
  v16 = objc_alloc((Class)NSError);
  v23[0] = CFSTR("Line");
  v23[1] = CFSTR("Function");
  v24[0] = &off_100032A50;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager removeSettingsForKeys:serviceSpecifier:completionHandler:]"));
  v24[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
  v19 = objc_msgSend(v16, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v18);
LABEL_8:
  v21 = v19;

  v22 = 0;
LABEL_9:
  v10[2](v10, v22, v21);

}

- (void)getDeveloperModeEnabledWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(id, void *, _QWORD);

  v5 = (void (**)(id, void *, _QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled")));
  v5[2](v5, v4, 0);

}

- (void)setDeveloperModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  _QWORD v16[5];
  void (**v17)(id, uint64_t, _QWORD);
  _QWORD v18[3];
  _QWORD v19[3];

  v4 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = -[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v7, 1);

  if ((v8 & 1) != 0)
  {
    if (-[SWCManager _isDeveloperModeEnabled](self, "_isDeveloperModeEnabled") == v4)
    {
      v6[2](v6, 1, 0);
    }
    else if (v4)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100018D24;
      v16[3] = &unk_1000310D8;
      v16[4] = self;
      v17 = v6;
      -[SWCManager _authorizeDeveloperModeChangeWithCompletionHandler:](self, "_authorizeDeveloperModeChangeWithCompletionHandler:", v16);

    }
    else
    {
      v15 = 0;
      v13 = -[SWCManager _setDeveloperModeEnabled:error:](self, "_setDeveloperModeEnabled:error:", 0, &v15);
      v14 = v15;
      ((void (**)(id, uint64_t, id))v6)[2](v6, v13, v14);

    }
  }
  else
  {
    v9 = objc_alloc((Class)NSError);
    v19[0] = &off_100032A68;
    v18[0] = CFSTR("Line");
    v18[1] = CFSTR("Function");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setDeveloperModeEnabled:completionHandler:]"));
    v18[2] = NSDebugDescriptionErrorKey;
    v19[1] = v10;
    v19[2] = CFSTR("Entitlement required to enable Associated Domains developer mode.");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
    v12 = objc_msgSend(v9, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v11);

    ((void (**)(id, uint64_t, id))v6)[2](v6, 0, v12);
  }

}

- (void)setAdditionalServiceDetailsForApplicationIdentifiers:(id)a3 usingContentsOfDictionary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _BOOL8, id);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _BOOL8 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (!-[SWCManager _connectionIsEntitled:forMutation:](self, "_connectionIsEntitled:forMutation:", v11, 1))
  {
    v18 = objc_alloc((Class)NSError);
    v35[0] = &off_100032A80;
    v34[0] = CFSTR("Line");
    v34[1] = CFSTR("Function");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    v34[2] = NSDebugDescriptionErrorKey;
    v35[1] = v12;
    v35[2] = CFSTR("Entitlement required to mutate SWC database");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 3));
    v19 = objc_msgSend(v18, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1, v13);
LABEL_12:
    v15 = v19;
    goto LABEL_13;
  }
  if (!v8 || !_NSIsNSSet(v8) || !objc_msgSend(v8, "count"))
  {
    v20 = objc_alloc((Class)NSError);
    v33[0] = &off_100032A98;
    v32[0] = CFSTR("Line");
    v32[1] = CFSTR("Function");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    v32[2] = NSDebugDescriptionErrorKey;
    v33[1] = v12;
    v33[2] = CFSTR("Invalid app ID list.");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 3));
    v19 = objc_msgSend(v20, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v13);
    goto LABEL_12;
  }
  if (!v9 || (_NSIsNSDictionary(v9) & 1) == 0)
  {
    v21 = objc_alloc((Class)NSError);
    v31[0] = &off_100032AB0;
    v30[0] = CFSTR("Line");
    v30[1] = CFSTR("Function");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager setAdditionalServiceDetailsForApplicationIdentifiers:usingContentsOfDictionary:completionHandler:]"));
    v30[2] = NSDebugDescriptionErrorKey;
    v31[1] = v12;
    v31[2] = CFSTR("Invalid domain-to-JSON dictionary.");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    v19 = objc_msgSend(v21, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v13);
    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _filterApplicationIdentifiers:toMatchEntitlementOfXPCConnection:](self, "_filterApplicationIdentifiers:toMatchEntitlementOfXPCConnection:", v8, v11));
  v27 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _createStagingDirectoryForAdditionalServiceDetailsReturningError:](self, "_createStagingDirectoryForAdditionalServiceDetailsReturningError:", &v27));
  v14 = v27;
  v15 = v14;
  if (!v13)
  {
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v26 = v14;
  v16 = -[SWCManager _addJSONDataInDictionary:toStagingDirectoryAtURL:error:](self, "_addJSONDataInDictionary:toStagingDirectoryAtURL:error:", v9, v13, &v26);
  v17 = v26;

  if (v16)
  {
    v25 = v17;
    v16 = -[SWCManager _copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:](self, "_copyStagingDirectoryAtURL:toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:error:", v13, v12, &v25);
    v15 = v25;

  }
  else
  {
    v15 = v17;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v22, "removeItemAtURL:error:", v13, 0);

  if (v16)
  {
    v23 = sub_100014968();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Updating all apps after updating additional service details for %@", buf, 0xCu);
    }

    v16 = 1;
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:](self, "updateEntriesForAllBundlesIgnoringCurrentState:", 1);
  }
LABEL_14:

  v10[2](v10, v16, v15);
}

- (SWCDatabase)database
{
  return (SWCDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_getProperty(self, a2, 32, 1);
}

- (SWCDownloadScheduler)downloadScheduler
{
  return (SWCDownloadScheduler *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadScheduler, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 8) = 0;
  return self;
}

- (void)_addEntriesForAllBundlesWithEnumerator:(id)a3 toWorkingSet:(id)a4 enterpriseContext:(id)a5 developerModeEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  context = objc_autoreleasePoolPush();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v17 = objc_autoreleasePoolPush();
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SWCEntry entriesForBundleRecord:enterpriseContext:developerModeEnabled:](SWCEntry, "entriesForBundleRecord:enterpriseContext:developerModeEnabled:", v16, v11, v6));
        if (objc_msgSend(v18, "count"))
          objc_msgSend(v10, "unionOrderedSet:", v18);

        objc_autoreleasePoolPop(v17);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_eligibleSystemPlaceholderRecords
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = objc_alloc_init((Class)NSMutableArray);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&off_100032BE0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(&off_100032BE0);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v7 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 1, 0);
        if (!v7)
        {
          v8 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifierOfSystemPlaceholder:error:", v6, 0);
          if (v8)
            objc_msgSend(v2, "addObject:", v8);

        }
      }
      v3 = objc_msgSend(&off_100032BE0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  return v2;
}

- (void)_updateAllEntries:(id)a3
{
  void *v3;
  SWCDatabase *database;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  NSObject *v14;
  SWCDownloader *downloader;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *context;
  id v33;
  id v34;
  id obj;
  id v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];

  v33 = a3;
  v34 = objc_alloc_init((Class)NSMutableOrderedSet);
  v37 = objc_alloc_init((Class)NSMutableOrderedSet);
  v3 = objc_autoreleasePoolPush();
  database = self->_database;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100019F6C;
  v43[3] = &unk_100030CE0;
  v5 = v33;
  v44 = v5;
  v36 = v34;
  v45 = v36;
  -[SWCDatabase enumerateEntriesWithBlock:](database, "enumerateEntriesWithBlock:", v43);

  objc_autoreleasePoolPop(v3);
  context = objc_autoreleasePoolPush();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entry:](self->_database, "entry:", v9));
        if (!v10)
        {
          objc_msgSend(v37, "addObject:", v9);
          goto LABEL_14;
        }
        v11 = objc_retainAutorelease(v9);
        v12 = *(unsigned __int16 *)objc_msgSend(v11, "fields");
        v13 = objc_retainAutorelease(v10);
        if (((*(unsigned __int16 *)objc_msgSend(v13, "fields") ^ v12) & 0x1C00) != 0)
        {
          objc_msgSend(v36, "addObject:", v13);
          objc_msgSend(v37, "addObject:", v11);
          if ((*(_WORD *)objc_msgSend(objc_retainAutorelease(v11), "fields") & 0x1C00) != 0)
            goto LABEL_19;
          if (qword_100037290 != -1)
            dispatch_once(&qword_100037290, &stru_1000311C0);
          v14 = qword_100037288;
          if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Entry %@ needs its JSON updated because it moved from on-disk to network", buf, 0xCu);
          }
          goto LABEL_14;
        }
        v18 = objc_retainAutorelease(v11);
        if ((*(_WORD *)objc_msgSend(v18, "fields") & 0x1C00) == 0xC00)
        {
          objc_msgSend(v36, "addObject:", v13);
          objc_msgSend(v37, "addObject:", v18);
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationPersistentIdentifier"));
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationPersistentIdentifier"));
          v21 = (void *)v20;
          if (!v19 || !v20)
            goto LABEL_37;
          v22 = _LSPersistentIdentifierCompare(v19, v20);

          if (!v22)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationVersion"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "applicationVersion"));
            if (objc_msgSend(v18, "isDownloadable") && objc_msgSend(v19, "isEqual:", v21))
            {
              if (qword_100037290 != -1)
                dispatch_once(&qword_100037290, &stru_1000311C0);
              v23 = qword_100037288;
              if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v13;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Entry %@ has moved databases but hasn't changed versions; we won't download new JSON right now",
                  buf,
                  0xCu);
              }

              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationPersistentIdentifier"));
              objc_msgSend(v13, "setApplicationPersistentIdentifier:", v16);
LABEL_16:

              goto LABEL_19;
            }
            if (qword_100037290 != -1)
              dispatch_once(&qword_100037290, &stru_1000311C0);
            v24 = qword_100037288;
            if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Entry %@ has moved databases, and it has changed versions or it is from on-disk, will update JSON", buf, 0xCu);
            }
LABEL_37:

LABEL_38:
            if (qword_100037290 != -1)
              dispatch_once(&qword_100037290, &stru_1000311C0);
            v25 = qword_100037288;
            if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v13;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Entry %@ needs its JSON updated because the app PI changed", buf, 0xCu);
            }
            objc_msgSend(v36, "addObject:", v13);
            objc_msgSend(v37, "addObject:", v18);
LABEL_14:
            if (!objc_msgSend(v9, "isDownloadable"))
              goto LABEL_19;
            downloader = self->_downloader;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));
            -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:](downloader, "downloadAASAFileForDomain:applicationIdentifier:completionHandler:", v16, v17, 0);

            goto LABEL_16;
          }
          if (v22 != 100)
            goto LABEL_38;
        }
LABEL_19:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      v6 = v26;
    }
    while (v26);
  }

  objc_autoreleasePoolPop(context);
  v27 = objc_autoreleasePoolPush();
  if (objc_msgSend(v36, "count"))
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v28 = (id)qword_100037288;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = objc_msgSend(v36, "count");
      *(_DWORD *)buf = 134218242;
      v47 = v30;
      v48 = 2112;
      v49 = v36;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Removing %llu entries: %@", buf, 0x16u);
    }

    -[SWCDatabase removeEntries:](self->_database, "removeEntries:", v36);
  }
  if (objc_msgSend(v37, "count"))
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v29 = (id)qword_100037288;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v31 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 134218242;
      v47 = v31;
      v48 = 2112;
      v49 = v37;
      _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Adding %llu entries: %@", buf, 0x16u);
    }

    -[SWCDatabase addEntries:](self->_database, "addEntries:", v37);
  }
  objc_autoreleasePoolPop(v27);
  if (objc_msgSend(v36, "count"))
    -[SWCDatabase cleanOldSettings](self->_database, "cleanOldSettings");
  -[SWCDatabase scheduleNextSave](self->_database, "scheduleNextSave");
  -[SWCDownloadScheduler update](self->_downloadScheduler, "update");

}

- (id)_entriesWithServiceSpecifier:(id)a3 URL:(id)a4 limit:(unint64_t)a5 auditToken:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  SWCDatabase *database;
  id v14;
  id v15;
  __int128 v16;
  id v17;
  id v18;
  id v19;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;

  v21 = a3;
  v9 = a4;
  if (v9)
    v10 = objc_msgSend(objc_alloc((Class)NSURLComponents), "initWithURL:resolvingAgainstBaseURL:", v9, 1, v21);
  else
    v10 = 0;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_alloc_init((Class)NSMutableArray);
  database = self->_database;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001A1D8;
  v24[3] = &unk_100031100;
  v14 = v21;
  v25 = v14;
  v15 = v10;
  v26 = v15;
  v16 = *(_OWORD *)&a6->var0[4];
  v28 = *(_OWORD *)a6->var0;
  v29 = v16;
  v17 = v12;
  v27 = v17;
  -[SWCDatabase enumerateEntriesMatchingServiceSpecifier:block:](database, "enumerateEntriesMatchingServiceSpecifier:block:", v14, v24);

  objc_autoreleasePoolPop(v11);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001A520;
  v22[3] = &unk_100031128;
  v18 = v15;
  v23 = v18;
  objc_msgSend(v17, "sortWithOptions:usingComparator:", 16, v22);
  v19 = objc_msgSend(v17, "copy");

  return v19;
}

- (id)_serviceDetailsWithEntry:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  v4 = objc_alloc((Class)_SWCServiceDetails);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceSpecifier"));
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v4, "_initWithServiceSpecifier:fields:", v5, objc_msgSend(v6, "fields"));

  return v7;
}

- (void)_waitForSiteApprovalWithServiceSpecifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SWCDownloader *downloader;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t DebugDescription;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  void (**v36)(id, _QWORD, id);
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  _QWORD v42[2];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (!objc_msgSend(v6, "isFullySpecified"))
  {
    v11 = objc_alloc((Class)NSError);
    v37[0] = CFSTR("Line");
    v37[1] = CFSTR("Function");
    v38[0] = &off_100032AF8;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
    v38[1] = v9;
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
    v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, 2, v12);
    v7[2](v7, 0, v13);
    goto LABEL_20;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDatabase entryMatchingServiceSpecifier:](self->_database, "entryMatchingServiceSpecifier:", v6));
  if (!v8)
  {
    v14 = objc_alloc((Class)NSError);
    v40[0] = &off_100032AE0;
    v39[0] = CFSTR("Line");
    v39[1] = CFSTR("Function");
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
    v39[2] = NSDebugDescriptionErrorKey;
    v40[1] = v12;
    v40[2] = CFSTR("The specified service was not found in the SWC database.");
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 3));
    v15 = objc_msgSend(v14, "initWithDomain:code:userInfo:", _SWCErrorDomain, 3, v13);
    v7[2](v7, 0, v15);

    v9 = 0;
    goto LABEL_20;
  }
  v9 = objc_retainAutorelease(v8);
  if ((*(_WORD *)objc_msgSend(v9, "fields") & 0xC) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "retryCount"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "retryCount"));
      v18 = objc_msgSend(v17, "unsignedIntegerValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
      v20 = objc_msgSend(v19, "maximumRetryCount");

      if (v18 > v20)
      {
        if (qword_100037290 != -1)
          dispatch_once(&qword_100037290, &stru_1000311C0);
        v21 = (id)qword_100037288;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "retryCount"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
          *(_DWORD *)buf = 138543874;
          v44 = v22;
          v45 = 2112;
          v46 = v9;
          v47 = 2048;
          v48 = (int)objc_msgSend(v23, "processIdentifier");
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Exhausted retry attempts (%{public}@) for entry %@; will not attempt to download it on behalf of an interested caller %llu",
            buf,
            0x20u);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastError"));
        v25 = v24;
        if (v24)
        {
          v12 = v24;
        }
        else
        {
          v28 = objc_alloc((Class)NSError);
          v41[0] = CFSTR("Line");
          v41[1] = CFSTR("Function");
          v42[0] = &off_100032AC8;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _waitForSiteApprovalWithServiceSpecifier:completionHandler:]"));
          v42[1] = v29;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2));
          v12 = objc_msgSend(v28, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v30);

        }
        v7[2](v7, 0, v12);
        goto LABEL_21;
      }
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SWCDomain"));
    downloader = self->_downloader;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "SWCApplicationIdentifier"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001AE84;
    v34[3] = &unk_100031178;
    v36 = v7;
    v9 = v9;
    v35 = v9;
    -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:completionHandler:](downloader, "downloadAASAFileForDomain:applicationIdentifier:completionHandler:", v12, v27, v34);

    v13 = v36;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v10 = (id)qword_100037288;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    DebugDescription = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v9), "fields") >> 2) & 3);
    v32 = (id)objc_claimAutoreleasedReturnValue(DebugDescription);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 138412802;
    v44 = v9;
    v45 = 2114;
    v46 = v32;
    v47 = 2048;
    v48 = (int)objc_msgSend(v33, "processIdentifier");
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Entry %@ already has approval state %{public}@, skipping download for interested caller %llu", buf, 0x20u);

  }
  ((void (**)(id, id, id))v7)[2](v7, v9, 0);
LABEL_22:

}

- (id)_developerModeSemaphoreURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLReturningError:", 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR(".developerMode"), 0));
  return v4;
}

- (void)_authorizeDeveloperModeChangeWithCompletionHandler:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (BOOL)_setDeveloperModeEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  uint8_t v18[8];
  _QWORD v19[3];
  _QWORD v20[3];

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _developerModeSemaphoreURL](self, "_developerModeSemaphoreURL"));
  if (!v7)
  {
    if (a4)
    {
      v11 = objc_alloc((Class)NSError);
      v20[0] = &off_100032B10;
      v19[0] = CFSTR("Line");
      v19[1] = CFSTR("Function");
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCManager(Private) _setDeveloperModeEnabled:error:]"));
      v19[2] = NSDebugDescriptionErrorKey;
      v20[1] = v12;
      v20[2] = CFSTR("Unable to find path to developer mode semaphore file.");
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));
      *a4 = objc_msgSend(v11, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v13);

    }
    return 0;
  }
  if (!v5)
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v14 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Disabling developer mode.", v18, 2u);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = objc_msgSend(v15, "removeItemAtURL:error:", v7, a4);

    if (!v16)
      return 0;
LABEL_16:
    self->_developerModeEnabled = (optional<BOOL>)(v5 | 0x100);
    -[SWCManager updateEntriesForAllBundlesIgnoringCurrentState:](self, "updateEntriesForAllBundlesIgnoringCurrentState:", 1);
    return 1;
  }
  if (qword_100037290 != -1)
    dispatch_once(&qword_100037290, &stru_1000311C0);
  v8 = qword_100037288;
  if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v18 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Enabling developer mode.", v18, 2u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v10 = objc_msgSend(v9, "writeToURL:options:error:", v7, 1, a4);

  if ((v10 & 1) != 0)
    goto LABEL_16;
  return 0;
}

- (BOOL)_isDeveloperModeEnabled
{
  unsigned int null_state;
  void *v4;
  void *v5;

  if (self->_developerModeEnabled.__engaged_)
  {
    null_state = self->_developerModeEnabled.var0.__null_state_;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCManager _developerModeSemaphoreURL](self, "_developerModeSemaphoreURL"));
    v5 = v4;
    if (v4)
      null_state = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);
    else
      null_state = 0;

    self->_developerModeEnabled = (optional<BOOL>)(null_state | 0x100);
  }
  return null_state != 0;
}

- (id)_filterApplicationIdentifiers:(id)a3 toMatchEntitlementOfXPCConnection:(id)a4
{
  unsigned int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[8];
  _BYTE v25[128];
  void *v26;

  v19 = a3;
  v18 = a4;
  v5 = objc_msgSend(v18, "processIdentifier");
  if (v5 == getpid())
  {
    if (qword_100037290 != -1)
      dispatch_once(&qword_100037290, &stru_1000311C0);
    v6 = qword_100037288;
    if (os_log_type_enabled((os_log_t)qword_100037288, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Treating connection from self as entitled (additional service details check)", buf, 2u);
    }
    v7 = v19;
    goto LABEL_24;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForEntitlement:", CFSTR("com.apple.private.swc.additional-service-details-provider")));
  if (objc_msgSend(v8, "isEqual:", CFSTR("*")))
  {
    v7 = v19;
LABEL_23:

    goto LABEL_24;
  }
  if (!v8)
  {
    v7 = 0;
    goto LABEL_24;
  }
  if ((_NSIsNSArray(v8) & 1) != 0
    || (v26 = v8,
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1)),
        v8,
        (v8 = v7) != 0))
  {
    v7 = objc_alloc_init((Class)NSMutableSet);
    v9 = objc_opt_class(_SWCApplicationIdentifier);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v19;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v14, v9) & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rawValue"));
            v16 = objc_msgSend(v8, "containsObject:", v15);

            if (v16)
              objc_msgSend(v7, "addObject:", v14);
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v11);
    }

    goto LABEL_23;
  }
LABEL_24:

  return v7;
}

- (id)_createStagingDirectoryForAdditionalServiceDetailsReturningError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  id v18;
  id v19;

  v4 = objc_autoreleasePoolPush();
  v5 = objc_alloc((Class)NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = objc_msgSend(v5, "initWithFormat:", CFSTR("AdditionalServiceDetails/staged-%@"), v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v19 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containerURLReturningError:", &v19));
  v11 = v19;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v8, 1));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = v11;
    v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v18);
    v15 = v18;

    if (v14)
      v16 = v12;
    else
      v16 = 0;
    v11 = v15;
  }
  else
  {
    v16 = 0;
  }

  objc_autoreleasePoolPop(v4);
  if (a3 && !v16)
    *a3 = objc_retainAutorelease(v11);

  return v16;
}

- (BOOL)_addJSONDataInDictionary:(id)a3 toStagingDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10001B9F0;
  v26 = sub_10001BA00;
  v27 = 0;
  v9 = objc_msgSend(v7, "count");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001BA08;
  v13[3] = &unk_1000311A0;
  v17 = objc_opt_class(_SWCDomain);
  v10 = v8;
  v14 = v10;
  v15 = &v22;
  v16 = &v18;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = (id)v19[3];
  if (a5 && v11 != v9)
    *a5 = objc_retainAutorelease((id)v23[5]);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11 == v9;
}

- (BOOL)_copyStagingDirectoryAtURL:(id)a3 toAdditionalServiceDetailsDirectoriesForApplicationIdentifiers:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned int v18;
  char *v21;
  id obj;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v23 = a3;
  v6 = a4;
  v21 = (char *)objc_msgSend(v6, "count");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v27;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
      v13 = objc_autoreleasePoolPush();
      v25 = v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SWCEntry additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:](SWCEntry, "additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:", v12, 1, &v25));
      v15 = v25;

      if (v14)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v16, "removeItemAtURL:error:", v14, 0);

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v24 = v15;
        v18 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v23, v14, &v24);
        v9 = v24;

        v8 += v18;
      }
      else
      {
        v18 = 0;
        v9 = v15;
      }

      objc_autoreleasePoolPop(v13);
      if (!v18)
        break;
      if (v7 == (id)++v11)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  if (a5 && v8 != v21)
    *a5 = objc_retainAutorelease(v9);

  return v8 == v21;
}

@end
