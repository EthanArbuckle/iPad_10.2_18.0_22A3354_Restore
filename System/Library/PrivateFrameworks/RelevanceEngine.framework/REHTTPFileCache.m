@implementation REHTTPFileCache

- (REHTTPFileCache)initWithRootDirectory:(id)a3
{
  id v5;
  REHTTPFileCache *v6;
  REHTTPFileCache *v7;
  NSCache *v8;
  NSCache *cache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REHTTPFileCache;
  v6 = -[REHTTPFileCache init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directory, a3);
    v8 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    cache = v7->_cache;
    v7->_cache = v8;

  }
  return v7;
}

- (id)loadFileAtPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  NSCache *cache;
  void *v13;
  NSCache *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    cache = self->_cache;
    v13 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSCache setObject:forKey:cost:](cache, "setObject:forKey:cost:", v13, v4, objc_msgSend(v11, "length"));
    v10 = v4;
    if (!v11)
    {

      -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_cache;
      v15 = v11;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSCache setObject:forKey:cost:](v14, "setObject:forKey:cost:", v15, v4, objc_msgSend(v11, "length"));
      if (!v11)

    }
    v16 = v11;
    v9 = v16;
    goto LABEL_13;
  }
  v6 = (void *)v5;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v16 = v6;
    v9 = v16;
    v10 = v4;
LABEL_13:
    v6 = v16;
    goto LABEL_14;
  }
  v9 = 0;
  v10 = v4;
LABEL_14:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

@end
