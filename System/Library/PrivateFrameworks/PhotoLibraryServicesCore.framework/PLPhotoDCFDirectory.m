@implementation PLPhotoDCFDirectory

- (id)_lastUsedFileGroupUserInfoKey
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LastFileGroupNumber-%d"), self->super._number);
}

- (PLPhotoDCFDirectory)initWithName:(id)a3 number:(int)a4 dcimDirectory:(id)a5
{
  uint64_t v6;
  id v9;
  PLPhotoDCFDirectory *v10;
  PLPhotoDCFDirectory *v11;
  PLPhotoDCIMDirectory *dcimDirectory;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = *(_QWORD *)&a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLPhotoDCFDirectory;
  v10 = -[PLPhotoDCFObject initWithName:number:](&v16, sel_initWithName_number_, a3, v6);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dcimDirectory, a5);
    dcimDirectory = v11->_dcimDirectory;
    -[PLPhotoDCFDirectory _lastUsedFileGroupUserInfoKey](v11, "_lastUsedFileGroupUserInfoKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCIMDirectory userInfoObjectForKey:](dcimDirectory, "userInfoObjectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_lastUsedFileGroupNumber = objc_msgSend(v14, "intValue");

  }
  return v11;
}

- (id)dcimDirectory
{
  return self->_dcimDirectory;
}

- (unsigned)_calculateBaseDirectoryValue
{
  return 1000 * self->super._number - 100000;
}

- (BOOL)canAddFileGroupWithGroupNumber:(int)a3
{
  BOOL v3;
  PLPhotoDCFDirectory *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  char v25;
  uint64_t v27;
  uint64_t v28;
  PLPhotoDCFDirectory *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x3E7)
    return 0;
  v5 = self;
  v6 = -[PLPhotoDCFDirectory _calculateBaseDirectoryValue](self, "_calculateBaseDirectoryValue");
  +[PLPhotoDCFDirectory initializeFileGroupPrefixAndExtensions](PLPhotoDCFDirectory, "initializeFileGroupPrefixAndExtensions");
  +[PLPhotoDCFDirectory fileGroupRequiredEmptyPrefixes](PLPhotoDCFDirectory, "fileGroupRequiredEmptyPrefixes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoDCFDirectory fileGroupRequiredEmptyExtensions](PLPhotoDCFDirectory, "fileGroupRequiredEmptyExtensions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = v7;
  v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v30)
  {
    v10 = (v6 + a3) % 0x2710;
    v11 = *(_QWORD *)v38;
    v12 = 0x1E0CB3000uLL;
    v13 = 0x1E0CB3000uLL;
    v31 = v9;
    v32 = v8;
    v28 = v10;
    v29 = v5;
    v27 = *(_QWORD *)v38;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(v12 + 2368), "stringWithFormat:", CFSTR("%@_%04d"), *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v14), v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPhotoDCFDirectory fullPath](v5, "fullPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAppendingPathComponent:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v13 + 1568), "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = v8;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v17, "stringByAppendingPathExtension:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v18, "fileExistsAtPath:", v24);

              if ((v25 & 1) != 0)
              {

                v3 = 0;
                v9 = v31;
                v8 = v32;
                goto LABEL_21;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v21)
              continue;
            break;
          }
        }

        ++v14;
        v5 = v29;
        v9 = v31;
        v8 = v32;
        v11 = v27;
        v10 = v28;
        v12 = 0x1E0CB3000;
        v13 = 0x1E0CB3000;
      }
      while (v14 != v30);
      v3 = 1;
      v30 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);
  }
  else
  {
    v3 = 1;
  }
LABEL_21:

  return v3;
}

