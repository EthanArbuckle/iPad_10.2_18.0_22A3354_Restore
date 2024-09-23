@implementation PCMotionBundle

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PCMotionBundle;
  -[PCMotionBundle dealloc](&v3, sel_dealloc);
}

- (PCMotionBundle)initWithURL:(id)a3
{
  PCMotionBundle *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCMotionBundle;
  v4 = -[PCMotionBundle init](&v6, sel_init);
  if (v4)
    v4->_bundleURL = (NSURL *)objc_msgSend(a3, "copy");
  return v4;
}

- (NSDictionary)infoDictionary
{
  NSDictionary *result;

  result = self->_infoDictionary;
  if (!result)
  {
    result = (NSDictionary *)+[PCMotionBundle infoDictionaryAtURL:](PCMotionBundle, "infoDictionaryAtURL:", +[PCMotionBundle urlForInfoDictionaryInBundleURL:](PCMotionBundle, "urlForInfoDictionaryInBundleURL:", self->_bundleURL));
    self->_infoDictionary = result;
  }
  return result;
}

- (NSDictionary)localizedInfoDictionary
{
  NSDictionary *result;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  result = self->_localizedInfoDictionary;
  if (!result)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = -[PCMotionBundle preferredLocalizations](self, "preferredLocalizations", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = -[PCMotionBundle localizedInfoStringsForLocalization:](self, "localizedInfoStringsForLocalization:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        if (v9)
          break;
        if (v6 == ++v8)
        {
          v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      result = (NSDictionary *)+[PCMotionBundle infoDictionaryWithDefaults:andOverrides:](PCMotionBundle, "infoDictionaryWithDefaults:andOverrides:", -[PCMotionBundle infoDictionary](self, "infoDictionary"), v9);
      self->_localizedInfoDictionary = result;
      if (result)
        return result;
    }
    else
    {
LABEL_10:
      result = self->_localizedInfoDictionary;
      if (result)
        return result;
    }
    result = (NSDictionary *)-[NSDictionary copy](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "copy");
    self->_localizedInfoDictionary = result;
  }
  return result;
}

- (NSArray)preferredLocalizations
{
  NSArray *result;
  NSArray *v4;

  result = self->_preferredLocalizations;
  if (!result)
  {
    v4 = -[PCMotionBundle localizations](self, "localizations");
    result = (NSArray *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:", v4), "copy");
    self->_preferredLocalizations = result;
  }
  return result;
}

- (NSArray)localizations
{
  NSArray *result;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = self->_localizations;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = +[PCMotionBundle urlForResourcesInBundleURL:](PCMotionBundle, "urlForResourcesInBundleURL:", self->_bundleURL);
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, 0);
    if (v6)
    {
      v7 = v6;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "isEqualToString:", CFSTR("lproj")))
              objc_msgSend(v4, "addObject:", objc_msgSend((id)objc_msgSend(v12, "lastPathComponent"), "stringByDeletingPathExtension"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }
    }
    self->_localizations = (NSArray *)objc_msgSend(v4, "copy");

    return self->_localizations;
  }
  return result;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id result;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = -[PCMotionBundle preferredLocalizations](self, "preferredLocalizations");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v9);
      v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
      v17 = 0;
      result = -[PCMotionBundle localizedStringForKey:value:table:localization:found:](self, "localizedStringForKey:value:table:localization:found:", a3, a4, a5, v15, &v17);
      if (v17)
        break;
      if (!v12)
        v12 = result;
      if (v11 == ++v14)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v12 = 0;
LABEL_13:
    if (v12)
      return v12;
    else
      return &stru_1E65EDDA0;
  }
  return result;
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  char v7;

  v7 = 0;
  return -[PCMotionBundle localizedStringForKey:value:table:localization:found:](self, "localizedStringForKey:value:table:localization:found:", a3, a4, a5, a6, &v7);
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6 found:(BOOL *)a7
{
  const __CFString *v10;
  id v11;
  id v12;
  id result;

  *a7 = 0;
  if (a3)
  {
    if (a5)
      v10 = (const __CFString *)a5;
    else
      v10 = CFSTR("Localizable");
    v11 = -[PCMotionBundle URLForResource:withExtension:subdirectory:localization:](self, "URLForResource:withExtension:subdirectory:localization:", v10, CFSTR("strings"), 0, a6);
    if (v11
      && (v12 = +[PCMotionBundle infoDictionaryAtURL:](PCMotionBundle, "infoDictionaryAtURL:", v11)) != 0
      && (result = (id)objc_msgSend(v12, "objectForKey:", a3)) != 0)
    {
      *a7 = 1;
    }
    else if (+[PCMotionBundle isStringNilOrEmpty:](PCMotionBundle, "isStringNilOrEmpty:", a4))
    {
      return a3;
    }
    else
    {
      return a4;
    }
  }
  else if (a4)
  {
    return a4;
  }
  else
  {
    return &stru_1E65EDDA0;
  }
  return result;
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E65EDDA0);
}

- (id)localizedAttributedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E65EDDA0);
}

