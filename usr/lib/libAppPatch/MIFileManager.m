@implementation MIFileManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MIFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (id)defaultManager_defaultInstance;
}

void __31__MIFileManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultInstance;
  defaultManager_defaultInstance = (uint64_t)v0;

}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager removeItemAtURL:keepParent:error:](self, "removeItemAtURL:keepParent:error:", a3, 0, a4);
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  _removefile_state *v8;
  uint64_t v9;
  _removefile_state *v10;
  int *v11;
  int *v12;
  removefile_flags_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  int *v24;
  id v25;
  BOOL v26;
  uint64_t v28;
  int value;

  v6 = a4;
  v7 = a3;
  v8 = removefile_state_alloc();
  v10 = v8;
  value = 0;
  if (!v7)
  {
    v18 = (void *)*MEMORY[0x24BDD1128];
    v19 = CFSTR("nil url passed to -removeItemAtURL:error:");
    v20 = 109;
    v21 = 14;
LABEL_19:
    _CreateError((uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]", v20, v18, v21, 0, 0, v19, v9, v28);
    goto LABEL_20;
  }
  if (removefile_state_set(v8, 3u, _removefile_error_callback) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v11 = __error();
    strerror(*v11);
    MOLogWrite();
  }
  if (removefile_state_set(v10, 4u, &value) && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v12 = __error();
    strerror(*v12);
    MOLogWrite();
  }
  if (v6)
    v13 = 3;
  else
    v13 = 1;
  v14 = objc_retainAutorelease(v7);
  if (removefile((const char *)objc_msgSend(v14, "fileSystemRepresentation"), v10, v13) && *__error() != 2)
  {
    v22 = (void *)*MEMORY[0x24BDD1128];
    v23 = *__error();
    v24 = __error();
    v28 = (uint64_t)v14;
    strerror(*v24);
    v19 = CFSTR("removefile of %@ failed: %s");
    v20 = 130;
    v18 = v22;
    v21 = v23;
    goto LABEL_19;
  }
  v15 = value;
  if ((value & 0xFFFFFFFD) == 0)
  {
    removefile_state_free(v10);
    v25 = 0;
    v26 = 1;
    goto LABEL_24;
  }
  v16 = (void *)*MEMORY[0x24BDD1128];
  strerror(value);
  _CreateError((uint64_t)"-[MIFileManager removeItemAtURL:keepParent:error:]", 136, v16, v15, 0, 0, CFSTR("removefile of %@ failed: %s"), v17, (uint64_t)v14);
LABEL_20:
  v25 = (id)objc_claimAutoreleasedReturnValue();
  removefile_state_free(v10);
  if (a5)
  {
    v25 = objc_retainAutorelease(v25);
    v26 = 0;
    *a5 = v25;
  }
  else
  {
    v26 = 0;
  }
LABEL_24:

  return v26;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  uint64_t v8;
  _BOOL4 v10;
  id v11;
  const char *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  DIR *v20;
  DIR *v21;
  int v22;
  int v23;
  BOOL v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;

  v8 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = objc_retainAutorelease(a3);
  v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  if (v10)
  {
    v13 = mkpath_np(v12, a5);
    if (v13)
    {
      v14 = v13;
      if (v13 != 17)
      {
        v15 = (void *)*MEMORY[0x24BDD1128];
        objc_msgSend(v11, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v14);
        _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 159, v15, v14, 0, 0, CFSTR("mkpath_np of %@ failed: %s"), v17, (uint64_t)v16);
        v18 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
  }
  else if (mkdir(v12, a5) && *__error() != 17)
  {
    v30 = (void *)*MEMORY[0x24BDD1128];
    v31 = *__error();
    objc_msgSend(v11, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = __error();
    strerror(*v33);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 165, v30, v31, 0, 0, CFSTR("mkdir of %@ failed: %s"), v34, (uint64_t)v32);
LABEL_14:
    v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    v24 = 0;
    if (!a7)
      goto LABEL_21;
    goto LABEL_19;
  }
  if ((_DWORD)v8 == -1)
  {
    v18 = 0;
    v24 = 1;
    goto LABEL_21;
  }
  v19 = objc_retainAutorelease(v11);
  v20 = opendir((const char *)objc_msgSend(v19, "fileSystemRepresentation"));
  if (!v20)
  {
    v35 = (void *)*MEMORY[0x24BDD1128];
    v36 = *__error();
    objc_msgSend(v19, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = __error();
    strerror(*v37);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 175, v35, v36, 0, 0, CFSTR("opendir of %@ failed: %s"), v38, (uint64_t)v32);
    goto LABEL_14;
  }
  v21 = v20;
  v22 = dirfd(v20);
  v23 = fcntl(v22, 64, v8);
  v24 = v23 == 0;
  if (v23)
  {
    v25 = (void *)*MEMORY[0x24BDD1128];
    v26 = *__error();
    objc_msgSend(v19, "path");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = __error();
    strerror(*v28);
    _CreateError((uint64_t)"-[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:]", 181, v25, v26, 0, 0, CFSTR("Failed to setclass(%d) on directory %@: %s"), v29, v8);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  closedir(v21);
  if (a7)
  {
LABEL_19:
    if (!v24)
    {
      v18 = objc_retainAutorelease(v18);
      v24 = 0;
      *a7 = v18;
    }
  }
LABEL_21:

  return v24;
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return -[MIFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", a3, a4, a5, 0xFFFFFFFFLL, a6);
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 alwaysClone:(BOOL)a6 ignoreErrors:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  copyfile_flags_t v24;
  _copyfile_state *v25;
  id v26;
  const char *v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v39;
  void *v40;
  stat v41;
  stat v42;

  v9 = a7;
  v10 = a6;
  v13 = a3;
  v14 = a4;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setIgnoreErrors:", v9);
  objc_msgSend(v15, "setError:", 0);
  if (a5
    || (memset(&v42, 0, sizeof(v42)),
        v16 = objc_retainAutorelease(v13),
        !lstat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v42)))
  {
    memset(&v41, 0, sizeof(v41));
    v20 = objc_retainAutorelease(v14);
    if (lstat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v41) || (v41.st_mode & 0xF000) != 0x4000)
    {
      if (v10)
        v24 = 34373647;
      else
        v24 = 17596431;
      v25 = copyfile_state_alloc();
      copyfile_state_set(v25, 6u, _CopyfileStatusCallback);
      copyfile_state_set(v25, 7u, v15);
      v26 = objc_retainAutorelease(v13);
      v27 = (const char *)objc_msgSend(v26, "fileSystemRepresentation");
      v28 = objc_retainAutorelease(v20);
      v29 = copyfile(v27, (const char *)objc_msgSend(v28, "fileSystemRepresentation"), v25, v24);
      v18 = v29 == 0;
      if (v29)
      {
        objc_msgSend(v15, "error");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v19 = v30;
        }
        else
        {
          v35 = *__error();
          v40 = (void *)*MEMORY[0x24BDD1128];
          objc_msgSend(v26, "path");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "path");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          strerror(v35);
          _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 334, v40, v35, 0, 0, CFSTR("copyfile of %@ to %@ failed: %s"), v37, (uint64_t)v36);
          v19 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (!v25)
          goto LABEL_20;
      }
      else
      {
        v19 = 0;
        if (!v25)
          goto LABEL_20;
      }
      copyfile_state_free(v25);
    }
    else
    {
      v21 = (void *)*MEMORY[0x24BDD1128];
      objc_msgSend(v20, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 300, v21, 17, 0, 0, CFSTR("Destination %@ exists and is a directory"), v23, (uint64_t)v22);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
    }
  }
  else
  {
    v17 = *__error();
    v18 = v17 == 2;
    if ((_DWORD)v17 == 2)
    {
      v19 = 0;
    }
    else
    {
      v32 = (void *)*MEMORY[0x24BDD1128];
      objc_msgSend(v16, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v17);
      _CreateError((uint64_t)"-[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:]", 289, v32, v17, 0, 0, CFSTR("stat of %@ failed: %s"), v34, (uint64_t)v33);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_20:
  if (a8 && !v18)
    *a8 = objc_retainAutorelease(v19);

  return v18;
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  const std::__fs::filesystem::path *v13;
  id v14;
  std::error_code *v15;
  const std::__fs::filesystem::path *v16;
  int *v17;
  uint64_t v18;
  _BOOL4 v19;
  void *v20;
  int v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  id v32;
  BOOL v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const std::__fs::filesystem::path *v40;
  const std::__fs::filesystem::path *v41;
  id v42;
  id v43;
  stat v44;

  v10 = a3;
  v11 = a4;
  v12 = objc_retainAutorelease(v10);
  v13 = (const std::__fs::filesystem::path *)objc_msgSend(v12, "fileSystemRepresentation");
  v14 = objc_retainAutorelease(v11);
  v16 = (const std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation");
  if (!a5)
  {
    memset(&v44, 0, sizeof(v44));
    if (lstat((const char *)v13, &v44))
    {
      v17 = __error();
      v18 = *v17;
      LOBYTE(v19) = v18 == 2;
      if ((_DWORD)v18 == 2)
      {
        v20 = 0;
        if (!a6)
          goto LABEL_28;
LABEL_25:
        if (!v19)
        {
          v34 = objc_retainAutorelease(v20);
          LOBYTE(v19) = 0;
          *a6 = v34;
          goto LABEL_29;
        }
LABEL_28:
        v34 = v20;
        goto LABEL_29;
      }
      v35 = (void *)*MEMORY[0x24BDD1128];
      strerror(*v17);
      _CreateError((uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 368, v35, v18, 0, 0, CFSTR("stat of %s failed: %s"), v36, (uint64_t)v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  rename(v13, v16, v15);
  if (v21)
  {
    v22 = __error();
    v23 = *v22;
    if ((_DWORD)v23 != 30)
    {
      if ((_DWORD)v23 != 18)
      {
        v37 = (void *)*MEMORY[0x24BDD1128];
        strerror(*v22);
        _CreateError((uint64_t)"-[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 388, v37, v23, 0, 0, CFSTR("rename of %s to %s failed: %s"), v38, (uint64_t)v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v19) = 0;
        if (!a6)
          goto LABEL_28;
        goto LABEL_25;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:].cold.1((uint64_t)v13, (uint64_t)v16, v24, v25, v26, v27, v28, v29);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v40 = v13;
        v41 = v16;
        MOLogWrite();
      }
    }
    objc_msgSend(v12, "path", v40, v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "containsString:", CFSTR("/System/Library/AppPlaceholders"));

    v43 = 0;
    v19 = -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:", v12, v14, 1, 0, 0, &v43);
    v32 = v43;
    v20 = v32;
    if (!v19 || (_DWORD)v23 == 30 || (v31 & 1) != 0)
    {
LABEL_24:
      if (!a6)
        goto LABEL_28;
      goto LABEL_25;
    }
    v42 = v32;
    v33 = -[MIFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v12, &v42);
    v34 = v42;

    if (!v33 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      MOLogWrite();
  }
  else
  {
    v34 = 0;
  }
  LOBYTE(v19) = 1;
LABEL_29:

  return v19;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 alwaysClone:(BOOL)a5 error:(id *)a6
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:", a3, a4, 0, a5, 0, a6);
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:", a3, a4, 0, 0, 0, a5);
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 0, a5);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:", a3, a4, 1, 0, 0, a5);
}

- (BOOL)copyItemIgnoringErrorsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:alwaysClone:ignoreErrors:error:", a3, a4, 1, 0, 1, a5);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[MIFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 1, a5);
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("temp.XXXXXX"), 1);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = strdup((const char *)objc_msgSend(v5, "fileSystemRepresentation"));
  if (mkdtemp(v6))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("PathArgument");
    v14[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager createTemporaryDirectoryInDirectoryURL:error:]", 452, CFSTR("MIInstallerErrorDomain"), 4, v8, v9, CFSTR("Failed to create temp dir at path %s"), v10, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v11);
    free(v6);

    v7 = 0;
  }

  return v7;
}

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  acl_t v8;
  acl_t v9;
  DIR *v10;
  DIR *v11;
  void *v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  int *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  int *v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v6 = a4;
  v8 = acl_init(0);
  if (v8)
  {
    v9 = v8;
    if (v6)
    {
      v10 = opendir(a3);
      if (v10)
      {
        v11 = v10;
        if (dirfd(v10) < 0)
        {
          v48 = (void *)*MEMORY[0x24BDD1128];
          v49 = *__error();
          v50 = __error();
          strerror(*v50);
          _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 485, v48, v49, 0, 0, CFSTR("dirfd of %s failed: %s"), v51, (uint64_t)a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 485;
        }
        else
        {
          if (!MEMORY[0x22767FBB0]())
          {
            v26 = 0;
            v27 = 1;
            goto LABEL_20;
          }
          v12 = (void *)*MEMORY[0x24BDD1128];
          v13 = *__error();
          v14 = __error();
          strerror(*v14);
          _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 490, v12, v13, 0, 0, CFSTR("Failed to set ACL on dir %s: %s"), v15, (uint64_t)a3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 490;
        }
        _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", v18, CFSTR("MIInstallerErrorDomain"), 4, v17, 0, CFSTR("Failed to remove ACL"), v16, v53);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0;
LABEL_20:
        closedir(v11);
        goto LABEL_21;
      }
      v37 = (void *)*MEMORY[0x24BDD1128];
      v38 = *__error();
      v39 = __error();
      strerror(*v39);
      _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 479, v37, v38, 0, 0, CFSTR("opendir of %s failed: %s"), v40, (uint64_t)a3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 479;
    }
    else
    {
      v28 = open(a3, 2097154);
      if ((v28 & 0x80000000) == 0)
      {
        v29 = v28;
        v30 = MEMORY[0x22767FBB0]();
        v27 = v30 == 0;
        if (v30)
        {
          v31 = (void *)*MEMORY[0x24BDD1128];
          v32 = *__error();
          v33 = __error();
          strerror(*v33);
          _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 501, v31, v32, 0, 0, CFSTR("Failed to set ACL on %s: %s"), v34, (uint64_t)a3);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 501, CFSTR("MIInstallerErrorDomain"), 4, v35, 0, CFSTR("Failed to remove ACL"), v36, v55);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = 0;
        }
        close(v29);
LABEL_21:
        acl_free(v9);
        if (!a5)
          goto LABEL_24;
        goto LABEL_22;
      }
      v44 = (void *)*MEMORY[0x24BDD1128];
      v45 = *__error();
      v46 = __error();
      strerror(*v46);
      _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 496, v44, v45, 0, 0, CFSTR("open of %s failed: %s"), v47, (uint64_t)a3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 496;
    }
    _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", v43, CFSTR("MIInstallerErrorDomain"), 4, v42, 0, CFSTR("Failed to remove ACL"), v41, v56);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    goto LABEL_21;
  }
  v19 = (void *)*MEMORY[0x24BDD1128];
  v20 = *__error();
  v21 = __error();
  v22 = strerror(*v21);
  _CreateError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 472, v19, v20, 0, 0, CFSTR("acl_init() failed: %s"), v23, (uint64_t)v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIFileManager _removeACLAtPath:isDir:error:]", 472, CFSTR("MIInstallerErrorDomain"), 4, v24, 0, CFSTR("Failed to remove ACL"), v25, v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  if (!a5)
    goto LABEL_24;
