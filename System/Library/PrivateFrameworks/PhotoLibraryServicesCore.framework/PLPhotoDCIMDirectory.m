@implementation PLPhotoDCIMDirectory

- (id)_userInfoPath
{
  void *v2;
  void *v3;

  -[PLPhotoDCIMDirectory miscPath](self, "miscPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Info.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLPhotoDCIMDirectory)initWithDCIMPath:(id)a3
{
  id v4;
  PLPhotoDCIMDirectory *v5;
  PLPhotoDCIMDirectory *v6;
  uint64_t v7;
  NSString *dcimPath;
  void *v9;
  void *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoDCIMDirectory;
  v5 = -[PLPhotoDCIMDirectory init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = objc_msgSend(v4, "copy");
      dcimPath = v6->_dcimPath;
      v6->_dcimPath = (NSString *)v7;

      v13 = *MEMORY[0x1E0CB2AA8];
      v14[0] = &unk_1E378F1E8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v9, 0);

      v6->_lastUsedDirectoryNumber = 100;
      v6->_dcimDirectoryLockDescriptor = -1;
    }
    else
    {
      v9 = v5;
      v6 = 0;
    }

  }
  return v6;
}

- (void)dealloc
{
  __CFDictionary *topLevelDirectoriesByNumber;
  __CFSet *unusableTopLevelDirectoryNumbers;
  objc_super v5;

  -[PLPhotoDCIMDirectory saveUserInfo](self, "saveUserInfo");
  topLevelDirectoriesByNumber = self->_topLevelDirectoriesByNumber;
  if (topLevelDirectoriesByNumber)
    CFRelease(topLevelDirectoriesByNumber);
  unusableTopLevelDirectoryNumbers = self->_unusableTopLevelDirectoryNumbers;
  if (unusableTopLevelDirectoryNumbers)
    CFRelease(unusableTopLevelDirectoryNumbers);
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoDCIMDirectory;
  -[PLPhotoDCIMDirectory dealloc](&v5, sel_dealloc);
}

- (id)dcimPath
{
  return self->_dcimPath;
}

- (id)miscPath
{
  NSString *miscPath;
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  miscPath = self->_miscPath;
  if (!miscPath)
  {
    -[NSString stringByAppendingPathComponent:](self->_dcimPath, "stringByAppendingPathComponent:", CFSTR(".MISC"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_miscPath;
    self->_miscPath = v4;

    v9 = *MEMORY[0x1E0CB2AA8];
    v10[0] = &unk_1E378F1E8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", self->_miscPath, 1, v6, 0);

    miscPath = self->_miscPath;
  }
  return miscPath;
}

- (id)posterImagePath
{
  NSString *posterImagePath;
  void *v4;
  NSString *v5;
  NSString *v6;

  posterImagePath = self->_posterImagePath;
  if (!posterImagePath)
  {
    -[PLPhotoDCIMDirectory miscPath](self, "miscPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PosterImage.jpg"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_posterImagePath;
    self->_posterImagePath = v5;

    posterImagePath = self->_posterImagePath;
  }
  return posterImagePath;
}

- (void)saveUserInfo
{
  NSMutableDictionary *userInfo;
  void *v4;

  if (self->_userInfoDidChange)
  {
    userInfo = self->_userInfo;
    -[PLPhotoDCIMDirectory _userInfoPath](self, "_userInfoPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary writeToFile:atomically:](userInfo, "writeToFile:atomically:", v4, 0);

    self->_userInfoDidChange = 0;
  }
}

- (id)userInfo
{
  NSMutableDictionary *userInfo;
  void *v4;
  uint64_t v5;
  char v6;
  PLPhotoDCIMDirectory *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  PLPhotoDCIMDirectory *v22;
  void *v23;
  void *v24;
  PLPhotoDCIMDirectory *v25;
  void *v26;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id obj;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCIMDirectory _userInfoPath](self, "_userInfoPath");
    v5 = objc_claimAutoreleasedReturnValue();
    v31 = v4;
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);
    v7 = self;
    if ((v6 & 1) == 0)
      -[PLPhotoDCIMDirectory recreateInfoPlist](self, "recreateInfoPlist");
    v30 = (void *)v5;
    v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    v9 = self->_userInfo;
    self->_userInfo = v8;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[NSMutableDictionary allKeys](self->_userInfo, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v36;
      do
      {
        v14 = 0;
        v32 = v11;
        do
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
          v16 = (void *)MEMORY[0x19AEC2E4C]();
          if (objc_msgSend(v15, "hasPrefix:", CFSTR("LastFileGroupNumber")))
          {
            v17 = v13;
            v18 = v12;
            objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 3);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "intValue");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%03dAPPLE"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPhotoDCIMDirectory dcimPath](v7, "dcimPath");
            v22 = v7;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByAppendingPathComponent:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v7 = v22;
            v34 = 0;
            if (!objc_msgSend(v31, "fileExistsAtPath:isDirectory:", v24, &v34) || !v34)
            {
              -[NSMutableDictionary removeObjectForKey:](v22->_userInfo, "removeObjectForKey:", v15);
              v22->_userInfoDidChange = 1;
            }

            v12 = v18;
            v13 = v17;
            v11 = v32;
          }
          else
          {
            v12 = objc_msgSend(v15, "isEqualToString:", CFSTR("DCIMChangedExternally")) | v12;
          }
          objc_autoreleasePoolPop(v16);
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v11);
    }
    else
    {
      LOBYTE(v12) = 0;
    }

    v25 = v7;
    userInfo = v7->_userInfo;
    if (!userInfo)
    {
      v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v29 = v25->_userInfo;
      v25->_userInfo = v28;

      userInfo = v25->_userInfo;
      if ((v12 & 1) != 0)
        return userInfo;
      goto LABEL_21;
    }
    if ((v12 & 1) == 0)
    {
LABEL_21:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](userInfo, "setObject:forKey:", v26, CFSTR("DCIMChangedExternally"));

      userInfo = v25->_userInfo;
    }
  }
  return userInfo;
}

