@implementation PLFileUtilities

+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_opt_class();
  objc_msgSend(a1, "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "createDirectoryAtPath:error:usingFileManager:", v6, a4, v8);

  return (char)a4;
}

+ (id)fileManager
{
  pl_dispatch_once(&fileManager_onceToken, &__block_literal_global_4405);
  return (id)fileManager__fileManager;
}

+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  char v12;
  id v13;
  id v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_mobileOwnerAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = 1;
  v12 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, v10, &v15);

  v13 = v15;
  if ((v12 & 1) == 0 && (objc_msgSend(a1, "isFileExistsError:", v13) & 1) == 0)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v13);
  }

  return v11;
}

+ (id)_mobileOwnerAttributes
{
  pl_dispatch_once(&_mobileOwnerAttributes_onceToken, &__block_literal_global_110_4318);
  return (id)_mobileOwnerAttributes_attributes;
}

+ (id)defaultSystemLibraryURL
{
  pl_dispatch_once(&_ensureSystemPhotoDataDirectoryPath_onceToken, &__block_literal_global_304);
  return (id)sDefaultSystemLibraryURL;
}

+ (id)_defaultSystemLibraryPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  os_unfair_lock_lock((os_unfair_lock_t)&sDefaultSystemLibraryPathLock);
  if (!sDefaultSystemLibraryPath)
  {
    if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1)
      dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3361);
    if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode == 2)
    {
      NSTemporaryDirectory();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUIDString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("unit-test-library-%@.photoslibrary"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingPathComponent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)sDefaultSystemLibraryPath;
      sDefaultSystemLibraryPath = v8;

    }
    else
    {
      objc_msgSend(a1, "realSystemPhotoLibraryPath");
      v10 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)sDefaultSystemLibraryPath;
      sDefaultSystemLibraryPath = v10;
    }

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", sDefaultSystemLibraryPath, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)sDefaultSystemLibraryURL;
    sDefaultSystemLibraryURL = v11;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sDefaultSystemLibraryPathLock);
  return (id)sDefaultSystemLibraryPath;
}

+ (id)realSystemPhotoLibraryPath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "embeddedHomeDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Media"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)embeddedHomeDirectory
{
  __CFString *v2;

  if (geteuid())
  {
    CPSharedResourcesDirectory();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("/var/mobile");
  }
  return v2;
}

void __41__PLFileUtilities__mobileOwnerAttributes__block_invoke()
{
  passwd *v0;
  uint64_t pw_uid;
  uint64_t pw_gid;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = getpwnam("mobile");
  if (v0)
  {
    pw_uid = v0->pw_uid;
    pw_gid = v0->pw_gid;
  }
  else
  {
    pw_uid = 501;
    pw_gid = 501;
  }
  v7[0] = *MEMORY[0x1E0CB2A90];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", pw_uid);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E0CB2A50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", pw_gid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_mobileOwnerAttributes_attributes;
  _mobileOwnerAttributes_attributes = v5;

}

void __30__PLFileUtilities_fileManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v1 = (void *)fileManager__fileManager;
  fileManager__fileManager = (uint64_t)v0;

}

+ (id)defaultSystemPhotoDataMiscDirectory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!defaultSystemPhotoDataMiscDirectory_path)
  {
    objc_msgSend(a1, "defaultSystemPhotoDataDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MISC"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)defaultSystemPhotoDataMiscDirectory_path;
    defaultSystemPhotoDataMiscDirectory_path = v3;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", defaultSystemPhotoDataMiscDirectory_path);

    if ((v6 & 1) == 0)
    {
      v10 = *MEMORY[0x1E0CB2AA8];
      v11[0] = &unk_1E378F3F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", defaultSystemPhotoDataMiscDirectory_path, 1, v7, 0);

    }
  }
  return (id)defaultSystemPhotoDataMiscDirectory_path;
}

+ (id)defaultSystemPhotoDataDirectory
{
  pl_dispatch_once(&_ensureSystemPhotoDataDirectoryPath_onceToken, &__block_literal_global_304);
  return (id)sPhotoDataDirectoryPath;
}

+ (id)defaultSystemPhotoDCIMDirectory
{
  pl_dispatch_once(&_ensureSystemDCIMDirectoryPath_onceToken, &__block_literal_global_307);
  return (id)sDCIMDirectoryPath;
}

+ (id)redactedDescriptionForFileURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "redactedDescriptionForPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)realPathForPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  char buffer[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), buffer))
    {
      v7 = (__CFString *)CFStringCreateWithFileSystemRepresentation(0, buffer);
      v8 = 0;
      if (!a4)
        goto LABEL_10;
    }
    else
    {
      v7 = 0;
      v8 = *__error();
      if (!a4)
        goto LABEL_10;
    }
  }
  else
  {
    v8 = 0;
    v7 = 0;
    if (!a4)
      goto LABEL_10;
  }
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v8, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v7;
}

+ (id)redactedDescriptionForPath:(id)a3
{
  id v3;
  void *v4;
  stat v6;

  v3 = objc_retainAutorelease(a3);
  if (!objc_msgSend(v3, "fileSystemRepresentation")
    || (memset(&v6, 0, sizeof(v6)),
        lstat((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), &v6))
    || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fs=%d/file=%llu"), v6.st_dev, v6.st_ino), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hash=%lu"), objc_msgSend(v3, "hash"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)proxyLockFilePathForDatabasePath:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  int *v11;
  char *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const void *v18;
  CC_LONG v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLAssetsdClient *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  _QWORD v29[6];
  id v30;
  char v31;
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  char *v35;
  statfs v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v31 = 0;
  bzero(&v36, 0x878uLL);
  -[NSObject stringByDeletingLastPathComponent](v5, "stringByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v31))
    v8 = v31 == 0;
  else
    v8 = 1;
  if (v8)
  {

LABEL_10:
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 138412546;
      v33 = v5;
      v34 = 2082;
      v35 = v12;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "error finding volume info for proxy lock path on %@: %{public}s:", buf, 0x16u);
    }
    v13 = 0;
    goto LABEL_13;
  }
  v9 = statfs((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), &v36);

  if (v9)
    goto LABEL_10;
  if ((v36.f_flags & 0x1000) != 0)
  {
    v13 = 0;
    goto LABEL_14;
  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__PLFileUtilities_proxyLockFilePathForDatabasePath___block_invoke;
    v29[3] = &__block_descriptor_48_e5_v8__0l;
    v29[4] = a2;
    v29[5] = a1;
    pl_dispatch_once(&proxyLockFilePathForDatabasePath__onceToken, v29);
    v15 = -[NSObject length](v5, "length");
    if ((unint64_t)(v15 + objc_msgSend((id)proxyLockFilePathForDatabasePath__lockPath, "length") - 1024) > 0xFFFFFFFFFFFFFBFELL)
    {
      -[NSObject stringByReplacingOccurrencesOfString:withString:](v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_retainAutorelease(v5);
      v18 = (const void *)-[NSObject UTF8String](v17, "UTF8String");
      v19 = -[NSObject lengthOfBytesUsingEncoding:](v17, "lengthOfBytesUsingEncoding:", 4);
      v20 = objc_retainAutorelease(v16);
      CC_SHA256(v18, v19, (unsigned __int8 *)objc_msgSend(v20, "mutableBytes"));
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject lastPathComponent](v17, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingPathComponent:", v22);
      v10 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend((id)proxyLockFilePathForDatabasePath__lockPath, "stringByAppendingPathComponent:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoLibraryPathManager libraryURLFromDatabaseURL:](PLPhotoLibraryPathManager, "libraryURLFromDatabaseURL:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[PLAssetsdClient initWithPhotoLibraryURL:]([PLAssetsdClient alloc], "initWithPhotoLibraryURL:", v24);
    -[PLAssetsdClient libraryClient](v25, "libraryClient");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v26, "proxyLockFileWithDatabasePath:error:", v5, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v30;

    if (!v13)
    {
      PLBackendGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_impl(&dword_199DF7000, v27, OS_LOG_TYPE_ERROR, "Client failed to access the proxy lock file path. Error: %@", buf, 0xCu);
      }

    }
  }
LABEL_13:

LABEL_14:
  return v13;
}

+ (id)defaultSystemPhotoDataCPLDirectory
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (!defaultSystemPhotoDataCPLDirectory_path)
  {
    objc_msgSend(a1, "defaultSystemPhotoDataDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CPL"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)defaultSystemPhotoDataCPLDirectory_path;
    defaultSystemPhotoDataCPLDirectory_path = v3;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", defaultSystemPhotoDataCPLDirectory_path);

    if ((v6 & 1) == 0)
    {
      v10 = *MEMORY[0x1E0CB2AA8];
      v11[0] = &unk_1E378F3F8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", defaultSystemPhotoDataCPLDirectory_path, 1, v7, 0);

    }
  }
  return (id)defaultSystemPhotoDataCPLDirectory_path;
}

