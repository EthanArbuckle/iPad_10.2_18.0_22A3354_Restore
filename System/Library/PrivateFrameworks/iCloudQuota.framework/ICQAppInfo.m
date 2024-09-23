@implementation ICQAppInfo

- (id)initFromDictionary:(id)a3
{
  id v4;
  ICQAppInfo *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ICQAppInfo;
  v5 = -[ICQAppInfo init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIds"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __33__ICQAppInfo_initFromDictionary___block_invoke;
      v19[3] = &unk_1E8B39980;
      v20 = v7;
      v8 = v7;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v19);
      -[ICQAppInfo setBundleIds:](v5, "setBundleIds:", v8);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQAppInfo setLabel:](v5, "setLabel:", v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fetchLocally"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    -[ICQAppInfo setFetchLocally:](v5, "setFetchLocally:", v11);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconURLs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[ICQImageURL initFromDictionary:]([ICQImageURL alloc], "initFromDictionary:", v12);
      -[ICQAppInfo setIconURL:](v5, "setIconURL:", v13);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQAppInfo setDetailLabel:](v5, "setDetailLabel:", v14);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detailLabelColor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[ICQAppInfo setDetailLabelColor:](v5, "setDetailLabelColor:", v15);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("action"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[ICQActionInfo initFromDictionary:]([ICQActionInfo alloc], "initFromDictionary:", v16);
      -[ICQAppInfo setAction:](v5, "setAction:", v17);

    }
  }

  return v5;
}

void __33__ICQAppInfo_initFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleIds: %@, label: %@, fetchLocally: %hhd, iconURL: %@, detailLabel: %@, detailLabelColor: %@, action: %@"), self->_bundleIds, self->_label, self->_fetchLocally, self->_iconURL, self->_detailLabel, self->_detailLabelColor, self->_action);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQAppInfo *v4;

  v4 = objc_alloc_init(ICQAppInfo);
  -[ICQAppInfo setBundleIds:](v4, "setBundleIds:", self->_bundleIds);
  -[ICQAppInfo setLabel:](v4, "setLabel:", self->_label);
  -[ICQAppInfo setFetchLocally:](v4, "setFetchLocally:", self->_fetchLocally);
  -[ICQAppInfo setIconURL:](v4, "setIconURL:", self->_iconURL);
  -[ICQAppInfo setDetailLabel:](v4, "setDetailLabel:", self->_detailLabel);
  -[ICQAppInfo setDetailLabelColor:](v4, "setDetailLabelColor:", self->_detailLabelColor);
  -[ICQAppInfo setAction:](v4, "setAction:", self->_action);
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
  objc_msgSend(v5, "encodeBool:forKey:", self->_fetchLocally, CFSTR("fetchLocally"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailLabel, CFSTR("detailLabel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailLabelColor, CFSTR("detailLabelColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_action, CFSTR("action"));

}

- (ICQAppInfo)initWithCoder:(id)a3
{
  id v4;
  ICQAppInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *bundleIds;
  uint64_t v11;
  NSString *label;
  uint64_t v13;
  ICQImageURL *iconURL;
  uint64_t v15;
  NSString *detailLabel;
  uint64_t v17;
  NSString *detailLabelColor;
  uint64_t v19;
  ICQActionInfo *action;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ICQAppInfo;
  v5 = -[ICQAppInfo init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
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

    v5->_fetchLocally = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fetchLocally"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailLabel"));
    v15 = objc_claimAutoreleasedReturnValue();
    detailLabel = v5->_detailLabel;
    v5->_detailLabel = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("detailLabelColor"));
    v17 = objc_claimAutoreleasedReturnValue();
    detailLabelColor = v5->_detailLabelColor;
    v5->_detailLabelColor = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v19 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (ICQActionInfo *)v19;

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

- (BOOL)fetchLocally
{
  return self->_fetchLocally;
}

- (void)setFetchLocally:(BOOL)a3
{
  self->_fetchLocally = a3;
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
  objc_storeStrong((id *)&self->_iconURL, a3);
}

- (NSString)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)detailLabelColor
{
  return self->_detailLabelColor;
}

- (void)setDetailLabelColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (ICQActionInfo)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_detailLabelColor, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
}

@end
