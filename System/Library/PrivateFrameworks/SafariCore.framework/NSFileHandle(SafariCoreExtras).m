@implementation NSFileHandle(SafariCoreExtras)

+ (id)safari_fileHandleWithURL:()SafariCoreExtras options:createMode:error:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v10 = a3;
  if ((objc_msgSend(v10, "isFileURL") & 1) == 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1000, 0);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), a4, a5);
  if ((v12 & 0x80000000) != 0)
  {
    if (a6)
    {
      __error();
      objc_msgSend(v11, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _NSErrorWithFilePathAndErrno();
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  v13 = (void *)objc_msgSend([a1 alloc], "initWithFileDescriptor:closeOnDealloc:", v12, 1);
LABEL_9:

  return v13;
}

+ (_QWORD)safari_fileHandleWithSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:
{
  id v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v13, "fileDescriptor");
  v15 = objc_retainAutorelease(v12);
  v16 = openat(v14, (const char *)objc_msgSend(v15, "fileSystemRepresentation"), a5, a6);
  if ((v16 & 0x80000000) != 0)
  {
    if (a7)
    {
      __error();
      objc_msgSend(v13, "safari_fileURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "URLByAppendingPathComponent:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _NSErrorWithFilePathAndErrno();
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
    a7 = (_QWORD *)objc_msgSend([a1 alloc], "initWithFileDescriptor:closeOnDealloc:", v16, 1);
  }

  return a7;
}

+ (id)safari_fileHandleByCreatingFileWithUniqueSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:
{
  id v12;
  id v13;
  WBSUniqueFilenameEnumerator *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v28;
  objc_class *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v14 = -[WBSUniqueFilenameEnumerator initWithFilename:]([WBSUniqueFilenameEnumerator alloc], "initWithFilename:", v12);
  v15 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v15)
  {
    v16 = v15;
    v28 = a7;
    v29 = a1;
    v17 = *(_QWORD *)v31;
    v18 = a5 | 0xA00;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v21 = objc_msgSend(v13, "fileDescriptor");
        v22 = objc_retainAutorelease(v20);
        v23 = openat(v21, (const char *)objc_msgSend(v22, "fileSystemRepresentation"), v18, a6);
        if ((int)v23 > 0)
        {
          v24 = (void *)objc_msgSend([v29 alloc], "initWithFileDescriptor:closeOnDealloc:", v23, 1);
          goto LABEL_15;
        }
        if (*__error() != 17)
        {
          if (v28)
          {
            objc_msgSend(v13, "safari_fileURL");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "URLByAppendingPathComponent:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            _NSErrorWithFilePathAndErrno();
            *v28 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_14;
        }
      }
      v16 = -[WBSUniqueFilenameEnumerator countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v24 = 0;
      if (v16)
        continue;
      break;
    }
  }
  else
  {
LABEL_14:
    v24 = 0;
  }
LABEL_15:

  return v24;
}

- (id)safari_fileURL
{
  int v1;
  BOOL v3;
  uint64_t v4;
  stat v5;
  _BYTE v6[1026];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "fileDescriptor");
  bzero(v6, 0x402uLL);
  if (realpath_np())
    return 0;
  memset(&v5, 0, sizeof(v5));
  if (fstat(v1, &v5))
    v3 = 0;
  else
    v3 = (v5.st_mode & 0xF000) == 0x4000;
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v6, v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
