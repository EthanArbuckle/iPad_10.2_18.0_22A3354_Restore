@implementation BundleIdResolver

- (BundleIdResolver)initWithProcessIdentifier:(int)a3
{
  void *v3;
  int v4;
  int v5;
  BundleIdResolver *v6;
  int v7;
  uint64_t v8;
  NSString *exePath;
  uint64_t v10;
  BundleIdResolverGuardedData *guardedData;
  objc_super v13;
  _BYTE buffer[4096];
  uint64_t v15;

  v3 = (void *)MEMORY[0x24BDAC7A8](self, a2, *(_QWORD *)&a3);
  v5 = v4;
  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = v3;
  v13.super_class = (Class)BundleIdResolver;
  v6 = -[BundleIdResolver init](&v13, sel_init);
  if (v6)
  {
    v7 = proc_pidpath(v5, buffer, 0x1000u);
    if (v7 < 1)
      v8 = 0;
    else
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, v7, 4);
    exePath = v6->_exePath;
    v6->_exePath = (NSString *)v8;

    v10 = objc_opt_new();
    guardedData = v6->_guardedData;
    v6->_guardedData = (BundleIdResolverGuardedData *)v10;

    pthread_mutex_init(&v6->_lock, 0);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)BundleIdResolver;
  -[BundleIdResolver dealloc](&v3, sel_dealloc);
}

- (void)_populateResultWithLockWitness:(id)a3
{
  CFURLRef v4;
  uint64_t v5;
  const void *v6;
  __CFBundle *Unique;
  __CFBundle *v8;
  const __CFString *Identifier;
  CFStringRef Copy;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;

  v15 = a3;
  v4 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_exePath, kCFURLPOSIXPathStyle, 0);
  v5 = _CFBundleCopyBundleURLForExecutableURL();
  if (v5)
  {
    v6 = (const void *)v5;
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (Unique)
    {
      v8 = Unique;
      Identifier = CFBundleGetIdentifier(Unique);
      if (Identifier)
      {
        Copy = CFStringCreateCopy(0, Identifier);
        v11 = (void *)v15[1];
        v15[1] = Copy;

        *((_BYTE *)v15 + 16) = 0;
      }
      CFRelease(v8);
    }
    CFRelease(v6);
  }
  CFRelease(v4);
  v12 = v15;
  if (!v15[1])
  {
    -[NSString lastPathComponent](self->_exePath, "lastPathComponent");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v15[1];
    v15[1] = v13;

    v12 = v15;
    *((_BYTE *)v15 + 16) = 1;
  }

}

- (id)bundleIdentifierOrProcessName:(BOOL *)a3
{
  _opaque_pthread_mutex_t *p_lock;
  BundleIdResolverGuardedData *guardedData;
  NSString *v7;

  if (!self->_exePath)
  {
    v7 = 0;
    return v7;
  }
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  guardedData = self->_guardedData;
  if (!guardedData->bundleIdOrProcName)
  {
    -[BundleIdResolver _populateResultWithLockWitness:](self, "_populateResultWithLockWitness:");
    guardedData = self->_guardedData;
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (a3)
  {
LABEL_4:
    *a3 = guardedData->isProcessName;
    guardedData = self->_guardedData;
  }
LABEL_5:
  v7 = guardedData->bundleIdOrProcName;
  pthread_mutex_unlock(p_lock);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardedData, 0);
  objc_storeStrong((id *)&self->_exePath, 0);
}

@end
