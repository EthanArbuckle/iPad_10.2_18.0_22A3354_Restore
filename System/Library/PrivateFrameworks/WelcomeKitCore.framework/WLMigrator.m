@implementation WLMigrator

- (void)dealloc
{
  objc_super v4;

  _WLLog();
  v4.receiver = self;
  v4.super_class = (Class)WLMigrator;
  -[WLMigrator dealloc](&v4, sel_dealloc, self);
}

- (void)connectionDidEnd
{
  id WeakRetained;

  _WLLog();
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeSocketHandler);
  objc_msgSend(WeakRetained, "cancel", self);

}

- (void)_deleteDownloadsPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v7);

  v6 = v7;
  if (v6)
    _WLLog();

}

- (void)_prepareMetadata:(id)a3 usingRetryPolicies:(BOOL)a4 allowContinuationFromAnotherDevice:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v20 = v8;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCommunicationDate:", v9);

    objc_msgSend(v20, "setAttemptCount:", 1);
    v8 = v20;
  }
  if (!v6 || (v10 = objc_msgSend(v8, "state"), v8 = v20, v10 != 3))
  {
    v11 = objc_msgSend(v8, "state");
    v8 = v20;
    if (v11)
    {
      v12 = objc_msgSend(v20, "state");
      v8 = v20;
      if (v12 <= 3)
      {
        objc_msgSend(v20, "communicationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", *(double *)");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "compare:", v15);

        if (v16 == -1)
        {
          _WLLog();
          objc_msgSend(v20, "setState:", 0, self, v17);
        }
        else if ((unint64_t)objc_msgSend(v20, "attemptCount") >= 2)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "attemptCount"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v20, "setState:", 0, self, v18);
        }

        v8 = v20;
      }
    }
  }
  if (objc_msgSend(v8, "state"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v20, "state"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    objc_msgSend(v20, "setAttemptCount:", objc_msgSend(v20, "attemptCount", self, v19) + 1);
  }
  else
  {
    objc_msgSend(v20, "setAttemptCount:", 1);
    objc_msgSend(v20, "setCrashCount:", 0);
  }

}

- (void)startMigrationWithSourceDevice:(id)a3 usingRetryPolicies:(BOOL)a4 delegate:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  id v12;
  id v13;

  v7 = a4;
  v13 = 0;
  v10 = a6;
  -[WLMigrator prepare:delegate:error:](self, "prepare:delegate:error:", a3, a5, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v12)
    -[WLMigrator _finishMigrationWithError:context:disconnected:completion:](self, "_finishMigrationWithError:context:disconnected:completion:", v12, v11, 0, v10);
  else
    -[WLMigrator startMigration:usingRetryPolicies:completion:](self, "startMigration:usingRetryPolicies:completion:", v11, v7, v10);

}

- (id)prepare:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  WLMigrationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  WLURLSessionController *v30;
  void *v31;
  int v32;
  WLLocalDataSource *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  WLRemoteDeviceDataSource *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  WLRemoteDeviceDataSource *v44;
  WLMigrationDataCoordinator *v45;
  void *v46;
  WLSQLController *v47;
  id v48;
  WLTimeEstimateAccuracyTracker *v49;
  void *v50;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(WLMigrationContext);
  -[WLMigrationContext setSourceDevice:](v10, "setSourceDevice:", v9);
  -[WLMigrationContext setDelegate:](v10, "setDelegate:", v8);

  objc_msgSend(v9, "apiLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAndroidAPILevel:", v11);

  objc_msgSend(v9, "brand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAndroidBrand:", v13);

  objc_msgSend(v9, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAndroidLocale:", v15);

  objc_msgSend(v9, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAndroidModel:", v17);

  objc_msgSend(v9, "osVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAndroidOSVersion:", v19);

  objc_msgSend(v9, "version");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrationContext payload](v10, "payload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAndroidVersion:", v21);

  objc_msgSend(v9, "versionCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLMigrationContext payload](v10, "payload");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAndroidVersionCode:", v23);

  -[WLMigrationContext payload](v10, "payload");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setState:", CFSTR("starting"));

  +[WLCredentialStore sharedInstance](WLCredentialStore, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "currentAuthentication");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27
    || (-[WLMigrationContext sourceDevice](v10, "sourceDevice"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "isLocal"),
        v28,
        (v29 & 1) != 0))
  {
    -[WLMigrationContext setPowerAssertion:](v10, "setPowerAssertion:", CPPowerAssertionCreate());
    v52 = -[WLMigrationContext powerAssertion](v10, "powerAssertion");
    _WLLog();
    v30 = -[WLURLSessionController initWithAuthentication:]([WLURLSessionController alloc], "initWithAuthentication:", v27, self, v52);
    -[WLMigrationContext setUrlSessionController:](v10, "setUrlSessionController:", v30);

    -[WLMigrationContext sourceDevice](v10, "sourceDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isLocal");

    if (v32)
    {
      v33 = objc_alloc_init(WLLocalDataSource);
      -[WLMigrationContext setDataSource:](v10, "setDataSource:", v33);

    }
    else if (self->_dataSource)
    {
      -[WLMigrationContext setDataSource:](v10, "setDataSource:");
    }
    else
    {
      v38 = [WLRemoteDeviceDataSource alloc];
      -[WLMigrationContext sourceDevice](v10, "sourceDevice");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "ipAddress");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrationContext sourceDevice](v10, "sourceDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "httpPort");
      -[WLMigrationContext urlSessionController](v10, "urlSessionController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "urlSession");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = -[WLRemoteDeviceDataSource initWithHost:port:session:](v38, "initWithHost:port:session:", v39, v41, v43);
      -[WLMigrationContext setDataSource:](v10, "setDataSource:", v44);

    }
    v45 = objc_alloc_init(WLMigrationDataCoordinator);
    -[WLMigrationContext setDataCoordinator:](v10, "setDataCoordinator:", v45);

    if ((v32 & 1) == 0 && +[WLMigrator stashDataLocally](WLMigrator, "stashDataLocally"))
    {
      -[WLMigrationContext dataCoordinator](v10, "dataCoordinator");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setStashDataLocally:", 1);

    }
    v47 = objc_alloc_init(WLSQLController);
    -[WLMigrationContext setSqlController:](v10, "setSqlController:", v47);

    v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[WLMigrationContext setThroughputSamples:](v10, "setThroughputSamples:", v48);

    v49 = objc_alloc_init(WLTimeEstimateAccuracyTracker);
    -[WLMigrationContext setTimeEstimateAccuracyTracker:](v10, "setTimeEstimateAccuracyTracker:", v49);

    -[WLMigrator migrators:](self, "migrators:", v10);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLMigrationContext setMigrators:](v10, "setMigrators:", v50);

  }
  else
  {
    -[WLMigrationContext payload](v10, "payload");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setState:", CFSTR("authentication_error"));

    if (a5)
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BEC2878];
      v54 = *MEMORY[0x24BDD0FC8];
      v55[0] = CFSTR("No device authentication");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 4, v37);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (void)startMigration:(id)a3 usingRetryPolicies:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  double v64;
  void *v65;
  WLMigrator *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v6 = a4;
  v73 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v67 = a5;
  _WLLog();
  v9 = +[WLMigrator _shouldContinueMigrationFromAnotherDevice](WLMigrator, "_shouldContinueMigrationFromAnotherDevice", self);
  objc_msgSend(v8, "sqlController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sourceDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "migrationMetadataForSourceDevice:strictMatch:", v11, v9 ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v12);

  objc_msgSend(v8, "sourceDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isSelectingDataTypeInHandshake");

  if ((_DWORD)v11)
  {
    objc_msgSend(v8, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setState:", 0);

  }
  objc_msgSend(v8, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrator _prepareMetadata:usingRetryPolicies:allowContinuationFromAnotherDevice:](self, "_prepareMetadata:usingRetryPolicies:allowContinuationFromAnotherDevice:", v15, v6, v9);

  objc_msgSend(v8, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCrashCount:", objc_msgSend(v16, "crashCount") + 1);

  objc_msgSend(v8, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "state");

  if (v18 >= 3)
  {
    v66 = self;
    v19 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v8, "migrators");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    objc_msgSend(v8, "migrators");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v69 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
          objc_msgSend(v8, "sqlController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "contentType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "statisticsForContentType:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v30, "selectedForMigration"))
            objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
      }
      while (v24);
    }

    objc_msgSend(v8, "setMigrators:", v21);
    self = v66;
  }
  objc_msgSend(v8, "metadata");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "state");

  if (v32 >= 4)
  {
    objc_msgSend(v8, "sqlController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLStatistics aggregateContentType](WLStatistics, "aggregateContentType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "statisticsForContentType:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAggregateStatistics:", v35);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -5.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastProgressSentDate:", v36);

  objc_msgSend(v8, "metadata");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "state");

  v39 = 0.0;
  switch(v38)
  {
    case 0:
    case 1:
      objc_msgSend(v8, "payload");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setState:", CFSTR("fetching"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrator fetchSummary:](self, "fetchSummary:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "timeIntervalSinceDate:", v41);
      v39 = v44 + 0.0;

      if (v42)
      {
        objc_msgSend(v8, "payload");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("fetching_error");
        goto LABEL_31;
      }

      goto LABEL_21;
    case 2:
LABEL_21:
      objc_msgSend(v8, "payload");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setState:", CFSTR("selecting"));

      -[WLMigrator selectDataTypes:](self, "selectDataTypes:", v8);
      v49 = objc_claimAutoreleasedReturnValue();
      if (!v49)
        goto LABEL_23;
      v42 = (void *)v49;
      objc_msgSend(v8, "payload");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setState:", CFSTR("selecting_error"));
      goto LABEL_37;
    case 3:
LABEL_23:
      objc_msgSend(v8, "payload");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setState:", CFSTR("downloading"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrator downloadData:](self, "downloadData:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "timeIntervalSinceDate:", v41);
      v39 = v39 + v52;

      if (v42)
      {
        objc_msgSend(v8, "payload");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("downloading_error");
LABEL_31:
        objc_msgSend(v45, "setState:", v47);

        goto LABEL_37;
      }

LABEL_26:
      objc_msgSend(v8, "payload");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setState:", CFSTR("importing"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrator importData:](self, "importData:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "timeIntervalSinceDate:", v41);
      v39 = v39 + v55;

      if (v42)
      {
        objc_msgSend(v8, "payload");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("importing_error");
        goto LABEL_31;
      }

LABEL_29:
      objc_msgSend(v8, "payload");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setState:", CFSTR("tasking"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrator runPostMigrationTasks:](self, "runPostMigrationTasks:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "timeIntervalSinceDate:", v41);
      v39 = v39 + v58;

      if (v42)
      {
        objc_msgSend(v8, "payload");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v45;
        v47 = CFSTR("tasking_error");
        goto LABEL_31;
      }

