@implementation RBAssertionOriginatorPidStore

- (void)addPid:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_addPidToSharedMemory:](self, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_addPidToSharedMemory:(_QWORD *)a1
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  _DWORD *v8;
  uint64_t v9;
  size_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a1 && a1[3] && a1[1])
  {
    if (-[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:]((uint64_t)a1, a2) == -1)
    {
      if (!-[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary](a1))
      {
        rbs_assertion_log();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          -[RBAssertionOriginatorPidStore _lock_addPidToSharedMemory:].cold.1(v4);
        goto LABEL_13;
      }
      v8 = (_DWORD *)a1[3];
      v9 = a1[1];
      v8[*(unsigned int *)(v9 + 4)] = a2;
      v10 = (*(_DWORD *)(v9 + 4) + 1);
      *(_DWORD *)(v9 + 4) = v10;
      qsort(v8, v10, 4uLL, (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
      rbs_assertion_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v11 = *(_DWORD *)a1[1];
        v12 = *(_DWORD *)(a1[1] + 4);
        v13 = 67109632;
        v14 = a2;
        v15 = 1024;
        v16 = v12;
        v17 = 1024;
        v18 = v11;
        v5 = "Added pid %d to RBSAssertionManagerStore; count %d; size %d";
        v6 = v4;
        v7 = 20;
        goto LABEL_10;
      }
    }
    else
    {
      rbs_assertion_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v13 = 67109120;
        v14 = a2;
        v5 = "Ignoring existing pid %d in RBSAssertionManagerStore";
        v6 = v4;
        v7 = 8;
LABEL_10:
        _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v13, v7);
      }
    }
LABEL_13:

  }
}

- (uint64_t)_lock_resizeSharedMemoryIfNecessary
{
  uint64_t v1;
  int *v2;
  int v3;
  int v4;
  size_t v5;
  void *v6;
  const __CFString *v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  int *v12;
  NSObject *v13;
  NSObject *v14;
  char v16;
  int v17;
  void *__dst;

  v1 = (uint64_t)a1;
  if (a1)
  {
    if (!a1[3])
      return 0;
    v2 = (int *)a1[1];
    if (!v2)
      return 0;
    v3 = *v2;
    if (v2[1] < *v2)
      return 1;
    v4 = 2 * v3;
    v5 = 4 * (2 * v3);
    v6 = (void *)a1[2];
    if (v2[2])
      v7 = CFSTR("pids1");
    else
      v7 = CFSTR("pids2");
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    __dst = 0;
    v17 = 0;
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    shm_unlink((const char *)objc_msgSend(v8, "UTF8String"));
    v9 = objc_retainAutorelease(v8);
    if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:](v1, (char *)objc_msgSend(v9, "UTF8String"), v5, &__dst, &v17, &v16))
    {
      v10 = __dst;
      if (__dst)
      {
        memcpy(__dst, *(const void **)(v1 + 24), 4 * **(unsigned int **)(v1 + 8));
        munmap(*(void **)(v1 + 24), 4 * **(unsigned int **)(v1 + 8));
        close(*(_DWORD *)(v1 + 36));
        if (*(_DWORD *)(*(_QWORD *)(v1 + 8) + 8))
          v11 = "pids2";
        else
          v11 = "pids1";
        shm_unlink(v11);
        *(_QWORD *)(v1 + 24) = v10;
        *(_DWORD *)(v1 + 36) = v17;
        v12 = *(int **)(v1 + 8);
        v12[2] = 1 - v12[2];
        *v12 = v4;
        rbs_assertion_log();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary].cold.2(v4, v13);

        v1 = 1;
        goto LABEL_23;
      }
      rbs_assertion_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[RBAssertionOriginatorPidStore _lock_resizeSharedMemoryIfNecessary].cold.1();
    }
    else
    {
      rbs_assertion_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.1();
    }

    -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory](v1);
    v1 = 0;
LABEL_23:

  }
  return v1;
}

