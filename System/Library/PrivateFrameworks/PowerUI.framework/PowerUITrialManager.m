@implementation PowerUITrialManager

- (PowerUITrialManager)initWithDefaultsDomain:(id)a3
{
  id v5;
  PowerUITrialManager *v6;
  PowerUITrialManager *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  TRIClient *trialClient;
  NSObject *v12;
  TRIClient *v13;
  uint64_t v14;
  TRITrackingId *trialTrackingID;
  uint64_t v16;
  NSString *trialNamespaceName;
  TRIClient *v18;
  NSString *v19;
  char v20;
  NSString *v21;
  NSString *v22;
  NSObject *v23;
  NSString *experimentID;
  NSString *v25;
  NSString *treatmentID;
  NSString *v27;
  uint64_t v28;
  NSMutableArray *updateHandlers;
  TRIClient *v30;
  NSString *v31;
  id v32;
  _QWORD v34[4];
  PowerUITrialManager *v35;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  TRIClient *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PowerUITrialManager;
  v6 = -[PowerUITrialManager init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = os_log_create("com.apple.powerui.smartcharging", "trialmanager");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of TrialManager init"));
    objc_storeStrong((id *)&v7->_defaultsDomain, a3);
    objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", 220);
    v10 = objc_claimAutoreleasedReturnValue();
    trialClient = v7->_trialClient;
    v7->_trialClient = (TRIClient *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_trialClient;
      *(_DWORD *)buf = 138412290;
      v40 = v13;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    -[TRIClient trackingId](v7->_trialClient, "trackingId");
    v14 = objc_claimAutoreleasedReturnValue();
    trialTrackingID = v7->_trialTrackingID;
    v7->_trialTrackingID = (TRITrackingId *)v14;

    objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", 251);
    v16 = objc_claimAutoreleasedReturnValue();
    trialNamespaceName = v7->_trialNamespaceName;
    v7->_trialNamespaceName = (NSString *)v16;

    v18 = v7->_trialClient;
    v19 = v7->_trialNamespaceName;
    v36 = 0;
    v37 = 0;
    v20 = -[TRIClient trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:](v18, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", v19, &v37, 0, &v36);
    v21 = (NSString *)v37;
    v22 = (NSString *)v36;
    if ((v20 & 1) == 0)
    {
      v23 = v7->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v23, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", buf, 2u);
      }
    }
    experimentID = v7->_experimentID;
    v7->_experimentID = v21;
    v25 = v21;

    treatmentID = v7->_treatmentID;
    v7->_treatmentID = v22;
    v27 = v22;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    updateHandlers = v7->_updateHandlers;
    v7->_updateHandlers = (NSMutableArray *)v28;

    v30 = v7->_trialClient;
    v31 = v7->_trialNamespaceName;
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __46__PowerUITrialManager_initWithDefaultsDomain___block_invoke;
    v34[3] = &unk_24D3FB668;
    v35 = v7;
    v32 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v30, "addUpdateHandlerForNamespaceName:usingBlock:", v31, v34);
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of TrialManager init"));

  }
  return v7;
}

