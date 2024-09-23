@implementation WebDatabaseManager

uint64_t __50__WebDatabaseManager_scheduleEmptyDatabaseRemoval__block_invoke()
{
  return WebCore::DatabaseTracker::emptyDatabaseFilesRemovalTaskDidFinish((WebCore::DatabaseTracker *)+[WebDatabaseManager removeEmptyDatabaseFiles](WebDatabaseManager, "removeEmptyDatabaseFiles"));
}

+ (void)removeEmptyDatabaseFiles
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const WTF::String *v23;
  StringImpl *v24;
  unsigned int v25;
  WTF::StringImpl *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  WTF::StringImpl *v30;
  char v31;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = objc_msgSend(v2, "objectForKey:", WebDatabaseDirectoryDefaultsKey);
  if (!v3 || (v4 = (__CFString *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v4 = CFSTR("~/Library/WebKit/Databases");
  v5 = (void *)-[__CFString stringByStandardizingPath](v4, "stringByStandardizingPath");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, 0);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *MEMORY[0x1E0CB2B30];
      for (i = (void *)objc_msgSend(v8, "objectAtIndex:", 0, *MEMORY[0x1E0CB2B30], v5);
            ;
            i = (void *)objc_msgSend(v8, "objectAtIndex:", v11, v28, v29))
      {
        v14 = i;
        if (objc_msgSend(i, "length"))
        {
          if (objc_msgSend(v14, "characterAtIndex:", 0) != 46)
          {
            v15 = (void *)objc_msgSend(v5, "stringByAppendingPathComponent:", v14);
            v31 = 0;
            if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v15, &v31))
            {
              if (v31
                && objc_msgSend((id)objc_msgSend(v6, "attributesOfItemAtPath:error:", v15, 0), "fileType") != v12)
              {
                v16 = (void *)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v15, 0);
                v17 = objc_msgSend(v16, "count");
                if (!v17)
                  goto LABEL_7;
                v18 = v17;
                v19 = 0;
                v20 = 0;
                do
                {
                  v21 = (void *)objc_msgSend(v16, "objectAtIndex:", v19);
                  if (objc_msgSend(v21, "length"))
                  {
                    if (objc_msgSend(v21, "characterAtIndex:", 0) != 46)
                    {
                      v22 = objc_msgSend(v15, "stringByAppendingPathComponent:", v21);
                      if (objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v22, &v31))
                      {
                        if (!v31)
                        {
                          MEMORY[0x1D82A3998](&v30, v22);
                          v25 = WebCore::DatabaseTracker::deleteDatabaseFileIfEmpty((WebCore::DatabaseTracker *)&v30, v23);
                          v26 = v30;
                          v30 = 0;
                          if (v26)
                          {
                            if (*(_DWORD *)v26 == 2)
                              WTF::StringImpl::destroy(v26, v24);
                            else
                              *(_DWORD *)v26 -= 2;
                          }
                          v20 += v25;
                        }
                      }
                    }
                  }
                  ++v19;
                }
                while (v18 != v19);
                v27 = v18 == v20;
                v12 = v28;
                v5 = v29;
                if (v27 || !objc_msgSend((id)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v15, 0), "count"))
LABEL_7:
                  rmdir((const char *)objc_msgSend(v15, "fileSystemRepresentation"));
              }
            }
          }
        }
        if (++v11 == v10)
          break;
      }
    }
  }
}

+ (void)scheduleEmptyDatabaseRemoval
{
  NSObject *global_queue;

  WebCore::DatabaseTracker::emptyDatabaseFilesRemovalTaskWillBeScheduled((WebCore::DatabaseTracker *)a1);
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_1);
}

+ (id)sharedWebDatabaseManager
{
  id result;

  if (_MergedGlobals_12 == 1)
    return (id)qword_1ECEC9848;
  result = objc_alloc_init(WebDatabaseManager);
  qword_1ECEC9848 = (uint64_t)result;
  _MergedGlobals_12 = 1;
  return result;
}

