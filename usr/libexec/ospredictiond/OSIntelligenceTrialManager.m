@implementation OSIntelligenceTrialManager

- (OSIntelligenceTrialManager)init
{
  OSIntelligenceTrialManager *v2;
  OSIntelligenceTrialManager *v3;
  os_log_t v4;
  OS_os_log *log;
  uint64_t v6;
  TRIClient *trialClient;
  NSObject *v8;
  TRIClient *v9;
  uint64_t v10;
  TRITrackingId *trialTrackingID;
  uint64_t v12;
  NSString *trialNamespaceName;
  TRIClient *v14;
  NSString *v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  NSMutableArray *updateHandlers;
  TRIClient *v24;
  NSString *v25;
  id v26;
  _QWORD v28[4];
  OSIntelligenceTrialManager *v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  TRIClient *v35;

  v33.receiver = self;
  v33.super_class = (Class)OSIntelligenceTrialManager;
  v2 = -[OSIntelligenceTrialManager init](&v33, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = os_log_create("com.apple.osintelligence", "chargeprediction.trialmanager");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 220));
    trialClient = v3->_trialClient;
    v3->_trialClient = (TRIClient *)v6;

    v8 = v3->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_trialClient;
      *(_DWORD *)buf = 138412290;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    v10 = objc_claimAutoreleasedReturnValue(-[TRIClient trackingId](v3->_trialClient, "trackingId"));
    trialTrackingID = v3->_trialTrackingID;
    v3->_trialTrackingID = (TRITrackingId *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](TRINamespace, "namespaceNameFromId:", 251));
    trialNamespaceName = v3->_trialNamespaceName;
    v3->_trialNamespaceName = (NSString *)v12;

    v14 = v3->_trialClient;
    v15 = v3->_trialNamespaceName;
    v31 = 0;
    v32 = 0;
    v16 = -[TRIClient trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:](v14, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", v15, &v32, 0, &v31);
    v17 = v32;
    v18 = v32;
    v19 = v31;
    v20 = v31;
    if ((v16 & 1) == 0)
    {
      v21 = v3->_log;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", buf, 2u);
      }
    }
    objc_storeStrong((id *)&v3->_experimentID, v17);
    objc_storeStrong((id *)&v3->_treatmentID, v19);
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    updateHandlers = v3->_updateHandlers;
    v3->_updateHandlers = (NSMutableArray *)v22;

    objc_initWeak((id *)buf, v3);
    v24 = v3->_trialClient;
    v25 = v3->_trialNamespaceName;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000F6F0;
    v28[3] = &unk_100060BE8;
    objc_copyWeak(&v30, (id *)buf);
    v29 = v3;
    v26 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v24, "addUpdateHandlerForNamespaceName:usingBlock:", v25, v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
  return v3;
}

+ (id)sharedChargePredictionInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F8A4;
  block[3] = &unk_100060720;
  block[4] = a1;
  if (qword_100076860 != -1)
    dispatch_once(&qword_100076860, block);
  return (id)qword_100076868;
}

- (void)loadTrialUpdates
{
  os_unfair_lock_s *p_lock;
  TRITrackingId *v4;
  TRITrackingId *trialTrackingID;
  NSString *v6;
  NSString *trialNamespaceName;
  TRIClient *trialClient;
  NSString *v9;
  unsigned __int8 v10;
  NSString *v11;
  NSString *v12;
  OS_os_log *log;
  NSString *experimentID;
  NSString *v15;
  NSString *treatmentID;
  uint8_t v17[16];
  id v18;
  id v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (TRITrackingId *)-[TRIClient newTrackingId](self->_trialClient, "newTrackingId");
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v4;

  v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[TRINamespace namespaceNameFromId:](TRINamespace, "namespaceNameFromId:", 251));
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v6;

  trialClient = self->_trialClient;
  v9 = self->_trialNamespaceName;
  v18 = 0;
  v19 = 0;
  v10 = -[TRIClient trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:](trialClient, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", v9, &v19, 0, &v18);
  v11 = (NSString *)v19;
  v12 = (NSString *)v18;
  if ((v10 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", v17, 2u);
    }
  }
  experimentID = self->_experimentID;
  self->_experimentID = v11;
  v15 = v11;

  treatmentID = self->_treatmentID;
  self->_treatmentID = v12;

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)longFactorForName:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", a3));
  v4 = objc_msgSend(v3, "longValue");

  return (int64_t)v4;
}

