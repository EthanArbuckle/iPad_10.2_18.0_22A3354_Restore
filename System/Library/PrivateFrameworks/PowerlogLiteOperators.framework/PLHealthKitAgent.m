@implementation PLHealthKitAgent

+ (void)load
{
  objc_msgSend(MEMORY[0x1E0D7FF90], "registerOperator:", objc_opt_class());
}

+ (id)entryEventPointDefinitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[11];
  _QWORD v49[11];
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[6];
  _QWORD v55[6];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v61[0] = CFSTR("HealthKitQuery");
  v58 = *MEMORY[0x1E0D80298];
  v2 = v58;
  v4 = *MEMORY[0x1E0D80250];
  v56[0] = *MEMORY[0x1E0D80318];
  v3 = v56[0];
  v56[1] = v4;
  v57[0] = &unk_1E8653580;
  v57[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v47;
  v59 = *MEMORY[0x1E0D802F0];
  v5 = v59;
  v54[0] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v45;
  v54[1] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_StringFormat_withBundleID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v43;
  v54[2] = CFSTR("queryID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_StringFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v41;
  v54[3] = CFSTR("queryType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_StringFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v39;
  v54[4] = CFSTR("totalDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_RealFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v37;
  v54[5] = CFSTR("isBackgroundQuery");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v58, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = CFSTR("HealthKitCloudSync");
  v62[0] = v33;
  v50 = v3;
  v51 = &unk_1E8653590;
  v52[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v5;
  v53[0] = v32;
  v48[0] = CFSTR("options");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v30;
  v48[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v28;
  v48[2] = CFSTR("operation");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v26;
  v48[3] = CFSTR("zone-count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v24;
  v48[4] = CFSTR("rebase-reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v22;
  v48[5] = CFSTR("deadline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v20;
  v48[6] = CFSTR("epoch-change");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v18;
  v48[7] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v6;
  v48[8] = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v8;
  v48[9] = CFSTR("upload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_BoolFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v10;
  v48[10] = CFSTR("download");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_BoolFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)initOperatorDependancies
{
  int v3;
  uint64_t v4;
  PLXPCListenerOperatorComposition *v5;
  PLXPCListenerOperatorComposition *queryHandler;
  PLXPCListenerOperatorComposition *v7;
  PLXPCListenerOperatorComposition *cloudSyncHandler;
  _QWORD v9[5];
  _QWORD v10[5];

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      if (objc_msgSend(MEMORY[0x1E0D80078], "isHealthDataSubmissionAllowed"))
      {
        v10[0] = v4;
        v10[1] = 3221225472;
        v10[2] = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke;
        v10[3] = &unk_1E8578610;
        v10[4] = self;
        v5 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D340, v10);
        queryHandler = self->_queryHandler;
        self->_queryHandler = v5;

      }
    }
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_2;
    v9[3] = &unk_1E8578610;
    v9[4] = self;
    v7 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D368, v9);
    cloudSyncHandler = self->_cloudSyncHandler;
    self->_cloudSyncHandler = v7;

  }
}

void __44__PLHealthKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  id v18;

  v6 = *MEMORY[0x1E0D80390];
  v7 = a5;
  +[PLOperator entryKeyForType:andName:](PLHealthKitAgent, "entryKeyForType:andName:", v6, CFSTR("HealthKitQuery"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v18);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("clientId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("clientID"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("bundleID"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queryId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("queryID"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("queryType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("queryType"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("totalDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("totalDuration"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("isBackgroundQuery"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C9AAB0];
  v16 = objc_msgSend(v14, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (v16)
    v17 = v15;
  else
    v17 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("isBackgroundQuery"));
  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v8);

}

void __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
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
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_3;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v7;
    if (qword_1ED884CB8 != -1)
      dispatch_once(&qword_1ED884CB8, &block);
    if (_MergedGlobals_1_51)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload: %@"), v6, block, v28, v29, v30, v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHealthKitAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLHealthKitAgent initOperatorDependancies]_block_invoke_2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 228);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLHealthKitAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("HealthKitCloudSync"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("options"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("options"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("reason"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("operation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("operation"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zone-count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("zone-count"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("rebase-reason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("rebase-reason"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("deadline"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("deadline"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("epoch-change"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, CFSTR("epoch-change"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("status"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("result"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("result"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("upload"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("upload"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("download"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, CFSTR("download"));

  objc_msgSend(*(id *)(a1 + 32), "logEntry:", v15);
}

uint64_t __44__PLHealthKitAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_51 = result;
  return result;
}

- (PLXPCListenerOperatorComposition)queryHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setQueryHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)cloudSyncHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCloudSyncHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncHandler, 0);
  objc_storeStrong((id *)&self->_queryHandler, 0);
}

@end
