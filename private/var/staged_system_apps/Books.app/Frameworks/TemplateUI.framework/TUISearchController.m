@implementation TUISearchController

- (TUISearchController)init
{
  TUISearchController *v2;
  _TUISearchController *v3;
  _TUISearchController *searchController;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUISearchController;
  v2 = -[TUISearchController init](&v7, "init");
  if (v2)
  {
    v3 = -[_TUISearchController initWithSearchResultsController:]([_TUISearchController alloc], "initWithSearchResultsController:", 0);
    searchController = v2->_searchController;
    v2->_searchController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISearchController searchBar](v2->_searchController, "searchBar"));
    objc_msgSend(v5, "setDelegate:", v2);

  }
  return v2;
}

- (void)configureWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  v4 = a3;
  -[TUISearchController setRenderModel:](self, "setRenderModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
  objc_msgSend(v5, "setHidesNavigationBarDuringPresentation:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
  objc_msgSend(v6, "setObscuresBackgroundDuringPresentation:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchField"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeholderText"));
  v33 = 0;
  v34 = objc_msgSend(v10, "length");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeholderText"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attribute:atIndex:effectiveRange:", NSParagraphStyleAttributeName, 0, &v33));

  if (v12)
  {
    v13 = objc_msgSend(v12, "mutableCopy");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle"));
    v13 = objc_msgSend(v14, "mutableCopy");

  }
  objc_msgSend(v13, "setMaximumLineHeight:", 0.0, v33, v34);
  objc_msgSend(v13, "setMinimumLineHeight:", 0.0);
  v15 = objc_alloc((Class)NSMutableAttributedString);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeholderText"));
  v17 = objc_msgSend(v15, "initWithAttributedString:", v16);

  objc_msgSend(v17, "addAttribute:value:range:", NSParagraphStyleAttributeName, v13, v33, v34);
  objc_msgSend(v9, "setAttributedPlaceholder:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v19 = objc_msgSend(v18, "length");

  if (!v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    objc_msgSend(v8, "setText:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    v23 = objc_opt_class(UIViewController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));
    v26 = TUIDynamicCast(v23, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "presentedViewController"));
    if (!v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
      objc_msgSend(v29, "setActive:", 1);

    }
  }
  v30 = TUIPlatformKeyboardAppearanceFromKeyboardAppearance((_BOOL8)objc_msgSend(v4, "keyboardAppearance"));
  if ((id)v30 != objc_msgSend(v8, "keyboardAppearance"))
  {
    objc_msgSend(v8, "setKeyboardAppearance:", v30);
    objc_msgSend(v8, "reloadInputViewsWithoutReset");
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  if (objc_msgSend(v4, "keyboardAppearance") == (char *)&dword_0 + 1)
  {
    v32 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));

    v31 = (void *)v32;
  }
  objc_msgSend(v8, "setTintColor:", v31);
  -[TUISearchController configureSubviews](self, "configureSubviews");

}

- (void)didUpdateWithTrigger:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v9 = CFSTR("value");
  v10 = a4;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  -[TUISearchController _callActionHandlerForTrigger:arguments:](self, "_callActionHandlerForTrigger:arguments:", v7, v8);
}

- (void)_callActionHandlerForTrigger:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController renderModel](self, "renderModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionHandler"));
  objc_msgSend(v8, "invoke:arguments:", v7, v6);

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("beginInput"), v5);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("endInput"), v5);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("changedInput"), v6);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("returnPressed"), v5);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  objc_msgSend(v5, "setText:", &stru_243BF0);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("cancelPressed"), v7);

}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  void *v13;

  length = a4.length;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v10 = objc_msgSend(v9, "length");
  v11 = objc_msgSend(v8, "length");

  v12 = (unint64_t)v10 + (_QWORD)v11 - length;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController renderModel](self, "renderModel"));
  LOBYTE(self) = v12 <= (unint64_t)objc_msgSend(v13, "searchTextMaxLength");

  return (char)self;
}

- (BOOL)searchBarShouldClear:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUISearchController searchController](self, "searchController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[TUISearchController didUpdateWithTrigger:text:](self, "didUpdateWithTrigger:text:", CFSTR("clearPressed"), v6);

  return 1;
}

- (void)configureSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  BOOL v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  _BYTE v41[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISearchController _searchBar](self->_searchController, "_searchBar"));
  v4 = objc_opt_class(TUIReusableBaseView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scopeBarContentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = TUIDynamicCast(v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewStateSave"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scopeBarContentView"));
  objc_msgSend(WeakRetained, "viewFactoryPrepareToReuseHost:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelNavigationItem subviewsModel](self->_renderModel, "subviewsModel"));
  if (v13 && (v14 = objc_loadWeakRetained((id *)&self->_factory), v32 = v14 != 0, v14, v14))
  {
    objc_msgSend(v13, "prepare");
    v40 = 0;
    v15 = objc_loadWeakRetained((id *)&self->_factory);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scopeBarContentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configureSubviewsWithFactory:outsets:host:overrides:usedOverrides:UUID:uid:", v15, v16, 0, &v40, 0, 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          -[TUISearchController verifyHierarchyForSubview:](self, "verifyHierarchyForSubview:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v20);
    }

    v23 = 1;
  }
  else
  {
    v32 = 0;
    v23 = 0;
  }
  objc_msgSend(v13, "size");
  objc_msgSend(v3, "setScopeBarContentSize:");
  v24 = objc_opt_class(TUIReusableBaseView);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scopeBarContentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "subviews"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
  v28 = TUIDynamicCast(v24, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  if (v10)
  {
    v30 = objc_opt_class(v29);
    if (v30 == objc_opt_class(v9))
      objc_msgSend(v29, "viewStateRestore:", v10);
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISearchController transitionCoordinator](self->_searchController, "transitionCoordinator"));
  if (v31)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_153260;
    v33[3] = &unk_242B10;
    v34 = v3;
    v35 = v32;
    objc_msgSend(v31, "animateAlongsideTransition:completion:", 0, v33);

  }
  else
  {
    objc_msgSend(v3, "setShowsScopeBar:animated:", v23, 1);
  }

}

- (TUIViewFactory)factory
{
  return (TUIViewFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (void)setFactory:(id)a3
{
  objc_storeWeak((id *)&self->_factory, a3);
}

- (UISearchController)searchController
{
  return &self->_searchController->super;
}

- (TUIRenderModelNavigationItem)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_renderModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