+ (id)proxyLockCoordinatingFilePathForDatabaseDirectory:(id)a3 databaseName:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR(".%@-conch"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)secureMoveItemAtURL:(id)a3 toURL:(id)a4 capabilities:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  unsigned int v31;
  useconds_t v32;
  int v33;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  const __CFString *v61;
  NSObject *v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 349, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toURL"));

LABEL_3:
  v50 = a1;
  objc_msgSend(a1, "fileManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = *MEMORY[0x1E0CB2AD8];
  v69 = *MEMORY[0x1E0CB2AD8];
  v14 = *MEMORY[0x1E0CB2AC0];
  v70[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v54 = v13;
  v17 = objc_msgSend(v13, "setAttributes:ofItemAtPath:error:", v15, v16, &v58);
  v18 = v58;

  if ((v17 & 1) == 0)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v64 = v20;
      v65 = 2112;
      v66 = v21;
      v67 = 2112;
      v68 = v18;
      _os_log_impl(&dword_199DF7000, v19, OS_LOG_TYPE_ERROR, "Unable to assign data protection to %@ before moving to %@: %@", buf, 0x20u);

    }
  }
  v22 = objc_retainAutorelease(v10);
  v23 = (const char *)objc_msgSend(v22, "fileSystemRepresentation");
  v24 = objc_retainAutorelease(v11);
  v25 = (const char *)objc_msgSend(v24, "fileSystemRepresentation");
  v26 = objc_msgSend(v12, "isSecludeRenameCapable");
  v55 = v12;
  if ((objc_msgSend(v12, "isCloneCapable") & 1) == 0)
  {
    v31 = 1;
    v32 = 10;
    while (renamex_np(v23, v25, v26))
    {
      v33 = *__error();
      if (v31 > 1 && v33 != 16 || v31 > 0xE)
        goto LABEL_9;
      usleep(v32);
      v32 *= 2;
      ++v31;
    }
    goto LABEL_21;
  }
  if (!renamex_np(v23, v25, v26))
  {
LABEL_21:
    v30 = 0;
    LODWORD(v29) = 1;
    goto LABEL_22;
  }
LABEL_9:
  v27 = *__error();
  if ((_DWORD)v27 != 18)
  {
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2FE0];
    v61 = CFSTR("reason");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v27));
    v42 = objc_claimAutoreleasedReturnValue();
    v62 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", v29, v27, v45);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(v29) = 0;
    v36 = a6;
    v37 = v54;
    goto LABEL_33;
  }
  objc_msgSend(v50, "fileManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  LODWORD(v29) = objc_msgSend(v28, "moveItemAtURL:toURL:error:", v22, v24, &v57);
  v30 = v57;

LABEL_22:
  if (((v29 ^ 1 | v17) & 1) == 0)
  {
    v59 = v51;
    v60 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v18;
    v37 = v54;
    v40 = objc_msgSend(v54, "setAttributes:ofItemAtPath:error:", v38, v39, &v56);
    v52 = v56;

    PLBackendGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v24, "path");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v43;
        _os_log_impl(&dword_199DF7000, v42, OS_LOG_TYPE_DEFAULT, "Assigned data protection after move to %@", buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v24, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = v46;
      v65 = 2112;
      v18 = v52;
      v66 = v52;
      _os_log_impl(&dword_199DF7000, v42, OS_LOG_TYPE_ERROR, "Unable to assign data protection after move to %@: %@", buf, 0x16u);

LABEL_32:
      v36 = a6;
LABEL_33:

      if (!v36)
        goto LABEL_36;
      goto LABEL_34;
    }
    v18 = v52;
    goto LABEL_32;
  }
  v36 = a6;
  v37 = v54;
  if (!a6)
    goto LABEL_36;
LABEL_34:
  if ((v29 & 1) == 0)
    *v36 = objc_retainAutorelease(v30);
LABEL_36:

  return v29;
}

+ (BOOL)cloneFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int *v18;
  void *v19;
  void *v20;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

  v12 = clonefile(v9, v11, 0);
  v13 = v12;
  if (a5 && v12)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v16 = *__error();
    v22 = CFSTR("reason");
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = __error();
    objc_msgSend(v17, "stringWithUTF8String:", strerror(*v18));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v13 == 0;
}

+ (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("toURL"));

LABEL_3:
  objc_msgSend(a1, "fileManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v9, v11, a5);
  if (v13)
  {
    v28 = *MEMORY[0x1E0CB2AD8];
    v29[0] = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v16 = objc_msgSend(v12, "setAttributes:ofItemAtPath:error:", v14, v15, &v23);
    v17 = v23;

    if ((v16 & 1) == 0)
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v25 = v19;
        v26 = 2112;
        v27 = v17;
        _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "Unable to assign data protection after move to %@: %@", buf, 0x16u);

      }
    }

  }
  return v13;
}

