@implementation MailboxPickerOutlineController

- (void)_presentMessageListViewControllerForMailboxes:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController messageListContainerViewController](self, "messageListContainerViewController"));
  if (objc_msgSend(v6, "isEditing"))
    objc_msgSend(v6, "setEditing:", 0);
  objc_msgSend(v6, "setMailboxes:forceReload:", v9, -[MailboxPickerOutlineController forceReloadMessageListViewController](self, "forceReloadMessageListViewController"));
  -[MailboxPickerOutlineController setForceReloadMessageListViewController:](self, "setForceReloadMessageListViewController:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "splitViewController"));
  objc_msgSend(v8, "showMessageListViewController:animated:completion:", 1, v4, 0);

}

- (void)_popToMailboxPickerController:(BOOL)a3 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  MailboxPickerOutlineController *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  char *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;

  v4 = a4;
  if (a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    v7 = (MailboxPickerOutlineController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topViewController"));

    if (v7 == self)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
      v11 = objc_msgSend(v10, "isCollapsed");

      if ((v11 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
        v13 = (char *)objc_msgSend(v12, "displayMode");

        if ((unint64_t)(v13 - 5) <= 1)
        {
          v14 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = _UISplitViewControllerDisplayModeDescription(v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            *(_DWORD *)buf = 138412290;
            v23 = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Hiding mailbox picker. UISplitViewControllerDisplayMode: %@", buf, 0xCu);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000D57D4;
          v21[3] = &unk_10051AA98;
          v21[4] = self;
          v18 = objc_msgSend(v17, "afterDelay:performBlock:", v21, 0.25);

        }
      }
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
      v9 = objc_msgSend(v8, "popToViewController:animated:", self, v4);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mailboxesForMessageList"));
  -[MailboxPickerOutlineController _presentMessageListViewControllerForMailboxes:animated:](self, "_presentMessageListViewControllerForMailboxes:animated:", v20, v4);

}

- (void)mailboxCollectionHelper:(id)a3 wantsToSelectMailbox:(id)a4 account:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  MailboxPickerOutlineController *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController", a3, a4, a5));
  v9 = (MailboxPickerOutlineController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topViewController"));

  if (v9 != self)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    v11 = objc_msgSend(v10, "popToViewController:animated:", self, v6);

  }
  -[MailboxPickerOutlineController _updateBackButtonTitle](self, "_updateBackButtonTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v12, "updateMailboxSelectionAnimated:scrollToSelected:", 0, 1);

  -[MailboxPickerOutlineController _popToMailboxPickerController:andPushMessageListViewControllerIfNecessaryAnimated:](self, "_popToMailboxPickerController:andPushMessageListViewControllerIfNecessaryAnimated:", 1, v6);
}

- (void)_updateBackButtonTitle
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  NSBundle *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController accountsProvider](self, "accountsProvider"));
  v4 = objc_msgSend(v3, "isDisplayingMultipleAccounts");

  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[FavoritesManager lastSelectedItem](self->_favoritesManager, "lastSelectedItem")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account")),
        v5,
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName")),
        v6,
        !v10))
  {
    v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MAILBOXES_BACK_BUTTON"), &stru_100531B00, CFSTR("Main")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setBackButtonTitle:", v10);

}

- (void)_updateToolbarItemsEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSArray *editingToolbarItems;
  id v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  BOOL v40;
  _QWORD v41[5];
  uint8_t buf[4];
  MailboxPickerOutlineController *v43;
  __int16 v44;
  _BOOL4 v45;
  _QWORD v46[2];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[5];

  v4 = a4;
  v5 = a3;
  if (!a3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController mailStatusViewController](self, "mailStatusViewController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mailStatusBarButtonItem"));

    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10003A954;
    v41[3] = &unk_10051E0F0;
    v41[4] = self;
    v19 = objc_retainBlock(v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
    v21 = objc_msgSend(v20, "isCollapsed");

    v22 = -[MailboxPickerOutlineController _shouldShowMailStatus](self, "_shouldShowMailStatus");
    if ((v21 & v22) == 1)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFixedSpaceItem](UIBarButtonItem, "mf_newFixedSpaceItem"));
      v49[0] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
      v49[1] = v24;
      v49[2] = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
      v49[3] = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController composeButtonItem](self, "composeButtonItem"));
      v49[4] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 5));

      v28 = ((uint64_t (*)(_QWORD *, void *))v19[2])(v19, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
    }
    else
    {
      if (!v21)
      {
        if (!v22)
        {
          v16 = (NSArray *)&__NSArray0__struct;
          goto LABEL_11;
        }
        v37 = objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
        v47[0] = v37;
        v47[1] = v18;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
        v47[2] = v38;
        v16 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 3));

        v27 = (void *)v37;
LABEL_10:

LABEL_11:
        goto LABEL_12;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFixedSpaceItem](UIBarButtonItem, "mf_newFixedSpaceItem"));
      v48[0] = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
      v48[1] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController composeButtonItem](self, "composeButtonItem"));
      v48[2] = v32;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));

      v33 = ((uint64_t (*)(_QWORD *, void *))v19[2])(v19, v27);
      v29 = objc_claimAutoreleasedReturnValue(v33);
    }
    v16 = (NSArray *)v29;
    goto LABEL_10;
  }
  editingToolbarItems = self->_editingToolbarItems;
  if (!editingToolbarItems)
  {
    v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NEW_MAILBOX"), &stru_100531B00, CFSTR("Main")));
    v12 = objc_msgSend(v8, "initWithTitle:style:target:action:", v11, 0, self, "newMailboxClicked:");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBarButtonItem mf_newFlexibleSpaceItem](UIBarButtonItem, "mf_newFlexibleSpaceItem"));
    v46[0] = v13;
    v46[1] = v12;
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 2));
    v15 = self->_editingToolbarItems;
    self->_editingToolbarItems = v14;

    editingToolbarItems = self->_editingToolbarItems;
  }
  v16 = editingToolbarItems;
