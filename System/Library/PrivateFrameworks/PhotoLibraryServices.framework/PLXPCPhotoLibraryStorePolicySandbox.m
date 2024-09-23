@implementation PLXPCPhotoLibraryStorePolicySandbox

- (BOOL)shouldUseXPCStoreForDatabasePath:(id)a3 auditToken:(id *)a4
{
  id v6;
  __int128 v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  _BOOL4 v13;
  char v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  _BYTE v21[32];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *(_OWORD *)&a4->var0[4];
  *(_OWORD *)v21 = *(_OWORD *)a4->var0;
  *(_OWORD *)&v21[16] = v7;
  if (objc_msgSend(MEMORY[0x1E0D732D8], "hasXPCStoreEntitlementOptInForToken:", v21))
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v21 = 0;
      v9 = "Token has XPCStore Opt-In Entitlement";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
      v12 = 2;
LABEL_14:
      _os_log_impl(&dword_199541000, v10, v11, v9, v21, v12);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v13 = -[PLXPCPhotoLibraryStorePolicySandbox hasSandboxAccessForPath:](self, "hasSandboxAccessForPath:", v6);
  v14 = !v13;
  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = CFSTR("NOT ");
    if (v13)
      v17 = &stru_1E36789C0;
    else
      v17 = CFSTR("NOT ");
    if (!v13)
      v16 = &stru_1E36789C0;
    *(_DWORD *)v21 = 138412546;
    *(_QWORD *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2112;
    *(_QWORD *)&v21[14] = v16;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "We do %@have access to the database path, so we are %@using XPC store", v21, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("com.apple.Photos.forceXPCStore"));

  if (v19)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 138412290;
      *(_QWORD *)&v21[4] = CFSTR("com.apple.Photos.forceXPCStore");
      v9 = "Forcing XPCStore due to %@ user default being set";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_14;
    }
LABEL_15:

    v14 = 1;
  }

  return v14;
}

- (BOOL)hasSandboxAccessForPath:(id)a3
{
  id v5;
  void *v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  int *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint8_t buf[16];

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isReadableFileAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  if ((PLIsAssetsd() & 1) != 0)
    goto LABEL_4;
  getpid();
  v10 = objc_retainAutorelease(v5);
  v18 = objc_msgSend(v10, "fileSystemRepresentation");
  v11 = sandbox_check();
  if (v11 < 0)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = __error();
    objc_msgSend(v13, "stringWithUTF8String:", strerror(*v14), v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLXPCPhotoLibraryStorePolicy.m"), 39, CFSTR("Error performing sandbox check in shouldUseXPCPhotoLibraryStore:%@ %@"), v10, v15);

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if (v11)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "We do NOT have access to the database path, so we are using XPC store", buf, 2u);
    }

    goto LABEL_11;
  }
LABEL_4:
  v9 = 1;
LABEL_12:

  return v9;
}

@end
