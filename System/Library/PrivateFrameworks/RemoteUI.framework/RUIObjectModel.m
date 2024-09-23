@implementation RUIObjectModel

+ (void)_enableTestMode
{
  gAnimatedNavigationTransitions = 1;
}

- (RUIObjectModel)init
{
  RUIObjectModel *v2;
  uint64_t v3;
  NSMutableDictionary *namedAlerts;
  uint64_t v5;
  NSMutableArray *defaultPages;
  uint64_t v7;
  NSMutableArray *displayedPages;
  uint64_t v9;
  NSMutableDictionary *namedPages;
  uint64_t v11;
  NSMutableDictionary *httpHeaders;
  uint64_t v13;
  NSDictionary *updateInfo;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RUIObjectModel;
  v2 = -[RUIObjectModel init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    namedAlerts = v2->_namedAlerts;
    v2->_namedAlerts = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    defaultPages = v2->_defaultPages;
    v2->_defaultPages = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    displayedPages = v2->_displayedPages;
    v2->_displayedPages = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    namedPages = v2->_namedPages;
    v2->_namedPages = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    httpHeaders = v2->_httpHeaders;
    v2->_httpHeaders = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    updateInfo = v2->_updateInfo;
    v2->_updateInfo = (NSDictionary *)v13;

    -[RUIObjectModel initializeSwift](v2, "initializeSwift");
  }
  return v2;
}

- (void)cleanupRefreshTimer
{
  NSTimer *refreshTimer;

  -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  refreshTimer = self->_refreshTimer;
  self->_refreshTimer = 0;

}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  RUIObjectModel *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  RUIObjectModel *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = self->_defaultPages;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "objectModel");
        v9 = (RUIObjectModel *)objc_claimAutoreleasedReturnValue();

        if (v9 == self)
          objc_msgSend(v8, "setObjectModel:", 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary allValues](self->_namedPages, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(v15, "objectModel");
        v16 = (RUIObjectModel *)objc_claimAutoreleasedReturnValue();

        if (v16 == self)
          objc_msgSend(v15, "setObjectModel:", 0);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }
  -[RUIObjectModel setJSGlobalContext:](self, "setJSGlobalContext:", 0);
  -[RUIObjectModel cleanupRefreshTimer](self, "cleanupRefreshTimer");

  v17.receiver = self;
  v17.super_class = (Class)RUIObjectModel;
  -[RUIObjectModel dealloc](&v17, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[RUIObjectModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p ID '%@', Source: %@\nDisplayed Pages: %@ Default Pages: %@ Named Pages: %@>"), v4, self, v5, self->_sourceURL, self->_displayedPages, self->_defaultPages, self->_namedPages);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (id)objectModelForXMLNamed:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  RUIParser *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v4, CFSTR("xml"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RUIParser initWithXML:baseURL:delegate:]([RUIParser alloc], "initWithXML:baseURL:delegate:", v7, v6, 0);
  -[RUIParser uiObjectModel](v8, "uiObjectModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v4);

  return v9;
}

- (void)parseDidFinish
{
  id v3;

  self->_parseFinished = 1;
  -[RUIObjectModel style](self, "style");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyToObjectModel:", self);

}

- (void)_populatePageNavItem:(id)a3 withNextButton:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v4 = a4;
  v23 = a3;
  objc_msgSend(v23, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "rightBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x24BEBD410]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24C29B280, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, self->_nextButtonStyle, self, sel__navigateToNextPageAnimated);

      objc_msgSend(v7, "setRightBarButtonItem:", v12);
    }
  }
  v13 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BACK"), &stru_24C29B280, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 0, self, sel_back_);
  objc_msgSend(v7, "setBackBarButtonItem:", v16);

  objc_msgSend(v23, "backButtonTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "backBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backButtonTitle");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v22 = (void *)v19;
    objc_msgSend(v18, "setTitle:", v19);

    goto LABEL_9;
  }
  objc_msgSend(v23, "navTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    objc_msgSend(v7, "backBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navTitle");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:

}

- (void)refreshTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "Refresh page from timeout", v4, 2u);
    }

  }
  -[RUIObjectModel _handleLinkPress:attributes:completion:](self, "_handleLinkPress:attributes:completion:", self->_refreshURL, &unk_24C2B1E78, 0);
  -[RUIObjectModel cleanupRefreshTimer](self, "cleanupRefreshTimer");
}

- (id)_firstPageForPresentation
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int refreshDelay;
  NSTimer *v7;
  NSTimer *refreshTimer;

  self->_currentPage = 0;
  v3 = -[NSMutableArray count](self->_defaultPages, "count");
  if (v3)
  {
    v4 = v3;
    -[NSMutableArray objectAtIndex:](self->_defaultPages, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_displayedPages, "addObject:", v5);
    -[RUIObjectModel _populatePageNavItem:withNextButton:](self, "_populatePageNavItem:withNextButton:", v5, v4 != 1);
    refreshDelay = self->_refreshDelay;
    if (refreshDelay >= 1)
    {
      if (self->_refreshTimer)
      {
        -[RUIObjectModel cleanupRefreshTimer](self, "cleanupRefreshTimer");
        refreshDelay = self->_refreshDelay;
      }
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_refreshTimeout, 0, 0, (double)refreshDelay);
      v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      refreshTimer = self->_refreshTimer;
      self->_refreshTimer = v7;

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)presentWithBlock:(id)a3
{
  id v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RUIObjectModel.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  v5 = -[RUIObjectModel _firstPageForPresentation](self, "_firstPageForPresentation");
  v7[2]();

}

- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[RUIObjectModel _firstPageForPresentation](self, "_firstPageForPresentation");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel presentPage:inViewController:animated:completion:](self, "presentPage:inViewController:animated:completion:", v10, v9, v5, v8);

}

- (void)presentInParentViewController:(id)a3 animated:(BOOL)a4
{
  -[RUIObjectModel presentInParentViewController:animated:completion:](self, "presentInParentViewController:animated:completion:", a3, a4, 0);
}

- (void)presentPage:(id)a3 inViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  void (**v10)(_QWORD);
  id v11;

  v7 = a5;
  v11 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a6;
  if (v11)
  {
    if (v10 && v7)
      objc_msgSend(v11, "addDidAppearBlock:", v10);
    objc_msgSend(v9, "pushViewController:animated:", v11, v7);
    if (v10 && !v7)
      v10[2](v10);
  }

}

- (id)newNavigationControllerForPresentation
{
  void *v3;
  RUINavigationController *v4;
  void *v5;
  void *v6;

  -[RUIObjectModel _firstPageForPresentation](self, "_firstPageForPresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[RUINavigationController initWithRootViewController:]([RUINavigationController alloc], "initWithRootViewController:", v3);
    -[RUIObjectModel style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUINavigationController setStyle:](v4, "setStyle:", v5);

    -[RUIObjectModel style](self, "style");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyToNavigationController:", v4);

    if (+[RUIPlatform isAppleTV](RUIPlatform, "isAppleTV"))
      -[RUINavigationController setModalTransitionStyle:](v4, "setModalTransitionStyle:", 2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_parentViewController
{
  void *v3;
  id v4;
  char v5;
  id v6;
  void *v7;
  id WeakRetained;

  -[RUIObjectModel primaryAlert](self, "primaryAlert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (v4 = objc_loadWeakRetained((id *)&self->_delegate),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) == 0)
    || (v6 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v6, "viewControllerForAlertPresentation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parentViewControllerForObjectModel:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_parentNavigationController
{
  void *v2;
  id v3;

  -[RUIObjectModel _parentViewController](self, "_parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)_displaySupplementalPage:(id)a3
{
  RUIObjectModelDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;

  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "parentViewControllerForObjectModel:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, (gAnimatedNavigationTransitions & 1) == 0);

  -[NSMutableArray addObject:](self->_displayedPages, "addObject:", v7);
}

- (void)_displayNamedPage:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableArray *displayedPages;
  id v7;
  void *v8;
  id WeakRetained;

  v4 = a4;
  displayedPages = self->_displayedPages;
  v7 = a3;
  -[NSMutableArray addObject:](displayedPages, "addObject:", v7);
  -[RUIObjectModel _populatePageNavItem:withNextButton:](self, "_populatePageNavItem:withNextButton:", v7, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "parentViewControllerForObjectModel:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v7, v4);

}

- (void)pageDidDisappear:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v9)
  {
    -[NSMutableArray removeLastObject](self->_displayedPages, "removeLastObject");
    objc_msgSend(v9, "parentPage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v9, "_updateParentPage");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "objectModel:didNavigateBackFromController:withGesture:", self, v9, 1);

      }
    }
  }

}

- (void)_navigateBackWithPop:(BOOL)a3 fromViewController:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id WeakRetained;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  id v19;

  v4 = a3;
  v19 = a4;
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentPage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = (uint64_t)v19;
      if (!v19 && v4)
      {
        -[RUIObjectModel _viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:](self, "_viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:", (gAnimatedNavigationTransitions & 1) == 0);
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (id)v13;
      if (v4 && !v13)
      {
        v14 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v14, "parentViewControllerForObjectModel:", self);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "popViewControllerAnimated:", (gAnimatedNavigationTransitions & 1) == 0);
        v19 = (id)objc_claimAutoreleasedReturnValue();

      }
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "objectModel:didNavigateBackFromController:withGesture:", self, v19, 0);
    }
    else
    {
      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
        goto LABEL_16;
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "objectModelPressedBack:", self);
    }

    goto LABEL_16;
  }
  if (v4)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "parentViewControllerForObjectModel:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", (gAnimatedNavigationTransitions & 1) == 0);

  }
  -[NSMutableArray removeLastObject](self->_displayedPages, "removeLastObject");
  objc_msgSend(v6, "_updateParentPage");
LABEL_16:

}

- (void)didNavigateBackFromViewController:(id)a3
{
  -[RUIObjectModel _navigateBackWithPop:fromViewController:](self, "_navigateBackWithPop:fromViewController:", 0, a3);
}

- (void)back:(id)a3
{
  -[RUIObjectModel _navigateBackWithPop:fromViewController:](self, "_navigateBackWithPop:fromViewController:", 1, 0);
}

- (id)_viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_displayedPages, "count") < 2)
  {
    v7 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parentViewControllerForObjectModel:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "popViewControllerAnimated:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray lastObject](self->_displayedPages, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v7)
    {
      objc_msgSend(v7, "pageID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (!v10)
        --self->_currentPage;
      -[NSMutableArray removeLastObject](self->_displayedPages, "removeLastObject");
    }

  }
  return v7;
}

