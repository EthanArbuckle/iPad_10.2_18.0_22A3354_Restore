@implementation PCDistributedLock

- (PCDistributedLock)initWithPath:(id)a3
{
  id v4;
  PCDistributedLock *v5;
  uint64_t v6;
  NSString *path;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDistributedLock;
  v5 = -[PCDistributedLock init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_fd = -1;
  }

  return v5;
}

- (PCDistributedLock)initWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PCDistributedLock *v9;

  v4 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(".%@.lock"), v4);
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PCDistributedLock initWithPath:](self, "initWithPath:", v8);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_fd != -1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ at path '%@' is being deallocated while locked"), objc_opt_class(), self->_path);
  v3.receiver = self;
  v3.super_class = (Class)PCDistributedLock;
  -[PCDistributedLock dealloc](&v3, sel_dealloc);
}

- (BOOL)_lockBlocking:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  int v6;
  int fd;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *path;
  int *v12;

  v3 = a3;
  if (self->_fd != -1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ at path '%@' is already locked"), objc_opt_class(), self->_path);
  if (v3)
    v5 = 544;
  else
    v5 = 548;
  v6 = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), v5, 420);
  self->_fd = v6;
  if (v6 == -1)
  {
    if (*__error() == 1)
    {
      chmod(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 0x1A4u);
      fd = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), v5, 420);
      self->_fd = fd;
    }
    else
    {
      fd = self->_fd;
    }
    if (fd == -1 && (v3 || *__error() != 35))
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99768];
      v10 = objc_opt_class();
      path = self->_path;
      v12 = __error();
      objc_msgSend(v8, "raise:format:", v9, CFSTR("Unable to take %@ at path '%@': %s"), v10, path, strerror(*v12));
    }
  }
  return self->_fd != -1;
}

- (BOOL)tryLock
{
  return -[PCDistributedLock _lockBlocking:](self, "_lockBlocking:", 0);
}

- (void)lock
{
  -[PCDistributedLock _lockBlocking:](self, "_lockBlocking:", 1);
}

- (void)unlock
{
  int fd;

  fd = self->_fd;
  if (fd == -1)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ at path '%@' is not locked"), objc_opt_class(), self->_path);
    fd = self->_fd;
  }
  close(fd);
  self->_fd = -1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
