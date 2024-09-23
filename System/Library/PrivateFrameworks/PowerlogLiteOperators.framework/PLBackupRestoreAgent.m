@implementation PLBackupRestoreAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBackupRestoreAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLBackupRestoreAgent)init
{
  PLBackupRestoreAgent *v3;
  PLBackupRestoreAgent *v4;
  PLBackupRestoreAgent *v5;
  MBManager *v6;
  MBManager *backupRestoreManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  PLBackupRestoreAgent *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  PLBackupRestoreAgent *v21;
  id v22;
  void *v23;
  PLBackupRestoreAgent *v24;
  void *v25;
  id v26;
  PLBackupRestoreAgent *v27;
  void *v28;
  _QWORD v30[4];
  PLBackupRestoreAgent *v31;
  _QWORD v32[4];
  PLBackupRestoreAgent *v33;
  _QWORD v34[4];
  PLBackupRestoreAgent *v35;
  int v36;
  _QWORD handler[4];
  PLBackupRestoreAgent *v38;
  objc_super v39;
  int out_token;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)PLBackupRestoreAgent;
    v4 = -[PLAgent init](&v39, sel_init);
    v5 = v4;
    if (v4)
    {
      -[PLBackupRestoreAgent logEventForwardBackupRestore](v4, "logEventForwardBackupRestore");
      v6 = (MBManager *)objc_alloc_init(MEMORY[0x1E0D4E0B0]);
      backupRestoreManager = v5->_backupRestoreManager;
      v5->_backupRestoreManager = v6;

      v5->_backupState = 0;
      v5->_restoreState = 0;
      if (-[PLOperator isDebugEnabled](v5, "isDebugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::init: _backupState=%i, _restoreState=%i"), v5->_backupState, v5->_restoreState);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent init]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 96);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          out_token = 138412290;
          v41 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&out_token, 0xCu);
        }

      }
      out_token = -1;
      v14 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4E0C8], "UTF8String");
      -[PLOperator workQueue](v5, "workQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __28__PLBackupRestoreAgent_init__block_invoke;
      handler[3] = &unk_1E857F4E0;
      v17 = v5;
      v38 = v17;
      notify_register_dispatch(v14, &out_token, v15, handler);

      v36 = -1;
      v18 = *MEMORY[0x1E0D4E0D8];
      v19 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D4E0D8], "UTF8String");
      -[PLOperator workQueue](v17, "workQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      v34[0] = v16;
      v34[1] = 3221225472;
      v34[2] = __28__PLBackupRestoreAgent_init__block_invoke_25;
      v34[3] = &unk_1E857F4E0;
      v21 = v17;
      v35 = v21;
      notify_register_dispatch(v19, &v36, v20, v34);

      v22 = objc_alloc(MEMORY[0x1E0D7FF80]);
      -[PLOperator workQueue](v21, "workQueue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v16;
      v32[1] = 3221225472;
      v32[2] = __28__PLBackupRestoreAgent_init__block_invoke_29;
      v32[3] = &unk_1E8577F48;
      v24 = v21;
      v33 = v24;
      v25 = (void *)objc_msgSend(v22, "initWithWorkQueue:forNotification:requireState:withBlock:", v23, v18, 1, v32);
      -[PLBackupRestoreAgent setBackupRestoreNotification:](v24, "setBackupRestoreNotification:", v25);

      if (_os_feature_enabled_impl())
      {
        v26 = objc_alloc(MEMORY[0x1E0D7FFC8]);
        v30[0] = v16;
        v30[1] = 3221225472;
        v30[2] = __28__PLBackupRestoreAgent_init__block_invoke_34;
        v30[3] = &unk_1E8577F48;
        v27 = v24;
        v31 = v27;
        v28 = (void *)objc_msgSend(v26, "initWithOperator:forEntryKey:withBlock:", v27, CFSTR("XPCMetrics_OngoingRestore_14_2"), v30);
        -[PLBackupRestoreAgent setFastPassCallback:](v27, "setFastPassCallback:", v28);

      }
    }
    self = v5;
    v3 = self;
  }

  return v3;
}

uint64_t __28__PLBackupRestoreAgent_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDebugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::kMBManagerBackupStateChangedNotification fired"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent init]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 101);

    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateBackupState");
}

uint64_t __28__PLBackupRestoreAgent_init__block_invoke_25(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isDebugEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::kMBManagerRestoreStateChangedNotification fired"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent init]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 108);

    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateRestoreState");
}

void __28__PLBackupRestoreAgent_init__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Backup restore state changed. UserInfo: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardBackupRestore");
}

void __28__PLBackupRestoreAgent_init__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Fast Pass Process state changed. Notification Received", (uint8_t *)&v6, 2u);
  }

  if (v3)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Fast Pass Process state changed. User info:%@", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleFastPassCallback:", v3);
  }

}

