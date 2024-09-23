@implementation PLSubmissionConfig

- (PLSubmissionConfig)initWithReasonType:(signed __int16)a3 DRConfig:(id)a4
{
  uint64_t v4;
  id v6;
  PLSubmissionConfig *v7;
  PLSubmissionConfig *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLSubmissionConfig;
  v7 = -[PLSubmissionConfig init](&v20, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_13;
  -[PLSubmissionConfig setEnableDPUpload:](v7, "setEnableDPUpload:", 1);
  -[PLSubmissionConfig setDice:](v8, "setDice:", (double)(rand() % 1000) / 10.0);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 < 3)
    goto LABEL_5;
  if ((_DWORD)v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults objectForKey:ifNotSet:](PLDefaults, "objectForKey:ifNotSet:", CFSTR("PLTaskingOnDemandStartDate"), v13);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
    goto LABEL_7;
  }
  if ((_DWORD)v4 == 4)
  {
LABEL_5:
    +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("internalOTASubmission"), 86400.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v9, -v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (uint64_t)v9;
LABEL_7:
    -[PLSubmissionConfig setConfigDateApplied:](v8, "setConfigDateApplied:", v12);
    goto LABEL_8;
  }
  v11 = 0;
LABEL_8:
  -[PLSubmissionConfig initTagInfoForReasonType:withStartDate:withEndDate:](v8, "initTagInfoForReasonType:withStartDate:withEndDate:", v4, v11, v9);
  if (v6
    && (objc_msgSend(v6, "payloadDictionaryRepresentation"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    -[PLSubmissionConfig setIsDRTasking:](v8, "setIsDRTasking:", 1);
    objc_msgSend(v6, "configUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig setConfigUUID:](v8, "setConfigUUID:", v15);

    objc_msgSend(v6, "receivedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertFromSystemToMonotonic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig setConfigDateReceived:](v8, "setConfigDateReceived:", v17);

    objc_msgSend(v6, "payloadDictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig readTaskingPayloadOverride:](v8, "readTaskingPayloadOverride:", v18);

  }
  else
  {
    -[PLSubmissionConfig setIsDRTasking:](v8, "setIsDRTasking:", 0);
    -[PLSubmissionConfig readTaskingDefaults](v8, "readTaskingDefaults");
  }

LABEL_13:
  return v8;
}

- (PLSubmissionConfig)initWithPayload:(id)a3
{
  id v4;
  PLSubmissionConfig *v5;
  PLSubmissionConfig *v6;
  NSString *request;
  NSString *ondemand;
  NSNumber *capSize;
  NSDictionary *plTaskingTables;
  NSDictionary *ppsTaskingTables;
  NSString *taskingType;
  NSString *taskingBuild;
  NSString *taskingDeviceModels;
  NSString *taskingPopulation;
  NSDictionary *taskingPercentage;
  NSDictionary *signpostAllowlist;
  uint64_t v18;
  NSArray *removeEntries;
  uint64_t v20;
  NSDictionary *hashEntries;
  uint64_t v22;
  NSArray *trimmingQueries;
  uint64_t v24;
  NSNumber *cacheSize;
  void *v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PLSubmissionConfig;
  v5 = -[PLSubmissionConfig init](&v29, sel_init);
  v6 = v5;
  if (v5)
  {
    request = v5->_request;
    v5->_request = 0;

    ondemand = v6->_ondemand;
    v6->_ondemand = 0;

    capSize = v6->_capSize;
    v6->_capSize = (NSNumber *)&unk_1E6ABED08;

    plTaskingTables = v6->_plTaskingTables;
    v6->_plTaskingTables = 0;

    ppsTaskingTables = v6->_ppsTaskingTables;
    v6->_ppsTaskingTables = 0;

    taskingType = v6->_taskingType;
    v6->_taskingType = 0;

    taskingBuild = v6->_taskingBuild;
    v6->_taskingBuild = 0;

    taskingDeviceModels = v6->_taskingDeviceModels;
    v6->_taskingDeviceModels = 0;

    taskingPopulation = v6->_taskingPopulation;
    v6->_taskingPopulation = 0;

    taskingPercentage = v6->_taskingPercentage;
    v6->_taskingPercentage = 0;

    signpostAllowlist = v6->_signpostAllowlist;
    v6->_signpostAllowlist = 0;

    *(_WORD *)&v6->_enableDPUpload = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("removeEntryKeys"));
    v18 = objc_claimAutoreleasedReturnValue();
    removeEntries = v6->_removeEntries;
    v6->_removeEntries = (NSArray *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hashEntryKeys"));
    v20 = objc_claimAutoreleasedReturnValue();
    hashEntries = v6->_hashEntries;
    v6->_hashEntries = (NSDictionary *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trimmingQueries"));
    v22 = objc_claimAutoreleasedReturnValue();
    trimmingQueries = v6->_trimmingQueries;
    v6->_trimmingQueries = (NSArray *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cache_size"));
    v24 = objc_claimAutoreleasedReturnValue();
    cacheSize = v6->_cacheSize;
    v6->_cacheSize = (NSNumber *)v24;

    v6->_submittedFilesMask = 127;
    if ((_os_feature_enabled_impl() & 1) == 0)
      v6->_submittedFilesMask &= ~0x20uLL;
    if ((_os_feature_enabled_impl() & 1) == 0)
      v6->_submittedFilesMask &= ~0x40uLL;
    -[PLSubmissionConfig setDice:](v6, "setDice:", (double)(rand() % 1000) / 10.0);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig initTagInfoForReasonType:withStartDate:withEndDate:](v6, "initTagInfoForReasonType:withStartDate:withEndDate:", 6, v26, v27);

  }
  return v6;
}

- (void)initTagInfoForReasonType:(signed __int16)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v9;
  void *v10;
  NSString *v11;
  NSString *tagUUID;
  NSString *v13;
  NSString *deviceModel;
  void *v15;
  NSArray *v16;
  NSArray *builds;
  void *v18;
  char v19;
  id v20;

  v20 = a4;
  v9 = a5;
  objc_storeStrong((id *)&self->_startDate, a4);
  objc_storeStrong((id *)&self->_endDate, a5);
  self->_submitReasonType = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  tagUUID = self->_tagUUID;
  self->_tagUUID = v11;

  self->_seed = +[PLPlatform seedBuild](PLPlatform, "seedBuild");
  self->_internal = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
  +[PLUtilities hardwareModel](PLUtilities, "hardwareModel");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceModel = self->_deviceModel;
  self->_deviceModel = v13;

  +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", CFSTR("LastBuild"), CFSTR("com.apple.powerlogd"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
  builds = self->_builds;
  self->_builds = v16;

  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    if (-[PLSubmissionConfig submitBDC](self, "submitBDC"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fileExistsAtPath:", CFSTR("/var/db/Battery/BDC"));

      if ((v19 & 1) == 0)
        self->_submittedFilesMask &= ~8uLL;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  PLSubmissionConfig *v4;
  uint64_t v5;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = -[PLSubmissionConfig init](+[PLSubmissionConfig allocWithZone:](PLSubmissionConfig, "allocWithZone:", a3), "init");
  v5 = -[PLSubmissionConfig submitReasonType](self, "submitReasonType");
  -[PLSubmissionConfig startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig initTagInfoForReasonType:withStartDate:withEndDate:](v4, "initTagInfoForReasonType:withStartDate:withEndDate:", v5, v6, v7);

  -[PLSubmissionConfig configUUID](self, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setConfigUUID:](v4, "setConfigUUID:", v8);

  -[PLSubmissionConfig configDateApplied](self, "configDateApplied");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setConfigDateApplied:](v4, "setConfigDateApplied:", v9);

  -[PLSubmissionConfig configDateReceived](self, "configDateReceived");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setConfigDateReceived:](v4, "setConfigDateReceived:", v10);

  -[PLSubmissionConfig dice](self, "dice");
  -[PLSubmissionConfig setDice:](v4, "setDice:");
  -[PLSubmissionConfig setEnableDPUpload:](v4, "setEnableDPUpload:", -[PLSubmissionConfig enableDPUpload](self, "enableDPUpload"));
  -[PLSubmissionConfig setIsDRTasking:](v4, "setIsDRTasking:", -[PLSubmissionConfig isDRTasking](self, "isDRTasking"));
  -[PLSubmissionConfig request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setRequest:](v4, "setRequest:", v11);

  -[PLSubmissionConfig ondemand](self, "ondemand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setOndemand:](v4, "setOndemand:", v12);

  -[PLSubmissionConfig capSize](self, "capSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setCapSize:](v4, "setCapSize:", v13);

  -[PLSubmissionConfig plTaskingTables](self, "plTaskingTables");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPlTaskingTables:](v4, "setPlTaskingTables:", v14);

  -[PLSubmissionConfig ppsTaskingTables](self, "ppsTaskingTables");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPpsTaskingTables:](v4, "setPpsTaskingTables:", v15);

  -[PLSubmissionConfig removeEntries](self, "removeEntries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setRemoveEntries:](v4, "setRemoveEntries:", v16);

  -[PLSubmissionConfig hashEntries](self, "hashEntries");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setHashEntries:](v4, "setHashEntries:", v17);

  -[PLSubmissionConfig trimmingQueries](self, "trimmingQueries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTrimmingQueries:](v4, "setTrimmingQueries:", v18);

  -[PLSubmissionConfig taskingBuild](self, "taskingBuild");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingBuild:](v4, "setTaskingBuild:", v19);

  -[PLSubmissionConfig taskingDeviceModels](self, "taskingDeviceModels");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingDeviceModels:](v4, "setTaskingDeviceModels:", v20);

  -[PLSubmissionConfig taskingPopulation](self, "taskingPopulation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingPopulation:](v4, "setTaskingPopulation:", v21);

  -[PLSubmissionConfig taskingPercentage](self, "taskingPercentage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingPercentage:](v4, "setTaskingPercentage:", v22);

  -[PLSubmissionConfig signpostAllowlist](self, "signpostAllowlist");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setSignpostAllowlist:](v4, "setSignpostAllowlist:", v23);

  -[PLSubmissionConfig setSignpostDisable:](v4, "setSignpostDisable:", -[PLSubmissionConfig signpostDisable](self, "signpostDisable"));
  -[PLSubmissionConfig cacheSize](self, "cacheSize");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setCacheSize:](v4, "setCacheSize:", v24);

  -[PLSubmissionConfig taskingFiles](self, "taskingFiles");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingFiles:](v4, "setTaskingFiles:", v25);

  -[PLSubmissionConfig setSubmittedFilesMask:](v4, "setSubmittedFilesMask:", -[PLSubmissionConfig submittedFilesMask](self, "submittedFilesMask"));
  -[PLSubmissionConfig taskingType](self, "taskingType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingType:](v4, "setTaskingType:", v26);

  -[PLSubmissionConfig defaultTaskingTypeParameters](self, "defaultTaskingTypeParameters");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setDefaultTaskingTypeParameters:](v4, "setDefaultTaskingTypeParameters:", v27);

  -[PLSubmissionConfig perModelTaskingTypeParameters](self, "perModelTaskingTypeParameters");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPerModelTaskingTypeParameters:](v4, "setPerModelTaskingTypeParameters:", v28);

  -[PLSubmissionConfig filePath](self, "filePath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setFilePath:](v4, "setFilePath:", v29);

  -[PLSubmissionConfig ckTagConfig](self, "ckTagConfig");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setCkTagConfig:](v4, "setCkTagConfig:", v30);

  -[PLSubmissionConfig blobFailureReason](self, "blobFailureReason");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setBlobFailureReason:](v4, "setBlobFailureReason:", v31);

  -[PLSubmissionConfig lastBatteryTimestampSystem](self, "lastBatteryTimestampSystem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setLastBatteryTimestampSystem:](v4, "setLastBatteryTimestampSystem:", v32);

  return v4;
}

- (void)readTaskingPayloadOverride:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingRequest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setRequest:](self, "setRequest:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingOnDemand"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setOndemand:](self, "setOndemand:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingCapSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v9 = v7, (isKindOfClass & 1) == 0))
    v9 = &unk_1E6ABED08;
  -[PLSubmissionConfig setCapSize:](self, "setCapSize:", v9);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingTables"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPlTaskingTables:](self, "setPlTaskingTables:", v10);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PPSTaskingTables"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPpsTaskingTables:](self, "setPpsTaskingTables:", v11);

  -[PLSubmissionConfig plTaskingTables](self, "plTaskingTables");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v12, CFSTR("PLTaskingTables"), 1);

  -[PLSubmissionConfig ppsTaskingTables](self, "ppsTaskingTables");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v13, CFSTR("PPSTaskingTables"), 1);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingRemoveEntries"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setRemoveEntries:](self, "setRemoveEntries:", v14);

  -[PLSubmissionConfig removeEntries](self, "removeEntries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[PLSubmissionConfig setRemoveEntries:](self, "setRemoveEntries:", &unk_1E6AF6C38);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingHashEntries"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __49__PLSubmissionConfig_readTaskingPayloadOverride___block_invoke;
    v52[3] = &unk_1E6A55D58;
    v53 = v17;
    v18 = v17;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v52);
    v19 = (void *)objc_msgSend(v18, "copy");
    -[PLSubmissionConfig setHashEntries:](self, "setHashEntries:", v19);

  }
  else
  {
    -[PLSubmissionConfig setHashEntries:](self, "setHashEntries:", &unk_1E6B04A40);
  }
  -[PLSubmissionConfig setTrimmingQueries:](self, "setTrimmingQueries:", 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingBuild"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingBuild:](self, "setTaskingBuild:", v20);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingDeviceModels"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingDeviceModels:](self, "setTaskingDeviceModels:", v21);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingPopulation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingPopulation:](self, "setTaskingPopulation:", v22);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingPercentage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingPercentage:](self, "setTaskingPercentage:", v23);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingSignpostAllowlist"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setSignpostAllowlist:](self, "setSignpostAllowlist:", v24);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingSignpostDisable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    v26 = objc_msgSend(v25, "BOOLValue");
  else
    v26 = 0;
  -[PLSubmissionConfig setSignpostDisable:](self, "setSignpostDisable:", v26);
  -[PLSubmissionConfig setCacheSize:](self, "setCacheSize:", 0);
  self->_submittedFilesMask = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingFiles"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingFiles:](self, "setTaskingFiles:", v27);

  -[PLSubmissionConfig taskingFiles](self, "taskingFiles");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v45 = v25;
    v46 = v16;
    v47 = v7;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    -[PLSubmissionConfig taskingFiles](self, "taskingFiles");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (!v30)
      goto LABEL_40;
    v32 = v30;
    v33 = *(_QWORD *)v49;
    *(_QWORD *)&v31 = 138412290;
    v44 = v31;
    while (1)
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v49 != v33)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v34);
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("PLL"), v44))
        {
          v36 = self->_submittedFilesMask | 1;
LABEL_33:
          self->_submittedFilesMask = v36;
          goto LABEL_34;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("MSS")))
        {
          v36 = self->_submittedFilesMask | 2;
          goto LABEL_33;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("SP")))
        {
          v36 = self->_submittedFilesMask | 4;
          goto LABEL_33;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("BDC")))
        {
          v36 = self->_submittedFilesMask | 8;
          goto LABEL_33;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("CE")))
        {
          v36 = self->_submittedFilesMask | 0x10;
          goto LABEL_33;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("XC")))
        {
          v36 = self->_submittedFilesMask | 0x20;
          goto LABEL_33;
        }
        if (objc_msgSend(v35, "isEqualToString:", CFSTR("BG")))
        {
          v36 = self->_submittedFilesMask | 0x40;
          goto LABEL_33;
        }
        PLLogSubmission();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v44;
          v55 = v35;
          _os_log_error_impl(&dword_1B6AB6000, v37, OS_LOG_TYPE_ERROR, "Unsupported tasking files: %@", buf, 0xCu);
        }