LABEL_33:
      objc_msgSend(v8, "payload");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setState:", CFSTR("finishing"));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLMigrator finishMigration:](self, "finishMigration:", v8);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(v8, "payload");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        v62 = CFSTR("finishing_error");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "timeIntervalSinceDate:", v41);
        v39 = v39 + v64;

        objc_msgSend(v8, "payload");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        v62 = CFSTR("finished");
      }
      objc_msgSend(v60, "setState:", v62);

LABEL_37:
      objc_msgSend(v8, "payload");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setElapsedTime:", (unint64_t)v39);

      -[WLMigrator _finishMigrationWithError:context:disconnected:completion:](self, "_finishMigrationWithError:context:disconnected:completion:", v42, v8, 0, v67);
      return;
    case 4:
      goto LABEL_26;
    case 5:
      goto LABEL_29;
    case 6:
      goto LABEL_33;
    default:
      objc_msgSend(v8, "metadata");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "state");
      _WLLog();
      v42 = 0;
      v39 = 0.0;
      goto LABEL_37;
  }
}

- (id)migrators:(id)a3
{
  id v3;
  id v4;
  WLContactsMigrator *v5;
  void *v6;
  void *v7;
  WLCalendarMigrator *v8;
  void *v9;
  void *v10;
  WLBookmarksMigrator *v11;
  void *v12;
  void *v13;
  WLMessagesMigrator *v14;
  void *v15;
  WLMessagesMigrator *v16;
  void *v17;
  void *v18;
  WLMailAccountMigrator *v19;
  void *v20;
  void *v21;
  WLPhotosMigrator *v22;
  void *v23;
  void *v24;
  WLVideosMigrator *v25;
  void *v26;
  void *v27;
  void *v28;
  WLFilesMigrator *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  WLDisplayMigrator *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  WLAccessibilityMigrator *v39;
  void *v40;
  void *v41;
  WLAppMigrator *v42;
  void *v43;
  void *v44;
  WLAppMigrator *v45;
  WLCalendarMigrator *v47;
  WLContactsMigrator *v48;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = objc_alloc_init(WLContactsMigrator);
  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLContactsMigrator setFeaturePayload:](v5, "setFeaturePayload:", v7);

  v48 = v5;
  objc_msgSend(v4, "addObject:", v5);
  v8 = objc_alloc_init(WLCalendarMigrator);
  objc_msgSend(v3, "payload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "calendars");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLCalendarMigrator setFeaturePayload:](v8, "setFeaturePayload:", v10);

  v47 = v8;
  objc_msgSend(v4, "addObject:", v8);
  v11 = objc_alloc_init(WLBookmarksMigrator);
  objc_msgSend(v3, "payload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bookmarks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLBookmarksMigrator setFeaturePayload:](v11, "setFeaturePayload:", v13);

  objc_msgSend(v4, "addObject:", v11);
  v14 = [WLMessagesMigrator alloc];
  objc_msgSend(v3, "sqlController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[WLMessagesMigrator initWithSQLController:](v14, "initWithSQLController:", v15);

  objc_msgSend(v3, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "messages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMessagesMigrator setFeaturePayload:](v16, "setFeaturePayload:", v18);

  objc_msgSend(v4, "addObject:", v16);
  v19 = objc_alloc_init(WLMailAccountMigrator);
  objc_msgSend(v3, "payload");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "accounts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMailAccountMigrator setFeaturePayload:](v19, "setFeaturePayload:", v21);

  objc_msgSend(v4, "addObject:", v19);
  v22 = objc_alloc_init(WLPhotosMigrator);
  objc_msgSend(v3, "payload");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "photos");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLPhotosMigrator setFeaturePayload:](v22, "setFeaturePayload:", v24);

  objc_msgSend(v4, "addObject:", v22);
  v25 = objc_alloc_init(WLVideosMigrator);
  objc_msgSend(v3, "payload");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "videos");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLVideosMigrator setFeaturePayload:](v25, "setFeaturePayload:", v27);

  objc_msgSend(v4, "addObject:", v25);
  objc_msgSend(v3, "sourceDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v28, "canAddFiles");

  if ((_DWORD)v26)
  {
    v29 = objc_alloc_init(WLFilesMigrator);
    objc_msgSend(v3, "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "files");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLFilesMigrator setFeaturePayload:](v29, "setFeaturePayload:", v31);

    objc_msgSend(v4, "addObject:", v29);
  }
  objc_msgSend(v3, "sourceDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "canAddDisplay");

  if (v33)
  {
    v34 = objc_alloc_init(WLDisplayMigrator);
    objc_msgSend(v3, "payload");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "displaySettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLDisplayMigrator setFeaturePayload:](v34, "setFeaturePayload:", v36);

    objc_msgSend(v4, "addObject:", v34);
  }
  objc_msgSend(v3, "sourceDevice");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "canAddAccessibility");

  if (v38)
  {
    v39 = objc_alloc_init(WLAccessibilityMigrator);
    objc_msgSend(v3, "payload");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "accessibilitySettings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLAccessibilityMigrator setFeaturePayload:](v39, "setFeaturePayload:", v41);

    objc_msgSend(v4, "addObject:", v39);
  }
  v42 = [WLAppMigrator alloc];
  objc_msgSend(v3, "sourceDevice");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sqlController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = -[WLAppMigrator initWithDevice:sqlController:](v42, "initWithDevice:sqlController:", v43, v44);

  objc_msgSend(v4, "addObject:", v45);
  return v4;
}

- (id)fetchSummary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  WLMigrator *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 1);

  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataMigrator:didUpdateMigrationState:", self, 1);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommunicationDate:", v7);

  objc_msgSend(v4, "sqlController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deleteMetadataForAllDevices");

  objc_msgSend(v4, "sqlController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteAccountsAndSummariesForAllDevices");

  objc_msgSend(v4, "dataCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "downloadsPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLMigrator _deleteDownloadsPath:](self, "_deleteDownloadsPath:", v12);

  objc_msgSend(v4, "sqlController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteMigratableAppsForAllDevices");

  objc_msgSend(v4, "sqlController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteSuggestedAppBundleIDsForAllDevices");

  objc_msgSend(v4, "sqlController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deleteGroupMessageInfoForAllDevices");

  objc_msgSend(v4, "sqlController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deleteMessagePhoneNumbersForAllDevices");

  objc_msgSend(v4, "sqlController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deleteStatisticsForAllDevices");

  objc_msgSend(v4, "sqlController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertMetadata:forSourceDevice:", v19, v20);

  -[WLMigrator _fetchAccountsAndSummariesWithContext:](self, "_fetchAccountsAndSummariesWithContext:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    return 0;
  v28 = self;
  _WLLog();
  v22 = (void *)MEMORY[0x24BDD1540];
  v23 = *MEMORY[0x24BEC2878];
  v24 = *MEMORY[0x24BEC2870];
  v29[0] = *MEMORY[0x24BDD1398];
  v29[1] = v24;
  v30[0] = v21;
  v30[1] = CFSTR("metaSummaries");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2, v28, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 2, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)selectDataTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WLMigrator *v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 2);

  objc_msgSend(v4, "sourceDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSelectingDataTypeInHandshake");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataMigrator:didUpdateMigrationState:", self, 2);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCommunicationDate:", v9);

  objc_msgSend(v4, "sqlController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetadata:forSourceDevice:", v12, v13);

  -[WLMigrator _selectDataTypesWithContext:](self, "_selectDataTypesWithContext:", v4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v22 = self;
    v23 = v14;
    _WLLog();
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC2878];
    v18 = *MEMORY[0x24BEC2870];
    v24[0] = *MEMORY[0x24BDD1398];
    v24[1] = v18;
    v25[0] = v15;
    v25[1] = CFSTR("metaSelectingDataTypes");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 2, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)downloadData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  WLMigrator *v34;
  uint64_t v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[4];
  NSObject *v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 3);

  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataMigrator:didUpdateMigrationState:", self, 3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCommunicationDate:", v7);

  objc_msgSend(v4, "sqlController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLStatistics aggregateContentType](WLStatistics, "aggregateContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statisticsForContentType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAggregateStatistics:", v11);

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v4, 0.0);
  v12 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x24BDAC760];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __27__WLMigrator_downloadData___block_invoke;
  v47[3] = &unk_24E375DE8;
  v14 = v12;
  v48 = v14;
  -[WLMigrator _updateSourceWithProgress:remainingTime:context:completion:](self, "_updateSourceWithProgress:remainingTime:context:completion:", v4, v47, 0.0, 0.0);
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v4, "sqlController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMetadata:forSourceDevice:", v16, v17);

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  v46 = 0;
  v40[0] = v13;
  v40[1] = 3221225472;
  v40[2] = __27__WLMigrator_downloadData___block_invoke_86;
  v40[3] = &unk_24E376590;
  v40[4] = &v41;
  -[WLMigrator _downloadDataWithContext:failureDetailsBlock:](self, "_downloadDataWithContext:failureDetailsBlock:", v4, v40);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
  {
    v34 = self;
    v35 = v18;
    _WLLog();
    v20 = objc_alloc(MEMORY[0x24BDBCED8]);
    v21 = *MEMORY[0x24BEC2888];
    v49[0] = *MEMORY[0x24BDD1398];
    v49[1] = v21;
    v50[0] = v19;
    v50[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2, v34, v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithDictionary:", v22);

    v24 = v42[5];
    if (v24)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BEC2870]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 2, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v25;
    v27 = v26;
  }
  else
  {
    -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v4, 0.8);
    v38[0] = v13;
    v38[1] = 3221225472;
    v38[2] = __27__WLMigrator_downloadData___block_invoke_2;
    v38[3] = &unk_24E375DE8;
    v28 = v14;
    v39 = v28;
    -[WLMigrator _updateSourceWithProgress:remainingTime:context:completion:](self, "_updateSourceWithProgress:remainingTime:context:completion:", v4, v38, 1.0, 0.0);
    dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
    -[WLMigrator _reportTimeEstimatesWithContext:](self, "_reportTimeEstimatesWithContext:", v4);
    objc_msgSend(v4, "throughputSamples");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeAllObjects");

    objc_msgSend(v4, "setTimeEstimateAccuracyTracker:", 0);
    v30 = dispatch_semaphore_create(0);
    +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v13;
    v36[1] = 3221225472;
    v36[2] = __27__WLMigrator_downloadData___block_invoke_3;
    v36[3] = &unk_24E3765B8;
    v32 = v30;
    v37 = v32;
    objc_msgSend(v31, "disableSoftAPWithCompletion:", v36);

    dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    v27 = 0;
    v26 = v39;
  }

  _Block_object_dispose(&v41, 8);
  return v27;
}