- (id)URLForResource:(id)a3
{
  return -[PCMotionBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", a3, 0, 0);
}

- (id)URLForResource:(id)a3 withExtension:(id)a4
{
  return -[PCMotionBundle URLForResource:withExtension:subdirectory:](self, "URLForResource:withExtension:subdirectory:", a3, a4, 0);
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5
{
  NSArray *v9;
  id result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = -[PCMotionBundle preferredLocalizations](self, "preferredLocalizations", 0);
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v11 = result;
    v12 = *(_QWORD *)v15;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v12)
        objc_enumerationMutation(v9);
      result = -[PCMotionBundle URLForResource:withExtension:subdirectory:localization:](self, "URLForResource:withExtension:subdirectory:localization:", a3, a4, a5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13));
      if (result)
        break;
      if (v11 == (id)++v13)
      {
        result = (id)-[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v11 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)URLForResource:(id)a3 withExtension:(id)a4 subdirectory:(id)a5 localization:(id)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;

  v11 = +[PCMotionBundle urlForResourcesInBundleURL:](PCMotionBundle, "urlForResourcesInBundleURL:", self->_bundleURL);
  v12 = (uint64_t)v11;
  if (a5)
    v12 = objc_msgSend(v11, "URLByAppendingPathComponent:", a5);
  if (a4)
    a3 = (id)objc_msgSend(a3, "stringByAppendingPathExtension:", a4);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", a3, v12);
  if ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v14 = +[PCMotionBundle urlForLocalizedResourcesInBundleURL:localization:](PCMotionBundle, "urlForLocalizedResourcesInBundleURL:localization:", self->_bundleURL, a6);
    v15 = (uint64_t)v14;
    if (a5)
      v15 = objc_msgSend(v14, "URLByAppendingPathComponent:", a5);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", a3, v15);
    if ((objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    {
      v16 = +[PCMotionBundle urlForLocalizableResourcesInBundleURL:](PCMotionBundle, "urlForLocalizableResourcesInBundleURL:", self->_bundleURL);
      v17 = (uint64_t)v16;
      if (a5)
        v17 = objc_msgSend(v16, "URLByAppendingPathComponent:", a5);
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", a3, v17);
      if (objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0))
        return v18;
      else
        return 0;
    }
  }
  return v13;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4
{
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[PCMotionBundle preferredLocalizations](self, "preferredLocalizations", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = -[PCMotionBundle URLsForResourcesWithExtension:subdirectory:localization:](self, "URLsForResourcesWithExtension:subdirectory:localization:", a3, a4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v7, "addObjectsFromArray:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v7;
}

- (id)URLsForResourcesWithExtension:(id)a3 subdirectory:(id)a4 localization:(id)a5
{
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = +[PCMotionBundle urlForResourcesInBundleURL:](PCMotionBundle, "urlForResourcesInBundleURL:", self->_bundleURL);
  v10 = (uint64_t)v9;
  if (a4)
    v10 = objc_msgSend(v9, "URLByAppendingPathComponent:", a4);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v10, 0, 0, 0);
  if (v12)
  {
    v13 = v12;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v18, "pathExtension"), "isEqualToString:", a3))
            objc_msgSend(v8, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v15);
    }
  }
  v19 = +[PCMotionBundle urlForLocalizedResourcesInBundleURL:localization:](PCMotionBundle, "urlForLocalizedResourcesInBundleURL:localization:", self->_bundleURL, a5);
  v20 = (uint64_t)v19;
  if (a4)
    v20 = objc_msgSend(v19, "URLByAppendingPathComponent:", a4);
  v21 = (void *)objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v20, 0, 0, 0);
  if (v21)
  {
    v22 = v21;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (objc_msgSend((id)objc_msgSend(v27, "pathExtension"), "isEqualToString:", a3))
            objc_msgSend(v8, "addObject:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }
  }
  return v8;
}

+ (unint64_t)currentBundleVersion
{
  return 1;
}

+ (NSArray)projectTypes
{
  if (projectTypes_onceToken != -1)
    dispatch_once(&projectTypes_onceToken, &__block_literal_global_58);
  return (NSArray *)projectTypes_projectTypes;
}

void *__30__PCMotionBundle_projectTypes__block_invoke()
{
  void *result;

  result = &unk_1E6649890;
  projectTypes_projectTypes = (uint64_t)result;
  return result;
}

+ (NSArray)projectTypeNames
{
  if (projectTypeNames_onceToken != -1)
    dispatch_once(&projectTypeNames_onceToken, &__block_literal_global_20);
  return (NSArray *)projectTypeNames_typeNames;
}

void *__34__PCMotionBundle_projectTypeNames__block_invoke()
{
  void *result;

  result = &unk_1E66498A8;
  projectTypeNames_typeNames = (uint64_t)result;
  return result;
}

+ (NSArray)projectFolderNames
{
  if (projectFolderNames_onceToken != -1)
    dispatch_once(&projectFolderNames_onceToken, &__block_literal_global_33);
  return (NSArray *)projectFolderNames_folderNames;
}

void *__36__PCMotionBundle_projectFolderNames__block_invoke()
{
  void *result;

  result = &unk_1E66498C0;
  projectFolderNames_folderNames = (uint64_t)result;
  return result;
}