LABEL_34:
        ++v34;
      }
      while (v32 != v34);
      v38 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      v32 = v38;
      if (!v38)
      {
LABEL_40:

        v7 = v47;
        v25 = v45;
        v16 = v46;
        goto LABEL_46;
      }
    }
  }
  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    self->_submittedFilesMask = 127;
    if ((_os_feature_enabled_impl() & 1) == 0)
      self->_submittedFilesMask &= ~0x20uLL;
    if ((_os_feature_enabled_impl() & 1) == 0)
      self->_submittedFilesMask &= ~0x40uLL;
  }
LABEL_46:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLEnableDPUpload"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLEnableDPUpload"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig setEnableDPUpload:](self, "setEnableDPUpload:", objc_msgSend(v40, "BOOLValue"));

  }
  else
  {
    -[PLSubmissionConfig setEnableDPUpload:](self, "setEnableDPUpload:", 1);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLTaskingType"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setTaskingType:](self, "setTaskingType:", v41);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLDefaultTaskingTypeParametersKey"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setDefaultTaskingTypeParameters:](self, "setDefaultTaskingTypeParameters:", v42);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPerModelTaskingTypeParametersKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig setPerModelTaskingTypeParameters:](self, "setPerModelTaskingTypeParameters:", v43);

}

