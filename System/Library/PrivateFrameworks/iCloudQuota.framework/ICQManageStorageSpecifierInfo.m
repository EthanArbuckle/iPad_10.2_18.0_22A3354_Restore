@implementation ICQManageStorageSpecifierInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQManageStorageSpecifierInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQManageStorageSpecifierInfo;
  v5 = -[ICQManageStorageSpecifierInfo init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQManageStorageSpecifierInfo setType:](v5, "setType:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQManageStorageSpecifierInfo setTitle:](v5, "setTitle:", v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQManageStorageSpecifierInfo setSubtitle:](v5, "setSubtitle:", v8);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconURLs"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = -[ICQImageURL initFromDictionary:]([ICQImageURL alloc], "initFromDictionary:", v9);
      -[ICQManageStorageSpecifierInfo setIconURL:](v5, "setIconURL:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__ICQManageStorageSpecifierInfo_initFromDictionary___block_invoke;
      v20[3] = &unk_1E8B39980;
      v21 = v12;
      v13 = v12;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);
      -[ICQManageStorageSpecifierInfo setActions:](v5, "setActions:", v13);

    }
    -[ICQManageStorageSpecifierInfo actions](v5, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
    {
      v16 = -[ICQActionInfo initFromDictionary:]([ICQActionInfo alloc], "initFromDictionary:", v4);
      v17 = v16;
      if (v16)
      {
        v23[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQManageStorageSpecifierInfo setActions:](v5, "setActions:", v18);

      }
    }

  }
  return v5;
}

void __52__ICQManageStorageSpecifierInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[ICQActionInfo initFromDictionary:]([ICQActionInfo alloc], "initFromDictionary:", v4);
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("type: %@, title: %@, subtitle: %@, iconURL: %@, actions: %@"), self->_type, self->_title, self->_subtitle, self->_iconURL, self->_actions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQManageStorageSpecifierInfo *v4;

  v4 = objc_alloc_init(ICQManageStorageSpecifierInfo);
  -[ICQManageStorageSpecifierInfo setType:](v4, "setType:", self->_type);
  -[ICQManageStorageSpecifierInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQManageStorageSpecifierInfo setSubtitle:](v4, "setSubtitle:", self->_subtitle);
  -[ICQManageStorageSpecifierInfo setIconURL:](v4, "setIconURL:", self->_iconURL);
  -[ICQManageStorageSpecifierInfo setActions:](v4, "setActions:", self->_actions);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));

}

- (ICQManageStorageSpecifierInfo)initWithCoder:(id)a3
{
  id v4;
  ICQManageStorageSpecifierInfo *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subtitle;
  uint64_t v12;
  ICQImageURL *iconURL;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *actions;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICQManageStorageSpecifierInfo;
  v5 = -[ICQManageStorageSpecifierInfo init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("actions"));
    v17 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

  }
  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
