@implementation _PSSuggesterConfiguration

+ (_PSSuggesterConfiguration)defaultConfiguration
{
  _PSSuggesterConfiguration *v2;
  _PSEnsembleModel *v3;

  v2 = objc_alloc_init(_PSSuggesterConfiguration);
  -[_PSSuggesterConfiguration setMaximumNumberOfSuggestions:](v2, "setMaximumNumberOfSuggestions:", 8);
  -[_PSSuggesterConfiguration setExcludeBackfillSuggestions:](v2, "setExcludeBackfillSuggestions:", 0);
  v3 = objc_alloc_init(_PSEnsembleModel);
  -[_PSSuggesterConfiguration setSuggestionModel:](v2, "setSuggestionModel:", v3);

  return v2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_PSSuggesterConfiguration maximumNumberOfSuggestions](self, "maximumNumberOfSuggestions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggesterConfiguration suggestionModel](self, "suggestionModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> maximumNumberOfSuggestions: %@ suggestionModel: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)maximumNumberOfSuggestions
{
  return self->_maximumNumberOfSuggestions;
}

- (void)setMaximumNumberOfSuggestions:(int64_t)a3
{
  self->_maximumNumberOfSuggestions = a3;
}

- (_PSEnsembleModel)suggestionModel
{
  return self->_suggestionModel;
}

- (void)setSuggestionModel:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionModel, a3);
}

- (BOOL)excludeBackfillSuggestions
{
  return self->_excludeBackfillSuggestions;
}

- (void)setExcludeBackfillSuggestions:(BOOL)a3
{
  self->_excludeBackfillSuggestions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionModel, 0);
}

@end
