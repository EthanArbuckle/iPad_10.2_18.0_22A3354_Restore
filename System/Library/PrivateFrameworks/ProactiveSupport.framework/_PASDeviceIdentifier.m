@implementation _PASDeviceIdentifier

- (_PASDeviceIdentifier)initWithBasePath:(id)a3
{
  id v4;
  _PASDeviceIdentifier *v5;
  uint64_t v6;
  NSString *path;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PASDeviceIdentifier;
  v5 = -[_PASDeviceIdentifier init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%u.uuid"), v4, getuid());
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

  }
  return v5;
}

- (NSUUID)UUID
{
  int v3;
  int v4;
  id v5;
  NSString *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  NSString *v13;
  int v14;
  int *v15;
  char *v16;
  NSString *path;
  int v18;
  int *v19;
  char *v20;
  uint8_t buf[4];
  NSString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  char *v26;
  _BYTE __buf[16];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = open(-[NSString UTF8String](self->_path, "UTF8String"), 0);
  if (v3 < 0)
  {
    if (*__error() != 2)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        v18 = *__error();
        v19 = __error();
        v20 = strerror(*v19);
        *(_DWORD *)buf = 138412802;
        v22 = path;
        v23 = 1024;
        v24 = v18;
        v25 = 2080;
        v26 = v20;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error opening device identifier file %@: [%i] %s", buf, 0x1Cu);
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      return (NSUUID *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = v3;
    if (read(v3, __buf, 0x10uLL) == 16)
    {
      v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", __buf);
      close(v4);
      if (v5)
        return (NSUUID *)v5;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v7 = self->_path;
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Removing truncated device id file: %@", buf, 0xCu);
      }
      unlink(-[NSString UTF8String](self->_path, "UTF8String"));
      close(v4);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getUUIDBytes:", __buf);
  v9 = open(-[NSString UTF8String](self->_path, "UTF8String"), 2561, 384);
  if ((v9 & 0x80000000) == 0)
  {
    v10 = v9;
    write(v9, __buf, 0x10uLL);
    close(v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", self->_path);
    if (objc_msgSend(v11, "length") == 16)
    {
      objc_msgSend(v11, "getBytes:length:", __buf, 16);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", __buf);
    }
    else
    {
      v12 = 0;
    }

    v5 = v12;
    return (NSUUID *)v5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = self->_path;
    v14 = *__error();
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 138412802;
    v22 = v13;
    v23 = 1024;
    v24 = v14;
    v25 = 2080;
    v26 = v16;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error writing device identifier file %@: [%i] %s", buf, 0x1Cu);
  }

  return (NSUUID *)0;
}

- (void)reset
{
  NSString *path;
  int v4;
  int *v5;
  char *v6;
  int v7;
  NSString *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (unlink(-[NSString UTF8String](self->_path, "UTF8String"))
    && *__error() != 2
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    path = self->_path;
    v4 = *__error();
    v5 = __error();
    v6 = strerror(*v5);
    v7 = 138412802;
    v8 = path;
    v9 = 1024;
    v10 = v4;
    v11 = 2080;
    v12 = v6;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error unlinking %@: [%i] %s", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
