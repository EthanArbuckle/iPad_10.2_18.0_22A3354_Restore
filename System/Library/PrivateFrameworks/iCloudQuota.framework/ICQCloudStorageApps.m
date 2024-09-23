@implementation ICQCloudStorageApps

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQCloudStorageApps *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQCloudStorageApps;
  v5 = -[ICQCloudStorageApps init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __42__ICQCloudStorageApps_initFromDictionary___block_invoke;
      v11[3] = &unk_1E8B39980;
      v12 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);
      -[ICQCloudStorageApps setApps:](v5, "setApps:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("genericErrorMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQCloudStorageApps setGenericErrorMessage:](v5, "setGenericErrorMessage:", v9);

  }
  return v5;
}

void __42__ICQCloudStorageApps_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[ICQAppInfo initFromDictionary:]([ICQAppInfo alloc], "initFromDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("apps: %@, genericErrorMessage: %@"), self->_apps, self->_genericErrorMessage);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQCloudStorageApps *v4;

  v4 = objc_alloc_init(ICQCloudStorageApps);
  -[ICQCloudStorageApps setApps:](v4, "setApps:", self->_apps);
  -[ICQCloudStorageApps setGenericErrorMessage:](v4, "setGenericErrorMessage:", self->_genericErrorMessage);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *apps;
  id v5;

  apps = self->_apps;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", apps, CFSTR("apps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genericErrorMessage, CFSTR("genericErrorMessage"));

}

- (ICQCloudStorageApps)initWithCoder:(id)a3
{
  id v4;
  ICQCloudStorageApps *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *apps;
  uint64_t v11;
  NSString *genericErrorMessage;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQCloudStorageApps;
  v5 = -[ICQCloudStorageApps init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("apps"));
    v9 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genericErrorMessage"));
    v11 = objc_claimAutoreleasedReturnValue();
    genericErrorMessage = v5->_genericErrorMessage;
    v5->_genericErrorMessage = (NSString *)v11;

  }
  return v5;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_storeStrong((id *)&self->_apps, a3);
}

- (NSString)genericErrorMessage
{
  return self->_genericErrorMessage;
}

- (void)setGenericErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genericErrorMessage, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
