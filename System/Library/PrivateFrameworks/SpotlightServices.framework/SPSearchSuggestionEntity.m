@implementation SPSearchSuggestionEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPSearchSuggestionEntity;
  v4 = a3;
  -[SPSearchEntity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_spotlightQueryString, CFSTR("spotlightQueryString"), v5.receiver, v5.super_class);

}

- (SPSearchSuggestionEntity)initWithCoder:(id)a3
{
  id v4;
  SPSearchSuggestionEntity *v5;
  uint64_t v6;
  NSString *spotlightQueryString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPSearchSuggestionEntity;
  v5 = -[SPSearchEntity initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightQueryString"));
    v6 = objc_claimAutoreleasedReturnValue();
    spotlightQueryString = v5->_spotlightQueryString;
    v5->_spotlightQueryString = (NSString *)v6;

    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", 1);
  }

  return v5;
}

- (SPSearchSuggestionEntity)initWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPSearchSuggestionEntity *v11;
  SPSearchSuggestionEntity *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SPSearchSuggestionEntity;
  v11 = -[SPSearchSuggestionEntity init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[SPSearchEntity setSearchString:](v11, "setSearchString:", v8);
    -[SPSearchEntity setDisplayString:](v12, "setDisplayString:", v8);
    objc_storeStrong((id *)&v12->_spotlightQueryString, a4);
    -[SPSearchEntity setPreferredBundleIDs:](v12, "setPreferredBundleIDs:", v10);
  }

  return v12;
}

- (id)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
}

@end