void __46__PowerUITrialManager_initWithDefaultsDomain___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "updateHandlers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "loadTrialUpdates");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)loadTrialUpdates
{
  TRITrackingId *v3;
  TRITrackingId *trialTrackingID;
  NSString *v5;
  NSString *trialNamespaceName;
  TRIClient *trialClient;
  NSString *v8;
  char v9;
  NSString *v10;
  NSString *v11;
  NSObject *log;
  NSString *experimentID;
  NSString *v14;
  NSString *treatmentID;
  uint8_t v16[16];
  id v17;
  id v18;

  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of loadTrialUpdates"));
  os_unfair_lock_lock(&self->_lock);
  v3 = (TRITrackingId *)-[TRIClient newTrackingId](self->_trialClient, "newTrackingId");
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v3;

  objc_msgSend(MEMORY[0x24BEBA990], "namespaceNameFromId:", 251);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v5;

  trialClient = self->_trialClient;
  v8 = self->_trialNamespaceName;
  v17 = 0;
  v18 = 0;
  v9 = -[TRIClient trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:](trialClient, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:", v8, &v18, 0, &v17);
  v10 = (NSString *)v18;
  v11 = (NSString *)v17;
  if ((v9 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", v16, 2u);
    }
  }
  experimentID = self->_experimentID;
  self->_experimentID = v10;
  v14 = v10;

  treatmentID = self->_treatmentID;
  self->_treatmentID = v11;

  os_unfair_lock_unlock(&self->_lock);
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of loadTrialUpdates"));

}

- (int64_t)longFactorForName:(id)a3
{
  void *v3;
  int64_t v4;

  -[PowerUITrialManager trialFactor:](self, "trialFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

- (double)doubleFactorForName:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[PowerUITrialManager trialFactor:](self, "trialFactor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)addUpdateHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *updateHandlers;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  updateHandlers = self->_updateHandlers;
  v7 = (void *)MEMORY[0x2199EC2D0](v5);

  -[NSMutableArray addObject:](updateHandlers, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Loading trial engagement model", v11, 2u);
  }
  -[PowerUITrialManager trialFactor:](self, "trialFactor:", CFSTR("trialEngageModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *log;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];

  v3 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Loading trial duration model", v11, 2u);
  }
  -[PowerUITrialManager trialFactor:](self, "trialFactor:", CFSTR("trialDurationModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:](self, "loadModelFromPath:deleteExistingFiles:", v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

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
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PowerUITrialManager trialFactor:](self, "trialFactor:", CFSTR("engagementThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Threshold value is %lf", (uint8_t *)&v10, 0xCu);

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
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PowerUITrialManager trialFactor:](self, "trialFactor:", CFSTR("adjustedHours"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Duration hours is %lf", (uint8_t *)&v10, 0xCu);

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
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PowerUITrialManager trialFactor:](self, "trialFactor:", CFSTR("minInputChargeDuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = log;
      objc_msgSend(v3, "doubleValue");
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Minimum charge duration considered for model input is %lf", (uint8_t *)&v10, 0xCu);

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

- (BOOL)useTrialEnabledFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  char v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("trialOverride.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", v5, self->_defaultsDomain);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "BOOLValue"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Feature '%@' enabled via defaults override", buf, 0xCu);
    }
    v8 = 1;
  }
  else
  {
    -[PowerUITrialManager trialFactor:](self, "trialFactor:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_log;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PowerUITrialManager useTrialEnabledFeature:].cold.2(v10, v9);
      v8 = objc_msgSend(v9, "BOOLeanValue");
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PowerUITrialManager useTrialEnabledFeature:].cold.1();
      v8 = 0;
    }

  }
  return v8;
}

- (id)trialFactor:(id)a3
{
  return (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, self->_trialNamespaceName);
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *log;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  char v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  char v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  id obj;
  id obja;
  void *v104;
  void *v105;
  _BOOL4 v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id v132;
  id v133;
  char v134;
  _BYTE v135[128];
  const __CFString *v136;
  uint8_t buf[4];
  id v138;
  __int16 v139;
  id v140;
  __int16 v141;
  id v142;
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _BYTE v146[128];
  uint64_t v147;

  v4 = a4;
  v147 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("Beginning of loadModelFromPath"));
  log = self->_log;
  if (v6)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.13();
    if ((objc_msgSend(v6, "isAbsolutePath") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathForResource:ofType:", v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v138 = v10;
        _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v10)
      {
        v12 = v10;

        v6 = v12;
      }

    }
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("\\.(\\d+?)\\."), 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "range");
      objc_msgSend(v6, "substringWithRange:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.12();
    }
    else
    {
      v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.11(v20, v21, v22, v23, v24, v25, v26, v27);
      v18 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = 0;
    if ((objc_msgSend(v28, "fileExistsAtPath:isDirectory:", CFSTR("/var/mobile/Library/PowerUI"), &v134) & 1) != 0)
    {
      v29 = 0;
    }
    else
    {
      v133 = 0;
      v30 = objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/mobile/Library/PowerUI"), 1, 0, &v133);
      v29 = v133;
      if ((v30 & 1) == 0)
      {
        v33 = self->_log;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.10((uint64_t)v29, v33);
        v19 = 0;
        goto LABEL_101;
      }
    }
    if (v18)
    {
      v106 = v4;
      v132 = v29;
      v115 = v28;
      objc_msgSend(v28, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/PowerUI"), &v132);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v132;

      if (v32)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.9();
        v19 = 0;
        goto LABEL_100;
      }
      v110 = v7;
      v112 = v15;
      v108 = v13;
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v34 = v31;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v129;
LABEL_32:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v129 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v38);
          if (objc_msgSend(v39, "containsString:", v18))
            break;
          if (v36 == ++v38)
          {
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v128, v146, 16);
            if (v36)
              goto LABEL_32;
            goto LABEL_38;
          }
        }
        v40 = (void *)MEMORY[0x24BDBCF48];
        v145[0] = CFSTR("/var/mobile/Library/PowerUI");
        v145[1] = v39;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v145, 2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "fileURLWithPathComponents:", v41);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.8();

        v13 = v108;
        v7 = v110;
        v15 = v112;
        if (v29)
        {
          v31 = v29;
          v114 = v18;
          if (v106)
          {
            objc_msgSend(v29, "path");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = self->_log;
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v138 = v42;
              _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
            }
            v127 = 0;
            v44 = objc_msgSend(v115, "removeItemAtPath:error:", v42, &v127);
            v29 = v127;
            if ((v44 & 1) == 0)
            {
              v45 = self->_log;
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v138 = v42;
                v139 = 2112;
                v140 = v29;
                _os_log_impl(&dword_215A71000, v45, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
              }
            }

          }
          else
          {
            v29 = 0;
          }
          v28 = v115;
          goto LABEL_53;
        }
      }
      else
      {
LABEL_38:

        v29 = 0;
        v13 = v108;
        v7 = v110;
        v15 = v112;
      }
      v28 = v115;
    }
    v46 = self->_log;
    v114 = v18;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v46, OS_LOG_TYPE_DEFAULT, "Could not find existing compiled model.", buf, 2u);
    }
    v31 = 0;
