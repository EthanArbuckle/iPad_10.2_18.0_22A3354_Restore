@implementation NSURL(SPAdditions)

+ (id)sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:
{
  void *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v5;

  objc_msgSend(a1, "_sp_URLFromFileID:filename:parentFileID:documentID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && _CFURLIsItemPromiseAtURL())
  {
    v5 = 0;
    v2 = _CFURLCopyLogicalURLOfPromiseAtURL();

    if (!v2)
    {
      PRSLogCategoryDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        +[NSURL(SPAdditions) sp_URLFromFileID:filename:parentFileID:documentID:].cold.1((uint64_t)v1, &v5, v3);

    }
    v1 = (void *)v2;
  }
  return v1;
}

+ (id)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  char *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  int v23;
  int v24;
  int v25;
  char *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  int v31;
  char *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[4];
  int v40;
  int v41;
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v12)
  {
    PRSLogCategoryDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.1(v22);
    goto LABEL_37;
  }
  v14 = objc_msgSend(v12, "unsignedIntValue");
  if (!v9)
    goto LABEL_15;
  objc_msgSend(v9, "unsignedLongValue");
  v15 = openbyid();
  if (v15 < 0)
    goto LABEL_15;
  v16 = v15;
  v38 = 0;
  v37 = xmmword_1B87DF058;
  bzero(v39, 0x410uLL);
  if (fgetattrlist(v16, &v37, v39, 0x410uLL, 0x21u) < 0)
  {
    PRSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
  }
  else
  {
    if (v40 == v14)
    {
      v17 = (char *)&v41 + v41;
      v18 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v37, v38);
      v19 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringWithFileSystemRepresentation:length:](v19, "stringWithFileSystemRepresentation:length:", v17, v42);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fileURLWithPath:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    PRSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.3();
  }
  v21 = 0;
LABEL_14:

  close(v16);
  if (v21)
    goto LABEL_45;
LABEL_15:
  if (!v10)
    goto LABEL_28;
  if (!v11)
    goto LABEL_28;
  objc_msgSend(v11, "unsignedLongValue");
  v23 = openbyid();
  if (v23 < 0)
    goto LABEL_28;
  v24 = v23;
  v25 = openat(v23, (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), 256);
  close(v24);
  if (v25 < 0)
    goto LABEL_28;
  v38 = 0;
  v37 = xmmword_1B87DF058;
  bzero(v39, 0x410uLL);
  if (fgetattrlist(v25, &v37, v39, 0x410uLL, 0x21u) < 0)
  {
    PRSLogCategoryDefault();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
  }
  else
  {
    if (v40 == v14)
    {
      v26 = (char *)&v41 + v41;
      v27 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject stringWithFileSystemRepresentation:length:](v28, "stringWithFileSystemRepresentation:length:", v26, v42);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fileURLWithPath:", v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    }
    PRSLogCategoryDefault();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.3();
  }
  v21 = 0;
LABEL_27:

  close(v25);
  if (!v21)
  {
LABEL_28:
    if (device_id_onceToken != -1)
      dispatch_once(&device_id_onceToken, &__block_literal_global_7);
    if (GSLibraryResolveDocumentId2())
    {
      v30 = openbyid();
      if ((v30 & 0x80000000) == 0)
      {
        v31 = v30;
        v38 = 0;
        v37 = xmmword_1B87DF058;
        bzero(v39, 0x410uLL);
        if (fgetattrlist(v31, &v37, v39, 0x410uLL, 0x21u) < 0)
        {
          PRSLogCategoryDefault();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.4();
        }
        else
        {
          if (v40 == v14)
          {
            v32 = (char *)&v41 + v41;
            v33 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v34 = objc_claimAutoreleasedReturnValue();
            -[NSObject stringWithFileSystemRepresentation:length:](v34, "stringWithFileSystemRepresentation:length:", v32, v42);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "fileURLWithPath:", v35);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
            close(v31);
            goto LABEL_45;
          }
          PRSLogCategoryDefault();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.3();
        }
        v21 = 0;
        goto LABEL_44;
      }
      goto LABEL_38;
    }
    PRSLogCategoryDefault();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[NSURL(SPAdditions) _sp_URLFromFileID:filename:parentFileID:documentID:].cold.2();
LABEL_37:

LABEL_38:
    v21 = 0;
  }
LABEL_45:

  return v21;
}

+ (void)sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "Failed to copy logical URL of promise at %@: %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_8();
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B86C5000, log, OS_LOG_TYPE_ERROR, "Item missing document ID", v1, 2u);
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B86C5000, v1, v2, "GSLibraryResolveDocumentId2 failed, errno:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1B86C5000, v0, v1, "document IDs didn't match (%d v/s %d)", v2, v3);
  OUTLINED_FUNCTION_8();
}

+ (void)_sp_URLFromFileID:()SPAdditions filename:parentFileID:documentID:.cold.4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_5();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(v0);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1B86C5000, v1, v2, "fgetattrlist failed, error:%d(%s)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

@end
