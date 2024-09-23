@implementation WBSPasswordWarningTopFraudTargets

- (WBSPasswordWarningTopFraudTargets)initWithHighPriorityTargets:(id)a3 targets:(id)a4 financialTargets:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSPasswordWarningTopFraudTargets *v11;
  uint64_t v12;
  NSArray *highPriorityFraudTargets;
  uint64_t v14;
  NSArray *fraudTargets;
  uint64_t v16;
  NSArray *financialFraudTargets;
  WBSPasswordWarningTopFraudTargets *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordWarningTopFraudTargets;
  v11 = -[WBSPasswordWarningTopFraudTargets init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    highPriorityFraudTargets = v11->_highPriorityFraudTargets;
    v11->_highPriorityFraudTargets = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    fraudTargets = v11->_fraudTargets;
    v11->_fraudTargets = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    financialFraudTargets = v11->_financialFraudTargets;
    v11->_financialFraudTargets = (NSArray *)v16;

    v18 = v11;
  }

  return v11;
}

- (WBSPasswordWarningTopFraudTargets)initWithSnapshotData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSPasswordWarningTopFraudTargets *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
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
  void *v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithJSONOrPropertyListData:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("highPriorityFraudTargets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fraudTargets"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("financialFraudTargets"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          self = -[WBSPasswordWarningTopFraudTargets initWithHighPriorityTargets:targets:financialTargets:](self, "initWithHighPriorityTargets:targets:financialTargets:", v8, v9, v10);
          v11 = self;
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
        v36 = WBS_LOG_CHANNEL_PREFIXPasswords();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);
          if (!a4)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (a4)
        {
LABEL_17:
          v44 = (void *)MEMORY[0x1E0CB35C8];
          v45 = *MEMORY[0x1E0CB28A8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TopFraudTargets plist missing %@ key"), CFSTR("financialFraudTargets"), *MEMORY[0x1E0CB2D50]);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 259, v47);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_18:
        v11 = 0;
        goto LABEL_19;
      }
      v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:].cold.3(v25, v26, v27, v28, v29, v30, v31, v32);
        if (a4)
          goto LABEL_14;
      }
      else if (a4)
      {
LABEL_14:
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0CB28A8];
        v51 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TopFraudTargets plist missing %@ key"), CFSTR("fraudTargets"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 259, v35);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      }
      v11 = 0;
      goto LABEL_20;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);
      if (a4)
        goto LABEL_11;
    }
    else if (a4)
    {
LABEL_11:
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB28A8];
      v53 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TopFraudTargets plist missing %@ key"), CFSTR("highPriorityFraudTargets"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 259, v10);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    v11 = 0;
    goto LABEL_21;
  }
  v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[WBSPasswordWarningTopFraudTargets initWithSnapshotData:error:].cold.1(v12);
    if (a4)
      goto LABEL_8;
LABEL_24:
    v11 = 0;
    goto LABEL_22;
  }
  if (!a4)
    goto LABEL_24;
LABEL_8:
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB28A8];
  v55 = *MEMORY[0x1E0CB2D50];
  v56[0] = CFSTR("Failed to decode topFraudTargets plist data.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 259, v8);
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

LABEL_22:
  return v11;
}

- (NSArray)highPriorityFraudTargets
{
  return self->_highPriorityFraudTargets;
}

- (NSArray)fraudTargets
{
  return self->_fraudTargets;
}

- (NSArray)financialFraudTargets
{
  return self->_financialFraudTargets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financialFraudTargets, 0);
  objc_storeStrong((id *)&self->_fraudTargets, 0);
  objc_storeStrong((id *)&self->_highPriorityFraudTargets, 0);
}

- (void)initWithSnapshotData:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Failed to decode TopFraudTargets plist data.", v1, 2u);
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a1, a3, "TopFraudTargets plist missing %@ key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a1, a3, "TopFraudTargets plist missing %@ key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)initWithSnapshotData:(uint64_t)a3 error:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B2621000, a1, a3, "TopFraudTargets plist missing %@ key", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