void __49__PLSubmissionConfig_readTaskingPayloadOverride___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v10, "count") == 2;
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

    v4 = v10;
  }

}

- (BOOL)isValidSubmissionFilesMask
{
  void *v3;
  unint64_t submittedFilesMask;
  BOOL v6;

  -[PLSubmissionConfig taskingFiles](self, "taskingFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  submittedFilesMask = self->_submittedFilesMask;
  v6 = (submittedFilesMask & 0x10) == 0 || submittedFilesMask == 16;
  if ((submittedFilesMask & 8) != 0)
    return submittedFilesMask == 8;
  else
    return v6;
}

- (BOOL)isValidTaskingBlob
{
  NSObject *v4;
  NSString *blobFailureReason;

  if (-[PLSubmissionConfig isValidSubmissionFilesMask](self, "isValidSubmissionFilesMask"))
    return +[PLUtilities isValidString:](PLUtilities, "isValidString:", self->_request);
  PLLogSubmission();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[PLSubmissionConfig isValidTaskingBlob].cold.1(self, v4);

  blobFailureReason = self->_blobFailureReason;
  self->_blobFailureReason = (NSString *)CFSTR("InvalidTaskingFiles");

  return 0;
}

- (void)readTaskingDefaults
{
  NSString *v3;
  NSString *request;
  NSString *v5;
  NSString *ondemand;
  NSNumber *v7;
  NSNumber *capSize;
  NSDictionary *v9;
  NSDictionary *plTaskingTables;
  NSArray *v11;
  NSArray *removeEntries;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  NSDictionary *hashEntries;
  NSArray *trimmingQueries;
  NSString *v19;
  NSString *taskingBuild;
  NSString *v21;
  NSString *taskingDeviceModels;
  NSString *v23;
  NSString *taskingPopulation;
  NSDictionary *v25;
  NSDictionary *taskingPercentage;
  NSDictionary *v27;
  NSDictionary *signpostAllowlist;
  void *v29;
  void *v30;
  BOOL v31;
  NSNumber *cacheSize;
  id v33;
  _QWORD v34[4];
  id v35;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingRequest"), CFSTR("com.apple.powerlogd"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  request = self->_request;
  self->_request = v3;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingOnDemand"), CFSTR("com.apple.powerlogd"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  ondemand = self->_ondemand;
  self->_ondemand = v5;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingCapSize"), CFSTR("com.apple.powerlogd"));
  v33 = (id)objc_claimAutoreleasedReturnValue();
  if (v33 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (NSNumber *)v33;
    capSize = self->_capSize;
    self->_capSize = v7;
  }
  else
  {
    capSize = self->_capSize;
    self->_capSize = (NSNumber *)&unk_1E6ABED08;
  }

  PLOSAPreferencesGetValue(CFSTR("PLTaskingTables"), CFSTR("com.apple.powerlogd"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  plTaskingTables = self->_plTaskingTables;
  self->_plTaskingTables = v9;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingRemoveEntries"), CFSTR("com.apple.powerlogd"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  removeEntries = self->_removeEntries;
  self->_removeEntries = v11;

  if (!self->_removeEntries)
  {
    self->_removeEntries = (NSArray *)&unk_1E6AF6CB0;

  }
  PLOSAPreferencesGetValue(CFSTR("PLTaskingHashEntries"), CFSTR("com.apple.powerlogd"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __41__PLSubmissionConfig_readTaskingDefaults__block_invoke;
    v34[3] = &unk_1E6A55D58;
    v35 = v14;
    v15 = v14;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v34);
    v16 = (NSDictionary *)-[NSDictionary copy](v15, "copy");
    hashEntries = self->_hashEntries;
    self->_hashEntries = v16;

  }
  else
  {
    v15 = self->_hashEntries;
    self->_hashEntries = (NSDictionary *)&unk_1E6B04A68;
  }

  trimmingQueries = self->_trimmingQueries;
  self->_trimmingQueries = 0;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingBuild"), CFSTR("com.apple.powerlogd"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingBuild = self->_taskingBuild;
  self->_taskingBuild = v19;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingDeviceModels"), CFSTR("com.apple.powerlogd"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingDeviceModels = self->_taskingDeviceModels;
  self->_taskingDeviceModels = v21;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingPopulation"), CFSTR("com.apple.powerlogd"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskingPopulation = self->_taskingPopulation;
  self->_taskingPopulation = v23;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingPercentage"), CFSTR("com.apple.powerlogd"));
  v25 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskingPercentage = self->_taskingPercentage;
  self->_taskingPercentage = v25;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingSignpostAllowlist"), CFSTR("com.apple.powerlogd"));
  v27 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  signpostAllowlist = self->_signpostAllowlist;
  self->_signpostAllowlist = v27;

  PLOSAPreferencesGetValue(CFSTR("PLTaskingSignpostDisable"), CFSTR("com.apple.powerlogd"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  v31 = v29 && (objc_msgSend(v29, "BOOLValue") & 1) != 0;
  self->_signpostDisable = v31;
  cacheSize = self->_cacheSize;
  self->_cacheSize = 0;

  -[PLSubmissionConfig initializeFilesToBeSubmitted](self, "initializeFilesToBeSubmitted");
}

void __41__PLSubmissionConfig_readTaskingDefaults__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v10, "count") == 2;
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);

    v4 = v10;
  }

}

- (id)submissionMaskToString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLSubmissionConfig submitPLL](self, "submitPLL"))
    objc_msgSend(v3, "addObject:", CFSTR("Powerlog"));
  if (-[PLSubmissionConfig submitMSS](self, "submitMSS"))
    objc_msgSend(v3, "addObject:", CFSTR("Microstackshots"));
  if (-[PLSubmissionConfig submitBDC](self, "submitBDC"))
    objc_msgSend(v3, "addObject:", CFSTR("BDC_logs"));
  if (-[PLSubmissionConfig submitSP](self, "submitSP"))
    objc_msgSend(v3, "addObject:", CFSTR("Signpost"));
  if (-[PLSubmissionConfig submitCE](self, "submitCE"))
    objc_msgSend(v3, "addObject:", CFSTR("CleanEnergyLogs"));
  if (-[PLSubmissionConfig submitXC](self, "submitXC"))
    objc_msgSend(v3, "addObject:", CFSTR("XcodeOrganizer"));
  if (-[PLSubmissionConfig submitBG](self, "submitBG"))
    objc_msgSend(v3, "addObject:", CFSTR("BackgroundProcessing"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)splitBySubmissionType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[PLSubmissionConfig submitReasonType](self, "submitReasonType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLSubmissionConfig submitCE](self, "submitCE"))
    {
      v4 = (void *)-[PLSubmissionConfig copy](self, "copy");
      objc_msgSend(v4, "setSubmittedFilesMask:", 16);
      objc_msgSend(v3, "addObject:", v4);
      self->_submittedFilesMask &= ~0x10uLL;

    }
    if (-[PLSubmissionConfig submitXC](self, "submitXC"))
    {
      v5 = (void *)-[PLSubmissionConfig copy](self, "copy");
      objc_msgSend(v5, "setSubmittedFilesMask:", 32);
      objc_msgSend(v3, "addObject:", v5);
      self->_submittedFilesMask &= ~0x20uLL;

    }
    if (-[PLSubmissionConfig submitBG](self, "submitBG"))
    {
      v6 = (void *)-[PLSubmissionConfig copy](self, "copy");
      objc_msgSend(v6, "setSubmittedFilesMask:", 64);
      objc_msgSend(v3, "addObject:", v6);
      self->_submittedFilesMask &= ~0x40uLL;

    }
    objc_msgSend(v3, "addObject:", self);
    objc_msgSend(v3, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)submissionCategory
{
  if (-[PLSubmissionConfig submitReasonType](self, "submitReasonType") == 2)
    return CFSTR("safeguard-archive");
  if (-[PLSubmissionConfig submitReasonType](self, "submitReasonType") == 1
    && -[PLSubmissionConfig submittedFilesMask](self, "submittedFilesMask") == 16)
  {
    return CFSTR("ce-archive");
  }
  if (-[PLSubmissionConfig submittedFilesMask](self, "submittedFilesMask") == 32)
    return CFSTR("xc-archive");
  if (-[PLSubmissionConfig submittedFilesMask](self, "submittedFilesMask") == 64)
    return CFSTR("bg-archive");
  return CFSTR("pps-archive");
}

- (id)getSubmitReasonTypeToCAFieldValue
{
  uint64_t v2;

  v2 = self->_submitReasonType - 1;
  if (v2 > 5)
    return CFSTR("unknownreason");
  else
    return off_1E6A55DD8[v2];
}

- (id)getSubmitReasonTypeToFlushReason
{
  uint64_t v2;

  v2 = self->_submitReasonType - 1;
  if (v2 > 5)
    return CFSTR("unknown OTA reason");
  else
    return off_1E6A55E08[v2];
}

- (id)getSubmitReasonTypeToReasonLog
{
  int v2;
  __CFString *v4;
  id result;

  v2 = self->_submitReasonType - 1;
  v4 = CFSTR("SafeLogFile");
  switch(v2)
  {
    case 0:
      v4 = CFSTR("InternalSubmission");
      goto LABEL_6;
    case 1:
      return CFSTR("SafeguardSubmission");
    case 2:
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("OnDemandTasking"), self->_request);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 5:
LABEL_6:
      result = v4;
      break;
    default:
      result = CFSTR("unknownreason");
      break;
  }
  return result;
}

- (id)getSubmitReasonTypeToStorageEventOTAType
{
  uint64_t v2;

  v2 = self->_submitReasonType - 1;
  if (v2 <= 5 && ((0x2Fu >> v2) & 1) != 0)
    return *off_1E6A55E38[v2];
  else
    return CFSTR("unknownreason");
}

- (id)getDateMarkerLegacy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PLSubmissionConfig lastBatteryTimestampSystem](self, "lastBatteryTimestampSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLSubmissionConfig lastBatteryTimestampSystem](self, "lastBatteryTimestampSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nearestMidnightBeforeDate:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyyMMdd"));
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v9);

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C99790]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCalendar:", v10);

  objc_msgSend(v7, "setLocale:", v8);
  objc_msgSend(v7, "stringFromDate:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getDateMarker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLSubmissionConfig lastBatteryTimestampSystem](self, "lastBatteryTimestampSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLSubmissionConfig lastBatteryTimestampSystem](self, "lastBatteryTimestampSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nearestMidnightBeforeDate:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[PLSubmissionConfig getDateMarkerFromSystemDate:](PLSubmissionConfig, "getDateMarkerFromSystemDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getDateMarkerFromSystemDate:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a3, "timeIntervalSince1970");
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%f [%ld]"), v5, objc_msgSend(v6, "secondsFromGMT"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("unknown");
  }
  return v7;
}