- (uint64_t)_lock_indexOfPidInSharedMemory:(uint64_t)result
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  void *v5;
  int __key;

  __key = a2;
  if (result)
  {
    v2 = result;
    v3 = *(const void **)(result + 24);
    if (v3 && (v4 = *(_QWORD *)(result + 8)) != 0)
    {
      v5 = bsearch(&__key, v3, *(unsigned int *)(v4 + 4), 4uLL, (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
      if (v5)
        return ((unint64_t)v5 - *(_QWORD *)(v2 + 24)) >> 2;
      else
        return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (RBAssertionOriginatorPidStore)initWithPath:(id)a3
{
  id v4;
  RBAssertionOriginatorPidStore *v5;
  RBAssertionOriginatorPidStore *v6;
  uint64_t v7;
  NSString *path;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBAssertionOriginatorPidStore;
  v5 = -[RBAssertionOriginatorPidStore init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    path = v6->_path;
    v6->_path = (NSString *)v7;

    -[RBAssertionOriginatorPidStore _allocSharedMemory]((uint64_t)v6);
  }

  return v6;
}

- (void)_allocSharedMemory
{
  os_unfair_lock_s *v2;
  id v3;
  uint64_t *v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  char isPidData;
  char v9;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 16), "stringByAppendingPathComponent:", CFSTR("header"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (uint64_t *)(a1 + 8);
    if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:](a1, (char *)objc_msgSend(v3, "UTF8String"), 0xCuLL, (void **)(a1 + 8), (int *)(a1 + 32), &v9))
    {
      if (v9)
      {
        v5 = *v4;
        if (*v4)
        {
          *(_QWORD *)v5 = 4096;
          *(_DWORD *)(v5 + 8) = 0;
        }
      }
      if (-[RBAssertionOriginatorPidStore _lock_isHeaderValid](a1))
      {
        if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 8))
          v6 = CFSTR("pids2");
        else
          v6 = CFSTR("pids1");
        objc_msgSend(*(id *)(a1 + 16), "stringByAppendingPathComponent:", v6);
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (-[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:](a1, (char *)objc_msgSend(v7, "UTF8String"), 4 * **(unsigned int **)(a1 + 8), (void **)(a1 + 24), (int *)(a1 + 36), &v9))
        {
          isPidData = -[RBAssertionOriginatorPidStore _lock_isPidDataValid](a1);

          if ((isPidData & 1) != 0)
            goto LABEL_15;
        }
        else
        {

        }
      }
    }
    -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory](a1);
LABEL_15:
    os_unfair_lock_unlock(v2);

  }
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  $938B03310D06493B2963E5A84CB75A7E *header;
  id v5;
  uint64_t v6;
  void *v7;
  NSString *path;
  uint64_t pidsID;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  header = self->_header;
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  path = self->_path;
  pidsID = self->_pidsID;
  if (header)
    v10 = objc_msgSend(v5, "initWithFormat:", CFSTR("<%@| path:%@ headerID:%d pidsID:%d header:{size:%u count:%u bufferIndex:%u}"), v6, path, self->_headerID, pidsID, self->_header->var0, self->_header->var1, self->_header->var2);
  else
    v10 = objc_msgSend(v5, "initWithFormat:", CFSTR("<%@| path:%@ headerID:%d pidsID:%d>"), v6, path, self->_headerID, pidsID, v13, v14, v15);
  v11 = (void *)v10;

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v11;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_deallocSharedMemory]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)RBAssertionOriginatorPidStore;
  -[RBAssertionOriginatorPidStore dealloc](&v4, sel_dealloc);
}

