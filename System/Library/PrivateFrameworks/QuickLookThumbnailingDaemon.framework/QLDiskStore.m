@implementation QLDiskStore

- (BOOL)hasThumbnailCache
{
  dispatch_sync((dispatch_queue_t)self->_afterInit, &__block_literal_global_5_0);
  return self->_disableCache == 0;
}

+ (id)diskStoreForURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFDictionary *Mutable;
  char v15[1025];
  statfs v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(&v16, 0, 512);
  if ((objc_msgSend(v4, "getFileSystemRepresentation:maxLength:", v15, 1024) & 1) == 0)
  {
    _log_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[QLDiskStore initWithURL:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_7;
  }
  if (statfs(v15, &v16))
  {
    _log_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[QLDiskStore initWithURL:].cold.2();
LABEL_7:

    v12 = 0;
    goto LABEL_8;
  }
  pthread_mutex_lock(&lock);
  Mutable = (const __CFDictionary *)diskStores;
  if (!diskStores)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kDiskStoresKeyCallback, MEMORY[0x1E0C9B3A0]);
    diskStores = (uint64_t)Mutable;
  }
  CFDictionaryGetValue(Mutable, &v16.f_fsid);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v4);
  pthread_mutex_unlock(&lock);
LABEL_8:

  return v12;
}

- (QLDiskStore)initWithURL:(id)a3
{
  const __CFURL *v4;
  QLDiskStore *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  QLDiskStore *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *afterInit;
  NSObject *v17;
  objc_super v19;
  _QWORD block[4];
  QLDiskStore *v21;
  UInt8 v22[2168];
  UInt8 buffer[1025];
  statfs __src;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFURL *)a3;
  v19.receiver = self;
  v19.super_class = (Class)QLDiskStore;
  v5 = -[QLDiskStore init](&v19, sel_init);
  if (!v5)
    goto LABEL_10;
  memset(&__src, 0, 512);
  if (!CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024))
  {
    _log_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLDiskStore initWithURL:].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_8;
  }
  if (!statfs((const char *)buffer, &__src))
  {
    memcpy(&v5->_fs_stat, &__src, sizeof(v5->_fs_stat));
    CFDictionarySetValue((CFMutableDictionaryRef)diskStores, &v5->_fs_stat.f_fsid, v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.quicklook.diskstore.inited", v14);
    afterInit = v5->_afterInit;
    v5->_afterInit = (OS_dispatch_queue *)v15;

    v17 = v5->_afterInit;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__QLDiskStore_initWithURL___block_invoke;
    block[3] = &unk_1E99D2FE8;
    v21 = v5;
    memcpy(v22, &__src, sizeof(v22));
    dispatch_async(v17, block);

LABEL_10:
    v13 = v5;
    goto LABEL_11;
  }
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[QLDiskStore initWithURL:].cold.2();
LABEL_8:

  v13 = 0;
LABEL_11:

  return v13;
}

uint64_t __27__QLDiskStore_initWithURL___block_invoke(uint64_t a1)
{
  char *v2;
  _BOOL8 v3;
  uint64_t result;

  v2 = (char *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "setDisableQuickLook:", file_exists((char *)(a1 + 128), ".ql_disablethumbnails"));
  if (objc_msgSend(*(id *)(a1 + 32), "disableQuickLook"))
    v3 = 1;
  else
    v3 = file_exists(v2, ".ql_disablecache");
  objc_msgSend(*(id *)(a1 + 32), "setDisableCache:", v3);
  result = objc_msgSend(*(id *)(a1 + 32), "disableQuickLook");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "disableCache");
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<QLDiskStore %s>"), -[QLDiskStore mountPath](self, "mountPath"));
}

- (void)executeBlock:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *afterInit;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  afterInit = self->_afterInit;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__QLDiskStore_executeBlock_onQueue___block_invoke;
  v11[3] = &unk_1E99D3010;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(afterInit, v11);

}

void __36__QLDiskStore_executeBlock_onQueue___block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

- (BOOL)acceptsThumbnails
{
  dispatch_sync((dispatch_queue_t)self->_afterInit, &__block_literal_global_3);
  return self->_disableQuickLook == 0;
}

- (BOOL)distant
{
  return (self->_fs_stat.f_flags & 0x1000) == 0 && strcmp("/", self->_fs_stat.f_mntonname) != 0;
}

- (BOOL)isExternalEncrypted
{
  dispatch_sync((dispatch_queue_t)self->_afterInit, &__block_literal_global_7);
  return self->_isExternalEncrypted;
}

- (unint64_t)availableDiskSpace
{
  return self->_fs_stat.f_bavail * self->_fs_stat.f_bsize;
}

- (const)mountPath
{
  return self->_fs_stat.f_mntonname;
}

+ (id)diskStores
{
  id v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  QLDiskStore *v6;
  QLDiskStore *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  QLDiskStore *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = MEMORY[0x1D8272ADC](0, 0, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    v11 = 0;
    while (1)
    {
      do
        v5 = MEMORY[0x1D8272AE8](v4, &v11, 0);
      while (v5 == 3);
      if (v5 == 2)
        break;
      v6 = [QLDiskStore alloc];
      v7 = -[QLDiskStore initWithURL:](v6, "initWithURL:", v11);
      _log_2();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412546;
          v13 = v11;
          v14 = 2112;
          v15 = v7;
          _os_log_error_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_ERROR, "Getting store for %@: %@", buf, 0x16u);
        }

        objc_msgSend(v2, "addObject:", v7);
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412290;
          v13 = v11;
          _os_log_error_impl(&dword_1D54AE000, v8, OS_LOG_TYPE_ERROR, "No store for %@", buf, 0xCu);
        }

      }
    }
    CFRelease(v4);
  }
  return v2;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (unsigned)disableQuickLook
{
  return self->_disableQuickLook;
}

- (void)setDisableQuickLook:(unsigned __int8)a3
{
  self->_disableQuickLook = a3;
}

- (unsigned)disableCache
{
  return self->_disableCache;
}

- (void)setDisableCache:(unsigned __int8)a3
{
  self->_disableCache = a3;
}

- (void)setIsExternalEncrypted:(BOOL)a3
{
  self->_isExternalEncrypted = a3;
}

- (statfs)fs_stat
{
  statfs *result;

  objc_copyStruct(retstr, &self->_fs_stat, 2168, 1, 0);
  return result;
}

- (void)setFs_stat:(statfs *)a3
{
  objc_copyStruct(&self->_fs_stat, a3, 2168, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterInit, 0);
}

- (void)initWithURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D54AE000, a2, a3, "Can't get file system representation for %@", a5, a6, a7, a8, 2u);
}

- (void)initWithURL:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1D54AE000, v0, v1, "Can't get FS stat for %s: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_2();
}

@end