+ (void)clearTaskingDefaults
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD block[6];

  v2 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (clearTaskingDefaults_defaultOnce != -1)
      dispatch_once(&clearTaskingDefaults_defaultOnce, block);
    if (clearTaskingDefaults_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clearing on demand tasking defaults"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLSubmissionConfig clearTaskingDefaults]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 644);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PLTaskingOnDemandStartDate"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PLTaskingRestartCount"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PLTaskingTables"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("PPSTaskingTables"), 1);
  PLOSAPreferencesSetValue(CFSTR("PLTaskingBuild"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingDeviceModels"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingPercentage"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingPopulation"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingSignpostAllowlist"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingSignpostDisable"), 0, CFSTR("com.apple.powerlogd"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v32[0] = v3;
    v32[1] = 3221225472;
    v32[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_234;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = objc_opt_class();
    if (clearTaskingDefaults_defaultOnce_232 != -1)
      dispatch_once(&clearTaskingDefaults_defaultOnce_232, v32);
    if (clearTaskingDefaults_classDebugEnabled_233)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clearing tasking OSAPreferences"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLSubmissionConfig clearTaskingDefaults]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 657);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  PLOSAPreferencesSetValue(CFSTR("PLTaskingFiles"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingRequest"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingOnDemand"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingTables"), 0, CFSTR("com.apple.powerlogd"));
  v14 = PLOSAPreferencesSynchronize(CFSTR("com.apple.powerlogd"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v31[0] = v3;
    v31[1] = 3221225472;
    v31[2] = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_239;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = objc_opt_class();
    if (clearTaskingDefaults_defaultOnce_237 != -1)
      dispatch_once(&clearTaskingDefaults_defaultOnce_237, v31);
    if (clearTaskingDefaults_classDebugEnabled_238)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("synchronized=%d"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLSubmissionConfig clearTaskingDefaults]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 664);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  PLOSAPreferencesSetValue(CFSTR("PLTaskingCapSize"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingRemoveEntries"), 0, CFSTR("com.apple.powerlogd"));
  PLOSAPreferencesSetValue(CFSTR("PLTaskingHashEntries"), 0, CFSTR("com.apple.powerlogd"));
  v20 = PLOSAPreferencesSynchronize(CFSTR("com.apple.powerlogd"));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v26 = v3;
    v27 = 3221225472;
    v28 = __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_244;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = objc_opt_class();
    if (clearTaskingDefaults_defaultOnce_242 != -1)
      dispatch_once(&clearTaskingDefaults_defaultOnce_242, &v26);
    if (clearTaskingDefaults_classDebugEnabled_243)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("synchronized=%d"), v20, v26, v27, v28, v29, v30);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLSubmissionConfig clearTaskingDefaults]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 670);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearTaskingDefaults_classDebugEnabled = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_234(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearTaskingDefaults_classDebugEnabled_233 = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_239(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearTaskingDefaults_classDebugEnabled_238 = result;
  return result;
}

BOOL __42__PLSubmissionConfig_clearTaskingDefaults__block_invoke_244(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  clearTaskingDefaults_classDebugEnabled_243 = result;
  return result;
}

- (BOOL)conditionCheckForEnergy
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PLArchiveManager lastArchivePath](PLArchiveManager, "lastArchivePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Energy Tasking: looking for archived powerlog...", (uint8_t *)&v10, 2u);
  }

  if (!v2)
  {
    PLLogSubmission();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLSubmissionConfig conditionCheckForEnergy].cold.1();
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v2);

  PLLogSubmission();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PLSubmissionConfig conditionCheckForEnergy].cold.2();
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Energy Tasking: last archived powerlog = %@", (uint8_t *)&v10, 0xCu);
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)conditionCheckForTaskingType:(id)a3
{
  int v4;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("Energy"));
  if (v4)
    LOBYTE(v4) = -[PLSubmissionConfig conditionCheckForEnergy](self, "conditionCheckForEnergy");
  return v4;
}

