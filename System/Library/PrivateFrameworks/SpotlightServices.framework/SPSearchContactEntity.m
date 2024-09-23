@implementation SPSearchContactEntity

+ (id)updatePersonQueryIdentifier:(id)a3 withContactIdentifier:(id)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\tcontactIdentifier=%@"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)updatePersonQueryIdentifier:(id)a3 withPersonIdentifier:(id)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\tpersonIdentifier=%@"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SPSearchContactEntity)initWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  SPSearchContactEntity *v8;
  SPSearchContactEntity *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a4;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPSearchContactEntity;
  v8 = -[SPSearchContactEntity init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactIdentifier, a3);
    -[SPSearchEntity setIsSuggestion:](v9, "setIsSuggestion:", v4);
    -[SPSearchContactEntity commonInit](v9, "commonInit");
    -[SPSearchContactEntity name](v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setTokenString:](v9, "setTokenString:", v10);

    -[SPSearchContactEntity name](v9, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setDisplayString:](v9, "setDisplayString:", v11);

  }
  return v9;
}

- (SPSearchContactEntity)initWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  SPSearchContactEntity *v11;
  SPSearchContactEntity *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPSearchContactEntity;
  v11 = -[SPSearchContactEntity init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a4);
    objc_storeStrong((id *)&v12->_personQueryIdentifier, a3);
    -[SPSearchEntity setIsSuggestion:](v12, "setIsSuggestion:", v5);
    -[SPSearchContactEntity commonInit](v12, "commonInit");
    -[SPSearchContactEntity name](v12, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setTokenString:](v12, "setTokenString:", v13);

    -[SPSearchContactEntity name](v12, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setDisplayString:](v12, "setDisplayString:", v14);

  }
  return v12;
}

- (void)getVariantsForPhoneNumber:(id)a3 searchNumbers:(id)a4 displayNumbers:(id)a5 fallbackDisplayNumbers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invertedSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v9, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", &stru_1E6E549F0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v18;
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(v9, "formattedStringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "formattedInternationalStringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unformattedInternationalStringValue");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v19 && v20 && v21)
      {
        if ((objc_msgSend(v10, "containsObject:", v19) & 1) == 0)
          objc_msgSend(v10, "addObject:", v19);
        if ((objc_msgSend(v10, "containsObject:", v20) & 1) == 0)
          objc_msgSend(v10, "addObject:", v20);
        if ((objc_msgSend(v10, "containsObject:", v22) & 1) == 0)
          objc_msgSend(v10, "addObject:", v22);
        if ((unint64_t)objc_msgSend(v22, "length") <= 3)
        {
          v23 = v22;
        }
        else
        {
          objc_msgSend(v22, "substringFromIndex:", objc_msgSend(v22, "length") - 4);
          v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
        objc_msgSend(v11, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v26 = (void *)objc_opt_new();
          objc_msgSend(v11, "setObject:forKey:", v26, v24);

        }
        objc_msgSend(v12, "objectForKey:", v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27)
        {
          v28 = (void *)objc_opt_new();
          objc_msgSend(v12, "setObject:forKey:", v28, v24);

        }
        if (objc_msgSend(v19, "isEqualToString:", v20))
          v29 = v11;
        else
          v29 = v12;
        objc_msgSend(v29, "objectForKeyedSubscript:", v24);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v9);

      }
    }

  }
}

- (void)commonInit
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_1B86C5000, v0, OS_LOG_TYPE_DEBUG, "contactEntity rankTerms: %@", v1, 0xCu);
  OUTLINED_FUNCTION_8();
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
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPSearchContactEntity;
  v4 = a3;
  -[SPSearchEntity encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rankTerms, CFSTR("rankTerms"), v8.receiver, v8.super_class);
  -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, kContactIdentifierKey);

  -[SPSearchContactEntity personIdentifier](self, "personIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, kPersonIdentifierKey);

  -[SPSearchContactEntity personQueryIdentifier](self, "personQueryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, kPersonQueryIdentifierKey);

  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), CFSTR("isSuggestion"));
}

