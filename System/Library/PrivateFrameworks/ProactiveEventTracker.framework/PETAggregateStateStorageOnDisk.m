@implementation PETAggregateStateStorageOnDisk

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  uint64_t (**v7)(id, uint64_t, uint64_t, uint64_t, _BYTE *);
  unsigned __int8 v8;
  int fd;
  unint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  unsigned int *bytes;
  uint64_t v14;
  char v15;
  unsigned __int8 v16;
  void *v17;
  char v18;

  v7 = (uint64_t (**)(id, uint64_t, uint64_t, uint64_t, _BYTE *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETAggregateStateStorage.m"), 301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8 = atomic_load((unsigned __int8 *)&self->_dead);
  if ((v8 & 1) == 0)
  {
    pthread_mutex_lock(&self->_localLock);
    if (!flock(self->_fd, 2))
    {
      if (a3)
      {
        v10 = -[PETAggregateStateStorageOnDisk _reserveCapacity:](self, "_reserveCapacity:", a3);
        v11 = atomic_load((unsigned __int8 *)&self->_dead);
        if ((v11 & 1) != 0)
          goto LABEL_5;
        v12 = v10;
      }
      else
      {
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      bytes = (unsigned int *)self->_bytes;
      v14 = bytes[2];
      if (self->_mappedLen == v14)
        goto LABEL_15;
      -[PETAggregateStateStorageOnDisk _remapWithFlock:](self, "_remapWithFlock:", 0);
      if (self->_mappedLen != v14)
        goto LABEL_6;
      v16 = atomic_load((unsigned __int8 *)&self->_dead);
      if ((v16 & 1) == 0)
      {
        bytes = (unsigned int *)self->_bytes;
        if (bytes)
        {
LABEL_15:
          v18 = 0;
          v15 = v7[2](v7, (uint64_t)(bytes + 3), bytes[1] - 12, v12, &v18);
          if (a3 && (v15 & 1) == 0)
            *((_DWORD *)self->_bytes + 1) -= a3;
          if (!v18 || -[PETAggregateStateStorageOnDisk resetLocked](self, "resetLocked"))
            goto LABEL_6;
        }
      }
    }
LABEL_5:
    -[PETAggregateStateStorageOnDisk _die](self, "_die");
LABEL_6:
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
      flock(fd, 8);
    pthread_mutex_unlock(&self->_localLock);
  }

}

- (unint64_t)_reserveCapacity:(unsigned int)a3
{
  _DWORD *bytes;
  uint64_t v4;
  int v5;
  int v8;
  int *v9;
  char *v10;
  _DWORD v11[2];
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  bytes = self->_bytes;
  v4 = bytes[1];
  v5 = v4 + a3;
  if (v4 + a3 > bytes[2])
  {
    if (ftruncate(self->_fd, (v5 + 4095) & 0xFFFFF000))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v8 = *__error();
        v9 = __error();
        v10 = strerror(*v9);
        v11[0] = 67109378;
        v11[1] = v8;
        v12 = 2080;
        v13 = v10;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not resize aggregate storage: [%i] %s", (uint8_t *)v11, 0x12u);
      }
      atomic_store(1u, (unsigned __int8 *)&self->_dead);
    }
    bytes = self->_bytes;
    bytes[2] = (v5 + 4095) & 0xFFFFF000;
  }
  bytes[1] = v5;
  return v4 - 12;
}

- (PETAggregateStateStorageOnDisk)initWithPath:(id)a3
{
  id v6;
  PETAggregateStateStorageOnDisk *v7;
  PETAggregateStateStorageOnDisk *v8;
  id v9;
  int v10;
  PETAggregateStateStorageOnDisk *v11;
  int v12;
  int *v13;
  char *v14;
  NSObject *v15;
  const char *v16;
  int v18;
  int *v19;
  char *v20;
  void *v21;
  char value;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETAggregateStateStorage.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v23.receiver = self;
  v23.super_class = (Class)PETAggregateStateStorageOnDisk;
  v7 = -[PETAggregateStateStorageOnDisk init](&v23, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  objc_storeStrong((id *)&v7->_path, a3);
  v9 = objc_retainAutorelease(v6);
  v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 514, 384);
  v8->_fd = v10;
  if (v10 < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v11 = 0;
      goto LABEL_12;
    }
    v12 = *__error();
    v13 = __error();
    v14 = strerror(*v13);
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 1024;
    v27 = v12;
    v28 = 2080;
    v29 = v14;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Could not open aggregate storage at %@: [%i] %s";
LABEL_14:
    _os_log_error_impl(&dword_18FAB0000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x1Cu);
    goto LABEL_11;
  }
  value = -1;
  if (fsetxattr(v10, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v18 = *__error();
    v19 = __error();
    v20 = strerror(*v19);
    *(_DWORD *)buf = 138412802;
    v25 = v9;
    v26 = 1024;
    v27 = v18;
    v28 = 2080;
    v29 = v20;
    v15 = MEMORY[0x1E0C81028];
    v16 = "Could not set RunningBoard file lock exception attribute at %@: [%i] %s";
    goto LABEL_14;
  }
  pthread_mutex_init(&v8->_localLock, 0);
  -[PETAggregateStateStorageOnDisk _remapWithFlock:](v8, "_remapWithFlock:", 1);
LABEL_7:
  v11 = v8;
LABEL_12:

  return v11;
}

- (void)dealloc
{
  void *bytes;
  int fd;
  objc_super v5;

  pthread_mutex_destroy(&self->_localLock);
  bytes = self->_bytes;
  if (bytes)
    munmap(bytes, self->_mappedLen);
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  v5.receiver = self;
  v5.super_class = (Class)PETAggregateStateStorageOnDisk;
  -[PETAggregateStateStorageOnDisk dealloc](&v5, sel_dealloc);
}

