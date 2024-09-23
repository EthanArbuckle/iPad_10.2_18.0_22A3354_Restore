@implementation SuggestionsDataSource

- (SuggestionsDataSource)initWithSearchModel:(id)a3
{
  id v5;
  SuggestionsDataSource *v6;
  SuggestionsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SuggestionsDataSource;
  v6 = -[SuggestionsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchModel, a3);

  return v7;
}

- (void)clearSuggestions
{
  -[STSSearchModel removeQuerySuggestions](self->_searchModel, "removeQuerySuggestions");
}

- (void)updateQuerySuggestions:(id)a3
{
  id WeakRetained;

  -[STSSearchModel setQuerySuggestions:](self->_searchModel, "setQuerySuggestions:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelgate);
  objc_msgSend(WeakRetained, "searchModelUpdated");

}

- (id)headerTitleForRow:(int64_t)a3
{
  return &stru_24E7469D8;
}

- (BOOL)isGroupRow:(int64_t)a3
{
  return 0;
}

- (int64_t)numberOfRows
{
  void *v2;
  int64_t v3;

  -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)stringValueForRowAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  if (a3 < 0)
  {
    v6 = &stru_24E7469D8;
  }
  else
  {
    -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestion");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)didSelectItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[STSSearchModel querySuggestions](self->_searchModel, "querySuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SuggestionsDataSource selectionDelegate](self, "selectionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestionViewController:didSelectSuggestion:suggested:", self, v7, 0);

}

- (BOOL)rowHasClearButton:(int64_t)a3
{
  return 0;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->_isScrolling = a3;
}

- (STSSearchModelUpdateDelegate)updateDelgate
{
  return (STSSearchModelUpdateDelegate *)objc_loadWeakRetained((id *)&self->_updateDelgate);
}

- (void)setUpdateDelgate:(id)a3
{
  objc_storeWeak((id *)&self->_updateDelgate, a3);
}

- (STSSuggestionSelectionDelegate)selectionDelegate
{
  return (STSSuggestionSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (STSSearchModel)searchModel
{
  return self->_searchModel;
}

- (void)setSearchModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchModel, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_updateDelgate);
}

@end
