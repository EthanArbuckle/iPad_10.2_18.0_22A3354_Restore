@implementation ICSEContainerViewController

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSEContainerViewController;
  -[ICSEContainerViewController viewDidLoad](&v3, "viewDidLoad");
  -[ICSEContainerViewController setUpForIsShowingTableContainer:](self, "setUpForIsShowingTableContainer:", self->_isShowingTableContainer);
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
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
  id v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v5 = a3;
  v7 = objc_opt_class(UINavigationController, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationViewController"));

  v9 = ICDynamicCast(v7, v8);
  v39 = (id)objc_claimAutoreleasedReturnValue(v9);

  v11 = objc_opt_class(ICSEMainViewController, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "viewControllers"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v14 = ICDynamicCast(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v17 = objc_opt_class(ICSETableViewController, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "viewControllers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
  v20 = ICDynamicCast(v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v15)
  {
    if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationController"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "navigationBar"));
      objc_msgSend(v24, "setTintColor:", v22);

    }
    objc_msgSend(v15, "setContainerViewController:", self);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController rootViewController](self, "rootViewController"));
    objc_msgSend(v25, "setMainViewController:", v15);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController tableViewController](self, "tableViewController"));
    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController tableViewController](self, "tableViewController"));
      objc_msgSend(v27, "setDelegate:", v15);

    }
    -[ICSEContainerViewController setMainViewController:](self, "setMainViewController:", v15);
  }
  else if (v21)
  {
    objc_msgSend(v21, "setContainerViewController:", self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "managedObjectContext"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContextSortedByAccountType:](ICAccount, "allActiveAccountsInContextSortedByAccountType:", v29));
    v31 = objc_msgSend(v30, "count");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = v32;
    if ((unint64_t)v31 >= 2)
      v34 = CFSTR("Choose Location");
    else
      v34 = CFSTR("Choose Folder");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", v34, &stru_1000DAF38, 0));
    objc_msgSend(v21, "setTitle:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController rootViewController](self, "rootViewController"));
    objc_msgSend(v36, "setTableViewController:", v21);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController mainViewController](self, "mainViewController"));
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController mainViewController](self, "mainViewController"));
      objc_msgSend(v21, "setDelegate:", v38);

    }
    -[ICSEContainerViewController setTableViewController:](self, "setTableViewController:", v21);
  }

}

- (void)setIsShowingTableContainer:(BOOL)a3
{
  if (self->_isShowingTableContainer != a3)
  {
    self->_isShowingTableContainer = a3;
    -[ICSEContainerViewController setUpForIsShowingTableContainer:](self, "setUpForIsShowingTableContainer:");
  }
}

- (void)setUpForIsShowingTableContainer:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  _QWORD v19[5];
  BOOL v20;
  BOOL v21;
  _QWORD v22[7];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  if (a3)
    v5 = 0.0;
  else
    v5 = 1.0;
  if (a3)
    v6 = 1.0;
  else
    v6 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController mainContainerView](self, "mainContainerView"));
  objc_msgSend(v7, "setHidden:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController tableViewContainerView](self, "tableViewContainerView"));
  objc_msgSend(v8, "setHidden:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController mainContainerView](self, "mainContainerView"));
  objc_msgSend(v9, "setAlpha:", v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController tableViewContainerView](self, "tableViewContainerView"));
  objc_msgSend(v10, "setAlpha:", v5);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController view](self, "view"));
  objc_msgSend(v11, "setUserInteractionEnabled:", 0);

  if (v3)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEContainerViewController tableViewController](self, "tableViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers"));

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "willAppearInContainer:", self);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }

  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100022A58;
  v22[3] = &unk_1000D6640;
  v22[4] = self;
  *(double *)&v22[5] = v5;
  *(double *)&v22[6] = v6;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100022AC4;
  v19[3] = &unk_1000D6668;
  v19[4] = self;
  v20 = v3;
  v21 = !v3;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v19, 0.0);
}

- (ICSERootViewController)rootViewController
{
  return (ICSERootViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (void)setRootViewController:(id)a3
{
  objc_storeWeak((id *)&self->_rootViewController, a3);
}

- (ICSEMainViewController)mainViewController
{
  return self->_mainViewController;
}

- (void)setMainViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mainViewController, a3);
}

- (ICSETableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (BOOL)isShowingTableContainer
{
  return self->_isShowingTableContainer;
}

- (UIView)mainContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_mainContainerView);
}

- (void)setMainContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_mainContainerView, a3);
}

- (UIView)tableViewContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_tableViewContainerView);
}

- (void)setTableViewContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewContainerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableViewContainerView);
  objc_destroyWeak((id *)&self->_mainContainerView);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_destroyWeak((id *)&self->_rootViewController);
}

@end