LABEL_22:
  if (!v27)
    *a5 = objc_retainAutorelease(v26);
LABEL_24:

  return v27;
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 withOpenFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:](self, "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
}

- (BOOL)bulkSetPropertiesForPath:(const char *)a3 UID:(unsigned int)a4 GID:(unsigned int)a5 mode:(unsigned __int16)a6 flags:(unsigned int)a7 dataProtectionClass:(int)a8 removeACL:(BOOL)a9 error:(id *)a10
{
  return -[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:](self, "_bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", a3, 0xFFFFFFFFLL, *(_QWORD *)&a4, *(_QWORD *)&a5, a6, *(_QWORD *)&a7);
}

- (BOOL)_bulkSetPropertiesForPath:(const char *)a3 existingFD:(int)a4 UID:(unsigned int)a5 GID:(unsigned int)a6 mode:(unsigned __int16)a7 flags:(unsigned int)a8 dataProtectionClass:(int)a9 removeACL:(BOOL)a10 error:(id *)a11
{
  ssize_t v15;
  uint64_t v16;
  unsigned int *v17;
  size_t v18;
  uint64_t v19;
  int v20;
  unsigned int *v21;
  int *v22;
  int v23;
  unsigned int *v24;
  ssize_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  BOOL v30;
  _BYTE v32[12];
  int v33;
  const char *v34;
  _BYTE *v35;
  _QWORD v36[4];

  v33 = a4;
  v34 = a3;
  v36[3] = *MEMORY[0x24BDAC8D0];
  v36[0] = 5;
  v36[1] = 0;
  v36[2] = 0;
  v15 = acl_size((acl_t)1);
  v35 = v32;
  v16 = v15 + 28;
  if (!a10)
    v16 = 28;
  v17 = (unsigned int *)&v32[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = 12;
  if (a9 == -1)
    v19 = 8;
  else
    v19 = 12;
  if (geteuid())
  {
    v20 = 0;
    v21 = v17;
  }
  else
  {
    *v17 = a5;
    v21 = v17 + 1;
    v20 = 0x8000;
    v18 = 16;
  }
  *v21 = a6;
  v21[1] = a7 & 0xFFF;
  v21[2] = a8;
  v22 = (int *)(v21 + 3);
  v23 = v20 | 0x70000;
  HIDWORD(v36[0]) = v20 | 0x70000;
  if (a10)
  {
    *(_QWORD *)(v21 + 3) = v19;
    v18 += 8;
    v24 = v21 + 3;
    v22 = (int *)(v21 + 5);
    v23 = v20 | 0x470000;
    HIDWORD(v36[0]) = v20 | 0x470000;
  }
  else
  {
    v24 = 0;
  }
  if (a9 != -1)
  {
    *v22++ = a9;
    v18 += 4;
    HIDWORD(v36[0]) = v23 | 0x40000000;
  }
  if (a10)
  {
    v25 = acl_copy_ext_native(v22, (acl_t)1, v15);
    if (v25 > v15)
    {
      _CreateAndLogError((uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]", 632, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("acl_copy_ext_native returned size %zd which was more than we had allocated (%zd)"), v26, v25);
      goto LABEL_21;
    }
    v24[1] = v25;
    v18 += v25;
  }
  if (v33 < 0)
  {
    if (setattrlist(v34, v36, v17, v18, 1u))
      goto LABEL_20;
LABEL_24:
    v29 = 0;
    v30 = 1;
    goto LABEL_26;
  }
  if (!fsetattrlist(v33, v36, v17, v18, 0))
    goto LABEL_24;
LABEL_20:
  v27 = *__error();
  _CreateAndLogError((uint64_t)"-[MIFileManager _bulkSetPropertiesForPath:existingFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:]", 651, (void *)*MEMORY[0x24BDD1128], v27, 0, 0, CFSTR("setattrlist failed for file %s"), v28, (uint64_t)v34);
LABEL_21:
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (a11)
  {
    v29 = objc_retainAutorelease(v29);
    v30 = 0;
    *a11 = v29;
  }
  else
  {
    v30 = 0;
  }
LABEL_26:

  return v30;
}

- (BOOL)stageURLByMoving:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 settingUID:(unsigned int)a6 gid:(unsigned int)a7 dataProtectionClass:(int)a8 breakHardlinks:(BOOL)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  int v25;
  id v26;
  int v27;
  uint64_t v28;
  id v29;
  BOOL v30;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[5];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  BOOL v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = 0;
  objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v18, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_opt_new();
  v44 = 0;
  LOBYTE(a5) = -[MIFileManager moveItemAtURL:toURL:error:](self, "moveItemAtURL:toURL:error:", v17, v20, &v44);
  v32 = v17;
  v22 = v44;
  if ((a5 & 1) == 0)
  {
LABEL_9:
    if (a11)
    {
      if (v22)
      {
        v29 = objc_retainAutorelease(v22);
        v22 = v29;
      }
      else
      {
        v29 = objc_retainAutorelease((id)v46[5]);
      }
      v30 = 0;
      *a11 = v29;
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_15;
  }
  v23 = objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
  v43 = v22;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke;
  v34[3] = &unk_24EBCEB80;
  v34[4] = self;
  v35 = v19;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a9;
  v24 = v21;
  v36 = v24;
  v37 = &v45;
  v38 = &v51;
  v25 = TraverseDirectory(v23, 0, 0x88u, &v43, v34);
  v26 = v43;

  if (v26)
    v27 = 0;
  else
    v27 = v25;
  if (v27 != 1)
  {

    v22 = v26;
    goto LABEL_9;
  }
  v28 = v46[5];

  if (v28
    || objc_msgSend(v24, "count")
    && (v33[0] = MEMORY[0x24BDAC760],
        v33[1] = 3221225472,
        v33[2] = __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2,
        v33[3] = &unk_24EBCEBA8,
        v33[4] = self,
        v33[5] = &v45,
        objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v33),
        v46[5]))
  {
    v22 = 0;
    goto LABEL_9;
  }
  v22 = 0;
  if (a10)
    *a10 = *((_BYTE *)v52 + 24);
  v30 = 1;
LABEL_15:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v30;
}

uint64_t __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  id v30;
  int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  const char *v48;
  int v49;
  unsigned int v50;
  char v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  unsigned __int8 v56;

  v4 = *(void **)(a1 + 40);
  v5 = *(unsigned int *)(a1 + 72);
  v50 = *(_DWORD *)(a1 + 76);
  v6 = *(_DWORD *)(a1 + 80);
  v7 = *(unsigned __int8 *)(a1 + 84);
  v8 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 32);
  v10 = v4;
  v11 = v8;
  v56 = 0;
  v12 = *(_DWORD *)(a2 + 56);
  v13 = *(const char **)(a2 + 16);
  v52 = v11;
  v53 = v10;
  if (v12 != 1)
  {
    if (v12 == 2)
    {
      v14 = 0;
      v17 = 0xFFFFFFFFLL;
      v23 = 493;
    }
    else
    {
      if (v12 == 5)
      {
        v14 = 1;
        v56 = 1;
      }
      else
      {
        v14 = 0;
      }
      v17 = 0xFFFFFFFFLL;
      v23 = 420;
    }
    goto LABEL_18;
  }
  v15 = v11;
  v16 = open(v13, 256);
  v17 = v16;
  if ((v16 & 0x80000000) != 0)
  {
    v32 = *__error();
    v33 = (void *)*MEMORY[0x24BDD1128];
    v34 = v32;
    strerror(v32);
    _CreateAndLogError((uint64_t)"_StageURLByMovingProcessItem", 705, v33, v34, 0, 0, CFSTR("Failed to open %s : %s"), v35, (uint64_t)v13);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    goto LABEL_27;
  }
  v49 = *(_DWORD *)(a2 + 76);
  LODWORD(v55) = 0;
  v18 = (const char *)ffsctl(v16, 0xC0044115uLL, &v55, 0);
  if ((_DWORD)v18)
  {
    v19 = v18;
    if (*__error() != 16)
    {
      v20 = __error();
      v21 = *v20;
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v47 = strerror(*v20);
        v48 = v13;
        v44 = v19;
        v46 = v21;
        MOLogWrite();
      }
    }
    v22 = gLogHandle;
    if (v49 == 1)
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        v44 = v13;
LABEL_40:
        MOLogWrite();
        goto LABEL_41;
      }
      goto LABEL_41;
    }
  }
  else
  {
    v14 = 0;
    v23 = 420;
    if (!v7 || v49 == 1)
    {
LABEL_18:
      if ((*(_BYTE *)(a2 + 48) & 0x20) != 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          HIDWORD(v44) = HIDWORD(v13);
          MOLogWrite();
        }
        v24 = 32;
      }
      else
      {
        v24 = 0;
      }
      v55 = 0;
      v25 = 1;
      BYTE4(v44) = 1;
      LODWORD(v44) = v6;
      v26 = v9;
      v27 = objc_msgSend(v9, "bulkSetPropertiesForPath:withOpenFD:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", v13, v17, v5, v50, v23, v24, v44, &v55);
      v28 = v55;
      if ((v27 & 1) != 0)
      {
        v29 = 0;
        v15 = v52;
        goto LABEL_28;
      }
      v15 = v52;
LABEL_27:
      v28 = objc_retainAutorelease(v28);
      v25 = 0;
      v14 = v56;
      v29 = v28;
LABEL_28:
      if ((v17 & 0x80000000) != 0)
        goto LABEL_30;
      goto LABEL_29;
    }
    v22 = gLogHandle;
    v10 = v53;
  }
  if (!v22 || *(int *)(v22 + 44) >= 5)
  {
    v44 = v13;
    goto LABEL_40;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v13, 0, 0, v44, v46, v47, v48);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  objc_msgSend(v9, "createTemporaryDirectoryInDirectoryURL:error:", v10, &v55);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v55;
  v39 = v38;
  if (!v37)
  {
    v41 = v36;
    v28 = v38;
    v26 = v9;
    goto LABEL_45;
  }
  objc_msgSend(v36, "lastPathComponent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v39;
  LODWORD(v45) = v6;
  v51 = objc_msgSend(v9, "_stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:", v36, v40, v37, 2, v5, v50, v45, &v56, &v54);
  v41 = v36;
  v28 = v54;

  v26 = v9;
  if ((v51 & 1) == 0)
  {
LABEL_45:
    v15 = v52;

    goto LABEL_27;
  }
  objc_msgSend(v41, "lastPathComponent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "URLByAppendingPathComponent:isDirectory:", v42, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v52;
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v41, v43);

  v29 = 0;
  v14 = v56;
  v25 = 1;
LABEL_29:
  close(v17);
LABEL_30:

  v30 = v29;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v29);
  if (v14)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  return v25;
}

