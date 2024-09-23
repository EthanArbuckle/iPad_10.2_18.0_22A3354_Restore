@implementation _PASBundleIdResolver

- (_PASBundleIdResolver)initWithProcessIdentifier:(int)a3
{
  void *v3;
  int v4;
  int v5;
  _PASBundleIdResolver *v6;
  int v7;
  uint64_t v8;
  NSString *exePath;
  _PASLock *v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  objc_super v15;
  _BYTE buffer[4096];
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0C80A78](self);
  v5 = v4;
  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = v3;
  v15.super_class = (Class)_PASBundleIdResolver;
  v6 = -[_PASBundleIdResolver init](&v15, sel_init);
  if (v6)
  {
    v7 = proc_pidpath(v5, buffer, 0x1000u);
    if (v7 < 1)
      v8 = 0;
    else
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v7, 4);
    exePath = v6->_exePath;
    v6->_exePath = (NSString *)v8;

    v10 = [_PASLock alloc];
    v11 = (void *)objc_opt_new();
    v12 = -[_PASLock initWithGuardedData:](v10, "initWithGuardedData:", v11);
    lock = v6->_lock;
    v6->_lock = (_PASLock *)v12;

  }
  return v6;
}

- (void)_populateResultWithLockWitness:(id)a3
{
  CFURLRef v5;
  uint64_t v6;
  const void *v7;
  __CFBundle *Unique;
  __CFBundle *v9;
  const __CFString *Identifier;
  CFStringRef Copy;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;

  v18 = a3;
  v5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_exePath, kCFURLPOSIXPathStyle, 0);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASBundleIdResolver.m"), 55, CFSTR("Failed to compute URL for filesystem path: \"%@\"), self->_exePath);

  }
  v6 = _CFBundleCopyBundleURLForExecutableURL();
  if (v6)
  {
    v7 = (const void *)v6;
    Unique = (__CFBundle *)_CFBundleCreateUnique();
    if (Unique)
    {
      v9 = Unique;
      Identifier = CFBundleGetIdentifier(Unique);
      if (Identifier)
      {
        Copy = CFStringCreateCopy(0, Identifier);
        if (!Copy)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASBundleIdResolver.m"), 65, CFSTR("Failed to copy bundleIdentifier."));

          Copy = 0;
        }
        v12 = (void *)v18[1];
        v18[1] = Copy;

        *((_BYTE *)v18 + 16) = 0;
      }
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  CFRelease(v5);
  v13 = v18;
  if (!v18[1])
  {
    -[NSString lastPathComponent](self->_exePath, "lastPathComponent");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v18[1];
    v18[1] = v14;

    v13 = v18;
    *((_BYTE *)v18 + 16) = 1;
  }

}

- (id)bundleIdentifierOrProcessName:(BOOL *)a3
{
  _PASLock *lock;
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (!self->_exePath)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__857;
  v11 = __Block_byref_object_dispose__858;
  v12 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54___PASBundleIdResolver_bundleIdentifierOrProcessName___block_invoke;
  v6[3] = &unk_1E442FB60;
  v6[5] = &v7;
  v6[6] = a3;
  v6[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_exePath, 0);
}

@end