- (BOOL)goBack
{
  return -[RUIObjectModel goBack:](self, "goBack:", 1);
}

- (BOOL)goBack:(BOOL)a3
{
  void *v3;
  BOOL v4;

  -[RUIObjectModel _viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:](self, "_viewControllerFromNavigatingBackWithinDisplayedPagesAnimated:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)postbackData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1770];
  -[RUIObjectModel postbackDictionary](self, "postbackDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)populatePostbackDictionary:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *serverInfo;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = self->_displayedPages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9++), "populatePostbackDictionary:", v4, (_QWORD)v16);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (self->_updateInfo)
    objc_msgSend(v4, "addEntriesFromDictionary:");
  -[RUIObjectModel authPasswordEquivalent](self, "authPasswordEquivalent", (_QWORD)v16);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[RUIObjectModel authPasswordFieldID](self, "authPasswordFieldID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[RUIObjectModel authPasswordEquivalent](self, "authPasswordEquivalent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel authPasswordFieldID](self, "authPasswordFieldID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
    objc_msgSend(v4, "setObject:forKey:", serverInfo, CFSTR("serverInfo"));

}

- (void)setUpdateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_updateInfo, a3);
  -[RUIObjectModel notifyXMLUIDataChange](self, "notifyXMLUIDataChange");
}

- (id)postbackDictionary
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[RUIObjectModel populatePostbackDictionary:](self, "populatePostbackDictionary:", v3);
  return v3;
}

- (void)_populateRequest:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_httpHeaders;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_httpHeaders, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forHTTPHeaderField:", v11, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)refreshWithObjectModel:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *namedAlerts;
  RUIAlertView *v11;
  RUIAlertView *primaryAlert;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t currentPage;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  float v33;
  float v34;
  id *v35;
  _QWORD v36[4];
  id *v37;
  RUIObjectModel *v38;
  _QWORD v39[6];
  _QWORD v40[5];
  CGRect v41;

  v35 = (id *)a3;
  objc_msgSend(v35, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(v35, "serverInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setServerInfo:](self, "setServerInfo:", v7);

    objc_msgSend(v35, "clientInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel setClientInfo:](self, "setClientInfo:", v8);

    objc_storeStrong((id *)&self->_namedAlerts, v35[19]);
    v9 = MEMORY[0x24BDAC760];
    namedAlerts = self->_namedAlerts;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke;
    v40[3] = &unk_24C297C48;
    v40[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](namedAlerts, "enumerateKeysAndObjectsUsingBlock:", v40);
    objc_msgSend(v35, "primaryAlert");
    v11 = (RUIAlertView *)objc_claimAutoreleasedReturnValue();
    primaryAlert = self->_primaryAlert;
    self->_primaryAlert = v11;

    -[RUIAlertView setObjectModel:](self->_primaryAlert, "setObjectModel:", self);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tableViewOM");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentOffset");
    v17 = v16;

    -[RUIObjectModel displayedPages](self, "displayedPages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    currentPage = self->_currentPage;
    self->_currentPage = -1;
    -[RUIObjectModel _parentNavigationController](self, "_parentNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "viewControllers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    objc_msgSend(v23, "removeObjectsInArray:", v19);
    objc_msgSend(v21, "setViewControllers:animated:", v23, 0);
    objc_msgSend(v35, "allPages");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel _unsafe_setPages:](self, "_unsafe_setPages:", v24);

    objc_msgSend(v35, "defaultPages");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v9;
    v39[1] = 3221225472;
    v39[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke_2;
    v39[3] = &unk_24C297C70;
    v39[4] = self;
    v39[5] = currentPage;
    objc_msgSend(v25, "enumerateObjectsUsingBlock:", v39);

    v36[0] = v9;
    v36[1] = 3221225472;
    v36[2] = __41__RUIObjectModel_refreshWithObjectModel___block_invoke_3;
    v36[3] = &unk_24C297C98;
    v37 = v35;
    v38 = self;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v36);
    -[RUIObjectModel _parentViewController](self, "_parentViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutBelowIfNeeded");

    -[RUIObjectModel visiblePage](self, "visiblePage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "tableViewOM");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "contentSize");
    v32 = v31;
    objc_msgSend(v30, "bounds");
    v33 = v32 - CGRectGetHeight(v41);
    v34 = v17;
    objc_msgSend(v30, "setContentOffset:animated:", 0, 0.0, fminf(fmaxf(v33, 0.0), v34));

  }
}

uint64_t __41__RUIObjectModel_refreshWithObjectModel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setObjectModel:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__RUIObjectModel_refreshWithObjectModel___block_invoke_2(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 40) >= a3)
    return objc_msgSend(*(id *)(result + 32), "navigateToNextPageAnimated:", 0);
  *a4 = 1;
  return result;
}

void __41__RUIObjectModel_refreshWithObjectModel___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "pageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "namedPages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pageID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "_displayNamedPage:animated:", v6, 0);

  }
}

- (NSArray)displayedPages
{
  return (NSArray *)self->_displayedPages;
}

- (RUIPage)visiblePage
{
  void *v2;
  void *v3;

  -[RUIObjectModel displayedPages](self, "displayedPages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RUIPage *)v3;
}

- (NSArray)pages
{
  NSLog(CFSTR("UIObjectModel.pages is deprecated. Do not use"), a2);
  return (NSArray *)self->_defaultPages;
}

- (NSArray)allPages
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[RUIObjectModel defaultPages](self, "defaultPages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[RUIObjectModel namedPages](self, "namedPages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  return (NSArray *)v5;
}

- (void)setPages:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[NSMutableArray count](self->_displayedPages, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RUIObjectModel.m"), 529, CFSTR("Cannot change RUIObjectModel pages once they are displayed"));

  }
  -[RUIObjectModel _unsafe_setPages:](self, "_unsafe_setPages:", v6);

}

- (void)_unsafe_setPages:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *namedPages;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMutableDictionary removeAllObjects](self->_namedPages, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_defaultPages, "removeAllObjects");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "setObjectModel:", self, (_QWORD)v19);
        objc_msgSend(v10, "pageID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "length");

        if (v12)
        {
          namedPages = self->_namedPages;
          objc_msgSend(v10, "pageID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](namedPages, "setObject:forKey:", v10, v14);

        }
        objc_msgSend(v10, "pageID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v15, "length"))
        {

LABEL_12:
          -[NSMutableArray addObject:](self->_defaultPages, "addObject:", v10);
          continue;
        }
        objc_msgSend(v10, "attributes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("default"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLValue");

        if (v18)
          goto LABEL_12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

}

- (void)setStyle:(id)a3
{
  RUIStyle *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (RUIStyle *)a3;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[RUIObjectModel allPages](self, "allPages", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setStyle:", v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    if (self->_parseFinished)
      -[RUIStyle applyToObjectModel:](v5, "applyToObjectModel:", self);
  }

}

- (NSDictionary)alert
{
  return -[RUIElement attributes](self->_primaryAlert, "attributes");
}

- (id)alertController
{
  void *v2;
  void *v3;

  -[RUIObjectModel primaryAlert](self, "primaryAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addAlertElement:(id)a3
{
  void *v4;
  uint64_t v5;
  NSMutableDictionary *namedAlerts;
  void *primaryAlert;
  void *v8;
  RUIAlertView *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "setObjectModel:", self);
  objc_msgSend(v10, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    namedAlerts = self->_namedAlerts;
    objc_msgSend(v10, "attributes");
    primaryAlert = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(primaryAlert, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](namedAlerts, "setObject:forKey:", v10, v8);

  }
  else
  {
    v9 = (RUIAlertView *)v10;
    primaryAlert = self->_primaryAlert;
    self->_primaryAlert = v9;
  }

}

- (RUIAlertView)primaryAlert
{
  return self->_primaryAlert;
}

- (void)configureTableView:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectModel:configureTableView:page:", self, v8, v7);

  }
}

- (void)configureRow:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectModel:configureTableRow:page:", self, v8, v7);

  }
}

- (void)configureSection:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectModel:configureTableSection:page:", self, v8, v7);

  }
}

- (Class)customHeaderClassForSection:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "objectModel:customHeaderClassForSection:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (Class)customFooterClassForSection:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "objectModel:customFooterClassForSection:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (Class)customTableCellClassForTableViewRow:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "objectModel:customTableCellClassForTableViewRow:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (id)tableHeaderViewForAttributes:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectModel:tableHeaderViewForAttributes:page:", self, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableFooterViewForAttributes:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectModel:tableFooterViewForAttributes:page:", self, v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)rowForFormField:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v5 = self->_displayedPages;
  v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v26)
  {
    v6 = *(_QWORD *)v43;
    v33 = v4;
    v28 = v5;
    v25 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v5);
        v27 = v7;
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v7), "tableViewOM");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sections");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = v9;
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v31)
        {
          v30 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "rows");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v12 = v11;
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v35;
                v32 = i;
LABEL_13:
                v16 = 0;
                while (1)
                {
                  if (*(_QWORD *)v35 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
                  objc_msgSend(v17, "attributes");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "objectForKey:", CFSTR("postback"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v19, "isEqualToString:", v4))
                    break;
                  objc_msgSend(v17, "attributes");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKey:", CFSTR("id"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "isEqualToString:", v4);

                  if ((v22 & 1) != 0)
                    goto LABEL_22;
                  ++v16;
                  v4 = v33;
                  if (v14 == v16)
                  {
                    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
                    i = v32;
                    if (v14)
                      goto LABEL_13;
                    goto LABEL_20;
                  }
                }

LABEL_22:
                v23 = v17;

                i = v32;
                v4 = v33;
                if (!v23)
                  continue;

                v5 = v28;
                goto LABEL_30;
              }
LABEL_20:

            }
            v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            if (v31)
              continue;
            break;
          }
        }

        v7 = v27 + 1;
        v5 = v28;
        v6 = v25;
      }
      while (v27 + 1 != v26);
      v23 = 0;
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v26);
  }
  else
  {
    v23 = 0;
  }
LABEL_30:

  return v23;
}