+ (int64_t)directoryEntryCountAtURL:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  int64_t v28;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  statfs v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  memset(&v45, 0, 512);
  v5 = objc_retainAutorelease(a3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  if (!statfs(v6, &v45))
  {
    memset(v36, 0, 44);
    v34 = xmmword_199EB0B58;
    v35 = 0;
    if (getattrlist(v45.f_mntonname, &v34, v36, 0x2CuLL, 0))
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2FE0];
      v18 = *__error();
      v19 = *MEMORY[0x1E0CB2AA0];
      v41[0] = *MEMORY[0x1E0CB2938];
      v41[1] = v19;
      v42[0] = CFSTR("error finding volume capabilities");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45.f_mntonname);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v16;
      v22 = v17;
      v23 = v18;
    }
    else
    {
      if ((v36[2] & 2) != 0)
      {
        v33 = 0;
        v32 = xmmword_199EB0B70;
        v31 = 0;
        if (!getattrlist(v6, &v32, &v31, 8uLL, 0))
        {
          v28 = HIDWORD(v31);
          goto LABEL_13;
        }
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB2FE0];
        v9 = *__error();
        v30 = *MEMORY[0x1E0CB3308];
        v37[0] = *MEMORY[0x1E0CB2938];
        v37[1] = v30;
        v38[0] = CFSTR("error finding directory entry count");
        v38[1] = v5;
        v11 = (void *)MEMORY[0x1E0C99D80];
        v12 = v38;
        v13 = v37;
        goto LABEL_3;
      }
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2FE0];
      v26 = *MEMORY[0x1E0CB2AA0];
      v39[0] = *MEMORY[0x1E0CB2938];
      v39[1] = v26;
      v40[0] = CFSTR("volume does not support ATTR_DIR_ENTRYCOUNT");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v45.f_mntonname);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v40[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v24;
      v22 = v25;
      v23 = 45;
    }
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v20);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
      *a4 = v27;

    goto LABEL_12;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0CB2FE0];
  v9 = *__error();
  v10 = *MEMORY[0x1E0CB3308];
  v43[0] = *MEMORY[0x1E0CB2938];
  v43[1] = v10;
  v44[0] = CFSTR("error finding volume info");
  v44[1] = v5;
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = v44;
  v13 = v43;
LABEL_3:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
    *a4 = v15;
LABEL_12:

  v28 = -1;
LABEL_13:

  return v28;
}

+ (BOOL)removeFilesInDirectoryAtURL:(id)a3 withPrefix:(id)a4 error:(id *)a5 progress:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  DIR *v17;
  DIR *v18;
  void *v19;
  char v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  dirent *v24;
  const char *d_name;
  int d_type;
  size_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  BOOL v42;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  char v58[1024];
  _QWORD v59[2];
  _QWORD v60[2];
  uint64_t v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_retainAutorelease(v9);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  v14 = objc_retainAutorelease(v10);
  v15 = objc_msgSend(v14, "UTF8String");
  if (!v14 || (v16 = (const char *)v15, !objc_msgSend(v14, "length")))
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2FE0];
    v61 = *MEMORY[0x1E0CB2938];
    v62[0] = CFSTR("nil or empty prefix not supported");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v32 = v29;
    v33 = 22;
    goto LABEL_23;
  }
  v17 = opendir(v13);
  if (!v17)
  {
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2FE0];
    v46 = *__error();
    v47 = *MEMORY[0x1E0CB3308];
    v59[0] = *MEMORY[0x1E0CB2938];
    v59[1] = v47;
    v60[0] = CFSTR("error opening directory");
    v60[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v44;
    v32 = v45;
    v33 = v46;
LABEL_23:
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v33, v30);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = v34;
    goto LABEL_32;
  }
  v18 = v17;
  objc_msgSend(v12, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hasSuffix:", CFSTR("/"));

  if ((v20 & 1) == 0)
  {
    __strlcpy_chk();
    __strlcat_chk();
  }
  v21 = 0;
  v22 = 0;
  v23 = 0;
LABEL_7:
  v52 = v23;
  v53 = v21;
  while (1)
  {
    v24 = readdir(v18);
    if (!v24)
      break;
    d_name = v24->d_name;
    d_type = v24->d_type;
    if (d_type == 4)
    {
      if (strcmp(v24->d_name, ".") && strcmp(d_name, ".."))
        goto LABEL_15;
    }
    else
    {
      if (d_type == 8)
      {
        v27 = strlen(v16);
        if (!strncmp(d_name, v16, v27))
        {
          __strlcpy_chk();
          __strlcat_chk();
          if (unlink(v58))
          {
            closedir(v18);
            v48 = (void *)MEMORY[0x1E0CB35C8];
            v49 = *MEMORY[0x1E0CB2FE0];
            v50 = *__error();
            v51 = *MEMORY[0x1E0CB2AA0];
            v56[0] = *MEMORY[0x1E0CB2938];
            v56[1] = v51;
            v57[0] = CFSTR("error unlinking path");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v58);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v57[1] = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "errorWithDomain:code:userInfo:", v49, v50, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          }
          v23 = v52;
          if (v53 + 1 - v52 >= 0x2711)
            v23 = v53 + 1;
          v21 = v53 + 1;
          if (v53 + 1 - v52 >= 0x2711)
          {
            v21 = v53 + 1;
            if (v11)
            {
              (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, v53 + 1, v22);
              v21 = v53 + 1;
              v23 = v53 + 1;
            }
          }
          goto LABEL_7;
        }
      }
LABEL_15:
      ++v22;
    }
  }
  closedir(v18);
  if (v11)
    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, v53, v22);
  if (!rmdir(v13))
  {
    v42 = 1;
    goto LABEL_33;
  }
  v35 = (void *)MEMORY[0x1E0CB35C8];
  v36 = *MEMORY[0x1E0CB2FE0];
  v37 = *__error();
  v38 = *MEMORY[0x1E0CB2AA0];
  v54[0] = *MEMORY[0x1E0CB2938];
  v54[1] = v38;
  v55[0] = CFSTR("error removing directory");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, v37, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
  v41 = v40;
  if (a5)
    *a5 = v41;

LABEL_32:
  v42 = 0;
LABEL_33:

  return v42;
}

