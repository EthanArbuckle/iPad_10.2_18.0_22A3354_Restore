@implementation BFSDirectory

+ (id)BFSDirectoryWithURL:(id)a3 withDepth:(unint64_t)a4
{
  id v5;
  BFSDirectory *v6;
  BFSDirectory *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v17;

  v5 = a3;
  v6 = objc_alloc_init(BFSDirectory);
  v7 = v6;
  if (v6)
  {
    -[BFSDirectory setUrl:](v6, "setUrl:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v10 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v17);
    v11 = v17;

    if (v10)
      v12 = v11 == 0;
    else
      v12 = 1;
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectory url](v7, "url"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, v14, 7, &stru_100099060));
      -[BFSDirectory setUrlEnumerator:](v7, "setUrlEnumerator:", v15);

    }
    -[BFSDirectory setRemainingDepth:](v7, "setRemainingDepth:", a4);

  }
  return v7;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[BFSDirectory remainingDepth](self, "remainingDepth");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BFSDirectory urlEnumerator](self, "urlEnumerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu %@"), v3, v4));

  return v5;
}

- (NSDirectoryEnumerator)urlEnumerator
{
  return (NSDirectoryEnumerator *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrlEnumerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)remainingDepth
{
  return self->_remainingDepth;
}

- (void)setRemainingDepth:(unint64_t)a3
{
  self->_remainingDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlEnumerator, 0);
}

@end
