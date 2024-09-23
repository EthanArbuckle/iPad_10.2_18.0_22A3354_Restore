@implementation PLPhotoLibrarySearchCriteria

- (id)debugDescription
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibrarySearchCriteria;
  -[PLPhotoLibrarySearchCriteria description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrarySearchCriteria uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLPhotoLibrarySearchCriteria domain](self, "domain");
  -[PLPhotoLibrarySearchCriteria containerIdentifier](self, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrarySearchCriteria internalTestOptions](self, "internalTestOptions");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = &stru_1E36789C0;
  if (v7)
    v9 = (const __CFString *)v7;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": UUID:[%@] domain:[%d] container:[%@] %@"), v4, v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PLPhotoLibrarySearchCriteria uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"), CFSTR("domain"));
  -[PLPhotoLibrarySearchCriteria containerIdentifier](self, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("containerIdentifier"));

  -[PLPhotoLibrarySearchCriteria internalTestOptions](self, "internalTestOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("internalTestOptions"));

}

- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3
{
  id v4;
  PLPhotoLibrarySearchCriteria *v5;
  uint64_t v6;
  NSString *uuid;
  uint64_t v8;
  NSString *containerIdentifier;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *internalTestOptions;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoLibrarySearchCriteria;
  v5 = -[PLPhotoLibrarySearchCriteria init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_domain = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("domain"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("internalTestOptions"));
    v14 = objc_claimAutoreleasedReturnValue();
    internalTestOptions = v5->_internalTestOptions;
    v5->_internalTestOptions = (NSDictionary *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[PLPhotoLibrarySearchCriteria uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v5);

  objc_msgSend(v4, "setDomain:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"));
  -[PLPhotoLibrarySearchCriteria containerIdentifier](self, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContainerIdentifier:", v6);

  -[PLPhotoLibrarySearchCriteria internalTestOptions](self, "internalTestOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalTestOptions:", v7);

  return v4;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalTestOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
