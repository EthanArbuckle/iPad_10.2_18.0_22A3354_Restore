@implementation PSISuggestionOptions

- (PSISuggestionOptions)initWithSuggestionType:(unint64_t)a3 suggestionLimit:(unint64_t)a4
{
  PSISuggestionOptions *result;
  void *v9;
  void *v10;
  objc_super v11;

  if (a4)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSISuggestionOptions.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionLimit != 0"));

    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PSISuggestionOptions.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("suggestionType != PLSearchSuggestionTypeNone"));

LABEL_3:
  v11.receiver = self;
  v11.super_class = (Class)PSISuggestionOptions;
  result = -[PSISuggestionOptions init](&v11, sel_init);
  if (result)
  {
    result->_searchSuggestionType = a3;
    result->_searchSuggestionLimit = a4;
    result->_locationInQueryStringForSuggestionGeneration = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PSISuggestionOptions *v4;

  v4 = -[PSISuggestionOptions initWithSuggestionType:suggestionLimit:]([PSISuggestionOptions alloc], "initWithSuggestionType:suggestionLimit:", self->_searchSuggestionType, self->_searchSuggestionLimit);
  -[PSISuggestionOptions setSuggestionResultTypes:](v4, "setSuggestionResultTypes:", self->_suggestionResultTypes);
  -[PSISuggestionOptions setLimitSuggestionsToExactTextMatches:](v4, "setLimitSuggestionsToExactTextMatches:", self->_limitSuggestionsToExactTextMatches);
  -[PSISuggestionOptions set_wantsUnscopedSuggestions:](v4, "set_wantsUnscopedSuggestions:", self->__wantsUnscopedSuggestions);
  -[PSISuggestionOptions setMinNumberOfResultsForNextTokenGeneration:](v4, "setMinNumberOfResultsForNextTokenGeneration:", self->_minNumberOfResultsForNextTokenGeneration);
  -[PSISuggestionOptions setEnableNextTokenSuggestions:](v4, "setEnableNextTokenSuggestions:", self->_enableNextTokenSuggestions);
  return v4;
}

- (BOOL)optionsWantSuggestionsForAssets
{
  return -[PSISuggestionOptions suggestionResultTypes](self, "suggestionResultTypes") & 1;
}

- (BOOL)optionsWantSuggestionsForCollections
{
  return (-[PSISuggestionOptions suggestionResultTypes](self, "suggestionResultTypes") >> 1) & 1;
}

- (id)description
{
  unsigned __int8 v3;
  char v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  __CFString *v11;
  unint64_t searchSuggestionLimit;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;

  v3 = -[PSISuggestionOptions suggestionResultTypes](self, "suggestionResultTypes");
  v4 = -[PSISuggestionOptions suggestionResultTypes](self, "suggestionResultTypes");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = self->_searchSuggestionType - 1;
  if (v6 > 3)
    v7 = CFSTR("PLSearchSuggestionTypeNone");
  else
    v7 = off_1E3669388[v6];
  v8 = CFSTR("collections");
  if ((v4 & 2) == 0)
    v8 = 0;
  if ((v3 & ((v4 & 2) >> 1)) != 0)
    v9 = CFSTR("assets & collections");
  else
    v9 = CFSTR("assets");
  if ((v3 & 1) != 0)
    v10 = v9;
  else
    v10 = v8;
  v11 = v7;
  searchSuggestionLimit = self->_searchSuggestionLimit;
  if (self->_limitSuggestionsToExactTextMatches)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->__wantsUnscopedSuggestions)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_enableNextTokenSuggestions)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  v16 = v14;
  v17 = v13;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Suggestion type: %@, \nsuggestion limit: %tu,\nsuggestion result types: %@,\nlimit suggestions to exact matches only: %@,\nwants unscoped suggestions:%@\n, enable next token suggestions: %@\n"), v11, searchSuggestionLimit, v10, v17, v16, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)searchSuggestionType
{
  return self->_searchSuggestionType;
}

- (unint64_t)searchSuggestionLimit
{
  return self->_searchSuggestionLimit;
}

- (BOOL)enableNextTokenSuggestions
{
  return self->_enableNextTokenSuggestions;
}

- (void)setEnableNextTokenSuggestions:(BOOL)a3
{
  self->_enableNextTokenSuggestions = a3;
}

- (unint64_t)suggestionResultTypes
{
  return self->_suggestionResultTypes;
}

- (void)setSuggestionResultTypes:(unint64_t)a3
{
  self->_suggestionResultTypes = a3;
}

- (BOOL)limitSuggestionsToExactTextMatches
{
  return self->_limitSuggestionsToExactTextMatches;
}

- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3
{
  self->_limitSuggestionsToExactTextMatches = a3;
}

- (unint64_t)locationInQueryStringForSuggestionGeneration
{
  return self->_locationInQueryStringForSuggestionGeneration;
}

- (void)setLocationInQueryStringForSuggestionGeneration:(unint64_t)a3
{
  self->_locationInQueryStringForSuggestionGeneration = a3;
}

- (unint64_t)minNumberOfResultsForNextTokenGeneration
{
  return self->_minNumberOfResultsForNextTokenGeneration;
}

- (void)setMinNumberOfResultsForNextTokenGeneration:(unint64_t)a3
{
  self->_minNumberOfResultsForNextTokenGeneration = a3;
}

- (BOOL)_wantsUnscopedSuggestions
{
  return self->__wantsUnscopedSuggestions;
}

- (void)set_wantsUnscopedSuggestions:(BOOL)a3
{
  self->__wantsUnscopedSuggestions = a3;
}

@end
