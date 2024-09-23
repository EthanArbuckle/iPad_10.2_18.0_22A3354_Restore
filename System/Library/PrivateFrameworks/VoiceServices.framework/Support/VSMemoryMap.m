@implementation VSMemoryMap

- (VSMemoryMap)initWithFilePath:(id)a3
{
  id v5;
  VSMemoryMap *v6;
  VSMemoryMap *v7;
  VSMemoryMap *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSMemoryMap;
  v6 = -[VSMemoryMap init](&v10, sel_init);
  v7 = v6;
  if (!v6
    || (v6->_mappedData = 0, objc_storeStrong((id *)&v6->_filePath, a3), v8 = 0, -[VSMemoryMap mmap](v7, "mmap")))
  {
    v8 = v7;
  }

  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  NSString *filePath;
  int *v6;
  char *v7;
  NSString *v8;
  int *v9;
  char *v10;
  objc_super v11;
  uint8_t buf[4];
  NSString *v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (madvise(self->_mappedData, self->_fileSize, 4))
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      filePath = self->_filePath;
      v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 138412546;
      v13 = filePath;
      v14 = 2080;
      v15 = v7;
      _os_log_error_impl(&dword_21AA84000, v3, OS_LOG_TYPE_ERROR, "Unable to madvise file '%@' MADV_DONTNEED, error: %s", buf, 0x16u);
    }

  }
  if (munmap(self->_mappedData, self->_fileSize))
  {
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = self->_filePath;
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2080;
      v15 = v10;
      _os_log_error_impl(&dword_21AA84000, v4, OS_LOG_TYPE_ERROR, "Unable to munmap file '%@', error: %s", buf, 0x16u);
    }

  }
  close(self->_fd);
  v11.receiver = self;
  v11.super_class = (Class)VSMemoryMap;
  -[VSMemoryMap dealloc](&v11, sel_dealloc);
}

- (BOOL)mmap
{
  const char *v3;
  int v4;
  NSObject *v5;
  int *v6;
  char *v7;
  const char *v8;
  stat *v9;
  size_t st_size;
  void *v12;
  int *v13;
  char *v14;
  int *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  char *v20;
  stat v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSString UTF8String](self->_filePath, "UTF8String");
  v4 = open(v3, 0);
  self->_fd = v4;
  if (v4 <= 0)
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      v21.st_dev = 136315394;
      *(_QWORD *)&v21.st_mode = v3;
      WORD2(v21.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v21.st_ino + 6) = (__darwin_ino64_t)v16;
      v8 = "Unable to open file '%s', error: %s";
      v9 = &v21;
      goto LABEL_14;
    }
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (fstat(v4, &v21))
    {
      close(self->_fd);
      VSGetLogDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = __error();
        v7 = strerror(*v6);
        v17 = 136315394;
        v18 = v3;
        v19 = 2080;
        v20 = v7;
        v8 = "Unable to get size of file '%s', error: %s";
LABEL_5:
        v9 = (stat *)&v17;
LABEL_14:
        _os_log_error_impl(&dword_21AA84000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 0x16u);
      }
    }
    else
    {
      st_size = v21.st_size;
      self->_fileSize = v21.st_size;
      v12 = mmap(0, st_size, 1, 1, self->_fd, 0);
      if (v12 != (void *)-1)
      {
        self->_mappedData = v12;
        return 1;
      }
      VSGetLogDefault();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13 = __error();
        v14 = strerror(*v13);
        v17 = 136315394;
        v18 = v3;
        v19 = 2080;
        v20 = v14;
        v8 = "Unable to mmap '%s', error: %s";
        goto LABEL_5;
      }
    }
  }

  return 0;
}

- (void)madvise
{
  unint64_t fileSize;
  NSObject *v4;
  NSString *filePath;
  unint64_t v6;
  _QWORD v7[2];
  uint8_t buf[4];
  NSString *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  fileSize = self->_fileSize;
  if (fileSize)
  {
    v7[0] = 0;
    v7[1] = fileSize;
    fcntl(self->_fd, 44, v7);
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      filePath = self->_filePath;
      v6 = self->_fileSize;
      *(_DWORD *)buf = 138412546;
      v9 = filePath;
      v10 = 2048;
      v11 = v6;
      _os_log_debug_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEBUG, "fcntl called on file '%@', size: %lu", buf, 0x16u);
    }

  }
}

- (NSString)filePath
{
  return self->_filePath;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)mappedData
{
  return self->_mappedData;
}

- (int)fd
{
  return self->_fd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