LABEL_12:
  v34 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v43 = self;
    v44 = 1024;
    v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@: set toolbar items - editing:%d", buf, 0x12u);
  }

  -[MailboxPickerOutlineController setToolbarItems:animated:](self, "setToolbarItems:animated:", v16, v4);
  if (v4)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000D54A0;
    v39[3] = &unk_10051C6A8;
    v39[4] = self;
    v40 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v39);
  }
  else
  {
    v35 = -[MailboxPickerOutlineController _shouldShowToolbar:](self, "_shouldShowToolbar:", v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    objc_msgSend(v36, "setToolbarHidden:", v35 ^ 1);

  }
}

- (MailboxPickerOutlineController)initWithMainScene:(id)a3 favoritesManager:(id)a4 accountsProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  MailboxPickerOutlineController *v11;
  MailboxPickerOutlineController *v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MailStatusViewController *v19;
  void *v20;
  void *v21;
  MailStatusViewController *v22;
  MailStatusViewController *mailStatusViewController;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MailboxPickerOutlineController;
  v11 = -[MailboxPickerOutlineController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("MAILBOXES"), &stru_100531B00, CFSTR("Main")));
    -[MailboxPickerOutlineController setTitle:](v12, "setTitle:", v15);

    objc_storeStrong((id *)&v12->_accountsProvider, a5);
    objc_storeWeak((id *)&v12->_scene, v8);
    objc_storeStrong((id *)&v12->_favoritesManager, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "daemonInterface"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "outgoingMessageRepository"));

    v19 = [MailStatusViewController alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "daemonInterface"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mailboxRepository"));
    v22 = -[MailStatusViewController initWithMailboxRepository:outgoingMessageRepository:scene:](v19, "initWithMailboxRepository:outgoingMessageRepository:scene:", v21, v18, v8);
    mailStatusViewController = v12->_mailStatusViewController;
    v12->_mailStatusViewController = v22;

    -[MailboxPickerOutlineController _registerNotifications](v12, "_registerNotifications");
    -[MailboxPickerOutlineController _updateBackButtonTitle](v12, "_updateBackButtonTitle");

  }
  return v12;
}

- (void)_configureCollectionView
{
  CustomCompositionalLayout *v3;
  CustomCompositionalLayout *v4;
  MailboxPickerDragDropHelper *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  MailboxPickerCollectionHelper *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MailboxPickerCollectionHelper *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [CustomCompositionalLayout alloc];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001BA84;
  v33[3] = &unk_10051D300;
  objc_copyWeak(&v34, &location);
  v4 = -[CustomCompositionalLayout initWithSectionProvider:](v3, "initWithSectionProvider:", v33);
  v5 = -[MailboxPickerDragDropHelper initWithDelegate:]([MailboxPickerDragDropHelper alloc], "initWithDelegate:", self);
  -[MailboxPickerOutlineController setDragDropHelper:](self, "setDragDropHelper:", v5);

  v6 = objc_alloc((Class)UICollectionView);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v8 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v4);

  objc_msgSend(v8, "setAutoresizingMask:", 18);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController traitCollection](self, "traitCollection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailMailboxPickerBackgroundColorForTraitCollection:](UIColor, "mailMailboxPickerBackgroundColorForTraitCollection:", v9));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_msgSend(v8, "setAlwaysBounceVertical:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController dragDropHelper](self, "dragDropHelper"));
  objc_msgSend(v8, "setDropDelegate:", v11);

  objc_msgSend(v8, "setSpringLoaded:", 1);
  objc_msgSend(v8, "setAllowsMultipleSelectionDuringEditing:", 1);
  objc_msgSend(v8, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailboxList);
  objc_msgSend(v8, "_setDelaysUserInitiatedItemSelection:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController view](self, "view"));
  objc_msgSend(v12, "addSubview:", v8);

  -[MailboxPickerOutlineController setCollectionView:](self, "setCollectionView:", v8);
  v13 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "handleInteractiveMoveGesture:");
  -[MailboxPickerOutlineController setInteractiveMoveGestureRecognizer:](self, "setInteractiveMoveGestureRecognizer:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController interactiveMoveGestureRecognizer](self, "interactiveMoveGestureRecognizer"));
  objc_msgSend(v14, "setDelegate:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController interactiveMoveGestureRecognizer](self, "interactiveMoveGestureRecognizer"));
  objc_msgSend(v15, "addGestureRecognizer:", v16);

  v17 = [MailboxPickerCollectionHelper alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "focusController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
  v23 = -[MailboxPickerCollectionHelper initWithCollectionView:favoritesManager:focusController:scene:logClient:](v17, "initWithCollectionView:favoritesManager:focusController:scene:logClient:", v8, v18, v20, v21, v22);

  -[MailboxPickerOutlineController setCollectionHelper:](self, "setCollectionHelper:", v23);
  -[MailboxPickerCollectionHelper setDelegate:](v23, "setDelegate:", self);
  objc_msgSend(v8, "setDelegate:", v23);
  v24 = objc_alloc_init((Class)UIRefreshControl);
  -[MailboxPickerOutlineController setRefreshControl:](self, "setRefreshControl:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController refreshControl](self, "refreshControl"));
  objc_msgSend(v25, "addTarget:action:forEvents:", self, "pulledToRefresh:", 4096);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController refreshControl](self, "refreshControl"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  objc_msgSend(v27, "setRefreshControl:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController messageListContainerViewController](self, "messageListContainerViewController"));
  v29 = NSStringFromSelector("mailboxes");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000D3D88;
  v32[3] = &unk_10051E050;
  v32[4] = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v30, 1, 1, v32));
  -[MailboxPickerOutlineController setMailboxesObserverToken:](self, "setMailboxesObserverToken:", v31);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

- (id)_configuredSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  char *v25;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
  v8 = objc_msgSend(v7, "mf_useSplitViewStyling");

  v9 = objc_alloc((Class)UICollectionLayoutListConfiguration);
  if (v8)
    v10 = 3;
  else
    v10 = 2;
  v11 = objc_msgSend(v9, "initWithAppearance:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v13 = objc_msgSend(v12, "sectionTypeForIndex:", a3);

  if ((unint64_t)v13 < 2)
    v14 = 1;
  else
    v14 = v8;
  if ((v14 & 1) == 0)
    objc_msgSend(v11, "setHeaderMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithListConfiguration:layoutEnvironment:](NSCollectionLayoutSection, "sectionWithListConfiguration:layoutEnvironment:", v11, v6));
  objc_msgSend(v15, "contentInsets");
  v18 = v17;
  v20 = v19;
  v21 = v16;
  v23 = v22;
  if (v13 == (id)3)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
    v25 = (char *)objc_msgSend(v24, "numberOfSections") - 1;

    if (v25 == (char *)a3)
      v16 = v21;
    else
      v16 = 0.0;
    if (v25 != (char *)a3)
      v18 = 0.0;
  }
  else if (v13 == (id)2)
  {
    v16 = 10.0;
  }
  objc_msgSend(v15, "setContentInsets:", v18, v20, v16, v23);

  return v15;
}

- (void)viewDidLoad
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController viewDidLoad](&v5, "viewDidLoad");
  v3 = MSAccessibilityIdentifierFilterCardMailboxPicker;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController view](self, "view"));
  objc_msgSend(v4, "setAccessibilityIdentifier:", v3);

  -[MailboxPickerOutlineController setNeedsReloadOnAppearance:](self, "setNeedsReloadOnAppearance:", 1);
  -[MailboxPickerOutlineController _configureCollectionView](self, "_configureCollectionView");
}