- (id)absoluteURLWithString:(id)a3
{
  if (self->_sourceURL)
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", a3);
  else
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)relativeURLWithString:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[RUIObjectModel relativeURLWithString:]";
      _os_log_impl(&dword_209E87000, v5, OS_LOG_TYPE_DEFAULT, "Using deprecating method %s", (uint8_t *)&v8, 0xCu);
    }

  }
  -[RUIObjectModel absoluteURLWithString:](self, "absoluteURLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)elementsWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[RUIObjectModel allPages](self, "allPages", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "elementsWithName:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)startNavigationBarSpinnerWithTitle:(id)a3
{
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
    v4 = (const __CFString *)a3;
  else
    v4 = &stru_24C29B280;
  v10 = CFSTR("titleLoadingMessage");
  v11[0] = v4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RUIObjectModel _startNavigationBarSpinnerIfNeededForAttributes:](self, "_startNavigationBarSpinnerIfNeededForAttributes:", v7);
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

}

- (void)stopNavigationBarSpinner
{
  void *v3;
  id v4;

  -[RUIObjectModel _stopNavigationBarSpinnerIfNeededForAttributes:](self, "_stopNavigationBarSpinnerIfNeededForAttributes:", &unk_24C2B1EA0);
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)_startNavigationBarSpinnerIfNeededForAttributes:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("activityIndicatorAnchorId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel elementForActivityIndicatorAnchorId:](self, "elementForActivityIndicatorAnchorId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[RUIObjectModel elementForActivityIndicatorWithActivatedElement:](self, "elementForActivityIndicatorWithActivatedElement:", self->_activeElement);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("titleLoadingMessage"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    -[RUIObjectModel _parentViewController](self, "_parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "topViewController");
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    objc_msgSend(v9, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel style](self, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActivityIndicatorViewStyle:", objc_msgSend(v13, "navBarActivityIndicatorStyle"));

    +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startAnimatingInNavItem:title:forIdentifier:hideBackButton:hideLeftItems:", v11, v7, CFSTR("RemoteUI"), 1, objc_msgSend(v15, "navBarIndicatorHidesLeftButton"));

  }
}

- (void)_stopNavigationBarSpinnerIfNeededForAttributes:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("titleLoadingMessage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[RUINavBarSpinnerManager sharedSpinnerManager](RUINavBarSpinnerManager, "sharedSpinnerManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAnimatingForIdentifier:", CFSTR("RemoteUI"));

  }
}

- (void)startActivityIndicator
{
  id v2;

  -[RUIObjectModel visiblePage](self, "visiblePage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLoading:", 1);

}

- (void)stopActivityIndicator
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  RUIElement *elementForActivityIndicator;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[RUIObjectModel allPages](self, "allPages", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLoading"))
          objc_msgSend(v8, "setLoading:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[RUIElement stopActivityIndicator](self->_elementForActivityIndicator, "stopActivityIndicator");
  elementForActivityIndicator = self->_elementForActivityIndicator;
  self->_elementForActivityIndicator = 0;

}

- (BOOL)hasAttributeOrAttributeFunctionNamed:(id)a3 withAttributes:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("Function"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "length") != 0;

  }
  return v9;
}

- (id)stringForAttributeName:(id)a3 withAttributes:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;

  v6 = a3;
  v7 = (__CFString *)a4;
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("Function"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[RUIObjectModel invokeScriptFunction:withArguments:](self, "invokeScriptFunction:withArguments:", v11, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v12 = &stru_24C29B280;
    if ((objc_opt_isKindOfClass() & 1) != 0 && -[__CFString length](v7, "length"))
      v12 = v7;
    v13 = v12;
  }
  else
  {
    -[__CFString objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v6);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (BOOL)hasConfirmationAttributes:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("confirmationTitle"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("confirmationBody"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("confirmationCancel"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("confirmationOK"), v4);

  return v5;
}

- (BOOL)hasSecondConfirmationAttributes:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("secondConfirmationTitle"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("secondConfirmationBody"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("secondConfirmationCancel"), v4)&& -[RUIObjectModel hasAttributeOrAttributeFunctionNamed:withAttributes:](self, "hasAttributeOrAttributeFunctionNamed:withAttributes:", CFSTR("secondConfirmationOK"), v4);

  return v5;
}

- (void)presentConfirmationIfNeededForElement:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RUIObjectModel hasConfirmationAttributes:](self, "hasConfirmationAttributes:", v8);

  if (v9)
  {
    objc_msgSend(v6, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke;
    v11[3] = &unk_24C297CE8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    -[RUIObjectModel _presentConfirmationWithAttributes:completion:](self, "_presentConfirmationWithAttributes:completion:", v10, v11);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, 1);
  }

}

void __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  if ((_DWORD)a2
    && (v4 = *(void **)(a1 + 32),
        objc_msgSend(*(id *)(a1 + 40), "attributes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "hasSecondConfirmationAttributes:", v5),
        v5,
        (_DWORD)v4))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke_2;
    v9[3] = &unk_24C297CC0;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_presentSecondConfirmationWithAttributes:completion:", v7, v9);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, 1, a2);
  }
}

uint64_t __67__RUIObjectModel_presentConfirmationIfNeededForElement_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, a2);
  return result;
}

- (void)_presentConfirmationWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v6 = a4;
  v7 = a3;
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("confirmationTitle"), v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("confirmationBody"), v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("confirmationOK"), v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("confirmationCancel"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("confirmationOKIsDestructive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[RUIObjectModel _parentNavigationController](self, "_parentNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("confirmationIsSheet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v14, "BOOLValue");
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    v17 = (v16 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    v17 = 1;
  }
  v28 = (void *)v9;
  v29 = (void *)v8;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEBD3A8];
  v20 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke;
  v32[3] = &unk_24C297D10;
  v21 = v6;
  v33 = v21;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v10, 1, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) != 0)
  {
    v23 = 2;
  }
  else
  {
    objc_msgSend(v18, "addAction:", v22);
    v23 = 0;
  }
  v24 = (void *)MEMORY[0x24BEBD3A8];
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke_2;
  v30[3] = &unk_24C297D10;
  v31 = v21;
  v25 = v21;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v27, v23, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v26);

  if (v12)
    objc_msgSend(v18, "addAction:", v22);
  objc_msgSend(v13, "presentViewController:animated:completion:", v18, 1, 0);

}

uint64_t __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __64__RUIObjectModel__presentConfirmationWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)_presentSecondConfirmationWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v6 = a4;
  v7 = a3;
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("secondConfirmationTitle"), v7);
  v8 = objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("secondConfirmationBody"), v7);
  v9 = objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("secondConfirmationOK"), v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel stringForAttributeName:withAttributes:](self, "stringForAttributeName:withAttributes:", CFSTR("secondConfirmationCancel"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("secondConfirmationOKIsDestructive"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[RUIObjectModel _parentNavigationController](self, "_parentNavigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("secondConfirmationIsSheet"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v14, "BOOLValue");
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    v17 = (v16 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else
  {
    v17 = 1;
  }
  v28 = (void *)v9;
  v29 = (void *)v8;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BEBD3A8];
  v20 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke;
  v32[3] = &unk_24C297D10;
  v21 = v6;
  v33 = v21;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v10, 1, v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v12 & 1) != 0)
  {
    v23 = 2;
  }
  else
  {
    objc_msgSend(v18, "addAction:", v22);
    v23 = 0;
  }
  v24 = (void *)MEMORY[0x24BEBD3A8];
  v30[0] = v20;
  v30[1] = 3221225472;
  v30[2] = __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke_2;
  v30[3] = &unk_24C297D10;
  v31 = v21;
  v25 = v21;
  objc_msgSend(v24, "actionWithTitle:style:handler:", v27, v23, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v26);

  if (v12)
    objc_msgSend(v18, "addAction:", v22);
  objc_msgSend(v13, "presentViewController:animated:completion:", v18, 1, 0);

}

uint64_t __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __70__RUIObjectModel__presentSecondConfirmationWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (id)textInRowWithIdentifier:(id)a3
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
  void *v13;

  v4 = a3;
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableViewOM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("class"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isEqualToString:", CFSTR("editableText"));

  objc_msgSend(v7, "tableCell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v6)
    objc_msgSend(v10, "ruiEditableTextField");
  else
    objc_msgSend(v10, "ruiTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)handleAppleIDAuthenticationIfNeededForAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  BOOL v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  id v55;
  __int128 *p_buf;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  __int128 buf;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authRequired"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "BOOLValue"))
  {

    goto LABEL_4;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authCredentialRecoveryRequired"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
LABEL_4:
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__0;
    v62 = __Block_byref_object_dispose__0;
    v64 = 0;
    v65 = (uint64_t)&v64;
    v66 = 0x2050000000;
    v11 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
    v67 = (void *)getAKAppleIDAuthenticationInAppContextClass_softClass;
    if (!getAKAppleIDAuthenticationInAppContextClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v74 = (uint64_t)__getAKAppleIDAuthenticationInAppContextClass_block_invoke;
      v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_24C297758;
      v76 = (void (*)(uint64_t))&v64;
      __getAKAppleIDAuthenticationInAppContextClass_block_invoke((uint64_t)&buf);
      v11 = *(void **)(v65 + 24);
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v64, 8);
    v63 = (id)objc_opt_new();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authAccountIsPrimary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
    {
      v64 = 0;
      v65 = (uint64_t)&v64;
      v66 = 0x2050000000;
      v15 = (void *)getACAccountStoreClass_softClass;
      v67 = (void *)getACAccountStoreClass_softClass;
      if (!getACAccountStoreClass_softClass)
      {
        *(_QWORD *)&buf = MEMORY[0x24BDAC760];
        *((_QWORD *)&buf + 1) = 3221225472;
        v74 = (uint64_t)__getACAccountStoreClass_block_invoke;
        v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_24C297758;
        v76 = (void (*)(uint64_t))&v64;
        __getACAccountStoreClass_block_invoke((uint64_t)&buf);
        v15 = *(void **)(v65 + 24);
      }
      v16 = objc_retainAutorelease(v15);
      _Block_object_dispose(&v64, 8);
      v17 = (void *)objc_opt_new();
      objc_msgSend(v17, "aa_primaryAppleAccount");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "username");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "length"))
        objc_msgSend((id)v59[5], "setUsername:", v19);

    }
    objc_msgSend((id)v59[5], "username");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "length"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authUsername"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length") == 0;

      if (v22)
        goto LABEL_16;
      v23 = (void *)v59[5];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authUsername"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setUsername:", v20);
    }

