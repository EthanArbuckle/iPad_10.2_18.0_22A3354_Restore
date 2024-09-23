@implementation TRIMAAssetMetadata

- (TRIMAAssetMetadata)initWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4
{
  id v7;
  TRIMAAssetMetadata *v8;
  TRIMAAssetMetadata *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TRIMAAssetMetadata;
  v8 = -[TRIMAAssetMetadata init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_downloadSize = a3;
    objc_storeStrong((id *)&v8->_namespaceNameForEncryptionKey, a4);
  }

  return v9;
}

+ (id)metadataWithDownloadSize:(unint64_t)a3 namespaceNameForEncryptionKey:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDownloadSize:namespaceNameForEncryptionKey:", a3, v6);

  return v7;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadSize:namespaceNameForEncryptionKey:", a3, self->_namespaceNameForEncryptionKey);
}

- (id)copyWithReplacementNamespaceNameForEncryptionKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDownloadSize:namespaceNameForEncryptionKey:", self->_downloadSize, v4);

  return v5;
}

- (BOOL)isEqualToMetadata:(id)a3
{
  id v4;
  void *v5;
  unint64_t downloadSize;
  int v7;
  void *v8;
  int v9;
  NSString *namespaceNameForEncryptionKey;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (downloadSize = self->_downloadSize, downloadSize == objc_msgSend(v4, "downloadSize"))
    && (v7 = self->_namespaceNameForEncryptionKey != 0,
        objc_msgSend(v5, "namespaceNameForEncryptionKey"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    namespaceNameForEncryptionKey = self->_namespaceNameForEncryptionKey;
    if (namespaceNameForEncryptionKey)
    {
      objc_msgSend(v5, "namespaceNameForEncryptionKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSString isEqual:](namespaceNameForEncryptionKey, "isEqual:", v11);

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
  TRIMAAssetMetadata *v4;
  TRIMAAssetMetadata *v5;
  BOOL v6;

  v4 = (TRIMAAssetMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIMAAssetMetadata isEqualToMetadata:](self, "isEqualToMetadata:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t downloadSize;

  downloadSize = self->_downloadSize;
  return -[NSString hash](self->_namespaceNameForEncryptionKey, "hash") - downloadSize + 32 * downloadSize;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloadSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIMAAssetMetadata | downloadSize:%@ namespaceNameForEncryptionKey:%@>"), v4, self->_namespaceNameForEncryptionKey);

  return v5;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (NSString)namespaceNameForEncryptionKey
{
  return self->_namespaceNameForEncryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceNameForEncryptionKey, 0);
}

@end
