@implementation DIShadowNode

- (DIShadowNode)initWithURL:(id)a3 isCache:(BOOL)a4
{
  id v6;
  DIShadowNode *v7;
  DIURL *v8;
  DIURL *URL;
  FileLocalXPC *fileBackend;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIShadowNode;
  v7 = -[DIShadowNode init](&v12, "init");
  if (v7)
  {
    v8 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v6);
    URL = v7->_URL;
    v7->_URL = v8;

    v7->_isCache = a4;
    fileBackend = v7->_fileBackend;
    v7->_fileBackend = 0;
    v7->_numBlocks = 0;

  }
  return v7;
}

- (void)createBackendWithFlags:(int)a3
{
  FileLocalXPC *fileBackend;
  FileLocalXPC *v5;
  FileLocalXPC *v6;
  FileLocalXPC *v7;
  id v8;

  fileBackend = self->_fileBackend;
  self->_fileBackend = 0;

  v5 = [FileLocalXPC alloc];
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  v6 = -[FileLocalXPC initWithURL:fileOpenFlags:](v5, "initWithURL:fileOpenFlags:");
  v7 = self->_fileBackend;
  self->_fileBackend = v6;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIShadowNode)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIShadowNode *v6;
  id v7;
  uint64_t v8;
  DIURL *URL;
  uint64_t v10;
  id v11;
  uint64_t v12;
  FileLocalXPC *fileBackend;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIShadowNode;
  v6 = -[DIShadowNode init](&v15, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v5), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    URL = v6->_URL;
    v6->_URL = (DIURL *)v8;

    v6->_isCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCache"));
    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(FileLocalXPC, v10), CFSTR("fileBackend"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    fileBackend = v6->_fileBackend;
    v6->_fileBackend = (FileLocalXPC *)v12;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("URL"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIShadowNode isCache](self, "isCache"), CFSTR("isCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode fileBackend](self, "fileBackend"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("fileBackend"));

}

- (id)description
{
  void *v3;
  unsigned int v4;
  const __CFString *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  v4 = -[DIShadowNode isCache](self, "isCache");
  v5 = CFSTR("Shadow");
  if (v4)
    v5 = CFSTR("Cache");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v3, v5));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = -[DIShadowNode isCache](self, "isCache");
      v11 = v10 ^ objc_msgSend(v7, "isCache") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unsigned int v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIShadowNode URL](self, "URL"));
  v4 = objc_msgSend(v3, "hash");

  v5 = -[DIShadowNode isCache](self, "isCache");
  v6 = 2221;
  if (v5)
    v6 = 2207;
  return v6 - (_QWORD)v4 + 32 * (_QWORD)v4 + 961;
}

- (DIURL)URL
{
  return self->_URL;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (FileLocalXPC)fileBackend
{
  return self->_fileBackend;
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileBackend, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