LABEL_16:
    objc_msgSend((id)v59[5], "username");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "length"))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authUsernameFieldID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "length") == 0;

      if (v30)
        goto LABEL_18;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authUsernameFieldID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel textInRowWithIdentifier:](self, "textInRowWithIdentifier:", v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend((id)v59[5], "setUsername:", v24);
      }
      else if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authUsernameFieldID"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v52;
          _os_log_impl(&dword_209E87000, v51, OS_LOG_TYPE_DEFAULT, "Could not find a username in usernameFieldID %@", (uint8_t *)&buf, 0xCu);

        }
      }
    }

LABEL_18:
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authPasswordFieldID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length") == 0;

    if (!v26)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authPasswordFieldID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel textInRowWithIdentifier:](self, "textInRowWithIdentifier:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "length"))
      {
        objc_msgSend((id)v59[5], "_setPassword:", v28);
      }
      else if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authPasswordFieldID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_209E87000, v32, OS_LOG_TYPE_DEFAULT, "Could not find a password in passwordFieldID %@", (uint8_t *)&buf, 0xCu);

        }
      }

    }
    v34 = (void *)v59[5];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authReason"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setReason:", v35);

    -[RUIObjectModel _parentNavigationController](self, "_parentNavigationController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v59[5], "setPresentingViewController:", v36);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authIsEphemeral"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "BOOLValue");

    objc_msgSend((id)v59[5], "setIsEphemeral:", v38);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authCredentialRecoveryRequired"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "BOOLValue");

    objc_msgSend((id)v59[5], "setNeedsCredentialRecovery:", v40);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authIsTwoFactor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("authIsTwoFactor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "BOOLValue");

      v44 = v43 ^ 1u;
    }
    else
    {
      v44 = 0;
    }

    objc_msgSend((id)v59[5], "setShouldPromptForPasswordOnly:", v44);
    objc_msgSend((id)v59[5], "username");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length") == 0;

    if (!v46)
      objc_msgSend((id)v59[5], "setIsUsernameEditable:", 0);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__0;
    v76 = __Block_byref_object_dispose__0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2050000000;
    v47 = (void *)getAKAppleIDAuthenticationControllerClass_softClass;
    v72 = getAKAppleIDAuthenticationControllerClass_softClass;
    if (!getAKAppleIDAuthenticationControllerClass_softClass)
    {
      v64 = MEMORY[0x24BDAC760];
      v65 = 3221225472;
      v66 = (uint64_t)__getAKAppleIDAuthenticationControllerClass_block_invoke;
      v67 = &unk_24C297758;
      v68 = &v69;
      __getAKAppleIDAuthenticationControllerClass_block_invoke((uint64_t)&v64);
      v47 = (void *)v70[3];
    }
    v48 = objc_retainAutorelease(v47);
    _Block_object_dispose(&v69, 8);
    v77 = (id)objc_opt_new();
    v49 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v50 = v59[5];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke;
    v53[3] = &unk_24C297D60;
    v53[4] = self;
    v54 = v6;
    v55 = v7;
    p_buf = &buf;
    v57 = &v58;
    objc_msgSend(v49, "authenticateWithContext:completion:", v50, v53);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v58, 8);

    goto LABEL_39;
  }
  if (v7)
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
LABEL_39:

}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2;
  block[3] = &unk_24C297D38;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  block[1] = 3221225472;
  v14 = v5;
  v15 = v8;
  v16 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  __CFString *v11;
  int v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __int128 buf;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    v13 = *(void **)(a1 + 48);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v41 = 0x2020000000;
    v14 = (_QWORD *)getAKAuthenticationUsernameKeySymbolLoc_ptr;
    v42 = getAKAuthenticationUsernameKeySymbolLoc_ptr;
    if (!getAKAuthenticationUsernameKeySymbolLoc_ptr)
    {
      v15 = (void *)AuthKitLibrary();
      v14 = dlsym(v15, "AKAuthenticationUsernameKey");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v14;
      getAKAuthenticationUsernameKeySymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&buf, 8);
    if (!v14)
      __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2_cold_1();
    objc_msgSend(v13, "objectForKeyedSubscript:", *v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 48);
    getAKAuthenticationPasswordKey();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setAuthPasswordEquivalent:", v5);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("authPasswordFieldID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAuthPasswordFieldID:", v18);

    if (objc_msgSend(v4, "length") && objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, v5, (_QWORD)buf);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataUsingEncoding:", 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "base64EncodedStringWithOptions:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "setObject:forKeyedSubscript:", v21, CFSTR("Authorization"));
    }
    else
    {
      NSLog(CFSTR("Auth succeeded but no username or no PET!"));
    }
    goto LABEL_33;
  }
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_209E87000, v2, OS_LOG_TYPE_DEFAULT, "Auth failed with error %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAppleIDAuthenticationErrorDomain();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "code") == -7003;

    if (v6)
      goto LABEL_34;
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    getAKAppleIDAuthenticationErrorDomain();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "code") == -7006;

      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(CFSTR("AUTH_WRONG_PASSWORD_ALERT_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
          || !_os_feature_enabled_impl())
        {
          v12 = 0;
          v11 = CFSTR("AUTH_WRONG_PASSWORD_ALERT_MESSAGE");
        }
        else
        {
          objc_msgSend(CFSTR("AUTH_WRONG_PASSWORD_ALERT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v12 = 1;
        }
        objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24C29B280, CFSTR("Localizable"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_32;
        goto LABEL_31;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v23);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

      v26 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_ALERT_TITLE"), &stru_24C29B280, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "alertControllerWithTitle:message:preferredStyle:", v28, v4, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("AUTH_ERROR_OK_BUTTON"), &stru_24C29B280, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v32);

      objc_msgSend(*(id *)(a1 + 40), "_parentViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "presentViewController:animated:completion:", v5, 1, 0);

      goto LABEL_33;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("AUTH_OTHER_ERROR_ALERT_MESSAGE"), "containsString:", CFSTR("REBRAND")) & 1) != 0
      || !_os_feature_enabled_impl())
    {
      v25 = 0;
      v11 = CFSTR("AUTH_OTHER_ERROR_ALERT_MESSAGE");
    }
    else
    {
      objc_msgSend(CFSTR("AUTH_OTHER_ERROR_ALERT_MESSAGE"), "stringByAppendingString:", CFSTR("_REBRAND"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v25 = 1;
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24C29B280, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_32;
LABEL_31:

    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  if (*(_QWORD *)(a1 + 64))
  {
    v34 = *(void **)(a1 + 48);
    getAKAuthenticationPasswordKey();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v35);

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = 0;

  v38 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v39 = *(void **)(v38 + 40);
  *(_QWORD *)(v38 + 40) = 0;

}

- (id)subElementWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RUIObjectModel primaryAlert](self, "primaryAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    -[RUIObjectModel primaryAlert](self, "primaryAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = self->_namedAlerts;
    v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_namedAlerts, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if ((v15 & 1) != 0)
            goto LABEL_23;
          objc_msgSend(v8, "subElementWithID:", v4);
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v8 = (void *)v16;
LABEL_23:

            goto LABEL_26;
          }
        }
        v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v11)
          continue;
        break;
      }
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[RUIObjectModel allPages](self, "allPages", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v22, "pageElement");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", v4);

          if (v25)
          {
            objc_msgSend(v22, "pageElement");
            v26 = objc_claimAutoreleasedReturnValue();
LABEL_25:
            v8 = (void *)v26;

            goto LABEL_26;
          }
          objc_msgSend(v22, "subElementWithID:", v4);
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
            goto LABEL_25;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v19)
          continue;
        break;
      }
    }

    v8 = 0;
  }
LABEL_26:

  return v8;
}

- (void)startActivityIndicatorWithAttributes:(id)a3
{
  id v4;

  -[RUIObjectModel elementForActivityIndicatorWithAttributes:](self, "elementForActivityIndicatorWithAttributes:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel startActivityIndicatorForElement:](self, "startActivityIndicatorForElement:", v4);

}

- (void)startActivityIndicatorForElement:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[RUIObjectModel elementForActivityIndicatorWithActivatedElement:](self, "elementForActivityIndicatorWithActivatedElement:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_elementForActivityIndicator, v4);
  -[RUIElement startActivityIndicator](self->_elementForActivityIndicator, "startActivityIndicator");
  if (v5)
    -[RUIObjectModel setActivityIndicatorStatus:forElement:](self, "setActivityIndicatorStatus:forElement:", 1, v5);

}

- (void)activateElement:(id)a3 completion:(id)a4
{
  RUIElement *v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  void *v10;
  NSObject *v11;
  RUIElement *activeElement;
  _QWORD v13[5];
  RUIElement *v14;
  void (**v15)(id, _QWORD, void *);
  uint8_t buf[4];
  RUIElement *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = (RUIElement *)a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (-[RUIElement isEqual:](self->_activeElement, "isEqual:", v7))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Already handling activation for element: %@", buf, 0xCu);
      }

    }
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.RemoteUI"), 4, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v10);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_activeElement, a3);
    -[RUIObjectModel startActivityIndicatorForElement:](self, "startActivityIndicatorForElement:", v7);
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        activeElement = self->_activeElement;
        *(_DWORD *)buf = 138412290;
        v17 = activeElement;
        _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Active element set %@", buf, 0xCu);
      }

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __45__RUIObjectModel_activateElement_completion___block_invoke;
    v13[3] = &unk_24C297D88;
    v13[4] = self;
    v14 = v7;
    v15 = v8;
    -[RUIObjectModel handleElementChange:action:completion:](self, "handleElementChange:action:completion:", v14, 2, v13);

  }
}

void __45__RUIObjectModel_activateElement_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "Removing active element %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "stopActivityIndicator");
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setActivityIndicatorStatus:forElement:", 0);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 248);
  *(_QWORD *)(v8 + 248) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 200);
  *(_QWORD *)(v10 + 200) = 0;

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

- (id)elementForActivityIndicatorWithAttributes:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("activityIndicatorAnchorId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel elementForActivityIndicatorAnchorId:](self, "elementForActivityIndicatorAnchorId:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)elementForActivityIndicatorWithActivatedElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel elementForActivityIndicatorWithAttributes:](self, "elementForActivityIndicatorWithAttributes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    objc_msgSend(v7, "pageElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "page");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v4;
    -[RUIObjectModel visiblePage](self, "visiblePage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "activityIndicatorStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("activeElement"));

  if (v11)
    v12 = v7;
  else
    v12 = 0;

  return v12;
}