+ (NSArray)bundleExtensions
{
  if (bundleExtensions_onceToken != -1)
    dispatch_once(&bundleExtensions_onceToken, &__block_literal_global_46);
  return (NSArray *)bundleExtensions_pathExtensions;
}

void *__34__PCMotionBundle_bundleExtensions__block_invoke()
{
  void *result;

  result = &unk_1E66498D8;
  bundleExtensions_pathExtensions = (uint64_t)result;
  return result;
}

+ (NSArray)projectFileExtensions
{
  if (projectFileExtensions_onceToken != -1)
    dispatch_once(&projectFileExtensions_onceToken, &__block_literal_global_59);
  return (NSArray *)projectFileExtensions_pathExtensions;
}

void *__39__PCMotionBundle_projectFileExtensions__block_invoke()
{
  void *result;

  result = &unk_1E66498F0;
  projectFileExtensions_pathExtensions = (uint64_t)result;
  return result;
}

+ (NSArray)bundleUTIs
{
  if (bundleUTIs_onceToken != -1)
    dispatch_once(&bundleUTIs_onceToken, &__block_literal_global_70);
  return (NSArray *)bundleUTIs_bundleUTIs;
}

void *__28__PCMotionBundle_bundleUTIs__block_invoke()
{
  void *result;

  result = &unk_1E6649908;
  bundleUTIs_bundleUTIs = (uint64_t)result;
  return result;
}

+ (NSArray)projectFileUTIs
{
  if (projectFileUTIs_onceToken != -1)
    dispatch_once(&projectFileUTIs_onceToken, &__block_literal_global_83);
  return (NSArray *)projectFileUTIs_projectFileUTIs;
}

void *__33__PCMotionBundle_projectFileUTIs__block_invoke()
{
  void *result;

  result = &unk_1E6649920;
  projectFileUTIs_projectFileUTIs = (uint64_t)result;
  return result;
}

+ (BOOL)isValidBundleURL:(id)a3
{
  uint64_t v5;
  id v7;

  v5 = objc_msgSend(a3, "pathExtension");
  if (v5)
  {
    LODWORD(v5) = objc_msgSend(a1, "isValidBundleExtension:", v5);
    if ((_DWORD)v5)
    {
      v7 = 0;
      LODWORD(v5) = objc_msgSend(a3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C999D0], 0);
      if ((_DWORD)v5)
        LOBYTE(v5) = objc_msgSend(v7, "BOOLValue");
    }
  }
  return v5;
}

+ (BOOL)isValidBundleExtension:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "bundleExtensions"), "containsObject:", objc_msgSend(a3, "lowercaseString"));
}

+ (BOOL)isValidBundleUTI:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "bundleUTIs"), "containsObject:", objc_msgSend(a3, "lowercaseString"));
}

+ (BOOL)isValidProjectFileURL:(id)a3
{
  uint64_t v5;
  id v7;

  v7 = 0;
  LODWORD(v5) = objc_msgSend(a3, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99A18], 0);
  if ((_DWORD)v5)
  {
    LODWORD(v5) = objc_msgSend(v7, "BOOLValue");
    if ((_DWORD)v5)
    {
      v5 = objc_msgSend(a3, "pathExtension");
      if (v5)
        LOBYTE(v5) = objc_msgSend(a1, "isValidProjectFileExtension:", v5);
    }
  }
  return v5;
}

+ (BOOL)isValidProjectFileExtension:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "projectFileExtensions"), "containsObject:", objc_msgSend(a3, "lowercaseString"));
}

+ (BOOL)isValidProjectFileUTI:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a1, "projectFileUTIs"), "containsObject:", objc_msgSend(a3, "lowercaseString"));
}

+ (BOOL)bundleContentsAreEqualAtURL:(id)a3 andURL:(id)a4
{
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(a3, "pathExtension");
  v8 = objc_msgSend(a4, "pathExtension");
  if (objc_msgSend(a1, "isValidBundleExtension:", v7) && !objc_msgSend(v7, "caseInsensitiveCompare:", v8))
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsEqualAtPath:andPath:", objc_msgSend(a3, "path"), objc_msgSend(a4, "path"));
  else
    return 0;
}

+ (id)bundleURLForProjectFileURL:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = (void *)objc_msgSend(a3, "pathComponents");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__15;
  v18 = __Block_byref_object_dispose__15;
  v19 = 0;
  v19 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__PCMotionBundle_bundleURLForProjectFileURL___block_invoke;
  v9[3] = &unk_1E6512C78;
  v9[4] = a1;
  v9[5] = &v14;
  v9[6] = &v10;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v9);
  v6 = (void *)v15[5];
  if (*((_BYTE *)v11 + 24))
  {
    v7 = v6;
  }
  else
  {

    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __45__PCMotionBundle_bundleURLForProjectFileURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "URLByDeletingLastPathComponent");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v6;
  result = objc_msgSend(*(id *)(a1 + 32), "isValidBundleURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)bundleURLInFileURL:(id)a3
{
  void *v4;
  void *v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "path");
  v5 = (void *)objc_msgSend(a1, "bundleExtensions");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), 1);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(v4, "substringToIndex:", v10 + v11);
          return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 1);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      result = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

