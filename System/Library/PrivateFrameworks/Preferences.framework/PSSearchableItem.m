@implementation PSSearchableItem

- (id)toCSSearchableItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = objc_alloc(MEMORY[0x1E0CA6B50]);
  -[PSSearchableItem classIdentifier](self, "classIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithItemContentType:", v4);

  -[PSSearchableItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubject:", v6);

  -[PSSearchableItem contentDescription](self, "contentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentDescription:", v7);

  -[PSSearchableItem keywords](self, "keywords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeywords:", v8);

  -[PSSearchableItem category](self, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[PSSearchableItem category](self, "category");
  else
    -[PSSearchableItem identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTheme:", v10);

  -[PSSearchableItem url](self, "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v11);

  -[PSSearchableItem rankingHint](self, "rankingHint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRankingHint:", v12);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(CFSTR("com.apple.Preferences"), "isEqualToString:", v14);

  if (v15)
  {
    -[PSSearchableItem name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v16);

    -[PSSearchableItem contentDescription](self, "contentDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubtitle:", v17);

  }
  -[PSSearchableItem url](self, "url");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("settings-navigation:"));

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[PSSearchableItem url](self, "url");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21);

    objc_msgSend(v22, "pathComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "host");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(CFSTR("com.apple.Settings.Apps"), "isEqualToString:", v24))
    {
      v25 = objc_msgSend(v23, "count");

      if (v25 < 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRelatedAppBundleIdentifier:", v24);
    }

    goto LABEL_11;
  }
LABEL_12:
  v26 = objc_alloc(MEMORY[0x1E0CA6B48]);
  -[PSSearchableItem url](self, "url");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSearchableItem classIdentifier](self, "classIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v26, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v27, v28, v5);

  return v29;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)classIdentifier
{
  return self->_classIdentifier;
}

- (NSString)category
{
  return self->_category;
}

- (NSNumber)rankingHint
{
  return self->_rankingHint;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (NSString)contentDescription
{
  return self->_contentDescription;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setRequiredCapabilitiesOr:(id)a3
{
  objc_storeStrong((id *)&self->_requiredCapabilitiesOr, a3);
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_requiredCapabilities, a3);
}

- (void)setRankingHint:(id)a3
{
  objc_storeStrong((id *)&self->_rankingHint, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setKeywords:(id)a3
{
  objc_storeStrong((id *)&self->_keywords, a3);
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setContentDescription:(id)a3
{
  objc_storeStrong((id *)&self->_contentDescription, a3);
}

- (void)setClassIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_classIdentifier, a3);
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredCapabilitiesOr, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_rankingHint, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_contentDescription, 0);
  objc_storeStrong((id *)&self->_classIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (id)toManifestDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;

  v3 = (void *)objc_opt_new();
  -[PSSearchableItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PSSearchableItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("label"));

  }
  -[PSSearchableItem url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[PSSearchableItem url](self, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("searchURL"));

  }
  -[PSSearchableItem category](self, "category");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[PSSearchableItem category](self, "category");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PSSearchableItem identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
      goto LABEL_10;
    -[PSSearchableItem identifier](self, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("searchSectionID"));

LABEL_10:
  -[PSSearchableItem keywords](self, "keywords");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    -[PSSearchableItem keywords](self, "keywords");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("keywords"));

  }
  -[PSSearchableItem requiredCapabilities](self, "requiredCapabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    -[PSSearchableItem requiredCapabilities](self, "requiredCapabilities");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("requiredCapabilities"));

  }
  -[PSSearchableItem requiredCapabilitiesOr](self, "requiredCapabilitiesOr");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    -[PSSearchableItem requiredCapabilitiesOr](self, "requiredCapabilitiesOr");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("requiredCapabilitiesOr"));

  }
  -[PSSearchableItem contentDescription](self, "contentDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    -[PSSearchableItem contentDescription](self, "contentDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("contentDescription"));

  }
  v29 = (void *)objc_msgSend(v3, "copy");

  return v29;
}

- (id)toAutomationDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_opt_new();
  -[PSSearchableItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[PSSearchableItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  }
  -[PSSearchableItem contentDescription](self, "contentDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    -[PSSearchableItem contentDescription](self, "contentDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("subtitle"));

  }
  -[PSSearchableItem url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[PSSearchableItem url](self, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("url"));

  }
  -[PSSearchableItem keywords](self, "keywords");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    -[PSSearchableItem keywords](self, "keywords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("keywords"));

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSArray)requiredCapabilitiesOr
{
  return self->_requiredCapabilitiesOr;
}

@end