- (void)_remapWithFlock:(BOOL)a3
{
  unsigned __int8 v3;
  _BOOL4 v4;
  void *bytes;
  int fd;
  off_t st_size;
  size_t v9;
  int *v10;
  _DWORD *v11;
  int v12;
  unint64_t v13;
  unint64_t mappedLen;
  int v15;
  int *v16;
  char *v17;
  NSString *v18;
  int v19;
  NSString *path;
  stat v21;
  _BYTE __buf[18];
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_dead);
  if ((v3 & 1) != 0)
    return;
  v4 = a3;
  if (a3 && flock(self->_fd, 2))
    goto LABEL_7;
  bytes = self->_bytes;
  if (bytes)
  {
    if (munmap(bytes, self->_mappedLen))
      goto LABEL_7;
  }
  memset(&v21, 0, sizeof(v21));
  if (fstat(self->_fd, &v21))
    goto LABEL_7;
  st_size = v21.st_size;
  self->_mappedLen = v21.st_size;
  v9 = st_size;
  if (!st_size)
  {
    *(_QWORD *)__buf = 0x40CCC4DA157;
    *(_DWORD *)&__buf[8] = 4096;
    if (pwrite(self->_fd, __buf, 0xCuLL, 0) == -1 || ftruncate(self->_fd, 4096))
      goto LABEL_7;
    v9 = 4096;
    self->_mappedLen = 4096;
  }
  v10 = (int *)mmap(0, v9, 3, 513, self->_fd, 0);
  self->_bytes = v10;
  if (v10 != (int *)-1)
  {
    v11 = v10;
    v12 = *v10;
    if (*v10 != -867327657)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)__buf = 138412802;
        *(_QWORD *)&__buf[4] = path;
        *(_WORD *)&__buf[12] = 1024;
        *(_DWORD *)&__buf[14] = v12;
        v23 = 1024;
        v24 = -867327657;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Aggregate storage file %@ has wrong magic number: got %x, expected %x", __buf, 0x18u);
      }
      -[PETAggregateStateStorageOnDisk saveCorruptState](self, "saveCorruptState");
      if (!-[PETAggregateStateStorageOnDisk resetLocked](self, "resetLocked"))
        goto LABEL_7;
      v11 = self->_bytes;
    }
    v13 = v11[2];
    mappedLen = self->_mappedLen;
    if (mappedLen >= v13 && v11[1] <= v13)
      goto LABEL_26;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = self->_path;
      v19 = v11[1];
      *(_DWORD *)__buf = 138413058;
      *(_QWORD *)&__buf[4] = v18;
      *(_WORD *)&__buf[12] = 1024;
      *(_DWORD *)&__buf[14] = v19;
      v23 = 1024;
      v24 = v13;
      v25 = 2048;
      v26 = mappedLen;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Aggregate storage file %@ claims size %u, capacity %u, but is only %lu bytes", __buf, 0x22u);
    }
    -[PETAggregateStateStorageOnDisk saveCorruptState](self, "saveCorruptState");
    if (-[PETAggregateStateStorageOnDisk resetLocked](self, "resetLocked"))
    {
LABEL_26:
      if (!st_size)
        memset((char *)self->_bytes + 12, 255, 0x400uLL);
      goto LABEL_10;
    }
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = *__error();
    v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)__buf = 67109378;
    *(_DWORD *)&__buf[4] = v15;
    *(_WORD *)&__buf[8] = 2080;
    *(_QWORD *)&__buf[10] = v17;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Aggregate storage remap failed: [%i] %s", __buf, 0x12u);
  }
  -[PETAggregateStateStorageOnDisk _die](self, "_die");
LABEL_10:
  if (v4)
  {
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
      flock(fd, 8);
  }
}

- (void)_die
{
  int fd;

  atomic_store(1u, (unsigned __int8 *)&self->_dead);
  self->_bytes = 0;
  self->_mappedLen = 0;
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
}

- (BOOL)resetLocked
{
  _DWORD *bytes;
  unsigned __int8 v5;

  if (!self->_mappedLen)
    return 1;
  memset((char *)self->_bytes + 12, 255, 0x400uLL);
  bytes = self->_bytes;
  *(_QWORD *)bytes = 0x40CCC4DA157;
  bytes[2] = 4096;
  if (!ftruncate(self->_fd, 4096))
  {
    if (self->_mappedLen == *((_DWORD *)self->_bytes + 2))
      return 1;
    -[PETAggregateStateStorageOnDisk _remapWithFlock:](self, "_remapWithFlock:", 0);
    v5 = atomic_load((unsigned __int8 *)&self->_dead);
    if ((v5 & 1) == 0)
      return 1;
  }
  -[PETAggregateStateStorageOnDisk _die](self, "_die");
  return 0;
}

- (void)reset
{
  unsigned __int8 v2;
  _opaque_pthread_mutex_t *p_localLock;
  int fd;

  v2 = atomic_load((unsigned __int8 *)&self->_dead);
  if ((v2 & 1) == 0)
  {
    p_localLock = &self->_localLock;
    pthread_mutex_lock(&self->_localLock);
    if (flock(self->_fd, 2))
      -[PETAggregateStateStorageOnDisk _die](self, "_die");
    else
      -[PETAggregateStateStorageOnDisk resetLocked](self, "resetLocked");
    fd = self->_fd;
    if ((fd & 0x80000000) == 0)
      flock(fd, 8);
    pthread_mutex_unlock(p_localLock);
  }
}

- (void)saveCorruptState
{
  void *v3;
  id v4;

  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("corrupt"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "copyItemAtPath:toPath:error:", self->_path, v4, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
