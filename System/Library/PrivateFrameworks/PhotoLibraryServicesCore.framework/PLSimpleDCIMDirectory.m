@implementation PLSimpleDCIMDirectory

- (PLSimpleDCIMDirectory)initWithDirectoryURL:(id)a3 subDirectorySuffix:(id)a4 perDirectoryLimit:(unint64_t)a5 userInfoPath:(id)a6
{
  id v11;
  id v12;
  id v13;
  PLSimpleDCIMDirectory *v14;
  PLSimpleDCIMDirectory *v15;
  unint64_t v16;
  NSFileManager *v17;
  NSFileManager *fileManager;
  dispatch_queue_t v19;
  OS_dispatch_queue *isolation;
  uint64_t v21;
  NSString *v22;
  NSString *v23;
  uint64_t v24;
  NSString *subDirSuffix;
  PLSimpleDCIMDirectory *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *userInfoPath;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PLSimpleDCIMDirectory;
  v14 = -[PLSimpleDCIMDirectory init](&v32, sel_init);
  v15 = v14;
  if (!v14)
  {
LABEL_12:
    v26 = v15;
    goto LABEL_13;
  }
  v16 = 2000;
  if (a5)
    v16 = a5;
  v14->_directoryLimit = v16;
  objc_storeStrong((id *)&v14->_baseURL, a3);
  v17 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
  fileManager = v15->_fileManager;
  v15->_fileManager = v17;

  if (-[PLSimpleDCIMDirectory _ensureDirectoryExists:](v15, "_ensureDirectoryExists:", v15->_baseURL))
  {
    v19 = dispatch_queue_create("com.apple.assetsd.PLSimpleDCIMDirectory", 0);
    isolation = v15->_isolation;
    v15->_isolation = (OS_dispatch_queue *)v19;

    if (v12)
    {
      v21 = objc_msgSend(v12, "length");
      objc_msgSend(v12, "uppercaseString");
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v21 == 5)
      {
        v24 = -[NSString copy](v22, "copy");
        subDirSuffix = v15->_subDirSuffix;
        v15->_subDirSuffix = (NSString *)v24;

      }
      else
      {
        -[NSString stringByPaddingToLength:withString:startingAtIndex:](v22, "stringByPaddingToLength:withString:startingAtIndex:", 5, CFSTR("X"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "substringToIndex:", 5);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v12, "copy");
        v23 = v15->_subDirSuffix;
        v15->_subDirSuffix = (NSString *)v28;
      }
    }
    else
    {
      v23 = v15->_subDirSuffix;
      v15->_subDirSuffix = (NSString *)CFSTR("APPLE");
    }

    v29 = objc_msgSend(v13, "copy");
    userInfoPath = v15->_userInfoPath;
    v15->_userInfoPath = (NSString *)v29;

    goto LABEL_12;
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (id)nextAvailableFileURLWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLSimpleDCIMDirectory _nextAvailableFileURLWithExtension:](self, "_nextAvailableFileURLWithExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_shouldCheckForExistingFiles)
  {
    while (objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
    {
      -[PLSimpleDCIMDirectory _nextAvailableFileURLWithExtension:](self, "_nextAvailableFileURLWithExtension:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      if (!self->_shouldCheckForExistingFiles)
        goto LABEL_6;
    }
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)_nextAvailableFileURLWithExtension:(id)a3
{
  id v5;
  NSObject *isolation;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9951;
  v21 = __Block_byref_object_dispose__9952;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  isolation = self->_isolation;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__PLSimpleDCIMDirectory__nextAvailableFileURLWithExtension___block_invoke;
  v12[3] = &unk_1E376C2B8;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  v12[7] = a2;
  pl_dispatch_sync(isolation, v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IMG_%04u"), v14[3]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "stringByAppendingPathExtension:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend((id)v18[5], "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

- (void)reset
{
  NSObject *isolation;
  _QWORD v3[5];

  isolation = self->_isolation;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__PLSimpleDCIMDirectory_reset__block_invoke;
  v3[3] = &unk_1E376C6E0;
  v3[4] = self;
  pl_dispatch_async(isolation, v3);
}

- (id)_currentSubDirectory
{
  NSMutableIndexSet *availableFileNameNumbers;
  _BOOL4 v4;
  NSMutableIndexSet *v5;
  NSURL *currentSubDirectoryURL;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  unint64_t v23;
  BOOL v24;
  int v25;
  void *v26;
  NSURL *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableIndexSet *v31;
  NSMutableIndexSet *v32;
  NSMutableIndexSet *v33;
  NSURL *v34;
  void *v36;
  void *v37;
  id obj;
  id v39;
  id v40;
  signed int v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!self->_currentSubDirectoryURL)
    goto LABEL_6;
  if (-[NSMutableIndexSet firstIndex](self->_availableFileNameNumbers, "firstIndex") != 0x7FFFFFFFFFFFFFFFLL)
    return self->_currentSubDirectoryURL;
  if (self->_currentSubDirectoryURL && (availableFileNameNumbers = self->_availableFileNameNumbers) != 0)
    v4 = -[NSMutableIndexSet firstIndex](availableFileNameNumbers, "firstIndex") == 0x7FFFFFFFFFFFFFFFLL;
  else
LABEL_6:
    v4 = 0;
  v5 = self->_availableFileNameNumbers;
  self->_availableFileNameNumbers = 0;

  currentSubDirectoryURL = self->_currentSubDirectoryURL;
  self->_currentSubDirectoryURL = 0;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v37, "addIndex:", self->_currentSubDirectoryNumber + 1);
  self->_currentSubDirectoryNumber = 100;
  v7 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", self->_baseURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_representsCameraRoll)
    v9 = 999;
  else
    v9 = 1000;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x19AEC2E4C]();
        v42 = 0;
        v16 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v42, v7, 0);
        v17 = v42;
        if (v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = -1;
          if (objc_msgSend(v18, "scanInt:", &v41)
            && v41 >= 0x64
            && v9 > v41
            && objc_msgSend(v18, "scanString:intoString:", self->_subDirSuffix, 0)
            && objc_msgSend(v18, "isAtEnd"))
          {
            objc_msgSend(v37, "addIndex:", v41);
          }

        }
        objc_autoreleasePoolPop(v15);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v11);
  }

  v19 = objc_msgSend(v37, "lastIndex");
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 100;
  else
    v20 = v19;
  v39 = 0;
  v40 = 0;
  -[PLSimpleDCIMDirectory _loadUserInfoLastUsedDirectoryNumber:lastUsedFileNumber:](self, "_loadUserInfoLastUsedDirectoryNumber:lastUsedFileNumber:", &v40, &v39);
  v21 = v40;
  v22 = v39;
  if (v21)
  {
    v23 = objc_msgSend(v21, "unsignedIntegerValue");
    if ((v23 != 999 || !self->_representsCameraRoll) && v20 <= v23)
      v20 = v23;
  }
  if (v21)
    v24 = v22 == 0;
  else
    v24 = 1;
  v25 = !v24;
  while (1)
  {
    v26 = (void *)MEMORY[0x19AEC2E4C]();
    LOBYTE(v41) = 0;
    -[PLSimpleDCIMDirectory _subDirURLForNumber:create:didCreate:](self, "_subDirURLForNumber:create:didCreate:", v20, 1, &v41);
    v27 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if ((_BYTE)v41)
    {
      v28 = (void *)MEMORY[0x1E0CB3788];
      v29 = -[PLSimpleDCIMDirectory _fileNameNumberRangeForDirNumber:](self, "_fileNameNumberRangeForDirNumber:", v20);
      objc_msgSend(v28, "indexSetWithIndexesInRange:", v29, v30);
    }
    else
    {
      -[PLSimpleDCIMDirectory _availableFileNameNumbersInDirNumber:](self, "_availableFileNameNumbersInDirNumber:", v20);
    }
    v31 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue();
    if (v25 && v20 == objc_msgSend(v21, "unsignedIntegerValue"))
      -[NSMutableIndexSet removeIndexesInRange:](v31, "removeIndexesInRange:", 1, objc_msgSend(v22, "unsignedIntegerValue"));
    if (-[NSMutableIndexSet firstIndex](v31, "firstIndex") != 0x7FFFFFFFFFFFFFFFLL)
      break;
    ++v20;

    objc_autoreleasePoolPop(v26);
  }
  v32 = self->_availableFileNameNumbers;
  self->_availableFileNameNumbers = v31;
  v33 = v31;

  v34 = self->_currentSubDirectoryURL;
  self->_currentSubDirectoryURL = v27;

  self->_currentSubDirectoryNumber = v20;
  objc_autoreleasePoolPop(v26);

  return self->_currentSubDirectoryURL;
}

