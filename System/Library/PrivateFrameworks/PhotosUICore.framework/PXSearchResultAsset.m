@implementation PXSearchResultAsset

- (PXSearchResultAsset)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAsset.m"), 25, CFSTR("%s is not available as initializer"), "-[PXSearchResultAsset init]");

  abort();
}

- (PXSearchResultAsset)initWithAssetUUID:(id)a3
{
  id v5;
  NSObject *v6;
  PXSearchResultAsset *v7;
  uint64_t v8;
  NSString *assetUUID;
  uint64_t v10;
  NSString *identifier;
  void *v13;
  objc_super v14;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAsset.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  if (!objc_msgSend(v5, "length"))
  {
    PLPhotosSearchGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "PXSearchResultAsset Intialization: Search result asset UUID string is empty.", buf, 2u);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)PXSearchResultAsset;
  v7 = -[PXSearchResultAsset init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v5, "copy");
    assetUUID = v7->_assetUUID;
    v7->_assetUUID = (NSString *)v8;

    v7->_assetCount = 1;
    v10 = objc_msgSend(v5, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v10;

    v7->_type = 5;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSearchResultAsset identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchResultAsset *v4;
  PXSearchResultAsset *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXSearchResultAsset *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSearchResultAsset identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultAsset identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXSearchResultAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXSearchResultAsset type](self, "type");
  -[PXSearchResultAsset assetUUID](self, "assetUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, type: %ld, uuid: %@, >"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

@end
