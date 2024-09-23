@implementation WebBundleFile

- (WebBundleFile)initWithPath:(id)a3 hash:(id)a4
{
  id v6;
  id v7;
  WebBundleFile *v8;
  WebBundleFile *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleFile;
  v8 = -[WebBundleFile init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[WebBundleFile setFilePath:](v8, "setFilePath:", v6);
    -[WebBundleFile setFileHash:](v9, "setFileHash:", v7);
  }

  return v9;
}

- (WebBundleFile)initWithCoder:(id)a3
{
  id v4;
  WebBundleFile *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WebBundleFile;
  v5 = -[WebBundleFile init](&v11, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("WebBundleFileFilePathKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[WebBundleFile setFilePath:](v5, "setFilePath:", v7);

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("WebBundleFileHashKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[WebBundleFile setFileHash:](v5, "setFileHash:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *filePath;
  id v5;

  filePath = self->_filePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", filePath, CFSTR("WebBundleFileFilePathKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fileHash, CFSTR("WebBundleFileHashKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile filePath](self, "filePath"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile fileHash](self, "fileHash"));
  v6 = (unint64_t)objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  WebBundleFile *v4;
  WebBundleFile *v5;
  uint64_t v6;
  WebBundleFile *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v4 = (WebBundleFile *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile filePath](v7, "filePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile filePath](self, "filePath"));
    if (v8 == v9 || objc_msgSend(v8, "isEqual:", v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile fileHash](v7, "fileHash"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[WebBundleFile fileHash](self, "fileHash"));
      if (v10 == v11)
        v12 = 1;
      else
        v12 = objc_msgSend(v10, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
  objc_storeStrong((id *)&self->_fileHash, a3);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_filePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
}

@end
