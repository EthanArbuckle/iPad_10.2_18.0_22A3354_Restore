@implementation PETReservoirSamplingLogStoreFile

- (PETReservoirSamplingLogStoreFile)initWithPath:(id)a3
{
  id v4;
  PETReservoirSamplingLogStoreFile *v5;
  uint64_t v6;
  NSString *path;
  id v8;
  int v9;
  PETReservoirSamplingLogStoreFile *v10;
  int v12;
  int *v13;
  char *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PETReservoirSamplingLogStoreFile;
  v5 = -[PETReservoirSamplingLogStoreFile init](&v15, sel_init);
  if (v5
    && (v6 = objc_msgSend(v4, "copy"),
        path = v5->_path,
        v5->_path = (NSString *)v6,
        path,
        v8 = objc_retainAutorelease(v4),
        v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 514, 384),
        v5->_fd = v9,
        v9 < 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v12 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 138412802;
      v17 = v8;
      v18 = 1024;
      v19 = v12;
      v20 = 2080;
      v21 = v14;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not open sampled log at %@: [%i] %s", buf, 0x1Cu);
    }
    v10 = 0;
  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)dealloc
{
  int fd;
  objc_super v4;

  -[PETReservoirSamplingLogStoreFile _unmap](self, "_unmap");
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)PETReservoirSamplingLogStoreFile;
  -[PETReservoirSamplingLogStoreFile dealloc](&v4, sel_dealloc);
}

- (BOOL)lock
{
  int fd;
  _BOOL4 v3;
  int v4;
  int *v5;
  char *v6;
  _DWORD v8[2];
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  fd = self->_fd;
  if (fd < 0 || !flock(fd, 2))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v3)
    {
      v4 = *__error();
      v5 = __error();
      v6 = strerror(*v5);
      v8[0] = 67109378;
      v8[1] = v4;
      v9 = 2080;
      v10 = v6;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not lock file: [%i] %s", (uint8_t *)v8, 0x12u);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)unlock
{
  int fd;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
    flock(fd, 8);
}

- (unint64_t)currentLength
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  if (fstat(self->_fd, &v3))
    return 0;
  else
    return v3.st_size;
}

- (void)_unmap
{
  void *ptr;
  void **p_ptr;

  p_ptr = &self->_ptr;
  ptr = self->_ptr;
  if (ptr)
  {
    munmap(ptr, self->_mapLen);
    *p_ptr = 0;
    p_ptr[1] = 0;
  }
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3
{
  unint64_t v5;
  $BC5B52E09B2B7D90AC3928E0EFF6AC05 *result;
  int v7;
  int *v8;
  char *v9;
  _DWORD v10[2];
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PETReservoirSamplingLogStoreFile _unmap](self, "_unmap");
  v5 = -[PETReservoirSamplingLogStoreFile currentLength](self, "currentLength");
  self->_mapLen = v5;
  result = ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)mmap(0, v5, 3, 1, self->_fd, 0);
  if (result == ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)-1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = *__error();
      v8 = __error();
      v9 = strerror(*v8);
      v10[0] = 67109378;
      v10[1] = v7;
      v11 = 2080;
      v12 = v9;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not map header: [%i] %s", (uint8_t *)v10, 0x12u);
    }
    result = 0;
  }
  self->_ptr = result;
  if (a3)
    *a3 = self->_mapLen;
  return result;
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)headerMap:(unint64_t *)a3
{
  $BC5B52E09B2B7D90AC3928E0EFF6AC05 *result;

  result = ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)self->_ptr;
  if (!result)
    return -[PETReservoirSamplingLogStoreFile remap:](self, "remap:", a3);
  if (a3)
    *a3 = self->_mapLen;
  return result;
}

- (BOOL)changeLength:(unint64_t)a3
{
  int v3;
  int v5;
  int *v6;
  char *v7;
  _DWORD v8[2];
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = ftruncate(self->_fd, a3);
  if (v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    v8[0] = 67109378;
    v8[1] = v5;
    v9 = 2080;
    v10 = v7;
    _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not change file size: [%i] %s", (uint8_t *)v8, 0x12u);
  }
  return v3 == 0;
}

- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4
{
  id v6;
  int fd;
  id v8;
  ssize_t v9;
  BOOL v10;
  int v11;
  int *v12;
  char *v13;
  NSObject *v14;
  const char *v15;
  int v17;
  int *v18;
  char *v19;
  int v20;
  int v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (lseek(self->_fd, 0, 2) == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v11 = *__error();
    v12 = __error();
    v13 = strerror(*v12);
    v20 = 67109378;
    v21 = v11;
    v22 = 2080;
    v23 = v13;
    v14 = MEMORY[0x1E0C81028];
    v15 = "Could not seek to eof: [%i] %s";
LABEL_14:
    _os_log_error_impl(&dword_18FAB0000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, 0x12u);
    goto LABEL_7;
  }
  fd = self->_fd;
  v8 = objc_retainAutorelease(v6);
  v9 = write(fd, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  if (v9 == objc_msgSend(v8, "length"))
  {
    v10 = 1;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = *__error();
    v18 = __error();
    v19 = strerror(*v18);
    v20 = 67109378;
    v21 = v17;
    v22 = 2080;
    v23 = v19;
    v14 = MEMORY[0x1E0C81028];
    v15 = "Could not write: [%i] %s";
    goto LABEL_14;
  }
LABEL_7:
  v10 = 0;
LABEL_8:
  if (!self->_ptr)
    -[PETReservoirSamplingLogStoreFile remap:](self, "remap:", 0);
  if (a4)
    *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_ptr;

  return v10;
}

- (BOOL)attemptToRecreate
{
  NSString *path;
  void *v4;
  id v5;
  id v6;
  const std::__fs::filesystem::path *v7;
  const std::__fs::filesystem::path *v8;
  std::error_code *v9;
  int v10;
  id v11;
  BOOL v12;
  int fd;
  const char *v15;
  int v16;
  int *v17;
  char *v18;
  NSString *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  _WORD v24[17];

  *(_QWORD *)&v24[13] = *MEMORY[0x1E0C80C00];
  path = self->_path;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0D815B0], "mkstempWithPrefix:error:", path, &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = self->_path;
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      v23 = 2112;
      *(_QWORD *)v24 = v5;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not create tempfile with prefix %@: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(v4, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const std::__fs::filesystem::path *)objc_msgSend(v6, "fileSystemRepresentation");
  v8 = -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation");
  rename(v7, v8, v9);
  LODWORD(v7) = v10;

  if ((_DWORD)v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v15 = -[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation");
      v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 136315650;
      v22 = (void *)v15;
      v23 = 1024;
      *(_DWORD *)v24 = v16;
      v24[2] = 2080;
      *(_QWORD *)&v24[3] = v18;
      _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not overwrite %s: [%i] %s", buf, 0x1Cu);
    }
    objc_msgSend(v4, "path");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    unlink((const char *)objc_msgSend(v11, "fileSystemRepresentation"));

    close(objc_msgSend(v4, "fd"));
LABEL_8:
    v12 = 0;
    goto LABEL_12;
  }
  -[PETReservoirSamplingLogStoreFile _unmap](self, "_unmap");
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  self->_fd = objc_msgSend(v4, "fd");
  v12 = 1;
LABEL_12:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
