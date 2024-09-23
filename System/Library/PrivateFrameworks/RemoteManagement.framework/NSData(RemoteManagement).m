@implementation NSData(RemoteManagement)

- (uint64_t)rm_atomicWriteToURL:()RemoteManagement error:
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  NSObject *v33;
  id v35;
  id v36;
  id v37;
  unsigned __int8 v38;

  v6 = a3;
  v38 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v38);
  v10 = v38;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "substringToIndex:", 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR(".temp-%@-%@"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    LOBYTE(v15) = objc_msgSend(a1, "writeToURL:options:error:", v19, 0, &v37);
    v20 = v37;
    if ((v15 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v20;
      v22 = objc_msgSend(v21, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v19, 0, 1, 0, &v36);
      v23 = v36;

      +[RMLog nsdata_rm](RMLog, "nsdata_rm");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if ((v22 & 1) != 0)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.2();

        v26 = 1;
        v20 = v23;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.4();

        if (a4 && v23)
          *a4 = objc_retainAutorelease(v23);
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v23;
        v32 = objc_msgSend(v31, "removeItemAtURL:error:", v19, &v35);
        v20 = v35;

        if ((v32 & 1) == 0)
        {
          +[RMLog nsdata_rm](RMLog, "nsdata_rm");
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.3();

        }
        v26 = 0;
      }
    }
    else
    {
      +[RMLog nsdata_rm](RMLog, "nsdata_rm");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.5();

      v26 = 0;
      if (a4 && v20)
      {
        v20 = objc_retainAutorelease(v20);
        v26 = 0;
        *a4 = v20;
      }
    }

    goto LABEL_33;
  }
  +[RMLog nsdata_rm](RMLog, "nsdata_rm");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[NSData(RemoteManagement) rm_atomicWriteToURL:error:].cold.1();

  if (a4)
  {
    +[RMErrorUtilities createInternalError](RMErrorUtilities, "createInternalError");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v29;
    if (v29)
    {
      v12 = objc_retainAutorelease(v29);
      v26 = 0;
      *a4 = v12;
    }
    else
    {
      v26 = 0;
    }
LABEL_33:

    goto LABEL_34;
  }
  v26 = 0;
LABEL_34:

  return v26;
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to write temporary file since a directory is present: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21885E000, v0, OS_LOG_TYPE_DEBUG, "Wrote file atomically in-place: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to remove temporary file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to replace original file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)rm_atomicWriteToURL:()RemoteManagement error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21885E000, v0, v1, "Failed to write temporary file: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