intptr_t __27__WLMigrator_downloadData___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __27__WLMigrator_downloadData___block_invoke_86(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

intptr_t __27__WLMigrator_downloadData___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __27__WLMigrator_downloadData___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)importData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 4);

  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataMigrator:didUpdateMigrationState:", self, 4);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregateStatistics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImportStartDate:", v7);

  v9 = +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice");
  objc_msgSend(v4, "aggregateStatistics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImportStartBytesFree:", v9);

  objc_msgSend(v4, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataMigratorDidBecomeRestartable:", self);

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v4, 0.8);
  objc_msgSend(v4, "sqlController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMetadata:forSourceDevice:", v13, v14);

  objc_msgSend(v4, "sqlController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregateStatistics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateStatistics:", v16);

  if (+[WLMigrator _shouldTerminateMigrationBeforeImport](WLMigrator, "_shouldTerminateMigrationBeforeImport"))
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v42 = *MEMORY[0x24BDD0FC8];
    v43[0] = CFSTR("Terminating migration before import as requested");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__2;
    v38 = __Block_byref_object_dispose__2;
    v39 = 0;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __25__WLMigrator_importData___block_invoke;
    v33[3] = &unk_24E376590;
    v33[4] = &v34;
    -[WLMigrator _importDataWithContext:failureDetailsBlock:](self, "_importDataWithContext:failureDetailsBlock:", v4, v33);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
    {
      v32 = v21;
      _WLLog();
      v23 = objc_alloc(MEMORY[0x24BDBCED8]);
      v40 = *MEMORY[0x24BDD1398];
      v41 = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1, self, v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

      v26 = v35[5];
      if (v26)
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *MEMORY[0x24BEC2870]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 3, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v27;
    }
    else
    {
      v28 = +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice");
      objc_msgSend(v4, "aggregateStatistics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setImportEndBytesFree:", v28);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aggregateStatistics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setImportEndDate:", v25);

      v20 = 0;
    }

    _Block_object_dispose(&v34, 8);
  }

  return v20;
}

void __25__WLMigrator_importData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)runPostMigrationTasks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 5);

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v4, 1.0);
  return 0;
}

- (id)finishMigration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  WLMigrator *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 6);

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v4, 1.0);
  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataMigrator:didUpdateMigrationState:", self, 5);

  objc_msgSend(v4, "sqlController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "migrationErrors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImportErrors:", v8);

  objc_msgSend(v4, "importErrors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v4, "importErrors");
    v31 = self;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
  v11 = (const __CFString *)*MEMORY[0x24BDBD568];
  v12 = (const __CFString *)*MEMORY[0x24BDBD590];
  v13 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("MigratedFromAndroid"), (CFPropertyListRef)*MEMORY[0x24BDBD270], (CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSetValue(CFSTR("MigratedFromAndroidToiOSVersion"), +[WLMigrator _systemVersion](WLMigrator, "_systemVersion"), v11, v12, v13);
  objc_msgSend(v4, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(CFSTR("MigratedFromAndroidDeviceType"), v15, v11, v12, v13);

  objc_msgSend(v4, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "deviceOSVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(CFSTR("MigratedFromAndroidOSVersion"), v17, v11, v12, v13);

  v18 = objc_alloc_init(MEMORY[0x24BEC27E8]);
  objc_msgSend(v18, "setIsEnabled:", 0);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v4, "migrators");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v25 = objc_msgSend(v24, "importErrorCount");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "image");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v18, "video");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "setImportErrorCount:", v25);

          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v21);
  }

  objc_msgSend(v4, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importErrors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dataMigratorDidFinish:withImportErrors:context:", self, objc_msgSend(v29, "count") != 0, v18, v31, v32);

  return 0;
}

- (void)_finishMigrationWithError:(id)a3 context:(id)a4 disconnected:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(_QWORD);
  id v38;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  if (!v10)
  {
    objc_msgSend(v11, "metadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setCrashCount:", objc_msgSend(v25, "crashCount") - 1);

    objc_msgSend(v11, "sqlController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metadata");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sourceDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMetadata:forSourceDevice:", v27, v28);

    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "payload");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "migratorDidFinish:", v30);

    -[WLMigrator _logStatisticsAndSendStatisticsTelemetryWithContext:](self, "_logStatisticsAndSendStatisticsTelemetryWithContext:", v11);
    objc_msgSend(v11, "importErrors");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    if (v32)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!a5)
  {
    objc_initWeak(&location, self);
    +[WLWiFiController sharedInstance](WLWiFiController, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __72__WLMigrator__finishMigrationWithError_context_disconnected_completion___block_invoke;
    v34[3] = &unk_24E3765E0;
    objc_copyWeak(&v38, &location);
    v35 = v10;
    v36 = v11;
    v37 = v12;
    objc_msgSend(v33, "disableSoftAPWithCompletion:", v34);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "payload");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "migratorDidFinish:", v14);

  objc_msgSend(v11, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataMigrator:didFailWithError:", self, v10);

  objc_msgSend(v11, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "state");

  if (v17 == 4)
  {
LABEL_4:
    objc_msgSend(v11, "sqlController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteMetadataForAllDevices");

    objc_msgSend(v11, "sqlController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deleteAccountsAndSummariesForAllDevices");

    objc_msgSend(v11, "sqlController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deleteStatisticsForAllDevices");

    objc_msgSend(v11, "dataCoordinator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "downloadsPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLMigrator _deleteDownloadsPath:](self, "_deleteDownloadsPath:", v22);

  }
LABEL_5:
  objc_msgSend(v11, "urlSessionController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "invalidate");

  objc_msgSend(v11, "migrators");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  if (+[WLMigrator stashDataLocally](WLMigrator, "stashDataLocally"))
    +[WLMigrator setStashDataLocally:](WLMigrator, "setStashDataLocally:", 0);
  if (objc_msgSend(v11, "powerAssertion"))
  {
    CFRelease((CFTypeRef)objc_msgSend(v11, "powerAssertion"));
    objc_msgSend(v11, "setPowerAssertion:", 0);
  }
  if (v12)
    v12[2](v12);
LABEL_14:

}

void __72__WLMigrator__finishMigrationWithError_context_disconnected_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishMigrationWithError:context:disconnected:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));

}

- (id)_fetchAccountsAndSummariesWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  void *v24;
  id obj;
  uint64_t v26;
  void *v28;
  _QWORD v29[5];
  id v30;
  void *v31;
  NSObject *v32;
  uint64_t *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  v47 = 0;
  objc_msgSend(v3, "sqlController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLStatistics fetchContentType](WLStatistics, "fetchContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statisticsForContentType:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFetchStartBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v3, "migrators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  obj = v6;
  if (v7)
  {
    v26 = *(_QWORD *)v39;
    v8 = MEMORY[0x24BDAC760];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v26)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v9);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = dispatch_semaphore_create(0);
      objc_msgSend(v3, "dataCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v8;
      v36[1] = 3221225472;
      v36[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke;
      v36[3] = &unk_24E376608;
      v36[4] = v10;
      v37 = v3;
      v34[0] = v8;
      v34[1] = 3221225472;
      v34[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_2;
      v34[3] = &unk_24E376608;
      v34[4] = v10;
      v35 = v37;
      v29[0] = v8;
      v29[1] = 3221225472;
      v29[2] = __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_3;
      v29[3] = &unk_24E376630;
      v33 = &v42;
      v29[4] = self;
      v30 = v35;
      v31 = v10;
      v15 = v12;
      v32 = v15;
      objc_msgSend(v13, "fetchAccountsAndSummariesFromSource:forMigrator:statistics:accountsRequestDurationBlock:summariesRequestDurationBlock:completion:", v14, v10, v28, v36, v34, v29);

      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v16, "timeIntervalSinceDate:", v11);
      v18 = v17;

      objc_msgSend(v10, "addWorkingTime:", (unint64_t)v18);
      LOBYTE(v16) = v43[5] == 0;

      if ((v16 & 1) == 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v28, "setFetchEndBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v24);
  objc_msgSend(v28, "setFetchDuration:", vcvtpd_u64_f64(v20));
  objc_msgSend(v3, "sqlController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateStatistics:", v28);

  v22 = (id)v43[5];
  _Block_object_dispose(&v42, 8);

  return v22;
}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceOSVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preparatoryDataDidComplete:contentType:duration:android:model:version:", CFSTR("accounts"), v4, v6, v8, v10, a2);

}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_2(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceOSVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preparatoryDataDidComplete:contentType:duration:android:model:version:", CFSTR("summaries"), v4, v6, v8, v10, a2);

}

void __52__WLMigrator__fetchAccountsAndSummariesWithContext___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
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

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v27 = a3;
  v8 = a4;
  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldTerminateMigrationOnError"))
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "sqlController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "sourceDevice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setSqlID:", objc_msgSend(v16, "insertAccount:migrator:device:", v15, v17, v18));

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = v27;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "sqlController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "account");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setSqlID:", objc_msgSend(v25, "insertRecordSummary:account:", v24, v26));

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (id)_selectDataTypesWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v54;
  dispatch_semaphore_t v55;
  void *v56;
  id obja;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  NSObject *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[6];
  id v78;
  NSObject *v79;
  uint64_t *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v85 = 0;
  v86 = &v85;
  v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__2;
  v89 = __Block_byref_object_dispose__2;
  v90 = 0;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "migrators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v55 = dispatch_semaphore_create(0);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  objc_msgSend(v3, "migrators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v82;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v82 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        objc_msgSend(v3, "sqlController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "sourceDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountsForMigrator:device:", v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v11, "contentType");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v3, "sqlController", self, v54);
          v15 = objc_claimAutoreleasedReturnValue();
          v77[0] = MEMORY[0x24BDAC760];
          v77[1] = 3221225472;
          v77[2] = __42__WLMigrator__selectDataTypesWithContext___block_invoke;
          v77[3] = &unk_24E376658;
          v77[4] = self;
          v77[5] = v11;
          v80 = &v85;
          v78 = v6;
          v16 = v55;
          v79 = v16;
          objc_msgSend((id)v15, "totalSummaryItemSizeForAccounts:addOverhead:completion:", v14, 1, v77);

          dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
          LOBYTE(v15) = v86[5] == 0;

          if ((v15 & 1) == 0)
          {

            goto LABEL_12;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  if (!v86[5])
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v6, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v74 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
          objc_msgSend(v6, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "unsignedLongLongValue");

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)((double)v23 * 1.2));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v21);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
      }
      while (v18);
    }

  }
  +[WLAppMigrator dataType](WLAppMigrator, "dataType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[WLAppMigrator dataType](WLAppMigrator, "dataType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v27);

  }
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__2;
  v71 = __Block_byref_object_dispose__2;
  v72 = 0;
  if (!v86[5])
  {
    _WLLog();
    objc_msgSend(v3, "sourceDevice", self, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __42__WLMigrator__selectDataTypesWithContext___block_invoke_2;
    v63[3] = &unk_24E376680;
    v63[4] = self;
    v65 = &v67;
    v66 = &v85;
    v29 = v55;
    v64 = v29;
    -[WLMigrator _selectFromDataTypeToSizeMap:device:completion:](self, "_selectFromDataTypeToSizeMap:device:completion:", v6, v28, v63);

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v26)
  {
    v30 = (void *)v68[5];
    +[WLAppMigrator dataType](WLAppMigrator, "dataType");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "arrayByAddingObject:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v68[5];
    v68[5] = v32;

  }
  v34 = (void *)v86[5];
  if (!v34)
  {
    v35 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "migrators");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v35, "initWithCapacity:", objc_msgSend(v36, "count"));

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    objc_msgSend(v3, "migrators");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v59, v91, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v60;
      obja = v37;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v60 != v39)
            objc_enumerationMutation(obja);
          v41 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
          v42 = (void *)v68[5];
          objc_msgSend(v41, "dataType");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = objc_msgSend(v42, "containsObject:", v43);

          if ((_DWORD)v42)
          {
            objc_msgSend(v56, "addObject:", v41);
            objc_msgSend(v3, "sqlController");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "contentType");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "statisticsForContentType:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v46, "setSelectedForMigration:", 1);
            objc_msgSend(v3, "sqlController");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "updateStatistics:", v46);

            objc_msgSend(v41, "dataType");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "unsignedLongLongValue");

            objc_msgSend(v41, "enable");
            objc_msgSend(v41, "setEstimatedDataSize:", v50);
          }
          else
          {
            objc_msgSend(v3, "sqlController");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "sourceDevice");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "deleteAccountsAndSummariesForMigrator:device:", v41, v51);

          }
        }
        v37 = obja;
        v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v91, 16);
      }
      while (v38);
    }

    objc_msgSend(v3, "setMigrators:", v56);
    v34 = (void *)v86[5];
  }
  v52 = v34;
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v85, 8);
  return v52;
}

