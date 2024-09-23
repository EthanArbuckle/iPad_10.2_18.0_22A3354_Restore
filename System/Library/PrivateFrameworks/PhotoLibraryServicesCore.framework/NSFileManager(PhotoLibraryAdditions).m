@implementation NSFileManager(PhotoLibraryAdditions)

- (id)tmpFileForVideoTranscodeToPhotoDataDirectory:()PhotoLibraryAdditions withExtension:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  +[PLUUIDString UUIDString](PLUUIDString, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("trim.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    +[PLPhotoLibraryPathManager systemLibraryPathManager](PLPhotoLibraryPathManager, "systemLibraryPathManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "privateDirectoryWithSubType:createIfNeeded:error:", 2, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v11, "stringByAppendingPathExtension:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (uint64_t)directoryExistsAtPath:()PhotoLibraryAdditions
{
  unsigned __int8 v4;

  v4 = 0;
  objc_msgSend(a1, "fileExistsAtPath:isDirectory:", a3, &v4);
  return v4;
}

- (uint64_t)removeDirectoryAtPathIfEmpty:()PhotoLibraryAdditions ancestors:
{
  id v6;
  void *v7;
  char v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  v7 = v6;
  if (a4 < 0 || (unint64_t)objc_msgSend(v6, "length") < 2)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = a4 + 1;
    v10 = v7;
    while (1)
    {
      if (!objc_msgSend(a1, "directoryExistsAtPath:", v10)
        || (objc_msgSend(a1, "contentsOfDirectoryAtPath:error:", v10, 0),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "count"),
            v11,
            v12)
        || !objc_msgSend(a1, "removeItemAtPath:error:", v10, 0))
      {
        v7 = v10;
        goto LABEL_13;
      }
      objc_msgSend(v10, "stringByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (--v9 <= 0)
        break;
      v8 = 1;
      v10 = v7;
      if ((unint64_t)objc_msgSend(v7, "length") < 2)
        goto LABEL_13;
    }
    v8 = 1;
  }
LABEL_13:

  return v8 & 1;
}

- (uint64_t)createDirectoryIfNeededAtPath:()PhotoLibraryAdditions error:
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v14 = 0;
    v7 = objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v14);
    v8 = v14;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB28A8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid filename: %@"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 514, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if ((v7 & 1) == 0)
    *a4 = objc_retainAutorelease(v8);
LABEL_7:

  return v7;
}

@end