- (BOOL)shouldSubmitToday
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  NSDictionary *perModelTaskingTypeParameters;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  double v14;
  BOOL v15;

  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLSubmissionConfig shouldSubmitToday].cold.5();

  -[PLSubmissionConfig emitTaskingTypeSpecifiedEvent](self, "emitTaskingTypeSpecifiedEvent");
  if (!-[PLSubmissionConfig isValidTaskingBlob](self, "isValidTaskingBlob"))
  {
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionConfig shouldSubmitToday].cold.4();
    goto LABEL_23;
  }
  -[PLSubmissionConfig taskingType](self, "taskingType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLSubmissionConfig conditionCheckForTaskingType:](self, "conditionCheckForTaskingType:", v4);

  if (!v5)
  {
    -[PLSubmissionConfig emitQueryEvent:](self, "emitQueryEvent:", 0);
    PLLogSubmission();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionConfig shouldSubmitToday].cold.3();
    goto LABEL_23;
  }
  -[PLSubmissionConfig emitQueryEvent:](self, "emitQueryEvent:", 1);
  +[PLUtilities productType](PLUtilities, "productType");
  v6 = objc_claimAutoreleasedReturnValue();
  perModelTaskingTypeParameters = self->_perModelTaskingTypeParameters;
  if (perModelTaskingTypeParameters || self->_defaultTaskingTypeParameters)
  {
    if (v6)
    {
      -[NSDictionary objectForKeyedSubscript:](perModelTaskingTypeParameters, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_perModelTaskingTypeParameters, "objectForKeyedSubscript:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("samplingPercentage"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_defaultTaskingTypeParameters, "objectForKeyedSubscript:", CFSTR("samplingPercentage"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "intValue");
      }

      PLLogSubmission();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionConfig shouldSubmitToday].cold.2();

      if ((v11 - 101) >= 0xFFFFFF9C)
      {
        -[PLSubmissionConfig dice](self, "dice");
        if (v14 < (double)v11)
          goto LABEL_22;
      }
    }
    else
    {
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionConfig shouldSubmitToday].cold.1();

    }
LABEL_23:
    v15 = 0;
    goto LABEL_24;
  }
LABEL_22:
  -[PLSubmissionConfig emitSubmitEvent](self, "emitSubmitEvent");
  v15 = 1;
LABEL_24:

  return v15;
}

