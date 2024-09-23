@implementation NSXPCConnection(TUAdditions)

- (uint64_t)tu_clientSandboxCanAccessFileURL:()TUAdditions
{
  id v4;
  char v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a1, "auditToken");
  if ((objc_msgSend(v4, "isFileURL") & 1) != 0)
  {
    v29 = 0;
    v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", &v29);
    v6 = v29;
    if ((v5 & 1) != 0)
    {
      v7 = objc_retainAutorelease(v4);
      if (objc_msgSend(v7, "fileSystemRepresentation"))
      {
        if (!sandbox_check_by_audit_token())
        {
          v27 = 1;
          goto LABEL_15;
        }
        TUDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:].cold.2(v8);
      }
      else
      {
        TUDefaultLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:].cold.1((uint64_t)v7, v8, v21, v22, v23, v24, v25, v26);
      }
    }
    else
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:].cold.3((uint64_t)v6, v8, v15, v16, v17, v18, v19, v20);
    }

  }
  else
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NSXPCConnection(TUAdditions) tu_clientSandboxCanAccessFileURL:].cold.4((uint64_t)v4, v6, v9, v10, v11, v12, v13, v14);
  }
  v27 = 0;
LABEL_15:

  return v27;
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Could not get file system representation for URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.2(NSObject *a1)
{
  int v2;
  int *v3;
  char *v4;
  _DWORD v5[2];
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  v6 = 2080;
  v7 = v4;
  _os_log_error_impl(&dword_19A50D000, a1, OS_LOG_TYPE_ERROR, "Client sandbox does not have access to the given file! (Error %i: %s)", (uint8_t *)v5, 0x12u);
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "URL resource is not reachable: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tu_clientSandboxCanAccessFileURL:()TUAdditions .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "URL is not a file system URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