- (void)updateForSplitViewCollapseStateChanged:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  if (!a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastSelectedItem"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForItem:", v6));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
      if ((objc_msgSend(v9, "mf_isIndexPathValid:", v8) & 1) != 0)
      {
        objc_msgSend(v9, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 0, 0);
        v10 = dispatch_time(0, 0);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000D5E38;
        v14[3] = &unk_10051A910;
        v15 = v9;
        v16 = v8;
        dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v14);

        v11 = v15;
      }
      else
      {
        v11 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = NSStringFromSelector(a2);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          *(_DWORD *)buf = 138412802;
          v18 = v13;
          v19 = 2114;
          v20 = v8;
          v21 = 2114;
          v22 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - invalid lastSelectedIndexPath:%{public}@ for collectionView:%{public}@", buf, 0x20u);

        }
      }

    }
  }
}

- (BOOL)showingPopoverViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController presentedViewController](self, "presentedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "popoverPresentationController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barButtonItem"));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController editingToolbarItems](self, "editingToolbarItems")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "barButtonItem")),
        v8 = objc_msgSend(v6, "containsObject:", v7),
        v7,
        v6,
        v5,
        (v8 & 1) != 0))
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController view](self, "view"));
    v9 = objc_msgSend(v10, "isDescendantOfView:", v11);

  }
  return v9;
}

- (void)setRefreshControl:(id)a3
{
  objc_storeStrong((id *)&self->_refreshControl, a3);
}

- (void)setNeedsReloadOnAppearance:(BOOL)a3
{
  self->_needsReloadOnAppearance = a3;
}

- (void)setMailboxesObserverToken:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxesObserverToken, a3);
}

- (void)setInteractiveMoveGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_interactiveMoveGestureRecognizer, a3);
}

- (void)setForceReloadMessageListViewController:(BOOL)a3
{
  self->_forceReloadMessageListViewController = a3;
}

- (void)setDragDropHelper:(id)a3
{
  objc_storeStrong((id *)&self->_dragDropHelper, a3);
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (void)setCollectionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_collectionHelper, a3);
}

- (MailMainScene)scene
{
  return (MailMainScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (UIRefreshControl)refreshControl
{
  return self->_refreshControl;
}

- (BOOL)mailboxCollectionHelperSplitViewControllerIsCollapsed:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController", a3));
  v4 = objc_msgSend(v3, "isCollapsed");

  return v4;
}

- (BOOL)mailboxCollectionHelperShouldUpdateMailboxSelection:(id)a3
{
  unsigned int v4;

  v4 = -[MailboxPickerOutlineController isViewLoaded](self, "isViewLoaded", a3);
  if (v4)
    LOBYTE(v4) = !-[MailboxPickerOutlineController showingPopoverViewController](self, "showingPopoverViewController");
  return v4;
}

- (MailStatusViewController)mailStatusViewController
{
  return self->_mailStatusViewController;
}

- (UILongPressGestureRecognizer)interactiveMoveGestureRecognizer
{
  return self->_interactiveMoveGestureRecognizer;
}

- (BOOL)forceReloadMessageListViewController
{
  return self->_forceReloadMessageListViewController;
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (FavoriteItemSelectionTarget)favoriteItemSelectionTarget
{
  -[MailboxPickerOutlineController loadViewIfNeeded](self, "loadViewIfNeeded");
  return (FavoriteItemSelectionTarget *)-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper");
}

- (UIBarButtonItem)editButtonItem
{
  UIBarButtonItem *editButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  editButtonItem = self->_editButtonItem;
  if (!editButtonItem)
  {
    v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:action:](UIBarButtonItem, "mf_newMultiBarButtonItemWithTarget:action:", self, "_editButtonTapped:");
    v5 = self->_editButtonItem;
    self->_editButtonItem = v4;

    editButtonItem = self->_editButtonItem;
  }
  return editButtonItem;
}

- (MailboxPickerDragDropHelper)dragDropHelper
{
  return self->_dragDropHelper;
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  EMDiagnosticsHelper *diagnosticsHelper;
  id v4;
  void *v5;
  void *v6;
  EMDiagnosticsHelper *v7;
  EMDiagnosticsHelper *v8;

  diagnosticsHelper = self->_diagnosticsHelper;
  if (!diagnosticsHelper)
  {
    v4 = objc_alloc((Class)EMDiagnosticsHelper);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "daemonInterface"));
    v7 = (EMDiagnosticsHelper *)objc_msgSend(v4, "initWithDaemonInterface:", v6);
    v8 = self->_diagnosticsHelper;
    self->_diagnosticsHelper = v7;

    diagnosticsHelper = self->_diagnosticsHelper;
  }
  return diagnosticsHelper;
}