- (id)elementForActivityIndicatorAnchorId:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[RUIObjectModel delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[RUIObjectModel delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleElementWithIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)handleElementChange:(id)a3 action:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke;
  v12[3] = &unk_24C297E00;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[RUIObjectModel presentConfirmationIfNeededForElement:completion:](self, "presentConfirmationIfNeededForElement:completion:", v10, v12);

}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  int v13;

  if (!a2 || (a3 & 1) != 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_2;
    v10[3] = &unk_24C297DD8;
    v7 = *(id *)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v12 = v7;
    v10[4] = v8;
    v11 = v9;
    v13 = *(_DWORD *)(a1 + 56);
    objc_msgSend(v5, "handleAppleIDAuthenticationIfNeededForAttributes:completion:", v6, v10);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
  }
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  int v12;

  if ((a2 & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3;
    v8[3] = &unk_24C297DB0;
    v11 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    v12 = *(_DWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    objc_msgSend(v3, "_handleElementChange:completion:", v4, v8);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, 0);
  }
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = *(_DWORD *)(a1 + 56) == 2;
    else
      v8 = 0;

    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("action"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("dismiss")))
    {
      v13 = *(_DWORD *)(a1 + 56);

      if (!v8)
      {
        if (v13 == 2)
        {
          objc_msgSend(*(id *)(a1 + 40), "visiblePage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_5;
          v21[3] = &unk_24C297640;
          v22 = *(id *)(a1 + 48);
          objc_msgSend(v14, "dismissIfPresentedWithCompletion:", v21);

          goto LABEL_18;
        }
LABEL_13:
        _RUILoggingFacility();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3_cold_1(a1, v19);

        v20 = *(_QWORD *)(a1 + 48);
        if (v20)
        {
          v10 = *(void (**)(void))(v20 + 16);
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    else
    {

      if (!v8)
        goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "attributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_4;
    v23[3] = &unk_24C297618;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v17, "_handleLinkPress:attributes:completion:", v16, v18, v23);

    goto LABEL_18;
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
  {
    v10 = *(void (**)(void))(v9 + 16);
LABEL_17:
    v10();
  }
LABEL_18:

}

uint64_t __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)openLink:(id)a3 HTTPMethod:(id)a4 completion:(id)a5
{
  -[RUIObjectModel openLink:HTTPMethod:attributes:completion:](self, "openLink:HTTPMethod:attributes:completion:", a3, a4, 0, a5);
}

- (void)openLink:(id)a3 HTTPMethod:(id)a4 attributes:(id)a5 completion:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = (void *)MEMORY[0x24BDBCED8];
  if (a5)
    v10 = a5;
  else
    v10 = (id)MEMORY[0x24BDBD1B8];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "dictionaryWithDictionary:", v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("httpMethod"));

  v14 = (void *)objc_msgSend(v15, "copy");
  -[RUIObjectModel _handleLinkPress:attributes:completion:](self, "_handleLinkPress:attributes:completion:", v13, v14, v11);

}

- (BOOL)_shouldDisplayNamedElement:(id)a3 page:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[RUIObjectModel delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[RUIObjectModel delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "objectModel:shouldDisplayNamedElement:page:", self, v6, v7);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)alertWithName:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_namedAlerts, "objectForKeyedSubscript:", a3);
}

- (void)_handleLinkPress:(id)a3 attributes:(id)a4 completion:(id)a5
{
  RUIElement *v8;
  id v9;
  void (**v10)(id, _BOOL8, void *);
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  char v28;
  id v29;
  int v30;
  void *v31;
  void *v32;
  id WeakRetained;
  char v34;
  id v35;
  char v36;
  id v37;
  id v38;
  void *v39;
  RUIElement *v40;
  id v41;
  char v42;
  id v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  RUIElement *activeElement;
  _QWORD v48[5];
  RUIElement *v49;
  void (**v50)(id, _BOOL8, void *);
  id v51;
  uint8_t buf[4];
  RUIElement *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v8 = (RUIElement *)a3;
  v9 = a4;
  v10 = (void (**)(id, _BOOL8, void *))a5;
  if (-[RUIElement hasPrefix:](v8, "hasPrefix:", CFSTR("#")))
  {
    -[RUIElement substringFromIndex:](v8, "substringFromIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_namedPages, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (-[RUIObjectModel _shouldDisplayNamedElement:page:](self, "_shouldDisplayNamedElement:page:", 0, v12))
      {
        v13 = 1;
        -[RUIObjectModel _displayNamedPage:animated:](self, "_displayNamedPage:animated:", v12, (gAnimatedNavigationTransitions & 1) == 0);
        v14 = 0;
        if (!v10)
          goto LABEL_38;
      }
      else
      {
        v14 = 0;
        v13 = 0;
        if (!v10)
          goto LABEL_38;
      }
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_namedAlerts, "objectForKey:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 && -[RUIObjectModel _shouldDisplayNamedElement:page:](self, "_shouldDisplayNamedElement:page:", 0, 0))
      {
        -[RUIObjectModel _parentViewController](self, "_parentViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v23 != 0;
        if (v23)
          objc_msgSend(v22, "runAlertInController:completion:", v23, 0);

        v14 = 0;
      }
      else
      {
        if (_isInternalInstall())
        {
          _RUILoggingFacility();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v8;
            _os_log_impl(&dword_209E87000, v24, OS_LOG_TYPE_DEFAULT, "Link press for named element %@ did not find an element", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.RemoteUI"), 3, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 0;
      }

      if (!v10)
        goto LABEL_38;
    }
    v10[2](v10, v13, v14);
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  -[RUIObjectModel absoluteURLWithString:](self, "absoluteURLWithString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("openInSafari"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "BOOLValue"))
    v16 = objc_msgSend(v11, "rui_isSupportedSafariURL");
  else
    v16 = 0;

  if ((objc_msgSend(v11, "rui_isSupportedNativeURL") & 1) != 0 || v16)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209E87000, v18, OS_LOG_TYPE_DEFAULT, "RUIObjectModel - url provided is native", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    objc_msgSend(v19, "openSensitiveURL:withOptions:error:", v11, 0, &v51);
    v20 = v51;

    if (v20)
    {
      _RUILoggingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[RUIObjectModel _handleLinkPress:attributes:completion:].cold.1((uint64_t)v11, (uint64_t)v20, v21);

    }
    if (v10)
      v10[2](v10, v20 == 0, v20);

    goto LABEL_40;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("fetchLinksInModalWebView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "BOOLValue"))
  {

  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isModalHTMLView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (!v26)
    {
      if (v11)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v34 = objc_opt_respondsToSelector();

        if ((v34 & 1) != 0)
        {
          -[RUIObjectModel _startNavigationBarSpinnerIfNeededForAttributes:](self, "_startNavigationBarSpinnerIfNeededForAttributes:", v9);
          v35 = objc_loadWeakRetained((id *)&self->_delegate);
          v36 = objc_opt_respondsToSelector();

          if ((v36 & 1) != 0)
          {
            v37 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v37, "objectModel:willLoadLinkURL:attributes:", self, v11, v9);

          }
          v38 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("httpMethod"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __57__RUIObjectModel__handleLinkPress_attributes_completion___block_invoke;
          v48[3] = &unk_24C297D88;
          v48[4] = self;
          v49 = (RUIElement *)v9;
          v50 = v10;
          objc_msgSend(v38, "objectModel:pressedLink:httpMethod:completion:", self, v11, v39, v48);

          v40 = v49;
        }
        else
        {
          v41 = objc_loadWeakRetained((id *)&self->_delegate);
          v42 = objc_opt_respondsToSelector();

          if ((v42 & 1) == 0)
            goto LABEL_40;
          v43 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("httpMethod"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectModel:pressedLink:httpMethod:", self, v11, v44);

          if (_isInternalInstall())
          {
            _RUILoggingFacility();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209E87000, v45, OS_LOG_TYPE_DEFAULT, "DEPRECATED - Please use objectModel:pressedLink:httpMethod:completion:", buf, 2u);
            }

          }
          if (_isInternalInstall())
          {
            _RUILoggingFacility();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              activeElement = self->_activeElement;
              *(_DWORD *)buf = 138412290;
              v53 = activeElement;
              _os_log_impl(&dword_209E87000, v46, OS_LOG_TYPE_DEFAULT, "Removing active element %@", buf, 0xCu);
            }

          }
          v40 = self->_activeElement;
          self->_activeElement = 0;
        }

        goto LABEL_40;
      }
      NSLog(CFSTR("Warning: invalid URL %@"), v8);
      goto LABEL_40;
    }
  }
  if (v11)
  {
    v27 = objc_loadWeakRetained((id *)&self->_delegate);
    v28 = objc_opt_respondsToSelector();

    if ((v28 & 1) == 0
      || (v29 = objc_loadWeakRetained((id *)&self->_delegate),
          v30 = objc_msgSend(v29, "objectModel:shouldShowModalHTMLViewWithURL:", self, v11),
          v29,
          v30))
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dismissButtonLabel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dismissButtonAlignment"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("shouldScaleHTMLPageToFit"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIObjectModel showModalWebViewWithLinkURL:dismissButtonLabel:dismissButtonAlignment:scaleToFit:loadCompletion:dismissHandler:](self, "showModalWebViewWithLinkURL:dismissButtonLabel:dismissButtonAlignment:scaleToFit:loadCompletion:dismissHandler:", v11, v12, v31, objc_msgSend(v32, "BOOLValue"), v10, 0);

      goto LABEL_39;
    }
  }
LABEL_40:

}

void __57__RUIObjectModel__handleLinkPress_attributes_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_stopNavigationBarSpinnerIfNeededForAttributes:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_handleElementChange:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id WeakRetained;
  char v19;
  id v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("validationFunction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length")
    || (objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "acceptAutocorrection"),
        v10,
        -[RUIObjectModel validateWithFunction:](self, "validateWithFunction:", v9)))
  {
    objc_msgSend(v6, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("activationFunction"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "acceptAutocorrection");

      if (v6)
      {
        v25[0] = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[RUIObjectModel invokeScriptFunction:withArguments:](self, "invokeScriptFunction:withArguments:", v12, v14);

      }
      else
      {
        v17 = -[RUIObjectModel invokeScriptFunction:withArguments:](self, "invokeScriptFunction:withArguments:", v12, 0);
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v19 = objc_opt_respondsToSelector();

    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = v20;
    if ((v19 & 1) != 0)
    {
      objc_msgSend(v20, "objectModel:elementDidChange:", self, v6);
    }
    else
    {
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
      {
LABEL_14:
        if (v7)
          v7[2](v7, 1, 0);

        goto LABEL_17;
      }
      v21 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v6, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributes");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectModel:pressedButton:attributes:", self, v23, v24);

    }
    goto LABEL_14;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.RemoteUI"), 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v16);

  }
LABEL_17:

}

