@implementation UIFindSession

- (BOOL)supportsReplacement
{
  return 0;
}

- (NSInteger)highlightedResultIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle
{
  return 0;
}

- (UITextSearchOptions)configuredSearchOptions
{
  UITextSearchOptions *configuredSearchOptions;
  UITextSearchOptions *v4;
  UITextSearchOptions *v5;

  configuredSearchOptions = self->_configuredSearchOptions;
  if (!configuredSearchOptions)
  {
    +[UITextSearchOptions defaultSearchOptions](UITextSearchOptions, "defaultSearchOptions");
    v4 = (UITextSearchOptions *)objc_claimAutoreleasedReturnValue();
    v5 = self->_configuredSearchOptions;
    self->_configuredSearchOptions = v4;

    configuredSearchOptions = self->_configuredSearchOptions;
  }
  return configuredSearchOptions;
}

- (UIView)searchableResponderAsView
{
  UIResponder **p_searchableResponder;
  id WeakRetained;
  int v4;
  id v5;

  p_searchableResponder = &self->_searchableResponder;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchableResponder);
  v4 = objc_msgSend(WeakRetained, "__isKindOfUIView");

  if (v4)
    v5 = objc_loadWeakRetained((id *)p_searchableResponder);
  else
    v5 = 0;
  return (UIView *)v5;
}

- (UIResponder)divergentResponder
{
  UIResponder **p_divergentResponderForSession;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  p_divergentResponderForSession = &self->_divergentResponderForSession;
  WeakRetained = objc_loadWeakRetained((id *)&self->_divergentResponderForSession);

  if (!WeakRetained)
  {
    -[UIFindSession searchableResponder](self, "searchableResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_deepestActionResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_divergentResponderForSession, v7);

  }
  return (UIResponder *)objc_loadWeakRetained((id *)p_divergentResponderForSession);
}

- (NSInteger)resultCount
{
  return self->_resultCount;
}

- (void)setSearchResultDisplayStyle:(UIFindSessionSearchResultDisplayStyle)searchResultDisplayStyle
{
  self->_searchResultDisplayStyle = searchResultDisplayStyle;
}

- (BOOL)allowsReplacement
{
  return self->_allowsReplacement;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setConfiguredSearchOptions:(id)a3
{
  objc_storeStrong((id *)&self->_configuredSearchOptions, a3);
}

- (UIFindInteraction)parentInteraction
{
  return (UIFindInteraction *)objc_loadWeakRetained((id *)&self->_parentInteraction);
}

- (void)setParentInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_parentInteraction, a3);
}

- (UIResponder)searchableResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_searchableResponder);
}

- (void)setSearchableResponder:(id)a3
{
  objc_storeWeak((id *)&self->_searchableResponder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchableResponder);
  objc_destroyWeak((id *)&self->_parentInteraction);
  objc_storeStrong((id *)&self->_configuredSearchOptions, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_destroyWeak((id *)&self->_divergentResponderForSession);
}

@end