- (SPSearchContactEntity)initWithCoder:(id)a3
{
  id v4;
  SPSearchContactEntity *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *rankTerms;
  uint64_t v12;
  NSString *contactIdentifier;
  uint64_t v14;
  NSString *personIdentifier;
  uint64_t v16;
  NSString *personQueryIdentifier;
  uint64_t v18;
  NSString *name;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  if (initWithCoder__onceQueryTermClassesToken != -1)
    dispatch_once(&initWithCoder__onceQueryTermClassesToken, &__block_literal_global_57);
  v23.receiver = self;
  v23.super_class = (Class)SPSearchContactEntity;
  v5 = -[SPSearchEntity initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("rankTerms"));
    v10 = objc_claimAutoreleasedReturnValue();
    rankTerms = v5->_rankTerms;
    v5->_rankTerms = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kContactIdentifierKey);
    v12 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kPersonIdentifierKey);
    v14 = objc_claimAutoreleasedReturnValue();
    personIdentifier = v5->_personIdentifier;
    v5->_personIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kPersonQueryIdentifierKey);
    v16 = objc_claimAutoreleasedReturnValue();
    personQueryIdentifier = v5->_personQueryIdentifier;
    v5->_personQueryIdentifier = (NSString *)v16;

    -[SPSearchEntity tokenText](v5, "tokenText");
    v18 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v18;

    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestion")));
    -[SPSearchContactEntity commonInit](v5, "commonInit");
    -[SPSearchContactEntity name](v5, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setTokenString:](v5, "setTokenString:", v20);

    -[SPSearchContactEntity name](v5, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setDisplayString:](v5, "setDisplayString:", v21);

  }
  return v5;
}

void __39__SPSearchContactEntity_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__queryTermClassesToDecode;
  initWithCoder__queryTermClassesToDecode = v2;

}

- (void)updateSearchString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  SPSearchContactEntity *v9;
  __CFString *v10;

  v10 = (__CFString *)a3;
  -[SPSearchEntity displayString](self, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v10 || !v4)
  {

    goto LABEL_6;
  }
  -[SPSearchEntity displayString](self, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v10);

  if (!v7)
  {
LABEL_6:
    v9 = self;
    v8 = v10;
    goto LABEL_7;
  }
  v8 = &stru_1E6E549F0;
  v9 = self;
LABEL_7:
  -[SPSearchEntity setSearchString:](v9, "setSearchString:", v8);

}

- (BOOL)isContactEntitySearch
{
  return 1;
}

- (BOOL)isScopedSearch
{
  return 1;
}

