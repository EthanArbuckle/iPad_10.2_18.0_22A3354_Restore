@implementation NSURL(PRSAdditions)

- (BOOL)prs_isPosterSnapshot
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("SNAPSHOT")))
  {
    objc_msgSend(v1, "pathExtension");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("atx")))
      v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("png")) == 0;
    else
      v3 = 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)prs_isDirectory
{
  id v1;
  uint64_t v2;
  id v4;

  v4 = 0;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99968], 0);
  v1 = v4;
  v2 = objc_msgSend(v1, "isEqual:", *MEMORY[0x1E0C99960]);

  return v2;
}

- (BOOL)prs_isPurgable
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  v3 = 0u;
  fsctl((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0x40304A6DuLL, &v3, 0);
  return (~(_WORD)v3 & 0xE00) == 0 || (_QWORD)v4 != 0;
}

- (uint64_t)prs_setPurgable:()PRSAdditions afterDate:error:
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  double v10;
  int v11;
  int v12;
  NSObject *v13;
  _BYTE v15[24];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[17];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a3 & 1) != 0)
  {
    v7 = objc_retainAutorelease(a1);
    v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
    if (!objc_msgSend(v7, "prs_isDirectory"))
      goto LABEL_7;
    memset(v32, 0, sizeof(v32));
    fsctl(v8, 0x40184A03uLL, v32, 0);
    if (LODWORD(v32[0]) == 1)
      goto LABEL_7;
    v31 = 0;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    *(_OWORD *)&v15[8] = 0u;
    *(_QWORD *)v15 = 0x100000001;
    if (fsctl(v8, 0xC1104A71uLL, v15, 0))
    {
      v9 = 0;
    }
    else
    {
LABEL_7:
      memset((char *)v32 + 8, 0, 40);
      *(_QWORD *)&v32[0] = 66048;
      if (v6)
      {
        *(_QWORD *)&v32[1] = 0x80000;
        objc_msgSend(v6, "timeIntervalSince1970");
        *(_QWORD *)&v32[2] = 1000000000 * (unint64_t)v10;
      }
      v11 = fsctl(v8, 0xC0304A6FuLL, v32, 0);
      v9 = v11 == 0;
      if (v11)
      {
        v12 = v11;
        PRSLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v15 = 138412802;
          *(_QWORD *)&v15[4] = v7;
          *(_WORD *)&v15[12] = 2112;
          *(_QWORD *)&v15[14] = v6;
          *(_WORD *)&v15[22] = 1024;
          LODWORD(v16) = v12;
          _os_log_error_impl(&dword_1A4996000, v13, OS_LOG_TYPE_ERROR, "Error marking '%@' as purgable %@ - %d", v15, 0x1Cu);
        }

      }
    }
  }
  else
  {
    v9 = objc_msgSend(a1, "prs_unmarkAsPurgable");
  }

  return v9;
}

- (BOOL)prs_unmarkAsPurgable
{
  id v1;
  int v2;
  NSObject *v3;
  uint64_t v5;

  v1 = objc_retainAutorelease(a1);
  v5 = 0;
  v2 = fsctl((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 0xC0084A44uLL, &v5, 0);
  if (v2)
  {
    PRSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NSURL(PRSAdditions) prs_unmarkAsPurgable].cold.1((uint64_t)v1, v2, v3);

  }
  return v2 == 0;
}

- (uint64_t)prs_URLExists:()PRSAdditions
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;

  if ((objc_msgSend(a1, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSURL_PRSAdditions.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isFileURL]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, a3);

  return v8;
}

- (void)prs_unmarkAsPurgable
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A4996000, log, OS_LOG_TYPE_ERROR, "Error marking '%@' as purgable - %d", (uint8_t *)&v3, 0x12u);
}

@end