void __125__MIFileManager_stageURLByMoving_toItemName_inStagingDir_settingUID_gid_dataProtectionClass_breakHardlinks_hasSymlink_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = *(void **)(a1 + 32);
  v21 = 0;
  v9 = a2;
  LOBYTE(v8) = objc_msgSend(v8, "moveItemAtURL:toURL:error:", v9, v7, &v21);
  v10 = v21;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

    if (rmdir(v13))
    {
      v14 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        strerror(v14);
        MOLogWrite();
      }
    }
  }
  else
  {
    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:]_block_invoke_2", 810, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to move clone replaced file from %@ to %@"), v16, (uint64_t)v15);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    *a4 = 1;
  }

}

- (BOOL)_stageURLByCopying:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 dataProtectionClass:(int)a9 hasSymlink:(BOOL *)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  id v28;
  BOOL v29;
  _QWORD v31[6];
  _QWORD v32[11];
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  id v37;
  _QWORD v38[4];
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _BYTE v53[1024];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v18, 0);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "fileSystemRepresentation");
  v21 = __strlcpy_chk();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = v21;
  if (v21 < 0x400)
  {
    v25 = objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation");
    v37 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke;
    v32[3] = &unk_24EBCEBD0;
    v32[6] = v38;
    v32[7] = &v43;
    v32[8] = v39;
    v32[9] = &v49;
    v32[10] = v53;
    v32[4] = self;
    v32[5] = v41;
    v33 = a6;
    v34 = a7;
    v35 = a8;
    v36 = a9;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2;
    v31[3] = &unk_24EBCEBF8;
    v31[4] = v38;
    v31[5] = v53;
    v26 = TraverseDirectoryWithPostTraversal(v25, 0, 8u, &v37, v32, v31);
    v27 = (unint64_t)v37;
    v24 = (void *)v27;
    if (v26 && !(v44[5] | v27))
    {
      v24 = 0;
      *a10 = *((_BYTE *)v50 + 24);
      v29 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    v22 = objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]", 912, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Staging destination path was too long: %s (%zu)"), v23, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a11)
  {
    if (v24)
    {
      v28 = objc_retainAutorelease(v24);
      v24 = v28;
    }
    else
    {
      v28 = objc_retainAutorelease((id)v44[5]);
      v24 = 0;
    }
    v29 = 0;
    *a11 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_11:
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v29;
}

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t *v28;
  int *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  ssize_t v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  unsigned __int16 v90;
  uint64_t v91;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  char v99[1024];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v10 = *(const char **)(a2 + 32);
  if ((*(_BYTE *)(a2 + 48) & 0x20) != 0 && *(_DWORD *)(a2 + 56) == 1 && (*(_DWORD *)(a1 + 88) & 0xFFFFFFFE) == 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v97 = *(_QWORD *)(a2 + 16);
      MOLogWrite();
    }
    v11 = 32;
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v12 + 24))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = strlen(v10);
    v15 = *(_QWORD *)(v13 + 24);
    v16 = v15 + 1 + v14;
    if (v16 <= 0x3FF)
    {
      v17 = *(_QWORD *)(a1 + 80);
      *(_BYTE *)(v17 + v15) = 47;
      memcpy((void *)(v17 + v15 + 1), v10, v14);
      *(_BYTE *)(v17 + v16) = 0;
      *(_QWORD *)(v13 + 24) = v16;
    }
  }
  else
  {
    *(_BYTE *)(v12 + 24) = 1;
  }
  v18 = *(_DWORD *)(a2 + 56);
  if (v18 == 1)
  {
    v27 = *(_DWORD *)(a1 + 88);
    switch(v27)
    {
      case 1:
        if (copyfile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 0, 0xC0008u))
        {
          v63 = *__error();
          v64 = (void *)*MEMORY[0x24BDD1128];
          v65 = v63;
          v66 = *(_QWORD *)(a2 + 16);
          strerror(v63);
          _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 992, v64, v65, 0, 0, CFSTR("copyfile failed for %s to %s: %s"), v67, v66);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 992, CFSTR("MIInstallerErrorDomain"), 4, v61, &unk_24EBD2C28, CFSTR("Failed to copyfile %s to %s"), v68, *(_QWORD *)(a2 + 16));
          goto LABEL_43;
        }
        break;
      case 3:
        if (link(*(const char **)(a2 + 16), *(const char **)(a1 + 80)))
        {
          v69 = *__error();
          v70 = (void *)*MEMORY[0x24BDD1128];
          v71 = v69;
          v72 = *(_QWORD *)(a2 + 16);
          strerror(v69);
          _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1002, v70, v71, 0, 0, CFSTR("link failed for %s to %s: %s"), v73, v72);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1002, CFSTR("MIInstallerErrorDomain"), 4, v61, &unk_24EBD2C50, CFSTR("Failed to link %s to %s"), v74, *(_QWORD *)(a2 + 16));
          goto LABEL_43;
        }
        break;
      case 2:
        v28 = (uint64_t *)(a2 + 16);
        if (clonefile(*(const char **)(a2 + 16), *(const char **)(a1 + 80), 3u))
        {
          v29 = __error();
          v30 = *v29;
          if ((_DWORD)v30 != 18)
          {
            v93 = (void *)*MEMORY[0x24BDD1128];
            v94 = *v28;
            strerror(*v29);
            _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 981, v93, v30, 0, 0, CFSTR("clonefile failed for %s to %s: %s"), v95, v94);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 981, CFSTR("MIInstallerErrorDomain"), 4, v25, &unk_24EBD2C00, CFSTR("Failed to clonefile %s to %s"), v96, *v28);
            goto LABEL_35;
          }
          if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
              __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1(a2 + 16, a1 + 80, v31, v32, v33, v34, v35, v36);
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v97 = *v28;
              MOLogWrite();
            }
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          }
          if (copyfile((const char *)*v28, *(const char **)(a1 + 80), 0, 0xC0008u))
          {
            v37 = *__error();
            v38 = (void *)*MEMORY[0x24BDD1128];
            v39 = v37;
            v40 = *v28;
            strerror(v37);
            _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 977, v38, v39, 0, 0, CFSTR("copyfile after clonefile failed for %s to %s: %s"), v41, v40);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 977, CFSTR("MIInstallerErrorDomain"), 4, v25, &unk_24EBD2BD8, CFSTR("Failed to copyfile %s to %s"), v42, *v28);
            goto LABEL_35;
          }
        }
        break;
      default:
        _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1009, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unexpected staging mode: %d"), a8, *(unsigned int *)(a1 + 88));
        goto LABEL_37;
    }
LABEL_47:
    v19 = 420;
    goto LABEL_48;
  }
  if (v18 == 5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v43 = readlink(*(const char **)(a2 + 16), v99, 0x400uLL);
    if (v43 != -1)
    {
      v99[v43] = 0;
      if (symlink(v99, *(const char **)(a1 + 80)))
      {
        v44 = *__error();
        v45 = (void *)*MEMORY[0x24BDD1128];
        v46 = v44;
        v47 = *(_QWORD *)(a1 + 80);
        strerror(v44);
        _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1032, v45, v46, 0, 0, CFSTR("symlink failed for %s -> %s: %s"), v48, v47);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1032, CFSTR("MIInstallerErrorDomain"), 4, v25, &unk_24EBD2CA0, CFSTR("Failed to symlink %s -> %s"), v49, *(_QWORD *)(a1 + 80));
        goto LABEL_35;
      }
      goto LABEL_47;
    }
    v56 = *__error();
    v57 = (void *)*MEMORY[0x24BDD1128];
    v58 = v56;
    v59 = *(_QWORD *)(a2 + 16);
    strerror(v56);
    _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1022, v57, v58, 0, 0, CFSTR("readlink failed for %s: %s"), v60, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1022, CFSTR("MIInstallerErrorDomain"), 4, v61, &unk_24EBD2C78, CFSTR("Failed to readlink %s"), v62, *(_QWORD *)(a2 + 16));
LABEL_43:
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v77 = *(void **)(v76 + 40);
    *(_QWORD *)(v76 + 40) = v75;

    goto LABEL_44;
  }
  if (v18 != 2)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 1038, CFSTR("MIInstallerErrorDomain"), 3, 0, &unk_24EBD2CC8, CFSTR("Unknown filesystem object type %u encountered at %s"), a8, *(unsigned int *)(a2 + 56));
LABEL_37:
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v53;

    goto LABEL_44;
  }
  v19 = 493;
  if (mkdir(*(const char **)(a1 + 80), 0x1EDu))
  {
    v20 = *__error();
    v21 = (void *)*MEMORY[0x24BDD1128];
    v22 = v20;
    v23 = *(_QWORD *)(a1 + 80);
    strerror(v20);
    _CreateError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 951, v21, v22, 0, 0, CFSTR("mkdir failed for %s: %s"), v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:]_block_invoke", 951, CFSTR("MIInstallerErrorDomain"), 4, v25, &unk_24EBD2BB0, CFSTR("Failed to mkdir %s"), v26, *(_QWORD *)(a1 + 80));
LABEL_35:
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v52 = *(void **)(v51 + 40);
    *(_QWORD *)(v51 + 40) = v50;

LABEL_44:
    v78 = 0;
LABEL_45:
    v79 = 0;
    goto LABEL_46;
  }
LABEL_48:
  v81 = *(void **)(a1 + 32);
  v82 = *(_QWORD *)(a1 + 80);
  v83 = *(unsigned int *)(a1 + 92);
  v84 = *(unsigned int *)(a1 + 96);
  v85 = *(unsigned int *)(a1 + 100);
  v98 = 0;
  LOBYTE(v97) = 1;
  v86 = objc_msgSend(v81, "bulkSetPropertiesForPath:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", v82, v83, v84, v19, v11, v85, v97, &v98);
  v87 = v98;
  v78 = v98;
  if ((v86 & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v87);
    goto LABEL_45;
  }
  if (*(_DWORD *)(a2 + 56) != 2)
  {
    v88 = *(_QWORD *)(a1 + 80);
    v89 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v90 = *(_WORD *)(v89 + 24);
    if (v90)
    {
      do
        v91 = --v90;
      while (*(_BYTE *)(v88 + v90) != 47 && v90 != 0);
    }
    else
    {
      v91 = 0;
    }
    *(_BYTE *)(v88 + v91) = 0;
    *(_QWORD *)(v89 + 24) = v91;
  }
  v79 = 1;
LABEL_46:

  return v79;
}

uint64_t __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int16 v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_WORD *)(v2 + 24);
  if (v3)
  {
    do
      v4 = --v3;
    while (*(_BYTE *)(v1 + v3) != 47 && v3 != 0);
  }
  else
  {
    v4 = 0;
  }
  *(_BYTE *)(v1 + v4) = 0;
  *(_QWORD *)(v2 + 24) = v4;
  return 1;
}

- (BOOL)stageURL:(id)a3 toItemName:(id)a4 inStagingDir:(id)a5 stagingMode:(int)a6 settingUID:(unsigned int)a7 gid:(unsigned int)a8 hasSymlink:(BOOL *)a9 error:(id *)a10
{
  uint64_t v11;

  if (a6)
  {
    LODWORD(v11) = 4;
    return -[MIFileManager _stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:](self, "_stageURLByCopying:toItemName:inStagingDir:stagingMode:settingUID:gid:dataProtectionClass:hasSymlink:error:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v11, a9, a10);
  }
  else
  {
    LOBYTE(v11) = 1;
    return -[MIFileManager stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:](self, "stageURLByMoving:toItemName:inStagingDir:settingUID:gid:dataProtectionClass:breakHardlinks:hasSymlink:error:", a3, a4, a5, *(_QWORD *)&a7, *(_QWORD *)&a8, 4, v11, a9, a10);
  }
}

- (BOOL)standardizeOwnershipAtURL:(id)a3 toUID:(unsigned int)a4 GID:(unsigned int)a5 removeACLs:(BOOL)a6 setProtectionClass:(BOOL)a7 foundSymlink:(BOOL *)a8 error:(id *)a9
{
  id v15;
  uint64_t v16;
  char v17;
  id v18;
  id v19;
  id *v20;
  id v21;
  _QWORD v23[7];
  unsigned int v24;
  unsigned int v25;
  BOOL v26;
  BOOL v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v33 = 0;
  v34 = (id *)&v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v15 = objc_retainAutorelease(a3);
  v16 = objc_msgSend(v15, "fileSystemRepresentation");
  v28 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke;
  v23[3] = &unk_24EBCEC20;
  v26 = a7;
  v23[4] = self;
  v23[5] = &v29;
  v24 = a4;
  v25 = a5;
  v27 = a6;
  v23[6] = &v33;
  v17 = TraverseDirectory(v16, 0, 8u, &v28, v23);
  v18 = v28;
  v19 = v28;
  v20 = v34;
  if ((v17 & 1) == 0 && !v34[5])
  {
    objc_storeStrong(v34 + 5, v18);
    v20 = v34;
  }
  v21 = v20[5];
  if (v21)
    v17 = 0;
  if (a9 && (v17 & 1) == 0)
    *a9 = objc_retainAutorelease(v21);
  if (a8)
    *a8 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

uint64_t __102__MIFileManager_standardizeOwnershipAtURL_toUID_GID_removeACLs_setProtectionClass_foundSymlink_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;
  id v18;

  v4 = *(_DWORD *)(a2 + 56);
  if (v4 == 2)
    v5 = 493;
  else
    v5 = 420;
  if (v4 == 5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (*(_BYTE *)(a1 + 64))
    v6 = 4;
  else
    v6 = 0xFFFFFFFFLL;
  if ((*(_BYTE *)(a2 + 48) & 0x20) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v17 = *(_QWORD *)(a2 + 16);
      MOLogWrite();
    }
    v7 = 32;
  }
  else
  {
    v7 = 0;
  }
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a2 + 16);
  v10 = *(unsigned int *)(a1 + 56);
  v11 = *(unsigned int *)(a1 + 60);
  v12 = *(_BYTE *)(a1 + 65);
  v18 = 0;
  LOBYTE(v17) = v12;
  v13 = objc_msgSend(v8, "bulkSetPropertiesForPath:UID:GID:mode:flags:dataProtectionClass:removeACL:error:", v9, v10, v11, v5, v7, v6, v17, &v18);
  v14 = v18;
  v15 = v18;
  if ((v13 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v14);

  return v13;
}

- (BOOL)validateSymlinksInURLDoNotEscapeURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = (id *)&v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "fileSystemRepresentation");
  v18 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke;
  v15[3] = &unk_24EBCEC48;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  v17 = &v19;
  v9 = TraverseDirectory(v7, 0, 0, &v18, v15);
  v10 = v18;
  v11 = v18;
  v12 = v20;
  if ((v9 & 1) == 0 && !v20[5])
  {
    objc_storeStrong(v20 + 5, v10);
    v12 = v20;
  }
  v13 = v12[5];
  if (v13)
    v9 = 0;
  if (a4 && (v9 & 1) == 0)
    *a4 = objc_retainAutorelease(v13);

  _Block_object_dispose(&v19, 8);
  return v9;
}

