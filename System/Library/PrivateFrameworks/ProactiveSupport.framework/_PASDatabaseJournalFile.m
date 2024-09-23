@implementation _PASDatabaseJournalFile

- (_PASDatabaseJournalFile)initWithPath:(id)a3
{
  id v5;
  _PASDatabaseJournalFile *v6;
  _PASDatabaseJournalFile *v7;
  NSString **p_path;
  int v9;
  _PASDatabaseJournalFile *v10;
  NSString *v12;
  int v13;
  int *v14;
  char *v15;
  NSString *v16;
  int v17;
  int *v18;
  char *v19;
  objc_super v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  char *v26;
  stat v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_PASDatabaseJournalFile;
  v6 = -[_PASDatabaseJournalFile init](&v20, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_11;
  p_path = &v6->_path;
  objc_storeStrong((id *)&v6->_path, a3);
  v9 = open_dprotected_np((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), 522, 2, 0, 384);
  v7->_fd = v9;
  if ((v9 & 0x80000000) == 0)
  {
    memset(&v27, 0, sizeof(v27));
    if (fstat(v9, &v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v12 = *p_path;
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 138412802;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        v25 = 2080;
        v26 = v15;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
      }
      close(v7->_fd);
      v10 = 0;
      v7->_fd = -1;
      goto LABEL_12;
    }
    v7->_len = v27.st_size;
LABEL_11:
    v10 = v7;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = *p_path;
    v17 = *__error();
    v18 = __error();
    v19 = strerror(*v18);
    v27.st_dev = 138412802;
    *(_QWORD *)&v27.st_mode = v16;
    WORD2(v27.st_ino) = 1024;
    *(_DWORD *)((char *)&v27.st_ino + 6) = v17;
    HIWORD(v27.st_uid) = 2080;
    *(_QWORD *)&v27.st_gid = v19;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not open %@: errno=%i: %s", (uint8_t *)&v27, 0x1Cu);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)destroy
{
  int fd;

  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
  self->_dead = 1;
}

- (void)destroyAndUnlinkIfEmpty
{
  if (!self->_len)
    -[_PASDatabaseJournalFile unlink](self, "unlink");
  -[_PASDatabaseJournalFile destroy](self, "destroy");
}

- (void)dealloc
{
  objc_super v3;

  -[_PASDatabaseJournalFile destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)_PASDatabaseJournalFile;
  -[_PASDatabaseJournalFile dealloc](&v3, sel_dealloc);
}

- (void)write:(id)a3
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  NSString *v10;
  int v11;
  int *v12;
  char *v13;
  NSString *path;
  int v15;
  int *v16;
  char *v17;
  void *v18;
  void *v19;
  _DWORD v20[3];
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  char *v26;
  stat v27;
  iovec v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "length") >> 32)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournalFile.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length <= UINT32_MAX"));

  }
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournalFile.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  v6 = objc_retainAutorelease(v5);
  v7 = adler32(0, (const Bytef *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  v20[0] = -1347426410;
  v20[1] = objc_msgSend(v6, "length");
  v20[2] = v7;
  v28.iov_base = v20;
  v28.iov_len = 12;
  v8 = objc_retainAutorelease(v6);
  v29 = objc_msgSend(v8, "bytes");
  v9 = objc_msgSend(v8, "length");

  v30 = v9;
  if (writev(self->_fd, &v28, 2) < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      v27.st_dev = 138412802;
      *(_QWORD *)&v27.st_mode = path;
      WORD2(v27.st_ino) = 1024;
      *(_DWORD *)((char *)&v27.st_ino + 6) = v15;
      HIWORD(v27.st_uid) = 2080;
      *(_QWORD *)&v27.st_gid = v17;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not write to journal file %@: errno=%i: %s", (uint8_t *)&v27, 0x1Cu);
    }
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    if (fstat(self->_fd, &v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v10 = self->_path;
        v11 = *__error();
        v12 = __error();
        v13 = strerror(*v12);
        *(_DWORD *)buf = 138412802;
        v22 = v10;
        v23 = 1024;
        v24 = v11;
        v25 = 2080;
        v26 = v13;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
      }
      close(self->_fd);
      self->_fd = -1;
    }
    self->_len = v27.st_size;
    self->_written = 1;
  }
}

- (BOOL)isFullyRead
{
  return self->_len <= self->_readCursor || self->_dead;
}

- (BOOL)isAlive
{
  return !self->_dead;
}

- (unint64_t)length
{
  return self->_len;
}

