@implementation WebStorageManager

+ (id)sharedWebStorageManager
{
  id result;

  if (_MergedGlobals_25 == 1)
    return (id)qword_1ECEC9980;
  result = objc_alloc_init(WebStorageManager);
  qword_1ECEC9980 = (uint64_t)result;
  _MergedGlobals_25 = 1;
  return result;
}

- (WebStorageManager)init
{
  WebStorageManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebStorageManager;
  v2 = -[WebStorageManager init](&v4, sel_init);
  if (v2)
    WebKitInitializeStorageIfNecessary();
  return v2;
}

- (id)origins
{
  uint64_t v2;
  id v3;
  void *v4;
  WTF *v5;
  WTF *v6;
  WebSecurityOrigin *v7;
  uint64_t v8;
  StringImpl *v9;
  const void *v10;
  WTF *v11;
  unsigned int v12;
  unsigned int v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  void *v17;
  CFTypeRef v18;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  WTF *v23;
  int v24;
  unsigned int v25;
  WTF *v26;
  char v27;

  v2 = WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::origins(v2, (uint64_t)&v23);
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v4 = (void *)objc_msgSend(v3, "initWithCapacity:", v25);
  if (v25)
  {
    v5 = v23;
    v6 = (WTF *)((char *)v23 + 32 * v25);
    while (1)
    {
      v7 = [WebSecurityOrigin alloc];
      WebCore::SecurityOriginData::securityOrigin(v5);
      v8 = -[WebSecurityOrigin _initWithWebCoreSecurityOrigin:](v7, "_initWithWebCoreSecurityOrigin:", v26);
      v10 = (const void *)v8;
      v11 = v26;
      v26 = 0;
      if (v11)
      {
        do
        {
          v12 = __ldaxr((unsigned int *)v11);
          v13 = v12 - 1;
        }
        while (__stlxr(v13, (unsigned int *)v11));
        if (!v13)
          break;
      }
      if (v8)
        goto LABEL_8;
LABEL_3:
      v5 = (WTF *)((char *)v5 + 32);
      if (v5 == v6)
        goto LABEL_21;
    }
    atomic_store(1u, (unsigned int *)v11);
    v14 = (WTF::StringImpl *)*((_QWORD *)v11 + 6);
    *((_QWORD *)v11 + 6) = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v9);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = (WTF::StringImpl *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v9);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = *((unsigned int *)v11 + 8);
    if ((_DWORD)v16 != -1)
      ((void (*)(char *, char *))off_1E9D6E948[v16])(&v27, (char *)v11 + 8);
    *((_DWORD *)v11 + 8) = -1;
    WTF::fastFree(v11, v9);
    if (!v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(v4, "addObject:", v10);
    CFRelease(v10);
    goto LABEL_3;
  }
LABEL_21:
  v18 = (id)CFMakeCollectable(v4);
  v19 = (unsigned int *)v23;
  if (v25)
  {
    v20 = 32 * v25;
    do
    {
      v21 = v19[6];
      if ((_DWORD)v21 != -1)
        ((void (*)(WTF **, unsigned int *))off_1E9D6E948[v21])(&v26, v19);
      v19[6] = -1;
      v19 += 8;
      v20 -= 32;
    }
    while (v20);
    v19 = (unsigned int *)v23;
  }
  if (v19)
  {
    v23 = 0;
    v24 = 0;
    WTF::fastFree((WTF *)v19, v17);
  }
  return (id)v18;
}

- (void)deleteAllOrigins
{
  _QWORD *v2;

  v2 = (_QWORD *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::deleteAllOrigins(v2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtPath:error:", +[WebStorageManager _storageDirectoryPath](WebStorageManager, "_storageDirectoryPath"), 0);
}

- (void)deleteOrigin:(id)a3
{
  WTF::StringImpl *v4;

  v4 = (WTF::StringImpl *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::deleteOrigin(v4, (const WebCore::SecurityOriginData *)(objc_msgSend(a3, "_core") + 8));
}

- (unint64_t)diskUsageForOrigin:(id)a3
{
  WebKit::StorageTracker *v4;

  v4 = (WebKit::StorageTracker *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  return WebKit::StorageTracker::diskUsageForOrigin(v4, (WebCore::SecurityOrigin *)objc_msgSend(a3, "_core"));
}

- (void)syncFileSystemAndTrackerDatabase
{
  WebKit::StorageTracker *v2;

  v2 = (WebKit::StorageTracker *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::syncFileSystemAndTrackerDatabase(v2);
}

+ (id)_storageDirectoryPath
{
  if ((byte_1ECEC9979 & 1) != 0)
  {
    if (qword_1ECEC9990 == -1)
      return (id)qword_1ECEC9988;
  }
  else
  {
    qword_1ECEC9988 = 0;
    byte_1ECEC9979 = 1;
    if (qword_1ECEC9990 == -1)
      return (id)qword_1ECEC9988;
  }
  dispatch_once(&qword_1ECEC9990, &__block_literal_global_5);
  return (id)qword_1ECEC9988;
}

void __42__WebStorageManager__storageDirectoryPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  const void *v4;
  uint64_t v5;
  const void *v6;

  v0 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "objectForKey:", CFSTR("WebKitLocalStorageDatabasePathPreferenceKey"));
  v1 = v0;
  if (!v0 || (CFRetain(v0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v2 = (void *)objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", CFSTR("WebKit/LocalStorage"));
    v3 = v2;
    if (v2)
      CFRetain(v2);
    if (v1)
      CFRelease(v1);
    v1 = v3;
  }
  v4 = (const void *)objc_msgSend(v1, "stringByStandardizingPath");
  v5 = (uint64_t)v4;
  if (v4)
    CFRetain(v4);
  v6 = (const void *)qword_1ECEC9988;
  qword_1ECEC9988 = v5;
  if (v6)
    CFRelease(v6);
  if (v1)
    CFRelease(v1);
}

+ (void)setStorageDatabaseIdleInterval:(double)a3
{
  *(double *)(WebKit::StorageTracker::tracker((WebKit::StorageTracker *)a1) + 136) = a3;
}

@end
