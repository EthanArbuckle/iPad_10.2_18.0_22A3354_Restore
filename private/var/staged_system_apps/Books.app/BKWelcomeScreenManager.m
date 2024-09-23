@implementation BKWelcomeScreenManager

- (void)_sequenceFinished
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint8_t v11[16];

  v3 = BSUIWelcomeScreenLog(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_sequenceFinished", v11, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager completion](self, "completion"));
  if (v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager completion](self, "completion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager tabIdentifierToShow](self, "tabIdentifierToShow"));
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
  else
  {
    v10 = BSUIWelcomeScreenLog(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      sub_1006A20DC((os_log_t)v8);
  }

}

- (id)completion
{
  return self->_completion;
}

- (NSString)tabIdentifierToShow
{
  return self->_tabIdentifierToShow;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  BKWelcomeScreenManager *v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  BKWelcomeScreenManager *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  v6 = BSUIWelcomeScreenLog(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "runWithCompletion: Start", buf, 2u);
  }

  if (v4)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100063DB4;
    v12 = &unk_1008EBFE0;
    v13 = self;
    v14 = v4;
    v8 = self;
    -[BKWelcomeScreenManager setCompletion:](v8, "setCompletion:", &v9);
    -[BKWelcomeScreenManager _setupViewControllers](v8, "_setupViewControllers", v9, v10, v11, v12, v13);

  }
}

- (id)nextItemHavingWelcomeScreenToShow
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "launchedToTest");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager currentItem](self, "currentItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShowAfterItem:](self, "nextItemHavingWelcomeScreenToShowAfterItem:", v6));

  }
  return v5;
}

- (BKWelcomeScreenManager)initWithItems:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BKWelcomeScreenManager *v7;
  NSArray *v8;
  NSArray *items;
  uint64_t v10;
  NSMapTable *viewControllers;
  BSUIWelcomeScreenItem *currentItem;
  uint64_t v13;
  BKSlideTransition *defaultSlideAnimator;
  NSString *tabIdentifierToShow;
  UIViewController *lastViewController;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKWelcomeScreenManager;
  v7 = -[BKWelcomeScreenManager init](&v18, "init");
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    items = v7->_items;
    v7->_items = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    viewControllers = v7->_viewControllers;
    v7->_viewControllers = (NSMapTable *)v10;

    currentItem = v7->_currentItem;
    v7->_currentItem = 0;

    v13 = objc_claimAutoreleasedReturnValue(+[BKSlideTransition transitionWithDirection:](BKSlideTransition, "transitionWithDirection:", !v4));
    defaultSlideAnimator = v7->_defaultSlideAnimator;
    v7->_defaultSlideAnimator = (BKSlideTransition *)v13;

    tabIdentifierToShow = v7->_tabIdentifierToShow;
    v7->_tabIdentifierToShow = 0;

    lastViewController = v7->_lastViewController;
    v7->_lastViewController = 0;

    objc_storeWeak(&qword_1009F50E0, v7);
  }

  return v7;
}

- (BOOL)didShowWelcome
{
  return self->_didShowWelcome;
}

- (void)dealloc
{
  id completion;
  objc_super v4;

  completion = self->_completion;
  self->_completion = 0;

  v4.receiver = self;
  v4.super_class = (Class)BKWelcomeScreenManager;
  -[BKWelcomeScreenManager dealloc](&v4, "dealloc");
}

- (void)_setupViewControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShow](self, "nextItemHavingWelcomeScreenToShow"));
  if (v3)
  {
    objc_storeStrong((id *)&self->_currentItem, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager welcomeScreenViewControllerFromItem:](self, "welcomeScreenViewControllerFromItem:", v3));
    v6 = BSUIWelcomeScreenLog(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_setupViewControllers: showing: %{public}@", buf, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    objc_msgSend(v8, "setNavigationBarHidden:animated:", objc_msgSend(v3, "welcomeScreenShouldDisplayNavigationBar") ^ 1, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    v12 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v9, "setViewControllers:animated:", v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    objc_msgSend(v11, "setNeedsUpdateOfSupportedInterfaceOrientations");

    self->_didShowWelcome = 1;
  }
  else
  {
    self->_didShowWelcome = 0;
    -[BKWelcomeScreenManager _sequenceFinished](self, "_sequenceFinished");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabIdentifierToShow, 0);
  objc_storeStrong((id *)&self->_lastViewController, 0);
  objc_storeStrong((id *)&self->_defaultSlideAnimator, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

+ (id)sharedManager
{
  return objc_loadWeakRetained(&qword_1009F50E0);
}

- (UINavigationController)navigationController
{
  UINavigationController *navigationController;
  BKUpgradeViewController *v4;
  BKWelcomeNavigationController *v5;
  void *v6;
  id v7;
  void *v8;
  UINavigationController *v9;

  navigationController = self->_navigationController;
  if (!navigationController)
  {
    v4 = objc_alloc_init(BKUpgradeViewController);
    v5 = -[BKWelcomeNavigationController initWithRootViewController:]([BKWelcomeNavigationController alloc], "initWithRootViewController:", v4);
    -[BKWelcomeNavigationController setDelegate:](v5, "setDelegate:", self);
    -[BKWelcomeNavigationController setBkDelegate:](v5, "setBkDelegate:", self);
    -[BKWelcomeNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[BKWelcomeNavigationController setModalTransitionStyle:](v5, "setModalTransitionStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController presentationController](v5, "presentationController"));
    objc_msgSend(v6, "setDelegate:", self);

    -[BKWelcomeNavigationController setNavigationBarHidden:animated:](v5, "setNavigationBarHidden:animated:", 1, 0);
    v7 = objc_alloc_init((Class)UINavigationBarAppearance);
    objc_msgSend(v7, "configureWithTransparentBackground");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeNavigationController navigationBar](v5, "navigationBar"));
    objc_msgSend(v8, "setStandardAppearance:", v7);

    v9 = self->_navigationController;
    self->_navigationController = &v5->super;

    navigationController = self->_navigationController;
  }
  return navigationController;
}

- (id)nextItemHavingWelcomeScreenToShowAfterItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items"));
  v6 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    while (1)
    {
      if (v6 == (id)0x7FFFFFFFFFFFFFFFLL || v9 > (unint64_t)v6)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v9));
        v13 = objc_msgSend(v12, "welcomeScreenShouldShow");

        if (v13)
          break;
      }
      ++v9;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items"));
      v15 = objc_msgSend(v14, "count");

      if (v9 >= (unint64_t)v15)
        goto LABEL_10;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v9));

  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

