@implementation RMDeclarationManifestItem

- (RMDeclarationManifestItem)initWithIdentifier:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  RMDeclarationManifestItem *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *version;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RMDeclarationManifestItem;
  v8 = -[RMDeclarationManifestItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    version = v8->_version;
    v8->_version = (NSString *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDeclarationManifestItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  RMDeclarationManifestItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RMDeclarationManifestItem initWithIdentifier:version:](self, "initWithIdentifier:version:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[RMDeclarationManifestItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[RMDeclarationManifestItem version](self, "version");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

}

- (BOOL)isEqual:(id)a3
{
  RMDeclarationManifestItem *v4;
  BOOL v5;

  v4 = (RMDeclarationManifestItem *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[RMDeclarationManifestItem isEqualToManifestItem:](self, "isEqualToManifestItem:", v4);
  }

  return v5;
}

- (BOOL)isEqualToManifestItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RMDeclarationManifestItem identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[RMDeclarationManifestItem version](self, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