uint64_t __59__MIFileManager_validateSymlinksInURLDoNotEscapeURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (*(_DWORD *)(a2 + 56) != 5)
    return 1;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a2 + 16), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "realPathForURL:ifChildOfURL:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  if (!v5)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager validateSymlinksInURLDoNotEscapeURL:error:]_block_invoke", 1161, CFSTR("MIInstallerErrorDomain"), 70, 0, &unk_24EBD2CF0, CFSTR("invalid symlink at %s"), v7, *(_QWORD *)(a2 + 16));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return v6;
}

- (id)enumerateURLsForItemsInDirectoryAtURL:(id)a3 ignoreSymlinks:(BOOL)a4 withBlock:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  id v18;

  v7 = a5;
  v8 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v18 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke;
  v15[3] = &unk_24EBCEC70;
  v17 = a4;
  v9 = v7;
  v16 = v9;
  v10 = TraverseDirectory(v8, 1, 0, &v18, v15);
  v11 = v18;
  v12 = v11;
  v13 = 0;
  if ((v10 & 1) == 0)
    v13 = v11;

  return v13;
}

uint64_t __80__MIFileManager_enumerateURLsForItemsInDirectoryAtURL_ignoreSymlinks_withBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v4;
  BOOL v5;
  void *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;

  v4 = *(_DWORD *)(a2 + 56);
  if (*(_BYTE *)(a1 + 40))
    v5 = v4 == 5;
  else
    v5 = 0;
  if (v5)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a2 + 16), v4 == 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = 0;
    v9 = *(unsigned int *)(a2 + 56);
    if (v9 >= 8)
      v10 = 0;
    else
      v10 = 0x10C0A0206040800uLL >> (8 * v9);
    v11 = (*(uint64_t (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8, v10 & 0xF);

    return v11;
  }
}

- (id)traverseDirectoryAtURL:(id)a3 withBlock:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v15 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke;
  v13[3] = &unk_24EBCEC98;
  v7 = v5;
  v14 = v7;
  v8 = TraverseDirectory(v6, 1, 0, &v15, v13);
  v9 = v15;
  v10 = v9;
  v11 = 0;
  if ((v8 & 1) == 0)
    v11 = v9;

  return v11;
}

uint64_t __50__MIFileManager_traverseDirectoryAtURL_withBlock___block_invoke(uint64_t a1, uint64_t a2, char *a3)
{
  void *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  char v11;

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a2 + 16), *(_DWORD *)(a2 + 56) == 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 1;
  v7 = *(unsigned int *)(a2 + 56);
  if (v7 >= 8)
    v8 = 0;
  else
    v8 = 0x10C0A0206040800uLL >> (8 * v7);
  v9 = (*(uint64_t (**)(_QWORD, void *, _QWORD, char *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v6, v8 & 0xF, &v11);
  *a3 = v11;

  return v9;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, _BYTE *);
  void *v20;
  id v21;
  uint64_t *v22;
  BOOL v23;
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = (void *)objc_opt_new();
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "fileSystemRepresentation");
  v24 = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke;
  v20 = &unk_24EBCECC0;
  v23 = a4;
  v22 = &v25;
  v11 = v8;
  v21 = v11;
  v12 = TraverseDirectory(v10, 1, 0, &v24, &v17);
  v13 = v24;
  v14 = v24;
  if (v26[5])
  {
LABEL_6:
    v15 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if ((v12 & 1) == 0)
  {
    objc_storeStrong(v26 + 5, v13);
    goto LABEL_6;
  }
  v15 = (void *)objc_msgSend(v11, "copy", v17, v18, v19, v20);
  if (!a5)
    goto LABEL_9;
LABEL_7:
  if (!v15)
    *a5 = objc_retainAutorelease(v26[5]);
LABEL_9:

  _Block_object_dispose(&v25, 8);
  return v15;
}

uint64_t __69__MIFileManager_urlsForItemsInDirectoryAtURL_ignoringSymlinks_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v4;
  BOOL v5;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = *(_DWORD *)(a2 + 56);
  if (*(_BYTE *)(a1 + 48))
    v5 = v4 == 5;
  else
    v5 = 0;
  if (v5)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", *(_QWORD *)(a2 + 16), v4 == 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;
    if (v9)
    {
      *a3 = 0;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIFileManager urlsForItemsInDirectoryAtURL:ignoringSymlinks:error:]_block_invoke", 1265, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to create URL for %s"), v8, *(_QWORD *)(a2 + 16));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
  }
  return v10;
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  v8 = objc_retainAutorelease(a4);
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v7);
  v11 = symlink(v9, (const char *)objc_msgSend(v10, "fileSystemRepresentation"));
  if (v11)
  {
    v12 = (void *)*MEMORY[0x24BDD1128];
    v13 = *__error();
    v14 = objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
    v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"-[MIFileManager createSymbolicLinkAtURL:withDestinationURL:error:]", 1298, v12, v13, 0, 0, CFSTR("Could not create symlink containing %s at %s: %s"), v16, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v17 = objc_retainAutorelease(v17);
      *a5 = v17;
    }
  }
  else
  {
    v17 = 0;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  id v5;
  ssize_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char v17[1025];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(a3);
  v6 = readlink((const char *)objc_msgSend(v5, "fileSystemRepresentation"), v17, 0x400uLL);
  if (v6 < 0)
  {
    v11 = (void *)*MEMORY[0x24BDD1128];
    v12 = *__error();
    v13 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v14 = __error();
    strerror(*v14);
    _CreateError((uint64_t)"-[MIFileManager destinationOfSymbolicLinkAtURL:error:]", 1318, v11, v12, 0, 0, CFSTR("Could not readlink %s : %s"), v15, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v17[v6] = 0;
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFileSystemRepresentation:length:", v17, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v9)
    *a4 = objc_retainAutorelease(v10);
LABEL_7:

  return v9;
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  stat v13;

  memset(&v13, 0, sizeof(v13));
  v5 = objc_retainAutorelease(a3);
  v6 = lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v13);
  if (v6)
  {
    v7 = __error();
    v8 = *v7;
    if ((_DWORD)v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v7);
      MOLogWrite();
    }
    if (a4)
    {
      v9 = (void *)*MEMORY[0x24BDD1128];
      v10 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
      strerror(v8);
      _CreateError((uint64_t)"-[MIFileManager itemExistsAtURL:error:]", 1345, v9, v8, 0, 0, CFSTR("lstat of %s failed: %s"), v11, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 == 0;
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return -[MIFileManager itemExistsAtURL:error:](self, "itemExistsAtURL:error:", a3, 0);
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  id v3;
  BOOL v4;
  int *v5;
  stat v7;

  memset(&v7, 0, sizeof(v7));
  v3 = objc_retainAutorelease(a3);
  if (!lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v7))
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (*__error() != 2)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v5 = __error();
      strerror(*v5);
      MOLogWrite();
    }
    goto LABEL_7;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

- (BOOL)itemDoesNotExistOrIsNotDirectoryAtURL:(id)a3
{
  BOOL v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  id v13;

  v13 = 0;
  v3 = -[MIFileManager itemIsDirectoryAtURL:error:](self, "itemIsDirectoryAtURL:error:", a3, &v13);
  v4 = v13;
  v5 = v4;
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDD1128];
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD1128]))
      v9 = objc_msgSend(v5, "code") == 2;
    else
      v9 = 0;

    objc_msgSend(v5, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v8))
      v11 = objc_msgSend(v5, "code") == 22;
    else
      v11 = 0;

    v6 = v9 || v11;
  }

  return v6;
}

- (BOOL)_itemIsType:(unsigned __int16)a3 withDescription:(id)a4 atURL:(id)a5 error:(id *)a6
{
  int v8;
  id v9;
  const char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  stat v18;

  v8 = a3;
  v9 = a4;
  memset(&v18, 0, sizeof(v18));
  v10 = (const char *)objc_msgSend(objc_retainAutorelease(a5), "fileSystemRepresentation");
  if (lstat(v10, &v18))
  {
    v12 = __error();
    v13 = *v12;
    if ((_DWORD)v13 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      strerror(*v12);
      MOLogWrite();
    }
    if (a6)
    {
      v14 = (void *)*MEMORY[0x24BDD1128];
      strerror(v13);
      _CreateError((uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]", 1403, v14, v13, 0, 0, CFSTR("lstat of %s failed: %s"), v15, (uint64_t)v10);
LABEL_12:
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ((v18.st_mode & 0xF000) != v8)
  {
    if (a6)
    {
      _CreateError((uint64_t)"-[MIFileManager _itemIsType:withDescription:atURL:error:]", 1393, (void *)*MEMORY[0x24BDD1128], 22, 0, 0, CFSTR("%s is not a %@ (mode 0%ho)"), v11, (uint64_t)v10);
      goto LABEL_12;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v16 = 1;
LABEL_14:

  return v16;
}

- (BOOL)itemIsFileAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:](self, "_itemIsType:withDescription:atURL:error:", 0x8000, CFSTR("regular file"), a3, a4);
}

- (BOOL)itemIsSymlinkAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:](self, "_itemIsType:withDescription:atURL:error:", 40960, CFSTR("symlink"), a3, a4);
}

- (BOOL)itemIsDirectoryAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:](self, "_itemIsType:withDescription:atURL:error:", 0x4000, CFSTR("directory"), a3, a4);
}

- (BOOL)itemIsFIFOAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:](self, "_itemIsType:withDescription:atURL:error:", 4096, CFSTR("FIFO"), a3, a4);
}

- (BOOL)itemIsSocketAtURL:(id)a3 error:(id *)a4
{
  return -[MIFileManager _itemIsType:withDescription:atURL:error:](self, "_itemIsType:withDescription:atURL:error:", 49152, CFSTR("socket"), a3, a4);
}

- (int)deviceForURLOrFirstAvailableParent:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  dev_t st_dev;
  id v13;
  void *v14;
  uint64_t v16;
  stat v17;

  objc_msgSend(a3, "path");
  memset(&v17, 0, sizeof(v17));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  if (lstat(v6, &v17))
  {
    v9 = *__error();
    if (v9 == 2)
    {
      while (!objc_msgSend(v5, "isEqualToString:", CFSTR("/")))
      {
        objc_msgSend(v5, "stringByDeletingLastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        memset(&v17, 0, sizeof(v17));
        v5 = objc_retainAutorelease(v11);
        v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
        if (!lstat(v6, &v17))
          goto LABEL_7;
        v9 = *__error();
        if (v9 != 2)
          goto LABEL_6;
      }
      _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1460, (void *)*MEMORY[0x24BDD1128], 2, 0, 0, CFSTR("lstat for path \"/\" failed, which should never happen!"), v10, v16);
    }
    else
    {
LABEL_6:
      _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1467, (void *)*MEMORY[0x24BDD1128], v9, 0, 0, CFSTR("lstat failed for %s"), v8, (uint64_t)v6);
    }
  }
  else
  {
LABEL_7:
    st_dev = v17.st_dev;
    if (v17.st_dev != -1)
    {
      v13 = 0;
      goto LABEL_14;
    }
    _CreateError((uint64_t)"-[MIFileManager deviceForURLOrFirstAvailableParent:error:]", 1452, (void *)*MEMORY[0x24BDD1128], 22, 0, 0, CFSTR("lstat succeeded but st_dev was -1 for %s"), v7, (uint64_t)v6);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  if (a4)
  {
    v13 = objc_retainAutorelease(v14);
    *a4 = v13;
  }
  st_dev = -1;
LABEL_14:

  return st_dev;
}

- (id)upToFirstFourBytesFromURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", a3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    v10 = 0;
    objc_msgSend(v5, "readDataUpToLength:error:", 4, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;

    v6 = v8;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v7 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v7)
    *a4 = objc_retainAutorelease(v6);
LABEL_7:

  return v7;
}

- (id)aclTextFromURL:(id)a3 error:(id *)a4
{
  id v5;
  _acl *file;
  _acl *v7;
  char *v8;
  char *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = objc_retainAutorelease(a3);
  file = acl_get_file((const char *)objc_msgSend(v5, "fileSystemRepresentation"), ACL_TYPE_EXTENDED);
  if (!file)
  {
    v12 = *__error();
    v13 = (void *)*MEMORY[0x24BDD1128];
    objc_msgSend(v5, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v12);
    _CreateError((uint64_t)"-[MIFileManager aclTextFromURL:error:]", 1518, v13, v12, 0, 0, CFSTR("Could not get ACL for file %@: %s"), v15, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v7 = file;
  v8 = acl_to_text(file, 0);
  if (!v8)
  {
    v16 = *__error();
    v17 = (void *)*MEMORY[0x24BDD1128];
    objc_msgSend(v5, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v16);
    _CreateError((uint64_t)"-[MIFileManager aclTextFromURL:error:]", 1524, v17, v16, 0, 0, CFSTR("Could not read ACL text for file %@: %s"), v19, (uint64_t)v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    acl_free(v7);
LABEL_7:
    v10 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  acl_free(v7);
  acl_free(v9);
  v11 = 0;
  if (!a4)
    goto LABEL_10;
LABEL_8:
  if (!v10)
    *a4 = objc_retainAutorelease(v11);
LABEL_10:

  return v10;
}

- (id)extendedAttributesFromURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int v7;
  ssize_t v8;
  size_t v9;
  char *v10;
  char *v11;
  ssize_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  size_t v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  int v35;
  void *v36;
  uint64_t v37;
  id v38;

  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 256);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    v8 = flistxattr(v6, 0, 0, 32);
    if (v8 < 0)
    {
      v26 = *__error();
      v27 = (void *)*MEMORY[0x24BDD1128];
      objc_msgSend(v5, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v26);
      _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1598, v27, v26, 0, 0, CFSTR("Could not get the length for extended attribute list for %@: %s"), v29, (uint64_t)v28);
    }
    else
    {
      v9 = v8;
      if (v8)
      {
        v10 = (char *)malloc_type_malloc(v8, 0x73E5BF5BuLL);
        if (v10)
        {
          v11 = v10;
          v12 = flistxattr(v7, v10, v9, 32);
          if (v12 < 0)
          {
            v35 = *__error();
            v36 = (void *)*MEMORY[0x24BDD1128];
            objc_msgSend(v5, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            strerror(v35);
            _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1615, v36, v35, 0, 0, CFSTR("Could not get extended attribute list for %@: %s"), v37, (uint64_t)v28);
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = v12;
            if (v12)
            {
              v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v15 = 0;
              v16 = v11;
              do
              {
                v17 = v15;
                v38 = v15;
                _dataForEAKey(v16, v7, &v38);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v38;

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                {
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, v19);
                }
                else
                {
                  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                    MOLogWrite();

                  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v19);

                  v15 = 0;
                }
                v21 = strlen(v16);
                v13 -= v21 + 1;
                v16 += v21 + 1;

              }
              while (v13 > 0);
              goto LABEL_22;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              v14 = 0;
              v15 = 0;
              goto LABEL_22;
            }
            objc_msgSend(v5, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
            v15 = 0;
          }
LABEL_21:

          v14 = 0;
LABEL_22:
          close(v7);
          goto LABEL_23;
        }
        v31 = *__error();
        v32 = (void *)*MEMORY[0x24BDD1128];
        objc_msgSend(v5, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        strerror(v31);
        _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1608, v32, v31, 0, 0, CFSTR("Failed to malloc %zd bytes for extended attribute list for %@: %s"), v33, v9);
      }
      else
      {
        objc_msgSend(v5, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1601, CFSTR("MIInstallerErrorDomain"), 140, 0, 0, CFSTR("No extended attributes found on %@"), v30, (uint64_t)v28);
      }
    }
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    goto LABEL_21;
  }
  v22 = *__error();
  v23 = (void *)*MEMORY[0x24BDD1128];
  objc_msgSend(v5, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v22);
  _CreateError((uint64_t)"-[MIFileManager extendedAttributesFromURL:error:]", 1592, v23, v22, 0, 0, CFSTR("Failed to open %@: %s"), v25, (uint64_t)v24);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v11 = 0;
LABEL_23:
  free(v11);
  if (a4 && !v14)
    *a4 = objc_retainAutorelease(v15);

  return v14;
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;

  v7 = objc_retainAutorelease(a3);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 256);
  v9 = v8;
  if (v8 < 0)
  {
    v13 = (void *)*MEMORY[0x24BDD1128];
    v14 = *__error();
    v15 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v16 = __error();
    strerror(*v16);
    _CreateError((uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]", 1655, v13, v14, 0, 0, CFSTR("Failed to open %s : %s"), v17, v15);
  }
  else
  {
    v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      v11 = 0;
      *a4 = v10;
      v12 = 1;
LABEL_9:
      close(v9);
      v24 = v12;
      goto LABEL_10;
    }
    v18 = (void *)*MEMORY[0x24BDD1128];
    v19 = *__error();
    v20 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v21 = __error();
    strerror(*v21);
    _CreateError((uint64_t)"-[MIFileManager dataProtectionClassOfItemAtURL:class:error:]", 1661, v18, v19, 0, 0, CFSTR("Failed to getclass of file %s: %s"), v22, v20);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (a5)
    *a5 = objc_retainAutorelease(v23);
  v12 = 0;
  v24 = 0;
  if ((v9 & 0x80000000) == 0)
    goto LABEL_9;
LABEL_10:

  return v24;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  unsigned int (**v10)(id, _QWORD);
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  int *v29;
  void *v30;
  BOOL v31;
  uint64_t v33;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = (unsigned int (**)(id, _QWORD))a5;
  v11 = objc_retainAutorelease(v9);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 256);
  v13 = v12;
  if (v12 < 0)
  {
    v19 = (void *)*MEMORY[0x24BDD1128];
    v20 = *__error();
    v21 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    v22 = __error();
    v33 = v21;
    strerror(*v22);
    v24 = CFSTR("Failed to open %s : %s");
    v25 = 1686;
  }
  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        v15 = (void *)*MEMORY[0x24BDD1128];
        v16 = *__error();
        objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
        v17 = __error();
        strerror(*v17);
        _CreateError((uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", 1703, v15, v16, 0, 0, CFSTR("Failed to setclass(%d) on file %s: %s"), v18, v8);
        goto LABEL_11;
      }
LABEL_8:
      v26 = 0;
      v27 = 1;
LABEL_14:
      close(v13);
      v31 = v27;
      goto LABEL_15;
    }
    v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14))
        goto LABEL_8;
      goto LABEL_5;
    }
    v19 = (void *)*MEMORY[0x24BDD1128];
    v20 = *__error();
    v28 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    v29 = __error();
    v33 = v28;
    strerror(*v29);
    v24 = CFSTR("Failed to getclass of file %s: %s");
    v25 = 1694;
  }
  _CreateError((uint64_t)"-[MIFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", v25, v19, v20, 0, 0, v24, v23, v33);
LABEL_11:
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v30;
  if (a6)
    *a6 = objc_retainAutorelease(v30);
  v27 = 0;
  v31 = 0;
  if ((v13 & 0x80000000) == 0)
    goto LABEL_14;
LABEL_15:

  return v31;
}

- (BOOL)setOwnerOfURL:(id)a3 toUID:(unsigned int)a4 gid:(unsigned int)a5 error:(id *)a6
{
  id v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v9 = objc_retainAutorelease(a3);
  v10 = lchown((const char *)objc_msgSend(v9, "fileSystemRepresentation"), a4, a5);
  if (v10)
  {
    v11 = *__error();
    v12 = (void *)*MEMORY[0x24BDD1128];
    v13 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
    strerror(v11);
    _CreateError((uint64_t)"-[MIFileManager setOwnerOfURL:toUID:gid:error:]", 1726, v12, v11, 0, 0, CFSTR("Failed to lchown %s : %s"), v14, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      v15 = objc_retainAutorelease(v15);
      *a6 = v15;
    }
  }
  else
  {
    v15 = 0;
  }

  return v10 == 0;
}

- (BOOL)setPermissionsForURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  id v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = objc_retainAutorelease(a3);
  v8 = lchmod((const char *)objc_msgSend(v7, "fileSystemRepresentation"), a4);
  if (v8)
  {
    v9 = *__error();
    v10 = (void *)*MEMORY[0x24BDD1128];
    v11 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    strerror(v9);
    _CreateError((uint64_t)"-[MIFileManager setPermissionsForURL:toMode:error:]", 1745, v10, v9, 0, 0, CFSTR("Failed to lchmod %s : %s"), v12, v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v13 = objc_retainAutorelease(v13);
      *a5 = v13;
    }
  }
  else
  {
    v13 = 0;
  }

  return v8 == 0;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 toDirectory:(id)a4 doCopy:(BOOL)a5 failureIsFatal:(BOOL)a6 includeiTunesMetadata:(BOOL)a7 withError:(id *)a8
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  BOOL v28;
  id *v30;
  id v31;
  id obj;
  _BOOL4 v35;
  id v36;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  _BYTE v48[128];
  _QWORD v49[7];

  v35 = a5;
  v49[5] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v36 = a4;
  v49[0] = CFSTR("Manifest.plist");
  v49[1] = CFSTR("iTunesArtwork");
  v49[2] = CFSTR("iTunesMetadata.plist");
  v49[3] = CFSTR("GeoJSON");
  v49[4] = CFSTR("com.apple.mobileinstallation.companion_placeholder");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 5);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v12)
  {
    v13 = v12;
    v30 = a8;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v41;
    v31 = v10;
    obj = v11;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v16)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v17);
      if (!a7
        && (objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v17), "isEqualToString:", CFSTR("iTunesMetadata.plist")) & 1) != 0)
      {
        goto LABEL_15;
      }
      objc_msgSend(v36, "URLByAppendingPathComponent:isDirectory:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v18, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v39 = v15;
        v21 = -[MIFileManager copyItemIfExistsAtURL:toURL:error:](self, "copyItemIfExistsAtURL:toURL:error:", v20, v19, &v39);
        v22 = v39;

        if (!v21)
        {
          v46 = CFSTR("LegacyErrorString");
          objc_msgSend(&unk_24EBD2D40, "objectAtIndexedSubscript:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 1778, CFSTR("MIInstallerErrorDomain"), 24, v22, v24, CFSTR("Failed to copy %@ to %@"), v25, (uint64_t)v20);
          goto LABEL_13;
        }
      }
      else
      {
        v38 = v15;
        v26 = -[MIFileManager moveItemIfExistsAtURL:toURL:error:](self, "moveItemIfExistsAtURL:toURL:error:", v20, v19, &v38);
        v22 = v38;

        if (!v26)
        {
          v44 = CFSTR("LegacyErrorString");
          objc_msgSend(&unk_24EBD2D40, "objectAtIndexedSubscript:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v23;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateAndLogError((uint64_t)"-[MIFileManager captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 1786, CFSTR("MIInstallerErrorDomain"), 24, v22, v24, CFSTR("Failed to move %@ to %@"), v27, (uint64_t)v20);
LABEL_13:
          v15 = (id)objc_claimAutoreleasedReturnValue();

          v10 = v31;
          v22 = v15;
          if (a6)
          {

            v11 = obj;
            if (v30)
            {
              v15 = objc_retainAutorelease(v15);
              v28 = 0;
              *v30 = v15;
            }
            else
            {
              v28 = 0;
            }
            goto LABEL_23;
          }
        }
      }
      ++v14;

      v15 = v22;
LABEL_15:
      if (v13 == ++v17)
      {
        v11 = obj;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v13)
          goto LABEL_3;
        goto LABEL_21;
      }
    }
  }
  v15 = 0;
LABEL_21:

  v28 = 1;
LABEL_23:

  return v28;
}

