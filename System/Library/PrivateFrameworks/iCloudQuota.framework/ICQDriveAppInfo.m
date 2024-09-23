@implementation ICQDriveAppInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQDriveAppInfo *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQDriveAppInfo;
  v5 = -[ICQDriveAppInfo init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __38__ICQDriveAppInfo_initFromDictionary___block_invoke;
      v14[3] = &unk_1E8B39980;
      v15 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
      -[ICQDriveAppInfo setBundleIds:](v5, "setBundleIds:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQDriveAppInfo setLabel:](v5, "setLabel:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("excludeOnClient"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    -[ICQDriveAppInfo setExcludeOnClient:](v5, "setExcludeOnClient:", v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("containerId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQDriveAppInfo setContainerID:](v5, "setContainerID:", v12);

  }
  return v5;
}

void __38__ICQDriveAppInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleIds: %@, label: %@, excludeOnClient: %hhd, containerID: %@"), self->_bundleIds, self->_label, self->_excludeOnClient, self->_containerID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQDriveAppInfo *v4;

  v4 = objc_alloc_init(ICQDriveAppInfo);
  -[ICQDriveAppInfo setBundleIds:](v4, "setBundleIds:", self->_bundleIds);
  -[ICQDriveAppInfo setLabel:](v4, "setLabel:", self->_label);
  -[ICQDriveAppInfo setExcludeOnClient:](v4, "setExcludeOnClient:", self->_excludeOnClient);
  -[ICQDriveAppInfo setContainerID:](v4, "setContainerID:", self->_containerID);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *bundleIds;
  id v5;

  bundleIds = self->_bundleIds;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleIds, CFSTR("bundleIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_excludeOnClient, CFSTR("excludeOnClient"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerID, CFSTR("containerId"));

}

- (ICQDriveAppInfo)initWithCoder:(id)a3
{
  id v4;
  ICQDriveAppInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *bundleIds;
  uint64_t v11;
  NSString *label;
  uint64_t v13;
  NSString *containerID;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQDriveAppInfo;
  v5 = -[ICQDriveAppInfo init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("bundleIds"));
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
    v11 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v11;

    v5->_excludeOnClient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("excludeOnClient"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerId"));
    v13 = objc_claimAutoreleasedReturnValue();
    containerID = v5->_containerID;
    v5->_containerID = (NSString *)v13;

  }
  return v5;
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIds, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)excludeOnClient
{
  return self->_excludeOnClient;
}

- (void)setExcludeOnClient:(BOOL)a3
{
  self->_excludeOnClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end
