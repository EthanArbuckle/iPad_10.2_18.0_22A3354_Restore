@implementation PHPhotoLibrary(PGApplicationData)

- (id)pg_urlForGraphApplicationData
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  char v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photoanalysisd")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("LifeCipher")) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("graphctl")))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v17 = 0;
    objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v8)
    {
      v9 = v8;
      v4 = 0;
LABEL_8:
      v10 = (void *)MEMORY[0x1E0C99E98];
      NSTemporaryDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURLWithPath:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v12;
LABEL_9:

      goto LABEL_5;
    }
    objc_msgSend(v7, "URLByAppendingPathComponent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v13, &v16);

    if ((v14 & 1) != 0)
    {
      if (!v16)
      {

        v4 = 0;
        v9 = 0;
        goto LABEL_8;
      }
      v9 = 0;
    }
    else
    {
      v15 = 0;
      objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v15);
      v9 = v15;
    }
    if (v4 && !v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(a1, "urlForApplicationDataFolderIdentifier:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v4;
}

@end