+ (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v6 = a3;
  objc_msgSend(a1, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "removeItemAtPath:error:", v6, &v14);

  v9 = v14;
  if ((v8 & 1) != 0)
    goto LABEL_4;
  if (PLIsErrorFileNotFound(v9))
  {

    v9 = 0;
LABEL_4:
    v10 = v9;
    v11 = 1;
    goto LABEL_5;
  }
  v13 = v9;
  v10 = v13;
  if (a4)
  {
    v10 = objc_retainAutorelease(v13);
    v11 = 0;
    *a4 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v6 = a3;
  objc_msgSend(a1, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v14);

  v9 = v14;
  if ((v8 & 1) != 0)
    goto LABEL_4;
  if (PLIsErrorFileNotFound(v9))
  {

    v9 = 0;
LABEL_4:
    v10 = v9;
    v11 = 1;
    goto LABEL_5;
  }
  v13 = v9;
  v10 = v13;
  if (a4)
  {
    v10 = objc_retainAutorelease(v13);
    v11 = 0;
    *a4 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)removeDisconnectedSQLiteDatabaseFileWithPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = objc_msgSend(&unk_1E378FF90, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    v12 = 1;
    *(_QWORD *)&v9 = 136446722;
    v22 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(&unk_1E378FF90);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v15 = v6;
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v15, "stringByAppendingString:", v14);
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v16;
        }
        v23 = 0;
        v17 = objc_msgSend(v7, "removeItemAtPath:error:", v15, &v23, v22);
        v18 = v23;
        v19 = v18;
        if ((v17 & 1) == 0 && objc_msgSend(v18, "code") != 4)
        {
          if (a4 != 0 && (v12 & 1) != 0)
            *a4 = objc_retainAutorelease(v19);
          PLBackendGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            v29 = "+[PLFileUtilities removeDisconnectedSQLiteDatabaseFileWithPath:error:]";
            v30 = 2112;
            v31 = v15;
            v32 = 2114;
            v33 = v19;
            _os_log_impl(&dword_199DF7000, v20, OS_LOG_TYPE_ERROR, "%{public}s failed to remove %@ [%{public}@]", buf, 0x20u);
          }

          v12 = 0;
        }

      }
      v10 = objc_msgSend(&unk_1E378FF90, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 1;
  }

  return v12 & 1;
}

+ (id)descriptionForFileIngestionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("unknown");
  else
    return off_1E3769EE0[a3];
}

+ (BOOL)ingestItemAtURL:(id)a3 toURL:(id)a4 type:(int64_t)a5 options:(unint64_t)a6 capabilities:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  NSObject *v52;
  void *v53;
  BOOL v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  uint64_t v61;
  void *v62;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  uint8_t buf[4];
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  unint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v64 = a7;
  PLAssetImportGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    +[PLFileUtilities descriptionForFileIngestionType:](PLFileUtilities, "descriptionForFileIngestionType:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v80 = v13;
    v81 = 2112;
    v82 = v14;
    v83 = 2112;
    v84 = v16;
    v85 = 2048;
    v86 = a6;
    _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_DEFAULT, "Ingesting %@ to %@ with ingestion type %@ option %lu", buf, 0x2Au);

  }
  v65 = v13;

  if (!a5 || (a6 & 4) == 0)
  {
LABEL_7:
    v20 = 0;
    v21 = 0;
    if ((a6 & 8) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }
  objc_msgSend(a1, "fileManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v18 = objc_msgSend(v17, "removeItemAtURL:error:", v14, &v74);
  v19 = v74;

  if ((v18 & 1) != 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v19, "userInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "domain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) & 1) != 0)
  {
    v25 = objc_msgSend(v23, "code");

    if (v25 == 2)
    {
      v21 = 0;
      v26 = 1;
      goto LABEL_14;
    }
  }
  else
  {

  }
  v21 = v19;
  v26 = 0;
LABEL_14:

  if ((a6 & 8) == 0 || (v26 & 1) == 0)
  {
    if (v26)
      goto LABEL_21;
    goto LABEL_50;
  }
  v20 = v21;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByDeletingLastPathComponent");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  v30 = objc_msgSend(v27, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v73);
  v21 = v73;

  if ((v30 & 1) != 0)
  {

    v21 = v20;
LABEL_21:
    v31 = v65;
    switch(a5)
    {
      case 0:
        objc_msgSend(v65, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = 0;
        objc_msgSend(a1, "realPathForPath:error:", v32, &v72);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v72;

        objc_msgSend(v14, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v33;
        objc_msgSend(a1, "realPathForPath:error:", v34, &v71);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v71;

        v37 = v62;
        if (v62 && v35)
        {
          if ((objc_msgSend(v62, "isEqual:", v35) & 1) != 0)
          {
            v38 = 1;
LABEL_36:

            goto LABEL_37;
          }
          v60 = (void *)MEMORY[0x1E0CB35C8];
          v44 = *MEMORY[0x1E0CB28A8];
          v77 = CFSTR("reason");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid file names are not equal"));
          v61 = objc_claimAutoreleasedReturnValue();
          v78 = v61;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "errorWithDomain:code:userInfo:", v44, 258, v45);
          v43 = (id)objc_claimAutoreleasedReturnValue();

          v21 = (id)v61;
        }
        else
        {
          v43 = v36;
        }

        v38 = 0;
        v21 = v43;
        v37 = v62;
        goto LABEL_36;
      case 1:
        v70 = v21;
        v38 = objc_msgSend(a1, "copyItemAtURL:toURL:error:", v65, v14, &v70);
        v39 = v70;
        goto LABEL_32;
      case 2:
        objc_msgSend(v65, "path");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "path");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v21;
        v38 = objc_msgSend(a1, "cloneFileAtPath:toPath:error:", v36, v40, &v69);
        v41 = v69;

        v21 = v41;
        goto LABEL_37;
      case 3:
        objc_msgSend(a1, "fileManager");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v68 = v21;
        v38 = objc_msgSend(v36, "moveItemAtURL:toURL:error:", v65, v14, &v68);
        v42 = v68;

        v21 = v42;
        goto LABEL_37;
      case 4:
        v67 = v21;
        v38 = objc_msgSend(a1, "secureMoveItemAtURL:toURL:capabilities:error:", v65, v14, v64, &v67);
        v39 = v67;
LABEL_32:
        v36 = v21;
        v21 = v39;
LABEL_37:

        if ((a6 & 1) != 0)
          goto LABEL_38;
        goto LABEL_40;
      default:
        v38 = 1;
        if ((a6 & 1) == 0)
          goto LABEL_40;
LABEL_38:
        if (v38)
          objc_msgSend(a1, "stripExtendedAttributesFromFileAtURL:inDomain:error:", v14, CFSTR("com.apple.assetsd"), 0);
LABEL_40:
        v46 = v38 ^ 1;
        if ((a6 & 2) == 0)
          v46 = 1;
        if ((v46 & 1) != 0)
        {
          if ((v38 & 1) == 0)
            goto LABEL_50;
        }
        else
        {
          objc_msgSend(a1, "fileManager");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = *MEMORY[0x1E0CB2AD8];
          v76 = *MEMORY[0x1E0CB2AC0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "path");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          v50 = objc_msgSend(v47, "setAttributes:ofItemAtPath:error:", v48, v49, &v66);
          v51 = v66;

          if ((v50 & 1) == 0)
          {
            PLBackendGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "path");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v80 = v53;
              v81 = 2112;
              v82 = v51;
              _os_log_impl(&dword_199DF7000, v52, OS_LOG_TYPE_ERROR, "Failed to assign data protection to %@, %@", buf, 0x16u);

            }
          }

        }
        v54 = 1;
        goto LABEL_55;
    }
  }

