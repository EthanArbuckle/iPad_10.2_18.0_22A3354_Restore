@implementation SUCoreCodeCoverage

+ (void)initializeForName:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B05B8000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }

}

+ (void)_handleSignal:(int)a3 forName:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 == 31)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1B05B8000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Signal handler received SIGUSR2, resetting code coverage", (uint8_t *)v12, 2u);
    }

    +[SUCoreCodeCoverage resetCodeCoverageForName:](SUCoreCodeCoverage, "resetCodeCoverageForName:", v5);
  }
  else if (a3 == 30)
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1B05B8000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Signal handler received SIGUSR1, dumping code coverage", (uint8_t *)v12, 2u);
    }

    +[SUCoreCodeCoverage dumpCodeCoverageForName:](SUCoreCodeCoverage, "dumpCodeCoverageForName:", v5);
  }
  else
  {
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12[0] = 67109120;
      v12[1] = a3;
      _os_log_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Unhandled signal: %d (ignored)", (uint8_t *)v12, 8u);
    }

  }
}

+ (id)getCodeCoveragePathForName:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = getpid();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@.%d.%@.profraw"), CFSTR("/tmp/ASUCodeCoverage"), v4, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x1E0CB2AA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 511);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileExistsAtPath:", CFSTR("/tmp/ASUCodeCoverage")))
  {

    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v17 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/tmp/ASUCodeCoverage"), 0, v12, &v21);
    v14 = v21;

    if ((v17 & 1) == 0)
    {
      +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[SUCoreCodeCoverage getCodeCoveragePathForName:].cold.1((uint64_t)v14, v20);

      v18 = 0;
      goto LABEL_10;
    }
  }
  v18 = v10;
LABEL_10:

  return v18;
}

+ (void)dumpCodeCoverageForName:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B05B8000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }

}

+ (void)resetCodeCoverageForName:(id)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B05B8000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreCodeCoverage] Code coverage is disabled (SUCore not running in debug)", v5, 2u);
  }

}

+ (void)getCodeCoveragePathForName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B05B8000, a2, OS_LOG_TYPE_ERROR, "[SUCoreCodeCoverage] Unable to create output directory: '%{public}@'", (uint8_t *)&v2, 0xCu);
}

@end
