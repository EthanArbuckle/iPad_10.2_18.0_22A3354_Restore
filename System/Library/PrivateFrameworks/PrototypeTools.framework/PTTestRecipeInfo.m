@implementation PTTestRecipeInfo

- (PTTestRecipeInfo)initWithTestRecipe:(id)a3 domainInfo:(id)a4
{
  id v6;
  id v7;
  PTTestRecipeInfo *v8;
  uint64_t v9;
  NSString *domainIdentifier;
  uint64_t v11;
  NSString *title;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *recipeDescription;
  void *v18;
  id v19;
  uint64_t v20;
  NSIndexSet *events;
  _QWORD v23[4];
  id v24;
  id v25;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PTTestRecipeInfo;
  v8 = -[PTTestRecipeInfo init](&v26, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v9;

    objc_msgSend(v6, "title");
    v11 = objc_claimAutoreleasedReturnValue();
    title = v8->_title;
    v8->_title = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "domainGroupName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domainName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ – %@: %@"), v14, v15, v8->_title);
    v16 = objc_claimAutoreleasedReturnValue();
    recipeDescription = v8->_recipeDescription;
    v8->_recipeDescription = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__PTTestRecipeInfo_initWithTestRecipe_domainInfo___block_invoke;
    v23[3] = &unk_1E7058488;
    v24 = v6;
    v25 = v18;
    v19 = v18;
    PTPrototypingEnumerateHardwareEventsWithBlock(v23);
    v20 = objc_msgSend(v19, "copy");
    events = v8->_events;
    v8->_events = (NSIndexSet *)v20;

  }
  return v8;
}

uint64_t __50__PTTestRecipeInfo_initWithTestRecipe_domainInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_wantsEvent:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

- (NSString)uniqueIdentifier
{
  NSString *uniqueIdentifier;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString componentsSeparatedByCharactersInSet:](self->_title, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", &stru_1E7059270);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->_domainIdentifier, v6);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v7;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  return uniqueIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && BSEqualStrings()
    && BSEqualStrings()
    && BSEqualObjects())
  {
    v4 = BSEqualStrings();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendString:", self->_title);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_domainIdentifier);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_events);
  v7 = (id)objc_msgSend(v3, "appendString:", self->_recipeDescription);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainIdentifier;
  id v5;

  domainIdentifier = self->_domainIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_events, CFSTR("events"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipeDescription, CFSTR("description"));

}

- (PTTestRecipeInfo)initWithCoder:(id)a3
{
  id v4;
  PTTestRecipeInfo *v5;
  uint64_t v6;
  NSString *domainIdentifier;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSIndexSet *events;
  uint64_t v12;
  NSString *recipeDescription;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PTTestRecipeInfo;
  v5 = -[PTTestRecipeInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("events"));
    v10 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSIndexSet *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("description"));
    v12 = objc_claimAutoreleasedReturnValue();
    recipeDescription = v5->_recipeDescription;
    v5->_recipeDescription = (NSString *)v12;

  }
  return v5;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSIndexSet)events
{
  return self->_events;
}

- (NSString)recipeDescription
{
  return self->_recipeDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeDescription, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
