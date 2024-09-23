@implementation TRIFetchOptions

- (TRIFetchOptions)initWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIFetchOptions *v11;
  TRIFetchOptions *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4647, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("downloadOptions != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 4648, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cacheDeleteAvailableSpaceClass != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFetchOptions;
  v11 = -[TRIFetchOptions init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_downloadOptions, a3);
    objc_storeStrong((id *)&v12->_cacheDeleteAvailableSpaceClass, a4);
  }

  return v12;
}

+ (id)optionsWithDownloadOptions:(id)a3 cacheDeleteAvailableSpaceClass:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v7, v6);

  return v8;
}

- (id)copyWithReplacementDownloadOptions:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", v4, self->_cacheDeleteAvailableSpaceClass);

  return v5;
}

- (id)copyWithReplacementCacheDeleteAvailableSpaceClass:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadOptions:cacheDeleteAvailableSpaceClass:", self->_downloadOptions, v4);

  return v5;
}

- (BOOL)isEqualToOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIDownloadOptions *downloadOptions;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSNumber *cacheDeleteAvailableSpaceClass;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_downloadOptions != 0;
  objc_msgSend(v4, "downloadOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  downloadOptions = self->_downloadOptions;
  if (downloadOptions)
  {
    objc_msgSend(v5, "downloadOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIDownloadOptions isEqual:](downloadOptions, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_cacheDeleteAvailableSpaceClass != 0;
  objc_msgSend(v5, "cacheDeleteAvailableSpaceClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    cacheDeleteAvailableSpaceClass = self->_cacheDeleteAvailableSpaceClass;
    if (cacheDeleteAvailableSpaceClass)
    {
      objc_msgSend(v5, "cacheDeleteAvailableSpaceClass");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSNumber isEqual:](cacheDeleteAvailableSpaceClass, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIFetchOptions *v4;
  TRIFetchOptions *v5;
  BOOL v6;

  v4 = (TRIFetchOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFetchOptions isEqualToOptions:](self, "isEqualToOptions:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIDownloadOptions hash](self->_downloadOptions, "hash");
  return -[NSNumber hash](self->_cacheDeleteAvailableSpaceClass, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFetchOptions | downloadOptions:%@ cacheDeleteAvailableSpaceClass:%@>"), self->_downloadOptions, self->_cacheDeleteAvailableSpaceClass);
}

- (TRIDownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  return self->_cacheDeleteAvailableSpaceClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
}

@end
