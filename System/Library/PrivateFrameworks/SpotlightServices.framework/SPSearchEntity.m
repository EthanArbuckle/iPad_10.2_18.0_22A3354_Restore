@implementation SPSearchEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPSearchEntity)allocWithZone:(_NSZone *)a3
{
  objc_super v6;
  _QWORD block[6];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SPSearchEntity_allocWithZone___block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = a3;
  block[5] = a1;
  if (allocWithZone__onceToken != -1)
    dispatch_once(&allocWithZone__onceToken, block);
  if ((id)allocWithZone__myClass == a1)
    return (SPSearchEntity *)(id)allocWithZone__entity;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SPSearchEntity;
  return (SPSearchEntity *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

uint64_t __32__SPSearchEntity_allocWithZone___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t result;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)&OBJC_METACLASS___SPSearchEntity;
  v2 = objc_msgSend(objc_msgSendSuper2(&v5, sel_allocWithZone_, v1), "init");
  v3 = (void *)allocWithZone__entity;
  allocWithZone__entity = v2;

  result = objc_opt_class();
  allocWithZone__myClass = result;
  return result;
}

- (void)setSearchString:(id)a3
{
  objc_storeStrong((id *)&self->_searchString, a3);
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (void)setTokenString:(id)a3
{
  objc_storeStrong((id *)&self->_tokenString, a3);
}

- (BOOL)isScopedSearch
{
  return 0;
}

- (BOOL)isPhotosEntitySearch
{
  return 0;
}

- (BOOL)isContactEntitySearch
{
  return 0;
}

- (BOOL)isAppEntitySearch
{
  return 0;
}

- (BOOL)isNLPEntitySearch
{
  return 0;
}

- (BOOL)isCommandEntitySearch
{
  return 0;
}

- (BOOL)isServerEntitySearch
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *searchString;
  id v5;

  searchString = self->_searchString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", searchString, CFSTR("searchString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayString, CFSTR("displayString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenString, CFSTR("tokenString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityBackgroundColor, CFSTR("entityBackgroundColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_command, CFSTR("command"));

}

- (SPSearchEntity)initWithCoder:(id)a3
{
  id v4;
  SPSearchEntity *v5;
  uint64_t v6;
  NSString *searchString;
  uint64_t v8;
  NSString *displayString;
  uint64_t v10;
  NSString *tokenString;
  uint64_t v12;
  SFColor *entityBackgroundColor;
  uint64_t v14;
  SFCommand *command;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SPSearchEntity;
  v5 = -[SPSearchEntity init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayString"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayString = v5->_displayString;
    v5->_displayString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenString"));
    v10 = objc_claimAutoreleasedReturnValue();
    tokenString = v5->_tokenString;
    v5->_tokenString = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityBackgroundColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    entityBackgroundColor = v5->_entityBackgroundColor;
    v5->_entityBackgroundColor = (SFColor *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
    v14 = objc_claimAutoreleasedReturnValue();
    command = v5->_command;
    v5->_command = (SFCommand *)v14;

  }
  return v5;
}

- (NSString)tokenText
{
  return self->_tokenString;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)currentSearchString
{
  return self->_searchString;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)symbolName
{
  return 0;
}

- (NSString)spotlightQueryString
{
  return 0;
}

- (NSArray)spotlightFilterQueries
{
  return 0;
}

- (NSDictionary)spotlightRankCategories
{
  return 0;
}

- (NSDictionary)spotlightRankTerms
{
  return 0;
}

- (NSArray)groupingRules
{
  return 0;
}

- (SFCommand)command
{
  SFCommand *command;
  SFCommand *v4;
  void *v5;
  SFCommand *v6;

  command = self->_command;
  if (!command)
  {
    v4 = (SFCommand *)objc_opt_new();
    -[SPSearchEntity searchString](self, "searchString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setSearchString:](v4, "setSearchString:", v5);

    v6 = self->_command;
    self->_command = v4;

    command = self->_command;
  }
  return command;
}

+ (SPSearchEntity)searchEntityWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SPSearchCommandEntity *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:]([SPSearchCommandEntity alloc], "initWithSpotlightSuggestion:symbolName:fromSuggestion:", v8, v7, v5);

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithPhotosSearchString:(id)a3 fromSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  SPSearchCommandEntity *v9;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0CA6B70];
  v6 = a3;
  objc_msgSend(v5, "emptySuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  spotlightSuggestionWithCurrentSuggestion(v7, v6, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:]([SPSearchCommandEntity alloc], "initWithSpotlightSuggestion:symbolName:fromSuggestion:", v8, CFSTR("photo.on.rectangle"), v4);
  else
    v9 = 0;

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithSearchString:(id)a3 spotlightQueryString:(id)a4 preferredBundleIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  SPSearchSuggestionEntity *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SPSearchSuggestionEntity initWithSearchString:spotlightQueryString:preferredBundleIDs:]([SPSearchSuggestionEntity alloc], "initWithSearchString:spotlightQueryString:preferredBundleIDs:", v9, v8, v7);

  return (SPSearchEntity *)v10;
}

+ (SPSearchEntity)searchEntityWithBundleIdentifier:(id)a3 appName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SPSearchAppEntity *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SPSearchAppEntity initWithBundleIdentifier:appName:fromSuggestion:]([SPSearchAppEntity alloc], "initWithBundleIdentifier:appName:fromSuggestion:", v8, v7, v5);

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  SPSearchContactEntity *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[SPSearchContactEntity initWithContactIdentifier:fromSuggestion:]([SPSearchContactEntity alloc], "initWithContactIdentifier:fromSuggestion:", v5, v4);

  return (SPSearchEntity *)v6;
}

