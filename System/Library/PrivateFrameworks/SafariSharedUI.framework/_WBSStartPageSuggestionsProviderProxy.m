@implementation _WBSStartPageSuggestionsProviderProxy

- (NSArray)suggestions
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "suggestionsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)fetchMetadataForSuggestion:(id)a3 completionHandler:(id)a4
{
  WBSStartPageSuggestionsProviderBroadcaster **p_owner;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  p_owner = &self->_owner;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(WeakRetained, "suggestionsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchMetadataForSuggestion:completionHandler:", v7, v6);

}

- (id)attributionViewForSuggestion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  if (objc_msgSend(WeakRetained, "providerSupportsAttributionViews"))
  {
    objc_msgSend(WeakRetained, "suggestionsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionViewForSuggestion:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  id WeakRetained;
  char v5;
  objc_super v6;

  if (sel_attributionViewForSuggestion_ == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    v5 = objc_msgSend(WeakRetained, "providerSupportsAttributionViews");

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_WBSStartPageSuggestionsProviderProxy;
    return -[_WBSStartPageSuggestionsProviderProxy respondsToSelector:](&v6, sel_respondsToSelector_);
  }
}

- (NSString)providerSectionIdentifier
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "suggestionsProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "providerSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  return (WBSStartPageSuggestionsProviderDelegate *)objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionsProviderDelegate, a3);
}

- (WBSStartPageSuggestionsProviderBroadcaster)owner
{
  return (WBSStartPageSuggestionsProviderBroadcaster *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_destroyWeak((id *)&self->_suggestionsProviderDelegate);
}

@end