- (UIBarButtonItem)composeButtonItem
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *composeButtonItem;
  UIBarButtonItem *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  v4 = v3;
  if (!self->_composeButtonItem
    && objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___ComposeCapable)
    && (objc_opt_respondsToSelector(v4, "newComposeButtonItem") & 1) != 0)
  {
    v5 = (UIBarButtonItem *)objc_msgSend(v4, "newComposeButtonItem");
    composeButtonItem = self->_composeButtonItem;
    self->_composeButtonItem = v5;

  }
  v7 = self->_composeButtonItem;

  return v7;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (MailboxPickerCollectionHelper)collectionHelper
{
  return self->_collectionHelper;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)_updateToolbarItems:(BOOL)a3
{
  -[MailboxPickerOutlineController _updateToolbarItemsEditing:animated:](self, "_updateToolbarItemsEditing:animated:", -[MailboxPickerOutlineController isEditing](self, "isEditing"), a3);
}

- (void)_updateNavigationBarItems
{
  -[MailboxPickerOutlineController _updateNavigationBarItemsEditing:](self, "_updateNavigationBarItemsEditing:", -[MailboxPickerOutlineController isEditing](self, "isEditing"));
}

- (void)_updateNavigationBarItemsEditing:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController editButtonItem](self, "editButtonItem"));
  +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController editButtonItem](self, "editButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v6);

}

- (BOOL)_shouldShowToolbar:(BOOL)a3
{
  BOOL v3;
  void *v5;
  void *v6;
  MailboxPickerOutlineController *v7;

  if (a3)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
  if (objc_msgSend(v5, "isCollapsed"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    v7 = (MailboxPickerOutlineController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topViewController"));
    v3 = v7 == self;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_shouldShowMailStatus
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
  v3 = objc_msgSend(v2, "isCollapsed");

  return v3;
}

- (void)_registerNotifications
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_sharedMailboxControllerBadgeCountDidChange:", SharedMailboxControllerBadgeCountDidChangeNotification, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_vipSendersDidChange:", EMVIPsDidChangeNotification, v3);

  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_significantTimeChange:", UIApplicationSignificantTimeChangeNotification, 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_detailViewControllerConfigurationChanged:", UIViewControllerShowDetailTargetDidChangeNotification, 0);

}

- (void)_detailViewControllerConfigurationChanged:(id)a3
{
  NSObject *v5;
  NSString *v6;
  void *v7;
  int v8;
  MailboxPickerOutlineController *v9;
  __int16 v10;
  void *v11;

  v5 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log", a3));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v8, 0x16u);

  }
  -[MailboxPickerOutlineController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  -[MailboxPickerOutlineController _updateToolbarItems:](self, "_updateToolbarItems:", 1);
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BE88;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9C98 != -1)
    dispatch_once(&qword_1005A9C98, block);
  return (id)qword_1005A9C90;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  MailboxPickerOutlineController *v24;
  __int16 v25;
  void *v26;

  v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController viewWillAppear:](&v22, "viewWillAppear:");
  v6 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2112;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);

  }
  if (-[MailboxPickerOutlineController needsReloadOnAppearance](self, "needsReloadOnAppearance"))
  {
    -[MailboxPickerOutlineController setNeedsReloadOnAppearance:](self, "setNeedsReloadOnAppearance:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
    objc_msgSend(v9, "reloadDataSource");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  if (!-[MailboxPickerOutlineController didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "extendedLaunchTracker"));
    objc_msgSend(v11, "observeViewController:scene:", self, v10);

  }
  -[MailboxPickerOutlineController updateIsRefreshingForState:](self, "updateIsRefreshingForState:", 0);
  if (-[MailboxPickerOutlineController isReappearing](self, "isReappearing")
    && (objc_msgSend(v10, "isInExpandedEnvironment") & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController transitionCoordinator](self, "transitionCoordinator"));
    objc_msgSend(v12, "mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:animated:", v13, 1);

  }
  if (-[MailboxPickerOutlineController _shouldShowMailStatus](self, "_shouldShowMailStatus"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController mailStatusViewController](self, "mailStatusViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "statusMailboxes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
    objc_msgSend(v14, "startObservingForVisibleMailboxes:delegate:filterPredicate:label:", v16, self, 0, CFSTR("Mailbox picker status"));

  }
  -[MailboxPickerOutlineController _updateToolbarItems:](self, "_updateToolbarItems:", v3);
  -[MailboxPickerOutlineController _updateNavigationBarItems](self, "_updateNavigationBarItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "traitCollection"));
  if (objc_msgSend(v18, "horizontalSizeClass") == (id)1)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v20 = objc_msgSend(v19, "applicationState") == 0;

    if (!v20)
      goto LABEL_17;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v10, "setSelectedAccounts:", v17);
  }
  else
  {

  }