+ (id)projectTypeNameForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "projectTypeNames");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (id)folderNameForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "projectFolderNames");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (id)bundleExtensionForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "bundleExtensions");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (int64_t)projectTypeForBundleExtension:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(a1, "bundleExtensions"), "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a1, "bundleExtensionForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

+ (id)bundleUTIForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "bundleUTIs");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (int64_t)projectTypeForBundleUTI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(a1, "bundleUTIs"), "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (objc_msgSend((id)objc_msgSend(a1, "bundleUTIForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

+ (id)projectFileExtensionForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "projectFileExtensions");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (int64_t)projectTypeForProjectFileExtension:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(a1, "projectFileExtensions"), "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (!v7
       || objc_msgSend((id)objc_msgSend(a1, "projectFileExtensionForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

+ (id)projectFileUTIForProjectType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "projectFileUTIs");
  if (objc_msgSend(v4, "count") <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
}

+ (int64_t)projectTypeForProjectFileUTI:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v5 = objc_msgSend((id)objc_msgSend(a1, "projectFileUTIs"), "count");
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (!v7 || objc_msgSend((id)objc_msgSend(a1, "projectFileUTIForProjectType:", v7), "caseInsensitiveCompare:", a3))
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

+ (int64_t)compositionTypeForProjectType:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return 0;
}

+ (int64_t)templateTypeForProjectType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return qword_1B305A288[a3];
}

+ (id)compositionProjectFileExtensionForProjectType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "projectFileExtensionForProjectType:", objc_msgSend(a1, "templateTypeForProjectType:", a3));
}

+ (int64_t)compositionTypeForProjectFileExtension:(id)a3
{
  if (objc_msgSend(a1, "projectTypeForProjectFileExtension:", a3) == 1)
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)compositionProjectFileUTIForProjectType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "projectFileUTIForProjectType:", objc_msgSend(a1, "templateTypeForProjectType:", a3));
}

+ (int64_t)compositionTypeForProjectFileUTI:(id)a3
{
  if (objc_msgSend(a1, "projectTypeForProjectFileUTI:", a3) == 1)
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)identifier
{
  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.identifier")));
}

- (int64_t)projectType
{
  return +[PCMotionBundle projectTypeForBundleExtension:](PCMotionBundle, "projectTypeForBundleExtension:", -[NSURL pathExtension](-[PCMotionBundle bundleURL](self, "bundleURL"), "pathExtension"));
}

- (NSString)projectTypeName
{
  return (NSString *)+[PCMotionBundle projectTypeNameForProjectType:](PCMotionBundle, "projectTypeNameForProjectType:", -[PCMotionBundle projectType](self, "projectType"));
}

- (NSString)projectTypeFolderName
{
  return (NSString *)+[PCMotionBundle folderNameForProjectType:](PCMotionBundle, "folderNameForProjectType:", -[PCMotionBundle projectType](self, "projectType"));
}

- (NSString)name
{
  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.name")));
}

- (NSString)category
{
  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.category")));
}

- (NSString)theme
{
  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.theme")));
}

- (NSURL)projectFileURL
{
  NSURL *v3;

  if (!-[PCMotionBundle projectFilePath](self, "projectFilePath"))
    return 0;
  v3 = -[NSURL URLByAppendingPathComponent:](-[PCMotionBundle bundleURL](self, "bundleURL"), "URLByAppendingPathComponent:", -[PCMotionBundle projectFilePath](self, "projectFilePath"));
  if ((objc_msgSend((id)objc_opt_class(), "isValidProjectFileURL:", v3) & 1) == 0)
    return 0;
  return v3;
}

- (NSString)projectFilePath
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.projectFilePath"));
}

- (NSString)relativeInstallationPath
{
  id v3;
  NSString *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", -[PCMotionBundle projectTypeFolderName](self, "projectTypeFolderName"));
  objc_msgSend(v3, "addObject:", -[PCMotionBundle identifier](self, "identifier"));
  objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu_%lu"), -[PCMotionBundle majorVersion](self, "majorVersion"), -[PCMotionBundle minorVersion](self, "minorVersion")));
  objc_msgSend(v3, "addObject:", -[NSURL lastPathComponent](-[PCMotionBundle bundleURL](self, "bundleURL"), "lastPathComponent"));
  v4 = (NSString *)objc_msgSend(v3, "componentsJoinedByString:", CFSTR("/"));

  return v4;
}

- (NSString)version
{
  return (NSString *)+[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.version")));
}

- (unint64_t)majorVersion
{
  return objc_msgSend(-[PCMotionBundle versionForComponentAtIndex:](self, "versionForComponentAtIndex:", 0), "integerValue");
}

- (unint64_t)minorVersion
{
  return objc_msgSend(-[PCMotionBundle versionForComponentAtIndex:](self, "versionForComponentAtIndex:", 1), "integerValue");
}

- (NSArray)versionComponents
{
  NSArray *versionComponents;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  versionComponents = self->_versionComponents;
  if (!versionComponents)
  {
    versionComponents = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = -[NSString componentsSeparatedByString:](-[PCMotionBundle version](self, "version"), "componentsSeparatedByString:", CFSTR("."));
    v5 = -[NSArray count](v4, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        -[NSArray addObject:](versionComponents, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i), "integerValue")));
    }
    self->_versionComponents = versionComponents;
  }
  return versionComponents;
}

