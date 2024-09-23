@implementation _UISearchSuggestionControllerIOSBase

- (void)searchTextFieldDidGainSearchBar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UISearchSuggestionControllerIOSBase searchTextField](self, "searchTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    objc_msgSend(v7, "_searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_searchBar, v6);

    v5 = v7;
  }

}

- (_UISearchSuggestionControllerIOSBase)initWithSearchTextField:(id)a3
{
  id v4;
  _UISearchSuggestionControllerIOSBase *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionControllerIOSBase;
  v5 = -[_UISearchSuggestionControllerIOSBase init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_searchBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_searchBar, v6);

    objc_storeWeak((id *)&v5->_searchTextField, v4);
  }

  return v5;
}

- (UISearchTextField)searchTextField
{
  return (UISearchTextField *)objc_loadWeakRetained((id *)&self->_searchTextField);
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;

  v6 = a4;
  if ((a3->var0 & 0xE) != 0
    && !self->_hasSetUpGeometryChangeResponse
    && -[_UISearchSuggestionControllerIOSBase hasVisibleMenu](self, "hasVisibleMenu"))
  {
    -[_UISearchSuggestionControllerIOSBase searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_searchController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "_navigationItemCurrentlyDisplayingSearchController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_navigationBar");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_9:

        -[_UISearchSuggestionControllerIOSBase setHasSetUpGeometryChangeResponse:](self, "setHasSetUpGeometryChangeResponse:", 1);
        goto LABEL_10;
      }
      objc_msgSend(v8, "_updateHasPendingSuggestionMenuRefreshFlagForReason:", 4);
      objc_msgSend(v10, "_deferSearchSuggestionsMenuRefreshForGeometryChange");
      -[_UISearchSuggestionControllerIOSBase _dismissMenuWithoutAnimation](self, "_dismissMenuWithoutAnimation");
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_2;
      v17[3] = &unk_1E16B7008;
      v11 = &v19;
      objc_copyWeak(&v19, &location);
      v10 = v10;
      v18 = v10;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &__block_literal_global_567, v17, 0.0);
      v12 = v18;
    }
    else
    {
      -[_UISearchSuggestionController suggestionGroups](self, "suggestionGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UISearchSuggestionControllerIOSBase _dismissMenuWithoutAnimation](self, "_dismissMenuWithoutAnimation");
      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_4;
      v14[3] = &unk_1E16B7008;
      v11 = &v16;
      objc_copyWeak(&v16, &location);
      v10 = v13;
      v15 = v10;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &__block_literal_global_12_9, v14, 0.0);
      v12 = v15;
    }

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
    goto LABEL_9;
  }
LABEL_10:

}

- (id)suggestions
{
  void *v2;
  void *v3;

  -[_UISearchSuggestionController suggestionGroups](self, "suggestionGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _UISearchSuggestionAllSuggestionsFromGroups(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchTextField);
}

- (void)menuDidCloseWithAnimator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_UISearchSuggestionControllerIOSBase searchBar](self, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "_suggestionsMenuInteractionWillEndWithAnimator:", v7);
  }
  else
  {
    -[_UISearchSuggestionControllerIOSBase searchTextField](self, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_suggestionsMenuInteractionWillEndWithAnimator:", v7);

  }
}

- (void)setSuggestions:(id)a3
{
  id v4;
  _UISearchSuggestionItemGroup *v5;
  id v6;
  _UISearchSuggestionItemGroup *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [_UISearchSuggestionItemGroup alloc];
  if (v4)
    v6 = v4;
  else
    v6 = (id)MEMORY[0x1E0C9AA60];
  v7 = -[_UISearchSuggestionItemGroup initWithHeaderTitle:suggestionItems:](v5, "initWithHeaderTitle:suggestionItems:", 0, v6);

  v9[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchSuggestionController setSuggestionGroups:](self, "setSuggestionGroups:", v8);

}

- (void)updateSuggestions:(id)a3 userInitiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _UISearchSuggestionItemGroup *v7;
  id v8;
  _UISearchSuggestionItemGroup *v9;
  void *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [_UISearchSuggestionItemGroup alloc];
  if (v6)
    v8 = v6;
  else
    v8 = (id)MEMORY[0x1E0C9AA60];
  v9 = -[_UISearchSuggestionItemGroup initWithHeaderTitle:suggestionItems:](v7, "initWithHeaderTitle:suggestionItems:", 0, v8);

  v11[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UISearchSuggestionController updateSuggestionGroups:userInitiated:](self, "updateSuggestionGroups:userInitiated:", v10, v4);

}

- (BOOL)_hasVisibleMenu
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchSuggestionControllerIOSBase.m"), 94, CFSTR("Subclass failed to implement %s"), "-[_UISearchSuggestionControllerIOSBase _hasVisibleMenu]");

  return 0;
}

- (void)_dismissMenuWithoutAnimation
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchSuggestionControllerIOSBase.m"), 101, CFSTR("Subclass failed to implement %s"), "-[_UISearchSuggestionControllerIOSBase _dismissMenuWithoutAnimation]");

}

- (void)_updateMenuWithSuggestionGroups:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchSuggestionControllerIOSBase.m"), 107, CFSTR("Subclass failed to implement %s"), "-[_UISearchSuggestionControllerIOSBase _updateMenuWithSuggestionGroups:]");

}

- (UISearchBar)searchBar
{
  return (UISearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (BOOL)hasSetUpGeometryChangeResponse
{
  return self->_hasSetUpGeometryChangeResponse;
}

- (void)setHasSetUpGeometryChangeResponse:(BOOL)a3
{
  self->_hasSetUpGeometryChangeResponse = a3;
}

@end