LABEL_53:
    objc_msgSend(v31, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v28;
    v49 = objc_msgSend(v28, "fileExistsAtPath:isDirectory:", v47, &v134);

    if (v49)
    {
      v126 = v29;
      objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v31, &v126);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v126;

      v51 = self->_log;
      if (v32)
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.1();
        v19 = 0;
      }
      else
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v51, OS_LOG_TYPE_DEFAULT, "Load existing compiled model.", buf, 2u);
        }
        v19 = v50;
      }

      v28 = v48;
      v18 = v114;
      goto LABEL_100;
    }
    v107 = v31;
    v109 = v13;
    v111 = v7;
    v113 = v15;
    v52 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v48, "temporaryDirectory");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "path");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v144[0] = v54;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "UUIDString");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v144[1] = v56;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v144, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "pathWithComponents:", v57);
    v58 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v58;
    v125 = v29;
    LOBYTE(v58) = objc_msgSend(v48, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v58, 1, 0, &v125);
    v32 = v125;

    v105 = v59;
    if ((v58 & 1) == 0)
    {
      v15 = v113;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.7();
      v19 = 0;
      v13 = v109;
      v7 = v111;
      v28 = v48;
      v18 = v114;
      v31 = v107;
      goto LABEL_99;
    }
    v60 = (void *)MEMORY[0x24BDBCF48];
    v143[0] = v59;
    objc_msgSend(v6, "lastPathComponent");
    v61 = objc_claimAutoreleasedReturnValue();
    v143[1] = v61;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "fileURLWithPathComponents:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v104 = v63;
    objc_msgSend(v63, "path");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v32;
    v116 = v48;
    LOBYTE(v61) = objc_msgSend(v48, "copyItemAtPath:toPath:error:", v6, v64, &v124);
    v65 = v124;

    v15 = v113;
    if ((v61 & 1) == 0)
    {
      v72 = self->_log;
      v13 = v109;
      v7 = v111;
      v18 = v114;
      v31 = v107;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v138 = v6;
        v139 = 2112;
        v140 = v104;
        v141 = 2112;
        v142 = v65;
        _os_log_error_impl(&dword_215A71000, v72, OS_LOG_TYPE_ERROR, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
      }
      v19 = 0;
      v28 = v116;
      goto LABEL_98;
    }
    v66 = (void *)MEMORY[0x24BDBCF48];
    v136 = CFSTR("/var/mobile/Library/PowerUI");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "fileURLWithPathComponents:", v67);
    v68 = objc_claimAutoreleasedReturnValue();

    v18 = v114;
    v31 = v107;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.6();
    v69 = (void *)MEMORY[0x24BDBFF70];
    objc_msgSend(MEMORY[0x24BDBFF78], "defaultOptions");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    v101 = (void *)v68;
    objc_msgSend(v69, "compileSpecificationAtURL:toURL:options:error:", v104, v68, v70, &v123);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v123;

    v13 = v109;
    v7 = v111;
    v100 = v71;
    if (v65)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.5();
    }
    else
    {
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      objc_msgSend(v71, "outputFiles");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
      if (v73)
      {
        v74 = v73;
        v75 = *(_QWORD *)v120;
LABEL_79:
        v76 = 0;
        while (1)
        {
          if (*(_QWORD *)v120 != v75)
            objc_enumerationMutation(obj);
          v77 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v76);
          objc_msgSend(v77, "pathComponents");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "lastObject");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(CFSTR("coremldata.bin"), "isEqualToString:", v79);

          if ((v80 & 1) != 0)
            break;
          if (v74 == ++v76)
          {
            v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
            if (v74)
              goto LABEL_79;
            goto LABEL_85;
          }
        }
        v81 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(v77, "pathComponents");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "pathComponents");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "subarrayWithRange:", 0, objc_msgSend(v83, "count") - 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "fileURLWithPathComponents:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v85)
          goto LABEL_93;
        v13 = v109;
        v7 = v111;
        v15 = v113;
        v31 = v107;
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.4();
        v118 = 0;
        objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v85, &v118);
        obja = (id)objc_claimAutoreleasedReturnValue();
        v86 = v118;
        if (v86)
        {
          v65 = v86;
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.1();
          v19 = 0;
          v87 = obja;
        }
        else
        {
          v117 = 0;
          v97 = objc_msgSend(v116, "removeItemAtPath:error:", v105, &v117);
          v65 = v117;
          if ((v97 & 1) == 0)
          {
            v98 = self->_log;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v138 = v105;
              v139 = 2112;
              v140 = v65;
              _os_log_impl(&dword_215A71000, v98, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
            }
          }
          v99 = self->_log;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v99, OS_LOG_TYPE_DEFAULT, "Successfully compiled trial model", buf, 2u);
          }
          +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:](PowerUISmartChargeUtilities, "logMemoryUsageInternalForEvent:", CFSTR("End of loadModelFromPath"));
          v87 = obja;
          v19 = obja;
        }

        goto LABEL_97;
      }