- (void)_lock_deallocSharedMemory
{
  void *v2;
  unsigned int *v3;
  const __CFString *v4;
  id v5;
  void *v6;
  id v7;

  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      v3 = *(unsigned int **)(a1 + 8);
      if (v3)
      {
        munmap(v2, 4 * *v3);
        close(*(_DWORD *)(a1 + 36));
        if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 8))
          v4 = CFSTR("pids2");
        else
          v4 = CFSTR("pids1");
        objc_msgSend(*(id *)(a1 + 16), "stringByAppendingPathComponent:", v4);
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        shm_unlink((const char *)objc_msgSend(v5, "UTF8String"));
        *(_QWORD *)(a1 + 24) = 0;

      }
    }
    v6 = *(void **)(a1 + 8);
    if (v6)
    {
      munmap(v6, 0xCuLL);
      close(*(_DWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 16), "stringByAppendingPathComponent:", CFSTR("header"));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      shm_unlink((const char *)objc_msgSend(v7, "UTF8String"));
      *(_QWORD *)(a1 + 8) = 0;

    }
  }
}

- (void)removePid:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:]((uint64_t)self, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_removePidFromSharedMemory:(uint64_t)a1
{
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  _DWORD v13[2];
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a1 && *(_QWORD *)(a1 + 24) && *(_QWORD *)(a1 + 8))
  {
    v4 = -[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:](a1, a2);
    if (v4 == -1)
    {
      rbs_assertion_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:].cold.1(a2, v10);
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 8);
      v6 = *(_DWORD *)(v5 + 4);
      LODWORD(v7) = v6 - 1;
      if (v6 <= 1)
      {
        v8 = *(_QWORD *)(a1 + 24);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 24);
        if (v4 < v7)
        {
          v9 = v4;
          do
          {
            *(_DWORD *)(v8 + 4 * v9) = *(_DWORD *)(v8 + 4 * v9 + 4);
            v7 = (*(_DWORD *)(v5 + 4) - 1);
            ++v9;
          }
          while (v9 < v7);
        }
      }
      *(_DWORD *)(v5 + 4) = v7;
      *(_DWORD *)(v8 + 4 * v7) = 0;
      rbs_assertion_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = **(_DWORD **)(a1 + 8);
        v12 = *(_DWORD *)(*(_QWORD *)(a1 + 8) + 4);
        v13[0] = 67109632;
        v13[1] = a2;
        v14 = 1024;
        v15 = v12;
        v16 = 1024;
        v17 = v11;
        _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_INFO, "Removed pid %d from RBSAssertionManagerStore; count %d; size %d",
          (uint8_t *)v13,
          0x14u);
      }
    }

  }
}

- (BOOL)isValid
{
  RBAssertionOriginatorPidStore *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_pids != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)containsPid:(int)a3
{
  os_unfair_lock_s *p_lock;
  BOOL v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
    v6 = -[RBAssertionOriginatorPidStore _lock_indexOfPidInSharedMemory:]((uint64_t)self, a3) != -1;
  else
    v6 = 0;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setValidProcesses:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  int __key;
  _QWORD v8[6];
  _QWORD v9[3];
  int v10;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_pids)
  {
    v5 = malloc_type_malloc(4 * objc_msgSend(v4, "count"), 0x100004052888210uLL);
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v10 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __51__RBAssertionOriginatorPidStore_setValidProcesses___block_invoke;
    v8[3] = &unk_24DD47078;
    v8[4] = v9;
    v8[5] = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
    qsort(v5, objc_msgSend(v4, "count"), 4uLL, (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids);
    if (self->_header->var1)
    {
      v6 = 0;
      do
      {
        __key = 0;
        __key = self->_pids[v6];
        if (!bsearch(&__key, v5, objc_msgSend(v4, "count"), 4uLL, (int (__cdecl *)(const void *, const void *))_RBAssertionManagerStoreComparePids))
        {
          -[RBAssertionOriginatorPidStore _lock_removePidFromSharedMemory:]((uint64_t)self, __key);
          --v6;
        }
        ++v6;
      }
      while (v6 < self->_header->var1);
    }
    free(v5);
    _Block_object_dispose(v9, 8);
  }
  os_unfair_lock_unlock(&self->_lock);

}