LABEL_50:
  v31 = v65;
  if (a8)
  {
    v21 = objc_retainAutorelease(v21);
    v54 = 0;
    *a8 = v21;
  }
  else
  {
    PLBackendGetLog();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      +[PLFileUtilities descriptionForFileIngestionType:](PLFileUtilities, "descriptionForFileIngestionType:", a5);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "path");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v80 = v56;
      v81 = 2112;
      v82 = v57;
      v83 = 2112;
      v84 = v58;
      v85 = 2112;
      v86 = (unint64_t)v21;
      _os_log_impl(&dword_199DF7000, v55, OS_LOG_TYPE_ERROR, "Failed to %@ %@ to %@: %@", buf, 0x2Au);

    }
    v54 = 0;
  }
LABEL_55:

  return v54;
}

+ (BOOL)stripExtendedAttributesFromFileAtURL:(id)a3 inDomain:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  int v14;
  int v15;
  ssize_t v16;
  void *v17;
  id v18;
  const char *v19;
  const char *v20;
  size_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  int *v38;
  char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  int *v47;
  char *v48;
  uint64_t v49;
  int v50;
  id v51;
  uint64_t v52;
  const char *v53;
  size_t v54;
  size_t v55;
  id v56;
  const char *v57;
  void *v58;
  void *v59;
  id v60;
  int v61;
  void *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v71;
  void *v72;
  char v73;
  void *v74;
  id *v75;
  void *v76;
  id v77;
  int fd;
  int fda;
  uint8_t buf[4];
  const __CFString *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  char *v85;
  __int16 v86;
  void *v87;
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  const __CFString *v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 717, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

  }
  v11 = (void *)MEMORY[0x19AEC2E4C]();
  objc_msgSend(v9, "path");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

  v14 = open(v13, 2097154);
  v15 = v14;
  if ((v14 & 0x80000000) == 0)
  {
    v16 = flistxattr(v14, 0, 0, 0);
    if (v16 < 0)
    {
      v76 = v11;
      v77 = v10;
      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2FE0];
      v33 = *__error();
      v92[0] = CFSTR("path");
      objc_msgSend(v9, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = CFSTR("description");
      v93[0] = v34;
      v93[1] = CFSTR("Unable to get extended attributes");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, v33, v35);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = __error();
        v39 = strerror(*v38);
        *(_DWORD *)buf = 138412802;
        v81 = CFSTR("Unable to get extended attributes");
        v82 = 2112;
        v83 = v37;
        v84 = 2080;
        v85 = v39;
        _os_log_impl(&dword_199DF7000, v36, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s).", buf, 0x20u);

      }
      close(v15);
      v30 = 0;
    }
    else
    {
      v17 = (void *)v16;
      if (!v16)
      {
        v30 = 1;
        goto LABEL_43;
      }
      v76 = v11;
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v16);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v75 = a5;
      v77 = v10;
      if ((void *)flistxattr(v15, (char *)objc_msgSend(v18, "mutableBytes"), objc_msgSend(v18, "length"), 0) == v17)
      {
        v72 = v9;
        fd = v15;
        if (v10 && objc_msgSend(v10, "length"))
        {
          v19 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
          v20 = v19;
          if (v19)
          {
            v21 = strlen(v19);
            goto LABEL_24;
          }
        }
        else
        {
          v20 = 0;
        }
        v21 = 0;
LABEL_24:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0;
        v50 = 0;
        v73 = 1;
        do
        {
          v51 = objc_retainAutorelease(v18);
          v52 = objc_msgSend(v51, "bytes");
          v53 = (const char *)(v52 + v49);
          v54 = strnlen((const char *)(v52 + v49), (size_t)v17 - v49);
          if (!v54)
            break;
          v55 = v54;
          if (!v21 || !strncmp(v53, v20, v21))
          {
            v56 = v18;
            v57 = v20;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (v58)
            {
              if (objc_msgSend(v58, "length"))
              {
                v60 = objc_retainAutorelease(v59);
                if (fremovexattr(fd, (const char *)objc_msgSend(v60, "UTF8String"), 0) < 0)
                {
                  v61 = *__error();
                  if (v61 != 93)
                  {
                    if (!v50)
                      v50 = v61;
                    objc_msgSend(v74, "addObject:", v60);
                    v73 = 0;
                  }
                }
              }
            }

            v20 = v57;
            v18 = v56;
          }
          v49 += v55 + 1;
        }
        while (v49 < (uint64_t)v17);
        if ((v73 & 1) != 0)
        {
          v17 = 0;
          v30 = 1;
          v9 = v72;
        }
        else
        {
          v62 = (void *)MEMORY[0x1E0CB35C8];
          v63 = v50;
          v64 = *MEMORY[0x1E0CB2FE0];
          v65 = v50;
          v88[0] = CFSTR("path");
          v9 = v72;
          objc_msgSend(v72, "path");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v89[0] = v66;
          v89[1] = CFSTR("Failed to remove extended attributes");
          v88[1] = CFSTR("description");
          v88[2] = CFSTR("keys");
          v89[2] = v74;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "errorWithDomain:code:userInfo:", v64, v65, v67);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          PLBackendGetLog();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v72, "path");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v81 = CFSTR("Failed to remove extended attributes");
            v82 = 2112;
            v83 = v69;
            v84 = 2080;
            v85 = strerror(v63);
            v86 = 2112;
            v87 = v74;
            _os_log_impl(&dword_199DF7000, v68, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s): %@.", buf, 0x2Au);

          }
          v30 = 0;
        }
        v11 = v76;
        v15 = fd;

        a5 = v75;
        v10 = v77;
        goto LABEL_43;
      }
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2FE0];
      v42 = *__error();
      v90[0] = CFSTR("path");
      objc_msgSend(v9, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v90[1] = CFSTR("description");
      v91[0] = v43;
      v91[1] = CFSTR("Failed to read extended attributes");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, v42, v44);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = __error();
        v48 = strerror(*v47);
        *(_DWORD *)buf = 138412802;
        v81 = CFSTR("Failed to read extended attributes");
        v82 = 2112;
        v83 = v46;
        v84 = 2080;
        v85 = v48;
        _os_log_impl(&dword_199DF7000, v45, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s).", buf, 0x20u);

      }
      close(v15);

      v30 = 0;
      a5 = v75;
    }
    v11 = v76;
    v10 = v77;
    goto LABEL_43;
  }
  fda = v14;
  v22 = v11;
  v23 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2FE0];
  v25 = *__error();
  v94 = CFSTR("path");
  objc_msgSend(v9, "path");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, v25, v27);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v9, "path");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v81 = v29;
    v82 = 2112;
    v83 = v17;
    _os_log_impl(&dword_199DF7000, v28, OS_LOG_TYPE_ERROR, "Unable to open file '%@' %@", buf, 0x16u);

  }
  v30 = 0;
  v11 = v22;
  v15 = fda;
LABEL_43:
  close(v15);
  objc_autoreleasePoolPop(v11);
  if (a5 && v17)
    *a5 = objc_retainAutorelease(v17);

  return v30;
}

+ (id)hasDiskSpaceToCopyFileAtURL:(id)a3 toVolumeAtURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 819, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationURL"));