- (void)recreateInfoPlist
{
  void *v3;
  id v4;
  char v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  PLPhotoDCIMDirectory *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  unsigned int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v30 = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", self->_dcimPath, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3 && objc_msgSend(v3, "count"))
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v4 = v3;
    v34 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (!v34)
    {
LABEL_28:

      goto LABEL_29;
    }
    v28 = v3;
    obj = v4;
    v5 = 0;
    v33 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x19AEC2E4C]();
        v42 = 0;
        +[PLPhotoDCFObject validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:](PLPhotoDCFObject, "validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:", v7, 8, 8, &v42, 0, 3, CFSTR("APPLE"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v35 = v9;
          -[NSString stringByAppendingPathComponent:](v30->_dcimPath, "stringByAppendingPathComponent:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "contentsOfDirectoryAtPath:error:", v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          v36 = v8;
          v37 = i;
          if (v13)
          {
            v14 = v13;
            v15 = 0;
            LODWORD(v16) = 0;
            v17 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v39 != v17)
                  objc_enumerationMutation(v12);
                v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                v20 = (void *)MEMORY[0x19AEC2E4C]();
                objc_msgSend(v19, "stringByDeletingPathExtension");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "componentsSeparatedByString:", CFSTR("_"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if ((unint64_t)objc_msgSend(v22, "count") >= 2)
                {
                  objc_msgSend(v22, "objectAtIndex:", 1);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "intValue");

                  v15 = v24 + 100000 - 1000 * v42 + 10000 * ((int)(1000 * v42 - 100000) / 10000);
                }
                if ((int)v16 <= v15)
                  v16 = v15;
                else
                  v16 = v16;

                objc_autoreleasePoolPop(v20);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            }
            while (v14);
          }
          else
          {
            v16 = 0;
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LastFileGroupNumber-%d"), v42);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v25, v26);

          v5 = 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKey:", v27, CFSTR("DCIMChangedExternally"));

          v8 = v36;
          i = v37;
          v9 = v35;
        }

        objc_autoreleasePoolPop(v8);
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v34);

    v3 = v28;
    if ((v5 & 1) != 0)
    {
      -[PLPhotoDCIMDirectory _userInfoPath](v30, "_userInfoPath");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "writeToFile:atomically:", v4, 0);
      goto LABEL_28;
    }
  }
