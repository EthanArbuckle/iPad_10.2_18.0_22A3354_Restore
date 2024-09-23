@implementation _UIFindNavigatorViewController

- (_UIFindNavigatorView)findNavigatorView
{
  -[UIViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_findNavigatorView;
}

- (void)setFindSession:(id)a3
{
  UIFindSession *v5;
  void *v6;
  uint64_t v7;
  UITextSearchOptions *lastSearchOptions;
  UITextSearchOptions *v9;
  UITextSearchOptions *v10;
  void *v11;
  UIFindSession *v12;

  v5 = (UIFindSession *)a3;
  v12 = v5;
  if (self->_findSession != v5)
  {
    objc_storeStrong((id *)&self->_findSession, a3);
    -[_UIFindNavigatorViewController updateViewForActiveFindSession](self, "updateViewForActiveFindSession");
    v5 = v12;
  }
  -[UIFindSession searchText](v5, "searchText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    lastSearchOptions = self->_lastSearchOptions;
    if (lastSearchOptions)
    {
      v9 = lastSearchOptions;
    }
    else
    {
      +[UITextSearchOptions defaultSearchOptions](UITextSearchOptions, "defaultSearchOptions");
      v9 = (UITextSearchOptions *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    -[UIFindSession searchText](v12, "searchText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFindNavigatorViewController _performSearchWithQuery:options:](self, "_performSearchWithQuery:options:", v11, v10);

  }
}

- (void)loadView
{
  _UIFindNavigatorView *v3;
  _UIFindNavigatorView *v4;
  _UIFindNavigatorView *findNavigatorView;

  v3 = [_UIFindNavigatorView alloc];
  v4 = -[_UIFindNavigatorView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  findNavigatorView = self->_findNavigatorView;
  self->_findNavigatorView = v4;

  -[_UIFindNavigatorView setFindNavigatorDelegate:](self->_findNavigatorView, "setFindNavigatorDelegate:", self);
  -[UIInputViewController setView:](self, "setView:", self->_findNavigatorView);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorViewController;
  -[UIInputViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[_UIFindNavigatorViewController setTintTechnique:](self, "setTintTechnique:", 1);
  -[_UIFindNavigatorView doneButton](self->_findNavigatorView, "doneButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel__handleDone_, 0x2000);

  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__handleSearchReturn_, 0x2000);

  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__searchTextFieldChanged_, 0x20000);

  -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__didEnterReplacementString_, 0x2000);

  -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__replaceFieldDidChange_, 0x20000);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__textViewDidChangeNotification_, CFSTR("UITextViewTextDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__windowDidChangeToFirstResponder_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45___UIFindNavigatorViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E16C7028;
  v11[4] = self;
  -[_UIFindNavigatorView settingsButton](self->_findNavigatorView, "settingsButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_setMenuProvider:", v11);

}

- (BOOL)hostedInKeyboard
{
  void *v2;
  BOOL v3;

  -[UIFindSession parentInteraction](self->_findSession, "parentInteraction");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_currentHostingStrategy") == 1;

  return v3;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_assistantBarStyle = a3;
  -[_UIFindNavigatorView setAssistantBarStyle:](self->_findNavigatorView, "setAssistantBarStyle:");
  -[_UIFindNavigatorViewController setTintTechnique:](self, "setTintTechnique:", a3 != 1);
}

- (void)setTintTechnique:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  self->_tintTechnique = a3;
  -[UIFindSession searchableResponderAsView](self->_findSession, "searchableResponderAsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3 && v5)
  {
    v8 = v5;
    objc_msgSend(v5, "tintColor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v6;
    -[UIView setTintColor:](self->_findNavigatorView, "setTintColor:", v6);

    v5 = v8;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v8 = v5;
    +[UIColor labelColor](UIColor, "labelColor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:

}

- (id)nextResponder
{
  id v3;
  void *WeakRetained;
  objc_super v6;

  if (-[_UIFindNavigatorViewController hostedInKeyboard](self, "hostedInKeyboard")
    && (v3 = objc_loadWeakRetained((id *)&self->_parentResponder), v3, v3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentResponder);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIFindNavigatorViewController;
    -[UIViewController nextResponder](&v6, sel_nextResponder);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return WeakRetained;
}

- (id)parentFocusEnvironment
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[_UIFindNavigatorViewController hostedInKeyboard](self, "hostedInKeyboard"))
  {
    -[UIFindSession divergentResponder](self->_findSession, "divergentResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "__isKindOfUIView") & 1) != 0)
    {
      _UIFocusEnvironmentSafeCast(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorViewController;
  -[UIViewController parentFocusEnvironment](&v6, sel_parentFocusEnvironment);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[UIFindSession searchableResponder](self->_findSession, "searchableResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keyCommands
{
  NSArray *extraKeyCommands;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  extraKeyCommands = self->_extraKeyCommands;
  if (!extraKeyCommands)
  {
    +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x20000, sel__handleHighlightPreviousResult_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWantsPriorityOverSystemBehavior:", 1);
    +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel__handleInsertNewline_);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsPriorityOverSystemBehavior:", 1);
    +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputEscape"), 0, sel__handleDone_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = v5;
    v10[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 3);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_extraKeyCommands;
    self->_extraKeyCommands = v7;

    extraKeyCommands = self->_extraKeyCommands;
  }
  return extraKeyCommands;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorViewController;
  -[UIResponder buildMenuWithBuilder:](&v7, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenuSystem contextSystem](UIMenuSystem, "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.lookup"));
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.learn"));
    objc_msgSend(v4, "removeMenuForIdentifier:", CFSTR("com.apple.menu.share"));
  }

}

- (void)viewWillMoveToWindow:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFindNavigatorViewController;
  -[UIViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (a3)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "becomeFirstResponder");

    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)resignFirstResponderAndFinishSearching
{
  id v3;

  -[UIResponder firstResponder](self->_findNavigatorView, "firstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIResponder _containsResponder:](self->_findNavigatorView, "_containsResponder:"))
    objc_msgSend(v3, "resignFirstResponder");

}

- (void)_finishSearchingOnResignIfNecessary
{
  void *v3;
  void *v4;
  id WeakRetained;
  int v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3978], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[UIResponder firstResponder](self, "firstResponder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || !v7)
    goto LABEL_7;
  -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_containsResponder:", v7))
  {

LABEL_7:
    goto LABEL_8;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  v6 = objc_msgSend(WeakRetained, "findNavigatorShouldDismissOnResponderChange:", self);

  if (v6)
  {
    v3 = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
    objc_msgSend(v3, "findNavigatorViewControllerDidRequestDismissal:", self);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_windowDidChangeToFirstResponder:(id)a3
{
  -[_UIFindNavigatorViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__finishSearchingOnResignIfNecessary, 0, 0.0);
}

- (void)_textViewDidChangeNotification:(id)a3
{
  _UIFindNavigatorView *findNavigatorView;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  findNavigatorView = self->_findNavigatorView;
  -[UIResponder firstResponder](self, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(findNavigatorView) = -[UIResponder _containsResponder:](findNavigatorView, "_containsResponder:", v5);

  if ((_DWORD)findNavigatorView)
  {
    if (!self->_performingReplacement)
    {
      objc_msgSend(v8, "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIFindSession searchableResponder](self->_findSession, "searchableResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        -[UIFindSession invalidateFoundResults](self->_findSession, "invalidateFoundResults");
        -[_UIFindNavigatorViewController _performAutoSearch](self, "_performAutoSearch");
      }
    }
  }

}

- (void)find:(id)a3
{
  id v3;

  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)findAndReplace:(id)a3
{
  id v4;

  if (-[UIFindSession supportsReplacement](self->_findSession, "supportsReplacement", a3))
  {
    -[_UIFindNavigatorView setMode:](self->_findNavigatorView, "setMode:", 1);
    -[UIView layoutIfNeeded](self->_findNavigatorView, "layoutIfNeeded");
    -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)findNext:(id)a3
{
  -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 0);
}

- (void)findPrevious:(id)a3
{
  -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 1);
}

- (BOOL)_dismissesKeyboardOnReturn
{
  void *v2;
  BOOL v3;

  -[UIViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (void)_updateReturnKeyType
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[_UIFindNavigatorViewController _dismissesKeyboardOnReturn](self, "_dismissesKeyboardOnReturn"))
  {
    v3 = 6;
  }
  else if (-[UIFindSession resultCount](self->_findSession, "resultCount") <= 0)
  {
    v3 = 6;
  }
  else
  {
    v3 = 4;
  }
  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyType:", v3);

  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadInputViews");

}

- (void)_updateResultsCount
{
  UIFindSessionSearchResultDisplayStyle v3;
  int64_t v4;
  int64_t v5;
  NSString *lastSearchQuery;
  void *v7;
  NSInteger v8;
  NSInteger v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;

  v3 = -[UIFindSession searchResultDisplayStyle](self->_findSession, "searchResultDisplayStyle");
  v4 = -[_UIFindNavigatorView mode](self->_findNavigatorView, "mode");
  if (v3 != UIFindSessionSearchResultDisplayStyleNone
    && (v5 = v4, -[NSString length](self->_lastSearchQuery, "length"))
    && (lastSearchQuery = self->_lastSearchQuery,
        -[UIFindSession searchText](self->_findSession, "searchText"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(lastSearchQuery) = -[NSString isEqualToString:](lastSearchQuery, "isEqualToString:", v7),
        v7,
        (_DWORD)lastSearchQuery))
  {
    v8 = -[UIFindSession resultCount](self->_findSession, "resultCount");
    v9 = -[UIFindSession highlightedResultIndex](self->_findSession, "highlightedResultIndex");
    if (v3 == UIFindSessionSearchResultDisplayStyleTotal || v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)MEMORY[0x1E0CB37F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringFromNumber:numberStyle:", v17, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = v9 + 1;
      if (v5 == 1)
        _UILocalizedFormat(CFSTR("MATCH_OF_MATCHES_ABBREVIATED"), (uint64_t)CFSTR("Indicates which match is currently highlighted, in an abbreviated form."), CFSTR("%ld/%ld"), v10, v11, v12, v13, v14, v20);
      else
        _UILocalizedFormat(CFSTR("MATCH_OF_MATCHES"), (uint64_t)CFSTR("Indicates which match is currently highlighted."), CFSTR("%ld of %ld"), v10, v11, v12, v13, v14, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v21 = 0;
  }
  -[_UIFindNavigatorView resultCountLabel](self->_findNavigatorView, "resultCountLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v21);

  -[_UIFindNavigatorView resultCountLabel](self->_findNavigatorView, "resultCountLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sizeToFit");

}

- (void)_updateReplaceButtonEnabled
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  _BOOL4 v9;

  v3 = -[UIFindSession resultCount](self->_findSession, "resultCount");
  v4 = -[UIFindSession allowsReplacementForCurrentlyHighlightedResult](self->_findSession, "allowsReplacementForCurrentlyHighlightedResult");
  -[UIFindSession searchText](self->_findSession, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  v9 = v3 > 0 && v4;
  -[_UIFindNavigatorView setReplaceButtonEnabled:](self->_findNavigatorView, "setReplaceButtonEnabled:", v9 & v8);
}

- (id)_configuredSearchOptions
{
  return -[UIFindSession configuredSearchOptions](self->_findSession, "configuredSearchOptions");
}

- (void)_recomputeConfiguredSearchOptions
{
  void *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;

  -[UIFindSession configuredSearchOptions](self->_findSession, "configuredSearchOptions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "matchCase");

  v5 = objc_msgSend(v10, "stringCompareOptions") & 0xFFFFFFFFFFFFFF7ELL;
  v6 = 129;
  if (v4)
    v6 = 0;
  objc_msgSend(v10, "setStringCompareOptions:", v5 | v6);
  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wholeWords");

  if (v8)
    v9 = 2;
  else
    v9 = 0;
  objc_msgSend(v10, "setWordMatchMethod:", v9);
  -[UIFindSession setConfiguredSearchOptions:](self->_findSession, "setConfiguredSearchOptions:", v10);

}

- (void)_handleDone:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  objc_msgSend(WeakRetained, "findNavigatorViewControllerDidRequestDismissal:", self);

}

- (void)_handleHighlightPreviousResult:(id)a3
{
  -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 1);
}

- (void)_handleSearchReturn:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_UIFindNavigatorViewController _dismissesKeyboardOnReturn](self, "_dismissesKeyboardOnReturn"))
  {
    -[UIResponder _ui_findNavigatorResponder](self, "_ui_findNavigatorResponder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
  else
  {
    -[_UIFindNavigatorViewController _didEnterSearchQuery:](self, "_didEnterSearchQuery:", v5);
  }

}

- (void)_handleInsertNewline:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;

  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "searchTextField");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "replaceTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isFirstResponder");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceTextField");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v9;

LABEL_7:
  objc_msgSend(v12, "insertNewline");

}

- (void)_didEnterSearchQuery:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", self->_lastSearchQuery)
    && objc_msgSend(v4, "isEqual:", self->_lastSearchOptions))
  {
    -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 0);
  }
  else
  {
    -[_UIFindNavigatorViewController _performSearchWithQuery:options:](self, "_performSearchWithQuery:options:", v5, v4);
  }

}

- (void)_performSearchWithQuery:(id)a3 options:(id)a4
{
  id v7;
  uint64_t v8;
  UIFindSession *findSession;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_lastSearchQuery, a3);
  objc_storeStrong((id *)&self->_lastSearchOptions, a4);
  +[UIFindInteraction _setGlobalFindBuffer:](UIFindInteraction, "_setGlobalFindBuffer:", v10);
  v8 = objc_msgSend(v10, "length");
  findSession = self->_findSession;
  if (v8)
  {
    -[UIFindSession performSearchWithQuery:options:](findSession, "performSearchWithQuery:options:", v10, v7);
    -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 0);
  }
  else
  {
    -[UIFindSession invalidateFoundResults](findSession, "invalidateFoundResults");
  }

}

- (void)_performAutoSearch
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3978], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markedTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (v4 = objc_msgSend(v9, "isEmpty"), v5 = v9, v4))
  {
    -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFindNavigatorViewController _performSearchWithQuery:options:](self, "_performSearchWithQuery:options:", v7, v8);

    v5 = v9;
  }

}

- (void)_searchTextFieldChanged:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    v6 = 0.35;
  else
    v6 = 0.0;
  -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFindSession setSearchText:](self->_findSession, "setSearchText:", v8);

  -[_UIFindNavigatorViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performAutoSearch, 0, v6);
}