void __42__WLMigrator__selectDataTypesWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "contentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v17)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = v17;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_5:

    goto LABEL_6;
  }
  if (a2)
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "dataType", v5, v6, v16, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v9, "unsignedLongLongValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12 + a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "dataType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    goto LABEL_5;
  }
LABEL_6:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __42__WLMigrator__selectDataTypesWithContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v11 = a3;
  _WLLog();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v12 = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v11;
  v10 = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_selectFromDataTypeToSizeMap:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "socketPort"))
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke;
    v13[3] = &unk_24E376748;
    objc_copyWeak(&v17, &location);
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v16 = v10;
    dispatch_async(v11, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else if (v10)
  {
    objc_msgSend(v8, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v12, 0);

  }
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  dispatch_semaphore_t v3;
  uint64_t v4;
  WLSocketHandler *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[5];
  NSObject *v52;
  uint64_t *v53;
  _QWORD v54[5];
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  id v58;
  _QWORD v59[5];
  NSObject *v60;
  uint64_t *v61;
  id v62;
  id v63;
  _QWORD v64[5];
  NSObject *v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  id obj;
  _QWORD v75[5];
  NSObject *v76;
  uint64_t *v77;
  _QWORD v78[5];
  NSObject *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  WLSocketHandler *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  int v92;
  _QWORD v93[5];
  NSObject *v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t v97;
  id *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  int v106;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = -1;
  v97 = 0;
  v98 = (id *)&v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__2;
  v101 = __Block_byref_object_dispose__2;
  v102 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "socketPort"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v5 = objc_alloc_init(WLSocketHandler);
  objc_msgSend(WeakRetained, "setActiveSocketHandler:", v5, v4, v44);
  objc_msgSend(*(id *)(a1 + 40), "ipAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 40), "socketPort");
  v93[0] = MEMORY[0x24BDAC760];
  v93[1] = 3221225472;
  v93[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_2;
  v93[3] = &unk_24E3766A8;
  v93[4] = *(_QWORD *)(a1 + 32);
  v95 = &v103;
  v96 = &v97;
  v8 = v3;
  v94 = v8;
  +[WLSocketHandler lookupAndConnectToHost:port:completion:](WLSocketHandler, "lookupAndConnectToHost:port:completion:", v6, v7, v93);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = dispatch_semaphore_create(0);
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = -1;
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__2;
  v87 = __Block_byref_object_dispose__2;
  v88 = objc_alloc_init(WLSocketHandler);
  if (!v98[5])
  {
    +[WLDeviceDiscoveryController sharedInstance](WLDeviceDiscoveryController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_3;
    v78[3] = &unk_24E3766D0;
    v78[4] = *(_QWORD *)(a1 + 32);
    v80 = &v97;
    v81 = &v89;
    v82 = &v83;
    v79 = v9;
    objc_msgSend(v10, "setNextIncomingConnectionHandler:", v78);

    if (!v98[5])
    {
      -[WLSocketHandler beginReadingIntoCacheFromSocket:](v5, "beginReadingIntoCacheFromSocket:", *((unsigned int *)v104 + 6));
      v36 = *(_QWORD *)(a1 + 32);
      _WLLog();
      v11 = *((unsigned int *)v104 + 6);
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_4;
      v75[3] = &unk_24E3766F8;
      v75[4] = *(_QWORD *)(a1 + 32);
      v77 = &v97;
      v12 = v8;
      v76 = v12;
      -[WLSocketHandler sendCommand:toSocket:completion:](v5, "sendCommand:toSocket:completion:", CFSTR("DATASETSAVAILABLE"), v11, v75, v36);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

      if (!v98[5])
      {
        v37 = *(_QWORD *)(a1 + 32);
        _WLLog();
        v13 = v98;
        obj = v98[5];
        -[WLSocketHandler waitForCommand:fromReadCacheReturningError:](v5, "waitForCommand:fromReadCacheReturningError:", CFSTR("OK"), &obj, v37);
        objc_storeStrong(v13 + 5, obj);
        v35 = *(_QWORD *)(a1 + 32);
        v45 = (uint64_t)v98[5];
        _WLLog();
        if (!v98[5])
        {
          v68 = 0;
          v69 = &v68;
          v70 = 0x3032000000;
          v71 = __Block_byref_object_copy__2;
          v72 = __Block_byref_object_dispose__2;
          +[WLMigrator _dataTypesAndSizesXMLDataFromMap:](WLMigrator, "_dataTypesAndSizesXMLDataFromMap:", *(_QWORD *)(a1 + 48), v35, v45);
          v73 = (id)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(a1 + 32);
          v15 = objc_alloc(MEMORY[0x24BDD17C8]);
          v46 = (void *)objc_msgSend(v15, "initWithData:encoding:", v69[5], 4);
          _WLLog();

          v16 = objc_msgSend(objc_retainAutorelease((id)v69[5]), "bytes", v14, v46);
          v50 = objc_msgSend((id)v69[5], "length");
          v17 = *((unsigned int *)v104 + 6);
          v64[0] = MEMORY[0x24BDAC760];
          v64[1] = 3221225472;
          v64[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_5;
          v64[3] = &unk_24E376720;
          v64[4] = *(_QWORD *)(a1 + 32);
          v66 = &v97;
          v67 = &v68;
          v18 = v12;
          v65 = v18;
          -[WLSocketHandler writeBytes:length:toSocket:completion:](v5, "writeBytes:length:toSocket:completion:", v16, v50, v17, v64);
          dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

          _Block_object_dispose(&v68, 8);
          if (!v98[5])
          {
            v38 = *(_QWORD *)(a1 + 32);
            _WLLog();
            v19 = v98;
            v63 = v98[5];
            -[WLSocketHandler waitForCommand:fromReadCacheReturningError:](v5, "waitForCommand:fromReadCacheReturningError:", CFSTR("OK"), &v63, v38);
            objc_storeStrong(v19 + 5, v63);
            v35 = *(_QWORD *)(a1 + 32);
            v45 = (uint64_t)v98[5];
            _WLLog();
          }
        }
      }
    }
  }
  -[WLSocketHandler endReadingIntoCache](v5, "endReadingIntoCache", v35, v45);
  v20 = v98;
  if (!v98[5])
  {
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v20 = v98;
    if (!v98[5])
    {
      objc_msgSend(WeakRetained, "setActiveSocketHandler:", v84[5]);
      v40 = *(_QWORD *)(a1 + 32);
      _WLLog();
      v21 = (void *)v84[5];
      v22 = v98;
      v62 = v98[5];
      objc_msgSend(v21, "waitForCommand:fromReadCacheReturningError:", CFSTR("DATASETSSELECTED"), &v62, v40);
      objc_storeStrong(v22 + 5, v62);
      v39 = *(_QWORD *)(a1 + 32);
      v47 = (uint64_t)v98[5];
      _WLLog();
      v20 = v98;
      if (!v98[5])
      {
        v41 = *(_QWORD *)(a1 + 32);
        _WLLog();
        v23 = (void *)v84[5];
        v24 = *((unsigned int *)v90 + 6);
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_6;
        v59[3] = &unk_24E3766F8;
        v59[4] = *(_QWORD *)(a1 + 32);
        v61 = &v97;
        v25 = v8;
        v60 = v25;
        objc_msgSend(v23, "sendCommand:toSocket:completion:", CFSTR("OK"), v24, v59, v41, v47);
        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

        v20 = v98;
      }
    }
  }
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__2;
  v72 = __Block_byref_object_dispose__2;
  v73 = 0;
  if (!v20[5])
  {
    v42 = *(_QWORD *)(a1 + 32);
    _WLLog();
    v26 = (void *)v84[5];
    v27 = v98;
    v58 = v98[5];
    objc_msgSend(v26, "waitForDataFromReadCacheReturningError:", &v58, v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v27 + 5, v58);
    v39 = *(_QWORD *)(a1 + 32);
    v48 = (uint64_t)v98[5];
    _WLLog();
    if (!v98[5])
    {
      v29 = *(_QWORD *)(a1 + 32);
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v28, 4, v39, v48);
      _WLLog();

      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_7;
      v54[3] = &unk_24E376680;
      v54[4] = *(_QWORD *)(a1 + 32);
      v56 = &v68;
      v57 = &v97;
      v30 = v8;
      v55 = v30;
      +[WLMigrator _parseDataTypesXMLData:completion:](WLMigrator, "_parseDataTypesXMLData:completion:", v28, v54, v29, v49);
      dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);

    }
    if (!v98[5])
    {
      v43 = *(_QWORD *)(a1 + 32);
      _WLLog();
      v31 = (void *)v84[5];
      v32 = *((unsigned int *)v90 + 6);
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_8;
      v51[3] = &unk_24E3766F8;
      v51[4] = *(_QWORD *)(a1 + 32);
      v53 = &v97;
      v33 = v8;
      v52 = v33;
      objc_msgSend(v31, "sendCommand:toSocket:completion:", CFSTR("OK"), v32, v51, v43);
      dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  objc_msgSend((id)v84[5], "endReadingIntoCache", v39);
  v34 = *(_QWORD *)(a1 + 56);
  if (v34)
    (*(void (**)(uint64_t, uint64_t, id))(v34 + 16))(v34, v69[5], v98[5]);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v89, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!v8)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "beginReadingIntoCacheFromSocket:", a2, v6, v7, 0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  _WLLog();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  _WLLog();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;
  v9 = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  _WLLog();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  _WLLog();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __61__WLMigrator__selectFromDataTypeToSizeMap_device_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  _WLLog();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)_dataTypesAndSizesXMLDataFromMap:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(CFSTR("<?xml version=\"1.0\"?>\r\n"), "stringByAppendingString:", CFSTR("<root>\r\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("<datasetsavailable>\r\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_msgSend(v5, "stringByAppendingString:", CFSTR("<dataset>\r\n"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<datasetid>%@</datasetid>\r\n"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("<datasetsize>%@</datasetsize>\r\n"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingString:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "stringByAppendingString:", CFSTR("</dataset>\r\n"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("</datasetsavailable>\r\n"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByAppendingString:", CFSTR("</root>\r\n"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "dataUsingEncoding:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (void)_parseDataTypesXMLData:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, xmlNode *);
  id v7;
  const xmlDoc *Memory;
  xmlNodePtr RootElement;
  _xmlNode *children;
  const char *name;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  xmlNode *v18;
  void *v19;
  const char *v20;
  xmlChar *Content;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD, xmlNode *))a4;
  v7 = objc_retainAutorelease(v5);
  Memory = xmlReadMemory((const char *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0, 0, 0);
  if (Memory)
  {
    RootElement = xmlDocGetRootElement(Memory);
    if (RootElement)
    {
      children = RootElement->children;
      if (children)
      {
        while (1)
        {
          name = (const char *)children->name;
          if (name)
          {
            if (!strcmp(name, "datasetsselected"))
              break;
          }
          children = children->next;
          if (!children)
            goto LABEL_7;
        }
        v18 = 0;
        goto LABEL_11;
      }
LABEL_7:
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BEC2878];
      v29 = *MEMORY[0x24BDD0FC8];
      v30 = CFSTR("Parsed xml has no datasetsselected node");
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v30;
      v16 = &v29;
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BEC2878];
      v31 = *MEMORY[0x24BDD0FC8];
      v32 = CFSTR("Parsed xml has no root node");
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = &v32;
      v16 = &v31;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC2878];
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("Failed to parse xml");
    v14 = (void *)MEMORY[0x24BDBCE70];
    v15 = (const __CFString **)v34;
    v16 = &v33;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 1, v17);
  v18 = (xmlNode *)objc_claimAutoreleasedReturnValue();

  children = 0;
LABEL_11:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
  if (!children || v18 || (v18 = children->children) == 0)
  {
LABEL_19:
    if (v6)
      goto LABEL_20;
    goto LABEL_24;
  }
  while (1)
  {
    v20 = (const char *)v18->name;
    if (!v20 || strcmp(v20, "datasetid"))
      goto LABEL_18;
    Content = xmlNodeGetContent(v18);
    if (!Content)
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Content);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v22);

LABEL_18:
    v18 = v18->next;
    if (!v18)
      goto LABEL_19;
  }
  v24 = (void *)MEMORY[0x24BDD1540];
  v25 = *MEMORY[0x24BEC2878];
  v27 = *MEMORY[0x24BDD0FC8];
  v28 = CFSTR("Parsed xml has no value for datasetid");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 1, v26);
  v18 = (xmlNode *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_24;
LABEL_20:
  if (v18)
    v23 = 0;
  else
    v23 = v19;
  ((void (**)(id, void *, xmlNode *))v6)[2](v6, v23, v18);
LABEL_24:

}

- (BOOL)_shouldForceDownloadError
{
  return objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("ForceDownloadError")) == 1;
}

- (id)_downloadDataWithContext:(id)a3 failureDetailsBlock:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_semaphore_t v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  double v65;
  unint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  WLMigrator *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void (**v85)(id, void *);
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id obj;
  char obja;
  void *v97;
  uint64_t v98;
  id v99;
  NSObject *dsema;
  _QWORD v101[4];
  id v102;
  void *v103;
  id v104;
  WLMigrator *v105;
  NSObject *v106;
  uint64_t *v107;
  char v108;
  _QWORD v109[6];
  id v110;
  id v111;
  NSObject *v112;
  uint64_t *v113;
  _QWORD v114[6];
  id v115;
  char v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  NSObject *v130;
  _QWORD v131[6];
  NSObject *v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t (*v145)(uint64_t, uint64_t);
  void (*v146)(uint64_t);
  id v147;
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;
  const __CFString *v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v85 = (void (**)(id, void *))a4;
  v142 = 0;
  v143 = &v142;
  v144 = 0x3032000000;
  v145 = __Block_byref_object_copy__2;
  v146 = __Block_byref_object_dispose__2;
  v147 = 0;
  objc_msgSend(v6, "setCompletedDownloadSegmentCount:", 0);
  objc_msgSend(v6, "setExpectedDownloadSegmentsRemaining:", 0);
  objc_msgSend(v6, "setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:", 0);
  dsema = dispatch_semaphore_create(0);
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  objc_msgSend(v6, "migrators");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
  if (v8)
  {
    v98 = *(_QWORD *)v139;
    obj = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v139 != v98)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x2207BB344]();
        objc_msgSend(v6, "sqlController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "sourceDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "accountsForMigrator:device:", v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v14, "count"))
        {
          objc_msgSend(v10, "contentType");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v6, "sqlController", self, v76);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "totalSummaryDownloadedSegmentCountForAccounts:", v14);

          objc_msgSend(v10, "contentType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v6, "setCompletedDownloadSegmentCount:", objc_msgSend(v6, "completedDownloadSegmentCount", self, v17, v80) + v16);
          objc_msgSend(v10, "contentType");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v6, "sqlController", self, v77);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "totalSummaryDownloadSegmentCountForAccounts:", v14);

          objc_msgSend(v10, "contentType");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          _WLLog();

          objc_msgSend(v6, "setExpectedDownloadSegmentsRemaining:", objc_msgSend(v6, "expectedDownloadSegmentsRemaining", self, v20, v81) + v19);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v6, "setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:", objc_msgSend(v6, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes") + v19);
          }
          else
          {
            objc_msgSend(v10, "contentType");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            _WLLog();

            v134 = 0;
            v135 = &v134;
            v136 = 0x2020000000;
            v137 = 0;
            objc_msgSend(v6, "sqlController", self, v78);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = MEMORY[0x24BDAC760];
            v131[1] = 3221225472;
            v131[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke;
            v131[3] = &unk_24E376770;
            v131[4] = self;
            v131[5] = v10;
            v133 = &v134;
            v22 = dsema;
            v132 = v22;
            objc_msgSend(v21, "totalSummaryItemSizeForAccounts:addOverhead:completion:", v14, 0, v131);

            dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
            objc_msgSend(v6, "setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:", v135[3] + objc_msgSend(v6, "expectedDownloadBytesRemainingForItemsWithConcreteSizes"));

            _Block_object_dispose(&v134, 8);
          }
        }

        objc_autoreleasePoolPop(v11);
      }
      v7 = obj;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "completedDownloadSegmentCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "expectedDownloadSegmentsRemaining"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (objc_msgSend(v6, "completedDownloadSegmentCount", self, v23, v82))
  {
    v24 = objc_msgSend(v6, "completedDownloadSegmentCount");
    v25 = objc_msgSend(v6, "expectedDownloadSegmentsRemaining");
    v26 = objc_msgSend(v6, "completedDownloadSegmentCount");
    if ((double)v24 / (double)(unint64_t)(v26 + v25) * 0.8 <= 0.8)
      v27 = (double)v24 / (double)(unint64_t)(v26 + v25) * 0.8;
    else
      v27 = 0.8;
    v28 = objc_msgSend(v6, "completedDownloadSegmentCount");
    v29 = objc_msgSend(v6, "expectedDownloadSegmentsRemaining");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v6, v27, v28, v29, v84);
    v30 = dispatch_semaphore_create(0);
    objc_msgSend(v6, "progress");
    v32 = v31;
    v129[0] = MEMORY[0x24BDAC760];
    v129[1] = 3221225472;
    v129[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_2;
    v129[3] = &unk_24E375DE8;
    v33 = v30;
    v130 = v33;
    -[WLMigrator _updateSourceWithProgress:remainingTime:context:completion:](self, "_updateSourceWithProgress:remainingTime:context:completion:", v6, v129, v32, 0.0);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThroughputSegmentStartDate:", v34);

  objc_msgSend(v6, "migrators");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v86 = v36;
  v37 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v152, 16);
  v38 = 0;
  if (!v37)
    goto LABEL_54;
  v88 = *(_QWORD *)v126;
  while (2)
  {
    v90 = 0;
    v87 = v37;
    v39 = v38;
    do
    {
      if (*(_QWORD *)v126 != v88)
        objc_enumerationMutation(v86);
      v99 = *(id *)(*((_QWORD *)&v125 + 1) + 8 * v90);

      objc_msgSend(v99, "setState:", CFSTR("downloading"));
      objc_msgSend(v6, "sqlController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "contentType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "statisticsForContentType:", v41);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[WLMigrator _shouldForceDownloadError](self, "_shouldForceDownloadError"))
      {
        _WLLog();
        v68 = (void *)MEMORY[0x24BDD1540];
        v150 = *MEMORY[0x24BDD0FD8];
        v151 = CFSTR("Forced download error");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1, self);
        v69 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC2878], 1, v69);
        v70 = objc_claimAutoreleasedReturnValue();
        v91 = (id)v69;
        v71 = (void *)v143[5];
        v143[5] = v70;
