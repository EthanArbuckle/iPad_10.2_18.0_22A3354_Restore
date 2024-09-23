@implementation PFPathProvider

+ (PFPathProvider)scopedCurrentContainer
{
  PFPathProvider *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = [PFPathProvider alloc];
  objc_msgSend(MEMORY[0x24BE0BE60], "pathProviderForCurrentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PFPathProvider initFromProvider:](v2, "initFromProvider:", v3);

  objc_msgSend(v4, "providerByAppendingPathComponent:", CFSTR("com.apple.PaperBoardUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFPathProvider *)v5;
}

+ (PFPathProvider)scopedSystemContainerForCurrentProcess
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BDB8], "tokenForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasEntitlement:", CFSTR("com.apple.security.system-container"));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE0BE60], "pathProviderForSystemContainerForCurrentProcess");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "defaultPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = -[PFPathProvider initFromProvider:]([PFPathProvider alloc], "initFromProvider:", v5);
        objc_msgSend(v7, "providerByAppendingPathComponent:", CFSTR("com.apple.PaperBoardUI"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return (PFPathProvider *)v6;
}

+ (id)providerFromProvider:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
    v9 = v8;
  else
    v9 = (id)objc_msgSend(objc_alloc((Class)a1), "initFromProvider:", v6);
  v10 = v9;

  return v10;
}

- (id)initFromProvider:(id)a3
{
  id v4;
  PFPathProvider *v5;
  uint64_t v6;
  NSURL *defaultPath;
  uint64_t v8;
  NSURL *libraryPath;
  uint64_t v10;
  NSURL *cachesPath;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFPathProvider;
  v5 = -[PFPathProvider init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "defaultPath");
    v6 = objc_claimAutoreleasedReturnValue();
    defaultPath = v5->_defaultPath;
    v5->_defaultPath = (NSURL *)v6;

    objc_msgSend(v4, "libraryPath");
    v8 = objc_claimAutoreleasedReturnValue();
    libraryPath = v5->_libraryPath;
    v5->_libraryPath = (NSURL *)v8;

    objc_msgSend(v4, "cachesPath");
    v10 = objc_claimAutoreleasedReturnValue();
    cachesPath = v5->_cachesPath;
    v5->_cachesPath = (NSURL *)v10;

  }
  return v5;
}

- (id)providerByAppendingPathComponent:(id)a3
{
  id v4;
  PFPathProvider *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(PFPathProvider);
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_defaultPath, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPathProvider setDefaultPath:](v5, "setDefaultPath:", v6);

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_libraryPath, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFPathProvider setLibraryPath:](v5, "setLibraryPath:", v7);

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_cachesPath, "URLByAppendingPathComponent:isDirectory:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFPathProvider setCachesPath:](v5, "setCachesPath:", v8);
  return v5;
}

- (NSURL)defaultPath
{
  return self->_defaultPath;
}

- (void)setDefaultPath:(id)a3
{
  objc_storeStrong((id *)&self->_defaultPath, a3);
}

- (NSURL)libraryPath
{
  return self->_libraryPath;
}

- (void)setLibraryPath:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPath, a3);
}

- (NSURL)cachesPath
{
  return self->_cachesPath;
}

- (void)setCachesPath:(id)a3
{
  objc_storeStrong((id *)&self->_cachesPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesPath, 0);
  objc_storeStrong((id *)&self->_libraryPath, 0);
  objc_storeStrong((id *)&self->_defaultPath, 0);
}

@end
