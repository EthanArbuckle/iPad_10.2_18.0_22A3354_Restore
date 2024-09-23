@implementation ICQAppsSyncingToDrive

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQAppsSyncingToDrive *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQAppsSyncingToDrive;
  v5 = -[ICQAppsSyncingToDrive init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apps"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __44__ICQAppsSyncingToDrive_initFromDictionary___block_invoke;
      v10[3] = &unk_1E8B39980;
      v11 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
      -[ICQAppsSyncingToDrive setApps:](v5, "setApps:", v8);

    }
  }

  return v5;
}

void __44__ICQAppsSyncingToDrive_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[ICQDriveAppInfo initFromDictionary:]([ICQDriveAppInfo alloc], "initFromDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("apps: %@"), self->_apps);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQAppsSyncingToDrive *v4;

  v4 = objc_alloc_init(ICQAppsSyncingToDrive);
  -[ICQAppsSyncingToDrive setApps:](v4, "setApps:", self->_apps);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_apps, CFSTR("apps"));
}

- (ICQAppsSyncingToDrive)initWithCoder:(id)a3
{
  id v4;
  ICQAppsSyncingToDrive *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *apps;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQAppsSyncingToDrive;
  v5 = -[ICQAppsSyncingToDrive init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("apps"));
    v9 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