- (id)_realPathWhatExistsInPath:(id)a3 isDirectory:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _BOOL4 v17;

  v17 = a4;
  objc_msgSend(a3, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - 1;
  if (v6 == 1)
  {
    v10 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v5, "subarrayWithRange:", 0, v7 + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPathComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (-[MIFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v9))
      {
        -[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:](self, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v9, 0, v17, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v5, "subarrayWithRange:", v7 + 1, objc_msgSend(v5, "count") - (v7 + 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          {
            objc_msgSend(v11, "path");
            v16 = v13;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();

          }
          objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v13, v17, v15, v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v10 = 0;
        }

      }
      if (v10)
        break;
      --v7;
    }
    while (v7);
  }

  return v10;
}

- (id)realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4 isDirectory:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v22[1024];
  uint64_t v23;

  v7 = a5;
  v8 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  bzero(v22, 0x400uLL);
  objc_msgSend(a3, "path");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v11, "fileSystemRepresentation"), v22))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v22, v7, 0);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v20 = (void *)v12;
    goto LABEL_12;
  }
  v13 = *__error();
  if ((_DWORD)v13 == 2 && v8)
  {
    -[MIFileManager _realPathWhatExistsInPath:isDirectory:](self, "_realPathWhatExistsInPath:isDirectory:", v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v15 = (void *)*MEMORY[0x24BDD1128];
  v16 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
  strerror(v13);
  _CreateAndLogError((uint64_t)"-[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:]", 1845, v15, v13, 0, 0, CFSTR("Failed to realpath %s : %s at %s"), v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a6)
    *a6 = objc_retainAutorelease(v18);

  v20 = 0;
LABEL_12:

  return v20;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  return -[MIFileManager realPathForURL:allowNonExistentPathComponents:isDirectory:error:](self, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", a3, a4, 0, 0);
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  unsigned int *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v18 = a5;
    objc_msgSend(v7, "pathComponents");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = a4;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("..")))
          {
            --v13;
          }
          else if ((objc_msgSend(v15, "isEqualToString:", &stru_24EBD14A8) & 1) == 0
                 && (objc_msgSend(v15, "isEqualToString:", CFSTR(".")) & 1) == 0)
          {
            v13 += objc_msgSend(v15, "isEqualToString:", CFSTR("/")) ^ 1;
          }
          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v13 = a4;
    }

    if (v18)
      *v18 = v13;
    v16 = 1;
  }
  else
  {
    v9 = 0;
LABEL_18:
    v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  ssize_t v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v42;
  int *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  unsigned int v74;
  char v75[1024];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  bzero(v75, 0x400uLL);
  if (!v6 || !v7)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
    goto LABEL_14;
  }
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/private/"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v13;
  }
  objc_msgSend(v6, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("/private/"));

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v19;
  }
  objc_msgSend(v6, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "hasPrefix:", v21);

  if ((v22 & 1) == 0)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
    objc_msgSend(v6, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    goto LABEL_37;
  }
  objc_msgSend(v6, "pathComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", CFSTR(".."));

  if (v24)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
    goto LABEL_11;
  }
  v6 = objc_retainAutorelease(v6);
  v26 = readlink((const char *)objc_msgSend(v6, "fileSystemRepresentation"), v75, 0x400uLL);
  if (v26 == -1)
  {
    if (*__error() == 22 || *__error() == 2)
    {
      objc_msgSend(v6, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      goto LABEL_28;
    }
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
    v43 = __error();
    strerror(*v43);
LABEL_14:
    MOLogWrite();
LABEL_38:
    v39 = 0;
    v38 = 0;
    v36 = 0;
    v27 = 0;
    v28 = 0;
    goto LABEL_39;
  }
  if (v75[0] == 47)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
LABEL_11:
    objc_msgSend(v6, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    MOLogWrite();
LABEL_37:

    goto LABEL_38;
  }
  v74 = 0;
  objc_msgSend(v7, "path");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[MIFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v29, 0, &v74);

  if (!v30)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_38;
    objc_msgSend(v7, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  objc_msgSend(v6, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "substringFromIndex:", objc_msgSend(v32, "length"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "stringByDeletingLastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFileSystemRepresentation:length:", v75, v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringByAppendingPathComponent:", v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[MIFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v27, v74, 0))
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_54;
    objc_msgSend(v6, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

    goto LABEL_53;
  }
LABEL_28:
  -[MIFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v7, 0);
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_54;
    objc_msgSend(v7, "path");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
LABEL_53:

LABEL_54:
    v39 = 0;
    v38 = 0;
    v36 = 0;
    goto LABEL_39;
  }
  v36 = (void *)v35;
  -[MIFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v6, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    v38 = v37;
    if (!_CheckRealpathHasBasePrefix(v37, v36))
    {
LABEL_71:
      v39 = 0;
      goto LABEL_39;
    }
    if (v26 != -1)
    {
LABEL_32:
      v39 = v38;
      v38 = v39;
      goto LABEL_39;
    }
    objc_msgSend(v38, "pathComponents");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "pathComponents");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v72, "count");
    v73 = v44;
    v46 = objc_msgSend(v44, "count");
    if (v46 < 2 || v45 <= 1)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_70;
    }
    else
    {
      v47 = v46;
      v48 = 1;
      objc_msgSend(v72, "objectAtIndexedSubscript:", 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v49, "isEqualToString:", CFSTR("private")))
        v48 = 2;

      objc_msgSend(v73, "objectAtIndexedSubscript:", 1);
      v67 = v45;
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v50, "isEqualToString:", CFSTR("private")))
        v51 = 2;
      else
        v51 = 1;

      if (v67 - v48 <= v47 - v51)
      {
        if (v67 <= v48)
        {
LABEL_75:

          goto LABEL_32;
        }
        while (1)
        {
          objc_msgSend(v72, "objectAtIndexedSubscript:", v48);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "objectAtIndexedSubscript:", v51);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v57, "isEqualToString:", v58);

          if ((v71 & 1) == 0)
            break;
          ++v48;
          ++v51;
          if (v67 == v48)
            goto LABEL_75;
        }
        v69 = v51;
        if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          goto LABEL_70;
        objc_msgSend(v6, "path");
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v66 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "path");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "path");
        v60 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectAtIndexedSubscript:", v48);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", v69);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (void *)v60;
        v56 = (void *)v59;
        MOLogWrite();

        v55 = (void *)v66;
        goto LABEL_69;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_70;
    }
    objc_msgSend(v6, "path");
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v53 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "path");
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "path");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)v54;
    v55 = (void *)v53;
    v56 = (void *)v52;
    MOLogWrite();
LABEL_69:

LABEL_70:
    goto LABEL_71;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v6, "path");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v39 = 0;
  v38 = 0;
LABEL_39:
  v40 = v39;

  return v40;
}

- (BOOL)markBundleAsPlaceholder:(id)a3 withError:(id *)a4
{
  const char *v5;
  int v6;
  int *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  int value;

  value = 1;
  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v6 = setxattr(v5, "com.apple.installd.placeholder", &value, 4uLL, 0, 1);
  if (v6)
  {
    v7 = __error();
    v8 = *v7;
    _CreateError((uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]", 2101, (void *)*MEMORY[0x24BDD1128], *v7, 0, 0, CFSTR("setxattr for %s on %s failed"), v9, (uint64_t)"com.apple.installd.placeholder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v8);
    _CreateAndLogError((uint64_t)"-[MIFileManager markBundleAsPlaceholder:withError:]", 2101, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Could't set placeholder EA on \"%s\": %s"), v11, (uint64_t)v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      *a4 = v12;
    }
  }
  else
  {
    v12 = 0;
  }

  return v6 == 0;
}

- (BOOL)bundleAtURLIsPlaceholder:(id)a3
{
  int value;

  value = 0;
  return getxattr((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), "com.apple.installd.placeholder", &value, 4uLL, 0, 1) == 4;
}