LABEL_29:

}

- (void)reloadUserInfo
{
  NSMutableDictionary *userInfo;
  id v4;

  userInfo = self->_userInfo;
  self->_userInfo = 0;

  v4 = -[PLPhotoDCIMDirectory userInfo](self, "userInfo");
}

- (id)userInfoObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLPhotoDCIMDirectory userInfo](self, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLPhotoDCIMDirectory userInfo](self, "userInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  self->_userInfoDidChange = 1;
}

- (id)dcfDirectories
{
  NSMutableArray *topLevelDirectories;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PLPhotoDCFDirectory *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v24;
  void *key;

  topLevelDirectories = self->_topLevelDirectories;
  if (!topLevelDirectories)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", self->_dcimPath, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v5);
    self->_topLevelDirectoriesByNumber = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    self->_unusableTopLevelDirectoryNumbers = CFSetCreateMutable(0, 0, 0);
    if (v5 >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = (void *)MEMORY[0x19AEC2E4C]();
        LODWORD(key) = 0;
        objc_msgSend(v4, "objectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoDCFObject validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:](PLPhotoDCFObject, "validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:", v9, 8, 8, &key, 0, 3, CFSTR("APPLE"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          break;
LABEL_10:

        objc_autoreleasePoolPop(v8);
        if (v5 == ++v7)
          goto LABEL_13;
      }
      CFDictionaryGetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "valueForKey:", v10);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12 | v11)
      {

      }
      else if (!CFSetGetValue(self->_unusableTopLevelDirectoryNumbers, (const void *)(int)key))
      {
        v13 = [PLPhotoDCFDirectory alloc];
        v11 = -[PLPhotoDCFDirectory initWithName:number:dcimDirectory:](v13, "initWithName:number:dcimDirectory:", v10, key, self);
        CFDictionarySetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key, (const void *)v11);
        objc_msgSend(v6, "setObject:forKey:", v11, v10);
        goto LABEL_9;
      }
      objc_msgSend(v6, "removeObjectForKey:", v10);
      CFDictionaryRemoveValue(self->_topLevelDirectoriesByNumber, (const void *)(int)key);
      CFSetAddValue(self->_unusableTopLevelDirectoryNumbers, (const void *)(int)key);
LABEL_9:

      goto LABEL_10;
    }
LABEL_13:
    v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (NSMutableArray *)objc_msgSend(v14, "initWithArray:", v15);
    v17 = self->_topLevelDirectories;
    self->_topLevelDirectories = v16;

    v18 = (id)-[NSMutableArray sortedArrayUsingSelector:](self->_topLevelDirectories, "sortedArrayUsingSelector:", sel_compare_);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("DCFLastDirectoryNumber"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");
    if (v21 <= 100)
      v22 = 100;
    else
      v22 = v21;
    self->_lastUsedDirectoryNumber = v22;

    topLevelDirectories = self->_topLevelDirectories;
  }
  return topLevelDirectories;
}

- (void)clearDCFDirectories
{
  NSMutableArray *topLevelDirectories;
  __CFDictionary *topLevelDirectoriesByNumber;
  __CFSet *unusableTopLevelDirectoryNumbers;

  topLevelDirectories = self->_topLevelDirectories;
  self->_topLevelDirectories = 0;

  topLevelDirectoriesByNumber = self->_topLevelDirectoriesByNumber;
  if (topLevelDirectoriesByNumber)
  {
    CFRelease(topLevelDirectoriesByNumber);
    self->_topLevelDirectoriesByNumber = 0;
  }
  unusableTopLevelDirectoryNumbers = self->_unusableTopLevelDirectoryNumbers;
  if (unusableTopLevelDirectoryNumbers)
  {
    CFRelease(unusableTopLevelDirectoryNumbers);
    self->_unusableTopLevelDirectoryNumbers = 0;
  }
  -[PLPhotoDCIMDirectory saveUserInfo](self, "saveUserInfo");
}

