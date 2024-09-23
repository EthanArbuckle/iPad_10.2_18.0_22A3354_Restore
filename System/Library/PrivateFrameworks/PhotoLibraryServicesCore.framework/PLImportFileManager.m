@implementation PLImportFileManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pathManager);
}

- (PLImportFileManager)initWithPathManager:(id)a3
{
  id v4;
  PLImportFileManager *v5;
  PLImportFileManager *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLImportFileManager;
  v5 = -[PLImportFileManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_pathManager, v4);
    }
    else
    {
      +[PLPhotoLibraryPathManager systemLibraryPathManager](PLPhotoLibraryPathManager, "systemLibraryPathManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v6->_pathManager, v7);

    }
  }

  return v6;
}

- (PLImportFileManager)init
{
  return -[PLImportFileManager initWithPathManager:](self, "initWithPathManager:", 0);
}

- (id)_dcimDirectory
{
  PLPhotoDCIMDirectory *v3;
  id WeakRetained;
  void *v5;
  PLPhotoDCIMDirectory *v6;

  v3 = [PLPhotoDCIMDirectory alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_pathManager);
  objc_msgSend(WeakRetained, "photoDirectoryWithType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLPhotoDCIMDirectory initWithDCIMPath:](v3, "initWithDCIMPath:", v5);

  return v6;
}

- (id)_DCIMFolderNameWithNumber:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  if (a3 < 0)
  {
    v7 = 0;
  }
  else
  {
    v4 = objc_msgSend(CFSTR("IMPRT"), "length");
    v5 = vcvtpd_s64_f64(log10((double)(a3 + 1)));
    if (v5 >= 4 && objc_msgSend(CFSTR("IMPRT"), "length") + 3 >= (unint64_t)v5)
    {
      v6 = v5 - 3;
      v4 -= v6;
    }
    else
    {
      v6 = 0;
    }
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(CFSTR("IMPRT"), "substringWithRange:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%03li%@"), a3, v9);

  }
  if (objc_msgSend(v7, "length") != 8)
  {

    v7 = 0;
  }
  return v7;
}