- (void)_didEnterReplacementString:(id)a3
{
  -[_UIFindNavigatorViewController findNavigator:didInvokeReplaceReplacingAll:](self, "findNavigator:didInvokeReplaceReplacingAll:", self->_findNavigatorView, 0);
}

- (void)_replaceFieldDidChange:(id)a3
{
  void *v4;
  void *v5;

  -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIFindSession setReplacementText:](self->_findSession, "setReplacementText:", v5);

  -[_UIFindNavigatorViewController _updateReplaceButtonEnabled](self, "_updateReplaceButtonEnabled");
}

- (void)updateViewForActiveFindSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIFindNavigatorViewController _updateResultsCount](self, "_updateResultsCount");
  -[_UIFindNavigatorViewController _updateReplaceButtonEnabled](self, "_updateReplaceButtonEnabled");
  -[UIFindSession searchText](self->_findSession, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v3);

  -[UIFindSession replacementText](self->_findSession, "replacementText");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController findNavigatorView](self, "findNavigatorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (void)findNavigator:(id)a3 didChangeMode:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
  objc_msgSend(WeakRetained, "findNavigatorViewControllerViewDidChangeIntrinsicContentSize:", self);

  -[_UIFindNavigatorViewController _updateResultsCount](self, "_updateResultsCount");
}

