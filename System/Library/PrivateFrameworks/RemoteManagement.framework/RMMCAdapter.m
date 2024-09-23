@implementation RMMCAdapter

+ (void)fetchDataAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  +[RMLog mcAdapter](RMLog, "mcAdapter");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[RMMCAdapter fetchDataAtURL:completionHandler:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x24BE60D78], "fetchDataAtURL:completionHandler:", v5, v6);
}

+ (void)downloadDataAtURL:(id)a3 downloadURL:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  +[RMLog mcAdapter](RMLog, "mcAdapter");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    +[RMMCAdapter downloadDataAtURL:downloadURL:completionHandler:].cold.1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend(MEMORY[0x24BE60D78], "downloadDataAtURL:downloadURL:completionHandler:", v7, v9, v8);
}

+ (void)fetchDataAtURL:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21885E000, a2, a3, "Fetching MDM data at: %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)downloadDataAtURL:(uint64_t)a3 downloadURL:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_21885E000, a2, a3, "Downloading MDM data at: %{public}@", a5, a6, a7, a8, 2u);
}

@end