- (id)urlForNewDCIMFolderWithFolderNumber:(int64_t *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  id v24;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pathManager);
  objc_msgSend(WeakRetained, "photoDirectoryWithType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLImportFileManager _dcimDirectory](self, "_dcimDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockDirectory");
  objc_msgSend(v6, "userInfoObjectForKey:", CFSTR("LastImportDirectoryNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if ((unint64_t)(v8 - 99999999) >= 0xFFFFFFFFFA0A1F65)
    v9 = v8 + 1;
  else
    v9 = 100;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImportFileManager _DCIMFolderNameWithNumber:](self, "_DCIMFolderNameWithNumber:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "fileExistsAtPath:", v12))
    v13 = v9 < 99999999;
  else
    v13 = 0;
  if (v13)
  {
    while ((objc_msgSend(v10, "removeDirectoryAtPathIfEmpty:ancestors:", v12, 0) & 1) == 0)
    {
      v14 = v9 + 1;
      -[PLImportFileManager _DCIMFolderNameWithNumber:](self, "_DCIMFolderNameWithNumber:", v9 + 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "stringByAppendingPathComponent:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "fileExistsAtPath:", v16))
      {
        v12 = v16;
        v11 = v15;
        v13 = v9++ < 99999998;
        if (v13)
          continue;
      }
      goto LABEL_9;
    }
  }
  v14 = v9;
  v15 = v11;
  v16 = v12;
LABEL_9:
  if ((objc_msgSend(v10, "fileExistsAtPath:", v16) & 1) != 0)
  {
    NSLog((NSString *)CFSTR("Error: Directory already exists"));
    v17 = 0;
  }
  else
  {
    v24 = 0;
    v18 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v24);
    v19 = v24;
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setUserInfoObject:forKey:", v21, CFSTR("LastImportDirectoryNumber"));

      objc_msgSend(v6, "saveUserInfo");
      if (a3)
        *a3 = v14;
    }
    else
    {
      NSLog((NSString *)CFSTR("Error creating directory: %@"), v19);
      v17 = 0;
    }

  }
  objc_msgSend(v6, "unlockDirectory");

  return v17;
}

- (id)nextAvailableFilePathInDirectory:(id)a3 withExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PLImportFileManager *v28;
  void *v29;
  void *v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  -[PLImportFileManager _dcimDirectory](self, "_dcimDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lockDirectory");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EditedVideoLastFileGroupNumber-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userInfoObjectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = objc_msgSend(v11, "integerValue") + 1;
  else
    v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v11;
  v31 = v8;
  if (v12 > 998)
    goto LABEL_8;
  v28 = self;
  v29 = v9;
  v14 = 0;
  do
  {
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EDT_%04ld"), v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  while ((objc_msgSend(v13, "fileExistsAtPath:", v14) & 1) != 0);
  v8 = v31;
  self = v28;
  v9 = v29;
  if (!v14)
  {
LABEL_8:
    -[PLImportFileManager urlForNewDCIMFolderWithFolderNumber:](self, "urlForNewDCIMFolderWithFolderNumber:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v19 = v18;
    objc_msgSend(v18, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v9;
    v9 = (void *)v21;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EDT_%04ld"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingPathComponent:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathExtension:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v11 = v30;
      v8 = v31;
      goto LABEL_14;
    }
    v12 = 0;
    v29 = v9;
    v11 = v30;
    v8 = v31;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EditedVideoLastFileGroupNumber-%@"), v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfoObject:forKey:", v25, v26);

  objc_msgSend(v8, "saveUserInfo");
  v9 = v29;
LABEL_14:
  objc_msgSend(v8, "unlockDirectory");

  return v14;
}

- (BOOL)removeUnusedDCIMDirectoryAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;

  v4 = a3;
  -[PLImportFileManager _dcimDirectory](self, "_dcimDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockDirectory");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "removeDirectoryAtPathIfEmpty:ancestors:", v4, 0);

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3900]);
    objc_msgSend(v4, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

    objc_msgSend(v10, "setScanLocation:", 0);
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v10, "scanCharactersFromSet:intoString:", v11, &v18);
    v12 = v18;

    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "integerValue");
      objc_msgSend(v5, "userInfoObjectForKey:", CFSTR("LastImportDirectoryNumber"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "integerValue");

      if (v13 == v15 && v15 != 100)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 - 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setUserInfoObject:forKey:", v16, CFSTR("LastImportDirectoryNumber"));

        objc_msgSend(v5, "saveUserInfo");
      }
    }

  }
  objc_msgSend(v5, "unlockDirectory");

  return v7;
}

+ (BOOL)isImportDirectoryFolderName:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  BOOL v7;

  v3 = a3;
  v7 = 0;
  if (objc_msgSend(v3, "length") == 8
    && objc_msgSend(v3, "characterAtIndex:", 0) >= 0x30
    && objc_msgSend(v3, "characterAtIndex:", 0) <= 0x39)
  {
    v4 = objc_msgSend(v3, "intValue");
    if ((v4 - 100000000) >= 0xFA0A1F64)
    {
      if ((uint64_t)vcvtpd_s64_f64(log10((double)(v4 + 1))) > 7
        || (objc_msgSend(v3, "substringFromIndex:"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(CFSTR("IMPRT"), "hasSuffix:", v5),
            v5,
            v6))
      {
        v7 = 1;
      }
    }
  }

  return v7;
}

+ (BOOL)isCameraDirectoryFolderName:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  pl_dispatch_once(&isCameraDirectoryFolderName__onceToken, &__block_literal_global_4561);
  v4 = objc_msgSend((id)isCameraDirectoryFolderName__gCameraDirectoryExpression, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  return v4 == 1;
}

void __51__PLImportFileManager_isCameraDirectoryFolderName___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("[1-9][0-9][0-9]APPLE"), 0, 0);
  v1 = (void *)isCameraDirectoryFolderName__gCameraDirectoryExpression;
  isCameraDirectoryFolderName__gCameraDirectoryExpression = v0;

}

@end