- (id)_pageContainingTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[RUIObjectModel allPages](self, "allPages", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "tableViewOM");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)showModalWebViewWithLinkURL:(id)a3 dismissButtonLabel:(id)a4 dismissButtonAlignment:(id)a5 scaleToFit:(BOOL)a6 loadCompletion:(id)a7 dismissHandler:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id webViewDismissHandler;
  int isInternalInstall;
  RemoteUIWebViewController *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v10 = a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  webViewDismissHandler = self->_webViewDismissHandler;
  isInternalInstall = _isInternalInstall();
  if (!webViewDismissHandler)
  {
    if (isInternalInstall)
    {
      _RUILoggingFacility();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "host");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = v23;
        _os_log_impl(&dword_209E87000, v22, OS_LOG_TYPE_DEFAULT, "Showing modal web view with domain '%@'", (uint8_t *)&v28, 0xCu);

      }
    }
    v24 = _Block_copy(v18);
    v25 = self->_webViewDismissHandler;
    self->_webViewDismissHandler = v24;

    v21 = -[RemoteUIWebViewController initWithNibName:bundle:]([RemoteUIWebViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[RUIObjectModel style](self, "style");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIWebViewController setStyle:](v21, "setStyle:", v26);

    -[RemoteUIWebViewController setDismissButtonAlignment:](v21, "setDismissButtonAlignment:", v16);
    -[RemoteUIWebViewController setDismissButtonLabel:](v21, "setDismissButtonLabel:", v15);
    -[RemoteUIWebViewController setScalesPageToFit:](v21, "setScalesPageToFit:", v10);
    -[RemoteUIWebViewController setDelegate:](v21, "setDelegate:", self);
    -[RUIObjectModel _parentViewController](self, "_parentViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "presentViewController:animated:completion:", v21, 1, 0);

    -[RemoteUIWebViewController loadURL:completion:](v21, "loadURL:completion:", v14, v17);
    goto LABEL_10;
  }
  if (isInternalInstall)
  {
    _RUILoggingFacility();
    v21 = (RemoteUIWebViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super.super.super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_209E87000, &v21->super.super.super, OS_LOG_TYPE_DEFAULT, "Error: Can't show a modal web view, already showing one!", (uint8_t *)&v28, 2u);
    }
LABEL_10:

  }
}

- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4
{
  id webViewDismissHandler;
  id v7;
  void (**v8)(void *, id);
  id v9;
  id v10;

  v10 = a4;
  webViewDismissHandler = self->_webViewDismissHandler;
  v7 = a3;
  v8 = (void (**)(void *, id))_Block_copy(webViewDismissHandler);
  v9 = self->_webViewDismissHandler;
  self->_webViewDismissHandler = 0;

  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v8)
    v8[2](v8, v10);

}

- (void)remoteUIWebViewControllerDidDismiss:(id)a3
{
  void (**webViewDismissHandler)(id, _QWORD, id);
  id v5;

  webViewDismissHandler = (void (**)(id, _QWORD, id))self->_webViewDismissHandler;
  if (webViewDismissHandler)
  {
    webViewDismissHandler[2](webViewDismissHandler, 0, a3);
    v5 = self->_webViewDismissHandler;
    self->_webViewDismissHandler = 0;

  }
}

- (void)alertView:(id)a3 pressedButton:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[RUIObjectModel _parentNavigationController](self, "_parentNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "viewControllers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __53__RUIObjectModel_alertView_pressedButton_completion___block_invoke;
  v19[3] = &unk_24C297E28;
  v20 = v14;
  v21 = v11;
  v22 = v8;
  v23 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v11;
  v18 = v14;
  -[RUIObjectModel activateElement:completion:](self, "activateElement:completion:", v10, v19);

}

void __53__RUIObjectModel_alertView_pressedButton_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v14 = v5;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "topViewController", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
LABEL_6:

      v5 = v14;
      goto LABEL_7;
    }
    objc_msgSend(*(id *)(a1 + 48), "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("activationFunction"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

LABEL_5:
      v7 = v6;
      goto LABEL_6;
    }
    objc_msgSend(*(id *)(a1 + 48), "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v14;
    if (!v12)
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "hasPasscodeView", v14);
      v5 = v14;
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "passcodeViewOM", v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "passcodeField");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "becomeFirstResponder");
        goto LABEL_5;
      }
    }
  }
LABEL_7:
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v14);
    v5 = v14;
  }

}

- (BOOL)tableViewOM:(id)a3 deleteRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id WeakRetained;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  void *v25;
  id v26;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectModelRowForIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel _pageContainingTableView:](self, "_pageContainingTableView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "deleteAction");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("deletionFunction"));
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (!v9 || !v8)
    goto LABEL_15;
  if (!(v10 | v12))
    goto LABEL_14;
  if (!objc_msgSend((id)v12, "length"))
  {
    objc_msgSend((id)v10, "objectForKey:", CFSTR("type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("linkDeleteAction"));

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v17)
    {
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        objc_msgSend((id)v10, "objectForKey:", CFSTR("url"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v10, "objectForKey:", CFSTR("httpMethod"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[RUIObjectModel absoluteURLWithString:](self, "absoluteURLWithString:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v28 = v20;
          v23 = objc_loadWeakRetained((id *)&self->_delegate);
          v13 = objc_msgSend(v23, "objectModel:page:deletedTableRow:atIndexPath:withURL:httpMethod:", self, v9, v8, v6, v22, v21);

          v20 = v28;
        }
        else
        {
          NSLog(CFSTR("Delete action has invalid URL : %@"), v20);
          v13 = 0;
        }

        goto LABEL_15;
      }
    }
    else
    {
      v24 = objc_opt_respondsToSelector();

      if ((v24 & 1) != 0)
      {
        objc_msgSend((id)v10, "objectForKey:", CFSTR("name"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_loadWeakRetained((id *)&self->_delegate);
        v13 = objc_msgSend(v26, "objectModel:page:deletedTableRow:atIndexPath:withName:", self, v9, v8, v6, v25);

        goto LABEL_15;
      }
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v29[0] = v8;
  v13 = 1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel invokeScriptFunction:withArguments:](self, "invokeScriptFunction:withArguments:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v15, "BOOLValue");

LABEL_15:
  return v13;
}

- (void)tableViewOMDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t j;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  id WeakRetained;
  char v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  id obja;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RUIObjectModel visiblePage](self, "visiblePage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIObjectModel updateInfo](self, "updateInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");

  v47 = v4;
  objc_msgSend(v4, "populatePostbackDictionary:", v7);
  v46 = (void *)v7;
  -[RUIObjectModel setUpdateInfo:](self, "setUpdateInfo:", v7);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  objc_msgSend(v5, "buttonItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v48 = v5;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
  if (v54)
  {
    v8 = *(_QWORD *)v69;
    v49 = *(_QWORD *)v69;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v69 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v9);
        objc_msgSend(v10, "attributes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("enabledFunction"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "length");
        objc_msgSend(v10, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("authRequired"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v13)
        {
          v17 = -[RUIObjectModel validateWithFunction:](self, "validateWithFunction:", v12);
          if (!v16)
            goto LABEL_21;
        }
        else
        {
          if ((v16 & 1) == 0)
            goto LABEL_22;
          LODWORD(v17) = 1;
        }
        objc_msgSend(v10, "attributes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("authUsernameFieldID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "attributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("authPasswordFieldID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v19, "length");
        if (!v22)
        {
          if (!objc_msgSend(v21, "length"))
          {
            v23 = 0;
            goto LABEL_20;
          }
LABEL_16:
          -[RUIObjectModel textInRowWithIdentifier:](self, "textInRowWithIdentifier:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v24, "length") == 0;

          v5 = v48;
          if (!v22)
            goto LABEL_20;
          goto LABEL_19;
        }
        -[RUIObjectModel textInRowWithIdentifier:](self, "textInRowWithIdentifier:", v19);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "length"))
        {
          if (objc_msgSend(v21, "length"))
            goto LABEL_16;
          v23 = 0;
        }
        else
        {
          v23 = 1;
        }
LABEL_19:

LABEL_20:
        v17 = v17 & ~v23;

        v8 = v49;
LABEL_21:
        objc_msgSend(v10, "attributes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setButton:enabled:", v25, v17);

LABEL_22:
        ++v9;
      }
      while (v54 != v9);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      v54 = v26;
    }
    while (v26);
  }

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v5, "accessoryViews");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v65 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v32, "objectModelDidChange:", self);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v29);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v47, "sections");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v55; ++j)
      {
        if (*(_QWORD *)v61 != v53)
          objc_enumerationMutation(obja);
        v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        objc_msgSend(v34, "rows");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v57;
          do
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v57 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
              objc_msgSend(v40, "attributes");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKey:", CFSTR("enabledFunction"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v42, "length"))
                objc_msgSend(v40, "setEnabled:", -[RUIObjectModel validateWithFunction:](self, "validateWithFunction:", v42));

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          }
          while (v37);
        }

      }
      v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v55);
  }

  objc_msgSend(v48, "notifyPageDidChangePublisher");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v44 = objc_opt_respondsToSelector();

  if ((v44 & 1) != 0)
  {
    v45 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v45, "objectModelDidChange:", self);

  }
}

- (void)tableViewOM:(id)a3 elementDidChange:(id)a4 action:(int)a5 completion:(id)a6
{
  uint64_t v7;
  RUIElement *v9;
  id v10;
  RUIElement *activeElement;
  RUIElement *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v7 = *(_QWORD *)&a5;
  v9 = (RUIElement *)a4;
  v10 = a6;
  activeElement = self->_activeElement;
  self->_activeElement = v9;
  v12 = v9;

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__RUIObjectModel_tableViewOM_elementDidChange_action_completion___block_invoke;
  v14[3] = &unk_24C2973C8;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[RUIObjectModel handleElementChange:action:completion:](self, "handleElementChange:action:completion:", v12, v7, v14);

}

