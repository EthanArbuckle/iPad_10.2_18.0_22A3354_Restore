@implementation SPSearchCommandEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCommandEntitySearch
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPSearchCommandEntity;
  v4 = a3;
  -[SPSearchEntity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_performCommand, CFSTR("performCommand"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), CFSTR("isSuggestion"));

}

- (SPSearchCommandEntity)initWithSpotlightSuggestion:(id)a3 symbolName:(id)a4 fromSuggestion:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  SPSearchCommandEntity *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *performCommand;
  SFCommand *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  SFCommand *v29;
  SFCommand *v30;
  void *v31;
  id v32;
  _BOOL4 v34;
  id v35;
  objc_super v36;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SPSearchCommandEntity;
  v11 = -[SPSearchCommandEntity init](&v36, sel_init);
  if (!v11)
    goto LABEL_14;
  objc_msgSend(v9, "currentToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPSearchEntity setSearchString:](v11, "setSearchString:", v15);
  -[SPSearchEntity setDisplayString:](v11, "setDisplayString:", v15);
  objc_msgSend(v9, "currentToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v5;
  if (objc_msgSend(v16, "tokenKind") == 17)
  {

  }
  else
  {
    objc_msgSend(v9, "currentToken");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "tokenKind");

    if (v18 != 45)
    {
      v30 = (SFCommand *)objc_opt_new();
      -[SFCommand setSearchString:](v30, "setSearchString:", v15);
      -[SFCommand setQuerySource:](v30, "setQuerySource:", 1);
      performCommand = v11->_performCommand;
      v11->_performCommand = v30;
      goto LABEL_10;
    }
  }
  objc_msgSend(v9, "currentToken");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scopes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  performCommand = (void *)objc_claimAutoreleasedReturnValue();

  -[SPSearchEntity setTokenString:](v11, "setTokenString:", performCommand);
  v22 = (SFCommand *)objc_opt_new();
  -[SFCommand setSearchString:](v22, "setSearchString:", v15);
  -[SFCommand setTokenString:](v22, "setTokenString:", performCommand);
  objc_msgSend(v9, "currentToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "tokenKind");

  if (v24 == 17)
  {
    v25 = 1;
  }
  else
  {
    objc_msgSend(v9, "currentToken");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "tokenKind") == 45;

    v25 = (4 * v27);
  }
  -[SFCommand setEntityType:](v22, "setEntityType:", v25);
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setIsTemplate:", 1);
  objc_msgSend(v28, "setSymbolName:", v10);
  -[SFCommand setSymbolImage:](v22, "setSymbolImage:", v28);
  v29 = v11->_performCommand;
  v11->_performCommand = v22;

LABEL_10:
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v35;
  -[SFCommand setBackendData:](v11->_performCommand, "setBackendData:", v31);

  if (v32 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:].cold.1();
  objc_storeStrong((id *)&v11->_symbolName, a4);
  objc_storeStrong((id *)&v11->_searchModel, a3);
  -[SPSearchEntity setIsSuggestion:](v11, "setIsSuggestion:", v34);

LABEL_14:
  return v11;
}

- (SPSearchCommandEntity)initWithCoder:(id)a3
{
  id v4;
  SPSearchCommandEntity *v5;
  uint64_t v6;
  NSString *symbolName;
  uint64_t v8;
  SFCommand *performCommand;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  CSSuggestion *searchModel;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SPSearchCommandEntity;
  v5 = -[SPSearchEntity initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("performCommand"));
    v8 = objc_claimAutoreleasedReturnValue();
    performCommand = v5->_performCommand;
    v5->_performCommand = (SFCommand *)v8;

    -[SFCommand backendData](v5->_performCommand, "backendData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = objc_opt_class();
      -[SFCommand backendData](v5->_performCommand, "backendData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v11, "unarchivedObjectOfClass:fromData:error:", v12, v13, &v18);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v18;
      searchModel = v5->_searchModel;
      v5->_searchModel = (CSSuggestion *)v14;

      if (v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:].cold.1();

    }
    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSuggestion")));
  }

  return v5;
}