LABEL_17:
  -[MailboxPickerOutlineController _refreshMailboxList](self, "_refreshMailboxList");
  if (!-[MailboxPickerOutlineController didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "extendedLaunchTracker"));
    objc_msgSend(v21, "didFinishLoadViewController:scene:", self, v10);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController viewDidAppear:](&v8, "viewDidAppear:", a3);
  -[MailboxPickerOutlineController mf_updateAlertSuppressionContextsForReason:](self, "mf_updateAlertSuppressionContextsForReason:", CFSTR("mailbox picker did appear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  objc_msgSend(v4, "updatedSelectedState:", v5);

  v6 = objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController viewDidAppearBlock](self, "viewDidAppearBlock"));
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    -[MailboxPickerOutlineController setViewDidAppearBlock:](self, "setViewDidAppearBlock:", 0);
  }

}

- (void)applicationWillSuspend
{
  void *v3;
  unsigned __int8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController applicationWillSuspend](&v5, "applicationWillSuspend");
  if (!-[MailboxPickerOutlineController showingPopoverViewController](self, "showingPopoverViewController"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController messageListContainerViewController](self, "messageListContainerViewController"));
    v4 = objc_msgSend(v3, "showingPopoverViewController");

    if ((v4 & 1) == 0)
      -[MailboxPickerOutlineController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailMailboxPickerBackgroundColorForTraitCollection:](UIColor, "mailMailboxPickerBackgroundColorForTraitCollection:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
  objc_msgSend(v9, "invalidateLayout");

}

- (MessageListContainerViewController)messageListContainerViewController
{
  MessageListContainerViewController *messageListContainerViewController;
  FavoritesShortcutsProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  MessageListContainerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  MessageListContainerViewController *v13;
  MessageListContainerViewController *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  messageListContainerViewController = self->_messageListContainerViewController;
  if (!messageListContainerViewController)
  {
    v4 = [FavoritesShortcutsProvider alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailboxProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
    v8 = sub_100045C58((id *)&v4->super.isa, v6, v7);

    v9 = [MessageListContainerViewController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController accountsProvider](self, "accountsProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController diagnosticsHelper](self, "diagnosticsHelper"));
    v13 = -[MessageListContainerViewController initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:mailboxPickerDelegate:](v9, "initWithMainScene:mailboxes:accountsProvider:favoritesShortcutsProvider:contactStore:diagnosticsHelper:mailboxPickerDelegate:", v10, 0, v11, v8, 0, v12, self);
    v14 = self->_messageListContainerViewController;
    self->_messageListContainerViewController = v13;

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000D4028;
    v20[3] = &unk_10051E078;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
    v21 = v15;
    -[MessageListContainerViewController setScrollableHintBlock:](self->_messageListContainerViewController, "setScrollableHintBlock:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000D4164;
    v18[3] = &unk_10051E050;
    v16 = v15;
    v19 = v16;
    -[MessageListContainerViewController setUpdateScrollableHintBlock:](self->_messageListContainerViewController, "setUpdateScrollableHintBlock:", v18);

    messageListContainerViewController = self->_messageListContainerViewController;
  }
  return messageListContainerViewController;
}

- (UIBarButtonItem)shelfButtonItem
{
  UIBarButtonItem *shelfButtonItem;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *v6;

  shelfButtonItem = self->_shelfButtonItem;
  if (!shelfButtonItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphShelf));
    v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v4, 0, self, "_shelfButtonTapped:");
    v6 = self->_shelfButtonItem;
    self->_shelfButtonItem = v5;

    shelfButtonItem = self->_shelfButtonItem;
  }
  return shelfButtonItem;
}

- (void)_shelfButtonTapped:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_sceneIdentifier"));
  +[MFBayAdoption requestShelfPresentationForSceneWithIdentifier:](MFBayAdoption, "requestShelfPresentationForSceneWithIdentifier:", v3);

}

- (void)setIsRefreshing:(BOOL)a3
{
  _BOOL4 v3;
  id v6;
  id v7;

  v3 = a3;
  if (pthread_main_np() != 1)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerOutlineController.m"), 349, CFSTR("Current thread must be main"));

  }
  if (self->_isRefreshing != v3 && !v3)
  {
    self->_isRefreshing = v3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController refreshControl](self, "refreshControl"));
    objc_msgSend(v6, "endRefreshing");

  }
}

- (void)pulledToRefresh:(id)a3
{
  void *v5;

  if (pthread_main_np() != 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailboxPickerOutlineController.m"), 362, CFSTR("Current thread must be main"));

  }
  self->_isRefreshing = 1;
  -[MailboxPickerOutlineController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "updateIsRefreshingForState:", 0, 0.0);
  -[MailboxPickerOutlineController _refreshMailboxList](self, "_refreshMailboxList");
}

- (void)_refreshMailboxList
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemonInterface"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxRepository"));

  objc_msgSend(v4, "refreshMailboxList");
}

- (BOOL)selectFavoriteItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  return -[MailboxPickerOutlineController _selectFavoriteItem:indexPath:animated:](self, "_selectFavoriteItem:indexPath:animated:", 0, a3, a4);
}

- (BOOL)selectFavoriteItem:(id)a3 animated:(BOOL)a4
{
  return -[MailboxPickerOutlineController _selectFavoriteItem:indexPath:animated:](self, "_selectFavoriteItem:indexPath:animated:", a3, 0, a4);
}

- (BOOL)_selectFavoriteItem:(id)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  MailboxPickerOutlineController *v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000D4718;
  v14[3] = &unk_10051E0C8;
  v11 = v8;
  v15 = v11;
  v12 = v9;
  v16 = v12;
  v17 = self;
  v19 = a5;
  v18 = &v20;
  objc_msgSend(v10, "performTransaction:", v14);

  LOBYTE(v8) = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return (char)v8;
}

- (void)setDisplayMessageOnReload:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController messageListContainerViewController](self, "messageListContainerViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageListViewController"));
  objc_msgSend(v5, "setMessageToDisplayOnReload:", v6);

  -[MailboxPickerOutlineController setForceReloadMessageListViewController:](self, "setForceReloadMessageListViewController:", 1);
}

