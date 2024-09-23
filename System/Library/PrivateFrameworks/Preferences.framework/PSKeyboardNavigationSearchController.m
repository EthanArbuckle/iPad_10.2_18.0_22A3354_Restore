@implementation PSKeyboardNavigationSearchController

- (PSKeyboardNavigationSearchController)initWithSearchResultsController:(id)a3
{
  id v4;
  PSKeyboardNavigationSearchBar *v5;
  PSKeyboardNavigationSearchBar *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSKeyboardNavigationSearchController *v12;
  PSKeyboardNavigationSearchController *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v5 = [PSKeyboardNavigationSearchBar alloc];
  v6 = -[PSKeyboardNavigationSearchBar initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[PSKeyboardNavigationSearchController setSearchBar:](self, "setSearchBar:", v6);

  +[PSListController appearance](PSListController, "appearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[PSListController appearance](PSListController, "appearance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buttonTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeyboardNavigationSearchController searchBar](self, "searchBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v10);

  }
  v18.receiver = self;
  v18.super_class = (Class)PSKeyboardNavigationSearchController;
  v12 = -[PSKeyboardNavigationSearchController initWithSearchResultsController:](&v18, sel_initWithSearchResultsController_, v4);
  v13 = v12;
  if (v12)
  {
    -[PSKeyboardNavigationSearchController setSearchResultsController:](v12, "setSearchResultsController:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__escapeKeyPressed, CFSTR("PSSearchBarEscapeKeyPressedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__downArrowKeyPressed, CFSTR("PSSearchBarDownArrowKeyPressedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__upArrowKeyPressed, CFSTR("PSSearchBarUpArrowKeyPressedNotification"), 0);

    -[PSKeyboardNavigationSearchController setObscuresBackgroundDuringPresentation:](v13, "setObscuresBackgroundDuringPresentation:", 1);
  }

  return v13;
}

- (PSKeyboardNavigationSearchBar)searchBar
{
  return self->searchBar;
}

- (void)setSearchResultsController:(id)a3
{
  objc_storeStrong((id *)&self->searchResultsController, a3);
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->searchBar, a3);
}

- (void)_escapeKeyPressed
{
  -[PSKeyboardNavigationSearchController setActive:](self, "setActive:", 0);
}

- (void)_downArrowKeyPressed
{
  id v2;

  -[PSKeyboardNavigationSearchController searchResultsController](self, "searchResultsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectNextSearchResult");

}

- (void)_upArrowKeyPressed
{
  id v2;

  -[PSKeyboardNavigationSearchController searchResultsController](self, "searchResultsController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectPreviousSearchResult");

}

- (PSKeyboardNavigationSearchResultsController)searchResultsController
{
  return self->searchResultsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->searchBar, 0);
  objc_storeStrong((id *)&self->searchResultsController, 0);
}

@end
