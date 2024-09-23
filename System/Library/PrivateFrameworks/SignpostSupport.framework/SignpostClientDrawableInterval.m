@implementation SignpostClientDrawableInterval

- (SignpostClientDrawableInterval)initWithClientDrawableInterval:(id)a3
{
  id v4;
  SignpostClientDrawableInterval *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *processName;
  void *v14;
  uint64_t v15;
  NSString *executablePath;
  SignpostClientDrawableInterval *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SignpostClientDrawableInterval;
  v5 = -[SignpostAnimationSubInterval initWithInterval:](&v27, sel_initWithInterval_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "beginEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_queueID = objc_msgSend(v6, "signpostId");

  objc_msgSend(v4, "beginEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_numberArgumentWithName:", CFSTR("surfaceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v5->_surfaceID = objc_msgSend(v8, "unsignedLongLongValue");

    objc_msgSend(v4, "beginEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_threadID = objc_msgSend(v9, "threadID");

    objc_msgSend(v4, "beginEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_pid = objc_msgSend(v10, "processID");

    objc_msgSend(v4, "beginEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "processName");
    v12 = objc_claimAutoreleasedReturnValue();
    processName = v5->_processName;
    v5->_processName = (NSString *)v12;

    objc_msgSend(v4, "beginEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processImagePath");
    v15 = objc_claimAutoreleasedReturnValue();
    executablePath = v5->_executablePath;
    v5->_executablePath = (NSString *)v15;

LABEL_4:
    v17 = v5;
    goto LABEL_8;
  }
  _signpost_debug_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[SignpostClientDrawableInterval initWithClientDrawableInterval:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

  v17 = 0;
LABEL_8:

  return v17;
}

- (unsigned)queueID
{
  return self->_queueID;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (unint64_t)threadID
{
  return self->_threadID;
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

- (void)initWithClientDrawableInterval:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A1A28000, a1, a3, "Could not find surfaceID in %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