- (double)doubleFactorForName:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", a3));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)addUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *updateHandlers;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  updateHandlers = self->_updateHandlers;
  v7 = objc_retainBlock(v5);

  -[NSMutableArray addObject:](updateHandlers, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial engagement model", v11, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", CFSTR("trialEngageModel")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v8, v3));

  return v9;
}

- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  OS_os_log *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading trial duration model", v11, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", CFSTR("trialDurationModel")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v8, v3));

  return v9;
}

- (double)loadTrialThreshold
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", CFSTR("engagementThreshold")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Threshold value is %lf", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialAdjustedHours
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", CFSTR("adjustedHours")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Duration hours is %lf", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialMinInputChargeDuration
{
  void *v3;
  NSObject *log;
  NSObject *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OSIntelligenceTrialManager trialFactor:](self, "trialFactor:", CFSTR("minInputChargeDuration")));
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Minimum charge duration considered for model input is %lf", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(v3, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (id)trialFactor:(id)a3
{
  return -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  __CFString *v11;
  OS_os_log *log;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  OS_os_log *v20;
  unsigned __int8 v21;
  __CFString *v22;
  OS_os_log *v23;
  OS_os_log *v24;
  __CFString *v25;
  void *v26;
  unsigned int v27;
  __CFString *v28;
  __CFString *v29;
  OS_os_log *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  OS_os_log *v41;
  OS_os_log *v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  OS_os_log *v48;
  __CFString *v49;
  OS_os_log *v50;
  void *v51;
  OS_os_log *v52;
  unsigned __int8 v53;
  OS_os_log *v54;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  id v68;
  char v69;
  const __CFString *v70;
  uint8_t buf[4];
  const __CFString *v72;
  __int16 v73;
  __CFString *v74;
  __int16 v75;
  __CFString *v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];

  v4 = a4;
  v6 = (__CFString *)a3;
  v7 = os_transaction_create("com.apple.osintelligence.trialmanager.loadmodel");
  v8 = (void *)v7;
  if (v6)
  {
    v60 = (void *)v7;
    if ((-[__CFString isAbsolutePath](v6, "isAbsolutePath") & 1) == 0)
    {
      v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathForResource:ofType:", v6, 0));

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v11)
      {
        v13 = v11;

        v6 = v13;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v69 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v6, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v15, CFSTR("c")));

    v79[0] = CFSTR("/var/mobile/Library/OSIntelligence");
    v79[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v17));

    if (v4)
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString path](v18, "path"));
      v20 = self->_log;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
      }
      v68 = 0;
      v21 = objc_msgSend(v14, "removeItemAtPath:error:", v19, &v68);
      v22 = (__CFString *)v68;
      if ((v21 & 1) == 0)
      {
        v23 = self->_log;
        if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v19;
          v73 = 2112;
          v74 = v22;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
        }
      }

    }
    else
    {
      v22 = 0;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v18, "path"));
    v27 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v26, &v69);

    if (v27)
    {
      v67 = v22;
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v18, &v67));
      v29 = v67;

      if (v29)
      {
        v30 = self->_log;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v18;
          v73 = 2112;
          v74 = v29;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        v25 = 0;
      }
      else
      {
        v28 = v28;
        v25 = v28;
      }
      goto LABEL_54;
    }
    v58 = v18;
    v59 = v16;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "temporaryDirectory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "path"));
    v78[0] = v32;
    v33 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v33, "UUIDString"));
    v78[1] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 2));
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v35));

    v66 = v22;
    LOBYTE(v33) = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v28, 1, 0, &v66);
    v29 = v66;

    if ((v33 & 1) == 0)
    {
      v41 = self->_log;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v72 = v28;
        v73 = 2112;
        v74 = v29;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
      }
      v25 = 0;
      v18 = (__CFString *)v58;
      v16 = v59;
      goto LABEL_54;
    }
    v77[0] = v28;
    v36 = objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v6, "lastPathComponent"));
    v77[1] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 2));
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v37));

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v38, "path"));
    v65 = v29;
    LOBYTE(v36) = objc_msgSend(v14, "copyItemAtPath:toPath:error:", v6, v39, &v65);
    v40 = v65;

    if ((v36 & 1) == 0)
    {
      v42 = self->_log;
      v18 = (__CFString *)v58;
      v16 = v59;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v72 = v6;
        v73 = 2112;
        v74 = v38;
        v75 = 2112;
        v76 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_DEFAULT, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
      }
      v25 = 0;
      goto LABEL_53;
    }

    v18 = (__CFString *)v58;
    if ((objc_msgSend(v14, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/OSIntelligence"), &v69) & 1) != 0)
    {
      v40 = 0;
    }
    else
    {
      v64 = 0;
      v43 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/OSIntelligence"), 1, 0, &v64);
      v40 = (__CFString *)v64;
      if ((v43 & 1) == 0)
      {
        v52 = self->_log;
        if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v72 = CFSTR("/var/mobile/Library/OSIntelligence");
          v73 = 2112;
          v74 = v40;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v52, OS_LOG_TYPE_DEFAULT, "Failed to create directory at path %@ -- %@", buf, 0x16u);
        }
        v25 = 0;
        v16 = v59;
        goto LABEL_53;
      }
    }
    v70 = CFSTR("/var/mobile/Library/OSIntelligence");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 1));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v44));

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions"));
    v63 = 0;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[MLCompiler compileSpecificationAtURL:toURL:options:error:](MLCompiler, "compileSpecificationAtURL:toURL:options:error:", v38, v45, v46, &v63));
    v40 = (__CFString *)v63;

    if (v40)
    {
      v48 = self->_log;
      v16 = v59;
      if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v72 = v38;
        v73 = 2112;
        v74 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v48, OS_LOG_TYPE_DEFAULT, "Failed to compile model: %@ -- %@", buf, 0x16u);
      }
      v25 = 0;
    }
    else
    {
      v62 = 0;
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[MLModel modelWithContentsOfURL:error:](MLModel, "modelWithContentsOfURL:error:", v58, &v62));
      v49 = (__CFString *)v62;
      v16 = v59;
      if (v49)
      {
        v40 = v49;
        v50 = self->_log;
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v72 = v58;
          v73 = 2112;
          v74 = v40;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v50, OS_LOG_TYPE_DEFAULT, "Failed to load model: %@ -- %@", buf, 0x16u);
        }
        v25 = 0;
        v51 = v57;
      }
      else
      {
        v56 = v47;
        v61 = 0;
        v53 = objc_msgSend(v14, "removeItemAtPath:error:", v28, &v61);
        v40 = (__CFString *)v61;
        if ((v53 & 1) == 0)
        {
          v54 = self->_log;
          if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v72 = v28;
            v73 = 2112;
            v74 = v40;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
          }
        }
        v25 = v57;
        v51 = v57;
        v47 = v56;
      }

    }
LABEL_53:

    v29 = v40;
LABEL_54:

    v8 = v60;
    goto LABEL_55;
  }
  v24 = self->_log;
  if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  v25 = 0;
LABEL_55:

  return v25;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
{
  objc_storeStrong((id *)&self->_trialNamespaceName, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTrialTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_updateHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
