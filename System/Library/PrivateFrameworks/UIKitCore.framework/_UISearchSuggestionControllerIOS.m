@implementation _UISearchSuggestionControllerIOS

- (_UISearchSuggestionControllerIOS)initWithSearchTextField:(id)a3
{
  _UISearchSuggestionControllerIOS *v3;
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *suggestionsRecoveryGesture;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UISearchSuggestionControllerIOS;
  v3 = -[_UISearchSuggestionControllerIOSBase initWithSearchTextField:](&v8, sel_initWithSearchTextField_, a3);
  if (v3)
  {
    v4 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v3, sel__suggestionsRecoveryGestureRecognized);
    suggestionsRecoveryGesture = v3->_suggestionsRecoveryGesture;
    v3->_suggestionsRecoveryGesture = v4;

    -[UIGestureRecognizer setDelegate:](v3->_suggestionsRecoveryGesture, "setDelegate:", v3);
    -[_UISearchSuggestionControllerIOSBase searchTextField](v3, "searchTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v3->_suggestionsRecoveryGesture);

  }
  return v3;
}

- (BOOL)_hasVisibleMenu
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  BOOL v7;

  -[_UISearchSuggestionControllerIOSBase suggestions](self, "suggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[_UISearchSuggestionControllerIOS menuInteraction](self, "menuInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_hasVisibleMenu");
  if (v4)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (UIContextMenuInteraction)menuInteraction
{
  return self->_menuInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsRecoveryGesture, 0);
  objc_storeStrong((id *)&self->_menuInteraction, 0);
}

- (id)_suggestionsMenu
{
  unint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __CFString *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  id (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  id location;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[_UISearchSuggestionController suggestionGroups](self, "suggestionGroups");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v26, "count");
  if (v3 < 2)
  {
    v25 = &stru_1E16EDF20;
    if (v3 == 1)
    {
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headerTitle");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &stru_1E16EDF20;
      if (v6)
        v8 = (__CFString *)v6;
      v25 = v8;

      v24 = 0;
      v4 = 1;
    }
    else
    {
      v24 = 0;
      v4 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v25 = &stru_1E16EDF20;
  }
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke;
  v34 = &unk_1E16B50C8;
  objc_copyWeak(&v35, &location);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "suggestionItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33((uint64_t)v32, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v26;
    v11 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "headerTitle");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v15)
            v17 = (const __CFString *)v15;
          else
            v17 = &stru_1E16EDF20;
          objc_msgSend(v14, "suggestionItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v33((uint64_t)v32, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v17, 0, 0, 1, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addObject:", v20);
        }
        v11 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      }
      while (v11);
    }
  }

  if (v11)
    v21 = v11;
  else
    v21 = v9;
  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", v25, 0, 0, 16, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  return v22;
}