- (void)showVIPSettingsAnimated:(BOOL)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v5, "presentFromSelectionTarget:item:accessoryTapped:animated:", v4, 0, 1, 0);

}

- (void)selectMailbox:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoriteItemSelectionTarget](self, "favoriteItemSelectionTarget"));
  objc_msgSend(v4, "selectMailbox:item:animated:", v5, 0, 0);

}

- (void)selectCombinedMailbox:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoriteItemSelectionTarget](self, "favoriteItemSelectionTarget"));
  objc_msgSend(v4, "selectCombinedMailbox:", v5);

}

- (NSArray)suggestedFavoriteItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "suggestedFavoriteItems"));

  return (NSArray *)v3;
}

- (id)favoriteItemsMatchingName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsMatchingName:", v4));

  return v6;
}

- (id)favoriteItemsMatchingItemURLStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsMatchingItemURLStrings:", v4));

  return v6;
}

- (id)watchedMailboxes
{
  return self->_watchedMailboxes;
}

- (void)newMailboxClicked:(id)a3
{
  -[MailboxPickerOutlineController _presentMailboxEditControllerForAccount:mailbox:animated:](self, "_presentMailboxEditControllerForAccount:mailbox:animated:", 0, 0, 1);
}

- (void)_editButtonTapped:(id)a3
{
  -[MailboxPickerOutlineController setEditing:animated:](self, "setEditing:animated:", -[MailboxPickerOutlineController isEditing](self, "isEditing", a3) ^ 1, 1);
}

- (void)_sharedMailboxControllerBadgeCountDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[24];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100392110((uint64_t)v4, v8, (uint64_t)objc_msgSend(v5, "sourceType"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v7, "updateCellForSourceType:", objc_msgSend(v5, "sourceType"));

}

- (void)_vipSendersDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[MailboxPickerOutlineController log](MailboxPickerOutlineController, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100392164((uint64_t)v4, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v6, "updateCellForSourceType:", 1);

}

- (void)_contentSizeCategoryChanged:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 4));
  objc_msgSend(v4, "invalidateIcon");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 2));
  objc_msgSend(v5, "invalidateIcon");

  v6 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 3));
  objc_msgSend(v6, "invalidateIcon");

  v7 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 1));
  objc_msgSend(v7, "invalidateIcon");

  v8 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 5));
  objc_msgSend(v8, "invalidateIcon");

  v9 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 6));
  objc_msgSend(v9, "invalidateIcon");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 8));
  objc_msgSend(v10, "invalidateIcon");

  v11 = (id)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 7));
  objc_msgSend(v11, "invalidateIcon");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v12, "reloadDataSource");

}

- (void)_significantTimeChange:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SharedMailboxController sharedInstanceForSourceType:](SharedMailboxController, "sharedInstanceForSourceType:", 7));
    objc_msgSend(v5, "invalidateIcon");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
    objc_msgSend(v6, "reloadDataSource");

  }
  else
  {
    -[MailboxPickerOutlineController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v7, 0);
  }

}

- (void)_watchedMailboxesDidChange:(id)a3
{
  NSArray *watchedMailboxes;
  id v5;

  watchedMailboxes = self->_watchedMailboxes;
  self->_watchedMailboxes = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v5, "reloadDataSource");

}

- (void)handleInteractiveMoveGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  objc_msgSend(v14, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
  v11 = v10;
  switch((unint64_t)v4)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
      if (-[MailboxPickerOutlineController isReordering](self, "isReordering"))
      {
        objc_msgSend(v11, "cancelInteractiveMovement");
        goto LABEL_9;
      }
      break;
    case 1uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9));
      if (v12)
        -[MailboxPickerOutlineController setIsReordering:](self, "setIsReordering:", objc_msgSend(v11, "beginInteractiveMovementForItemAtIndexPath:", v12));

      break;
    case 2uLL:
      if (-[MailboxPickerOutlineController isReordering](self, "isReordering"))
        objc_msgSend(v11, "updateInteractiveMovementTargetPosition:", v7, v9);
      break;
    case 3uLL:
      if (-[MailboxPickerOutlineController isReordering](self, "isReordering"))
      {
        objc_msgSend(v11, "endInteractiveMovement");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
        objc_msgSend(v13, "updateMailboxSelectionAnimated:scrollToSelected:", 1, 0);

LABEL_9:
        -[MailboxPickerOutlineController setIsReordering:](self, "setIsReordering:", 0);
      }
      break;
    default:
      break;
  }

}

- (void)_useSplitViewControllerToShowViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v8 = v6;
  if (a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController splitViewController](self, "splitViewController"));
    objc_msgSend(v7, "showViewController:sender:", v8, 0);

  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000D577C;
    v9[3] = &unk_10051A910;
    v9[4] = self;
    v10 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

  }
}

- (void)_presentViewControllerInPopover:(id)a3 barButtonItem:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D58F4;
  v9[3] = &unk_10051E118;
  v10 = a4;
  v8 = v10;
  -[MailboxPickerOutlineController _presentViewControllerInPopover:animated:block:](self, "_presentViewControllerInPopover:animated:block:", a3, v5, v9);

}

- (void)_presentViewControllerInPopover:(id)a3 sourceView:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D59AC;
  v9[3] = &unk_10051E118;
  v10 = a4;
  v8 = v10;
  -[MailboxPickerOutlineController _presentViewControllerInPopover:animated:block:](self, "_presentViewControllerInPopover:animated:block:", a3, v5, v9);

}

- (void)_presentViewControllerInPopover:(id)a3 animated:(BOOL)a4 block:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, void *);
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v11);
  objc_msgSend(v9, "setModalPresentationStyle:", 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "popoverPresentationController"));
  v8[2](v8, v10);

  -[MailboxPickerOutlineController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, v6, 0);
}