void __65__RUIObjectModel_tableViewOM_elementDidChange_action_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = 0;

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (void)tableViewOMSubmitForm:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[RUIObjectModel visiblePage](self, "visiblePage", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  if (v6)
  {
    objc_msgSend(v8, "rightNavigationBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIObjectModel RUIPage:pressedNavBarButton:](self, "RUIPage:pressedNavBarButton:", v8, v7);

  }
}

- (void)passcodeViewOM:(id)a3 activatedElement:(id)a4 completion:(id)a5
{
  -[RUIObjectModel activateElement:completion:](self, "activateElement:completion:", a4, a5);
}

- (BOOL)webViewOM:(id)a3 shouldStartLoadWithRequest:(id)a4 navigationType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  RUIElement *v22;

  v8 = a3;
  if (a5)
    goto LABEL_11;
  v9 = a4;
  objc_msgSend(v9, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("xmlui")))
  {

    goto LABEL_6;
  }
  v13 = objc_msgSend(v11, "length");

  if (!v13)
  {
LABEL_6:
    objc_msgSend(v10, "relativeString");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("#%@"), v11);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v15 = (void *)v14;
  objc_msgSend(v8, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_opt_new();
  v20 = v19;

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("url"));
  objc_msgSend(v9, "HTTPMethod");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("httpMethod"));
  v22 = -[RUIElement initWithAttributes:parent:]([RUIElement alloc], "initWithAttributes:parent:", v20, v8);
  -[RUIObjectModel handleElementChange:action:completion:](self, "handleElementChange:action:completion:", v22, 2, 0);

LABEL_11:
  return a5 != 0;
}

- (void)_navigateToNextPageAnimated
{
  -[RUIObjectModel navigateToNextPageAnimated:](self, "navigateToNextPageAnimated:", (gAnimatedNavigationTransitions & 1) == 0);
}

- (void)navigateToNextPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  uint64_t currentPage;
  _BOOL8 v7;
  id WeakRetained;
  void *v9;
  id v10;

  v3 = a3;
  v5 = -[NSMutableArray count](self->_defaultPages, "count");
  currentPage = self->_currentPage;
  if (v5 <= currentPage + 1)
  {
    NSLog(CFSTR("warning: Next button specified on last page of content. Going nowhere."));
  }
  else
  {
    v7 = v5 > currentPage + 2;
    self->_currentPage = currentPage + 1;
    -[NSMutableArray objectAtIndex:](self->_defaultPages, "objectAtIndex:");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_displayedPages, "addObject:", v10);
    -[RUIObjectModel _populatePageNavItem:withNextButton:](self, "_populatePageNavItem:withNextButton:", v10, v7);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "parentViewControllerForObjectModel:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v10, v3);

  }
}

- (void)RUIPage:(id)a3 pressedNavBarButton:(id)a4
{
  RUIElement *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  RUIElement *activeElement;
  _QWORD v14[5];
  uint8_t buf[4];
  RUIElement *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (RUIElement *)a4;
  -[RUIElement attributes](v6, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("validationFunction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "length")
    || (objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "acceptAutocorrection"),
        v9,
        -[RUIObjectModel validateWithFunction:](self, "validateWithFunction:", v8)))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("nextBarItem")))
      -[RUIObjectModel _navigateToNextPageAnimated](self, "_navigateToNextPageAnimated");
    if (-[RUIElement isEqual:](self->_activeElement, "isEqual:", v6))
    {
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, "Already handling activation for barButtonItem: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      objc_storeStrong((id *)&self->_activeElement, a4);
      if (_isInternalInstall())
      {
        _RUILoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          activeElement = self->_activeElement;
          *(_DWORD *)buf = 138412290;
          v16 = activeElement;
          _os_log_impl(&dword_209E87000, v12, OS_LOG_TYPE_DEFAULT, "Active barButtonItem set %@", buf, 0xCu);
        }

      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __46__RUIObjectModel_RUIPage_pressedNavBarButton___block_invoke;
      v14[3] = &unk_24C2974D8;
      v14[4] = self;
      -[RUIObjectModel handleElementChange:action:completion:](self, "handleElementChange:action:completion:", v6, 2, v14);
    }

  }
}

void __46__RUIObjectModel_RUIPage_pressedNavBarButton___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_209E87000, v2, OS_LOG_TYPE_DEFAULT, "Removing active barButtonItem %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 200);
  *(_QWORD *)(v4 + 200) = 0;

}

- (void)RUIPage:(id)a3 toggledEditing:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "objectModel:page:toggledEditing:", self, v9, v4);

  }
}

- (unint64_t)supportedInterfaceOrientationsForRUIPage:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  unint64_t v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_msgSend(v7, "supportedInterfaceOrientationsForObjectModel:page:", self, v4);

  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (NSDictionary)updateInfo
{
  return self->_updateInfo;
}

- (RUIObjectModelDelegate)delegate
{
  return (RUIObjectModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)defaultPages
{
  return &self->_defaultPages->super;
}

- (NSDictionary)namedPages
{
  return &self->_namedPages->super;
}

- (RUIElement)activeElement
{
  return self->_activeElement;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)scriptURL
{
  return self->_scriptURL;
}

- (void)setScriptURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)inlineScript
{
  return self->_inlineScript;
}

- (void)setInlineScript:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)validationFunction
{
  return self->_validationFunction;
}

- (void)setValidationFunction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDictionary)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)idOfObjectModelToReplace
{
  return self->_idOfObjectModelToReplace;
}

- (void)setIdOfObjectModelToReplace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (int)refreshDelay
{
  return self->_refreshDelay;
}

- (void)setRefreshDelay:(int)a3
{
  self->_refreshDelay = a3;
}

- (NSString)refreshURL
{
  return self->_refreshURL;
}

- (void)setRefreshURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)nextButtonStyle
{
  return self->_nextButtonStyle;
}

- (void)setNextButtonStyle:(int64_t)a3
{
  self->_nextButtonStyle = a3;
}

- (RUIStyle)style
{
  return self->_style;
}

- (NSString)identifierMarkingStackRemovalAfterPush
{
  return self->_identifierMarkingStackRemovalAfterPush;
}

- (void)setIdentifierMarkingStackRemovalAfterPush:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (RUIElement)elementForActivityIndicator
{
  return self->_elementForActivityIndicator;
}

- (NSString)authPasswordEquivalent
{
  return self->_authPasswordEquivalent;
}

- (void)setAuthPasswordEquivalent:(id)a3
{
  objc_storeStrong((id *)&self->_authPasswordEquivalent, a3);
}

- (NSString)authPasswordFieldID
{
  return self->_authPasswordFieldID;
}

- (void)setAuthPasswordFieldID:(id)a3
{
  objc_storeStrong((id *)&self->_authPasswordFieldID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authPasswordFieldID, 0);
  objc_storeStrong((id *)&self->_authPasswordEquivalent, 0);
  objc_storeStrong((id *)&self->_elementForActivityIndicator, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_identifierMarkingStackRemovalAfterPush, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_idOfObjectModelToReplace, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activeElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateInfo, 0);
  objc_storeStrong(&self->_webViewDismissHandler, 0);
  objc_storeStrong((id *)&self->_httpHeaders, 0);
  objc_storeStrong((id *)&self->_namedAlerts, 0);
  objc_storeStrong((id *)&self->_primaryAlert, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_refreshURL, 0);
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_displayedPages, 0);
  objc_storeStrong((id *)&self->_namedPages, 0);
  objc_storeStrong((id *)&self->_defaultPages, 0);
  objc_storeStrong((id *)&self->_validationFunction, 0);
  objc_storeStrong((id *)&self->_inlineScript, 0);
  objc_storeStrong((id *)&self->_scriptURL, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_logException:(OpaqueJSValue *)a3
{
  RUILogException(self->_ctx, a3);
}

- (BOOL)prepareScriptContext
{
  NSUInteger v3;

  v3 = -[NSString length](self->_inlineScript, "length");
  if (v3 && !self->_didInitializeScript)
  {
    -[RUIObjectModel runScript](self, "runScript");
    self->_didInitializeScript = 1;
  }
  return v3 != 0;
}

- (BOOL)validateWithFunction:(id)a3
{
  __CFString *v4;
  OpaqueJSValue *GlobalObject;
  OpaqueJSValue *ObjectProperty;
  const OpaqueJSValue *v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  const char *v12;
  JSValueRef exception;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  if (!-[RUIObjectModel prepareScriptContext](self, "prepareScriptContext"))
  {
    if (!_isInternalInstall())
      goto LABEL_21;
    _RUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    v12 = "Validation with '%@': No script context!";
LABEL_19:
    _os_log_impl(&dword_209E87000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    goto LABEL_20;
  }
  if (!-[__CFString length](v4, "length"))
  {
    if (!_isInternalInstall())
      goto LABEL_21;
    _RUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    v12 = "Validation with '%@': Empty function!";
    goto LABEL_19;
  }
  GlobalObject = JSContextGetGlobalObject(self->_ctx);
  ObjectProperty = getObjectProperty(self->_ctx, GlobalObject, v4);
  if (!ObjectProperty)
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        v12 = "Validation with '%@': Invalid script!";
        goto LABEL_19;
      }
LABEL_20:

    }
LABEL_21:
    LOBYTE(v8) = 1;
    goto LABEL_22;
  }
  exception = 0;
  v7 = JSObjectCallAsFunction(self->_ctx, ObjectProperty, 0, 0, 0, &exception);
  -[RUIObjectModel _logException:](self, "_logException:", exception);
  if (!JSValueIsBoolean(self->_ctx, v7))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Validation with '%@': Didn't return a BOOL!", buf, 0xCu);
      }
      LOBYTE(v8) = 1;
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  v8 = JSValueToBoolean(self->_ctx, v7);
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("false");
      if (v8)
        v10 = CFSTR("true");
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_209E87000, v9, OS_LOG_TYPE_DEFAULT, "Validation with '%@': %@", buf, 0x16u);
    }
LABEL_27:

  }
LABEL_22:

  return v8;
}