- (BOOL)_canAddItemWithPrefix:(id)a3 minimumFileGroupNumber:(int)a4
{
  char v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  int v11;

  if (-[PLPhotoDCFDirectory canAddFileGroupWithGroupNumber:](self, "canAddFileGroupWithGroupNumber:", *(_QWORD *)&a4))
  {
    v6 = 1;
  }
  else
  {
    -[PLPhotoDCFDirectory fileGroups](self, "fileGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
      v6 = 0;
    else
      v6 = a4 < 999;
    if (a4 <= 999)
    {
      v9 = v8;
      if (v8 >= 1)
      {
        do
        {
          objc_msgSend(v7, "objectAtIndex:", v9 - 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "number");
          v6 |= v11 < 999;

          if (v11 <= a4 || v9 < 2)
            break;
          --v9;
        }
        while ((v6 & 1) == 0);
      }
    }

  }
  return v6 & 1;
}

- (BOOL)_canAddItemWithPrefix:(id)a3
{
  BOOL v4;
  PLPhotoDCIMDirectory *dcimDirectory;
  void *v6;
  void *v7;

  v4 = -[PLPhotoDCFDirectory _canAddItemWithPrefix:minimumFileGroupNumber:](self, "_canAddItemWithPrefix:minimumFileGroupNumber:", a3, (self->_lastUsedFileGroupNumber + 1));
  if (!v4 && self->_lastUsedFileGroupNumber != 999)
  {
    self->_lastUsedFileGroupNumber = 999;
    dcimDirectory = self->_dcimDirectory;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 999);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCFDirectory _lastUsedFileGroupUserInfoKey](self, "_lastUsedFileGroupUserInfoKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoDCIMDirectory setUserInfoObject:forKey:](dcimDirectory, "setUserInfoObject:forKey:", v6, v7);

    -[PLPhotoDCIMDirectory saveUserInfo](self->_dcimDirectory, "saveUserInfo");
  }
  return v4;
}

- (BOOL)canAddImage
{
  return -[PLPhotoDCFDirectory _canAddItemWithPrefix:](self, "_canAddItemWithPrefix:", CFSTR("IMG"));
}

- (BOOL)canAddVideo
{
  return -[PLPhotoDCFDirectory _canAddItemWithPrefix:](self, "_canAddItemWithPrefix:", CFSTR("MOV"));
}

- (id)fullPath
{
  void *v3;
  void *v4;

  -[PLPhotoDCIMDirectory dcimPath](self->_dcimDirectory, "dcimPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", self->super._name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)ensureDirectoryExists
{
  -[PLPhotoDCFDirectory fullPath](self, "fullPath");
  CPFileBuildDirectoriesToPath();
}

- (BOOL)isEntensionValid:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("TH2")) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", CFSTR("THO"));

  return v4;
}