LABEL_3:
  objc_msgSend(a1, "accessibleURLOrParentForFileURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v40[0] = *MEMORY[0x1E0C99BA8];
    v13 = v40[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v12, "resourceValuesForKeys:error:", v14, &v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v35;

    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(a1, "fileManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      objc_msgSend(v18, "attributesOfItemAtPath:error:", v19, &v34);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v34;

      if (v20)
      {
        v22 = objc_msgSend(v17, "unsignedLongLongValue");
        objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v22 > objc_msgSend(v23, "unsignedLongLongValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PLBackendGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "path");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v37 = v29;
          v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_199DF7000, v28, OS_LOG_TYPE_ERROR, "Failed to retrieve file attributes for %@, %@", buf, 0x16u);

        }
        v25 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v21);
      }

      goto LABEL_18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  PLBackendGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v11, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v27;
    v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_199DF7000, v26, OS_LOG_TYPE_ERROR, "Failed to retrieve volume attributes for %@, %@", buf, 0x16u);

  }
  if (a5)
  {
    v16 = objc_retainAutorelease(v16);
    v17 = 0;
    v25 = 0;
    *a5 = v16;
  }
  else
  {
    v17 = 0;
    v25 = 0;
  }
LABEL_18:
  v30 = v25;

  return v30;
}

+ (BOOL)setFileCreationDate:(id)a3 forFileURL:(id)a4 error:(id *)a5
{
  id v7;
  __CFString *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = (id)*MEMORY[0x1E0CB2A88];
  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v9 == (id)*MEMORY[0x1E0CB2A38];
    *(_DWORD *)buf = 138543874;
    if (v11)
      v12 = CFSTR("creation");
    else
      v12 = CFSTR("modification");
    v24 = v12;
    v25 = 2112;
    v26 = v7;
    v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "Setting file %{public}@ date to %@ on %@", buf, 0x20u);
  }

  v21 = v9;
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString path](v8, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = objc_msgSend(v14, "setAttributes:ofItemAtPath:error:", v13, v15, &v20);
  v17 = v20;

  if ((v16 & 1) == 0)
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "Could not set file creation date on %@, error: %@", buf, 0x16u);
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease(v17);

  return v16;
}

+ (BOOL)isFileExistsError:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 516)
    {
      v6 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  PLUnderlyingPOSIXError(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v6 = objc_msgSend(v7, "code") == 17;
  else
    v6 = 0;

LABEL_9:
  return v6;
}

+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5
{
  id v7;
  id v8;
  char v9;
  void *v10;
  id v11;
  id v13;

  v7 = a3;
  v8 = a5;
  if (getuid() && geteuid())
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_mobileOwnerAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v9 = objc_msgSend(v8, "setAttributes:ofItemAtPath:error:", v10, v7, &v13);
    v11 = v13;

    if (a4 && (v9 & 1) == 0)
      *a4 = objc_retainAutorelease(v11);

  }
  return v9;
}

+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "changeFileOwnerToMobileAtPath:error:usingFileManager:", v5, a4, v7);

  return (char)a4;
}

+ (int64_t)fileLengthForFilePath:(id)a3
{
  stat v4;

  if (!a3)
    return 0;
  memset(&v4, 0, sizeof(v4));
  if (stat((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v4))
  {
    return 0;
  }
  else
  {
    return v4.st_size;
  }
}

+ (BOOL)stripImmutableFlagIfNecessaryFromFileAtPath:(id)a3
{
  id v5;
  id v6;
  const char *v7;
  NSObject *v8;
  int *v9;
  char *v10;
  const char *v11;
  BOOL v12;
  int v14;
  NSObject *v15;
  int *v16;
  char *v17;
  void *v18;
  stat v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFileUtilities.m"), 961, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v6 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  memset(&v19, 0, sizeof(v19));
  if (stat(v7, &v19))
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2082;
      v23 = v10;
      v11 = "Failed to stat %@ (%{public}s).";
LABEL_6:
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
    }
  }
  else
  {
    if ((v19.st_flags & 2) == 0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v14 = chflags(v7, v19.st_flags & 0xFFFFFFFD);
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    v8 = v15;
    if (!v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Cleared IMMUTABLE flag from %@", buf, 0xCu);
      }
      v12 = 1;
      goto LABEL_8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2082;
      v23 = v17;
      v11 = "Failed to clear IMMUTABLE flag on %@ (%{public}s).";
      goto LABEL_6;
    }
  }
  v12 = 0;
LABEL_8:

LABEL_9:
  return v12;
}

+ (BOOL)fileURL:(id)a3 isEqualToFileURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      objc_msgSend(v6, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(a1, "filePath:isEqualToFilePath:", v10, v11);

    }
  }

  return v9;
}

+ (BOOL)filePath:(id)a3 hasPrefix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  objc_msgSend(a1, "realPathForPath:error:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1, "realPathForPath:error:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPrefix:", v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)filePath:(id)a3 isEqualToFilePath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(a1, "realPathForPath:error:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(a1, "realPathForPath:error:", v6, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", v9);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (BOOL)URLIsInTrash:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 102, 0xFFFFLL, v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hasPrefix:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)standardOutputStringForExecutablePath:(id)a3 arguments:(id)a4 environment:(id)a5 standardErrorOut:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;

  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0CB3958];
  v14 = a3;
  v15 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setExecutableURL:", v16);
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setStandardOutput:", v17);

  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setStandardError:", v18);

  }
  if (v11)
    objc_msgSend(v15, "setArguments:", v11);
  if (v12)
    objc_msgSend(v15, "setEnvironment:", v12);
  v30 = 0;
  v19 = objc_msgSend(v15, "launchAndReturnError:", &v30);
  v20 = v30;
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v15, "waitUntilExit");
    objc_msgSend(v15, "standardOutput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileHandleForReading");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "readDataToEndOfFile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v24, 4);
    if (a6)
    {
      objc_msgSend(v15, "standardError");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fileHandleForReading");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "readDataToEndOfFile");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4);
    }

  }
  else
  {
    v25 = 0;
    if (a7)
      *a7 = objc_retainAutorelease(v20);
  }

  return v25;
}