- (id)read
{
  unint64_t v5;
  unint64_t v6;
  NSString *path;
  int v8;
  int *v9;
  char *v10;
  NSObject *v11;
  const char *v12;
  uint32_t v13;
  NSString *v14;
  int v15;
  id v16;
  void *v17;
  int fd;
  id v19;
  void *v20;
  ssize_t v21;
  ssize_t v22;
  NSString *v23;
  int v24;
  int *v25;
  char *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  NSString *v30;
  void *v31;
  id v32;
  const Bytef *v33;
  int v34;
  int v35;
  NSString *v36;
  void *v37;
  uint64_t __buf;
  int v39;
  uint8_t buf[4];
  _BYTE v41[10];
  _DWORD v42[6];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!self->_len || -[_PASDatabaseJournalFile isFullyRead](self, "isFullyRead"))
    return 0;
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournalFile.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  if (!self->_written)
    fcntl(self->_fd, 48, 1);
  v39 = 0;
  __buf = 0;
  v5 = pread(self->_fd, &__buf, 0xCuLL, self->_readCursor);
  v6 = self->_readCursor + 12;
  self->_readCursor = v6;
  if (v5 <= 0xB)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v8 = *__error();
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v41 = path;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v8;
      LOWORD(v42[1]) = 2080;
      *(_QWORD *)((char *)&v42[1] + 2) = v10;
      v11 = MEMORY[0x1E0C81028];
      v12 = "Could not read from journal file %@: errno=%i: %s";
      v13 = 28;
LABEL_20:
      _os_log_error_impl(&dword_1A0957000, v11, OS_LOG_TYPE_ERROR, v12, buf, v13);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (self->_len - v6 >= HIDWORD(__buf))
  {
    v15 = __buf;
    if ((_DWORD)__buf != -1347426410)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v30 = self->_path;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v41 = -1347426410;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = v15;
        LOWORD(v42[0]) = 2112;
        *(_QWORD *)((char *)v42 + 2) = v30;
        v11 = MEMORY[0x1E0C81028];
        v12 = "Journal file has invalid magic number: expected 0x%x, got 0x%x: %@";
        v13 = 24;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    v16 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v17 = (void *)objc_msgSend(v16, "initWithLength:", HIDWORD(__buf));
    fd = self->_fd;
    v19 = objc_retainAutorelease(v17);
    v20 = (void *)objc_msgSend(v19, "mutableBytes");
    v21 = pread(fd, v20, HIDWORD(__buf), self->_readCursor);
    v22 = HIDWORD(__buf);
    self->_readCursor += HIDWORD(__buf);
    if (v21 >= v22)
    {
      v32 = objc_retainAutorelease(v19);
      v33 = (const Bytef *)objc_msgSend(v32, "bytes");
      v34 = adler32(0, v33, HIDWORD(__buf));
      v35 = v39;
      if (v39 == v34)
      {
        v19 = v32;
        v31 = v19;
        goto LABEL_23;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v36 = self->_path;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v41 = v36;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v34;
      LOWORD(v42[1]) = 1024;
      *(_DWORD *)((char *)&v42[1] + 2) = v35;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Journal file checksum mismatch: %@: %u / %u";
      v29 = 24;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_27:
        self->_readCursor -= HIDWORD(__buf);
        goto LABEL_22;
      }
      v23 = self->_path;
      v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v41 = v23;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v24;
      LOWORD(v42[1]) = 2080;
      *(_QWORD *)((char *)&v42[1] + 2) = v26;
      v27 = MEMORY[0x1E0C81028];
      v28 = "Could not read from journal file %@: errno=%i: %s";
      v29 = 28;
    }
    _os_log_error_impl(&dword_1A0957000, v27, OS_LOG_TYPE_ERROR, v28, buf, v29);
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = self->_path;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v41 = v14;
    v11 = MEMORY[0x1E0C81028];
    v12 = "Journal file truncated: %@";
    v13 = 12;
    goto LABEL_20;
  }
LABEL_21:
  v19 = 0;
LABEL_22:
  self->_readCursor -= 12;
  -[_PASDatabaseJournalFile destroy](self, "destroy");
  v31 = 0;
LABEL_23:

  return v31;
}

- (void)clear
{
  void *v4;

  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournalFile.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  if (self->_len)
  {
    lseek(self->_fd, 0, 0);
    ftruncate(self->_fd, 0);
    self->_len = 0;
    self->_readCursor = 0;
  }
}

- (void)unlink
{
  int fd;
  NSString *path;
  int v5;
  int *v6;
  char *v7;
  void *v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_dead)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASDatabaseJournalFile.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_dead"));

  }
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
  if (unlink(-[NSString UTF8String](self->_path, "UTF8String")))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      v5 = *__error();
      v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 138412802;
      v11 = path;
      v12 = 1024;
      v13 = v5;
      v14 = 2080;
      v15 = v7;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not remove %@: errno=%i: %s", buf, 0x1Cu);
    }
  }
  else
  {
    self->_dead = 1;
  }
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, self->_path);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
