@implementation SignpostContextInfo

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePath, 0);
}

- (unint64_t)earliestMCT
{
  return self->_earliestMCT;
}

- (SignpostContextInfo)initWithContextInfoEvent:(id)a3
{
  id v4;
  SignpostContextInfo *v5;
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
  uint64_t v17;
  NSString *executablePath;
  SignpostContextInfo *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SignpostContextInfo;
  v5 = -[SignpostContextInfo init](&v43, sel_init);
  if (v5)
  {
    v5->_contextId = objc_msgSend(v4, "signpostId");
    objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("pid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      v5->_pid = objc_msgSend(v6, "longLongValue");

      objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("frame_seed"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        v5->_frameSeed = objc_msgSend(v8, "unsignedLongLongValue");

        objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("earliest_mct"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = v10;
          v5->_earliestMCT = objc_msgSend(v10, "unsignedLongLongValue");

          objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("previous_mct"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
            v5->_previousPresentationMCT = objc_msgSend(v12, "unsignedLongLongValue");

          objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("transaction_seed"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
            v5->_transactionSeed = objc_msgSend(v14, "unsignedLongLongValue");

          objc_msgSend(v4, "_numberArgumentWithName:", CFSTR("presentation_modifier_display_target_mct"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_inProcessAnimationDisplayTargetMCT = objc_msgSend(v16, "unsignedLongLongValue");

          objc_msgSend(v4, "_stringArgumentWithName:", CFSTR("process_name"));
          v17 = objc_claimAutoreleasedReturnValue();
          executablePath = v5->_executablePath;
          v5->_executablePath = (NSString *)v17;

          goto LABEL_10;
        }
        _signpost_debug_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[SignpostContextInfo initWithContextInfoEvent:].cold.3(v20, v35, v36, v37, v38, v39, v40, v41);
      }
      else
      {
        _signpost_debug_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[SignpostContextInfo initWithContextInfoEvent:].cold.2(v20, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    else
    {
      _signpost_debug_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SignpostContextInfo initWithContextInfoEvent:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v19 = 0;
    goto LABEL_18;
  }
LABEL_10:
  v19 = v5;
LABEL_18:

  return v19;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)processName
{
  void *v2;
  void *v3;

  -[SignpostContextInfo executablePath](self, "executablePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unint64_t)previousPresentationMCT
{
  return self->_previousPresentationMCT;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (unint64_t)inProcessAnimationDisplayTargetMCT
{
  return self->_inProcessAnimationDisplayTargetMCT;
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find pid in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find frame_seed in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithContextInfoEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find earliest_mct in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