- (BOOL)clearPlaceholderStatusForBundle:(id)a3 withError:(id *)a4
{
  const char *v5;
  int v6;
  int *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v6 = removexattr(v5, "com.apple.installd.placeholder", 1);
  if (v6)
  {
    v7 = __error();
    _CreateError((uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]", 2125, (void *)*MEMORY[0x24BDD1128], *v7, 0, 0, CFSTR("removexattr on %s for %s failed"), v8, (uint64_t)v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager clearPlaceholderStatusForBundle:withError:]", 2125, CFSTR("MIInstallerErrorDomain"), 4, v9, 0, CFSTR("Could't remove placeholder EA on \"%s\"), v10, (uint64_t)v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v11);

  }
  return v6 == 0;
}

- (BOOL)_markEAFlag:(const char *)a3 forAppIdentifier:(id)a4 insecurelyCachedOnBundle:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  int *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  int *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  size_t v29;
  int *v30;
  int v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int value;

  v9 = a4;
  v10 = a5;
  value = 1;
  if (!v9 || !objc_msgSend(v9, "length"))
  {
    v20 = objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
    _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2141, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to set a zero-length or nil app identifier on \"%s\"), v21, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 256);
  if (v12 < 0)
  {
    v23 = __error();
    v24 = *v23;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v23, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    strerror(v24);
    _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2148, CFSTR("MIInstallerErrorDomain"), 4, v25, 0, CFSTR("Couldn't open bundle \"%s\" for setting extended attributes: %s"), v27, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v19 = 0;
    if (!a6)
      goto LABEL_13;
    goto LABEL_11;
  }
  v13 = v12;
  if (fsetxattr(v12, a3, &value, 4uLL, 0, 0))
  {
    v14 = __error();
    v15 = *v14;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v14, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    strerror(v15);
    _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2154, CFSTR("MIInstallerErrorDomain"), 4, v16, 0, CFSTR("Couldn't set %s EA on \"%s\": %s"), v17, (uint64_t)a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
    v19 = 0;
    goto LABEL_7;
  }
  v28 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  v29 = strlen(v28);
  if (fsetxattr(v13, "com.apple.installd.appIdentifier", v28, v29, 0, 0))
  {
    v30 = __error();
    v31 = *v30;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v30, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_retainAutorelease(v11);
    v34 = objc_msgSend(v33, "fileSystemRepresentation");
    strerror(v31);
    _CreateAndLogError((uint64_t)"-[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:]", 2163, CFSTR("MIInstallerErrorDomain"), 4, v32, 0, CFSTR("Couldn't set app identifier EA on \"%s\": %s"), v35, v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (fremovexattr(v13, a3, 1) < 0)
    {
      v36 = *__error();
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(objc_retainAutorelease(v33), "fileSystemRepresentation");
        strerror(v36);
        MOLogWrite();
      }
    }
    goto LABEL_6;
  }
  v18 = 0;
  v19 = 1;
LABEL_7:
  close(v13);
  if (!a6)
    goto LABEL_13;
LABEL_11:
  if (!v19)
    *a6 = objc_retainAutorelease(v18);
LABEL_13:

  return v19;
}

- (id)_insecureCachedAppIdentifierIfMarkedWithEAFlag:(const char *)a3 bundleURL:(id)a4 allowPlaceholders:(BOOL)a5 error:(id *)a6
{
  id v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  int *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  int v37;
  int value;

  value = 0;
  v9 = objc_retainAutorelease(a4);
  v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 256);
  if ((v10 & 0x80000000) == 0)
  {
    v11 = v10;
    if (fgetxattr(v10, a3, &value, 4uLL, 0, 0) != 4)
    {
      v23 = *__error();
      if ((_DWORD)v23 == 93)
      {
        v24 = (void *)*MEMORY[0x24BDD1128];
        objc_msgSend(v9, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2202, v24, 93, 0, 0, CFSTR("Attr named %s not present on %@"), v25, (uint64_t)a3);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v23, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
        strerror(v23);
        _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2204, CFSTR("MIInstallerErrorDomain"), 4, v27, 0, CFSTR("Couldn't get %s EA from \"%s\": %s"), v28, (uint64_t)a3);
        v15 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_13;
    }
    if (value != 1)
    {
      objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
      _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2208, CFSTR("MIInstallerErrorDomain"), 141, 0, 0, CFSTR("%s EA was not set to expected value from \"%s\"), v26, (uint64_t)a3);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (!a5)
    {
      v37 = 0;
      if (fgetxattr(v11, "com.apple.installd.placeholder", &v37, 4uLL, 0, 0) == 4)
      {
        v12 = (void *)*MEMORY[0x24BDD1128];
        objc_msgSend(v9, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2217, v12, 93, 0, 0, CFSTR("Not allowed to mark placeholder as validatedByFreeProfile for %@"), v14, (uint64_t)v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v22 = 0;
        v21 = 0;
        goto LABEL_14;
      }
    }
    v36 = 0;
    _dataForEAKey("com.apple.installd.appIdentifier", v11, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v36;
    if (v21)
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v21, 4);
      if (v30)
      {
        v22 = (void *)v30;
        goto LABEL_14;
      }
      objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
      _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2230, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to convert app identifier EA data (%@) to string from \"%s\"), v34, (uint64_t)v21);
      v33 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
    }
    else
    {
      v31 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
      _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2224, CFSTR("MIInstallerErrorDomain"), 4, v15, 0, CFSTR("Couldn't get appIdentifier EA from \"%s\"), v32, v31);
      v33 = objc_claimAutoreleasedReturnValue();

      v22 = 0;
      v21 = 0;
    }
    v15 = (id)v33;
LABEL_14:
    close(v11);
    if (!a6)
      goto LABEL_17;
    goto LABEL_15;
  }
  v16 = __error();
  v17 = *v16;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v16, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation");
  strerror(v17);
  _CreateAndLogError((uint64_t)"-[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:]", 2194, CFSTR("MIInstallerErrorDomain"), 4, v18, 0, CFSTR("Couldn't open bundle \"%s\" for setting extended attributes: %s"), v20, v19);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = 0;
  if (!a6)
    goto LABEL_17;
LABEL_15:
  if (!v22)
    *a6 = objc_retainAutorelease(v15);
LABEL_17:

  return v22;
}

- (BOOL)setAppClipAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return -[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:](self, "_markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:", "com.apple.installd.appclip", a3, a4, a5);
}

- (id)insecureCachedAppIdentifierIfAppClipForBundle:(id)a3 error:(id *)a4
{
  return -[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:](self, "_insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:", "com.apple.installd.appclip", a3, 1, a4);
}

- (BOOL)setValidatedByFreeProfileAppIdentifier:(id)a3 insecurelyCachedOnBundle:(id)a4 error:(id *)a5
{
  return -[MIFileManager _markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:](self, "_markEAFlag:forAppIdentifier:insecurelyCachedOnBundle:error:", "com.apple.installd.validatedByFreeProfile", a3, a4, a5);
}

- (id)insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:(id)a3 error:(id *)a4
{
  return -[MIFileManager _insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:](self, "_insecureCachedAppIdentifierIfMarkedWithEAFlag:bundleURL:allowPlaceholders:error:", "com.apple.installd.validatedByFreeProfile", a3, 0, a4);
}

- (BOOL)setInstallType:(id)a3 inExtendedAttributeOnBundle:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  int v9;
  int *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t value;

  v7 = a4;
  value = objc_msgSend(a3, "unsignedLongLongValue");
  v8 = objc_retainAutorelease(v7);
  v9 = setxattr((const char *)objc_msgSend(v8, "fileSystemRepresentation"), "com.apple.installd.installType", &value, 8uLL, 0, 1);
  if (v9)
  {
    v10 = __error();
    v11 = *v10;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    strerror(v11);
    _CreateAndLogError((uint64_t)"-[MIFileManager setInstallType:inExtendedAttributeOnBundle:error:]", 2277, CFSTR("MIInstallerErrorDomain"), 4, v12, 0, CFSTR("Couldn't set installType EA on \"%s\": %s"), v14, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v15 = objc_retainAutorelease(v15);
      *a5 = v15;
    }
  }
  else
  {
    v15 = 0;
  }

  return v9 == 0;
}

- (id)installTypeFromExtendedAttributeOnBundle:(id)a3 error:(id *)a4
{
  id v5;
  ssize_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t value;

  value = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = getxattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), "com.apple.installd.installType", &value, 8uLL, 0, 1);
  if (v6 < 0)
  {
    v9 = *__error();
    if ((_DWORD)v9 == 93)
    {
      objc_msgSend(v5, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2294, CFSTR("MIInstallerErrorDomain"), 158, 0, 0, CFSTR("Install type extended attribute not found on %@"), v11, (uint64_t)v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v9, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
      strerror(v9);
      _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2296, CFSTR("MIInstallerErrorDomain"), 4, v14, 0, CFSTR("Couldn't get installType EA from \"%s\": %s"), v16, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:
    v7 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v6 != 8)
  {
    v12 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    _CreateAndLogError((uint64_t)"-[MIFileManager installTypeFromExtendedAttributeOnBundle:error:]", 2302, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("getxattr for installType EA on %s returned %zd (expected %zu)"), v13, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_10:
  if (!v7)
    *a4 = objc_retainAutorelease(v8);
LABEL_12:

  return v7;
}

- (BOOL)_setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  id v17;
  const void *v18;
  size_t v19;
  uint64_t v20;
  int *v21;
  int v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  BOOL v27;

  v11 = objc_retainAutorelease(a5);
  v12 = a4;
  v13 = a3;
  v14 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
  v15 = objc_retainAutorelease(v12);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  v17 = objc_retainAutorelease(v13);
  v18 = (const void *)objc_msgSend(v17, "bytes");
  v19 = objc_msgSend(v17, "length");

  if (!v17)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2324, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Attempted to set nil data on \"%s\" for EA named %s"), v20, (uint64_t)v14);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (a7)
      goto LABEL_5;
LABEL_7:
    v27 = 0;
    goto LABEL_10;
  }
  if ((a6 & 0x80000000) == 0)
  {
    if (fsetxattr(a6, v16, v18, v19, 0, 0))
      goto LABEL_4;
LABEL_9:
    v26 = 0;
    v27 = 1;
    goto LABEL_10;
  }
  if (!setxattr(v14, v16, v18, v19, 0, 1))
    goto LABEL_9;
LABEL_4:
  v21 = __error();
  v22 = *v21;
  _CreateError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2337, (void *)*MEMORY[0x24BDD1128], *v21, 0, 0, CFSTR("[f]setxattr failed for path %s fd %d"), v23, (uint64_t)v14);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  strerror(v22);
  _CreateAndLogError((uint64_t)"-[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:]", 2337, CFSTR("MIInstallerErrorDomain"), 4, v24, 0, CFSTR("Failed to set EA named %s on \"%s\": %s"), v25, (uint64_t)v16);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (!a7)
    goto LABEL_7;
LABEL_5:
  v26 = objc_retainAutorelease(v26);
  v27 = 0;
  *a7 = v26;
LABEL_10:

  return v27;
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onURL:(id)a5 error:(id *)a6
{
  return -[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:](self, "_setData:forExtendedAttributeNamed:onURL:orFD:error:", a3, a4, a5, 0xFFFFFFFFLL, a6);
}

- (BOOL)setData:(id)a3 forExtendedAttributeNamed:(id)a4 onFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return -[MIFileManager _setData:forExtendedAttributeNamed:onURL:orFD:error:](self, "_setData:forExtendedAttributeNamed:onURL:orFD:error:", a3, a4, a6, *(_QWORD *)&a5, a7);
}

- (id)_dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 onURL:(id)a5 orFD:(int)a6 error:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  const char *v17;
  id v18;
  const char *v19;
  ssize_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v11 = (void *)MEMORY[0x24BDBCEC8];
  v12 = a5;
  v13 = a3;
  objc_msgSend(v11, "dataWithLength:", a4);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (void *)objc_msgSend(v14, "mutableBytes");
  v16 = objc_retainAutorelease(v13);
  v17 = (const char *)objc_msgSend(v16, "UTF8String");

  v18 = objc_retainAutorelease(v12);
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");

  if ((a6 & 0x80000000) == 0)
  {
    v20 = fgetxattr(a6, v17, v15, a4, 0, 0);
    if ((v20 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_7:
    v25 = *__error();
    if ((_DWORD)v25 != 93)
    {
      _CreateError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2385, (void *)*MEMORY[0x24BDD1128], v25, 0, 0, CFSTR("[f]getxattr failed for path %s fd %d"), v24, (uint64_t)v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v25);
      _CreateAndLogError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2385, CFSTR("MIInstallerErrorDomain"), 4, v27, 0, CFSTR("Couldn't get data from EA named %s on \"%s\": %s"), v28, (uint64_t)v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
      v22 = 0;
      if (!a7)
        goto LABEL_15;
      goto LABEL_13;
    }
    _CreateError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2382, (void *)*MEMORY[0x24BDD1128], 93, 0, 0, CFSTR("Attr named %s not present on \"%s\"), v24, (uint64_t)v17);
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v23 = (void *)v26;
    goto LABEL_12;
  }
  v20 = getxattr(v19, v17, v15, a4, 0, 1);
  if (v20 < 0)
    goto LABEL_7;
LABEL_3:
  if (v20 != a4)
  {
    _CreateAndLogError((uint64_t)"-[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:]", 2389, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("getxattr for EA named %s on \"%s\" returned %zd (expected %zu)"), v21, (uint64_t)v17);
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v22 = (void *)objc_msgSend(v14, "copy");
  v23 = 0;
  if (!a7)
    goto LABEL_15;
LABEL_13:
  if (!v22)
    *a7 = objc_retainAutorelease(v23);
LABEL_15:

  return v22;
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromURL:(id)a5 error:(id *)a6
{
  return -[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:](self, "_dataForExtendedAttributeNamed:length:onURL:orFD:error:", a3, a4, a5, 0xFFFFFFFFLL, a6);
}

- (id)dataForExtendedAttributeNamed:(id)a3 length:(unint64_t)a4 fromFD:(int)a5 fdLocation:(id)a6 error:(id *)a7
{
  return -[MIFileManager _dataForExtendedAttributeNamed:length:onURL:orFD:error:](self, "_dataForExtendedAttributeNamed:length:onURL:orFD:error:", a3, a4, a6, *(_QWORD *)&a5, a7);
}

- (BOOL)removeExtendedAttributeNamed:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  id v9;
  BOOL v10;
  int *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  v7 = a3;
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  v9 = objc_retainAutorelease(v7);
  v10 = 1;
  if (removexattr(v8, (const char *)objc_msgSend(v9, "fileSystemRepresentation"), 1))
  {
    v11 = __error();
    v12 = *v11;
    if ((_DWORD)v12 == 93)
    {
      v13 = 0;
      v10 = 1;
    }
    else
    {
      v14 = (void *)*MEMORY[0x24BDD1128];
      strerror(*v11);
      _CreateError((uint64_t)"-[MIFileManager removeExtendedAttributeNamed:fromURL:error:]", 2420, v14, v12, 0, 0, CFSTR("Failed to remove extended attribute named %@ from %s: %s"), v15, (uint64_t)v9);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        v13 = objc_retainAutorelease(v13);
        v10 = 0;
        *a5 = v13;
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v10;
}

- (unint64_t)diskUsageForURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  id v9;
  unint64_t v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 256);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = objc_msgSend(v5, "fileSystemRepresentation");
  v16 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __33__MIFileManager_diskUsageForURL___block_invoke;
  v13[3] = &unk_24EBCECE8;
  v15 = &v17;
  v7 = v4;
  v14 = v7;
  v8 = TraverseDirectory(v6, 2, 0x1C0u, &v16, v13);
  v9 = v16;
  if ((v8 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __33__MIFileManager_diskUsageForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v4;

  if (*(_DWORD *)(a2 + 56) != 2)
  {
    if (*(_DWORD *)(a2 + 76) == 1)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_QWORD *)(a2 + 8);
    }
    else
    {
      v4 = *(const void **)a2;
      if (NSHashGet(*(NSHashTable **)(a1 + 32), *(const void **)a2))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
          MOLogWrite();
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_QWORD *)(a2 + 8);
        NSHashInsertKnownAbsent(*(NSHashTable **)(a1 + 32), v4);
      }
    }
  }
  return 1;
}

