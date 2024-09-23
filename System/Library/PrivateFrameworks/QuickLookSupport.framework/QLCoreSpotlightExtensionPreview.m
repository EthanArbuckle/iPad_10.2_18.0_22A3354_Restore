@implementation QLCoreSpotlightExtensionPreview

- (QLCoreSpotlightExtensionPreview)initWithQuery:(id)a3 searchableItemURL:(id)a4 searchableItemTitle:(id)a5 searchableItemUUID:(id)a6 description:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  QLCoreSpotlightExtensionPreview *v16;
  QLCoreSpotlightExtensionPreview *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLCoreSpotlightExtensionPreview;
  v16 = -[QLExtensionPreview initWithDescription:](&v19, sel_initWithDescription_, a7);
  v17 = v16;
  if (v16)
  {
    -[QLCoreSpotlightExtensionPreview setQuery:](v16, "setQuery:", v12);
    -[QLCoreSpotlightExtensionPreview setSearchableItemURL:](v17, "setSearchableItemURL:", v13);
    -[QLCoreSpotlightExtensionPreview setSearchableItemTitle:](v17, "setSearchableItemTitle:", v14);
    -[QLCoreSpotlightExtensionPreview setSearchableItemUniqueIdentifier:](v17, "setSearchableItemUniqueIdentifier:", v15);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)QLCoreSpotlightExtensionPreview;
  v4 = a3;
  -[QLExtensionPreview encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[QLCoreSpotlightExtensionPreview searchableItemUniqueIdentifier](self, "searchableItemUniqueIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("searchableItemUniqueIdentifier"));

  -[QLCoreSpotlightExtensionPreview query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("query"));

  -[QLCoreSpotlightExtensionPreview searchableItemTitle](self, "searchableItemTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("searchableItemTitle"));

  -[QLCoreSpotlightExtensionPreview searchableItemURL](self, "searchableItemURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("searchableItemURL"));

}

- (QLCoreSpotlightExtensionPreview)initWithCoder:(id)a3
{
  id v4;
  QLCoreSpotlightExtensionPreview *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)QLCoreSpotlightExtensionPreview;
  v5 = -[QLExtensionPreview initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemUniqueIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCoreSpotlightExtensionPreview setSearchableItemUniqueIdentifier:](v5, "setSearchableItemUniqueIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCoreSpotlightExtensionPreview setQuery:](v5, "setQuery:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCoreSpotlightExtensionPreview setSearchableItemTitle:](v5, "setSearchableItemTitle:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCoreSpotlightExtensionPreview setSearchableItemURL:](v5, "setSearchableItemURL:", v9);

  }
  return v5;
}

- (NSString)searchableItemUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchableItemUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)query
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQuery:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)searchableItemTitle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchableItemTitle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSURL)searchableItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSearchableItemURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchableItemURL, 0);
  objc_storeStrong((id *)&self->_searchableItemTitle, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
}

@end