- (id)versionForComponentAtIndex:(unint64_t)a3
{
  NSArray *v4;

  v4 = -[PCMotionBundle versionComponents](self, "versionComponents");
  if (-[NSArray count](v4, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", a3);
}

- (unint64_t)bundleVersion
{
  unint64_t result;

  result = -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.bundleVersion"));
  if (result)
    return objc_msgSend((id)result, "unsignedIntegerValue");
  return result;
}

- (BOOL)supportsFCPiPad
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.supportsFCPiPad")), "BOOLValue");
}

- (BOOL)isCopyProtected
{
  _BOOL4 v3;

  if ((objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.isCopyProtected")), "BOOLValue") & 1) != 0)LOBYTE(v3) = 1;
  else
    return (-[NSNumber unsignedIntValue](-[PCMotionBundle templateFlags](self, "templateFlags"), "unsignedIntValue") >> 3) & 1;
  return v3;
}

- (NSNumber)templateFlags
{
  NSNumber *result;
  void *v4;
  uint64_t templateFlags;

  result = self->_templateFlags;
  if (!result)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithContentsOfURL:", -[PCMotionBundle projectFileURL](self, "projectFileURL"));
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(v4, "parse");
    if (self->_templateFlagsParseState.foundTemplateFlag)
      templateFlags = self->_templateFlagsParseState.templateFlags;
    else
      templateFlags = 0;

    result = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", templateFlags);
    self->_templateFlags = result;
  }
  return result;
}

- (NSString)localizedVersion
{
  NSString *v3;

  v3 = -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle consolidatedLocalizedInfoDictionary](self, "consolidatedLocalizedInfoDictionary"), "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
  if (+[PCMotionBundle isStringNilOrEmpty:](PCMotionBundle, "isStringNilOrEmpty:", v3))
    return -[PCMotionBundle version](self, "version");
  else
    return v3;
}

- (id)versionForLocalization:(id)a3
{
  id v4;

  v4 = -[PCMotionBundle objectForInfoDictionaryKey:localization:](self, "objectForInfoDictionaryKey:localization:", CFSTR("CFBundleShortVersionString"), a3);
  if (+[PCMotionBundle isStringNilOrEmpty:](PCMotionBundle, "isStringNilOrEmpty:", v4))
    return -[PCMotionBundle version](self, "version");
  else
    return v4;
}

- (NSString)localizedName
{
  NSString *v3;

  v3 = -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle consolidatedLocalizedInfoDictionary](self, "consolidatedLocalizedInfoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.name"));
  if (+[PCMotionBundle isStringNilOrEmpty:](PCMotionBundle, "isStringNilOrEmpty:", v3))
    return -[NSString stringByDeletingPathExtension](-[NSURL lastPathComponent](-[PCMotionBundle bundleURL](self, "bundleURL"), "lastPathComponent"), "stringByDeletingPathExtension");
  else
    return v3;
}

- (id)nameForLocalization:(id)a3
{
  id v4;

  v4 = -[PCMotionBundle objectForInfoDictionaryKey:localization:](self, "objectForInfoDictionaryKey:localization:", CFSTR("com.apple.motion.package.name"), a3);
  if (+[PCMotionBundle isStringNilOrEmpty:](PCMotionBundle, "isStringNilOrEmpty:", v4))
    return -[NSString stringByDeletingPathExtension](-[NSURL lastPathComponent](-[PCMotionBundle bundleURL](self, "bundleURL"), "lastPathComponent"), "stringByDeletingPathExtension");
  else
    return v4;
}

- (NSString)localizedCategory
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle consolidatedLocalizedInfoDictionary](self, "consolidatedLocalizedInfoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.category"));
}

- (id)categoryForLocalization:(id)a3
{
  return -[PCMotionBundle objectForInfoDictionaryKey:localization:](self, "objectForInfoDictionaryKey:localization:", CFSTR("com.apple.motion.package.category"), a3);
}

- (NSString)localizedTheme
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle consolidatedLocalizedInfoDictionary](self, "consolidatedLocalizedInfoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.theme"));
}

- (id)themeForLocalization:(id)a3
{
  return -[PCMotionBundle objectForInfoDictionaryKey:localization:](self, "objectForInfoDictionaryKey:localization:", CFSTR("com.apple.motion.package.theme"), a3);
}

- (NSURL)localizedSmallThumbnailURL
{
  return (NSURL *)-[PCMotionBundle URLForResource:withExtension:](self, "URLForResource:withExtension:", CFSTR("Thumbnail/small"), CFSTR("png"));
}

- (id)smallThumbnailURLForLocalization:(id)a3
{
  return -[PCMotionBundle URLForResource:withExtension:subdirectory:localization:](self, "URLForResource:withExtension:subdirectory:localization:", CFSTR("small"), CFSTR("png"), CFSTR("Thumbnail"), a3);
}