void __51__RBAssertionOriginatorPidStore_setValidProcesses___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) = objc_msgSend(v3, "pid");

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (NSString)stateCaptureTitle
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)_lock_allocSharedMemoryWithName:(size_t)a3 size:(void *)a4 address:(int *)a5 fileDescriptor:(_BYTE *)a6 created:
{
  int v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  stat v15;

  if (!result)
    return result;
  *a4 = (void *)-1;
  v10 = shm_open(a2, 514, 384);
  *a5 = v10;
  if (v10 < 0)
  {
    rbs_assertion_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.2();
    goto LABEL_12;
  }
  memset(&v15, 0, sizeof(v15));
  v11 = fstat(v10, &v15);
  v12 = *a5;
  if (v11 == -1 || v15.st_size)
  {
    *a4 = mmap(0, a3, 3, 1, v12, 0);
    *a6 = 0;
    goto LABEL_13;
  }
  if (ftruncate(v12, a3) < 0)
  {
    rbs_assertion_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[RBAssertionOriginatorPidStore _lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:].cold.1();
LABEL_12:

    goto LABEL_13;
  }
  *a4 = mmap(0, a3, 3, 1, *a5, 0);
  *a6 = 1;
LABEL_13:
  v14 = *a4;
  if (*a4 == (void *)-1)
  {
    v14 = 0;
    *a4 = 0;
  }
  return v14 != 0;
}

- (uint64_t)_lock_isHeaderValid
{
  _DWORD *v1;
  int **v2;
  NSObject *v3;

  if (result)
  {
    v2 = (int **)(result + 8);
    v1 = *(_DWORD **)(result + 8);
    if (!v1)
      return 0;
    if (*(_DWORD *)(*(_QWORD *)(result + 8) + 4) > *v1)
    {
      rbs_assertion_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[RBAssertionOriginatorPidStore _lock_isHeaderValid].cold.1(v2, v3);

      return 0;
    }
    return 1;
  }
  return result;
}

- (uint64_t)_lock_isPidDataValid
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  _DWORD *v10;
  int v11;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 24);
    if (v2 && (v3 = *(_QWORD *)(result + 8)) != 0)
    {
      v4 = *(_DWORD *)(v3 + 4);
      if (v4 >= 2)
      {
        v5 = 0;
        v6 = 4 * (v4 - 1);
        while (v6 != v5)
        {
          v8 = *(_DWORD *)(v2 + v5);
          v7 = *(_DWORD *)(v2 + v5 + 4);
          v5 += 4;
          if (v8 >= v7)
          {
            rbs_assertion_log();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              v10 = (_DWORD *)(*(_QWORD *)(v1 + 24) + v5);
              v11 = *(v10 - 1);
              LODWORD(v10) = *v10;
              v12[0] = 67109376;
              v12[1] = v11;
              v13 = 1024;
              v14 = (int)v10;
              _os_log_error_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_ERROR, "Shared memory for RBSAssertionManagerStore contains misordered or duplicate pids: %d; %d",
                (uint8_t *)v12,
                0xEu);
            }

            return 0;
          }
        }
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_lock_addPidToSharedMemory:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21A8B4000, log, OS_LOG_TYPE_ERROR, "Abandoning attempt to add pid to shared memory as resize failed", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_lock_removePidFromSharedMemory:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Cannot remove unknown pid %d from RBSAssertionManagerStore", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_10(&dword_21A8B4000, v0, v1, "Error setting size of shared memory for RBSAssertionManagerStore: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

- (void)_lock_allocSharedMemoryWithName:size:address:fileDescriptor:created:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_10(&dword_21A8B4000, v0, v1, "Error opening shared memory for RBSAssertionManagerStore: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_9();
}

- (void)_lock_isHeaderValid
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = **a1;
  v3 = (*a1)[1];
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Shared memory for RBSAssertionManagerStore contains a bad header.  count: %d; size: %d",
    (uint8_t *)v4,
    0xEu);
}

- (void)_lock_resizeSharedMemoryIfNecessary
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_DEBUG, "Resized RBSAssertionManagerStore shared memory to %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1_0();
}

@end