- (id)_subDirURLForNumber:(unint64_t)a3 create:(BOOL)a4 didCreate:(BOOL *)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSFileManager *fileManager;
  BOOL v14;
  id v15;
  void *v16;
  id v18;
  id v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u%@"), a3, self->_subDirSuffix);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_baseURL, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    v19 = 0;
    v11 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v19, *MEMORY[0x1E0C99968], 0);
    v12 = v19;
    if (v11)
    {
      *a5 = 0;
    }
    else
    {
      *a5 = 1;
      fileManager = self->_fileManager;
      v18 = 0;
      v14 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](fileManager, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v18);
      v15 = v18;
      if (!v14)
      {
        objc_msgSend(v10, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog((NSString *)CFSTR("Unable to create directory at '%@': %@"), v16, v15);

      }
    }

  }
  return v10;
}

- (id)_availableFileNameNumbersInDirNumber:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  id v33;
  int v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3788];
  v6 = -[PLSimpleDCIMDirectory _fileNameNumberRangeForDirNumber:](self, "_fileNameNumberRangeForDirNumber:");
  objc_msgSend(v5, "indexSetWithIndexesInRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSimpleDCIMDirectory _subDirURLForNumber:create:didCreate:](self, "_subDirURLForNumber:create:didCreate:", a3, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:](self->_fileManager, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v10, 1, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v28 = v11;
    v29 = v10;
    v30 = v8;
    v31 = 0;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x19AEC2E4C]();
        v35 = 0;
        v20 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v35, v9, 0);
        v21 = v35;
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -1;
          v33 = 0;
          v23 = objc_msgSend(v22, "scanUpToCharactersFromSet:intoString:", v32, &v33);
          v24 = v33;
          v25 = v24;
          if (v23
            && objc_msgSend(v24, "length") == 4
            && objc_msgSend(v22, "scanInt:", &v34)
            && v34 >= 1
            && v34 <= 9999
            && objc_msgSend(v22, "scanString:intoString:", CFSTR("."), 0))
          {
            v26 = v31;
            if (v31 <= v34)
              v26 = v34;
            v31 = v26;
          }

        }
        objc_autoreleasePoolPop(v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);

    v10 = v29;
    v8 = v30;
    v11 = v28;
    if (v31)
      objc_msgSend(v30, "removeIndexesInRange:", 1);
  }
  else
  {

  }
  return v8;
}