- (BOOL)setModificationDateToNowForURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = objc_retainAutorelease(a3);
  v6 = open((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 256);
  if (v6 < 0)
  {
    v15 = *__error();
    v16 = (void *)*MEMORY[0x24BDD1128];
    objc_msgSend(v5, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v15);
    _CreateError((uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]", 2679, v16, v15, 0, 0, CFSTR("open() failed for %@: %s"), v18, (uint64_t)v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = futimes(v6, 0);
  v9 = v8 == 0;
  if (v8)
  {
    v10 = *__error();
    v11 = (void *)*MEMORY[0x24BDD1128];
    objc_msgSend(v5, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    strerror(v10);
    _CreateError((uint64_t)"-[MIFileManager setModificationDateToNowForURL:error:]", 2685, v11, v10, 0, 0, CFSTR("futimes() failed for %@: %s"), v13, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  close(v7);
  if (a4)
  {
LABEL_8:
    if (!v9)
      *a4 = objc_retainAutorelease(v14);
  }
LABEL_10:

  return v9;
}

- (id)modificationDateForURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  v5 = objc_retainAutorelease(a3);
  if (lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v11))
  {
    if (a4)
    {
      v6 = *__error();
      v7 = (void *)*MEMORY[0x24BDD1128];
      objc_msgSend(v5, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v6);
      _CreateError((uint64_t)"-[MIFileManager modificationDateForURL:error:]", 2710, v7, v6, 0, 0, CFSTR("lstat() failed for %@: %s"), v9, (uint64_t)v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v11.st_mtimespec.tv_nsec / 1000000000.0 + (double)v11.st_mtimespec.tv_sec);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return a4;
}

- (id)debugDescriptionForItemAtURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  id v47;
  id v48;
  stat v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDD16A8]);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Extra info about \"%@\": "), v6);

  memset(&v49, 0, sizeof(v49));
  v8 = objc_retainAutorelease(v4);
  if (lstat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v49))
  {
    v9 = *__error();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("Couldn't stat %@: %s"), v10, strerror(v9));

    v11 = (void *)objc_msgSend(v7, "copy");
    goto LABEL_50;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("dev=%d ino=%llu mode=0%ho nlink=%hu uid=%u gid=%u rdev=%d size=%lld atime=%lf mtime=%lf ctime=%lf birthtime=%lf blksize=%d blocks=%lld flags=0x%x "), v49.st_dev, v49.st_ino, v49.st_mode, v49.st_nlink, v49.st_uid, v49.st_gid, v49.st_rdev, v49.st_size, (double)v49.st_atimespec.tv_nsec / 1000000000.0 + (double)v49.st_atimespec.tv_sec, (double)v49.st_mtimespec.tv_nsec / 1000000000.0 + (double)v49.st_mtimespec.tv_sec, (double)v49.st_ctimespec.tv_nsec / 1000000000.0 + (double)v49.st_ctimespec.tv_sec, (double)v49.st_birthtimespec.tv_nsec / 1000000000.0 + (double)v49.st_birthtimespec.tv_sec, v49.st_blksize, v49.st_blocks, v49.st_flags);
  if ((v49.st_mode & 0xF000) == 0x8000)
  {
    v48 = 0;
    -[MIFileManager upToFirstFourBytesFromURL:error:](self, "upToFirstFourBytesFromURL:error:", v8, &v48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v48;
    if (v12)
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("firstBytes=%@ "), v12);
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v8, "path");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v13;
        MOLogWrite();

      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  v47 = v13;
  -[MIFileManager aclTextFromURL:error:](self, "aclTextFromURL:error:", v8, &v47, v33, v37);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v47;

  if (v14)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("ACL={ %@ } "), v14);
    goto LABEL_22;
  }
  objc_msgSend(v15, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDD1128]))
  {

    goto LABEL_18;
  }
  v17 = objc_msgSend(v15, "code");

  if (v17 != 2)
  {
LABEL_18:
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v34 = v15;
      MOLogWrite();
    }
    goto LABEL_21;
  }
  objc_msgSend(v7, "appendString:", CFSTR("ACL=<not found> "));
LABEL_21:

  v15 = 0;
LABEL_22:
  v46 = v15;
  -[MIFileManager extendedAttributesFromURL:error:](self, "extendedAttributesFromURL:error:", v8, &v46, v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v46;

  if (!v18)
  {
    objc_msgSend(v19, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v21 = objc_msgSend(v19, "code");

      if (v21 == 140)
      {
        objc_msgSend(v7, "appendString:", CFSTR("extendedAttributes=<not found> "));
LABEL_31:

        v19 = 0;
        goto LABEL_32;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v35 = v19;
      MOLogWrite();
    }
    goto LABEL_31;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("extendedAttributes=%@ "), v18);
LABEL_32:
  objc_msgSend(v8, "pathExtension", v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("plist"));

  if (v23)
  {
    v45 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "MI_dictionaryWithContentsOfURL:options:error:", v8, 0, &v45);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v45;

    if (v24)
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("keyCount=%lu "), objc_msgSend(v24, "count"));
      if (objc_msgSend(v24, "count"))
      {
        v39 = v25;
        v40 = v14;
        objc_msgSend(v7, "appendString:", CFSTR("keySample={ "));
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v26 = v24;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v27)
        {
          v28 = v27;
          v29 = 0;
          v30 = *(_QWORD *)v42;
LABEL_37:
          v31 = 0;
          while (1)
          {
            if (*(_QWORD *)v42 != v30)
              objc_enumerationMutation(v26);
            objc_msgSend(v7, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v31));
            if (v29 + v31 == 4)
              break;
            if (v28 == ++v31)
            {
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
              v29 += v31;
              if (v28)
                goto LABEL_37;
              break;
            }
          }
        }

        objc_msgSend(v7, "appendString:", CFSTR("} "));
        v25 = v39;
        v14 = v40;
      }
    }
    else
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        objc_msgSend(v8, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v25;
        MOLogWrite();

      }
      v25 = 0;
    }

    v19 = v25;
  }
  v11 = (void *)objc_msgSend(v7, "copy", v36, v38);

LABEL_50:
  return v11;
}

- (void)logAccessPermissionsForURL:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t st_mode;
  char *st_gid;
  void *st_uid;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v32;
  stat v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "MI_allAccessURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    v29 = *MEMORY[0x24BDD1128];
    v30 = v3;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v7);
        memset(&v33, 0, sizeof(v33));
        v9 = objc_retainAutorelease(v8);
        if (!lstat((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v33))
        {
          v32 = 0;
          -[MIFileManager aclTextFromURL:error:](self, "aclTextFromURL:error:", v9, &v32);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v32;
          v11 = v13;
          if (v12)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              st_mode = v33.st_mode;
              st_uid = (void *)v33.st_uid;
              st_gid = (char *)v33.st_gid;
              objc_msgSend(v9, "path", v24, v25);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v17;
              v28 = v12;
              v25 = st_gid;
              v26 = st_mode;
              v24 = st_uid;
              MOLogWrite();
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          objc_msgSend(v13, "domain");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqualToString:", v29))
          {
            v19 = objc_msgSend(v11, "code");

            if (v19 == 2)
              goto LABEL_21;
          }
          else
          {

          }
          if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            objc_msgSend(v9, "path", v24, v25, v26, v27, v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (char *)v11;
            MOLogWrite();

          }
LABEL_21:

          if (gLogHandle && *(int *)(gLogHandle + 44) < 5)
          {
            v11 = 0;
          }
          else
          {
            v20 = v33.st_mode;
            v21 = (void *)v33.st_uid;
            v22 = (char *)v33.st_gid;
            objc_msgSend(v9, "path", v24, v25);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v20;
            v27 = v17;
            v24 = v21;
            v25 = v22;
            MOLogWrite();
            v11 = 0;
LABEL_24:

            v3 = v30;
          }
LABEL_25:

          goto LABEL_26;
        }
        v10 = *__error();
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          objc_msgSend(v9, "path", v24, v25);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v11;
          v25 = strerror(v10);
          MOLogWrite();
LABEL_26:

        }
        ++v7;
      }
      while (v5 != v7);
      v23 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v5 = v23;
    }
    while (v23);
  }

}

+ (id)_sanitizeFilePathForVarOrTmpSymlink:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  id v20;
  id v21;

  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("/var")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/var/"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v7, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v6, 0, 1, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    if (v8)
    {
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("/var");
LABEL_7:
      objc_msgSend(v5, "substringFromIndex:", -[__CFString length](v12, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v16 = 0;
      goto LABEL_13;
    }
    v17 = CFSTR("Failed to get the real path of /var");
    v18 = 2846;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("/tmp")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", CFSTR("/tmp/"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v13, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v6, 0, 1, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v20;

    if (v8)
    {
      objc_msgSend(v8, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("/tmp");
      goto LABEL_7;
    }
    v17 = CFSTR("Failed to get the real path of /tmp");
    v18 = 2856;
LABEL_12:
    _CreateAndLogError((uint64_t)"+[MIFileManager _sanitizeFilePathForVarOrTmpSymlink:error:]", v18, CFSTR("MIInstallerErrorDomain"), 4, v9, 0, v17, v10, (uint64_t)v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
LABEL_13:

    if (!a4)
      goto LABEL_16;
    goto LABEL_14;
  }
  v15 = v5;
  v16 = 0;
  if (!a4)
    goto LABEL_16;
LABEL_14:
  if (!v15)
    *a4 = objc_retainAutorelease(v16);
LABEL_16:

  return v15;
}

- (BOOL)secureRenameFromSourceURL:(id)a3 toDestinationURL:(id)a4 destinationStatus:(unsigned __int8)a5 error:(id *)a6
{
  int v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  id v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  id v44;
  const char *v45;
  id v46;
  int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  _BOOL4 v53;
  void *v54;
  int v55;
  int v56;
  unsigned int v57;
  id v58;
  void *v59;
  id *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v62 = v10;
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v11;
  objc_msgSend(v11, "URLByDeletingLastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend(v12, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(v14, "_sanitizeFilePathForVarOrTmpSymlink:error:", v15, &v65);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v65;

  if (!v16)
  {
    objc_msgSend(v12, "path");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2888, CFSTR("MIInstallerErrorDomain"), 4, v17, 0, CFSTR("Failed to sanitize source file path %@"), v29, (uint64_t)v23);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v22 = v17;
LABEL_10:
    v33 = v62;
    goto LABEL_30;
  }
  v60 = a6;
  v18 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
  v19 = (void *)objc_opt_class();
  objc_msgSend(v13, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v17;
  objc_msgSend(v19, "_sanitizeFilePathForVarOrTmpSymlink:error:", v20, &v64);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v64;

  if (!v21)
  {
    objc_msgSend(v13, "path");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2895, CFSTR("MIInstallerErrorDomain"), 4, v22, 0, CFSTR("Failed to sanitize destination file path %@"), v32, (uint64_t)v23);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    a6 = v60;
    goto LABEL_10;
  }
  v58 = v22;
  v59 = v13;
  v23 = objc_retainAutorelease(v21);
  v24 = (const char *)objc_msgSend(v23, "fileSystemRepresentation");
  v25 = open(v18, 537919488);
  if ((v25 & 0x80000000) != 0)
  {
    v34 = *__error();
    v35 = (void *)*MEMORY[0x24BDD1128];
    v36 = v34;
    strerror(v34);
    _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2903, v35, v36, 0, 0, CFSTR("Failed to open file %s : %s"), v37, (uint64_t)v18);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v25;
    v27 = open(v24, 537919488);
    if ((v27 & 0x80000000) == 0)
    {
      v28 = v27;
      if (v7 == 2)
      {
        v53 = 0;
        v57 = 4;
      }
      else
      {
        if (v7 != 1)
        {
          v42 = v61;
          v53 = -[MIFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v61);
          if (v53)
            v43 = 2;
          else
            v43 = 4;
          v57 = v43;
LABEL_20:
          objc_msgSend(v62, "lastPathComponent");
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v45 = (const char *)objc_msgSend(v44, "fileSystemRepresentation");
          objc_msgSend(v42, "lastPathComponent");
          v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LODWORD(v45) = renameatx_np(v26, v45, v28, (const char *)objc_msgSend(v46, "fileSystemRepresentation"), v57);
          v31 = (_DWORD)v45 == 0;

          v55 = v28;
          v56 = v26;
          if ((_DWORD)v45)
          {
            v47 = *__error();
            v54 = (void *)*MEMORY[0x24BDD1128];
            objc_msgSend(v62, "path");
            v30 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "path");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            strerror(v47);
            _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2929, v54, v47, 0, 0, CFSTR("Failed to renameatx_np() for source fd %d path \"%@\" to destination fd %d path \"%@\" with flags 0x%x, Error: %s"), v49, v26);
            v50 = objc_claimAutoreleasedReturnValue();
            a6 = v60;
          }
          else
          {
            if (!v53)
            {
              v30 = 0;
              a6 = v60;
              goto LABEL_28;
            }
            v63 = 0;
            v33 = v62;
            v51 = -[MIFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v62, &v63);
            v30 = v63;
            a6 = v60;
            if (v51)
            {
              v13 = v59;
LABEL_29:
              v22 = v58;
              close(v56);
              close(v55);
              goto LABEL_30;
            }
            if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
            {
              v50 = 0;
              goto LABEL_23;
            }
            objc_msgSend(v62, "path");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            MOLogWrite();
            v50 = 0;
          }

LABEL_23:
          v30 = (id)v50;
LABEL_28:
          v13 = v59;
          v33 = v62;
          goto LABEL_29;
        }
        v57 = 2;
        v53 = 1;
      }
      v42 = v61;
      goto LABEL_20;
    }
    v38 = *__error();
    v39 = (void *)*MEMORY[0x24BDD1128];
    v40 = v38;
    strerror(v38);
    _CreateError((uint64_t)"-[MIFileManager secureRenameFromSourceURL:toDestinationURL:destinationStatus:error:]", 2910, v39, v40, 0, 0, CFSTR("Failed to open file %s : %s"), v41, (uint64_t)v24);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    close(v26);
  }
  v31 = 0;
  v13 = v59;
  a6 = v60;
  v33 = v62;
LABEL_30:

  if (a6 && !v31)
    *a6 = objc_retainAutorelease(v30);

  return v31;
}

- (void)_moveItemAtURL:(uint64_t)a3 toURL:(uint64_t)a4 failIfSrcMissing:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_222ED3000, MEMORY[0x24BDACB70], a3, "%s: Expected to move %s to %s but got EXDEV; falling back to copyfile",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void __124__MIFileManager__stageURLByCopying_toItemName_inStagingDir_stagingMode_settingUID_gid_dataProtectionClass_hasSymlink_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_222ED3000, MEMORY[0x24BDACB70], a3, "%s: Attempt to clone %s to %s failed with EXDEV; falling back to copyfile",
    a5,
    a6,
    a7,
    a8,
    2u);
}

@end