+ (SPSearchEntity)searchEntityWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  SPSearchContactEntity *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[SPSearchContactEntity initWithPersonQueryIdentifier:personName:fromSuggestion:]([SPSearchContactEntity alloc], "initWithPersonQueryIdentifier:personName:fromSuggestion:", v8, v7, v5);

  return (SPSearchEntity *)v9;
}

+ (SPSearchEntity)searchEntityWithCommand:(id)a3 fromSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SFCommand *v7;
  void *v8;
  void *v9;
  SPSearchCommandEntity *v10;
  void *v11;
  SFCommand *command;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (SFCommand *)v6;
    if (-[SFCommand entityType](v7, "entityType") == 2)
    {
      -[SFCommand entityIdentifier](v7, "entityIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCommand tokenString](v7, "tokenString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "searchEntityWithPersonQueryIdentifier:personName:fromSuggestion:", v8, v9, v4);
      v10 = (SPSearchCommandEntity *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = -[SPSearchCommandEntity initWithCommand:fromSuggestion:]([SPSearchCommandEntity alloc], "initWithCommand:fromSuggestion:", v7, v4);
    }
    -[SFCommand entityBackgroundColor](v7, "entityBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setEntityBackgroundColor:](v10, "setEntityBackgroundColor:", v11);

    command = v10->super._command;
    v10->super._command = v7;

  }
  else
  {
    v10 = 0;
  }

  return (SPSearchEntity *)v10;
}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 additions:(id)a6 flags:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (__CFString *)a7;
  if (objc_msgSend(v12, "length"))
  {
    if (objc_msgSend(v18, "length"))
      objc_msgSend(v18, "appendString:", CFSTR(" || "));
    v15 = -[__CFString length](v14, "length");
    v16 = &stru_1E6E549F0;
    if (v15)
      v16 = v14;
    if (v13)
      objc_msgSend(v18, "appendFormat:", CFSTR("(%@=\"%@\"%@ && %@)"), v11, v12, v16, v13);
    else
      objc_msgSend(v18, "appendFormat:", CFSTR("%@=\"%@\"%@"), v11, v12, v16, v17);
  }

}

- (void)appendToQuery:(id)a3 key:(id)a4 value:(id)a5 optionalValue:(id)a6 additions:(id)a7 flags:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  id v22;

  v22 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (__CFString *)a8;
  if (objc_msgSend(v14, "length") || objc_msgSend(v15, "length"))
  {
    if (objc_msgSend(v22, "length"))
      objc_msgSend(v22, "appendString:", CFSTR(" || "));
    v18 = (void *)objc_opt_new();
    if (v14 && objc_msgSend(v14, "length"))
    {
      v19 = -[__CFString length](v17, "length");
      v20 = &stru_1E6E549F0;
      if (v19)
        v20 = v17;
      objc_msgSend(v18, "appendFormat:", CFSTR("%@=\"%@\"%@"), v13, v14, v20);
    }
    if (v15 && objc_msgSend(v15, "length"))
    {
      if (objc_msgSend(v18, "length"))
        objc_msgSend(v18, "appendString:", CFSTR(" || "));
      objc_msgSend(v18, "appendFormat:", CFSTR("%@=\"%@*\"cwd"), v13, v15);
    }
    if (v16)
      objc_msgSend(v22, "appendFormat:", CFSTR("(%@ && %@)"), v18, v16);
    else
      objc_msgSend(v22, "appendFormat:", CFSTR("(%@)"), v18, v21);

  }
}

- (BOOL)hasWords
{
  return self->_hasWords;
}

- (void)setHasWords:(BOOL)a3
{
  self->_hasWords = a3;
}

- (BOOL)isSuggestion
{
  return self->_isSuggestion;
}

- (void)setIsSuggestion:(BOOL)a3
{
  self->_isSuggestion = a3;
}

- (void)setSpotlightFilterQueries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)preferredBundleIDs
{
  return self->_preferredBundleIDs;
}

- (void)setPreferredBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SFColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (void)setEntityBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_entityBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredBundleIDs, 0);
  objc_storeStrong((id *)&self->_spotlightFilterQueries, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