- (id)fileGroups
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *fileGroupsByNumber;
  uint64_t v9;
  __objc2_class **v10;
  void *v11;
  void *v12;
  void *v13;
  PLPhotoDCFFileGroup *v14;
  NSMutableDictionary *v15;
  void *v16;
  PLPhotoDCFFileGroup *v17;
  void *v18;
  PLPhotoDCFFileGroup *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  int maxFileGroupNumber;
  id v24;
  NSMutableDictionary *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  unsigned int v39;

  if (!self->_fileGroupsByNumber)
  {
    -[PLPhotoDCIMDirectory dcimPath](self->_dcimDirectory, "dcimPath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", self->super._name);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v4;
    objc_msgSend(v33, "contentsOfDirectoryAtPath:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v6);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    fileGroupsByNumber = self->_fileGroupsByNumber;
    self->_fileGroupsByNumber = v7;

    if (v6 >= 1)
    {
      v9 = 0;
      v30 = *MEMORY[0x1E0CB2A88];
      v10 = off_1E3765000;
      v36 = v5;
      do
      {
        v11 = (void *)MEMORY[0x19AEC2E4C]();
        v39 = 0;
        objc_msgSend(v5, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__objc2_class validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:](v10[46], "validDCFNameForName:requiredLength:nameLength:number:numberRange:suffix:", v12, 12, 8, &v39, 4, 4, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "pathExtension");
        v14 = (PLPhotoDCFFileGroup *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          if (-[PLPhotoDCFDirectory isEntensionValid:](self, "isEntensionValid:", v14)
            || -[PLPhotoDCFDirectory considerInvalidFileGroups](self, "considerInvalidFileGroups"))
          {
            if (!v13 || (-[PLPhotoDCFFileGroup isEqualToString:](v14, "isEqualToString:", &stru_1E376D3F8) & 1) != 0)
              goto LABEL_16;
            v15 = self->_fileGroupsByNumber;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
            v17 = (PLPhotoDCFFileGroup *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              objc_msgSend(v34, "stringByAppendingPathComponent:", v12);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "attributesOfItemAtPath:error:", v18, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v31, "objectForKey:", v30);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = [PLPhotoDCFFileGroup alloc];
              objc_msgSend(v13, "stringByDeletingPathExtension");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[PLPhotoDCFFileGroup initWithName:number:directory:](v19, "initWithName:number:directory:", v20, v39, self);

              -[PLPhotoDCFFileGroup setDate:](v17, "setDate:", v35);
              v21 = self->_fileGroupsByNumber;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v39);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v17, v22);

              maxFileGroupNumber = self->_maxFileGroupNumber;
              if (maxFileGroupNumber <= (int)v39)
                maxFileGroupNumber = v39;
              self->_maxFileGroupNumber = maxFileGroupNumber;
              objc_msgSend(v32, "addObject:", v17);

            }
            -[PLPhotoDCFFileGroup addExtension:](v17, "addExtension:", v14);
            v5 = v36;
          }
          else
          {
            v17 = v14;
            v14 = 0;
          }

          v10 = off_1E3765000;
        }
LABEL_16:

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v6 != v9);
    }

  }
  if (!-[PLPhotoDCFDirectory considerInvalidFileGroups](self, "considerInvalidFileGroups"))
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = self->_fileGroupsByNumber;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __33__PLPhotoDCFDirectory_fileGroups__block_invoke;
    v37[3] = &unk_1E3768498;
    v38 = v24;
    v26 = v24;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v25, "enumerateKeysAndObjectsUsingBlock:", v37);
    -[NSMutableDictionary removeObjectsForKeys:](self->_fileGroupsByNumber, "removeObjectsForKeys:", v26);

  }
  -[NSMutableDictionary allValues](self->_fileGroupsByNumber, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_nextAvailableFileGroupWithPrefix:(id)a3 extension:(id)a4
{
  id v6;
  PLPhotoDCIMDirectory *dcimDirectory;
  void *v8;
  void *v9;
  int lastUsedFileGroupNumber;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  NSMutableDictionary *fileGroupsByNumber;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  PLPhotoDCFFileGroup *v20;
  void *v21;
  PLPhotoDCFFileGroup *v22;
  NSMutableDictionary *v23;
  void *v24;
  int maxFileGroupNumber;
  PLPhotoDCIMDirectory *v26;
  void *v27;
  void *v28;
  id v30;

  v6 = a3;
  v30 = a4;
  -[PLPhotoDCIMDirectory lockDirectory](self->_dcimDirectory, "lockDirectory");
  -[PLPhotoDCIMDirectory reloadUserInfo](self->_dcimDirectory, "reloadUserInfo");
  dcimDirectory = self->_dcimDirectory;
  -[PLPhotoDCFDirectory _lastUsedFileGroupUserInfoKey](self, "_lastUsedFileGroupUserInfoKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCIMDirectory userInfoObjectForKey:](dcimDirectory, "userInfoObjectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastUsedFileGroupNumber = objc_msgSend(v9, "intValue");

  lastUsedFileGroupNumber = self->_lastUsedFileGroupNumber;
  v11 = (lastUsedFileGroupNumber + 1);
  v12 = -[PLPhotoDCFDirectory _calculateBaseDirectoryValue](self, "_calculateBaseDirectoryValue");
  v13 = v12 + v11;
  if (-[PLPhotoDCFDirectory canAddFileGroupWithGroupNumber:](self, "canAddFileGroupWithGroupNumber:", v11))
    goto LABEL_8;
  if (!self->_fileGroupsByNumber)
    v14 = -[PLPhotoDCFDirectory fileGroups](self, "fileGroups");
  if (lastUsedFileGroupNumber >= 998)
  {
LABEL_8:
    if (lastUsedFileGroupNumber > 998)
    {
      v22 = 0;
      v19 = v30;
      goto LABEL_14;
    }
    v18 = v13 % 0x2710;
  }
  else
  {
    do
    {
      fileGroupsByNumber = self->_fileGroupsByNumber;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12 - 10000 * (v13 / 0x2710) + v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](fileGroupsByNumber, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        break;
      v11 = (v11 + 1);
    }
    while ((_DWORD)v11 != 999);
    v18 = v12 - 10000 * (v13 / 0x2710) + v11;
  }
  v19 = v30;
  v20 = [PLPhotoDCFFileGroup alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%04d"), v6, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PLPhotoDCFFileGroup initWithName:number:directory:](v20, "initWithName:number:directory:", v21, v18, self);

  -[PLPhotoDCFFileGroup addExtension:](v22, "addExtension:", v30);
  v23 = self->_fileGroupsByNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v22, v24);

  maxFileGroupNumber = self->_maxFileGroupNumber;
  if ((int)v18 > maxFileGroupNumber)
    maxFileGroupNumber = v18;
  self->_maxFileGroupNumber = maxFileGroupNumber;
LABEL_14:
  v26 = self->_dcimDirectory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCFDirectory _lastUsedFileGroupUserInfoKey](self, "_lastUsedFileGroupUserInfoKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoDCIMDirectory setUserInfoObject:forKey:](v26, "setUserInfoObject:forKey:", v27, v28);

  self->_lastUsedFileGroupNumber = v11;
  -[PLPhotoDCIMDirectory saveUserInfo](self->_dcimDirectory, "saveUserInfo");
  -[PLPhotoDCIMDirectory unlockDirectory](self->_dcimDirectory, "unlockDirectory");

  return v22;
}

- (id)nextAvailableFileGroup
{
  return -[PLPhotoDCFDirectory _nextAvailableFileGroupWithPrefix:extension:](self, "_nextAvailableFileGroupWithPrefix:extension:", CFSTR("IMG"), CFSTR("JPG"));
}

- (id)nextAvailableVideoFileGroupWithExtension:(id)a3
{
  return -[PLPhotoDCFDirectory _nextAvailableFileGroupWithPrefix:extension:](self, "_nextAvailableFileGroupWithPrefix:extension:", CFSTR("MOV"), a3);
}

- (void)removeFileGroup:(id)a3
{
  NSMutableDictionary *fileGroupsByNumber;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "deleteFiles");
  fileGroupsByNumber = self->_fileGroupsByNumber;
  if (fileGroupsByNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "number"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](fileGroupsByNumber, "removeObjectForKey:", v5);

  }
}