- (SPSearchCommandEntity)initWithCommand:(id)a3 fromSuggestion:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  SPSearchCommandEntity *v8;
  id v9;
  void *v10;
  void *v11;
  void *symbolName;
  const __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  id *p_performCommand;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  CSSuggestion *searchModel;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  CSSuggestion *v38;
  CSSuggestion *v39;
  id v41;
  id v42;
  objc_super v43;

  v4 = a4;
  v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SPSearchCommandEntity;
  v8 = -[SPSearchCommandEntity init](&v43, sel_init);
  if (!v8)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v7;
    objc_msgSend(v9, "searchString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setSearchString:](v8, "setSearchString:", v10);

    objc_msgSend(v9, "searchString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setDisplayString:](v8, "setDisplayString:", v11);

    symbolName = v8->_symbolName;
    v13 = CFSTR("magnifyingglass");
LABEL_9:
    v8->_symbolName = &v13->isa;
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v7;
    objc_msgSend(v14, "searchString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setSearchString:](v8, "setSearchString:", v15);

    objc_msgSend(v14, "searchString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[SPSearchEntity setDisplayString:](v8, "setDisplayString:", v16);
    }
    else
    {
      objc_msgSend(v14, "tokenString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPSearchEntity setDisplayString:](v8, "setDisplayString:", v22);

    }
    objc_msgSend(v14, "tokenString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setTokenString:](v8, "setTokenString:", v23);

    objc_msgSend(v14, "symbolImage");
    symbolName = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(symbolName, "symbolName");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v8->_symbolName;
    v8->_symbolName = (NSString *)v24;

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v7;
    objc_msgSend(v17, "person");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setSearchString:](v8, "setSearchString:", v19);

    objc_msgSend(v17, "person");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity setDisplayString:](v8, "setDisplayString:", v21);

    symbolName = v8->_symbolName;
    v13 = CFSTR("person.crop.circle");
    goto LABEL_9;
  }
LABEL_13:
  p_performCommand = (id *)&v8->_performCommand;
  objc_storeStrong((id *)&v8->_performCommand, a3);
  -[SFCommand backendData](v8->_performCommand, "backendData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0CB3710];
    v29 = objc_opt_class();
    objc_msgSend(*p_performCommand, "backendData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    objc_msgSend(v28, "unarchivedObjectOfClass:fromData:error:", v29, v30, &v42);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v42;
    searchModel = v8->_searchModel;
    v8->_searchModel = (CSSuggestion *)v31;

  }
  else
  {
    v34 = (void *)MEMORY[0x1E0CA6B70];
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchEntity displayString](v8, "displayString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v35, v36, MEMORY[0x1E0C9AA60]);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v8->_searchModel;
    v8->_searchModel = (CSSuggestion *)v37;

    v39 = v8->_searchModel;
    v41 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v39, 1, &v41);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v41;
    objc_msgSend(*p_performCommand, "setBackendData:", v30);
  }

  if (v32 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SPSearchCommandEntity initWithSpotlightSuggestion:symbolName:fromSuggestion:].cold.1();
  -[SPSearchEntity setIsSuggestion:](v8, "setIsSuggestion:", v4);

LABEL_20:
  return v8;
}

- (void)updateSearchString:(id)a3
{
  void *v4;
  void *v5;
  SFCommand *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  CSSuggestion *searchModel;
  id v16;

  v16 = a3;
  -[SPSearchEntity setSearchString:](self, "setSearchString:");
  -[SPSearchCommandEntity currentSearchString](self, "currentSearchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPSearchEntity displayString](self, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_searchModel)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = self->_performCommand;
      -[SFCommand searchString](v6, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        -[SFCommand tokenString](v6, "tokenString");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      v5 = v10;
    }
  }
  v11 = objc_msgSend(v4, "length");
  if (v11 < objc_msgSend(v5, "length")
    || (objc_msgSend(v4, "lowercaseString"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "lowercaseString"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v12, "containsString:", v13),
        v13,
        v12,
        (v14 & 1) == 0))
  {
    -[SPSearchEntity setDisplayString:](self, "setDisplayString:", v16);
    searchModel = self->_searchModel;
    self->_searchModel = 0;

  }
}

- (BOOL)isScopedSearch
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)isServerEntitySearch
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[SFCommand entityType](self->_performCommand, "entityType") == 3;
}

