@implementation PSIQueryToken

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 identifier:(id)a5 userCategory:(unint64_t)a6 searchedCategories:(id)a7 matchType:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  PSIQueryToken *v18;
  uint64_t v19;
  NSString *text;
  uint64_t v21;
  NSString *normalizedText;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSIndexSet *searchedCategories;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PSIQueryToken;
  v18 = -[PSIQueryToken init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    text = v18->_text;
    v18->_text = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    normalizedText = v18->_normalizedText;
    v18->_normalizedText = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v23;

    if (objc_msgSend(v17, "count"))
    {
      v25 = objc_msgSend(v17, "copy");
      searchedCategories = v18->_searchedCategories;
      v18->_searchedCategories = (NSIndexSet *)v25;
    }
    else
    {
      searchedCategories = v18->_searchedCategories;
      v18->_searchedCategories = 0;
    }

    v18->_userCategory = a6;
    v18->_matchType = a8;
    v18->_userControlledCategoriesUseWildcard = 1;
  }

  return v18;
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 matchType:(unint64_t)a5
{
  id v8;
  void *v9;
  PSIQueryToken *v10;

  v8 = a3;
  PLSearchedCategoriesForUserCategory(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", v8, 0, 0, a4, v9, a5);

  return v10;
}

- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4
{
  id v6;
  void *v7;
  PSIQueryToken *v8;

  v6 = a3;
  PLSearchedCategoriesForUserCategory(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PSIQueryToken initWithIdentifier:userCategory:searchedCategories:](self, "initWithIdentifier:userCategory:searchedCategories:", v6, a4, v7);

  return v8;
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5 matchType:(unint64_t)a6
{
  return -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", a3, 0, 0, a4, a5, a6);
}

- (PSIQueryToken)initWithIdentifier:(id)a3 userCategory:(unint64_t)a4 searchedCategories:(id)a5
{
  PSIQueryToken *v5;
  PSIQueryToken *v6;

  v5 = -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", 0, 0, a3, a4, a5, 2);
  v6 = v5;
  if (v5)
    -[PSIQueryToken setUserControlledCategoriesUseWildcard:](v5, "setUserControlledCategoriesUseWildcard:", 0);
  return v6;
}

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 matchType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  PSIQueryToken *v13;

  v10 = a4;
  v11 = a3;
  PLSearchedCategoriesForUserCategory(a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", v11, v10, 0, a5, v12, a6);

  return v13;
}

- (PSIQueryToken)initWithText:(id)a3 normalizedText:(id)a4 userCategory:(unint64_t)a5 searchedCategories:(id)a6 matchType:(unint64_t)a7
{
  return -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", a3, a4, 0, a5, a6, a7);
}

- (PSIQueryToken)initWithText:(id)a3 userCategory:(unint64_t)a4 searchCategories:(id)a5 matchType:(unint64_t)a6 assetCount:(unint64_t)a7 collectionCount:(unint64_t)a8
{
  PSIQueryToken *result;

  result = -[PSIQueryToken initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:](self, "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", a3, 0, 0, a4, a5, a6);
  if (result)
  {
    result->_scopedSearchEnabled = 1;
    result->_assetCountV2 = a7;
    result->_collectionCountV2 = a8;
  }
  return result;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_text, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  return v4 ^ -[NSIndexSet hash](self->_searchedCategories, "hash") ^ self->_userCategory;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *text;
  void *v6;
  char v7;
  NSString *identifier;
  NSIndexSet *searchedCategories;
  NSIndexSet *v10;
  NSIndexSet *v11;
  void *v12;
  char v13;

  v4 = a3;
  text = self->_text;
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(text, "isEqualToString:", v6);
  if ((v7 & 1) == 0)
  {
    identifier = self->_identifier;
    objc_msgSend(v4, "identifier");
    text = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSString isEqualToString:](identifier, "isEqualToString:", text))
    {
      v13 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  searchedCategories = self->_searchedCategories;
  objc_msgSend(v4, "searchedCategories");
  v10 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
  if (searchedCategories == v10)
  {
    v13 = 1;
  }
  else
  {
    v11 = self->_searchedCategories;
    objc_msgSend(v4, "searchedCategories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSIndexSet isEqualToIndexSet:](v11, "isEqualToIndexSet:", v12);

  }
  if ((v7 & 1) == 0)
    goto LABEL_9;
LABEL_10:

  return v13;
}

- (void)normalizeTextWithTokenizer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PSIQueryToken text](self, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizeString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSIQueryToken setNormalizedText:](self, "setNormalizedText:", v5);
}

- (NSString)resolvedText
{
  unint64_t matchType;

  matchType = self->_matchType;
  if (matchType
    && self->_userControlledCategoriesUseWildcard
    && PLUserControlledCategoriesIntersectsSearchedCategories(self->_searchedCategories))
  {
    matchType = 0;
  }
  return (NSString *)+[PSITokenizer fts5StringFromString:forMatchType:](PSITokenizer, "fts5StringFromString:forMatchType:", self->_normalizedText, matchType);
}

- (unint64_t)assetCount
{
  if (-[PSIQueryToken scopedSearchEnabled](self, "scopedSearchEnabled"))
    return -[PSIQueryToken assetCountV2](self, "assetCountV2");
  else
    return -[NSMutableSet count](self->_assetIds, "count");
}

- (unint64_t)collectionCount
{
  if (-[PSIQueryToken scopedSearchEnabled](self, "scopedSearchEnabled"))
    return -[PSIQueryToken collectionCountV2](self, "collectionCountV2");
  else
    return -[NSMutableSet count](self->_collectionIds, "count");
}

- (unint64_t)resultCount
{
  unint64_t v3;
  unint64_t result;

  v3 = -[PSIQueryToken assetCount](self, "assetCount");
  result = -[PSIQueryToken collectionCount](self, "collectionCount");
  if (v3)
    return v3;
  return result;
}

- (BOOL)isTextSearchable
{
  void *v2;
  BOOL v3;

  -[PSIQueryToken text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)groupMatchingText
{
  void *text;
  void *v4;
  NSString *v5;

  -[PSIWordEmbeddingMatch word](self->_wordEmbeddingMatch, "word");
  text = (void *)objc_claimAutoreleasedReturnValue();
  v4 = text;
  if (!text)
    text = self->_text;
  v5 = text;

  return v5;
}

- (NSString)wildcardResolvedText
{
  unint64_t matchType;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (self->_userControlledCategoriesUseWildcard)
    goto LABEL_2;
  matchType = self->_matchType;
  if (matchType - 1 < 2)
  {
    -[PSIQueryToken resolvedText](self, "resolvedText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("*"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v5;
  }
  else
  {
    if (matchType == 3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_error_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Should not be calling wildcardResolvedText on matchType DateFilter", v6, 2u);
      }
    }
    else if (!matchType)
    {
LABEL_2:
      -[PSIQueryToken resolvedText](self, "resolvedText");
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }
    return (NSString *)0;
  }
}

- (BOOL)containsMarker
{
  void *v2;
  char v3;

  -[PSIQueryToken identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR(","));

  return v3;
}

- (id)tokenByWordEmbeddingWithMatch:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithText:normalizedText:identifier:userCategory:searchedCategories:matchType:", self->_text, self->_normalizedText, self->_identifier, self->_userCategory, self->_searchedCategories, 2);
  objc_msgSend(v5, "setUsesWordEmbeddings:", self->_usesWordEmbeddings);
  objc_msgSend(v5, "setWordEmbeddingMatch:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@.%p\n"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" text:%@\n"), self->_text);
  objc_msgSend(v6, "appendFormat:", CFSTR(" normalizedText:%@\n"), self->_normalizedText);
  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier:%@\n"), self->_identifier);
  if (-[PSIQueryToken isFilterTypeToken](self, "isFilterTypeToken"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isFilterTypeToken:%@"), v7);
  objc_msgSend(v6, "appendFormat:", CFSTR(" userCategory:%lu\n"), self->_userCategory);
  objc_msgSend(v6, "appendFormat:", CFSTR(" searchedCategories: %@\n"), self->_searchedCategories);
  objc_msgSend((id)objc_opt_class(), "stringForMatchType:", self->_matchType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" matchType:%@\n"), v8);

  if (-[PSIQueryToken userControlledCategoriesUseWildcard](self, "userControlledCategoriesUseWildcard"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" userControlledCategoriesUseWildcard:%@\n"), v9);
  if (self->_usesWordEmbeddings)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" useWordEmbeddings:%@\n"), v10);
  if (-[PSIQueryToken isTextSearchable](self, "isTextSearchable"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR(" isTextSearchable:%@\n"), v11);
  -[PSIQueryToken groupMatchingText](self, "groupMatchingText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" groupMatchingText:%@\n"), v12);

  objc_msgSend(v6, "appendFormat:", CFSTR(" assetIdsCount:%lu\n"), -[NSMutableSet count](self->_assetIds, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(" collectionIdCount:%lu\n"), -[NSMutableSet count](self->_collectionIds, "count"));
  objc_msgSend(v6, "appendFormat:", CFSTR(">\n"));
  return v6;
}

- (NSDictionary)debugDictionary
{
  objc_class *v3;
  uint64_t v4;
  const __CFString *text;
  const __CFString *identifier;
  const __CFString *normalizedText;
  void *v8;
  NSIndexSet *v9;
  void *v10;
  id v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[13];
  _QWORD v33[15];

  v33[13] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("class");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  text = (const __CFString *)self->_text;
  identifier = (const __CFString *)self->_identifier;
  if (!text)
    text = CFSTR("nil");
  v33[0] = v4;
  v33[1] = text;
  v32[1] = CFSTR("text");
  v32[2] = CFSTR("normalizedText");
  normalizedText = (const __CFString *)self->_normalizedText;
  if (!normalizedText)
    normalizedText = CFSTR("nil");
  if (!identifier)
    identifier = CFSTR("nil");
  v33[2] = normalizedText;
  v33[3] = identifier;
  v32[3] = CFSTR("identifier");
  v32[4] = CFSTR("userCategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_userCategory, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v8;
  v32[5] = CFSTR("searchedCategories");
  v9 = self->_searchedCategories;
  v10 = (void *)objc_opt_new();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __32__PSIQueryToken_debugDictionary__block_invoke_3;
  v30[3] = &unk_1E3675308;
  v31 = v10;
  v11 = v10;
  -[NSIndexSet enumerateIndexesUsingBlock:](v9, "enumerateIndexesUsingBlock:", v30);

  v12 = (__CFString *)objc_msgSend(v11, "copy");
  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("nil");
  v33[5] = v13;
  v32[6] = CFSTR("matchType");
  objc_msgSend((id)objc_opt_class(), "stringForMatchType:", self->_matchType);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (self->_userControlledCategoriesUseWildcard)
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  v33[6] = v14;
  v33[7] = v16;
  v32[7] = CFSTR("userControlledCategoriesUseWildcard");
  v32[8] = CFSTR("useWordEmbeddings");
  if (self->_usesWordEmbeddings)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v33[8] = v17;
  v32[9] = CFSTR("isTextSearchable");
  v18 = v17;
  v19 = v16;
  if (-[PSIQueryToken isTextSearchable](self, "isTextSearchable"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  v33[9] = v20;
  v32[10] = CFSTR("groupMatchingText");
  v21 = v20;
  -[PSIQueryToken groupMatchingText](self, "groupMatchingText");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("nil");
  v33[10] = v24;
  v32[11] = CFSTR("assetIdsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableSet count](self->_assetIds, "count"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v25;
  v32[12] = CFSTR("collectionIdCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableSet count](self->_collectionIds, "count"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v27;
}

- (NSString)suggestionText
{
  void *v3;
  void *v4;
  void *v6;

  if (-[PSIQueryToken userCategory](self, "userCategory") == 1
    || -[PSIQueryToken userCategory](self, "userCategory") == 6)
  {
    PLServicesLocalizedFrameworkString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSIQueryToken text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PFStringWithValidatedFormat();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PSIQueryToken text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (PSIQueryToken)initWithCoder:(id)a3
{
  id v4;
  PSIQueryToken *v5;
  void *v6;
  uint64_t v7;
  NSString *text;
  void *v9;
  uint64_t v10;
  NSString *normalizedText;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  void *v15;
  uint64_t v16;
  NSIndexSet *searchedCategories;
  uint64_t v18;
  PSIWordEmbeddingMatch *wordEmbeddingMatch;
  void *v20;
  NSUInteger v21;
  uint64_t v22;
  PSIQueryToken *parentToken;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PSIQueryToken;
  v5 = -[PSIQueryToken init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("normalizedText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    normalizedText = v5->_normalizedText;
    v5->_normalizedText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchedCategories"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    searchedCategories = v5->_searchedCategories;
    v5->_searchedCategories = (NSIndexSet *)v16;

    v5->_matchType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("matchType"));
    v5->_userControlledCategoriesUseWildcard = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userControlledCategoriesUseWildcard"));
    v5->_usesWordEmbeddings = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesWordEmbeddings"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wordEmbeddingMatch"));
    v18 = objc_claimAutoreleasedReturnValue();
    wordEmbeddingMatch = v5->_wordEmbeddingMatch;
    v5->_wordEmbeddingMatch = (PSIWordEmbeddingMatch *)v18;

    v5->_isFullTextToken = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFullTextToken"));
    v5->_belongsToSearchText = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("belongsToSearchText"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rangeInSearchText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rangeInSearchText.location = objc_msgSend(v20, "rangeValue");
    v5->_rangeInSearchText.length = v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentToken"));
    v22 = objc_claimAutoreleasedReturnValue();
    parentToken = v5->_parentToken;
    v5->_parentToken = (PSIQueryToken *)v22;

    v5->_userCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userCategory"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  void *v5;
  id v6;

  text = self->_text;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_normalizedText, CFSTR("normalizedText"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_searchedCategories, CFSTR("searchedCategories"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_matchType, CFSTR("matchType"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_userControlledCategoriesUseWildcard, CFSTR("userControlledCategoriesUseWildcard"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_usesWordEmbeddings, CFSTR("usesWordEmbeddings"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_wordEmbeddingMatch, CFSTR("wordEmbeddingMatch"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isFullTextToken, CFSTR("isFullTextToken"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_belongsToSearchText, CFSTR("belongsToSearchText"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", self->_rangeInSearchText.location, self->_rangeInSearchText.length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("rangeInSearchText"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_parentToken, CFSTR("parentToken"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_userCategory, CFSTR("userCategory"));

}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSIndexSet)searchedCategories
{
  return self->_searchedCategories;
}

- (void)setSearchedCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)userCategory
{
  return self->_userCategory;
}

- (void)setUserCategory:(unint64_t)a3
{
  self->_userCategory = a3;
}

- (unint64_t)matchType
{
  return self->_matchType;
}

- (BOOL)userControlledCategoriesUseWildcard
{
  return self->_userControlledCategoriesUseWildcard;
}

- (void)setUserControlledCategoriesUseWildcard:(BOOL)a3
{
  self->_userControlledCategoriesUseWildcard = a3;
}

- (BOOL)usesWordEmbeddings
{
  return self->_usesWordEmbeddings;
}

- (void)setUsesWordEmbeddings:(BOOL)a3
{
  self->_usesWordEmbeddings = a3;
}

- (BOOL)isFilterTypeToken
{
  return self->_isFilterTypeToken;
}

- (void)setIsFilterTypeToken:(BOOL)a3
{
  self->_isFilterTypeToken = a3;
}

- (_NSRange)rangeInSearchText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeInSearchText.length;
  location = self->_rangeInSearchText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeInSearchText:(_NSRange)a3
{
  self->_rangeInSearchText = a3;
}

- (PSIQueryToken)parentToken
{
  return self->_parentToken;
}

- (void)setParentToken:(id)a3
{
  objc_storeStrong((id *)&self->_parentToken, a3);
}

- (BOOL)scopedSearchEnabled
{
  return self->_scopedSearchEnabled;
}

- (void)setScopedSearchEnabled:(BOOL)a3
{
  self->_scopedSearchEnabled = a3;
}

- (unint64_t)assetCountV2
{
  return self->_assetCountV2;
}

- (void)setAssetCountV2:(unint64_t)a3
{
  self->_assetCountV2 = a3;
}

- (unint64_t)collectionCountV2
{
  return self->_collectionCountV2;
}

- (void)setCollectionCountV2:(unint64_t)a3
{
  self->_collectionCountV2 = a3;
}

- (NSString)normalizedText
{
  return self->_normalizedText;
}

- (void)setNormalizedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PSIWordEmbeddingMatch)wordEmbeddingMatch
{
  return self->_wordEmbeddingMatch;
}

- (void)setWordEmbeddingMatch:(id)a3
{
  objc_storeStrong((id *)&self->_wordEmbeddingMatch, a3);
}

- (BOOL)isFullTextToken
{
  return self->_isFullTextToken;
}

- (void)setIsFullTextToken:(BOOL)a3
{
  self->_isFullTextToken = a3;
}

- (BOOL)belongsToSearchText
{
  return self->_belongsToSearchText;
}

- (void)setBelongsToSearchText:(BOOL)a3
{
  self->_belongsToSearchText = a3;
}

- (NSMutableSet)assetIds
{
  return self->_assetIds;
}

- (void)setAssetIds:(id)a3
{
  objc_storeStrong((id *)&self->_assetIds, a3);
}

- (NSMutableSet)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
  objc_storeStrong((id *)&self->_collectionIds, a3);
}

- (NSDictionary)dateAttributes
{
  return self->_dateAttributes;
}

- (void)setDateAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_dateAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateAttributes, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_storeStrong((id *)&self->_assetIds, 0);
  objc_storeStrong((id *)&self->_wordEmbeddingMatch, 0);
  objc_storeStrong((id *)&self->_normalizedText, 0);
  objc_storeStrong((id *)&self->_parentToken, 0);
  objc_storeStrong((id *)&self->_searchedCategories, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

void __32__PSIQueryToken_debugDictionary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)personQueryTokensFromSocialGroupQueryToken:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PSIQueryToken *v12;
  PSIQueryToken *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [PSIQueryToken alloc];
        v13 = -[PSIQueryToken initWithIdentifier:userCategory:](v12, "initWithIdentifier:userCategory:", v11, 1, (_QWORD)v15);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)stringForMatchType:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return *(&off_1E3670950 + a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