- (void)_presentMailboxEditControllerForAccount:(id)a3 mailbox:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  MailboxEditingController *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  id v27;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 && v9)
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "account"));
  if (v8)
  {
    v27 = v8;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountsCollection"));

    v11 = objc_alloc_init((Class)NSMutableArray);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "items"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v17, "isVisible") && objc_msgSend(v17, "type") == (id)1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account"));
            objc_msgSend(v11, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

  }
  v19 = -[MailboxEditingController initWithMailbox:account:validAccounts:]([MailboxEditingController alloc], "initWithMailbox:account:validAccounts:", v10, v8, v11);
  -[MailboxEditingController setDelegate:](v19, "setDelegate:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_editingToolbarItems, "lastObject"));
  -[MailboxPickerOutlineController _presentViewControllerInPopover:barButtonItem:animated:](self, "_presentViewControllerInPopover:barButtonItem:animated:", v19, v20, v5);

}

- (void)_dismissCustomViewController:(id)a3
{
  void *v4;
  id v5;

  -[MailboxPickerOutlineController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController transitionCoordinator](self, "transitionCoordinator"));
  objc_msgSend(v5, "mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:animated:", v4, 1);

}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController transitionCoordinator](self, "transitionCoordinator"));
  objc_msgSend(v5, "mf_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:animated:", v4, 1);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  unsigned __int8 v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController interactiveMoveGestureRecognizer](self, "interactiveMoveGestureRecognizer"));

  if (v5 == v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
    objc_msgSend(v4, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForItemAtPoint:", v9, v11));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
      v6 = objc_msgSend(v14, "canReorderItemAtIndexPath:", v13);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)messageListViewController:(id)a3 setEditing:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  id v11;

  v5 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leftBarButtonItem"));
  v8 = !v5;
  objc_msgSend(v7, "setEnabled:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));
  objc_msgSend(v9, "setEnabled:", v8);

}

- (void)messageListViewController:(id)a3 didSelectFavorite:(id)a4
{
  id v5;

  v5 = a4;
  -[MailboxPickerOutlineController _selectFavoriteItem:indexPath:animated:](self, "_selectFavoriteItem:indexPath:animated:");
  -[MailboxPickerOutlineController _updateBackButtonTitle](self, "_updateBackButtonTitle");

}

- (id)displayedAccountsForMailboxCollectionHelper:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController accountsProvider](self, "accountsProvider", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "displayedAccounts"));

  return v4;
}

- (BOOL)mailboxCollectionHelper:(id)a3 shouldDisableForEditingCellForMailbox:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController watchedMailboxes](self, "watchedMailboxes"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

- (void)mailboxCollectionHelperDidTapDetailsDisclosure:(id)a3 sender:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionView](self, "collectionView"));
  objc_msgSend(v19, "frame");
  v7 = v6;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "superview"));
  objc_msgSend(v5, "convertPoint:fromView:", v10, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemAtPoint:", v12, v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "favoriteItemAtIndexPath:", v15));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  objc_msgSend(v17, "wasSelected:indexPath:accessoryTapped:animated:", v18, v15, 1, 1);

}

- (void)mailboxCollectionHelperWantsToShowAddFavoritesController:(id)a3 sourceView:(id)a4
{
  EditFavoritesController *v5;
  void *v6;
  void *v7;
  EditFavoritesController *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = [EditFavoritesController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController accountsProvider](self, "accountsProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController favoritesManager](self, "favoritesManager"));
  v8 = -[EditFavoritesController initWithAccountsProvider:favoritesManager:](v5, "initWithAccountsProvider:favoritesManager:", v6, v7);

  -[EditFavoritesController setDelegate:](v8, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditFavoritesController navigationItem](v8, "navigationItem"));
  objc_msgSend(v9, "setHidesBackButton:", 1);

  -[MailboxPickerOutlineController _presentViewControllerInPopover:sourceView:animated:](self, "_presentViewControllerInPopover:sourceView:animated:", v8, v10, 1);
}

- (void)mailboxCollectionHelper:(id)a3 wantsToPopToMailboxPicker:(BOOL)a4 andPushMessageListViewControllerIfNecessaryAnimated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSBundle *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MAILBOXES_BACK_BUTTON"), &stru_100531B00, CFSTR("Main")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
  objc_msgSend(v11, "setBackButtonTitle:", v10);

  -[MailboxPickerOutlineController setForceReloadMessageListViewController:](self, "setForceReloadMessageListViewController:", 1);
  -[MailboxPickerOutlineController _popToMailboxPickerController:andPushMessageListViewControllerIfNecessaryAnimated:](self, "_popToMailboxPickerController:andPushMessageListViewControllerIfNecessaryAnimated:", v6, v5);
}

- (void)mailboxCollectionHelper:(id)a3 wantsToShowCustomViewController:(id)a4 animated:(BOOL)a5 sourceViewBlock:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  BOOL v21;
  id v22;

  v7 = a5;
  v9 = a4;
  v10 = a6;
  v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismissCustomViewController:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationItem"));
  v22 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  objc_msgSend(v12, "setLeftBarButtonItems:animated:", v13, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController scene](self, "scene"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "splitViewController"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000D66F8;
  v18[3] = &unk_10051E1B8;
  v18[4] = self;
  v16 = v9;
  v19 = v16;
  v21 = v7;
  v17 = v10;
  v20 = v17;
  objc_msgSend(v15, "showMailboxPickerController:animated:completion:", 1, v7, v18);

}

- (void)mailboxCollectionHelper:(id)a3 wantsToPresentMailboxEditControllerForMailbox:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  -[MailboxPickerOutlineController _presentMailboxEditControllerForAccount:mailbox:animated:](self, "_presentMailboxEditControllerForAccount:mailbox:animated:", v7, v8, v5);

}

