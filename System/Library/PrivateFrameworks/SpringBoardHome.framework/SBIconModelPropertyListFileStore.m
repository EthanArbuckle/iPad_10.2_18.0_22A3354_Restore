@implementation SBIconModelPropertyListFileStore

- (SBIconModelPropertyListFileStore)initWithIconStateURL:(id)a3 desiredIconStateURL:(id)a4
{
  id v6;
  id v7;
  SBIconModelPropertyListFileStore *v8;
  uint64_t v9;
  NSURL *currentIconStateURL;
  uint64_t v11;
  NSURL *desiredIconStateURL;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconModelPropertyListFileStore;
  v8 = -[SBIconModelPropertyListFileStore init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    currentIconStateURL = v8->_currentIconStateURL;
    v8->_currentIconStateURL = (NSURL *)v9;

    v11 = objc_msgSend(v7, "copy");
    desiredIconStateURL = v8->_desiredIconStateURL;
    v8->_desiredIconStateURL = (NSURL *)v11;

  }
  return v8;
}

- (SBIconModelPropertyListFileStore)init
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  SBIconModelPropertyListFileStore *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("IconState.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("DesiredIconState.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconModelPropertyListFileStore initWithIconStateURL:desiredIconStateURL:](self, "initWithIconStateURL:desiredIconStateURL:", v5, v6);

  return v7;
}

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  return -[SBIconModelPropertyListFileStore _save:url:error:](self, "_save:url:error:", a3, self->_currentIconStateURL, a4);
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  return -[SBIconModelPropertyListFileStore _save:url:error:](self, "_save:url:error:", a3, self->_desiredIconStateURL, a4);
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return -[SBIconModelPropertyListFileStore _delete:options:error:](self, "_delete:options:error:", self->_currentIconStateURL, a3, a4);
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  return -[SBIconModelPropertyListFileStore _delete:options:error:](self, "_delete:options:error:", self->_desiredIconStateURL, a3, a4);
}

- (id)loadCurrentIconState:(id *)a3
{
  return -[SBIconModelPropertyListFileStore _load:error:](self, "_load:error:", self->_currentIconStateURL, a3);
}

- (id)loadDesiredIconState:(id *)a3
{
  return -[SBIconModelPropertyListFileStore _load:error:](self, "_load:error:", self->_desiredIconStateURL, a3);
}

- (id)_load:(id)a3 error:(id *)a4
{
  id *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!v4)
      goto LABEL_21;
    v9 = *v4;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v9, *MEMORY[0x1E0CB3388], 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v12 = objc_msgSend(v9, "code");

      if (v12 == 260)
      {
        v13 = 2;
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBIconModelStoreDomain"), v13, v10);
        *v4 = (id)objc_claimAutoreleasedReturnValue();

        v4 = 0;
        goto LABEL_21;
      }
    }
    else
    {

    }
    v13 = 1;
    goto LABEL_20;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v6;
  }
  else if (v4)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CB3388], 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBIconModelStoreDomain"), 1, v8);
    *v4 = (id)objc_claimAutoreleasedReturnValue();

    v4 = 0;
  }

LABEL_21:
  return v4;
}

- (BOOL)_delete:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v7;
  void *v8;
  unint64_t v9;
  size_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v21;
  id v22;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) != 0)
  {
    v22 = 0;
    if (objc_msgSend(v7, "getResourceValue:forKey:error:", &v22, *MEMORY[0x1E0C99998], 0))
    {
      v9 = objc_msgSend(v22, "unsignedLongLongValue");
      v10 = v9 >= 0x10000 ? 0x10000 : v9;
      v11 = malloc_type_calloc(1uLL, v10, 0xB15FE3D8uLL);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v11, v10, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingURL:error:", v7, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "writeData:", v13);
          objc_msgSend(v14, "closeFile");

        }
        free(v12);

      }
    }
  }
  v21 = 0;
  v15 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v21);
  v16 = v21;
  v17 = v16;
  if ((v15 & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v16, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      v18 = objc_msgSend(v17, "code") == 4;
    else
      v18 = 0;

    if (a5 && !v18)
    {
      v18 = 0;
      *a5 = objc_retainAutorelease(v17);
    }
  }

  return v18;
}

- (BOOL)_save:(id)a3 url:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0
    || objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a5))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v15 = objc_msgSend(v13, "writeToURL:options:error:", v8, 268435457, a5);
    else
      v15 = 0;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSString)description
{
  return (NSString *)-[SBIconModelPropertyListFileStore descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconModelPropertyListFileStore descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconModelPropertyListFileStore currentIconStateURL](self, "currentIconStateURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("currentIconStateURL"));

  -[SBIconModelPropertyListFileStore desiredIconStateURL](self, "desiredIconStateURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "appendObject:withName:", v7, CFSTR("desiredIconStateURL"));

  return v4;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconModelPropertyListFileStore succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (NSURL)currentIconStateURL
{
  return self->_currentIconStateURL;
}

- (NSURL)desiredIconStateURL
{
  return self->_desiredIconStateURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredIconStateURL, 0);
  objc_storeStrong((id *)&self->_currentIconStateURL, 0);
}

@end