LABEL_53:

        v38 = v99;
        goto LABEL_54;
      }
      v42 = objc_opt_respondsToSelector();
      objc_msgSend(v6, "sqlController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceDevice");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "accountsForMigrator:device:", v99, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
      v91 = v46;
      if (!v47)
        goto LABEL_46;
      v48 = 0;
      obja = v42 & 1;
      v92 = v47;
      v93 = *(_QWORD *)v122;
LABEL_25:
      v49 = 0;
      while (1)
      {
        if (*(_QWORD *)v122 != v93)
          objc_enumerationMutation(v91);
        v94 = v49;
        v50 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v49);
        objc_msgSend(v6, "sqlController", v75);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "summariesForAccount:", v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v119 = 0u;
        v120 = 0u;
        v117 = 0u;
        v118 = 0u;
        v53 = v52;
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
        if (v54)
        {
          v55 = *(_QWORD *)v118;
          do
          {
            for (j = 0; j != v54; ++j)
            {
              if (*(_QWORD *)v118 != v55)
                objc_enumerationMutation(v53);
              v57 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
              if (objc_msgSend(v57, "didDownload", v75, v79, v83))
              {
                objc_msgSend(v57, "identifier");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "identifier");
                v79 = v58;
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = self;
                _WLLog();

              }
              else
              {
                if (objc_msgSend(v57, "storeDataAsFile"))
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v57, "itemSize"));
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "dataFilePath");
                  v79 = v59;
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = self;
                  _WLLog();

                  objc_msgSend(v6, "dataCoordinator");
                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "dataSource");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v114[0] = MEMORY[0x24BDAC760];
                  v114[1] = 3221225472;
                  v114[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_5;
                  v114[3] = &unk_24E3767D8;
                  v114[4] = self;
                  v114[5] = v57;
                  v116 = obja;
                  v115 = v6;
                  v109[0] = MEMORY[0x24BDAC760];
                  v109[1] = 3221225472;
                  v109[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_7;
                  v109[3] = &unk_24E376800;
                  v109[4] = self;
                  v109[5] = v57;
                  v110 = v115;
                  v113 = &v142;
                  v111 = v97;
                  v112 = dsema;
                  objc_msgSend(v60, "downloadFileFromSource:forMigrator:summary:account:segmentCompletion:completion:", v61, v99, v57, v50, v114, v109);

                }
                else
                {
                  objc_msgSend(v6, "dataCoordinator");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "dataSource");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v101[0] = MEMORY[0x24BDAC760];
                  v101[1] = 3221225472;
                  v101[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_8;
                  v101[3] = &unk_24E376828;
                  v102 = v6;
                  v103 = v57;
                  v104 = v97;
                  v105 = self;
                  v108 = obja;
                  v107 = &v142;
                  v106 = dsema;
                  objc_msgSend(v62, "downloadDataFromSource:forMigrator:summary:account:completion:", v63, v99, v57, v50, v101);

                }
                dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
                v48 = 1;
                if (v143[5])
                  goto LABEL_41;
              }
            }
            v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v117, v148, 16);
          }
          while (v54);
        }