- (BOOL)moreScreensComing
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShow](self, "nextItemHavingWelcomeScreenToShow"));
  v3 = v2 != 0;

  return v3;
}

- (void)_presentTheNextViewController
{
  void *v3;
  void *v4;
  void *v5;
  UIViewController *v6;
  UIViewController *lastViewController;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShow](self, "nextItemHavingWelcomeScreenToShow"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager welcomeScreenViewControllerFromItem:](self, "welcomeScreenViewControllerFromItem:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    v6 = (UIViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
    lastViewController = self->_lastViewController;
    self->_lastViewController = v6;

    v10 = BSUIWelcomeScreenLog(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_presentTheNextViewController: showing: %{public}@", buf, 0xCu);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    objc_msgSend(v12, "setNavigationBarHidden:animated:", objc_msgSend(v3, "welcomeScreenShouldDisplayNavigationBar") ^ 1, 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    v16 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v13, "setViewControllers:animated:", v14, 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager navigationController](self, "navigationController"));
    objc_msgSend(v15, "setNeedsUpdateOfSupportedInterfaceOrientations");

  }
  else
  {
    -[BKWelcomeScreenManager finishCurrentItem](self, "finishCurrentItem");
    -[BKWelcomeScreenManager _sequenceFinished](self, "_sequenceFinished");
  }

}

- (id)welcomeScreenViewControllerFromItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager viewControllers](self, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    objc_initWeak(&location, self);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100143F10;
    v14 = &unk_1008E9B28;
    objc_copyWeak(&v15, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "welcomeScreenViewControllerWithCompletion:", &v11));
    if ((objc_opt_respondsToSelector(v4, "welcomeScreenViewController:configureWithLastScreen:") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShowAfterItem:](self, "nextItemHavingWelcomeScreenToShowAfterItem:", v4, v11, v12, v13, v14));
      v8 = v7 == 0;

      objc_msgSend(v4, "welcomeScreenViewController:configureWithLastScreen:", v6, v8);
    }
    objc_msgSend(v6, "setModalPresentationStyle:", 2, v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager viewControllers](self, "viewControllers"));
    objc_msgSend(v9, "setObject:forKey:", v6, v4);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)finishCurrentItem
{
  BSUIWelcomeScreenItem *v3;
  BSUIWelcomeScreenItem *currentItem;
  UIViewController *lastViewController;

  if ((objc_opt_respondsToSelector(self->_currentItem, "welcomeScreenViewControllerDidDismiss") & 1) != 0)
    -[BSUIWelcomeScreenItem welcomeScreenViewControllerDidDismiss](self->_currentItem, "welcomeScreenViewControllerDidDismiss");
  v3 = (BSUIWelcomeScreenItem *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager nextItemHavingWelcomeScreenToShow](self, "nextItemHavingWelcomeScreenToShow"));
  currentItem = self->_currentItem;
  self->_currentItem = v3;

  lastViewController = self->_lastViewController;
  self->_lastViewController = 0;

}

+ (double)transitionDuration
{
  return 0.3;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager lastViewController](self, "lastViewController", a3, a4));
  if ((objc_opt_respondsToSelector(v4, "interactionController") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactionController"));
  else
    v5 = 0;

  return v5;
}

- (double)transitionDuration:(id)a3
{
  double result;

  +[BKWelcomeScreenManager transitionDuration](BKWelcomeScreenManager, "transitionDuration", a3);
  return result;
}

- (void)animateTransition:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  if ((objc_opt_respondsToSelector(v4, "animateTransition:") & 1) != 0)
  {
    objc_msgSend(v4, "animateTransition:", v6);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager defaultSlideAnimator](self, "defaultSlideAnimator"));
    objc_msgSend(v5, "animateTransition:", v6);

  }
}

- (void)animationEnded:(BOOL)a3
{
  if (a3)
    -[BKWelcomeScreenManager finishCurrentItem](self, "finishCurrentItem");
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (CGSize)preferredContentSizeForNavigationController:(id)a3
{
  double height;
  double width;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager items](self, "items", a3, 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "welcomeScreenShouldShow"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKWelcomeScreenManager welcomeScreenViewControllerFromItem:](self, "welcomeScreenViewControllerFromItem:", v11));
          objc_msgSend(v12, "preferredContentSize");
          if (width < v13)
            width = v13;
          if (height < v14)
            height = v14;

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (NSMapTable)viewControllers
{
  return self->_viewControllers;
}

- (BSUIWelcomeScreenItem)currentItem
{
  return self->_currentItem;
}

- (BKSlideTransition)defaultSlideAnimator
{
  return self->_defaultSlideAnimator;
}

- (void)setDefaultSlideAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSlideAnimator, a3);
}

- (UIViewController)lastViewController
{
  return self->_lastViewController;
}

- (void)setTabIdentifierToShow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