- (BOOL)considerInvalidFileGroups
{
  return self->_considerInvalidFileGroups;
}

- (void)setConsiderInvalidFileGroups:(BOOL)a3
{
  self->_considerInvalidFileGroups = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileGroupsByNumber, 0);
  objc_storeStrong((id *)&self->_dcimDirectory, 0);
}

void __33__PLPhotoDCFDirectory_fileGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isValid") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

+ (void)initializeFileGroupPrefixAndExtensions
{
  pl_dispatch_once(&initializeFileGroupPrefixAndExtensions_onceToken, &__block_literal_global_202);
}

+ (id)fileGroupRequiredEmptyPrefixes
{
  return (id)__fileGroupRequiredEmptyPrefixes;
}

+ (id)fileGroupRequiredEmptyExtensions
{
  return (id)__fileGroupRequiredEmptyExtensions;
}

void __61__PLPhotoDCFDirectory_initializeFileGroupPrefixAndExtensions__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("IMG"), CFSTR("MOV"), 0);
  v1 = (void *)__fileGroupRequiredEmptyPrefixes;
  __fileGroupRequiredEmptyPrefixes = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("JPG"), CFSTR("PNG"), CFSTR("TIF"), CFSTR("GIF"), CFSTR("MOV"), 0);
  v3 = (void *)__fileGroupRequiredEmptyExtensions;
  __fileGroupRequiredEmptyExtensions = v2;

}

@end
