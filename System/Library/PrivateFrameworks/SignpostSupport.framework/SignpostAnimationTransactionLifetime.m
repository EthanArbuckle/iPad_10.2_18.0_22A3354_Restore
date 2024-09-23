@implementation SignpostAnimationTransactionLifetime

- (SignpostAnimationTransactionLifetime)initWithTransactionSeedInterval:(id)a3
{
  id v4;
  SignpostAnimationTransactionLifetime *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *processName;
  void *v12;
  uint64_t v13;
  NSString *executablePath;
  SignpostAnimationTransactionLifetime *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SignpostAnimationTransactionLifetime;
  v5 = -[SignpostAnimationSubInterval initWithInterval:](&v25, sel_initWithInterval_, v4);
  if (!v5)
    goto LABEL_4;
  v5->_transactionSeed = objc_msgSend(v4, "signpostId");
  objc_msgSend(v4, "endEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_numberArgumentWithName:", CFSTR("swap_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v5->_swapId = objc_msgSend(v7, "unsignedLongLongValue");

    objc_msgSend(v4, "beginEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v8, "processID");

    objc_msgSend(v4, "beginEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v10;

    objc_msgSend(v4, "beginEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processImagePath");
    v13 = objc_claimAutoreleasedReturnValue();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v13;

LABEL_4:
    v15 = v5;
    goto LABEL_8;
  }
  _signpost_debug_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[SignpostAnimationTransactionLifetime initWithTransactionSeedInterval:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  v15 = 0;
LABEL_8:

  return v15;
}

- (unsigned)transactionSeed
{
  return self->_transactionSeed;
}

- (unsigned)swapId
{
  return self->_swapId;
}

- (int)pid
{
  return self->_pid;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (void)initWithTransactionSeedInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find swap_id in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