- (WebDatabaseManager)init
{
  WebDatabaseManager *v2;
  WebDatabaseManager *v3;
  uint64_t v4;
  WebCore::DatabaseManager *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebDatabaseManager;
  v2 = -[WebDatabaseManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies)
    {
      v4 = operator new();
      *(_OWORD *)(v4 + 8) = 0u;
      *(_OWORD *)(v4 + 24) = 0u;
      *(_OWORD *)(v4 + 40) = 0u;
      *(_QWORD *)v4 = &off_1E9D6E318;
      *(_QWORD *)(v4 + 56) = &unk_1E9D6E458;
      WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies = v4;
      v2 = (WebDatabaseManager *)WebCore::setPlatformStrategies();
    }
    v5 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)v2);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = objc_msgSend(v6, "objectForKey:", WebDatabaseDirectoryDefaultsKey);
    if (!v7 || (v8 = (__CFString *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      v8 = CFSTR("~/Library/WebKit/Databases");
    MEMORY[0x1D82A3998](&v12, -[__CFString stringByStandardizingPath](v8, "stringByStandardizingPath"));
    WebCore::DatabaseManager::initialize(v5, (const WTF::String *)&v12);
    v10 = v12;
    v12 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
      {
        WTF::StringImpl::destroy(v10, v9);
          goto LABEL_11;
        goto LABEL_14;
      }
      *(_DWORD *)v10 -= 2;
    }
    {
LABEL_11:
      WebCore::DatabaseManager::setClient();
      return v3;
    }
LABEL_14:
    WTF::NeverDestroyed<WebKit::WebDatabaseManagerClient,WTF::AnyThreadsAccessTraits>::NeverDestroyed<>(WebKit::WebDatabaseManagerClient::sharedWebDatabaseManagerClient(void)::sharedClient);
    goto LABEL_11;
  }
  return v3;
}

- (id)origins
{
  WebCore::DatabaseTracker *v2;
  void *v3;
  WebCore::SecurityOriginData *v4;
  WebSecurityOrigin *v5;
  uint64_t v6;
  StringImpl *v7;
  const void *v8;
  WTF *v9;
  unsigned int v10;
  unsigned int v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  uint64_t v14;
  void *v15;
  CFTypeRef v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  WTF *v21;
  unsigned int v22;
  WTF *v23;
  char v24;

  v2 = (WebCore::DatabaseTracker *)WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  WebCore::DatabaseTracker::origins(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v22);
  if (v22)
  {
    v4 = v21;
    while (1)
    {
      v5 = [WebSecurityOrigin alloc];
      WebCore::SecurityOriginData::securityOrigin(v4);
      v6 = -[WebSecurityOrigin _initWithWebCoreSecurityOrigin:](v5, "_initWithWebCoreSecurityOrigin:", v23);
      v8 = (const void *)v6;
      v9 = v23;
      v23 = 0;
      if (v9)
      {
        do
        {
          v10 = __ldaxr((unsigned int *)v9);
          v11 = v10 - 1;
        }
        while (__stlxr(v11, (unsigned int *)v9));
        if (!v11)
          break;
      }
      if (v6)
        goto LABEL_8;
LABEL_3:
      v4 = (WebCore::SecurityOriginData *)((char *)v4 + 32);
      if (v4 == (WTF *)((char *)v21 + 32 * v22))
        goto LABEL_21;
    }
    atomic_store(1u, (unsigned int *)v9);
    v12 = (WTF::StringImpl *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 6) = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v7);
      else
        *(_DWORD *)v12 -= 2;
    }
    v13 = (WTF::StringImpl *)*((_QWORD *)v9 + 5);
    *((_QWORD *)v9 + 5) = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v7);
      else
        *(_DWORD *)v13 -= 2;
    }
    v14 = *((unsigned int *)v9 + 8);
    if ((_DWORD)v14 != -1)
      ((void (*)(char *, char *))off_1E9D6D470[v14])(&v24, (char *)v9 + 8);
    *((_DWORD *)v9 + 8) = -1;
    WTF::fastFree(v9, v7);
    if (!v8)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(v3, "addObject:", v8);
    CFRelease(v8);
    goto LABEL_3;
  }
LABEL_21:
  v16 = (id)CFMakeCollectable(v3);
  v17 = (unsigned int *)v21;
  if (v22)
  {
    v18 = 32 * v22;
    do
    {
      v19 = v17[6];
      if ((_DWORD)v19 != -1)
        ((void (*)(WTF **, unsigned int *))off_1E9D6D470[v19])(&v23, v17);
      v17[6] = -1;
      v17 += 8;
      v18 -= 32;
    }
    while (v18);
    v17 = (unsigned int *)v21;
  }
  if (v17)
    WTF::fastFree((WTF *)v17, v15);
  return (id)v16;
}