- (void)_dismissMenuWithoutAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64___UISearchSuggestionControllerIOS__dismissMenuWithoutAnimation__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_updateMenuWithSuggestionGroups:(id)a3
{
  id v4;
  uint64_t v5;
  UIContextMenuInteraction *v6;
  void *v7;
  UIContextMenuInteraction *v8;
  UIContextMenuInteraction *v9;
  id v10;
  _QWORD v11[5];

  v4 = a3;
  -[_UISearchSuggestionController setSuggestionGroups:](self, "setSuggestionGroups:", v4);
  -[_UISearchSuggestionControllerIOS menuInteraction](self, "menuInteraction");
  v8 = (UIContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
  v5 = _UISearchSuggestionNumberOfSuggestionsFromGroups(v4);

  v6 = v8;
  if (!v8 && v5)
  {
    v9 = -[UIContextMenuInteraction initWithDelegate:]([UIContextMenuInteraction alloc], "initWithDelegate:", self);
    -[UIContextMenuInteraction _setFallbackDriverStyle:](v9, "_setFallbackDriverStyle:", 1);
    -[_UISearchSuggestionControllerIOS setMenuInteraction:](self, "setMenuInteraction:", v9);
    -[UIContextMenuInteraction setDrivers:](v9, "setDrivers:", MEMORY[0x1E0C9AA60]);
    -[_UISearchSuggestionControllerIOSBase searchTextField](self, "searchTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addInteraction:", v9);

    v6 = v9;
  }
  if (-[UIContextMenuInteraction _hasVisibleMenu](v6, "_hasVisibleMenu", v6) || !v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68___UISearchSuggestionControllerIOS__updateMenuWithSuggestionGroups___block_invoke;
    v11[3] = &unk_1E16B50F0;
    v11[4] = self;
    objc_msgSend(v10, "updateVisibleMenuWithBlock:", v11);
  }
  else
  {
    objc_msgSend(v10, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }

}

- (BOOL)__shouldUseMenu
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  void *v9;
  _BOOL8 v10;

  if (!a1)
    return 0;
  objc_msgSend(a1, "searchBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6 = objc_msgSend(v3, "_usesSearchSuggestionsMenuForStackedSearch");
    v7 = objc_msgSend(v2, "_isHostedInlineByNavigationBar") | v6;
    if (!v6)
    {
      objc_msgSend(v2, "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 1;
  }
  +[UITraitCollection traitCollectionWithUserInterfaceIdiom:](UITraitCollection, "traitCollectionWithUserInterfaceIdiom:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = v8;
  v10 = 0;
  if (v7 && v5)
    v10 = _UIBarsUseDesktopNavigationBar(v8);

  return v10;
}

- (void)updateSuggestionGroups:(id)a3 userInitiated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (_UISearchSuggestionNumberOfSuggestionsFromGroups(v9)
    || (-[_UISearchSuggestionController suggestionGroups](self, "suggestionGroups"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = _UISearchSuggestionNumberOfSuggestionsFromGroups(v5),
        v5,
        v6))
  {
    if (-[_UISearchSuggestionControllerIOS __shouldUseMenu](self))
    {
      -[_UISearchSuggestionControllerIOS _updateMenuWithSuggestionGroups:](self, "_updateMenuWithSuggestionGroups:", v9);
    }
    else
    {
      -[_UISearchSuggestionControllerIOSBase searchBar](self, "searchBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_searchController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[_UISearchSuggestionController setSuggestionGroups:](self, "setSuggestionGroups:", v9);
    }
  }

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90___UISearchSuggestionControllerIOS_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E16B5118;
  v5[4] = self;
  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  void *v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CGRect v11;

  -[_UISearchSuggestionControllerIOSBase searchTextField](self, "searchTextField", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIContextMenuStyle defaultStyle](_UIContextMenuStyle, "defaultStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredLayout:", 3);
  v7 = xmmword_18666E950;
  v9 = 0;
  v10 = 0;
  v8 = 0x4018000000000000;
  objc_msgSend(v5, "set_preferredAnchor:", &v7);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "set_preferredMenuWidth:", fmin(CGRectGetWidth(v11), 343.0));
  objc_msgSend(v5, "set_backgroundInteractionStyle:", 1);

  return v5;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  -[_UISearchSuggestionControllerIOSBase menuDidCloseWithAnimator:](self, "menuDidCloseWithAnimator:", a5, a4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  UITapGestureRecognizer *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (UITapGestureRecognizer *)a3;
  if (self->_suggestionsRecoveryGesture != v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "unexpected gesture: %@", (uint8_t *)&v14, 0xCu);
      }

    }
    else
    {
      v11 = gestureRecognizerShouldBegin____s_category;
      if (!gestureRecognizerShouldBegin____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&gestureRecognizerShouldBegin____s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "unexpected gesture: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  if (self->_suggestionsRecoveryGesture == v4)
  {
    if (-[_UISearchSuggestionControllerIOS __shouldUseMenu](self))
    {
      -[_UISearchSuggestionControllerIOS menuInteraction](self, "menuInteraction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[_UISearchSuggestionControllerIOS menuInteraction](self, "menuInteraction");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "_hasVisibleMenu") & 1) != 0)
        {
          v5 = 0;
        }
        else
        {
          -[_UISearchSuggestionControllerIOSBase searchTextField](self, "searchTextField");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEditing"))
          {
            -[_UISearchSuggestionControllerIOSBase suggestions](self, "suggestions");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = objc_msgSend(v9, "count") != 0;

          }
          else
          {
            v5 = 0;
          }

        }
      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_suggestionsRecoveryGestureRecognized
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _UISearchSuggestionControllerIOS *v8;

  -[_UISearchSuggestionControllerIOSBase searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_searchController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73___UISearchSuggestionControllerIOS__suggestionsRecoveryGestureRecognized__block_invoke;
  v6[3] = &unk_1E16B1B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

- (void)setMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_menuInteraction, a3);
}

- (UITapGestureRecognizer)suggestionsRecoveryGesture
{
  return self->_suggestionsRecoveryGesture;
}

- (void)setSuggestionsRecoveryGesture:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsRecoveryGesture, a3);
}

@end