- (BOOL)isPhotosEntitySearch
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[SFCommand entityType](self->_performCommand, "entityType") == 1;
}

- (id)currentSearchString
{
  void *v3;
  SFCommand *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  -[SPSearchEntity searchString](self, "searchString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = self->_performCommand;
    if (-[SFCommand entityType](v4, "entityType") == 2)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[SPSearchEntity tokenText](self, "tokenText");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v3);
      v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    else
    {
      if (-[SFCommand entityType](v4, "entityType") != 1 || v3 && objc_msgSend(v3, "length"))
        goto LABEL_9;
      v7 = CFSTR(".");
    }

    v3 = (void *)v7;
LABEL_9:

  }
  return v3;
}

- (id)queryString
{
  __CFString *v3;
  SFCommand *v4;
  void *v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;

  -[SPSearchEntity searchString](self, "searchString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  v4 = self->_performCommand;
  -[SFCommand searchString](v4, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SPSearchCommandEntity isServerEntitySearch](self, "isServerEntitySearch"))
  {
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      -[SFCommand tokenString](v4, "tokenString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (-[SPSearchCommandEntity isPhotosEntitySearch](self, "isPhotosEntitySearch"))
  {
    -[SPSearchEntity displayString](self, "displayString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v13 = (uint64_t)v6;
    goto LABEL_13;
  }
  if (!v5)
    goto LABEL_14;
  v7 = -[__CFString length](v3, "length");
  if (v7 < objc_msgSend(v5, "length"))
    goto LABEL_14;
  -[__CFString lowercaseString](v3, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsString:", v9);

  if (!v10)
    goto LABEL_14;
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", v5, &stru_1E6E549F0);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v11, "stringByTrimmingCharactersInSet:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v3 = v11;
LABEL_13:

  v3 = (__CFString *)v13;
LABEL_14:

LABEL_15:
  if (v3)
    v14 = v3;
  else
    v14 = &stru_1E6E549F0;
  v15 = v14;

  return v15;
}

- (id)spotlightQueryString
{
  void *v3;
  CSSuggestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SFCommand *v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  SFCommand *performCommand;
  void *v23;
  void *v24;
  void *v25;
  SFCommand *v26;
  SFCommand *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SFCommand *v34;

  if (!-[SPSearchCommandEntity isPhotosEntitySearch](self, "isPhotosEntitySearch"))
  {
    v4 = self->_searchModel;
    if (!v4)
    {
      -[SPSearchCommandEntity currentSearchString](self, "currentSearchString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        -[SPSearchCommandEntity currentSearchString](self, "currentSearchString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@*"), v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[SPSearchEntity searchString](self, "searchString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[SFCommand entityType](self->_performCommand, "entityType") - 1;
        if (v9 > 3)
          v10 = 1;
        else
          v10 = qword_1B87E12C8[v9];
        objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = v8;
        v14 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v4 = 0;
          goto LABEL_18;
        }
        objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = v8;
        v14 = 1;
      }
      spotlightSuggestionWithCurrentSuggestion(v11, v13, v14);
      v4 = (CSSuggestion *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        goto LABEL_18;
    }
    -[CSSuggestion suggestionTokens](v4, "suggestionTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queryString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
LABEL_38:

      return v3;
    }
LABEL_18:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = self->_performCommand;
      if (-[SFCommand entityType](v17, "entityType") == 3)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        -[SPSearchEntity searchString](self, "searchString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        SSEscapedStringForSearchQuery(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("(**=\"%@\"cwd)"), v20);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_37:
        goto LABEL_38;
      }
      -[SFCommand entityIdentifier](v17, "entityIdentifier");
      v26 = (SFCommand *)objc_claimAutoreleasedReturnValue();
LABEL_36:
      v3 = v26;
      goto LABEL_37;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    performCommand = self->_performCommand;
    if ((isKindOfClass & 1) != 0)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      -[SFCommand person](performCommand, "person");
      v17 = (SFCommand *)objc_claimAutoreleasedReturnValue();
      -[SFCommand displayName](v17, "displayName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      SSEscapedStringForSearchQuery(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("(**=\"%@\"cwd)"), v25);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
      goto LABEL_37;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = self->_performCommand;
      v28 = (void *)MEMORY[0x1E0CB3940];
      -[SFCommand searchString](v27, "searchString");
      v17 = (SFCommand *)objc_claimAutoreleasedReturnValue();
      SSEscapedStringForSearchQuery(v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("(**=\"%@\"cwd)"), v24);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    -[SPSearchEntity tokenText](self, "tokenText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      -[SPSearchEntity tokenText](self, "tokenText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SPSearchEntity searchString](self, "searchString");
      v17 = (SFCommand *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_32:
        if (-[SFCommand length](v17, "length"))
          v34 = v17;
        else
          v34 = 0;
        v26 = v34;
        goto LABEL_36;
      }
      v30 = (void *)MEMORY[0x1E0CB3940];
      -[SPSearchEntity searchString](self, "searchString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;
    SSEscapedStringForSearchQuery(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("(**=\"%@\"cwd)"), v33);
    v17 = (SFCommand *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  v3 = 0;
  return v3;
}

- (id)spotlightFilterQueries
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[SPSearchCommandEntity isPhotosEntitySearch](self, "isPhotosEntitySearch"))
  {
    if (spotlightFilterQueries_onceToken != -1)
      dispatch_once(&spotlightFilterQueries_onceToken, &__block_literal_global_357);
    v13[0] = spotlightFilterQueries_sPhotosFilterQuery;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if (-[SPSearchCommandEntity isServerEntitySearch](self, "isServerEntitySearch"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[SPSearchCommandEntity queryString](self, "queryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchCommandEntity queryString](self, "queryString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchCommandEntity queryString](self, "queryString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchCommandEntity queryString](self, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchCommandEntity queryString](self, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("(kMDItemTitle=\"%@\"cwd || kMDItemSubject=\"%@\"cwd || kMDItemDescription=\"%@\"cwd || kMDItemSnippet=\"%@\"cwd || (_kMDItemBundleID=\"%@\" && kMDItemTextContent=\"%@\"cwd))"), v5, v6, v7, v8, CFSTR("com.apple.MobileSMS"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
  else
  {
    return 0;
  }
}

void __47__SPSearchCommandEntity_spotlightFilterQueries__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  SSBundlesDonatingPhotos();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v5));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  if (objc_msgSend(v0, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v0, "componentsJoinedByString:", CFSTR("||"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("((kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\") && (%@))"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)spotlightFilterQueries_sPhotosFilterQuery;
    spotlightFilterQueries_sPhotosFilterQuery = v9;

  }
  else
  {
    v8 = (void *)spotlightFilterQueries_sPhotosFilterQuery;
    spotlightFilterQueries_sPhotosFilterQuery = (uint64_t)CFSTR("(kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\")");
  }

}

- (id)symbolName
{
  return self->_symbolName;
}

- (id)command
{
  return self->_performCommand;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_storeStrong((id *)&self->_performCommand, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (void)initWithSpotlightSuggestion:symbolName:fromSuggestion:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1B86C5000, MEMORY[0x1E0C81028], v0, "Error archiving backend search model: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_8();
}

@end