- (void)findNavigator:(id)a3 didInvokeReplaceReplacingAll:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  UIFindSession *findSession;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIFindSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a4;
  if (-[UIFindSession supportsReplacement](self->_findSession, "supportsReplacement", a3))
  {
    -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      self->_performingReplacement = 1;
      findSession = self->_findSession;
      if (v4)
      {
        -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "text");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIFindSession replaceAllInstancesOfSearchQuery:withReplacementString:options:](findSession, "replaceAllInstancesOfSearchQuery:withReplacementString:options:", v11, v13, v14);

      }
      else
      {
        if (-[UIFindSession allowsReplacementForCurrentlyHighlightedResult](self->_findSession, "allowsReplacementForCurrentlyHighlightedResult"))
        {
          v15 = self->_findSession;
          -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "text");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFindNavigatorView replaceTextField](self->_findNavigatorView, "replaceTextField");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "text");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIFindSession performSingleReplacementWithSearchQuery:replacementString:options:](v15, "performSingleReplacementWithSearchQuery:replacementString:options:", v17, v19, v20);

        }
        -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", 0);
      }
      self->_performingReplacement = 0;
    }
  }
}

- (void)findNavigator:(id)a3 didInvokeNextResultInDirection:(int64_t)a4
{
  UIFindSession *findSession;
  void *v7;
  void *v8;
  void *v9;

  if (!-[UIFindSession resultCount](self->_findSession, "resultCount", a3))
  {
    findSession = self->_findSession;
    -[_UIFindNavigatorView searchTextField](self->_findNavigatorView, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIFindSession performSearchWithQuery:options:](findSession, "performSearchWithQuery:options:", v8, v9);

  }
  -[UIFindSession highlightNextResultInDirection:](self->_findSession, "highlightNextResultInDirection:", a4);
}

- (void)findNavigatorDidInvalidateSearchSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIFindNavigatorViewController _recomputeConfiguredSearchOptions](self, "_recomputeConfiguredSearchOptions");
  -[UIFindSession invalidateFoundResults](self->_findSession, "invalidateFoundResults");
  objc_msgSend(v4, "searchTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController _configuredSearchOptions](self, "_configuredSearchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFindNavigatorViewController _performSearchWithQuery:options:](self, "_performSearchWithQuery:options:", v5, v6);

}

- (BOOL)findNavigatorShouldShowReplacementOption:(id)a3
{
  return -[UIFindSession supportsReplacement](self->_findSession, "supportsReplacement", a3);
}

- (BOOL)allowsCompactAssistantBar
{
  return 0;
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:](UISystemInputAssistantViewController, "_defaultPreferredHeightForTraitCollection:", v4);
  v6 = v5;
  v7 = objc_msgSend(v4, "userInterfaceIdiom");
  v8 = objc_msgSend(v4, "horizontalSizeClass");

  if ((!v7 || v8 == 1) && -[_UIFindNavigatorView mode](self->_findNavigatorView, "mode") == 1)
    return v6 + v6;
  return v6;
}

- (double)preferredWidthForTraitCollection:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  double v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "userInterfaceIdiom") != 1 && objc_msgSend(v4, "userInterfaceIdiom") != 6;
  v6 = objc_msgSend(v4, "horizontalSizeClass");
  v7 = -1.0;
  if (!v5 && v6 != 1)
  {
    if (-[_UIFindNavigatorView mode](self->_findNavigatorView, "mode") == 1)
      v7 = 700.0;
    else
      v7 = -1.0;
  }

  return v7;
}

- (UIFindSession)findSession
{
  return self->_findSession;
}

- (_UIFindNavigatorViewControllerDelegate)findNavigatorViewControllerDelegate
{
  return (_UIFindNavigatorViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_findNavigatorViewControllerDelegate);
}

- (void)setFindNavigatorViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_findNavigatorViewControllerDelegate, a3);
}

- (UIResponder)parentResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_parentResponder);
}

- (void)setParentResponder:(id)a3
{
  objc_storeWeak((id *)&self->_parentResponder, a3);
}

- (unint64_t)tintTechnique
{
  return self->_tintTechnique;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentResponder);
  objc_destroyWeak((id *)&self->_findNavigatorViewControllerDelegate);
  objc_storeStrong((id *)&self->_findSession, 0);
  objc_storeStrong((id *)&self->_lastSearchOptions, 0);
  objc_storeStrong((id *)&self->_lastSearchQuery, 0);
  objc_storeStrong((id *)&self->_extraKeyCommands, 0);
  objc_storeStrong((id *)&self->_findNavigatorView, 0);
}

@end
