@implementation ICQManageStoragePageInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQManageStoragePageInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQManageStoragePageInfo;
  v5 = -[ICQManageStoragePageInfo init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storageGraphFooterText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_storageGraphFooterText, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_title, v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("specifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke;
      v20[3] = &unk_1E8B39980;
      v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = v21;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v20);
      -[ICQManageStoragePageInfo setSpecifiers:](v5, "setSpecifiers:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tips"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v10;
      v16 = 3221225472;
      v17 = __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke_2;
      v18 = &unk_1E8B39980;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = v19;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v15);
      -[ICQManageStoragePageInfo setTips:](v5, "setTips:", v13, v15, v16, v17, v18);

    }
  }

  return v5;
}

void __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[ICQManageStorageSpecifierInfo initFromDictionary:]([ICQManageStorageSpecifierInfo alloc], "initFromDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __47__ICQManageStoragePageInfo_initFromDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = -[ICQTipInfo initFromDictionary:]([ICQTipInfo alloc], "initFromDictionary:", v5);
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("title: %@, thermometer footer text: %@, specifiers: %@, tips: %@"), self->_title, self->_storageGraphFooterText, self->_specifiers, self->_tips);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQManageStoragePageInfo *v4;

  v4 = objc_alloc_init(ICQManageStoragePageInfo);
  -[ICQManageStoragePageInfo setStorageGraphFooterText:](v4, "setStorageGraphFooterText:", self->_storageGraphFooterText);
  -[ICQManageStoragePageInfo setTitle:](v4, "setTitle:", self->_title);
  -[ICQManageStoragePageInfo setSpecifiers:](v4, "setSpecifiers:", self->_specifiers);
  -[ICQManageStoragePageInfo setTips:](v4, "setTips:", self->_tips);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *storageGraphFooterText;
  id v5;

  storageGraphFooterText = self->_storageGraphFooterText;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", storageGraphFooterText, CFSTR("thermometerFooterText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_specifiers, CFSTR("specifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tips, CFSTR("tips"));

}

- (ICQManageStoragePageInfo)initWithCoder:(id)a3
{
  id v4;
  ICQManageStoragePageInfo *v5;
  uint64_t v6;
  NSString *storageGraphFooterText;
  uint64_t v8;
  NSString *title;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *specifiers;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *tips;
  objc_super v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQManageStoragePageInfo;
  v5 = -[ICQManageStoragePageInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thermometerFooterText"));
    v6 = objc_claimAutoreleasedReturnValue();
    storageGraphFooterText = v5->_storageGraphFooterText;
    v5->_storageGraphFooterText = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("specifiers"));
    v13 = objc_claimAutoreleasedReturnValue();
    specifiers = v5->_specifiers;
    v5->_specifiers = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("tips"));
    v18 = objc_claimAutoreleasedReturnValue();
    tips = v5->_tips;
    v5->_tips = (NSArray *)v18;

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

- (NSString)storageGraphFooterText
{
  return self->_storageGraphFooterText;
}

- (void)setStorageGraphFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_specifiers, a3);
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
  objc_storeStrong((id *)&self->_tips, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_storageGraphFooterText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