LABEL_41:

        v64 = v143[5] == 0;
        if (!v64)
          break;
        v49 = v94 + 1;
        if (v94 + 1 == v92)
        {
          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v121, v149, 16);
          if (v92)
            goto LABEL_25;
          break;
        }
      }

      if ((v48 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "timeIntervalSinceDate:", v89);
        v66 = vcvtpd_u64_f64(v65);
        objc_msgSend(v97, "setDownloadDuration:", objc_msgSend(v97, "downloadDuration") + v66);
        objc_msgSend(v6, "sqlController");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "updateStatistics:", v97);

        objc_msgSend(v99, "addWorkingTime:", v66);
LABEL_46:

      }
      if (v143[5])
      {
        objc_msgSend(v99, "contentType");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v85[2](v85, v71);
        goto LABEL_53;
      }
      objc_msgSend(v99, "setState:", CFSTR("downloaded"));

      v38 = v99;
      v39 = v99;
      ++v90;
    }
    while (v90 != v87);
    v37 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v125, v152, 16);
    if (v37)
      continue;
    break;
  }
LABEL_54:

  v72 = (void *)v143[5];
  if (v72 && v38)
  {
    objc_msgSend(v38, "setState:", CFSTR("downloading_error"));
    v72 = (void *)v143[5];
  }
  v73 = v72;

  _Block_object_dispose(&v142, 8);
  return v73;
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 40), "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    _WLLog();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4((uint64_t)v5, a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4((uint64_t)v6, v5);

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

uint64_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "storeRecordDataInDatabase"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "potentiallyLargeRecordData") & 1) != 0)
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  dispatch_semaphore_t v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  dispatch_semaphore_t v18;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataFilePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDBCE60], "date", v4, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didFinishDownloadingSegmentOfSize:expectedSize:migratorEstimatesItemSizes:endDate:context:", a2, a2, v6, v7, *(_QWORD *)(a1 + 48));
  v9 = v8;

  v10 = dispatch_semaphore_create(0);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "progress");
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 48);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_6;
  v17[3] = &unk_24E375DE8;
  v18 = v10;
  v15 = v10;
  objc_msgSend(v11, "_updateSourceWithProgress:remainingTime:context:completion:", v14, v17, v13, v9);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "itemSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataFilePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldTerminateMigrationOnError", v3, v4, v11, v12))
      v5 = v12;
    else
      v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "sqlController", v3, v4, v11, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "sourceDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDidDownloadForSummary:forSourceDevice:", v7, v8);

    v5 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v5);
  v9 = *(void **)(a1 + 56);
  if (v12)
    v10 = 0;
  else
    v10 = objc_msgSend(*(id *)(a1 + 40), "itemSize");
  objc_msgSend(v9, "setDownloadByteCount:", objc_msgSend(v9, "downloadByteCount") + v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

void __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  dispatch_semaphore_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  dispatch_semaphore_t v27;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "sqlController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:forSummary:", v5, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "setDownloadByteCount:", objc_msgSend(*(id *)(a1 + 48), "downloadByteCount") + objc_msgSend(v5, "length"));
    v9 = *(void **)(a1 + 56);
    v10 = objc_msgSend(v5, "length");
    v11 = objc_msgSend(*(id *)(a1 + 40), "itemSize");
    v12 = *(unsigned __int8 *)(a1 + 80);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_didFinishDownloadingSegmentOfSize:expectedSize:migratorEstimatesItemSizes:endDate:context:", v10, v11, v12, v13, *(_QWORD *)(a1 + 32));
    v15 = v14;

    objc_msgSend(*(id *)(a1 + 32), "sqlController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "sourceDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDidDownloadForSummary:forSourceDevice:", v17, v18);

    v19 = dispatch_semaphore_create(0);
    v20 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 32);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_9;
    v26[3] = &unk_24E375DE8;
    v27 = v19;
    v24 = v19;
    objc_msgSend(v20, "_updateSourceWithProgress:remainingTime:context:completion:", v23, v26, v22, v15);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

LABEL_8:
    v25 = 0;
    goto LABEL_9;
  }
  if (!v6)
    goto LABEL_8;
  if (objc_msgSend(*(id *)(a1 + 56), "_shouldTerminateMigrationOnError"))
    v25 = v7;
  else
    v25 = 0;
LABEL_9:
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v25);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

intptr_t __59__WLMigrator__downloadDataWithContext_failureDetailsBlock___block_invoke_9(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)_didFinishDownloadingSegmentOfSize:(unint64_t)a3 expectedSize:(unint64_t)a4 migratorEstimatesItemSizes:(BOOL)a5 endDate:(id)a6 context:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  WLThroughputSample *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  void *v53;
  double v55;
  void *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v8 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v12, "setCompletedDownloadSegmentCount:", objc_msgSend(v12, "completedDownloadSegmentCount") + 1);
  objc_msgSend(v12, "setExpectedDownloadSegmentsRemaining:", objc_msgSend(v12, "expectedDownloadSegmentsRemaining") - 1);
  if (v8)
    objc_msgSend(v12, "setExpectedDownloadSegmentsRemainingForItemsWithEstimatedSizes:", objc_msgSend(v12, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes") - 1);
  else
    objc_msgSend(v12, "setExpectedDownloadBytesRemainingForItemsWithConcreteSizes:", objc_msgSend(v12, "expectedDownloadBytesRemainingForItemsWithConcreteSizes") - a4);
  while (1)
  {
    objc_msgSend(v12, "throughputSamples");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v13, "count") < 0x14)
      break;

LABEL_8:
    objc_msgSend(v12, "throughputSamples");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectAtIndex:", 0);

    objc_msgSend(v12, "throughputSamples");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setThroughputBytesInCurrentPeriod:", objc_msgSend(v12, "throughputBytesInCurrentPeriod") - objc_msgSend(v21, "bytes"));

    objc_msgSend(v12, "setThroughputSegmentsInCurrentPeriod:", objc_msgSend(v12, "throughputSegmentsInCurrentPeriod") - 1);
  }
  objc_msgSend(v12, "throughputSamples");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v16);
  v18 = v17;

  if (v18 > 120.0)
    goto LABEL_8;
  v22 = objc_alloc_init(WLThroughputSample);
  objc_msgSend(v12, "throughputSegmentStartDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLThroughputSample setStartDate:](v22, "setStartDate:", v23);

  -[WLThroughputSample setEndDate:](v22, "setEndDate:", v11);
  -[WLThroughputSample startDate](v22, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v24);
  -[WLThroughputSample setDuration:](v22, "setDuration:");

  -[WLThroughputSample setBytes:](v22, "setBytes:", a3);
  -[WLThroughputSample setExpectedBytes:](v22, "setExpectedBytes:", a4);
  -[WLThroughputSample duration](v22, "duration");
  v26 = v25;
  v27 = -[WLThroughputSample bytes](v22, "bytes");
  -[WLThroughputSample duration](v22, "duration");
  if (v28 == 0.0)
  {
    v31 = 0;
  }
  else
  {
    v29 = (double)-[WLThroughputSample bytes](v22, "bytes");
    -[WLThroughputSample duration](v22, "duration");
    v31 = (unint64_t)(v29 / v30);
  }
  v57 = v31;
  _WLLog();
  objc_msgSend(v12, "throughputSamples", v26, v27, v57);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v22);

  objc_msgSend(v12, "setThroughputBytesInCurrentPeriod:", objc_msgSend(v12, "throughputBytesInCurrentPeriod") + -[WLThroughputSample bytes](v22, "bytes"));
  objc_msgSend(v12, "setThroughputSegmentsInCurrentPeriod:", objc_msgSend(v12, "throughputSegmentsInCurrentPeriod") + 1);
  objc_msgSend(v12, "setThroughputSegmentStartDate:", v11);
  objc_msgSend(v12, "throughputSamples");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "startDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v35);
  v37 = v36;

  v38 = -1.0;
  if (v37 > 0.0)
  {
    if (objc_msgSend(v12, "throughputBytesInCurrentPeriod"))
    {
      if (objc_msgSend(v12, "throughputSegmentsInCurrentPeriod"))
      {
        v39 = (double)(unint64_t)objc_msgSend(v12, "throughputBytesInCurrentPeriod") / v37;
        v40 = (double)(unint64_t)objc_msgSend(v12, "throughputSegmentsInCurrentPeriod") / v37;
        v41 = objc_msgSend(v12, "throughputBytesInCurrentPeriod");
        v59 = objc_msgSend(v12, "throughputSegmentsInCurrentPeriod");
        v55 = v37;
        _WLLog();
        if (v39 > 0.0 && v40 > 0.0)
        {
          v42 = (unint64_t)((double)(unint64_t)objc_msgSend(v12, "expectedDownloadBytesRemainingForItemsWithConcreteSizes", *(_QWORD *)&v37, v41, (unint64_t)v39, v59, *(_QWORD *)&v40)/ v39);
          v43 = (unint64_t)((double)(unint64_t)objc_msgSend(v12, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes")/ v40);
          v38 = (double)(v43 + v42);
          v44 = objc_msgSend(v12, "expectedDownloadBytesRemainingForItemsWithConcreteSizes");
          v58 = objc_msgSend(v12, "expectedDownloadSegmentsRemainingForItemsWithEstimatedSizes");
          v55 = *(double *)&v44;
          _WLLog();
          if (v43 + v42)
          {
            v45 = CFSTR("all items");
            if (!v42)
              v45 = CFSTR("items without sizes");
            if (v43)
              v46 = v45;
            else
              v46 = CFSTR("items with sizes");
            objc_msgSend(MEMORY[0x24BDBCE60], "date", *(_QWORD *)&v55, v42, v58, v43, (unint64_t)v38);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "timeEstimateAccuracyTracker");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "didCalculateTimeEstimate:atDate:associatedObject:", (unint64_t)v38, v47, v46);

          }
        }
      }
    }
  }
  v49 = (double)(unint64_t)objc_msgSend(v12, "completedDownloadSegmentCount", *(_QWORD *)&v55);
  v50 = objc_msgSend(v12, "expectedDownloadSegmentsRemaining");
  v51 = objc_msgSend(v12, "completedDownloadSegmentCount");
  if (v49 / (double)(unint64_t)(v51 + v50) * 0.8 <= 0.8)
    v52 = v49 / (double)(unint64_t)(v51 + v50) * 0.8;
  else
    v52 = 0.8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v52);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  -[WLMigrator _setProgressTo:context:](self, "_setProgressTo:context:", v12, v52, v56);
  if (v38 != -1.0)
  {
    objc_msgSend(v12, "delegate");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "dataMigrator:didUpdateRemainingDownloadTime:", self, v38);

  }
  return v38;
}

