@implementation ICQConfirmationInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQConfirmationInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQConfirmationInfo;
  v5 = -[ICQConfirmationInfo init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQConfirmationInfo setTitle:](v5, "setTitle:", v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQConfirmationInfo setSubtitle:](v5, "setSubtitle:", v10);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconURLs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = -[ICQImageURL initFromDictionary:]([ICQImageURL alloc], "initFromDictionary:", v11);
      -[ICQConfirmationInfo setIconURL:](v5, "setIconURL:", v12);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __42__ICQConfirmationInfo_initFromDictionary___block_invoke;
      v17[3] = &unk_1E8B39980;
      v18 = v14;
      v15 = v14;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v17);
      -[ICQConfirmationInfo setActions:](v5, "setActions:", v15);

    }
  }

  return v5;
}

void __42__ICQConfirmationInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[ICQConfirmationActionInfo initFromDictionary:]([ICQConfirmationActionInfo alloc], "initFromDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title: %@, subtitle: %@, iconURL: %@, actions: %@"), self->_title, self->_subtitle, self->_iconURL, self->_actions);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQConfirmationInfo *v4;

  v4 = objc_alloc_init(ICQConfirmationInfo);
  -[ICQConfirmationInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQConfirmationInfo setSubtitle:](v4, "setSubtitle:", self->_subtitle);
  -[ICQConfirmationInfo setIconURL:](v4, "setIconURL:", self->_iconURL);
  -[ICQConfirmationInfo setActions:](v4, "setActions:", self->_actions);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("subTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));

}

- (ICQConfirmationInfo)initWithCoder:(id)a3
{
  id v4;
  ICQConfirmationInfo *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  ICQImageURL *iconURL;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *actions;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQConfirmationInfo;
  v5 = -[ICQConfirmationInfo init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("actions"));
    v15 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v15;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
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
}

@end