- (NSURL)localizedLargeThumbnailURL
{
  return (NSURL *)-[PCMotionBundle URLForResource:withExtension:](self, "URLForResource:withExtension:", CFSTR("Thumbnail/large"), CFSTR("png"));
}

- (id)largeThumbnailURLForLocalization:(id)a3
{
  return -[PCMotionBundle URLForResource:withExtension:subdirectory:localization:](self, "URLForResource:withExtension:subdirectory:localization:", CFSTR("large"), CFSTR("png"), CFSTR("Thumbnail"), a3);
}

+ (id)infoDictionaryAtURL:(id)a3
{
  uint64_t v4;

  if (!objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0))
    return 0;
  v4 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
}

- (NSDictionary)consolidatedLocalizedInfoDictionary
{
  NSDictionary *result;

  result = self->_consolidatedLocalizedInfoDictionary;
  if (!result)
  {
    result = (NSDictionary *)-[PCMotionBundle localizedInfoDictionaryWithDefaults:](self, "localizedInfoDictionaryWithDefaults:", -[PCMotionBundle infoDictionary](self, "infoDictionary"));
    self->_consolidatedLocalizedInfoDictionary = result;
  }
  return result;
}

- (NSMutableDictionary)localizedInfoDictionaries
{
  NSMutableDictionary *result;

  result = self->_localizedInfoDictionaries;
  if (!result)
  {
    result = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_localizedInfoDictionaries = result;
  }
  return result;
}

- (id)localizedInfoDictionaryForLocalization:(id)a3
{
  id v6;
  id v7;

  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_localizedInfoDictionaries, "objectForKeyedSubscript:"))
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_localizedInfoDictionaries, "objectForKeyedSubscript:", a3);
  v6 = -[PCMotionBundle localizedInfoStringsForLocalization:](self, "localizedInfoStringsForLocalization:", a3);
  if (!v6)
    return -[PCMotionBundle infoDictionary](self, "infoDictionary");
  v7 = +[PCMotionBundle infoDictionaryWithDefaults:andOverrides:](PCMotionBundle, "infoDictionaryWithDefaults:andOverrides:", -[PCMotionBundle infoDictionary](self, "infoDictionary"), v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[PCMotionBundle localizedInfoDictionaries](self, "localizedInfoDictionaries"), "setObject:forKeyedSubscript:", v7, a3);
  return v7;
}

+ (id)infoDictionaryWithDefaults:(id)a3 andOverrides:(id)a4
{
  void *v6;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v6, "addEntriesFromDictionary:", a3);
  objc_msgSend(v6, "addEntriesFromDictionary:", a4);
  return v6;
}

- (id)localizedInfoDictionaryWithDefaults:(id)a3
{
  return +[PCMotionBundle infoDictionaryWithDefaults:andOverrides:](PCMotionBundle, "infoDictionaryWithDefaults:andOverrides:", a3, -[PCMotionBundle localizedInfoDictionary](self, "localizedInfoDictionary"));
}

- (id)localizedInfoStringsForLocalization:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = +[PCMotionBundle urlForLocalizedInfoStringsInBundleURL:localization:](PCMotionBundle, "urlForLocalizedInfoStringsInBundleURL:localization:", self->_bundleURL, a3);
  if (!objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
    return 0;
  v4 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v3);
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
}