- (void)handleFastPassCallback:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
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
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v53 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state changed. UserInfo: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("entry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("state"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("state"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("processName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 > 29)
        {
          if (v12 == 30)
          {
            PLLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Stopped", buf, 2u);
            }

            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v15 = v13;
            v30 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (!v30)
              goto LABEL_45;
            v31 = v30;
            v36 = v13;
            v32 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v42 != v32)
                  objc_enumerationMutation(v15);
                v34 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 16, v34, v5);

              }
              v31 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            }
            while (v31);
            goto LABEL_44;
          }
          if (v12 == 60)
          {
            PLLogCommon();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Completed", buf, 2u);
            }

            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v15 = v13;
            v23 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (!v23)
              goto LABEL_45;
            v24 = v23;
            v36 = v13;
            v25 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v38 != v25)
                  objc_enumerationMutation(v15);
                v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "createQualificationEventForwardWithQualificationID:withRemovingChildNodeName:withStartDate:", 16, v27, v5);

              }
              v24 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            }
            while (v24);
            goto LABEL_44;
          }
        }
        else
        {
          if (v12 == 10)
          {
            PLLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Scheduled", buf, 2u);
            }
            goto LABEL_45;
          }
          if (v12 == 20)
          {
            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Fast Pass Process state Start", buf, 2u);
            }

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v15 = v13;
            v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
            if (!v16)
              goto LABEL_45;
            v17 = v16;
            v36 = v13;
            v18 = *(_QWORD *)v46;
            do
            {
              for (k = 0; k != v17; ++k)
              {
                if (*(_QWORD *)v46 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
                objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "createQualificationEventForwardWithQualificationID:withAddingChildNodeName:withStartDate:", 16, v20, v5);

              }
              v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
            }
            while (v17);
LABEL_44:
            v13 = v36;
LABEL_45:

            goto LABEL_46;
          }
        }
        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_ERROR, "Ongoing Restore: DAS Fast Pass State is invalid: Not one of scheduled, started, stopped or fully done", buf, 2u);
        }
        goto LABEL_45;
      }
    }
  }
LABEL_46:

}

- (void)initOperatorDependancies
{
  void *v3;
  id v4;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
  {
    -[PLBackupRestoreAgent updateBackupState](self, "updateBackupState");
    -[PLBackupRestoreAgent updateRestoreState](self, "updateRestoreState");
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 39, &unk_1E864E470, v3);

  }
}

- (void)setBackupState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_backupState != a3)
  {
    v3 = a3;
    if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
    {
      if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::setBackupState:%i"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent setBackupState:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 190);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
      -[PLBackupRestoreAgent didChangeEvent:toState:](self, "didChangeEvent:toState:", CFSTR("Backup"), v3);
      self->_backupState = v3;
    }
  }
}

- (void)setRestoreState:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_restoreState != a3)
  {
    v3 = a3;
    if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
    {
      if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::setRestoreState:%i"), v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent setRestoreState:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 198);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v12 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
      -[PLBackupRestoreAgent didChangeEvent:toState:](self, "didChangeEvent:toState:", CFSTR("Restore"), v3);
      self->_restoreState = v3;
    }
  }
}

- (void)didChangeEvent:(id)a3 toState:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("Backup")) & 1) != 0
     || objc_msgSend(v5, "isEqualToString:", CFSTR("Restore"))))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v14 = v5;
      v15[0] = &unk_1E8653A30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 12, v7, v6);

      v12 = v5;
      v13 = &unk_1E8653A30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 12, MEMORY[0x1E0C9AA70], v6);

      v9 = &unk_1E864E498;
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 39, v9, v6);

  }
}

- (void)updateBackupState
{
  void *v3;
  id v4;

  -[PLBackupRestoreAgent backupRestoreManager](self, "backupRestoreManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backupState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBackupRestoreAgent setBackupState:](self, "setBackupState:", objc_msgSend(v3, "state") == 2);

}

- (void)updateRestoreState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PLBackupRestoreAgent backupRestoreManager](self, "backupRestoreManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restoreState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  -[PLBackupRestoreAgent setRestoreState:](self, "setRestoreState:", (_DWORD)v5 == 2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __42__PLBackupRestoreAgent_updateRestoreState__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v6;
    if (qword_1ED8859C8 != -1)
      dispatch_once(&qword_1ED8859C8, &block);
    if (_MergedGlobals_1_66)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBackupRestoreAgent::restoreState:%d"), v5, block, v17, v18, v19, v20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLBackupRestoreAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBackupRestoreAgent updateRestoreState]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 231);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v13 = (v5 - 1) < 3;
  v14 = (void *)MEMORY[0x1E0D7FFA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:forApplicationID:saveToDisk:", v15, CFSTR("ongoingRestore"), CFSTR("com.apple.powerlogd"), 1);

}

uint64_t __42__PLBackupRestoreAgent_updateRestoreState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_66 = result;
  return result;
}

- (void)logEventForwardBackupRestore
{
  void *v3;
  uint32_t state;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t state64;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  -[PLBackupRestoreAgent backupRestoreNotification](self, "backupRestoreNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = notify_get_state(objc_msgSend(v3, "stateToken"), &state64);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (state)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_ERROR, "Restore state Unavailable", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v12 = state64;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "backupRestore state %llu", buf, 0xCu);
    }

    v9 = CFSTR("State");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", state64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("BackupMetrics"), CFSTR("RestoreState"), v6);
  }

}

- (MBManager)backupRestoreManager
{
  return (MBManager *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)backupState
{
  return self->_backupState;
}

- (BOOL)restoreState
{
  return self->_restoreState;
}

- (PLCFNotificationOperatorComposition)backupRestoreNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackupRestoreNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)fastPassCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFastPassCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastPassCallback, 0);
  objc_storeStrong((id *)&self->_backupRestoreNotification, 0);
  objc_storeStrong((id *)&self->_backupRestoreManager, 0);
}

@end
