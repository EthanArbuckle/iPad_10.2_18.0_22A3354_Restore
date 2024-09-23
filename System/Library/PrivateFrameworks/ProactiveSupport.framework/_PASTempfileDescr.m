@implementation _PASTempfileDescr

- (_PASTempfileDescr)initWithFd:(int)a3 path:(id)a4
{
  id v8;
  _PASTempfileDescr *v9;
  _PASTempfileDescr *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASFileUtils.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_PASTempfileDescr;
  v9 = -[_PASTempfileDescr init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_fd = a3;
    objc_storeStrong((id *)&v9->_path, a4);
  }

  return v10;
}

- (BOOL)isEqualToTempfileDescr:(id)a3
{
  id v4;
  void *v5;
  int fd;
  int v7;
  void *v8;
  int v9;
  NSString *path;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (fd = self->_fd, fd == objc_msgSend(v4, "fd"))
    && (v7 = self->_path != 0,
        objc_msgSend(v5, "path"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    path = self->_path;
    if (path)
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSString isEqual:](path, "isEqual:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  _PASTempfileDescr *v4;
  _PASTempfileDescr *v5;
  BOOL v6;

  v4 = (_PASTempfileDescr *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_PASTempfileDescr isEqualToTempfileDescr:](self, "isEqualToTempfileDescr:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t fd;

  fd = self->_fd;
  return -[NSString hash](self->_path, "hash") - fd + 32 * fd;
}

- (int)fd
{
  return self->_fd;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)tempfileDescrWithFd:(int)a3 path:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFd:path:", v4, v6);

  return v7;
}

@end
