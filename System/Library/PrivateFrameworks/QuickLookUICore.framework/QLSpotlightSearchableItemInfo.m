@implementation QLSpotlightSearchableItemInfo

+ (id)spotlightInfoWithUniqueIdentifier:(id)a3 queryString:(id)a4 applicationBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSearchableItemUniqueIdentifier:", v9);

  objc_msgSend(v10, "setQueryString:", v8);
  objc_msgSend(v10, "setApplicationBundleIdentifier:", v7);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *searchableItemUniqueIdentifier;
  id v5;

  searchableItemUniqueIdentifier = self->_searchableItemUniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", searchableItemUniqueIdentifier, CFSTR("searchableItemUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queryString, CFSTR("queryString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationBundleIdentifier, CFSTR("applicationBundleIdentifier"));

}

- (QLSpotlightSearchableItemInfo)initWithCoder:(id)a3
{
  id v4;
  QLSpotlightSearchableItemInfo *v5;
  uint64_t v6;
  NSString *searchableItemUniqueIdentifier;
  uint64_t v8;
  NSString *queryString;
  uint64_t v10;
  NSString *applicationBundleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)QLSpotlightSearchableItemInfo;
  v5 = -[QLSpotlightSearchableItemInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchableItemUniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchableItemUniqueIdentifier = v5->_searchableItemUniqueIdentifier;
    v5->_searchableItemUniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queryString"));
    v8 = objc_claimAutoreleasedReturnValue();
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

  }
  return v5;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)searchableItemUniqueIdentifier
{
  return self->_searchableItemUniqueIdentifier;
}

- (void)setSearchableItemUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_searchableItemUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

@end