+ (id)_fileListingDetailsForPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15[0] = CFSTR("-l@a");
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 0;
  objc_msgSend(a1, "standardOutputStringForExecutablePath:arguments:environment:standardErrorOut:error:", CFSTR("/bin/ls"), v7, 0, &v14, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v13;

  if (v8)
  {
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[stdout]:\n%@\n[stderr]:\n%@"), v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v8;
}

+ (id)_attributeDetailsForPath:(id)a3 ofFileSystem:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    v21 = 0;
    v10 = (id *)&v21;
    objc_msgSend(v8, "attributesOfFileSystemForPath:error:", v7, &v21);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
    v10 = (id *)&v20;
    objc_msgSend(v8, "attributesOfItemAtPath:error:", v7, &v20);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
  v13 = *v10;

  if (v12)
  {
    if (objc_msgSend(v12, "count"))
    {
      v14 = (void *)objc_msgSend(CFSTR("empty"), "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__PLFileUtilities__attributeDetailsForPath_ofFileSystem_error___block_invoke;
    v18[3] = &unk_1E3769E50;
    v15 = v14;
    v19 = v15;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
  else
  {
    v15 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }
  v16 = v15;

  return v16;
}

+ (id)_diagnosticInfoForPath:(id)a3 includeFileSystemAttributes:(BOOL)a4 resolvedFileSystemAttributes:(BOOL *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__PLFileUtilities__diagnosticInfoForPath_includeFileSystemAttributes_resolvedFileSystemAttributes___block_invoke;
  v23[3] = &unk_1E3769E78;
  v10 = v9;
  v24 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC3014](v23);
  v22 = 0;
  objc_msgSend(a1, "_fileListingDetailsForPath:error:", v8, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  ((void (**)(_QWORD, const __CFString *, void *, id))v11)[2](v11, CFSTR("FILE LISTING DETAILS"), v12, v13);

  v21 = v13;
  objc_msgSend(a1, "_attributeDetailsForPath:ofFileSystem:error:", v8, 0, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;

  ((void (**)(_QWORD, const __CFString *, void *, id))v11)[2](v11, CFSTR("FILE ATTRIBUTE DETAILS"), v14, v15);
  if (v6)
  {
    v20 = v15;
    objc_msgSend(a1, "_attributeDetailsForPath:ofFileSystem:error:", v8, 1, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;

    ((void (**)(_QWORD, const __CFString *, void *, id))v11)[2](v11, CFSTR("FILE SYSTEM ATTRIBUTE DETAILS"), v16, v17);
    if (a5 && v16)
      *a5 = 1;

    v15 = v17;
  }
  v18 = v10;

  return v18;
}

+ (id)accessibleURLOrParentForFileURL:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = 100;
    while (1)
    {
      if (+[PLSandboxHelper processCanReadSandboxForPath:](PLSandboxHelper, "processCanReadSandboxForPath:", v4))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

        if (v7)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      objc_msgSend(v4, "stringByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "length"))
        break;
      v9 = objc_msgSend(v8, "isEqualToString:", v4);
      if (!v5)
        goto LABEL_12;
      v10 = v9;
      --v5;

      v4 = v8;
      if (v10)
        goto LABEL_11;
    }
    if (v5)
    {

LABEL_11:
      v11 = 0;
      v4 = v8;
      goto LABEL_16;
    }
LABEL_12:
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136446722;
      v16 = "+[PLFileUtilities accessibleURLOrParentForFileURL:]";
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_ERROR, "%{public}s failed after exceeding maximum parent directory attempts on %@ [at path %@]", (uint8_t *)&v15, 0x20u);

    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

+ (void)gatherDiagnosticInfoForURL:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  int v21;
  void *v22;
  char v23;

  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  if (PFOSVariantHasInternalDiagnostics())
  {
    v23 = 0;
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_diagnosticInfoForPath:includeFileSystemAttributes:resolvedFileSystemAttributes:", v8, 1, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10, v9);

    objc_msgSend(v6, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

      if ((v13 & 1) == 0)
      {
        LOBYTE(v14) = 1;
        v15 = -101;
        while (1)
        {
          objc_msgSend(v11, "stringByDeletingLastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v16, "length") || (objc_msgSend(v16, "isEqualToString:", v11) & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("File does not exist! No parent directory (%@)"), v16);
            goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nFile does not exist! Will attempt parent directory (%@)"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v11, v17);

          v14 = v14 & (v23 == 0);
          objc_msgSend(a1, "_diagnosticInfoForPath:includeFileSystemAttributes:resolvedFileSystemAttributes:", v16, v14, &v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, v16, v18);

          if (__CFADD__(v15++, 1))
            break;

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "fileExistsAtPath:", v16);

          v11 = v16;
          if (v21)
            goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Gave up after exceeding maximum parent directory attempts (%@)"), v16);
LABEL_12:
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v11, v22);

      }
    }
    v16 = v11;
LABEL_14:

  }
}

+ (void)logDiagnosticInfoForURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  const char *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  _QWORD v55[8];

  v55[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1, "redactedDescriptionForFileURL:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v6;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "--- BEGIN File diagnostics for %{public}@ ---", buf, 0xCu);

  }
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v52 = v8;
    _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "path: %@", buf, 0xCu);

  }
  v9 = *MEMORY[0x1E0C99D08];
  v10 = *MEMORY[0x1E0C99BE0];
  v55[0] = *MEMORY[0x1E0C99D08];
  v55[1] = v10;
  v11 = *MEMORY[0x1E0C99BF0];
  v55[2] = *MEMORY[0x1E0C99C10];
  v55[3] = v11;
  v55[4] = *MEMORY[0x1E0C99C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v4, "resourceValuesForKeys:error:", v12, &v49);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v49;
  if (v13)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v4;
      v53 = 2112;
      v54 = v13;
      _os_log_impl(&dword_199DF7000, v14, OS_LOG_TYPE_ERROR, "Error getting resource values for %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(a1, "defaultSystemLibraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0;
  objc_msgSend(v15, "resourceValuesForKeys:error:", v12, &v48);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v48;
  if (v17)
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v15;
      v53 = 2112;
      v54 = v17;
      _os_log_impl(&dword_199DF7000, v18, OS_LOG_TYPE_ERROR, "Error getting resource values for default SPL URL %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v43, "objectForKeyedSubscript:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v9);
  v20 = objc_claimAutoreleasedReturnValue();
  v41 = a1;
  v42 = v4;
  v37 = (void *)v20;
  v38 = v19;
  if (v19)
  {
    if (v20)
    {
      v21 = objc_msgSend(v19, "isEqual:", v20);
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (v21)
      {
        if (!v23)
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v24 = "URL is on the same volume as the default SPL URL";
      }
      else
      {
        if (!v23)
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v24 = "URL is NOT on the same volume as the default SPL URL";
      }
    }
    else
    {
      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v24 = "defaultSPLVolumeURL is nil";
    }
  }
  else
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v24 = "volumeURL is nil";
  }
  _os_log_impl(&dword_199DF7000, v22, OS_LOG_TYPE_ERROR, v24, buf, 2u);
LABEL_25:
  v39 = v16;
  v40 = v15;

  PLBackendGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v25, OS_LOG_TYPE_ERROR, "{", buf, 2u);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v26 = v12;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v45 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if ((objc_msgSend(v31, "isEqual:", v9) & 1) == 0)
        {
          PLBackendGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v43, "objectForKeyedSubscript:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v31;
            v53 = 2114;
            v54 = v33;
            _os_log_impl(&dword_199DF7000, v32, OS_LOG_TYPE_ERROR, "  %{public}@ = %{public}@", buf, 0x16u);

          }
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v28);
  }

  PLBackendGetLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199DF7000, v34, OS_LOG_TYPE_ERROR, "}", buf, 2u);
  }

  objc_msgSend(v41, "gatherDiagnosticInfoForURL:handler:", v42, &__block_literal_global_149);
  PLBackendGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v41, "redactedDescriptionForFileURL:", v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v36;
    _os_log_impl(&dword_199DF7000, v35, OS_LOG_TYPE_ERROR, "--- END File diagnostics for %{public}@ ---", buf, 0xCu);

  }
}