- (id)objectForJSValue:(OpaqueJSValue *)a3
{
  _BOOL4 IsString;
  OpaqueJSContext *ctx;
  JSStringRef v7;
  OpaqueJSString *v8;
  const __CFAllocator *Default;
  __CFString *v10;
  OpaqueJSString *v11;
  _BOOL4 IsBoolean;
  OpaqueJSContext *v13;
  uint64_t v14;
  _BOOL4 IsNumber;
  OpaqueJSContext *v16;
  double v17;
  _BOOL4 IsObject;
  OpaqueJSContext *v19;
  OpaqueJSValue *GlobalObject;
  OpaqueJSString *v21;
  OpaqueJSValue *Property;
  OpaqueJSString *v23;
  const OpaqueJSValue *v24;
  uint64_t v25;
  unsigned int v26;
  void *v27;

  IsString = JSValueIsString(self->_ctx, a3);
  ctx = self->_ctx;
  if (!IsString)
  {
    IsBoolean = JSValueIsBoolean(ctx, a3);
    v13 = self->_ctx;
    if (IsBoolean)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", JSValueToBoolean(v13, a3));
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      IsNumber = JSValueIsNumber(v13, a3);
      v16 = self->_ctx;
      if (!IsNumber)
      {
        IsObject = JSValueIsObject(v16, a3);
        v19 = self->_ctx;
        if (IsObject)
        {
          GlobalObject = JSContextGetGlobalObject(v19);
          v21 = JSStringCreateWithUTF8CString("Array");
          Property = JSObjectGetProperty(self->_ctx, GlobalObject, v21, 0);
          v10 = 0;
          if (JSValueIsInstanceOfConstructor(self->_ctx, a3, Property, 0))
          {
            v23 = JSStringCreateWithUTF8CString("length");
            v24 = JSObjectGetProperty(self->_ctx, a3, v23, 0);
            v10 = 0;
            if (JSValueIsNumber(self->_ctx, v24))
            {
              v25 = (int)JSValueToNumber(self->_ctx, v24, 0);
              if ((int)v25 < 1)
              {
                v10 = 0;
              }
              else
              {
                v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v25);
                v26 = 0;
                do
                {
                  -[RUIObjectModel objectForJSValue:](self, "objectForJSValue:", JSObjectGetPropertyAtIndex(self->_ctx, a3, v26, 0));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v27)
                    -[__CFString addObject:](v10, "addObject:", v27);

                  ++v26;
                }
                while ((_DWORD)v25 != v26);
              }
            }
            JSStringRelease(v23);
          }
          v11 = v21;
          goto LABEL_4;
        }
        if (!JSValueIsUndefined(v19, a3))
          NSLog(CFSTR("xmlui objectForJSValue returned unknown type!"));
LABEL_21:
        v10 = 0;
        return v10;
      }
      v17 = JSValueToNumber(v16, a3, 0);
      *(float *)&v17 = v17;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v17);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (__CFString *)v14;
    return v10;
  }
  v7 = JSValueToStringCopy(ctx, a3, 0);
  if (!v7)
    goto LABEL_21;
  v8 = v7;
  Default = CFAllocatorGetDefault();
  v10 = (__CFString *)JSStringCopyCFString(Default, v8);
  v11 = v8;
LABEL_4:
  JSStringRelease(v11);
  return v10;
}

- (id)invokeScriptFunction:(id)a3 withArguments:(id)a4
{
  __CFString *v6;
  id v7;
  OpaqueJSValue *GlobalObject;
  const OpaqueJSValue *ObjectProperty;
  OpaqueJSValue *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  JSValueRef *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __CFString *v22;
  OpaqueJSString *v23;
  JSValueRef String;
  OpaqueJSString *v25;
  OpaqueJSContext *ctx;
  float v27;
  const OpaqueJSContext *v28;
  JSValueRef Number;
  NSObject *v30;
  const char *v31;
  void *v32;
  JSValueRef v34;
  OpaqueJSValue *v35;
  id v36;
  __CFString *v37;
  id obj;
  JSValueRef *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  _BYTE buf[24];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  if (!-[RUIObjectModel prepareScriptContext](self, "prepareScriptContext"))
  {
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      v31 = "Script invocation for '%@': No script context!";
LABEL_36:
      _os_log_impl(&dword_209E87000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
      goto LABEL_37;
    }
LABEL_38:
    v32 = 0;
    goto LABEL_39;
  }
  if (!-[__CFString length](v6, "length"))
    goto LABEL_38;
  GlobalObject = JSContextGetGlobalObject(self->_ctx);
  ObjectProperty = getObjectProperty(self->_ctx, GlobalObject, v6);
  if (!ObjectProperty)
  {
    if (!_isInternalInstall())
      goto LABEL_38;
    _RUILoggingFacility();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    v31 = "Script invocation for '%@': Invalid script!";
    goto LABEL_36;
  }
  v10 = ObjectProperty;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v12)
  {
    v13 = v12;
    v35 = v10;
    v36 = v7;
    v37 = v6;
    v14 = 0;
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
          }
        }
        ++v14;
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v13);

    if (v14 < 1)
    {
      v17 = 0;
      v7 = v36;
      goto LABEL_46;
    }
    v17 = (JSValueRef *)malloc_type_calloc(v14, 8uLL, 0x6004044C4A2DFuLL);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v11;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v40 = *(_QWORD *)v42;
      v39 = v17;
LABEL_18:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v42 != v40)
          objc_enumerationMutation(obj);
        if (v20 == v14)
          goto LABEL_32;
        v22 = *(__CFString **)(*((_QWORD *)&v41 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          ctx = self->_ctx;
          -[__CFString floatValue](v22, "floatValue");
          v28 = ctx;
          v17 = v39;
          Number = JSValueMakeNumber(v28, v27);
          goto LABEL_28;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          Number = (JSValueRef)-[__CFString JSValueForContext:](v22, "JSValueForContext:", self->_ctx);
LABEL_28:
          String = Number;
LABEL_29:
          v17[v20++] = String;
        }
        if (v19 == ++v21)
        {
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v19)
            goto LABEL_18;
          goto LABEL_32;
        }
      }
      v23 = JSStringCreateWithCFString(v22);
      String = JSValueMakeString(self->_ctx, v23);
      v25 = v23;
      v17 = v39;
      JSStringRelease(v25);
      goto LABEL_29;
    }
LABEL_32:
    v7 = v36;
    v6 = v37;
  }
  else
  {
    v14 = 0;
    v17 = 0;
  }

LABEL_46:
  *(_QWORD *)buf = 0;
  v34 = JSObjectCallAsFunction(self->_ctx, v10, 0, v14, v17, (JSValueRef *)buf);
  -[RUIObjectModel _logException:](self, "_logException:", *(_QWORD *)buf);
  if (v17)
    free(v17);
  -[RUIObjectModel objectForJSValue:](self, "objectForJSValue:", v34, v35, v36, v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:

  return v32;
}

- (OpaqueJSContext)jsContextRef
{
  OpaqueJSContext *result;
  OpaqueJSContext *v4;

  result = self->_ctx;
  if (!result)
  {
    v4 = JSGlobalContextCreate(0);
    -[RUIObjectModel setJSGlobalContext:](self, "setJSGlobalContext:", v4);
    JSGlobalContextRelease(v4);
    return self->_ctx;
  }
  return result;
}

- (void)runScript
{
  __CFString *v3;
  OpaqueJSContext *v4;
  OpaqueJSValue *GlobalObject;
  OpaqueJSClass *v6;
  const OpaqueJSValue *v7;
  OpaqueJSString *v8;
  OpaqueJSString *v9;
  JSValueRef v10;
  JSValueRef exception;

  v3 = self->_inlineScript;
  v4 = -[RUIObjectModel jsContextRef](self, "jsContextRef");
  GlobalObject = JSContextGetGlobalObject(v4);
  v6 = RUIJSObjectModel_class();
  v7 = JSObjectMake(v4, v6, self);
  v8 = JSStringCreateWithCFString(CFSTR("xmlui"));
  exception = 0;
  JSObjectSetProperty(v4, GlobalObject, v8, v7, 0xAu, &exception);
  -[RUIObjectModel _logException:](self, "_logException:", exception);
  JSStringRelease(v8);
  v10 = 0;
  v9 = JSStringCreateWithCFString(v3);
  JSEvaluateScript(v4, v9, 0, 0, 0, &v10);
  -[RUIObjectModel _logException:](self, "_logException:", v10);

  JSStringRelease(v9);
}

- (void)setJSGlobalContext:(OpaqueJSContext *)a3
{
  OpaqueJSContext *ctx;

  ctx = self->_ctx;
  if (ctx != a3)
  {
    if (ctx)
      JSGlobalContextRelease(ctx);
    if (a3)
      JSGlobalContextRetain(a3);
    self->_ctx = a3;
  }
}

- (void)initializeSwift
{
  RUIObjectModel *v2;

  v2 = self;
  RUIObjectModel.initializeSwift()();

}

- (void)setDecodingUserInfo:(id)a3
{
  id v4;
  RUIObjectModel *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = self;
  sub_209EE5AE8((uint64_t)&v6, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&off_2545B94A8);

}

- (void)jsInterfaceForElementId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  RUIObjectModel *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = sub_209F672C4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  RUIObjectModel.jsInterface(for:)(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  return v9;
}

- (void)notifyXMLUIDataChange
{
  RUIObjectModel *v2;
  uint64_t v3;

  v2 = self;
  sub_209EE596C((uint64_t)&type metadata for XMLUIDataAssociatedKey, (uint64_t)&off_2545B93A0, (uint64_t)&v3);
  type metadata accessor for XMLUIData();
  sub_209EE1BF4();
  sub_209F66C70();
  swift_release();
  sub_209F66C88();

  swift_release();
}

- (void)setActivityIndicatorStatus:(BOOL)a3 forElement:(id)a4
{
  RUIElement *v6;
  RUIObjectModel *v7;

  v6 = (RUIElement *)a4;
  v7 = self;
  RUIObjectModel.setActivityIndicatorStatus(_:forElement:)(a3, v6);

}

void __78__RUIObjectModel_handleAppleIDAuthenticationIfNeededForAttributes_completion___block_invoke_2_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAKAuthenticationUsernameKey(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("RUIObjectModel.m"), 55, CFSTR("%s"), OUTLINED_FUNCTION_0_0());

  __break(1u);
}

void __56__RUIObjectModel_handleElementChange_action_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 56);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_209E87000, a2, OS_LOG_TYPE_ERROR, "No url/action attribute specified or action (%u) not activated.", (uint8_t *)v3, 8u);
}

- (void)_handleLinkPress:(uint64_t)a1 attributes:(uint64_t)a2 completion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_209E87000, log, OS_LOG_TYPE_ERROR, "Error opening sensitive url %@ - %@", (uint8_t *)&v3, 0x16u);
}

@end