- (BOOL)shouldStartTaskingToday
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *taskingBuild;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSString *taskingPopulation;
  void *v55;
  void *v57;
  NSDictionary *taskingPercentage;
  const __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  double v76;
  _UNKNOWN **v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  NSString *ondemand;
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  _QWORD block[5];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (shouldStartTaskingToday_defaultOnce != -1)
      dispatch_once(&shouldStartTaskingToday_defaultOnce, block);
    if (shouldStartTaskingToday_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin on-demand tasking setup check"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 897);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  if (+[PLDefaults fullMode](PLDefaults, "fullMode")
    || +[PLDefaults taskMode](PLDefaults, "taskMode"))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v9 = objc_opt_class();
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_254;
      v96[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v96[4] = v9;
      if (shouldStartTaskingToday_defaultOnce_252 != -1)
        dispatch_once(&shouldStartTaskingToday_defaultOnce_252, v96);
      if (shouldStartTaskingToday_classDebugEnabled_253)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("already in task mode or full mode"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 902);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_16:

        goto LABEL_17;
      }
    }
    return 0;
  }
  if (!-[PLSubmissionConfig isValidTaskingBlob](self, "isValidTaskingBlob"))
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v16 = objc_opt_class();
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_259;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v16;
      if (shouldStartTaskingToday_defaultOnce_257 != -1)
        dispatch_once(&shouldStartTaskingToday_defaultOnce_257, v95);
      if (shouldStartTaskingToday_classDebugEnabled_258)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tasking blob is not valid"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v18, v19, 907);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_16;
      }
    }
    return 0;
  }
  if (-[PLSubmissionConfig isDRTasking](self, "isDRTasking"))
    return 1;
  PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.OTATasking"), CFSTR("PLTaskingRequest")), 1);
  AnalyticsSendEventLazy();
  +[PLSubmissionConfig submitTaskingDefaultsCheckStateToCA:](PLSubmissionConfig, "submitTaskingDefaultsCheckStateToCA:", CFSTR("PLTaskingRequest"));
  if (self->_taskingBuild)
  {
    +[PLDefaults objectForKey:forApplicationID:synchronize:](PLDefaults, "objectForKey:forApplicationID:synchronize:", CFSTR("LastBuild"), CFSTR("com.apple.powerlogd"), 0);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    taskingBuild = self->_taskingBuild;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByTrimmingCharactersInSet:](taskingBuild, "stringByTrimmingCharactersInSet:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v10, "stringByTrimmingCharactersInSet:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v25 = objc_opt_class();
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_275;
      v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v94[4] = v25;
      if (shouldStartTaskingToday_defaultOnce_273 != -1)
        dispatch_once(&shouldStartTaskingToday_defaultOnce_273, v94);
      if (shouldStartTaskingToday_classDebugEnabled_274)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("taskingBuild=%@, currentBuild=%@\n"), v22, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v28, v29, 936);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if (!v22)
    {

      goto LABEL_17;
    }
    v31 = objc_msgSend(v22, "isEqualToString:", v24);

    if (!v31)
      return 0;
  }
  +[PLUtilities hardwareModel](PLUtilities, "hardwareModel");
  v32 = objc_claimAutoreleasedReturnValue();
  v10 = (__CFString *)v32;
  if (self->_taskingDeviceModels)
  {
    if (!v32)
      goto LABEL_17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v33 = objc_opt_class();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_280;
      v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v93[4] = v33;
      if (shouldStartTaskingToday_defaultOnce_278 != -1)
        dispatch_once(&shouldStartTaskingToday_defaultOnce_278, v93);
      if (shouldStartTaskingToday_classDebugEnabled_279)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("currentModel=%@, taskingDeviceModels=%@\n"), v10, self->_taskingDeviceModels);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v36, v37, 951);

        PLLogCommon();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[NSString tokenizedByString:](self->_taskingDeviceModels, "tokenizedByString:", CFSTR(":"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    if (!v40)
      goto LABEL_85;
    v41 = v40;
    v42 = 0;
    v43 = *(_QWORD *)v90;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v90 != v43)
          objc_enumerationMutation(v39);
        v45 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        if (v45)
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringByTrimmingCharactersInSet:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          v42 |= -[__CFString isEqualToString:](v10, "isEqualToString:", v47);
        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    }
    while (v41);

    if ((v42 & 1) == 0)
      goto LABEL_17;
  }
  if (!self->_taskingPopulation)
    goto LABEL_87;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v48 = objc_opt_class();
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_287;
    v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v88[4] = v48;
    if (shouldStartTaskingToday_defaultOnce_285 != -1)
      dispatch_once(&shouldStartTaskingToday_defaultOnce_285, v88);
    if (shouldStartTaskingToday_classDebugEnabled_286)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("taskingPopulation=%@\n"), self->_taskingPopulation);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "lastPathComponent");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v49, v51, v52, 970);

      PLLogCommon();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  taskingPopulation = self->_taskingPopulation;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](taskingPopulation, "stringByTrimmingCharactersInSet:", v55);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v39, "isEqualToString:", CFSTR("INTERNAL")))
  {
    if (objc_msgSend(v39, "isEqualToString:", CFSTR("SEED")))
    {
      if (+[PLPlatform seedBuild](PLPlatform, "seedBuild"))
        goto LABEL_86;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("CARRIER")))
    {
      if (+[PLPlatform carrierBuild](PLPlatform, "carrierBuild"))
        goto LABEL_86;
    }
    else if (objc_msgSend(v39, "isEqualToString:", CFSTR("GM"))
           && !+[PLPlatform internalBuild](PLPlatform, "internalBuild")
           && !+[PLPlatform seedBuild](PLPlatform, "seedBuild"))
    {
      goto LABEL_86;
    }
