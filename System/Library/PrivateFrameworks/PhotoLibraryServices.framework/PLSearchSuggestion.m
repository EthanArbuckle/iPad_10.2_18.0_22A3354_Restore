@implementation PLSearchSuggestion

- (PLSearchSuggestion)initWithContentString:(id)a3 categoriesType:(unint64_t)a4 suggestionType:(unint64_t)a5 matchedAssetsCount:(unint64_t)a6 matchedCollectionsCount:(unint64_t)a7 matchedText:(id)a8 matchRangeOfSearchText:(_NSRange)a9 suggestionComponents:(id)a10
{
  id v17;
  id v18;
  id v19;
  PLSearchSuggestion *v20;
  uint64_t v21;
  NSString *contentString;
  uint64_t v23;
  NSString *matchedText;
  uint64_t v25;
  NSArray *suggestionComponents;
  void *v28;
  void *v29;
  objc_super v30;

  v17 = a3;
  v18 = a8;
  v19 = a10;
  if (!objc_msgSend(v17, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestion.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentString.length > 0"));

  }
  if (!objc_msgSend(v19, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchSuggestion.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionComponents.count > 0"));

  }
  v30.receiver = self;
  v30.super_class = (Class)PLSearchSuggestion;
  v20 = -[PLSearchSuggestion init](&v30, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    contentString = v20->_contentString;
    v20->_contentString = (NSString *)v21;

    v20->_categoriesType = a4;
    v20->_suggestionType = a5;
    v20->_matchedAssetsCount = a6;
    v20->_matchedCollectionsCount = a7;
    v23 = objc_msgSend(v18, "copy");
    matchedText = v20->_matchedText;
    v20->_matchedText = (NSString *)v23;

    v20->_matchRangeOfSearchText = a9;
    v25 = objc_msgSend(v19, "copy");
    suggestionComponents = v20->_suggestionComponents;
    v20->_suggestionComponents = (NSArray *)v25;

  }
  return v20;
}

- (float)score
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t i;
  float v9;
  void *v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PLSearchSuggestion suggestionComponents](self, "suggestionComponents", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "score");
        v7 = v7 + v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  -[PLSearchSuggestion suggestionComponents](self, "suggestionComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  return v7 / (float)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  char v26;
  char v27;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PLSearchSuggestion contentString](self, "contentString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v6, "isEqualToString:", v7);

    v35 = -[PLSearchSuggestion categoriesType](self, "categoriesType");
    v34 = objc_msgSend(v5, "categoriesType");
    v33 = -[PLSearchSuggestion suggestionType](self, "suggestionType");
    v32 = objc_msgSend(v5, "suggestionType");
    v31 = -[PLSearchSuggestion matchedAssetsCount](self, "matchedAssetsCount");
    v30 = objc_msgSend(v5, "matchedAssetsCount");
    v29 = -[PLSearchSuggestion matchedCollectionsCount](self, "matchedCollectionsCount");
    v8 = objc_msgSend(v5, "matchedCollectionsCount");
    -[PLSearchSuggestion matchedText](self, "matchedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    v12 = -[PLSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");
    v14 = v13;
    v15 = objc_msgSend(v5, "matchRangeOfSearchText");
    v17 = v16;
    -[PLSearchSuggestion score](self, "score");
    v19 = v18;
    objc_msgSend(v5, "score");
    v21 = v20;
    -[PLSearchSuggestion suggestionComponents](self, "suggestionComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v22, "isEqualToArray:", v23);
    v25 = v36;
    if (v35 != v34)
      v25 = 0;
    if (v33 != v32)
      v25 = 0;
    if (v31 != v30)
      v25 = 0;
    if (v29 != v8)
      v25 = 0;
    v26 = v25 & v11;
    if (v12 != v15)
      v26 = 0;
    if (v14 != v17)
      v26 = 0;
    if (v19 != v21)
      v26 = 0;
    v27 = v26 & v24;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PLSearchSuggestion contentString](self, "contentString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[PLSearchSuggestion categoriesType](self, "categoriesType");
  v6 = v5 ^ -[PLSearchSuggestion suggestionType](self, "suggestionType") ^ v4;
  v7 = -[PLSearchSuggestion matchedAssetsCount](self, "matchedAssetsCount");
  v8 = v7 ^ -[PLSearchSuggestion matchedCollectionsCount](self, "matchedCollectionsCount");
  -[PLSearchSuggestion matchedText](self, "matchedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[PLSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");
  v12 = v10 ^ v11 ^ -[PLSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLSearchSuggestion suggestionComponents](self, "suggestionComponents", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v12 ^= objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "hash");
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  void *v18;
  NSRange v20;

  v3 = -[PLSearchSuggestion categoriesType](self, "categoriesType");
  if (v3 - 1 > 0x28)
    v4 = CFSTR("PLSearchSuggestionCategoriesTypeUndefined");
  else
    v4 = off_1E366DCC0[v3 - 1];
  v5 = v4;
  v6 = -[PLSearchSuggestion suggestionType](self, "suggestionType");
  if (v6 - 1 > 3)
    v7 = CFSTR("PLSearchSuggestionTypeNone");
  else
    v7 = off_1E3669388[v6 - 1];
  v8 = v7;
  v20.location = -[PLSearchSuggestion matchRangeOfSearchText](self, "matchRangeOfSearchText");
  NSStringFromRange(v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchSuggestion contentString](self, "contentString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLSearchSuggestion matchedAssetsCount](self, "matchedAssetsCount");
  v13 = -[PLSearchSuggestion matchedCollectionsCount](self, "matchedCollectionsCount");
  -[PLSearchSuggestion matchedText](self, "matchedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchSuggestion score](self, "score");
  v16 = v15;
  -[PLSearchSuggestion suggestionComponents](self, "suggestionComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("content string: %@, categories type: %@, suggestion type: %@, matched assets count: %tu, matched collections count: %tu, match text: %@, match range of search text: %@, score: %f, suggestion components: %@"), v11, v5, v8, v12, v13, v14, v9, *(_QWORD *)&v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)contentString
{
  return self->_contentString;
}

- (unint64_t)categoriesType
{
  return self->_categoriesType;
}

- (unint64_t)suggestionType
{
  return self->_suggestionType;
}

- (unint64_t)matchedAssetsCount
{
  return self->_matchedAssetsCount;
}

- (unint64_t)matchedCollectionsCount
{
  return self->_matchedCollectionsCount;
}

- (NSString)matchedText
{
  return self->_matchedText;
}

- (_NSRange)matchRangeOfSearchText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_matchRangeOfSearchText.length;
  location = self->_matchRangeOfSearchText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)suggestionComponents
{
  return self->_suggestionComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionComponents, 0);
  objc_storeStrong((id *)&self->_matchedText, 0);
  objc_storeStrong((id *)&self->_contentString, 0);
}

@end