LABEL_85:

LABEL_93:
      v88 = self->_log;
      v13 = v109;
      v7 = v111;
      v15 = v113;
      v31 = v107;
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.2(v88, v89, v90, v91, v92, v93, v94, v95);
      v65 = 0;
    }
    v19 = 0;
LABEL_97:
    v28 = v116;

LABEL_98:
    v32 = v65;
LABEL_99:

LABEL_100:
    v29 = v32;
LABEL_101:

    goto LABEL_102;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  v19 = 0;
LABEL_102:

  return v19;
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

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)useTrialEnabledFeature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "No feature factor found for feature: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)useTrialEnabledFeature:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a2, "BOOLeanValue");
  _os_log_debug_impl(&dword_215A71000, v3, OS_LOG_TYPE_DEBUG, "Use sleep based predictor: %d", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_215A71000, v0, v1, "Failed to load model: %@ -- %@");
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:(uint64_t)a3 deleteExistingFiles:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Failed to retrieve path of compiled model.", a5, a6, a7, a8, 0);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "properPath set to: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_215A71000, v0, v1, "Failed to compile model: %@ -- %@");
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.6()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_215A71000, v0, OS_LOG_TYPE_DEBUG, "modelUrl: %@ -- workingDirURL: %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_215A71000, v0, v1, "Failed to create directory at path %@ -- %@");
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "Compiled model URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Failed get files in PowerUI directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:(uint64_t)a1 deleteExistingFiles:(NSObject *)a2 .cold.10(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("/var/mobile/Library/PowerUI");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_215A71000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@ -- %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:(uint64_t)a3 deleteExistingFiles:(uint64_t)a4 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_215A71000, a1, a3, "Could not identify asset ID", a5, a6, a7, a8, 0);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_215A71000, v0, v1, "Identified asset ID as: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.13()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_215A71000, v1, OS_LOG_TYPE_DEBUG, "Request to load model from path: %@ - asked to delete: %d", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

@end