- (id)objectForInfoDictionaryKey:(id)a3 localization:(id)a4
{
  id result;

  result = (id)objc_msgSend(-[PCMotionBundle localizedInfoDictionaryForLocalization:](self, "localizedInfoDictionaryForLocalization:", a4), "objectForKeyedSubscript:", a3);
  if (!result)
    return -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle infoDictionary](self, "infoDictionary"), "objectForKeyedSubscript:", a3);
  return result;
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9
{
  return (id)objc_msgSend(a1, "infoDictionaryWithBundleVersion:version:projectFilePath:supportsFCPiPad:name:category:theme:additionalEntries:", a3, a4, a5, a6, a7, a8, a9, MEMORY[0x1E0C9AA70]);
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10
{
  return (id)objc_msgSend(a1, "infoDictionaryWithBundleVersion:identifier:version:projectFilePath:supportsFCPiPad:name:category:theme:additionalEntries:", a3, a4, a5, a6, a7, a8, a9, a10, MEMORY[0x1E0C9AA70]);
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 version:(id)a4 projectFilePath:(id)a5 supportsFCPiPad:(BOOL)a6 name:(id)a7 category:(id)a8 theme:(id)a9 additionalEntries:(id)a10
{
  return (id)objc_msgSend(a1, "infoDictionaryWithBundleVersion:identifier:version:projectFilePath:supportsFCPiPad:name:category:theme:additionalEntries:", a3, 0, a4, a5, a6, a7, a8, a9, a10);
}

+ (id)infoDictionaryWithBundleVersion:(unint64_t)a3 identifier:(id)a4 version:(id)a5 projectFilePath:(id)a6 supportsFCPiPad:(BOOL)a7 name:(id)a8 category:(id)a9 theme:(id)a10 additionalEntries:(id)a11
{
  _BOOL8 v12;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v24[9];
  _QWORD v25[11];

  v12 = a7;
  v25[9] = *MEMORY[0x1E0C80C00];
  v16 = +[PCMotionBundle nilOrNonEmptyString:](PCMotionBundle, "nilOrNonEmptyString:", a4);
  v24[0] = CFSTR("com.apple.motion.package.bundleVersion");
  v25[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v24[1] = CFSTR("com.apple.motion.package.identifier");
  if (!v16)
    v16 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  if (!a5)
    a5 = &stru_1E65EDDA0;
  v25[1] = v16;
  v25[2] = a5;
  v24[2] = CFSTR("com.apple.motion.package.version");
  v24[3] = CFSTR("com.apple.motion.package.projectFilePath");
  if (a6)
    v17 = (const __CFString *)a6;
  else
    v17 = &stru_1E65EDDA0;
  v25[3] = v17;
  v24[4] = CFSTR("com.apple.motion.package.supportsFCPiPad");
  v25[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v25[5] = a5;
  v24[5] = CFSTR("CFBundleShortVersionString");
  v24[6] = CFSTR("com.apple.motion.package.name");
  if (a8)
    v18 = (const __CFString *)a8;
  else
    v18 = &stru_1E65EDDA0;
  if (a9)
    v19 = (const __CFString *)a9;
  else
    v19 = &stru_1E65EDDA0;
  v25[6] = v18;
  v25[7] = v19;
  v24[7] = CFSTR("com.apple.motion.package.category");
  v24[8] = CFSTR("com.apple.motion.package.theme");
  if (a10)
    v20 = (const __CFString *)a10;
  else
    v20 = &stru_1E65EDDA0;
  v25[8] = v20;
  v21 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  if (objc_msgSend(a11, "count"))
    return (id)objc_msgSend(a1, "infoDictionaryWithDefaults:andOverrides:", v21, a11);
  return v21;
}

+ (id)serializeInfoDictionary:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, a4);
}

+ (id)urlForProjectFilePath:(id)a3 inBundleURL:(id)a4
{
  return (id)objc_msgSend(a4, "URLByAppendingPathComponent:", a3);
}

+ (id)urlForInfoDictionaryInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("Contents/Info.plist"));
}

+ (id)urlForResourcesInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources"), 1);
}

+ (id)urlForLocalizedResourcesInBundleURL:(id)a3 localization:(id)a4
{
  return (id)objc_msgSend(+[PCMotionBundle urlForResourcesInBundleURL:](PCMotionBundle, "urlForResourcesInBundleURL:", a3), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(a4, "stringByAppendingPathExtension:", CFSTR("lproj")), 1);
}

+ (id)urlForLocalizedInfoStringsInBundleURL:(id)a3 localization:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "urlForLocalizedResourcesInBundleURL:localization:", a3, a4), "URLByAppendingPathComponent:", CFSTR("InfoPlist.strings"));
}

+ (id)urlForLocalizableResourcesInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources/Base.lproj"), 1);
}

+ (id)urlForMediaInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources/Media"), 1);
}

+ (id)urlForLocalizableMediaInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources/Base.lproj/Media"), 1);
}

+ (id)urlForThumbnailsInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources/Thumbnail"), 1);
}

+ (id)urlForLocalizableThumbnailsInBundleURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents/Resources/Base.lproj/Thumbnail"), 1);
}

- (id)localizedParameterForKey:(id)a3
{
  id v4;

  v4 = -[NSDictionary objectForKeyedSubscript:](-[PCMotionBundle consolidatedLocalizedInfoDictionary](self, "consolidatedLocalizedInfoDictionary"), "objectForKeyedSubscript:", CFSTR("com.apple.motion.package.publishedParameters"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v4, "objectForKeyedSubscript:", a3);
  else
    return 0;
}

+ (id)createTempBundleWithProjectType:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(a1);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR(".")), 1, a4);
  if (!v8)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v9 = objc_msgSend(a1, "bundleExtensionForProjectType:", a3);
  v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "stringByAppendingPathExtension:", v9), 1);
  v22[0] = objc_msgSend(a1, "urlForThumbnailsInBundleURL:", v10);
  v22[1] = objc_msgSend(a1, "urlForMediaInBundleURL:", v10);
  v22[2] = objc_msgSend(a1, "urlForLocalizableResourcesInBundleURL:", v10);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
LABEL_4:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(v11);
      if (!objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), 1, 0, a4))goto LABEL_13;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v12)
          goto LABEL_4;
        break;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a1, "infoDictionaryWithBundleVersion:version:projectFilePath:supportsFCPiPad:name:category:theme:", objc_msgSend(a1, "currentBundleVersion"), &stru_1E65EDDA0, &stru_1E65EDDA0, 0, &stru_1E65EDDA0, &stru_1E65EDDA0, &stru_1E65EDDA0), "writeToURL:error:", objc_msgSend(a1, "urlForInfoDictionaryInBundleURL:", v10), a4))v15 = (void *)v10;
  else
    v15 = 0;
LABEL_14:
  objc_sync_exit(a1);
  return v15;
}