- (void)_reportTimeEstimatesWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeEstimateAccuracyTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "estimatesDidResolveAtDate:block:", v6, &__block_literal_global_260);
}

void __46__WLMigrator__reportTimeEstimatesWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  id v10;

  v8 = (void *)MEMORY[0x24BEC2850];
  v9 = a5;
  objc_msgSend(v8, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didResolveTimeEstimate:forDownloadTask:threshold:actualTime:", a2, v9, a3, a4);

}

- (id)_importDataWithContext:(id)a3 failureDetailsBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void (**v52)(id, id);
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *context;
  uint64_t v60;
  void *v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v52 = (void (**)(id, id))a4;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v5, "migrators");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (!v57)
  {

    v8 = 0;
    v7 = 0;
    goto LABEL_34;
  }
  v7 = 0;
  v8 = 0;
  v56 = *(_QWORD *)v77;
  v58 = v6;
  do
  {
    v9 = 0;
    v10 = v7;
    do
    {
      if (*(_QWORD *)v77 != v56)
        objc_enumerationMutation(v6);
      v60 = v9;
      v7 = *(id *)(*((_QWORD *)&v76 + 1) + 8 * v9);

      context = (void *)MEMORY[0x2207BB344](objc_msgSend(v7, "setState:", CFSTR("importing")));
      objc_msgSend(v5, "sqlController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "statisticsForContentType:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v61 = v13;
      objc_msgSend(v13, "importStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImportStartDate:", v15);

        objc_msgSend(v13, "setImportStartBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
        objc_msgSend(v5, "sqlController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateStatistics:", v13);

      }
      objc_msgSend(v5, "sqlController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountsForMigrator:device:", v7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v55 = v8;
        objc_msgSend(v5, "sqlController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v19;
        objc_msgSend(v20, "summariesForAccounts:sortedByModifiedDate:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v73 != v25)
                objc_enumerationMutation(v22);
              v27 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x2207BB344]();
              objc_msgSend(v5, "sqlController");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "dataForSummary:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "performPreImportPhaseForSummary:data:", v27, v30);
              objc_autoreleasePoolPop(v28);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
          }
          while (v24);
        }

        v6 = v58;
        v19 = v54;
        v8 = v55;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "importWillBegin");
        v31 = objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v7, "contentType");
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v52[2](v52, v32);
          v33 = 2;
          v8 = (void *)v31;
          v34 = v60;
          goto LABEL_27;
        }
        v8 = 0;
      }
      objc_msgSend(v5, "sqlController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "summariesForAccounts:sortedByModifiedDate:", v19, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = MEMORY[0x24BDAC760];
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke;
      v70[3] = &unk_24E376890;
      v38 = v5;
      v71 = v38;
      v39 = (void *)MEMORY[0x2207BB4C4](v70);
      objc_msgSend(v38, "dataCoordinator");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v37;
      v68[1] = 3221225472;
      v68[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_2;
      v68[3] = &unk_24E3768B8;
      v41 = v38;
      v69 = v41;
      v62[0] = v37;
      v62[1] = 3221225472;
      v62[2] = __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_3;
      v62[3] = &unk_24E3768E0;
      v62[4] = self;
      v32 = v36;
      v63 = v32;
      v42 = v19;
      v64 = v19;
      v43 = v41;
      v65 = v43;
      v66 = v7;
      v44 = v61;
      v67 = v44;
      objc_msgSend(v40, "importDataForMigrator:fromProvider:forSummaries:summaryStart:summaryCompletion:", v7, v39, v32, v68, v62);

      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_25;
      objc_msgSend(v7, "importDidEnd");
      v45 = objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        v8 = 0;
LABEL_25:
        v34 = v60;
        objc_msgSend(v44, "setImportEndBytesFree:", +[WLMigrator _bytesFreeOnDevice](WLMigrator, "_bytesFreeOnDevice"));
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setImportEndDate:", v47);

        objc_msgSend(v43, "sqlController");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "updateStatistics:", v44);

        objc_msgSend(v44, "importEndDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "importStartDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "timeIntervalSinceDate:", v49);
        objc_msgSend(v7, "addWorkingTime:", (unint64_t)v50);

        v33 = 0;
        goto LABEL_26;
      }
      objc_msgSend(v7, "contentType");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v52[2](v52, v46);
      v33 = 2;
      v8 = (void *)v45;
      v34 = v60;
LABEL_26:

      v19 = v42;
      v6 = v58;
LABEL_27:

      objc_autoreleasePoolPop(context);
      if (v33)
        goto LABEL_30;
      objc_msgSend(v7, "setState:", CFSTR("imported"));
      v9 = v34 + 1;
      v10 = v7;
    }
    while (v9 != v57);
    v57 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  }
  while (v57);
LABEL_30:

  if (v8 && v7)
    objc_msgSend(v7, "setState:", CFSTR("importing_error"));
LABEL_34:

  return v8;
}

id __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sqlController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForSummary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sqlController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWillImportForSummary:", v3);

}

void __57__WLMigrator__importDataWithContext_failureDetailsBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "migrators");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_progressIncrementForImportedSummary:summaries:accounts:migrators:", v5, v8, v9, v10);
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "_incrementProgressBy:context:", *(_QWORD *)(a1 + 56), v12);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "contentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "importDidFailSilentlyForContentType:", v14);

    objc_msgSend(*(id *)(a1 + 56), "sqlController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMigrationError:forSummary:", v6, v5);

    objc_msgSend(*(id *)(a1 + 72), "setImportFailedRecordCount:", objc_msgSend(*(id *)(a1 + 72), "importFailedRecordCount") + 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "sqlController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeDataAndSetDidImportForSummary:", v5);

    if (objc_msgSend(v5, "storeDataAsFile"))
    {
      v17 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v5, "dataFilePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fileURLWithPath:isDirectory:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v21 = objc_msgSend(v20, "removeItemAtURL:error:", v19, &v28);
      v6 = v28;

      v22 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v6;
      v24 = v22;
      v25 = v19;
      _WLLog();

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 72), "setImportRecordCount:", objc_msgSend(*(id *)(a1 + 72), "importRecordCount", v24, v25, v26, v27) + 1);
  }
  objc_msgSend(*(id *)(a1 + 56), "sqlController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateStatistics:", *(_QWORD *)(a1 + 72));

}

- (double)_progressIncrementForImportedSummary:(id)a3 summaries:(id)a4 accounts:(id)a5 migrators:(id)a6
{
  id v8;
  id v9;
  double v10;
  unint64_t v11;
  unint64_t v12;

  v8 = a6;
  v9 = a5;
  v10 = 1.0 / (double)(unint64_t)objc_msgSend(a4, "count");
  v11 = objc_msgSend(v9, "count");

  v12 = objc_msgSend(v8, "count");
  return v10 * (1.0 / (double)v11) * (1.0 / (double)v12) * 0.2;
}