+ (BOOL)filePathIsSubpathOfSyncRoot:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  int *v7;
  int v8;
  NSObject *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  int v13;
  char *v14;
  NSObject *v15;
  void *v16;
  char *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  if (!v5)
    goto LABEL_17;
  v6 = v5;
  if (fsctl(v5, 0x40084A4AuLL, &v21, 0))
  {
    v7 = __error();
    v8 = *v7;
    if (*v7 != 25)
    {
      if (v8 == 2)
      {
        objc_msgSend(v4, "stringByDeletingLastPathComponent");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = -[NSObject length](v9, "length");
        if (v10 < objc_msgSend(v4, "length") && (unint64_t)-[NSObject length](v9, "length") > 1)
        {
          v11 = objc_msgSend(a1, "filePathIsSubpathOfSyncRoot:", v9);

          goto LABEL_18;
        }
      }
      else
      {
        v17 = strerror(*v7);
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(a1, "redactedDescriptionForPath:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v23 = v18;
          v24 = 1024;
          v25 = v8;
          v26 = 2082;
          v27 = v17;
          _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Get parent sync root failed for %{public}@ error %d %{public}s", buf, 0x1Cu);

        }
      }

    }
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  v12 = v21;
  if (!v21)
  {
    v20 = 0;
    if (!fsctl(v6, 0x40044A48uLL, &v20, 0))
    {
      v11 = v20 == 1;
      goto LABEL_18;
    }
    v13 = *__error();
    v14 = strerror(v13);
    PLBackendGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "redactedDescriptionForPath:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v16;
      v24 = 1024;
      v25 = v13;
      v26 = 2082;
      v27 = v14;
      _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "Get sync root flag failed for %{public}@ error %d %{public}s", buf, 0x1Cu);

    }
    v12 = v21;
  }
  v11 = v12 != 0;
LABEL_18:

  return v11;
}

+ (void)calculateTotalSizeOfFilesAtPath:(id)a3 calculatePurgeable:(BOOL)a4 allocatedSize:(BOOL)a5 result:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  void *v17;
  PLFilesystemIterator *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  double v66;
  id v67;
  _QWORD v68[3];

  v7 = a5;
  v8 = a4;
  v68[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a6;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4251;
  v43 = __Block_byref_object_dispose__4252;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)*MEMORY[0x1E0C99998];
  if (v7)
  {
    v13 = (id)*MEMORY[0x1E0C99AC0];

    v12 = v13;
  }
  if (v8)
  {
    v14 = *MEMORY[0x1E0C99A08];
    v68[0] = v12;
    v68[1] = v14;
    v15 = (id *)v68;
    v16 = 2;
  }
  else
  {
    v67 = v12;
    v15 = &v67;
    v16 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PLFilesystemIterator initWithFilePath:]([PLFilesystemIterator alloc], "initWithFilePath:", v9);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __91__PLFileUtilities_calculateTotalSizeOfFilesAtPath_calculatePurgeable_allocatedSize_result___block_invoke;
  v30 = &unk_1E3769EC0;
  v19 = v17;
  v31 = v19;
  v33 = &v39;
  v34 = &v57;
  v20 = v12;
  v32 = v20;
  v35 = &v53;
  v38 = v8;
  v36 = &v45;
  v37 = &v49;
  -[PLFilesystemIterator visitURLsLoadingPropertiesForKeys:withBlock:](v18, "visitURLsLoadingPropertiesForKeys:withBlock:", v19, &v27);
  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = v58[3];
    objc_msgSend(v11, "timeIntervalSinceNow", v27, v28, v29, v30, v31);
    *(_DWORD *)buf = 138412802;
    v62 = v9;
    v63 = 2048;
    v64 = v22;
    v65 = 2048;
    v66 = 0.0 - v23;
    _os_log_impl(&dword_199DF7000, v21, OS_LOG_TYPE_INFO, "calculateTotalSizeOfFilesAtPath:%@ %llu files took %.3f sec", buf, 0x20u);
  }

  -[PLFilesystemIterator error](v18, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

  }
  else if (!v40[5])
  {
    v10[2](v10, v58[3], v54[3], v50[3], v46[3], 0);
    goto LABEL_14;
  }
  -[PLFilesystemIterator error](v18, "error", v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (uint64_t)v25;
  if (!v25)
    v26 = v40[5];
  v10[2](v10, 0, 0, 0, 0, v26);

LABEL_14:
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

}

BOOL __91__PLFileUtilities_calculateTotalSizeOfFilesAtPath_calculatePurgeable_allocatedSize_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v12;

  v3 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  objc_msgSend(a2, "resourceValuesForKeys:error:", v3, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v12;
  if (v4)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedLongLongValue");

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v8;
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A08]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += v8;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
  }

  return v4 != 0;
}

void __43__PLFileUtilities_logDiagnosticInfoForURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v8;
          _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v5);
  }

}

uint64_t __99__PLFileUtilities__diagnosticInfoForPath_includeFileSystemAttributes_resolvedFileSystemAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "appendFormat:", CFSTR("%@:\n%@\n"), a2, a3);
  else
    return objc_msgSend(v4, "appendFormat:", CFSTR("%@: failed with error\n%@\n"), a2, a4);
}

uint64_t __63__PLFileUtilities__attributeDetailsForPath_ofFileSystem_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[%@] -> %@\n"), a2, a3);
}

void __52__PLFileUtilities_proxyLockFilePathForDatabasePath___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  NSTemporaryDirectory();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)proxyLockFilePathForDatabasePath__lockPath;
  proxyLockFilePathForDatabasePath__lockPath = v2;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    v10 = (void *)proxyLockFilePathForDatabasePath__lockPath;
    proxyLockFilePathForDatabasePath__lockPath = 0;

    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Unexpected process attempting to generate the  proxy lock file path";
      v8 = v6;
      v9 = 2;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if ((_xpc_runtime_is_app_sandboxed() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PLFileUtilities.m"), 253, CFSTR("%s is always expected to be sandboxed"), "assetsd");

  }
  objc_msgSend((id)proxyLockFilePathForDatabasePath__lockPath, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", CFSTR("com.apple.assetsd"));

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = CFSTR("com.apple.assetsd");
      v20 = 2114;
      v21 = proxyLockFilePathForDatabasePath__lockPath;
      v7 = "assetsd does not have expected sandbox identifier %{public}@: %{public}@";
      v8 = v6;
      v9 = 22;
LABEL_9:
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend((id)proxyLockFilePathForDatabasePath__lockPath, "stringByAppendingPathComponent:", CFSTR("sqliteplocks"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)proxyLockFilePathForDatabasePath__lockPath;
  proxyLockFilePathForDatabasePath__lockPath = v11;

  v16 = *MEMORY[0x1E0CB2AA8];
  v17 = &unk_1E378F3F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", proxyLockFilePathForDatabasePath__lockPath, 1, v13, 0);

}

@end