+ (id)createTempBundleByCopyingBundleAtURL:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_sync_enter(a1);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_msgSend(v7, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR(".")), 1, a4);
  if (v8)
  {
    v9 = objc_msgSend(a3, "pathExtension");
    v10 = objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString"), "stringByAppendingPathExtension:", v9), 1);
    if (objc_msgSend(v7, "copyItemAtURL:toURL:error:", a3, v10, a4))
      v11 = (void *)v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  objc_sync_exit(a1);
  return v11;
}

+ (BOOL)removeTempBundleDirectory:(id)a3 error:(id *)a4
{
  objc_sync_enter(a1);
  LOBYTE(a4) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(a3, "URLByDeletingLastPathComponent"), a4);
  objc_sync_exit(a1);
  return (char)a4;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("template")))
    self->_templateFlagsParseState.foundTemplate = 1;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("flags"))
    && self->_templateFlagsParseState.foundTemplate)
  {
    self->_templateFlagsParseState.foundTemplateFlag = 1;
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("scene")))
  {
    self->_templateFlagsParseState.success = 1;
    objc_msgSend(a3, "abortParsing");
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("flags"))
    && self->_templateFlagsParseState.foundTemplateFlag)
  {
    self->_templateFlagsParseState.success = 1;
    objc_msgSend(a3, "abortParsing");
  }
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("template")))
  {
    self->_templateFlagsParseState.success = 1;
    objc_msgSend(a3, "abortParsing");
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v6;

  if (self->_templateFlagsParseState.foundTemplateFlag)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v6, "setNumberStyle:", 1);
    self->_templateFlagsParseState.templateFlags = objc_msgSend((id)objc_msgSend(v6, "numberFromString:", a4), "unsignedIntValue");

  }
}

+ (BOOL)isStringNilOrEmpty:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isAllWhitespaceAndNewline");
  else
    return 1;
}

+ (id)nilOrNonEmptyString:(id)a3
{
  if (objc_msgSend(a1, "isStringNilOrEmpty:"))
    return 0;
  else
    return a3;
}

+ (id)nilOrNonEmptyString:(id)a3 withFallback:(id)a4
{
  id result;

  result = (id)objc_msgSend(a1, "nilOrNonEmptyString:", a3);
  if (!result)
    return (id)objc_msgSend(a1, "nilOrNonEmptyString:", a4);
  return result;
}

+ (id)nilOrNonEmptyString:(id)a3 withFallback1:(id)a4 fallback2:(id)a5
{
  return (id)objc_msgSend(a1, "nilOrNonEmptyString:withFallback:", objc_msgSend(a1, "nilOrNonEmptyString:withFallback:", a3, a4), a5);
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  NSArray *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PCMotionBundle;
  v17 = -[PCMotionBundle description](&v18, sel_description);
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale"), "localeIdentifier");
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "localizations");
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "preferredLocalizations");
  v13 = -[PCMotionBundle localizations](self, "localizations");
  v12 = -[PCMotionBundle preferredLocalizations](self, "preferredLocalizations");
  v11 = -[PCMotionBundle projectFilePath](self, "projectFilePath");
  v10 = -[PCMotionBundle projectTypeName](self, "projectTypeName");
  v9 = -[PCMotionBundle identifier](self, "identifier");
  v8 = -[PCMotionBundle version](self, "version");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PCMotionBundle majorVersion](self, "majorVersion"));
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PCMotionBundle minorVersion](self, "minorVersion"));
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PCMotionBundle bundleVersion](self, "bundleVersion"));
  if (-[PCMotionBundle supportsFCPiPad](self, "supportsFCPiPad"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  return -[NSString stringByAppendingFormat:](v17, "stringByAppendingFormat:", CFSTR("\nCurrent Locale: %@\nApplication supported localizations: %@\nApplication preferred localizations: %@\nlocalizations: %@\npreferred localizations: %@\nprojectFilePath: %@\nprojectType: %@\nidentifier: %@\nversion: '%@' (Maj: %@ Min: %@)\nbundleVersion: %@\nsupportsFCPiPad: %@\nlocalizedVersion: %@\nlocalizedName: %@\nlocalizedCategory: %@\nlocalizedTheme: %@\nlocalizedSmallThumbnailURL: %@\nlocalizedLargeThumbnailURL: %@"), v16, v15, v14, v13, v12, v11, v10, v9, v8, v3, v4, v5, v6, -[PCMotionBundle localizedVersion](self, "localizedVersion"), -[PCMotionBundle localizedName](self, "localizedName"), -[PCMotionBundle localizedCategory](self, "localizedCategory"),
           -[PCMotionBundle localizedTheme](self, "localizedTheme"),
           -[PCMotionBundle localizedSmallThumbnailURL](self, "localizedSmallThumbnailURL"),
           -[PCMotionBundle localizedLargeThumbnailURL](self, "localizedLargeThumbnailURL"));
}

- (void)setInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setLocalizedInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPreferredLocalizations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setLocalizations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void)setBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setConsolidatedLocalizedInfoDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setVersionComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setTemplateFlags:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (void)setLocalizedInfoDictionaries:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