- (id)databasesWithOrigin:(id)a3
{
  id v3;
  const WTF::String *v4;
  void *v5;
  WTF *v6;
  uint64_t v7;
  const void *v8;
  StringImpl *v9;
  WTF::StringImpl **v10;
  uint64_t v11;
  WTF::StringImpl *v12;
  WTF *v14;
  unsigned int v15;
  CFTypeRef cf;

  v3 = a3;
  if (a3)
  {
    WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
    objc_msgSend(v3, "_core");
    WebCore::DatabaseTracker::databaseNames();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    if (v15)
    {
      v6 = v14;
      v7 = 8 * v15;
      do
      {
        WTF::makeNSArrayElement(v6, v4);
        if (cf)
        {
          objc_msgSend(v5, "addObject:");
          v8 = cf;
          cf = 0;
          CFRelease(v8);
        }
        v6 = (WTF *)((char *)v6 + 8);
        v7 -= 8;
      }
      while (v7);
    }
    v3 = (id)CFMakeCollectable(v5);
    if (v15)
    {
      v10 = (WTF::StringImpl **)v14;
      v11 = 8 * v15;
      do
      {
        v12 = *v10;
        *v10 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2)
            WTF::StringImpl::destroy(v12, v9);
          else
            *(_DWORD *)v12 -= 2;
        }
        ++v10;
        v11 -= 8;
      }
      while (v11);
    }
    if (v14)
      WTF::fastFree(v14, v9);
  }
  return v3;
}

- (id)detailsForDatabase:(id)a3 withOrigin:(id)a4
{
  WebCore::DatabaseManager *v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  void *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v6 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)self);
  MEMORY[0x1D82A3998](&v13, a3);
  WebCore::DatabaseManager::detailsForNameAndOrigin(v6, (const WTF::String *)&v13, (WebCore::SecurityOrigin *)objc_msgSend(a4, "_core"));
  v8 = v13;
  v13 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v7);
      if (v14)
        goto LABEL_6;
      goto LABEL_13;
    }
    *(_DWORD *)v8 -= 2;
  }
  if (v14)
  {
LABEL_6:
    v18[0] = WebDatabaseDisplayNameKey;
    if (v15 && *((_DWORD *)v15 + 1))
      a3 = (id)WTF::StringImpl::operator NSString *();
    v19[0] = a3;
    v18[1] = WebDatabaseExpectedSizeKey;
    v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16, v13);
    v18[2] = WebDatabaseUsageKey;
    v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v10 = v15;
    v15 = 0;
    if (!v10)
      goto LABEL_16;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
  v10 = v15;
  v15 = 0;
  if (!v10)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v10 == 2)
  {
    WTF::StringImpl::destroy(v10, v7);
    v11 = v14;
    v14 = 0;
    if (!v11)
      return v9;
    goto LABEL_19;
  }
  *(_DWORD *)v10 -= 2;
LABEL_16:
  v11 = v14;
  v14 = 0;
  if (!v11)
    return v9;
LABEL_19:
  if (*(_DWORD *)v11 == 2)
    WTF::StringImpl::destroy(v11, v7);
  else
    *(_DWORD *)v11 -= 2;
  return v9;
}

- (void)deleteAllDatabases
{
  WebCore::DatabaseTracker *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  v2 = (WebCore::DatabaseTracker *)WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  WebCore::DatabaseTracker::deleteAllDatabasesImmediately(v2);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = objc_msgSend(v4, "objectForKey:", WebDatabaseDirectoryDefaultsKey);
  if (!v5 || (v6 = (__CFString *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    v6 = CFSTR("~/Library/WebKit/Databases");
  objc_msgSend(v3, "removeItemAtPath:error:", -[__CFString stringByStandardizingPath](v6, "stringByStandardizingPath"), 0);
}

- (BOOL)deleteOrigin:(id)a3
{
  if (!a3)
    return 0;
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  objc_msgSend(a3, "_core");
  return WebCore::DatabaseTracker::deleteOrigin();
}

- (BOOL)deleteDatabase:(id)a3 withOrigin:(id)a4
{
  StringImpl *v6;
  char v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  if (!a4)
    return 0;
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  objc_msgSend(a4, "_core");
  MEMORY[0x1D82A3998](&v10, a3);
  v7 = WebCore::DatabaseTracker::deleteDatabase();
  v8 = v10;
  v10 = 0;
  if (!v8)
    return v7;
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return v7;
  }
  WTF::StringImpl::destroy(v8, v6);
  return v7;
}

- (void)deleteAllIndexedDatabases
{
  uint64_t v2;

  {
    v2 = WebDatabaseProvider::singleton(void)::databaseProvider;
  }
  else
  {
    v2 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v2 + 8) = 1;
    *(_QWORD *)v2 = &unk_1E9D6D510;
    *(_QWORD *)(v2 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v2;
  }
  WebDatabaseProvider::deleteAllDatabases((_QWORD *)v2);
}

@end