- (id)spotlightFilterQueries
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(_kMDItemBundleID!=\"%@\" || InRange(%@, $time.now(-%luM), $time.now(+%luM)) || InRange(%@, $time.now(-%luM), $time.now(+%luM)))"), CFSTR("com.apple.mobilecal"), *MEMORY[0x1E0CA68C8], 1, 3, *MEMORY[0x1E0CA61C8], 1, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  v5[1] = CFSTR("kMDItemContentTypeTree!=\"public.contact\");
  v5[2] = CFSTR("kMDItemContentType!=\"com.apple.application\");
  v5[3] = CFSTR("_kMDItemBundleID!=\"com.apple.MobileAddressBook\");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)spotlightRankTerms
{
  return self->_rankTerms;
}

- (id)currentSearchString
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SPSearchEntity searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SPSearchEntity tokenText](self, "tokenText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity searchString](self, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPSearchContactEntity name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)spotlightQueryString
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  __CFString *v38;
  NSMutableArray *obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  NSMutableArray *v48;
  NSMutableArray *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *MEMORY[0x1E0CA6028];
    -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v5, v6, 0, 0);

    v7 = *MEMORY[0x1E0CA60B0];
    -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v7, v8, 0, 0);

    v9 = *MEMORY[0x1E0CA6620];
    -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v9, v10, 0, 0);

  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = self->_allNames;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v11)
  {
    v12 = v11;
    v51 = *(_QWORD *)v63;
    v47 = (id)*MEMORY[0x1E0CA6048];
    v46 = *MEMORY[0x1E0CA67D8];
    v45 = *MEMORY[0x1E0CA6158];
    v44 = *MEMORY[0x1E0CA6968];
    v42 = *MEMORY[0x1E0CA60B8];
    v43 = *MEMORY[0x1E0CA6630];
    v41 = *MEMORY[0x1E0CA6518];
    v13 = *MEMORY[0x1E0CA6440];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v63 != v51)
          objc_enumerationMutation(obj);
        SSEscapedStringForSearchQuery(*(void **)(*((_QWORD *)&v62 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchContactEntity personIdentifier](self, "personIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          v17 = 0;
        else
          v17 = v15;
        v18 = v17;

        -[SPSearchContactEntity personIdentifier](self, "personIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v20 = v15;
        else
          v20 = 0;
        v21 = v20;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\"), CFSTR("com.apple.mobilecal"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v47, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v46, v18, v21, v22, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v45, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v44, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v43, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v42, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v41, v18, v21, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v13, v18, v21, 0, CFSTR("cwdx"));

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    }
    while (v12);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v49 = self->_allEmailAddresses;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v23)
  {
    v24 = v23;
    v52 = *(_QWORD *)v59;
    v25 = *MEMORY[0x1E0CA61B8];
    v26 = *MEMORY[0x1E0CA6030];
    v27 = *MEMORY[0x1E0CA6628];
    v28 = *MEMORY[0x1E0CA66F8];
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v59 != v52)
          objc_enumerationMutation(v49);
        SSEscapedStringForSearchQuery(*(void **)(*((_QWORD *)&v58 + 1) + 8 * j));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v25, v30, 0, CFSTR("cdx"));
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v26, v30, 0, CFSTR("cdx"));
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v27, v30, 0, CFSTR("cdx"));
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v28, v30, 0, CFSTR("cdx"));

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v24);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v48 = self->_allPhoneNumbers;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v31)
  {
    v32 = v31;
    v53 = *(_QWORD *)v55;
    v50 = (id)*MEMORY[0x1E0CA6018];
    v33 = *MEMORY[0x1E0CA6570];
    v34 = *MEMORY[0x1E0CA6968];
    v35 = *MEMORY[0x1E0CA6158];
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v55 != v53)
          objc_enumerationMutation(v48);
        SSEscapedStringForSearchQuery(*(void **)(*((_QWORD *)&v54 + 1) + 8 * k));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v50, v37, 0, CFSTR("cdx"));
        -[SPSearchEntity appendToQuery:key:value:additions:flags:](self, "appendToQuery:key:value:additions:flags:", v3, v33, v37, 0, CFSTR("cdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v34, 0, v37, 0, CFSTR("cwdx"));
        -[SPSearchEntity appendToQuery:key:value:optionalValue:additions:flags:](self, "appendToQuery:key:value:optionalValue:additions:flags:", v3, v35, 0, v37, 0, CFSTR("cwdx"));

      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v3);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = CFSTR("(*=*)");
  }

  return v38;
}

- (id)symbolName
{
  return CFSTR("person.crop.circle");
}

- (id)contact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[SPSearchContactEntity contactIdentifier](self, "contactIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        +[SSContactStore contactForContactIdentifier:](SSContactStore, "contactForContactIdentifier:", v4),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    -[SPSearchEntity tokenText](self, "tokenText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSNameFormatManager contactFromName:](SSNameFormatManager, "contactFromName:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (BOOL)stringA:(id)a3 isSameToStringB:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return 1;
}

- (BOOL)hasSameContactAsContactEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[SPSearchContactEntity personIdentifier](self, "personIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchContactEntity contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend((id)objc_opt_class(), "stringA:isSameToStringB:", v6, v8))
    v9 = objc_msgSend((id)objc_opt_class(), "stringA:isSameToStringB:", v5, v7);
  else
    v9 = 0;

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (NSDateComponents)birthdayComponents
{
  return self->_birthdayComponents;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)rawPhoneNumbers
{
  return self->_rawPhoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_rawPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_birthdayComponents, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rankTerms, 0);
  objc_storeStrong((id *)&self->_allEmailAddresses, 0);
  objc_storeStrong((id *)&self->_allPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_allNames, 0);
}

- (void)getVariantsForPhoneNumber:(void *)a1 searchNumbers:displayNumbers:fallbackDisplayNumbers:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0_3(&dword_1B86C5000, MEMORY[0x1E0C81028], v1, "Error parsing number: %@", v2, v3, v4, v5, 2u);
  objc_end_catch();
}

@end