LABEL_85:

    goto LABEL_17;
  }
  if (!+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
    goto LABEL_85;
LABEL_86:

LABEL_87:
  if (self->_taskingPercentage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    -[NSDictionary objectForKeyedSubscript:](self->_taskingPercentage, "objectForKeyedSubscript:", v10);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    taskingPercentage = self->_taskingPercentage;
    if (v57)
    {
      v59 = v10;
    }
    else
    {
      -[NSDictionary objectForKeyedSubscript:](taskingPercentage, "objectForKeyedSubscript:", CFSTR("default"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v60)
        goto LABEL_94;
      taskingPercentage = self->_taskingPercentage;
      v59 = CFSTR("default");
    }
    -[NSDictionary objectForKeyedSubscript:](taskingPercentage, "objectForKeyedSubscript:", v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v61, "intValue");

LABEL_94:
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v62 = objc_opt_class();
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_303;
      v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v87[4] = v62;
      if (shouldStartTaskingToday_defaultOnce_301 != -1)
        dispatch_once(&shouldStartTaskingToday_defaultOnce_301, v87);
      if (shouldStartTaskingToday_classDebugEnabled_302)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("taskingPercentage=%d\n"), v60);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "lastPathComponent");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v65, v66, 1010);

        PLLogCommon();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    if ((int)v60 < 1)
      goto LABEL_17;
    if (v60 <= 0x63)
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v68 = objc_opt_class();
        v86[0] = MEMORY[0x1E0C809B0];
        v86[1] = 3221225472;
        v86[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_308;
        v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v86[4] = v68;
        if (shouldStartTaskingToday_defaultOnce_306 != -1)
          dispatch_once(&shouldStartTaskingToday_defaultOnce_306, v86);
        if (shouldStartTaskingToday_classDebugEnabled_307)
        {
          v69 = (void *)MEMORY[0x1E0CB3940];
          -[PLSubmissionConfig dice](self, "dice");
          objc_msgSend(v69, "stringWithFormat:", CFSTR("dice=%f\n"), v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "lastPathComponent");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v73, v74, 1013);

          PLLogCommon();
          v75 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      -[PLSubmissionConfig dice](self, "dice");
      if (v76 >= (double)(int)v60)
        goto LABEL_17;
    }
  }
  v77 = &off_1E6A51000;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v78 = objc_opt_class();
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_313;
    v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v85[4] = v78;
    if (shouldStartTaskingToday_defaultOnce_311 != -1)
      dispatch_once(&shouldStartTaskingToday_defaultOnce_311, v85);
    if (shouldStartTaskingToday_classDebugEnabled_312)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("onDemandTasking=%@"), self->_ondemand);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionConfig.m");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "lastPathComponent");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSubmissionConfig shouldStartTaskingToday]");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v79, v81, v82, 1018);

      PLLogCommon();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v77 = &off_1E6A51000;
    }
  }
  ondemand = self->_ondemand;
  if (ondemand && -[NSString isEqualToString:](ondemand, "isEqualToString:", CFSTR("PLTaskingOnDemandForced")))
  {
    v15 = 1;
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.OTATasking"), CFSTR("PLTaskingOnDemand")), 1);
    AnalyticsSendEventLazy();
    objc_msgSend(v77[54], "submitTaskingDefaultsCheckStateToCA:", CFSTR("PLTaskingOnDemand"));
    if (!+[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PLTaskingOnDemandOptOut"), 0))goto LABEL_18;
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.OTATasking"), CFSTR("PLTaskingOnDemandOptOut")), 1);
    AnalyticsSendEventLazy();
  }
LABEL_17:
  v15 = 0;
LABEL_18:

  return v15;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_254(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_253 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_259(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_258 = result;
  return result;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_266()
{
  return &unk_1E6B04A90;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_275(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_274 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_280(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_279 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_287(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_286 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_303(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_302 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_308(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_307 = result;
  return result;
}

BOOL __45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_313(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  shouldStartTaskingToday_classDebugEnabled_312 = result;
  return result;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_318()
{
  return &unk_1E6B04AB8;
}

void *__45__PLSubmissionConfig_shouldStartTaskingToday__block_invoke_2()
{
  return &unk_1E6B04AE0;
}

- (BOOL)submitPLL
{
  return self->_submittedFilesMask & 1;
}

- (BOOL)submitMSS
{
  return (LOBYTE(self->_submittedFilesMask) >> 1) & 1;
}

- (BOOL)submitSP
{
  return (LOBYTE(self->_submittedFilesMask) >> 2) & 1;
}

- (BOOL)submitBDC
{
  return (LOBYTE(self->_submittedFilesMask) >> 3) & 1;
}

- (BOOL)submitCE
{
  return (LOBYTE(self->_submittedFilesMask) >> 4) & 1;
}

- (BOOL)submitXC
{
  return 0;
}

- (BOOL)submitBG
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    return (LOBYTE(self->_submittedFilesMask) >> 6) & 1;
  return v3;
}

- (BOOL)hasFileToSubmit
{
  return self->_submittedFilesMask != 0;
}

+ (BOOL)internalSubmissionBehavior
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
    return 0;
  PLOSAPreferencesGetValue(CFSTR("PLTaskingFiles"), CFSTR("com.apple.powerlogd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;
  if (v2)
  {
    PLLogSubmission();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Tasking blob received for internal device", v6, 2u);
    }

  }
  return v3;
}

- (void)initializeFilesToBeSubmitted
{
  NSArray *v3;
  NSArray *taskingFiles;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  self->_submittedFilesMask = 0;
  PLOSAPreferencesGetValue(CFSTR("PLTaskingFiles"), CFSTR("com.apple.powerlogd"));
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  taskingFiles = self->_taskingFiles;
  self->_taskingFiles = v3;

  v5 = self->_taskingFiles;
  if (v5)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (!v7)
      goto LABEL_24;
    v9 = v7;
    v10 = *(_QWORD *)v22;
    v11 = CFSTR("BDC");
    *(_QWORD *)&v8 = 138412290;
    v20 = v8;
    while (1)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("PLL"), v20, (_QWORD)v21))
        {
          v14 = self->_submittedFilesMask | 1;
LABEL_17:
          self->_submittedFilesMask = v14;
          goto LABEL_18;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("MSS")))
        {
          v14 = self->_submittedFilesMask | 2;
          goto LABEL_17;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("SP")))
        {
          v14 = self->_submittedFilesMask | 4;
          goto LABEL_17;
        }
        if (objc_msgSend(v13, "isEqualToString:", v11))
        {
          v14 = self->_submittedFilesMask | 8;
          goto LABEL_17;
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("CE")))
        {
          v14 = self->_submittedFilesMask | 0x10;
          goto LABEL_17;
        }
        v15 = v11;
        PLLogSubmission();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v26 = v13;
          _os_log_error_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_ERROR, "Unsupported tasking files: %@", buf, 0xCu);
        }

        v11 = v15;
LABEL_18:
        ++v12;
      }
      while (v9 != v12);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      v9 = v17;
      if (!v17)
      {
LABEL_24:

        return;
      }
    }
  }
  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    v18 = -[PLSubmissionConfig submitReasonType](self, "submitReasonType");
    v19 = 127;
    if (v18 == 2)
      v19 = 3;
    self->_submittedFilesMask = v19;
    if ((_os_feature_enabled_impl() & 1) == 0)
      self->_submittedFilesMask &= ~0x20uLL;
    if ((_os_feature_enabled_impl() & 1) == 0)
      self->_submittedFilesMask &= ~0x40uLL;
  }
}

- (void)setSubmittedFilesMask:(unint64_t)a3
{
  self->_submittedFilesMask = a3;
}

- (unint64_t)submittedFilesMask
{
  return self->_submittedFilesMask;
}