- (_NSRange)_fileNameNumberRangeForDirNumber:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = (1000 * a3 - 100000) % 0x2710;
  v4 = v3 | 1;
  v5 = v3 + self->_directoryLimit;
  if (v5 >= 0x270F)
    v5 = 9999;
  v6 = v5 - v4 + 1;
  v7 = v4;
  result.length = v6;
  result.location = v7;
  return result;
}

- (void)_saveUserInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_userInfoPath)
  {
    v3 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentSubDirectoryNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableIndexSet firstIndex](self->_availableFileNameNumbers, "firstIndex"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("DCIMLastDirectoryNumber"), v5, CFSTR("DCIMLastFileNumber"), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeToFile:options:error:", self->_userInfoPath, 1073741825, 0);

  }
}

- (void)_loadUserInfoLastUsedDirectoryNumber:(id *)a3 lastUsedFileNumber:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  if (!self->_hasLoadedUserInfo && self->_userInfoPath)
  {
    self->_hasLoadedUserInfo = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("DCIMLastDirectoryNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("DCIMLastFileNumber"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    if (a4)
      *a4 = objc_retainAutorelease(v7);

  }
}

- (BOOL)_ensureDirectoryExists:(id)a3
{
  id v4;
  NSFileManager *fileManager;
  void *v6;
  int v7;
  BOOL v8;
  NSFileManager *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  fileManager = self->_fileManager;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(fileManager) = -[NSFileManager fileExistsAtPath:isDirectory:](fileManager, "fileExistsAtPath:isDirectory:", v6, &v15);
  v7 = v15;

  if ((_DWORD)fileManager)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = self->_fileManager;
    v14 = 0;
    v12 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:](v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v14);
    v10 = v14;
    if ((v12 & 1) == 0)
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Unable to create DCIM dir: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (NSURL)directoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)representsCameraRoll
{
  return self->_representsCameraRoll;
}

- (void)setRepresentsCameraRoll:(BOOL)a3
{
  self->_representsCameraRoll = a3;
}

- (BOOL)shouldCheckForExistingFiles
{
  return self->_shouldCheckForExistingFiles;
}

- (void)setShouldCheckForExistingFiles:(BOOL)a3
{
  self->_shouldCheckForExistingFiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_userInfoPath, 0);
  objc_storeStrong((id *)&self->_currentSubDirectoryURL, 0);
  objc_storeStrong((id *)&self->_availableFileNameNumbers, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_subDirSuffix, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

void __30__PLSimpleDCIMDirectory_reset__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

uint64_t __60__PLSimpleDCIMDirectory__nextAvailableFileURLWithExtension___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_currentSubDirectory");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureDirectoryExists:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "firstIndex");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PLSimpleDCIMDirectory.m"), 115, CFSTR("Directory without available file name index"));

  }
  objc_msgSend(*(id *)(a1 + 32), "_saveUserInfo");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
}

+ (id)migrateOldPlistToNewPlist:(id)a3
{
  id v3;
  unsigned int v4;
  int v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = -1;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = -1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PLSimpleDCIMDirectory_migrateOldPlistToNewPlist___block_invoke;
    v11[3] = &unk_1E376C290;
    v11[4] = &v16;
    v11[5] = &v12;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v11);
    v4 = *((_DWORD *)v17 + 6);
    if (v4 == -1 || (v5 = *((_DWORD *)v13 + 6), v5 == -1) || v4 <= 0x64 && v5 < 1)
    {
      v6 = 0;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C99D80];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v13 + 6));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v9, CFSTR("DCIMLastDirectoryNumber"), v10, CFSTR("DCIMLastFileNumber"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)cameraRollPlistName
{
  return CFSTR("DCIM_APPLE.plist");
}

+ (id)cloudPlistName
{
  return CFSTR("DCIM_CLOUD.plist");
}

void __51__PLSimpleDCIMDirectory_migrateOldPlistToNewPlist___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("LastFileGroupNumber")))
  {
    objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v9, "length") - 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v7 > *(_DWORD *)(v8 + 24))
    {
      *(_DWORD *)(v8 + 24) = v7;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "intValue");
    }

  }
}

@end