- (void)_logStatisticsAndSendStatisticsTelemetryWithContext:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v4 = v3;
  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "sourceDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLocal");

  _WLLog();
  objc_msgSend(v5, "sqlController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLStatistics fetchContentType](WLStatistics, "fetchContentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statisticsForContentType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v10;
  objc_msgSend(v10, "fetchLogString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v5, "migrators", v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v58)
  {
    v56 = *(_QWORD *)v60;
    v43 = v7;
    v42 = v5;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v60 != v56)
          objc_enumerationMutation(v11);
        v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v5, "sqlController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "contentType");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "statisticsForContentType:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = v16;
        _WLLog();
        if ((v7 & 1) == 0)
        {
          objc_msgSend(v13, "contentType", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("unsupported"));

          if ((v18 & 1) == 0)
          {
            if (v16)
            {
              objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "contentType");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = objc_msgSend(v16, "downloadByteCount");
              v49 = objc_msgSend(v16, "importRecordCount");
              v47 = objc_msgSend(v16, "importFailedRecordCount");
              v46 = objc_msgSend(v16, "downloadDuration");
              v45 = objc_msgSend(v16, "importDuration");
              objc_msgSend(v5, "metadata");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "deviceOSVersion");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "metadata");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "deviceModel");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "metadata");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "clientVersion");
              v22 = v11;
              v23 = v4;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "contentTypeDidComplete:downloadByteCount:importRecordCount:importFailedRecordCount:downloadDuration:importDuration:android:model:version:", v54, v50, v49, v47, v46, v45, v44, v20, v24);

              v4 = v23;
              v11 = v22;

              v7 = v43;
              v5 = v42;
            }
          }
        }
        objc_msgSend(v5, "aggregateStatistics", v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDownloadDuration:", objc_msgSend(v25, "downloadDuration") + objc_msgSend(v16, "downloadDuration"));

        objc_msgSend(v5, "aggregateStatistics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setDownloadByteCount:", objc_msgSend(v26, "downloadByteCount") + objc_msgSend(v16, "downloadByteCount"));

        objc_msgSend(v5, "aggregateStatistics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setImportRecordCount:", objc_msgSend(v27, "importRecordCount") + objc_msgSend(v16, "importRecordCount"));

        objc_msgSend(v5, "aggregateStatistics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setImportFailedRecordCount:", objc_msgSend(v28, "importFailedRecordCount") + objc_msgSend(v16, "importFailedRecordCount"));

      }
      v58 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v58);
  }

  objc_msgSend(v5, "aggregateStatistics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "aggregateStatistics", v40);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v29, "downloadByteCount");
    v55 = objc_msgSend(v29, "importRecordCount");
    v53 = objc_msgSend(v29, "importFailedRecordCount");
    v51 = objc_msgSend(v29, "downloadDuration");
    v31 = objc_msgSend(v29, "importDuration");
    objc_msgSend(v5, "metadata");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "deviceOSVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "deviceModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "clientVersion");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "contentTypeDidComplete:downloadByteCount:importRecordCount:importFailedRecordCount:downloadDuration:importDuration:android:model:version:", CFSTR("(aggregate)"), v57, v55, v53, v51, v31, v33, v35, v37);

  }
  _WLLog();

}

+ (id)_systemVersion
{
  void *v2;
  void *v3;

  v2 = (void *)_CFCopySystemVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1F0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)close:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __20__WLMigrator_close___block_invoke;
  v6[3] = &unk_24E376908;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[WLMigrator finalizeMigratableAppsWithCompletion:](self, "finalizeMigratableAppsWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __20__WLMigrator_close___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cleanup");
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)cleanup
{
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x24BEC2810], "isInternal") & 1) == 0)
  {
    NSHomeDirectory();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/WelcomeKit/"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[WLMigrator _deleteDownloadsPath:](self, "_deleteDownloadsPath:", v4);
  }
}

- (void)finalizeMigratableAppsWithCompletion:(id)a3
{
  id v4;
  WLSQLController *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  WLMigrator *v10;
  WLSQLController *v11;
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(WLSQLController);
  -[WLSQLController migratableAppsForAllDevices](v5, "migratableAppsForAllDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  if (objc_msgSend(v6, "count", v7))
  {
    _WLLog();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke;
    v8[3] = &unk_24E376958;
    v9 = v6;
    v10 = self;
    v11 = v5;
    v12 = v4;
    +[WLMigrator _presentPromptForMigrableApps:](WLMigrator, "_presentPromptForMigrableApps:", v8);

  }
  else
  {
    -[WLMigrator _cleanUpAfterFinalizeMigratableAppsWithSQLController:completion:](self, "_cleanUpAfterFinalizeMigratableAppsWithSQLController:completion:", v5, v4);
  }

}

void __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  objc_msgSend(MEMORY[0x24BEC2850], "sharedInstance", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDidChooseToInstallMigratableApps:", a2);

  if ((_DWORD)a2)
  {
    _WLLog();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke_2;
    v7[3] = &unk_24E376930;
    v5 = *(_QWORD *)(a1 + 32);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    +[WLAppMigrator installMigratableApps:completion:](WLAppMigrator, "installMigratableApps:completion:", v5, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_cleanUpAfterFinalizeMigratableAppsWithSQLController:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

uint64_t __51__WLMigrator_finalizeMigratableAppsWithCompletion___block_invoke_2(uint64_t a1)
{
  _WLLog();
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpAfterFinalizeMigratableAppsWithSQLController:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)_presentPromptForMigrableApps:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFDictionary *v8;
  CFUserNotificationRef v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  CFUserNotificationRef v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15[0] = *MEMORY[0x24BDBD6D8];
  WLLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = *MEMORY[0x24BDBD6E0];
  WLLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v5;
  v15[2] = *MEMORY[0x24BDBD6F8];
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v6;
  v15[3] = *MEMORY[0x24BDBD6F0];
  WLLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v9 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v8);
  dispatch_get_global_queue(25, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__WLMigrator__presentPromptForMigrableApps___block_invoke;
  block[3] = &unk_24E376980;
  v13 = v3;
  v14 = v9;
  v11 = v3;
  dispatch_async(v10, block);

}

uint64_t __44__WLMigrator__presentPromptForMigrableApps___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 40), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), responseFlags == 0);
}

- (void)_cleanUpAfterFinalizeMigratableAppsWithSQLController:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = a3;
  objc_msgSend(v5, "deleteMigratableAppsForAllDevices");
  objc_msgSend(v5, "deleteSuggestedAppBundleIDsForAllDevices");

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

+ (BOOL)stashDataLocally
{
  return objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("WLStashDataLocally")) == 1;
}

+ (void)setStashDataLocally:(BOOL)a3
{
  objc_msgSend(MEMORY[0x24BEC2830], "setBool:forKey:", a3, CFSTR("WLStashDataLocally"));
}

+ (BOOL)_shouldContinueMigrationFromAnotherDevice
{
  if (_shouldContinueMigrationFromAnotherDevice_onceToken != -1)
    dispatch_once(&_shouldContinueMigrationFromAnotherDevice_onceToken, &__block_literal_global_309);
  return _shouldContinueMigrationFromAnotherDevice_shouldContinueMigrationFromAnotherDevice;
}

uint64_t __55__WLMigrator__shouldContinueMigrationFromAnotherDevice__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("WLContinueMigrationFromAnotherDevice"));
  _shouldContinueMigrationFromAnotherDevice_shouldContinueMigrationFromAnotherDevice = (_DWORD)result == 1;
  if ((_DWORD)result == 1)
    return _WLLog();
  return result;
}

+ (BOOL)_shouldTerminateMigrationBeforeImport
{
  if (_shouldTerminateMigrationBeforeImport_onceToken != -1)
    dispatch_once(&_shouldTerminateMigrationBeforeImport_onceToken, &__block_literal_global_314);
  return _shouldTerminateMigrationBeforeImport_shouldTerminateMigrationBeforeImport;
}

uint64_t __51__WLMigrator__shouldTerminateMigrationBeforeImport__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("WLTerminateMigrationBeforeImport"));
  _shouldTerminateMigrationBeforeImport_shouldTerminateMigrationBeforeImport = (_DWORD)result == 1;
  if ((_DWORD)result == 1)
    return _WLLog();
  return result;
}

- (BOOL)_shouldTerminateMigrationOnError
{
  if (_shouldTerminateMigrationOnError_onceToken != -1)
    dispatch_once(&_shouldTerminateMigrationOnError_onceToken, &__block_literal_global_319);
  return _shouldTerminateMigrationOnError_shouldTerminateMigrationOnError;
}

uint64_t __46__WLMigrator__shouldTerminateMigrationOnError__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("TolerateMigrationErrors"));
  _shouldTerminateMigrationOnError_shouldTerminateMigrationOnError = (_DWORD)result != 1;
  return result;
}

- (void)_setProgressTo:(double)a3 context:(id)a4
{
  void *v6;
  double v7;
  id obj;

  obj = a4;
  objc_sync_enter(obj);
  objc_msgSend(obj, "setProgress:", a3);
  objc_msgSend(obj, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "dataMigrator:didUpdateProgressPercentage:", self, v7);

  _WLLog();
  objc_sync_exit(obj);

}

- (void)_incrementProgressBy:(double)a3 context:(id)a4
{
  double v6;
  void *v7;
  double v8;
  id obj;

  obj = a4;
  objc_sync_enter(obj);
  objc_msgSend(obj, "progress");
  objc_msgSend(obj, "setProgress:", v6 + a3);
  objc_msgSend(obj, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "progress");
  *(float *)&v8 = v8;
  objc_msgSend(v7, "dataMigrator:didUpdateProgressPercentage:", self, v8);

  objc_msgSend(obj, "progress");
  _WLLog();
  objc_sync_exit(obj);

}

- (void)_updateSourceWithProgress:(double)a3 remainingTime:(double)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  void (**v27)(_QWORD);

  v10 = a5;
  if (a6)
    v11 = a6;
  else
    v11 = &__block_literal_global_326;
  v12 = (void (**)(_QWORD))MEMORY[0x2207BB4C4](v11);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastProgressSentDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 >= 5.0 || (objc_msgSend(v10, "lastProgressSentToAndroidDevice"), a3 == 0.8) || a3 - v17 >= 0.01)
  {
    objc_msgSend(v10, "setLastProgressSentToAndroidDevice:", a3);
    objc_msgSend(v10, "setLastProgressSentDate:", v13);
    objc_msgSend(v10, "lastProgressSentToAndroidDevice");
    v19 = v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

    objc_msgSend(v10, "dataCoordinator", self, v19, v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastProgressSentToAndroidDevice");
    v23 = v22;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __73__WLMigrator__updateSourceWithProgress_remainingTime_context_completion___block_invoke_2;
    v25[3] = &unk_24E376A28;
    v25[4] = self;
    v26 = v10;
    v27 = v12;
    objc_msgSend(v20, "updateSource:withProgress:remainingTime:completion:", v21, v25, v23, a4);

  }
  else
  {
    v12[2](v12);
  }

}

uint64_t __73__WLMigrator__updateSourceWithProgress_remainingTime_context_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v8;

  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "lastProgressSentToAndroidDevice");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _WLLog();

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

+ (unint64_t)_bytesFreeOnDevice
{
  void *v2;
  unint64_t v3;
  void *v4;

  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BED8690]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_msgSend(v4, "unsignedLongLongValue");
    else
      v3 = 0;

  }
  return v3;
}

- (void)deleteMessages
{
  WLMessagesMigrator *v2;

  _WLLog();
  v2 = objc_alloc_init(WLMessagesMigrator);
  -[WLMessagesMigrator deleteData](v2, "deleteData");

}

- (WLSocketHandler)activeSocketHandler
{
  return (WLSocketHandler *)objc_loadWeakRetained((id *)&self->_activeSocketHandler);
}

- (void)setActiveSocketHandler:(id)a3
{
  objc_storeWeak((id *)&self->_activeSocketHandler, a3);
}

- (WLMigrationDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_activeSocketHandler);
}

@end