- (void)submitFileStatsToAnalytics
{
  if (-[PLSubmissionConfig submitPLL](self, "submitPLL"))
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmissionFiles"), CFSTR("PLL")), 1);
  if (-[PLSubmissionConfig submitMSS](self, "submitMSS"))
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmissionFiles"), CFSTR("MSS")), 1);
  if (-[PLSubmissionConfig submitSP](self, "submitSP"))
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmissionFiles"), CFSTR("SP")), 1);
  if (-[PLSubmissionConfig submitBDC](self, "submitBDC"))
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmissionFiles"), CFSTR("BDC")), 1);
  if (-[PLSubmissionConfig submitCE](self, "submitCE"))
    PLADClientAddValueForScalarKey(objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.powerlog.iCloudTaskingSubmissionFiles"), CFSTR("CE")), 1);
  AnalyticsSendEventLazy();
}

id __48__PLSubmissionConfig_submitFileStatsToAnalytics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("PLL");
  if (objc_msgSend(*(id *)(a1 + 32), "submitPLL"))
    v2 = &unk_1E6ABED20;
  else
    v2 = &unk_1E6ABED38;
  v10[0] = v2;
  v9[1] = CFSTR("MSS");
  if (objc_msgSend(*(id *)(a1 + 32), "submitMSS"))
    v3 = &unk_1E6ABED20;
  else
    v3 = &unk_1E6ABED38;
  v10[1] = v3;
  v9[2] = CFSTR("SP");
  if (objc_msgSend(*(id *)(a1 + 32), "submitSP"))
    v4 = &unk_1E6ABED20;
  else
    v4 = &unk_1E6ABED38;
  v10[2] = v4;
  v9[3] = CFSTR("BDC");
  if (objc_msgSend(*(id *)(a1 + 32), "submitBDC"))
    v5 = &unk_1E6ABED20;
  else
    v5 = &unk_1E6ABED38;
  v10[3] = v5;
  v9[4] = CFSTR("CE");
  if (objc_msgSend(*(id *)(a1 + 32), "submitCE"))
    v6 = &unk_1E6ABED20;
  else
    v6 = &unk_1E6ABED38;
  v10[4] = v6;
  v9[5] = CFSTR("XC");
  if (objc_msgSend(*(id *)(a1 + 32), "submitXC"))
    v7 = &unk_1E6ABED20;
  else
    v7 = &unk_1E6ABED38;
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)emitTaskingTypeSpecifiedEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, CFSTR("TaskingRequest"));

  -[PLSubmissionConfig taskingType](self, "taskingType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("TaskingType"));

  -[PLSubmissionConfig configUUID](self, "configUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("TaskingUUID"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PLSubmissionConfig taskingType](self, "taskingType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", v8 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("TaskingTypeSpecified"));

  _submitTaskingTypeCAEventPayload(v10, CFSTR("Tasking type specified"));
}

- (void)emitQueryEvent:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, CFSTR("TaskingRequest"));

  -[PLSubmissionConfig taskingType](self, "taskingType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, CFSTR("TaskingType"));

  -[PLSubmissionConfig configUUID](self, "configUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("TaskingUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("QueryResult"));

  if (v3)
    v10 = CFSTR("Query succceded");
  else
    v10 = CFSTR("Query failed");
  _submitTaskingTypeCAEventPayload(v11, v10);

}

- (void)emitSubmitEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLSubmissionConfig request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("TaskingRequest"));

  -[PLSubmissionConfig taskingType](self, "taskingType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("TaskingType"));

  -[PLSubmissionConfig configUUID](self, "configUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("TaskingUUID"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ShouldSubmit"));
  _submitTaskingTypeCAEventPayload(v7, CFSTR("Device should submit"));

}

+ (void)submitTaskingDefaultsCheckStateToCA:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __58__PLSubmissionConfig_submitTaskingDefaultsCheckStateToCA___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("state");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDRTasking
{
  return self->_isDRTasking;
}

- (void)setIsDRTasking:(BOOL)a3
{
  self->_isDRTasking = a3;
}

- (NSUUID)configUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)configDateReceived
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigDateReceived:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)configDateApplied
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigDateApplied:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)request
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)ondemand
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setOndemand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)capSize
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCapSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)plTaskingTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPlTaskingTables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)ppsTaskingTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPpsTaskingTables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)hashEntries
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHashEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)removeEntries
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRemoveEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)trimmingQueries
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTrimmingQueries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)taskingType
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTaskingType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)defaultTaskingTypeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultTaskingTypeParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)perModelTaskingTypeParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPerModelTaskingTypeParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)taskingFiles
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTaskingFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)enableDPUpload
{
  return self->_enableDPUpload;
}

- (void)setEnableDPUpload:(BOOL)a3
{
  self->_enableDPUpload = a3;
}

- (BOOL)signpostDisable
{
  return self->_signpostDisable;
}

- (void)setSignpostDisable:(BOOL)a3
{
  self->_signpostDisable = a3;
}

- (NSDictionary)signpostAllowlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignpostAllowlist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)lastBatteryTimestampSystem
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastBatteryTimestampSystem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)cacheSize
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCacheSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (signed)submitReasonType
{
  return self->_submitReasonType;
}

- (void)setSubmitReasonType:(signed __int16)a3
{
  self->_submitReasonType = a3;
}

- (NSString)tagUUID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTagUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)seed
{
  return self->_seed;
}

- (void)setSeed:(BOOL)a3
{
  self->_seed = a3;
}

- (BOOL)internal
{
  return self->_internal;
}

- (void)setInternal:(BOOL)a3
{
  self->_internal = a3;
}

- (NSArray)builds
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBuilds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)deviceModel
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDeviceModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSDictionary)ckTagConfig
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCkTagConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)blobFailureReason
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBlobFailureReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (double)dice
{
  return self->_dice;
}

- (void)setDice:(double)a3
{
  self->_dice = a3;
}

- (NSString)taskingBuild
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTaskingBuild:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)taskingPopulation
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setTaskingPopulation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)taskingDeviceModels
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTaskingDeviceModels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSDictionary)taskingPercentage
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTaskingPercentage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskingPercentage, 0);
  objc_storeStrong((id *)&self->_taskingDeviceModels, 0);
  objc_storeStrong((id *)&self->_taskingPopulation, 0);
  objc_storeStrong((id *)&self->_taskingBuild, 0);
  objc_storeStrong((id *)&self->_blobFailureReason, 0);
  objc_storeStrong((id *)&self->_ckTagConfig, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_builds, 0);
  objc_storeStrong((id *)&self->_tagUUID, 0);
  objc_storeStrong((id *)&self->_cacheSize, 0);
  objc_storeStrong((id *)&self->_lastBatteryTimestampSystem, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_signpostAllowlist, 0);
  objc_storeStrong((id *)&self->_taskingFiles, 0);
  objc_storeStrong((id *)&self->_perModelTaskingTypeParameters, 0);
  objc_storeStrong((id *)&self->_defaultTaskingTypeParameters, 0);
  objc_storeStrong((id *)&self->_taskingType, 0);
  objc_storeStrong((id *)&self->_trimmingQueries, 0);
  objc_storeStrong((id *)&self->_removeEntries, 0);
  objc_storeStrong((id *)&self->_hashEntries, 0);
  objc_storeStrong((id *)&self->_ppsTaskingTables, 0);
  objc_storeStrong((id *)&self->_plTaskingTables, 0);
  objc_storeStrong((id *)&self->_capSize, 0);
  objc_storeStrong((id *)&self->_ondemand, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_configDateApplied, 0);
  objc_storeStrong((id *)&self->_configDateReceived, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
}

- (void)isValidTaskingBlob
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "taskingFiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a2, v4, "Invalid tasking files request: %@", v5);

}

- (void)conditionCheckForEnergy
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, v0, v1, "Energy Tasking: last archived powerlog %@ does not exist!", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)shouldSubmitToday
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Starting conditional submission check...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