- (id)nextAvailableDirectory
{
  id v3;
  int lastUsedDirectoryNumber;
  uint64_t v5;
  PLPhotoDCFDirectory *v6;
  PLPhotoDCFDirectory *v7;
  PLPhotoDCFDirectory *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PLPhotoDCIMDirectory dcfDirectories](self, "dcfDirectories");
  lastUsedDirectoryNumber = self->_lastUsedDirectoryNumber;
  if (lastUsedDirectoryNumber >= 1000)
    v5 = 100;
  else
    v5 = lastUsedDirectoryNumber;
  do
  {
    CFDictionaryGetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)v5);
    v6 = (PLPhotoDCFDirectory *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      if (-[PLPhotoDCFDirectory canAddImage](v6, "canAddImage")
        && -[PLPhotoDCFDirectory canAddVideo](v7, "canAddVideo"))
      {
        goto LABEL_17;
      }

      v7 = 0;
      if ((int)v5 <= 998)
        v5 = (v5 + 1);
      else
        v5 = 100;
    }
    else
    {
      v8 = [PLPhotoDCFDirectory alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%03dAPPLE"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PLPhotoDCFDirectory initWithName:number:dcimDirectory:](v8, "initWithName:number:dcimDirectory:", v9, v5, self);

      CFDictionarySetValue(self->_topLevelDirectoriesByNumber, (const void *)(int)v5, v7);
      -[NSMutableArray addObject:](self->_topLevelDirectories, "addObject:", v7);
    }
    if (v7)
      v10 = 1;
    else
      v10 = (_DWORD)v5 == lastUsedDirectoryNumber;
  }
  while (!v10);
  if (v7)
  {
LABEL_17:
    self->_lastUsedDirectoryNumber = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("DCFLastDirectoryNumber"));

    goto LABEL_19;
  }
  v12 = v14;
LABEL_19:

  return v7;
}

- (void)lockDirectory
{
  flock **p_dcimDirectoryLock;
  int v4;
  flock *dcimDirectoryLock;

  p_dcimDirectoryLock = &self->_dcimDirectoryLock;
  if (!self->_dcimDirectoryLock)
  {
    self->_dcimDirectoryLock = (flock *)malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
    v4 = open(-[NSString UTF8String](self->_dcimPath, "UTF8String"), 2);
    self->_dcimDirectoryLockDescriptor = v4;
    dcimDirectoryLock = self->_dcimDirectoryLock;
    if (!dcimDirectoryLock || v4 < 0)
    {
      free(dcimDirectoryLock);
      self->_dcimDirectoryLock = 0;
      self->_dcimDirectoryLockDescriptor = -1;
    }
    else
    {
      *(_DWORD *)&dcimDirectoryLock->l_type = 3;
      dcimDirectoryLock->l_start = 0;
      dcimDirectoryLock->l_len = 0;
      self->_dcimDirectoryLock->l_pid = getpid();
      fcntl(self->_dcimDirectoryLockDescriptor, 9, p_dcimDirectoryLock);
    }
  }
}

- (void)unlockDirectory
{
  flock *dcimDirectoryLock;

  dcimDirectoryLock = self->_dcimDirectoryLock;
  if (dcimDirectoryLock)
  {
    dcimDirectoryLock->l_type = 0;
    fcntl(self->_dcimDirectoryLockDescriptor, 8, &self->_dcimDirectoryLock);
    close(self->_dcimDirectoryLockDescriptor);
    free(self->_dcimDirectoryLock);
    self->_dcimDirectoryLock = 0;
    self->_dcimDirectoryLockDescriptor = -1;
  }
}

- (BOOL)hasChangedExternally
{
  void *v2;
  char v3;

  -[PLPhotoDCIMDirectory userInfoObjectForKey:](self, "userInfoObjectForKey:", CFSTR("DCIMChangedExternally"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setHasChangedExternally:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCIMDirectory setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", v4, CFSTR("DCIMChangedExternally"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_topLevelDirectories, 0);
  objc_storeStrong((id *)&self->_posterImagePath, 0);
  objc_storeStrong((id *)&self->_miscPath, 0);
  objc_storeStrong((id *)&self->_dcimPath, 0);
}

@end