- (id)mailboxPickerDragDropHelper:(id)a3 favoriteItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "favoriteItemAtIndexPath:", v5));

  return v7;
}

- (id)mailboxPickerDragDropHelper:(id)a3 mailboxForMailboxUid:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
  v11 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "createMailboxesFromUids:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  return v9;
}

- (void)updateIsRefreshingForState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "integerValue");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController mailStatusViewController](self, "mailStatusViewController"));
    v5 = objc_msgSend(v6, "currentState");

  }
  -[MailboxPickerOutlineController setIsRefreshing:](self, "setIsRefreshing:", v5 == (id)2);

}

- (id)mailboxQualifier
{
  NSBundle *v2;
  void *v3;
  void *v4;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("UNREAD_FORMAT"), &stru_100531B00, CFSTR("Main")));

  return v4;
}

- (BOOL)shouldShowSubtitle
{
  return 0;
}

- (void)mailStatus:(id)a3 didChangeState:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[MailboxPickerOutlineController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "updateIsRefreshingForState:");

}

- (void)mailStatusViewControllerUndoButtonTapped:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "daemonInterface"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMessageRepository"));

  objc_msgSend(v5, "cancelLastDelayedMessage:", &stru_10051E1F8);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v5 = a3;
  v7 = -[MailboxPickerOutlineController isEditing](self, "isEditing");
  v11.receiver = self;
  v11.super_class = (Class)MailboxPickerOutlineController;
  -[MailboxPickerOutlineController setEditing:animated:](&v11, "setEditing:animated:", v5, v4);
  if (v7 != v5)
  {
    -[MailboxPickerOutlineController _updateNavigationBarItemsEditing:](self, "_updateNavigationBarItemsEditing:", v5);
    -[MailboxPickerOutlineController _updateToolbarItemsEditing:animated:](self, "_updateToolbarItemsEditing:animated:", v5, v4);
    if (v5)
    {
      -[MailboxPickerOutlineController focus:](self, "focus:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftBarButtonItem"));
      objc_msgSend(v9, "setEnabled:", 0);
    }
    else
    {
      -[MailboxPickerOutlineController unfocus:](self, "unfocus:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationItem](self, "navigationItem"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leftBarButtonItem"));
      objc_msgSend(v9, "setEnabled:", 1);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController collectionHelper](self, "collectionHelper"));
    objc_msgSend(v10, "setEditing:animated:", v5, v4);

    -[MailboxPickerOutlineController _dismissEditViewControllers](self, "_dismissEditViewControllers");
  }
}

- (void)_dismissEditViewControllers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController presentedViewController](self, "presentedViewController"));
  v3 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v9, v3) & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v7 = objc_opt_class(MFMailComposeController);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0)
    -[MailboxPickerOutlineController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    v7 = -[MailboxPickerOutlineController isEditing](self, "isEditing");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MailboxPickerOutlineController;
    v7 = -[MailboxPickerOutlineController canPerformAction:withSender:](&v10, "canPerformAction:withSender:", a3, v6);
  }
  v8 = v7;

  return v8;
}

- (void)_escapeShortcutInvoked:(id)a3
{
  id v4;

  v4 = a3;
  if (-[MailboxPickerOutlineController isEditing](self, "isEditing"))
    -[MailboxPickerOutlineController _editButtonTapped:](self, "_editButtonTapped:", v4);

}

- (void)mailboxEditingControllerDidFinish:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController presentedViewController](self, "presentedViewController", a3));

  if (v4)
  {
    -[MailboxPickerOutlineController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    v5 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
}

- (void)editFavoritesControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  MailboxPickerOutlineController *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    -[MailboxPickerOutlineController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailboxPickerOutlineController navigationController](self, "navigationController"));
    v7 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000D7434;
  v9[3] = &unk_10051A910;
  v10 = v4;
  v11 = self;
  v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

}

- (void)setMessageListContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageListContainerViewController, a3);
}

- (BOOL)isRefreshing
{
  return self->_isRefreshing;
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (void)setDiagnosticsHelper:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsHelper, a3);
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void)setFavoritesManager:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesManager, a3);
}

- (void)setMailStatusViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mailStatusViewController, a3);
}

- (void)setComposeButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_composeButtonItem, a3);
}

- (void)setShelfButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_shelfButtonItem, a3);
}

- (void)setEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_editButtonItem, a3);
}

- (NSArray)editingToolbarItems
{
  return self->_editingToolbarItems;
}

- (void)setEditingToolbarItems:(id)a3
{
  objc_storeStrong((id *)&self->_editingToolbarItems, a3);
}

- (BOOL)isReordering
{
  return self->_isReordering;
}

- (void)setIsReordering:(BOOL)a3
{
  self->_isReordering = a3;
}

- (EFCancelable)mailboxesObserverToken
{
  return self->_mailboxesObserverToken;
}

- (BOOL)needsReloadOnAppearance
{
  return self->_needsReloadOnAppearance;
}

- (id)viewDidAppearBlock
{
  return self->_viewDidAppearBlock;
}

- (void)setViewDidAppearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewDidAppearBlock, 0);
  objc_storeStrong((id *)&self->_mailboxesObserverToken, 0);
  objc_storeStrong((id *)&self->_interactiveMoveGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_refreshControl, 0);
  objc_storeStrong((id *)&self->_dragDropHelper, 0);
  objc_storeStrong((id *)&self->_collectionHelper, 0);
  objc_storeStrong((id *)&self->_editingToolbarItems, 0);
  objc_storeStrong((id *)&self->_editButtonItem, 0);
  objc_storeStrong((id *)&self->_shelfButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_mailStatusViewController, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_messageListContainerViewController, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_watchedMailboxes, 0);
}

@end
