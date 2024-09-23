@implementation MailMainScene

- (void)mailSceneDidBecomeActive
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  unsigned int v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MailMainScene;
  -[MailScene mailSceneDidBecomeActive](&v10, "mailSceneDidBecomeActive");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedAccounts"));
  v6 = objc_msgSend(v5, "count");

  v7 = -[MailMainScene _shouldPresentOnboarding](self, "_shouldPresentOnboarding");
  v8 = 0;
  if (v6 && (v7 & 1) == 0)
    v8 = !-[MailMainScene shouldDeferUserNotificationAuthorizationRequests](self, "shouldDeferUserNotificationAuthorizationRequests");
  if (-[MailMainScene shouldRequestContactAccess](self, "shouldRequestContactAccess"))
  {
    -[MailMainScene setShouldRequestContactAccess:](self, "setShouldRequestContactAccess:", 0);
    -[MailMainScene _requestContactStoreAccessIfNeeded](self, "_requestContactStoreAccessIfNeeded");
  }
  if ((-[MailMainScene shouldRequestUserNotificationAuthorization](self, "shouldRequestUserNotificationAuthorization") | v8) == 1)
  {
    -[MailMainScene setShouldRequestUserNotificationAuthorization:](self, "setShouldRequestUserNotificationAuthorization:", 0);
    -[MailMainScene _requestUserNotificationAuthorization](self, "_requestUserNotificationAuthorization");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene messageListContainerViewController](self, "messageListContainerViewController"));
  objc_msgSend(v9, "resumeRefreshAnimationIfNecessary");

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mf_viewControllerBefore:", v7));
  v9 = sub_10000BE78(v8, v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "postNotificationName:object:userInfo:", MailNavigationControllerDidShowViewControllerNotification, v12, v10);

}

- (void)selectDefaultMailbox
{
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v3 = -[MailMainScene _shouldPresentOnboarding](self, "_shouldPresentOnboarding");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _defaultAccountsToSelect](self, "_defaultAccountsToSelect"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[MailMainScene activationState](self, "activationState");
    if (v5 != (id)2)
      -[MailMainScene _requestContactStoreAccessIfNeeded](self, "_requestContactStoreAccessIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    if (v6)
    {
      v7 = !-[MailMainScene accountSetupFinished](self, "accountSetupFinished");
      if (v5 == (id)2)
        LOBYTE(v7) = 0;
      if ((v7 & 1) == 0)
      {

LABEL_15:
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
        -[MailMainScene accountSetupControllerDidChange:finished:](self, "accountSetupControllerDidChange:finished:", v11, -[MailMainScene accountSetupFinished](self, "accountSetupFinished"));

LABEL_17:
        if (v5 != (id)2)
          goto LABEL_20;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastSelectedItem"));

        if (!v13
          || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager")),
              objc_msgSend(v14, "setLastSelectedItem:", 0),
              v14,
              v15 = objc_msgSend(v19, "selectFavoriteItem:animated:", v13, 0),
              v13,
              (v15 & 1) == 0))
        {
LABEL_20:
          if ((unint64_t)objc_msgSend(v4, "count") < 2)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "favoriteItemSelectionTarget"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primaryMailboxUid"));
            objc_msgSend(v17, "selectMailbox:item:animated:", v18, 0, 0);

          }
          else
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "favoriteItemSelectionTarget"));
            objc_msgSend(v16, "selectCombinedMailboxWithType:item:animated:", 7, 0, 0);
          }

        }
        goto LABEL_24;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
      v10 = objc_msgSend(v9, "accountSetupInProgress");

      if ((v10 & 1) == 0)
        goto LABEL_15;
    }
    if (!-[MailMainScene _isDisplayingAccountSetup](self, "_isDisplayingAccountSetup"))
    {
      if (v3)
        -[MailMainScene presentOnboardingIfNecessary](self, "presentOnboardingIfNecessary");
      else
        -[MailMainScene _requestUserNotificationAuthorization](self, "_requestUserNotificationAuthorization");
    }
    goto LABEL_17;
  }
  if (!-[MailMainScene _isDisplayingAccountSetup](self, "_isDisplayingAccountSetup"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "favoriteItemSelectionTarget"));
    objc_msgSend(v8, "selectAccount:item:indexPath:animated:", 0, 0, 0, 0);

    -[MailMainScene _dismissAnyModalViewControllerOrPopoverAnimated:](self, "_dismissAnyModalViewControllerOrPopoverAnimated:", 0);
    -[MailMainScene _presentAccountSetupController](self, "_presentAccountSetupController");
  }
LABEL_24:

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mf_viewControllerBefore:", v8));
  v10 = sub_10000BE78(v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "postNotificationName:object:userInfo:", MailNavigationControllerWillShowViewControllerNotification, v15, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
  objc_msgSend(v14, "_setDisplayModeButtonItemTitle:", v13);

}

- (void)_handleAccountsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", ECMailAccountsDidChangeNotificationKeyAccountIdentifiers));

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene selectedAccounts](self, "selectedAccounts"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003BB18;
  v13[3] = &unk_10051E7D0;
  v13[4] = &v14;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_compactMap:", v13));

  v11 = objc_msgSend(v6, "count");
  v12 = objc_msgSend(v8, "count");
  if (!*((_BYTE *)v15 + 24) && (v11 == v12 || v11 && v12))
  {
    if (objc_msgSend(v10, "count"))
      -[MailMainScene setSelectedAccounts:](self, "setSelectedAccounts:", v10);
  }
  else
  {
    -[MailMainScene _resetSelectedAccounts](self, "_resetSelectedAccounts");
  }

  _Block_object_dispose(&v14, 8);
}

- (NSSet)suppressionMailboxes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListContainerViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));
    v7 = (void *)v6;
    v8 = &__NSArray0__struct;
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return (NSSet *)v10;
}

+ (NSArray)menuCommands
{
  void *v2;
  NSMutableArray *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v2 = (void *)qword_1005A9D58;
  if (!qword_1005A9D58)
  {
    v3 = objc_opt_new(NSMutableArray);
    v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailMainScene));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TITLE_NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMenuCommand shortcutWithInput:flags:repeatable:menu:action:title:plist:](MFMailMenuCommand, "shortcutWithInput:flags:repeatable:menu:action:title:plist:", CFSTR("n"), 0x100000, 1, 0, "_composeCommandInvoked:", v6, 0));
    -[NSMutableArray addObject:](v3, "addObject:", v7);

    if (_os_feature_enabled_impl("Mail", "OpenMailboxQuickly"))
    {
      v8 = _EFLocalizedString(CFSTR("Open Mailbox Quickly"), &unk_10059D2A0, &unk_10059D2A8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMenuCommand shortcutWithInput:flags:repeatable:menu:action:title:plist:](MFMailMenuCommand, "shortcutWithInput:flags:repeatable:menu:action:title:plist:", CFSTR("o"), 1179648, 1, 1, "_openMailboxQuicklyInvoked:", v9, 0));
      -[NSMutableArray addObject:](v3, "addObject:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFDevice currentDevice](EFDevice, "currentDevice"));
    v12 = objc_msgSend(v11, "isInternal");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("d"), 1966080, "debugShortcutInvoked:"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_nonRepeatableKeyCommand"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v14, 0));
      -[NSMutableArray addObject:](v3, "addObject:", v15);

    }
    v16 = -[NSMutableArray copy](v3, "copy");
    v17 = (void *)qword_1005A9D58;
    qword_1005A9D58 = (uint64_t)v16;

    v2 = (void *)qword_1005A9D58;
  }
  return (NSArray *)v2;
}

- (void)_requestUserNotificationAuthorization
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];

  if (-[MailMainScene activationState](self, "activationState") == (id)2)
  {
    v3 = MSUserNotificationsLog(-[MailMainScene setShouldRequestUserNotificationAuthorization:](self, "setShouldRequestUserNotificationAuthorization:", 1));
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Postponing authorization check.", buf, 2u);
    }

  }
  else
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter currentNotificationCenter](UNUserNotificationCenter, "currentNotificationCenter"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100012D1C;
    v6[3] = &unk_10051E7A8;
    objc_copyWeak(&v7, (id *)buf);
    objc_msgSend(v5, "getNotificationSettingsWithCompletionHandler:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_shouldPresentOnboarding
{
  void *v3;
  NSObject *v4;
  BOOL v5;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  if ((objc_msgSend(v3, "launchedToTest") & 1) != 0 || objc_msgSend(v3, "isRunningTest"))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Onboarding not presented -- test is running", v7, 2u);
    }

    v5 = 0;
  }
  else if (-[MailMainScene _shouldPresentWelcomeOnboarding](self, "_shouldPresentWelcomeOnboarding"))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[MailMainScene _shouldPresentMailTrackingProtectionOnboarding](self, "_shouldPresentMailTrackingProtectionOnboarding");
  }

  return v5;
}

- (NSSet)visibleMailboxes
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListContainerViewController"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mailboxes"));
  v5 = (void *)v4;
  v6 = &__NSArray0__struct;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  return (NSSet *)v8;
}

- (MailSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSelectedAccounts:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;

  v8 = (NSSet *)a3;
  if (self->_selectedAccounts != v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene errorHandler](self, "errorHandler"));
    objc_msgSend(v5, "reset");

    objc_storeStrong((id *)&self->_selectedAccounts, a3);
    -[MailMainScene setLastSelectedAccountID:](self, "setLastSelectedAccountID:", 0);
    if ((id)-[NSSet count](v8, "count") == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](v8, "anyObject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
      -[MailMainScene setLastSelectedAccountID:](self, "setLastSelectedAccountID:", v7);

    }
  }

}

- (id)_defaultAccountsToSelect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsProvider"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedAccounts"));
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastSelectedItem"));

    if (v7)
    {
      if (((unint64_t)objc_msgSend(v7, "type") & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        v8 = v5;
        if (v8)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
          v11 = objc_msgSend(v5, "containsObject:", v10);

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "account"));
            v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));

            if (v8)
              goto LABEL_11;
          }
        }
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedAccounts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));

    goto LABEL_11;
  }
  v8 = objc_alloc_init((Class)NSSet);
LABEL_12:

  return v8;
}

- (void)_setupMailViewHierarchyWithState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  FavoritesManager *v7;
  void *v8;
  void *v9;
  void *v10;
  FavoritesManager *v11;
  MailboxPickerOutlineController *v12;
  void *v13;
  MailboxPickerOutlineController *v14;
  MailNavigationController *v15;
  void *v16;
  void *v17;
  void *v18;
  MailNavigationController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MailSplitViewController *v25;
  DockContainerViewController *v26;
  void *v27;
  void *v28;
  void *v29;
  DockContainerViewController *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  MailDetailNavigationController *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[5];
  _BYTE buf[12];
  void *v53;
  void *v54;

  v47 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistence"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationPersistence"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsProvider"));

  v7 = [FavoritesManager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "favoritesPersistence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "favoritesManagerState"));
  v11 = -[FavoritesManager initWithFavoritesPersistence:collections:conversationSubscriptionProvider:](v7, "initWithFavoritesPersistence:collections:conversationSubscriptionProvider:", v9, v10, v45);
  -[MailMainScene setFavoritesManager:](self, "setFavoritesManager:", v11);

  v12 = [MailboxPickerOutlineController alloc];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
  v14 = -[MailboxPickerOutlineController initWithMainScene:favoritesManager:accountsProvider:](v12, "initWithMainScene:favoritesManager:accountsProvider:", self, v13, v46);
  -[MailMainScene setMailboxPickerController:](self, "setMailboxPickerController:", v14);

  v15 = -[MailNavigationController initWithNavigationBarClass:toolbarClass:]([MailNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", 0, objc_opt_class(MFProgressToolbar));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v54 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
  -[MailNavigationController setViewControllers:](v15, "setViewControllers:", v17);

  -[MailNavigationController setToolbarHidden:](v15, "setToolbarHidden:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailNavigationController navigationBar](v15, "navigationBar"));
  objc_msgSend(v18, "setPrefersLargeTitles:", 1);

  v19 = -[MailNavigationController initWithNavigationBarClass:toolbarClass:]([MailNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", 0, objc_opt_class(MFProgressToolbar));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageListContainerViewController"));
  v53 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
  -[MailNavigationController setViewControllers:](v19, "setViewControllers:", v22);

  -[MailNavigationController setDelegate:](v19, "setDelegate:", self);
  -[MailNavigationController configureBarsForMessageList](v19, "configureBarsForMessageList");
  -[MailMainScene setMasterNavigationController:](self, "setMasterNavigationController:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "messageListContainerViewController"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "conversationViewController"));
  v44 = -[MailDetailNavigationController initWithRootViewController:]([MailDetailNavigationController alloc], "initWithRootViewController:", v43);
  v25 = -[MailSplitViewController initWithMailboxPickerNavigationController:messageListNavigationController:mailDetailNavigationController:scene:]([MailSplitViewController alloc], "initWithMailboxPickerNavigationController:messageListNavigationController:mailDetailNavigationController:scene:", v15, v19, v44, self);
  -[MailMainScene setSplitViewController:](self, "setSplitViewController:", v25);

  v26 = [DockContainerViewController alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dockPersistence"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
  v30 = -[DockContainerViewController initWithPersistence:scene:rootViewController:](v26, "initWithPersistence:scene:rootViewController:", v28, self, v29);

  -[DockContainerViewController setDelegate:](v30, "setDelegate:", self);
  -[MailMainScene setDockContainer:](self, "setDockContainer:", v30);
  -[MailMainScene setShouldSelectDefaultMailboxOnResume:](self, "setShouldSelectDefaultMailboxOnResume:", v47 == 0);
  if (v47)
  {
    v31 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Restoration state is available, beginning restoration...", buf, 2u);
    }

    v32 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "ef_publicDescription"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "State: %{public}@", buf, 0xCu);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "messageListStateFuture"));
    objc_msgSend(v24, "restoreState:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000E61A4;
    v51[3] = &unk_10051B140;
    v51[4] = self;
    objc_msgSend(v34, "onScheduler:addFailureBlock:", v35, v51);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
    objc_msgSend(v36, "restorePrimaryNavigationState:", objc_msgSend(v47, "primaryNavState"));

    if (objc_msgSend(v47, "detailNavState"))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "conversationViewStateFuture"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "conversationViewController"));
      objc_msgSend(v38, "restoreState:", v37);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000E61F8;
      v48[3] = &unk_10051E4F8;
      objc_copyWeak(&v50, (id *)buf);
      v49 = v24;
      objc_msgSend(v37, "onScheduler:addFailureBlock:", v39, v48);

      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);

    }
  }
  v40 = objc_msgSend(objc_alloc((Class)_UISheetDropInteraction), "initWithDelegate:", self);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene delegate](self, "delegate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "window"));

  objc_msgSend(v42, "addInteraction:", v40);
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MFMailComposeControllerViewDelegateHandler *v7;
  void *v8;
  MFMailComposeControllerViewDelegateHandler *v9;
  MFUserActivityRouter *v10;
  void *v11;
  void *v12;
  MFUserActivityRouter *v13;
  _TtC10MobileMail18ComposeUndoHandler *v14;
  void *v15;
  void *v16;
  _TtC10MobileMail18ComposeUndoHandler *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  NSObject *v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  MailMainSceneState *v37;
  MailMainSceneState *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  BOOL v58;
  BOOL v59;
  id v60;
  void *v61;
  void *v62;
  objc_super v63;
  _QWORD v64[2];
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  _BOOL4 v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  _BOOL4 v74;
  __int16 v75;
  _BOOL4 v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  int v80;

  v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)MailMainScene;
  -[MailScene mailSceneDidConnectWithOptions:](&v63, "mailSceneDidConnectWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene extendedLaunchTracker](self, "extendedLaunchTracker"));
  objc_msgSend(v5, "observeScene:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_handleAccountsChanged:", ECMailAccountsDidChangeNotification, 0);

  v7 = [MFMailComposeControllerViewDelegateHandler alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v9 = -[MFMailComposeControllerViewDelegateHandler initWithUICoordinator:daemonInterface:](v7, "initWithUICoordinator:daemonInterface:", self, v8);
  -[MailMainScene setComposeViewDelegateHandler:](self, "setComposeViewDelegateHandler:", v9);

  v10 = [MFUserActivityRouter alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageRepository"));
  v13 = -[MFUserActivityRouter initWithDelegate:messageRepository:](v10, "initWithDelegate:messageRepository:", self, v12);
  -[MailMainScene setUserActivityRouter:](self, "setUserActivityRouter:", v13);

  if (_os_feature_enabled_impl("Mail", "UndoSend"))
  {
    v14 = [_TtC10MobileMail18ComposeUndoHandler alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "outgoingMessageRepository"));
    v17 = -[ComposeUndoHandler initWithOutgoingMessageRepository:](v14, "initWithOutgoingMessageRepository:", v16);
    -[MailMainScene setComposeUndoHandler:](self, "setComposeUndoHandler:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stateRestorationActivity"));

  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 16))
  {
    v19 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10039241C();

    v20 = 0;
  }
  else
  {
    v20 = v61;
  }
  v62 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activityType"));
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.mobilemail.state.mailmainscene"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivities"));
  v24 = objc_msgSend(v23, "count");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLContexts"));
  v26 = objc_msgSend(v25, "count");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortcutItem"));
  v59 = v24 != 0;
  v58 = v27 != 0;

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "accountsProvider"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "displayedAccounts"));
  v60 = objc_msgSend(v30, "count");

  v31 = -[MailMainScene _shouldPresentOnboarding](self, "_shouldPresentOnboarding");
  v32 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v56 = v4;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "persistentIdentifier"));
    v33 = v27 != 0;
    v34 = v24 != 0;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mf_activeDraftIdentifier"));
    *(_DWORD *)buf = 138414082;
    v66 = v57;
    v67 = 1024;
    v68 = v22;
    v69 = 1024;
    v70 = v34;
    v71 = 1024;
    v72 = v26 != 0;
    v73 = 1024;
    v74 = v33;
    v75 = 1024;
    v76 = v60 != 0;
    v77 = 2112;
    v78 = v36;
    v79 = 1024;
    v80 = v31 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Connection conditions: sessionID=%@ hasRestorationActivity=%d isExpectingOtherActivity=%d isExpectingURLs=%d isExpectingAppShortcut=%d hasAccounts=%d activeDraftID=%@ hasShownOnboarding=%{BOOL}d", buf, 0x3Au);

    v4 = v56;
  }

  if (!((v60 != 0) & v22) | (v59 || v26 != 0 || v58) | v31 & 1)
  {
    v37 = 0;
  }
  else
  {
    v38 = [MailMainSceneState alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "userInfo"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
    v37 = -[MailMainSceneState initWithDictionary:daemonInterface:](v38, "initWithDictionary:daemonInterface:", v39, v40);

  }
  -[MailMainScene _setupMailViewHierarchyWithState:](self, "_setupMailViewHierarchyWithState:", v37);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mf_activeDraftIdentifier"));

  if (v59 || v26 != 0 || v58 || v60 == 0)
  {
    if (v42)
    {
      v43 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v42;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "A draft (%@) was previously presented in this scene but we're launching to some action. Will recover to the dock...", buf, 0xCu);
      }

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
      objc_msgSend(v44, "mf_setActiveDraftIdentifier:", 0);

      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dockPersistence"));
      objc_msgSend(v46, "recoverAbandonedDrafts");

    }
  }
  else
  {
    -[MailMainScene _beginRestoringPreviousDraftIfPossible](self, "_beginRestoringPreviousDraftIfPossible");
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT (self BEGINSWITH %@)"), MSMailActivityHandoffTypeQuickLook));
  v64[0] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT (self BEGINSWITH %@)"), MSMailActivityHandoffTypeComposeWithStreams));
  v64[1] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v49));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene activationConditions](self, "activationConditions"));
  objc_msgSend(v51, "setCanActivateForTargetContentIdentifierPredicate:", v50);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
  objc_msgSend(v52, "performBlock:", &stru_10051E4D0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "outgoingMessageRepository"));
  objc_msgSend(v54, "addOutgoingMessageRepositoryObserver:", self);

}

- (BOOL)shouldSelectDefaultMailboxOnResume
{
  return self->_shouldSelectDefaultMailboxOnResume;
}

- (BOOL)shouldRequestUserNotificationAuthorization
{
  return self->_shouldRequestUserNotificationAuthorization;
}

- (BOOL)shouldRequestContactAccess
{
  return self->_shouldRequestContactAccess;
}

- (BOOL)shouldDeferUserNotificationAuthorizationRequests
{
  return self->_shouldDeferUserNotificationAuthorizationRequests;
}

- (void)setUserActivityRouter:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityRouter, a3);
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (void)setShouldSelectDefaultMailboxOnResume:(BOOL)a3
{
  self->_shouldSelectDefaultMailboxOnResume = a3;
}

- (void)setShouldRequestUserNotificationAuthorization:(BOOL)a3
{
  self->_shouldRequestUserNotificationAuthorization = a3;
}

- (void)setMasterNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_masterNavigationController, a3);
}

- (void)setMailboxPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxPickerController, a3);
}

- (void)setLastSelectedAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedAccountID, a3);
}

- (void)setFavoritesManager:(id)a3
{
  objc_storeStrong((id *)&self->_favoritesManager, a3);
}

- (void)setDockContainer:(id)a3
{
  objc_storeStrong((id *)&self->_dockContainer, a3);
}

- (void)setComposeViewDelegateHandler:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, a3);
}

- (void)setComposeUndoHandler:(id)a3
{
  objc_storeStrong((id *)&self->_composeUndoHandler, a3);
}

- (NSSet)selectedAccounts
{
  NSSet *selectedAccounts;
  NSSet *v4;
  NSSet *v5;

  selectedAccounts = self->_selectedAccounts;
  if (!selectedAccounts)
  {
    v4 = (NSSet *)objc_alloc_init((Class)NSSet);
    v5 = self->_selectedAccounts;
    self->_selectedAccounts = v4;

    selectedAccounts = self->_selectedAccounts;
  }
  return selectedAccounts;
}

- (id)newComposeButtonItem
{
  return (id)objc_claimAutoreleasedReturnValue(+[ComposeButtonItem composeButtonItemWithTarget:](ComposeButtonItem, "composeButtonItemWithTarget:", self));
}

- (MailboxPickerOutlineController)mailboxPickerController
{
  return self->_mailboxPickerController;
}

- (void)mailSceneWillEnterForeground
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailMainScene;
  -[MailScene mailSceneWillEnterForeground](&v4, "mailSceneWillEnterForeground");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene errorHandler](self, "errorHandler"));
  objc_msgSend(v3, "reset");

  if (-[MailMainScene shouldSelectDefaultMailboxOnResume](self, "shouldSelectDefaultMailboxOnResume"))
  {
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
    -[MailMainScene setShouldSelectDefaultMailboxOnResume:](self, "setShouldSelectDefaultMailboxOnResume:", 0);
    -[MailMainScene selectDefaultMailbox](self, "selectDefaultMailbox");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 1);
  }
}

- (FavoritesManager)favoritesManager
{
  return self->_favoritesManager;
}

- (id)extendedLaunchTracker
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "extendedLaunchTracker"));

  return v3;
}

- (MailErrorHandler)errorHandler
{
  MailErrorHandler *errorHandler;
  MailErrorHandler *v4;
  MailErrorHandler *v5;
  void *v6;

  errorHandler = self->_errorHandler;
  if (!errorHandler)
  {
    v4 = objc_alloc_init(MailErrorHandler);
    v5 = self->_errorHandler;
    self->_errorHandler = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene errorHandler](self, "errorHandler"));
    objc_msgSend(v6, "setPresentationDelegate:", self);

    errorHandler = self->_errorHandler;
  }
  return errorHandler;
}

- (DockContainerViewController)dockContainer
{
  return self->_dockContainer;
}

- (AccountSetupController)accountSetupController
{
  return self->_accountSetupController;
}

- (id)_statusStringForCNAuthorizationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_10051E850[a3];
}

- (void)_requestContactStoreAccessIfNeeded
{
  CNAuthorizationStatus v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  int v8;
  void *v9;

  v3 = +[CNContactStore authorizationStatusForEntityType:](CNContactStore, "authorizationStatusForEntityType:", 0);
  v4 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _statusStringForCNAuthorizationStatus:](self, "_statusStringForCNAuthorizationStatus:", v3));
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current contact store access status: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  if (v3 == CNAuthorizationStatusNotDetermined)
  {
    if (-[MailMainScene activationState](self, "activationState") == (id)2)
    {
      -[MailMainScene setShouldRequestContactAccess:](self, "setShouldRequestContactAccess:", 1);
    }
    else
    {
      -[MailMainScene setShouldRequestContactAccess:](self, "setShouldRequestContactAccess:", 0);
      v6 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Requesting Contact Store access", (uint8_t *)&v8, 2u);
      }

      v7 = objc_alloc_init((Class)CNContactStore);
      objc_msgSend(v7, "requestAccessForEntityType:completionHandler:", 0, &stru_10051E758);

    }
  }
}

- (BOOL)_isMailboxListVisible
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
  v3 = (char *)objc_msgSend(v2, "displayMode");

  return (unint64_t)(v3 - 4) < 3;
}

- (BOOL)_isDisplayingAccountSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    v7 = v5 == v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_beginRestoringPreviousDraftIfPossible
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE buf[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mf_activeDraftIdentifier"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Beginning validation of prevously presented draft ID: %{public}@", buf, 0xCu);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFPromise promise](EFPromise, "promise"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000E6340;
    v17[3] = &unk_10051A910;
    v18 = v4;
    v8 = v6;
    v19 = v8;
    objc_msgSend(v7, "performBlock:", v17);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000E64BC;
    v16[3] = &unk_10051E520;
    v16[4] = self;
    objc_msgSend(v9, "onScheduler:addSuccessBlock:", v10, v16);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000E66DC;
    v14[3] = &unk_10051BD98;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v9, "onScheduler:addFailureBlock:", v11, v14);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E6744;
    v12[3] = &unk_10051B1B8;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v9, "always:", v12);
    -[MailMainScene setDraftRestorationFuture:](self, "setDraftRestorationFuture:", v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
}

+ (BOOL)wantsDeferredConnectionActions
{
  return 1;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C660;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9D50 != -1)
    dispatch_once(&qword_1005A9D50, block);
  return (id)qword_1005A9D48;
}

- (BOOL)displayMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  BOOL v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unsigned int v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  unsigned int v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  unsigned __int8 v57;
  char v58;
  void *v59;
  unsigned __int8 v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  uint64_t *v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  unsigned __int8 v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[5];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  char v87;
  _QWORD v88[4];
  id v89;
  id location[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene currentMessageDisplayRequest](self, "currentMessageDisplayRequest"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene currentMessageDisplayRequest](self, "currentMessageDisplayRequest"));
    v7 = objc_msgSend(v6, "hasFinished");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", MFMessageErrorDomain, 1028, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene currentMessageDisplayRequest](self, "currentMessageDisplayRequest"));
      objc_msgSend(v9, "requestAbortedWithError:", v8);

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene messageListContainerViewController](self, "messageListContainerViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "conversationViewController"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  v13 = objc_msgSend(v11, "containsMessage:", v12);

  if (!v13)
  {
    -[MailMainScene setCurrentMessageDisplayRequest:](self, "setCurrentMessageDisplayRequest:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "finishFuture"));
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_1000E720C;
    v88[3] = &unk_10051B1B8;
    objc_copyWeak(&v89, location);
    v67 = v19;
    objc_msgSend(v19, "always:", v88);
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    v87 = 0;
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mailboxes"));
    v68 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ef_firstObjectPassingTest:", &stru_10051E540));
    v66 = v21;
    if (v21)
      v22 = v21;
    else
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
    v23 = v22;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "account"));
    v65 = (void *)v24;
    if (!v70 || !v23 || !v24)
    {
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_1000E7514;
      v71[3] = &unk_10051D620;
      v73 = &v84;
      v72 = v4;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      objc_msgSend(v32, "performBlock:", v71);

LABEL_51:
      v18 = *((_BYTE *)v85 + 24) != 0;

      _Block_object_dispose(&v84, 8);
      objc_destroyWeak(&v89);
      objc_destroyWeak(location);

      goto LABEL_52;
    }
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1000E7260;
    v83[3] = &unk_10051AA98;
    v83[4] = self;
    +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v83);
    objc_msgSend(v69, "dismissAndUnfocus");
    if (objc_msgSend(v23, "type") == (id)5)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mailboxProvider"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "mailboxObjectIDs"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "legacyMailboxForObjectID:", v28));
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[MFComposeMailMessage legacyMessageWithMessage:mailboxUid:](MFComposeMailMessage, "legacyMessageWithMessage:mailboxUid:", v70, v29));

      v63 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initDraftRestoreOfMessage:legacyMessage:", v70, v64);
      -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:");
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 3221225472;
      v81[2] = sub_1000E726C;
      v81[3] = &unk_10051AA98;
      v82 = v4;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      objc_msgSend(v30, "performBlock:", v81);

      v31 = v82;
LABEL_50:

      *((_BYTE *)v85 + 24) = 1;
      goto LABEL_51;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene selectedAccounts](self, "selectedAccounts"));
    v34 = objc_msgSend(v33, "count");

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "ef_firstObjectPassingTest:", &stru_10051E560));
    v37 = (unint64_t)v34 > 1 && v35 != 0;
    v61 = v37;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "flags"));
    v38 = objc_msgSend(v70, "isVIP");
    v39 = objc_msgSend(v64, "flagged");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
    v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "lastSelectedItem"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mailboxesCollection"));

    v42 = objc_msgSend(v63, "sourceType");
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "viewControllerForColumn:", 0));

    v45 = 0;
    if (!v35 || !(v38 | v39))
    {
LABEL_45:
      v56 = objc_msgSend(v44, "popViewControllerAnimated:", 0);
      v57 = v61;
      v58 = v61 ^ 1;
      if (v45)
        v58 = 1;
      if ((v58 & 1) == 0)
        v57 = objc_msgSend(v62, "isShowingAllInboxes");
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1000E7330;
      v74[3] = &unk_10051E588;
      v75 = v69;
      v80 = v57;
      v76 = v70;
      v79 = v45;
      v23 = v23;
      v77 = v23;
      v78 = v4;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
      objc_msgSend(v59, "performBlock:", v74);

      v31 = v62;
      goto LABEL_50;
    }
    if (v38)
    {
      v46 = objc_msgSend(v62, "isShowingSharedMailboxOfType:", 1);
      if (((v46 | v39 ^ 1) & 1) != 0)
      {
        v45 = v46;
        goto LABEL_31;
      }
    }
    else if (!v39)
    {
      LOBYTE(v46) = 0;
      v45 = 0;
      goto LABEL_31;
    }
    v46 = objc_msgSend(v62, "isShowingSharedMailboxOfType:", 2);
    if (v46)
      v45 = 2;
    else
      v45 = 0;
LABEL_31:
    if ((unint64_t)v34 >= 2 && v42)
      goto LABEL_45;
    if ((unint64_t)v34 >= 2 && !v42)
    {
      v45 = 0;
      goto LABEL_45;
    }
    v47 = v46 ^ 1;
    if (v42)
      v47 = 1;
    if ((v47 & 1) != 0)
      goto LABEL_45;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "representingMailbox"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "viewControllers"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "messageListContainerViewController"));
    v51 = objc_msgSend(v49, "containsObject:", v50);
    if ((_DWORD)v51)
    {
      v52 = sub_1000E727C((uint64_t)v51, v48, v68);

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "mailboxProvider"));
        v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "mailboxFromLegacyMailbox:", v48));

        v45 = 0;
        v23 = (id)v55;
LABEL_44:

        goto LABEL_45;
      }
    }
    else
    {

    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "accountsProvider"));
    v61 = objc_msgSend(v54, "isDisplayingMultipleAccounts");
    goto LABEL_44;
  }
  v14 = -[MailMainScene activationState](self, "activationState");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
  objc_msgSend(v15, "showConversationViewControllerAnimated:completion:", v14 == 0, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  objc_msgSend(v11, "scrollToMessageIfPossible:animated:pin:", v16, v14 == 0, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError ef_cancelledError](NSError, "ef_cancelledError"));
  objc_msgSend(v4, "requestAbortedWithError:", v17);

  v18 = 1;
LABEL_52:

  return v18;
}

- (NSSet)statusMailboxes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  if (-[MailMainScene _isMailboxListVisible](self, "_isMailboxListVisible"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleItemsOfType:", 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_flatMap:", &stru_10051E5C8));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_filter:", EFIsNotNull));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mailboxProvider"));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E77C0;
    v18[3] = &unk_10051DAA8;
    v9 = v8;
    v19 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_compactMap:", v18));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v10));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "messageListContainerViewController"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mailboxes"));
    v15 = (void *)v14;
    v16 = &__NSArray0__struct;
    if (v14)
      v16 = (void *)v14;
    v6 = v16;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
  }

  return (NSSet *)v11;
}

- (void)mailSceneWillResignActive
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailMainScene;
  -[MailScene mailSceneWillResignActive](&v9, "mailSceneWillResignActive");
  if (-[MailMainScene isComposeWindowActive](self, "isComposeWindowActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeViewController"));

    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
    objc_msgSend(v6, "finishEnteringRecipients");

    if (objc_msgSend(v5, "isQuickReply"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mailComposeController"));
      objc_msgSend(v7, "backUpDraft");

    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene messageListContainerViewController](self, "messageListContainerViewController"));
  objc_msgSend(v8, "suspendRefreshAnimationIfNecessary");

}

- (void)mailSceneDidEnterBackground
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailMainScene;
  -[MailScene mailSceneDidEnterBackground](&v4, "mailSceneDidEnterBackground");
  -[MailMainScene setShouldDeferUserNotificationAuthorizationRequests:](self, "setShouldDeferUserNotificationAuthorizationRequests:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene errorHandler](self, "errorHandler"));
  objc_msgSend(v3, "reset");

}

- (void)mailSceneDidDisconnect
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MailMainScene;
  -[MailScene mailSceneDidDisconnect](&v6, "mailSceneDidDisconnect");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outgoingMessageRepository"));
  objc_msgSend(v5, "removeOutgoingMessageRepositoryObserver:", self);

}

- (void)mailSceneWillContinueUserActivityWithType:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freeSpaceMonitor"));
  if ((objc_msgSend(v5, "isFreeSpaceCritical") & 1) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  v6 = -[MailMainScene _presentInitialSetupControllersIfNecessary](self, "_presentInitialSetupControllersIfNecessary");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    objc_msgSend(v7, "popToRootViewControllerAnimated:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene userActivityRouter](self, "userActivityRouter"));
    objc_msgSend(v4, "routeWillContinueUserActivityWithType:", v8);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)mailSceneContinueUserActivity:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freeSpaceMonitor"));
  if ((objc_msgSend(v5, "isFreeSpaceCritical") & 1) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  v6 = -[MailMainScene _presentInitialSetupControllersIfNecessary](self, "_presentInitialSetupControllersIfNecessary");

  if ((v6 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene userActivityRouter](self, "userActivityRouter"));
    objc_msgSend(v4, "routeUserActivity:", v7);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)mailSceneDidFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene userActivityRouter](self, "userActivityRouter"));
  objc_msgSend(v7, "routeUserActivityFailedWithType:error:", v8, v6);

}

- (void)mailScenePerformActionForShortcutItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id *v12;
  id *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v14 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freeSpaceMonitor"));
  if ((objc_msgSend(v8, "isFreeSpaceCritical") & 1) != 0)
    goto LABEL_12;
  v9 = -[MailMainScene _presentInitialSetupControllersIfNecessary](self, "_presentInitialSetupControllersIfNecessary");

  if ((v9 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListContainerViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListViewController"));

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilemail.NewMessageApplicationShortcut")))
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000E7F54;
      v22[3] = &unk_10051E618;
      v22[4] = self;
      v23 = v6;
      +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v22);
      v12 = &v23;
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilemail.SearchApplicationShortcut")))
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000E81B4;
        v19[3] = &unk_10051C1C8;
        v19[4] = self;
        v20 = v8;
        v21 = v6;
        +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v19);
        v12 = &v20;
        v13 = &v21;
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilemail.FavoriteItemApplicationShortcut")))
        {
LABEL_11:
          (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
LABEL_12:

          goto LABEL_13;
        }
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_1000E8250;
        v15[3] = &unk_10051E640;
        v15[4] = self;
        v16 = v8;
        v17 = v14;
        v18 = v6;
        +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v15);
        v12 = &v16;
        v13 = &v17;

      }
    }

    goto LABEL_11;
  }
LABEL_13:

}

- (id)stateRestorationActivityForMailScene
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  MailSceneBackgroundQueryMonitor *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MailSceneBackgroundQueryMonitor *v26;
  MailMainSceneState *v27;
  id v28;
  id v29;
  id v30;
  MailMainSceneState *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;

  v3 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _sceneIdentifier](self, "_sceneIdentifier"));
    *(_DWORD *)buf = 138412290;
    v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restoration state was requested for MailMainScene with identifier %@. Starting state capture...", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryRepresentation"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController"));
  v42 = objc_msgSend(v6, "isCollapsed");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForColumn:", 0));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topViewController"));
  v40 = (void *)v7;
  if (v7
    && (v8 = objc_opt_class(MailboxPickerOutlineController), (objc_opt_isKindOfClass(v7, v8) & 1) == 0))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageListNavController"));
    v11 = v7 == (_QWORD)v10;

    if (v11)
      v9 = 1;
    else
      v9 = 2;
  }
  else
  {
    v9 = 0;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForColumn:", 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topViewController"));
  v38 = v12;
  if (v12
    && (v13 = objc_opt_class(ConversationViewController), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    v14 = v12;
    if (objc_msgSend(v14, "isPrimary"))
      v15 = 1;
    else
      v15 = 2;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "captureRestorationState"));
    v17 = objc_msgSend(v14, "newBackgroundMonitor");
    v41 = (void *)v16;
    -[MailScene addBackgroundMonitor:](self, "addBackgroundMonitor:", v17);

  }
  else
  {
    v41 = 0;
    v15 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "messageListContainerViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "captureRestorationState"));

  if (v20)
  {
    v21 = [MailSceneBackgroundQueryMonitor alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "visibleItems"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "messageList"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "messageRepository"));
    v26 = -[MailSceneBackgroundQueryMonitor initWithMessageListItems:messageList:messageRepository:changeTypes:](v21, "initWithMessageListItems:messageList:messageRepository:changeTypes:", v22, v23, v25, 8);

    -[MailScene addBackgroundMonitor:](self, "addBackgroundMonitor:", v26);
  }
  v27 = [MailMainSceneState alloc];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000E89BC;
  v44[3] = &unk_10051E668;
  v28 = v43;
  v45 = v28;
  v48 = v9;
  v49 = v42 ^ 1;
  v50 = v15;
  v29 = v41;
  v46 = v29;
  v30 = v20;
  v47 = v30;
  v31 = -[MailMainSceneState initWithBuilder:](v27, "initWithBuilder:", v44);
  v32 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState ef_publicDescription](v31, "ef_publicDescription"));
    *(_DWORD *)buf = 138543362;
    v52 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Restoration state capture complete: %{public}@", buf, 0xCu);

  }
  v34 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.mobilemail.state.mailmainscene"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainSceneState dictionaryRepresentation](v31, "dictionaryRepresentation"));
  objc_msgSend(v34, "setUserInfo:", v35);

  return v34;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 1;
}

- (id)_createURLRoutes
{
  id v3;
  void *v4;
  id v5;
  MFMessageDisplayURLRoute *v6;
  MFComposeURLRoute *v7;
  MFVIPURLRoute *v8;
  MFFileURLRoute *v9;
  MFMailboxURLRoute *v10;
  id v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MailMainScene;
  v3 = -[MailScene _createURLRoutes](&v13, "_createURLRoutes");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = -[MFMessageDisplayURLRoute initWithScene:]([MFMessageDisplayURLRoute alloc], "initWithScene:", self);
  objc_msgSend(v5, "addObject:", v6);

  v7 = -[MFComposeURLRoute initWithScene:]([MFComposeURLRoute alloc], "initWithScene:", self);
  objc_msgSend(v5, "addObject:", v7);

  v8 = -[MFVIPURLRoute initWithScene:]([MFVIPURLRoute alloc], "initWithScene:", self);
  objc_msgSend(v5, "addObject:", v8);

  v9 = -[MFFileURLRoute initWithScene:]([MFFileURLRoute alloc], "initWithScene:", self);
  objc_msgSend(v5, "addObject:", v9);

  v10 = -[MFMailboxURLRoute initWithScene:]([MFMailboxURLRoute alloc], "initWithScene:", self);
  objc_msgSend(v5, "addObject:", v10);

  v11 = objc_msgSend(v5, "copy");
  return v11;
}

- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  if ((objc_msgSend(v8, "mf_isOAuthRedirectURL") & 1) != 0)
  {

LABEL_5:
    v13.receiver = self;
    v13.super_class = (Class)MailMainScene;
    v11 = -[MailScene urlRouter:decidePolicyForRoutingRequest:](&v13, "urlRouter:decidePolicyForRoutingRequest:", v6, v7);
    goto LABEL_6;
  }
  v9 = -[MailMainScene _presentInitialSetupControllersIfNecessary](self, "_presentInitialSetupControllersIfNecessary");

  if (!v9)
    goto LABEL_5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E8D64;
  v14[3] = &unk_10051B9A0;
  objc_copyWeak(&v16, &location);
  v15 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[EFInvocationToken tokenWithLabel:invocationBlock:](EFInvocationToken, "tokenWithLabel:invocationBlock:", CFSTR("Post account setup action"), v14));
  -[MailMainScene setPostAccountSetupInvocation:](self, "setPostAccountSetupInvocation:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  v11 = 1;
LABEL_6:

  return v11;
}

- (void)dockContainer:(id)a3 didRestoreViewController:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v5 = objc_opt_class(ComposeNavigationController);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    v6 = v10;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeViewDelegateHandler](self, "composeViewDelegateHandler"));
    objc_msgSend(v6, "setMailComposeDelegate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autosaveIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    objc_msgSend(v9, "mf_setActiveDraftIdentifier:", v8);

  }
}

- (void)dockContainer:(id)a3 dockedViewControllerWithIdentifier:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mf_activeDraftIdentifier"));
  v7 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    objc_msgSend(v8, "mf_setActiveDraftIdentifier:", 0);

  }
}

- (void)dockContainer:(id)a3 dockedViewWasTornOffWithIdentifier:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mf_activeDraftIdentifier"));
  v7 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    objc_msgSend(v8, "mf_setActiveDraftIdentifier:", 0);

  }
}

- (BOOL)isComposeWindowActive
{
  void *v2;
  void *v3;
  uint64_t v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeViewController"));

  if (v3 && (v4 = objc_opt_class(ComposeNavigationController), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = objc_msgSend(v3, "isBeingDismissed") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)composeControllerForCompositionContext:(id)a3
{
  id v4;
  ComposeNavigationController *v5;
  void *v6;

  v4 = a3;
  v5 = -[ComposeNavigationController initWithComposition:]([ComposeNavigationController alloc], "initWithComposition:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeViewDelegateHandler](self, "composeViewDelegateHandler"));
  -[ComposeNavigationController setMailComposeDelegate:](v5, "setMailComposeDelegate:", v6);

  return v5;
}

- (void)showComposeWithContext:(id)a3 animated:(BOOL)a4 initialTitle:(id)a5 presentationSource:(id)a6 completionBlock:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(void);
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  Class v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  id v34;
  id v35;
  _BOOL4 v36;
  _QWORD *v37;
  void *v38;
  _QWORD v39[5];
  NSObject *v40;
  id v41;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v38 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeControllerForCompositionContext:](self, "composeControllerForCompositionContext:", v12));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originalMessage"));

    if (v17 && objc_msgSend(v12, "composeType") != (id)4)
      objc_msgSend(v12, "composeType");
    if (v13)
      objc_msgSend(v16, "setInitialTitle:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeCompletionBlock](self, "composeCompletionBlock"));

    if (v18)
    {
      v19 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[MailMainScene composeCompletionBlock](self, "composeCompletionBlock"));
      v19[2]();

    }
    -[MailMainScene setComposeCompletionBlock:](self, "setComposeCompletionBlock:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "autosaveIdentifier"));
    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dockPersistence"));
      objc_msgSend(v22, "removeDockedStateWithIdentifier:sender:", v20, 0);

    }
    v36 = v10;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000E9580;
    v39[3] = &unk_10051A960;
    v39[4] = self;
    v23 = v20;
    v40 = v23;
    v24 = v16;
    v41 = v24;
    v37 = objc_retainBlock(v39);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CLFSystemShellSwitcher sharedSystemShellSwitcher](CLFSystemShellSwitcher, "sharedSystemShellSwitcher"));
    v26 = objc_msgSend(v25, "isClarityBoardEnabled");

    if (((+[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1 | v26) & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attachmentToMarkupContentID"));
      v34 = v14;
      v35 = v13;
      if (v27
        && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer")),
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "presentedViewController")),
            v30 = off_10059FC60(),
            isKindOfClass = objc_opt_isKindOfClass(v29, v30),
            v29,
            v28,
            v27,
            (isKindOfClass & 1) != 0))
      {
        v14 = v34;
        v13 = v35;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "presentedViewController"));
        objc_msgSend(v33, "presentViewController:animated:completion:", v24, v36, v37);

      }
      else
      {
        v14 = v34;
        v13 = v35;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer", v34, v35));
        objc_msgSend(v32, "presentViewController:animated:completion:", v24, v36, v37);
      }

    }
    else
    {
      +[MFBayAdoption openComposeWithContext:presentationSource:requestingScene:](MFBayAdoption, "openComposeWithContext:presentationSource:requestingScene:", v12, v14, self);
    }

  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1003924DC();
  }

}

- (void)resumeCompositionOfDraft:(id)a3 legacyDraft:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    v7 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initDraftRestoreOfMessage:legacyMessage:", v8, v6);
  }
  else
  {
    v7 = objc_alloc_init((Class)_MFMailCompositionContext);
    objc_msgSend(v7, "setShowKeyboardImmediately:", 1);
  }
  -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v7, 1, 0, 0, 0);

}

- (void)showComposeWithUserActivity:(id)a3 completion:(id)a4
{
  +[MFBayAdoption migrateQuickReplyDraft:completion:](MFBayAdoption, "migrateQuickReplyDraft:completion:", a3, a4);
}

- (void)_saveCompositionAsDraft:(id)a3
{
  MFMailComposeDeliveryController *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_mailComposeController"));
  objc_msgSend(v6, "forceSaveAsDraft");
  v3 = -[MFMailComposeDeliveryController initWithComposeController:]([MFMailComposeDeliveryController alloc], "initWithComposeController:", v6);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", "deliverMessage", v3, 0, 6, 1));
    objc_msgSend(v4, "addInvocation:", v5);

  }
}

- (void)hasDelayedMessagesDidChange:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  LOBYTE(v5) = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000E9880, &unk_10051C6A8, self, v5));
  objc_msgSend(v3, "performBlock:", &v4);

}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v8;
  objc_super v10;

  v6 = a4;
  if ("_composeCommandInvoked:" == a3 || "debugShortcutInvoked:" == a3)
  {
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MailMainScene;
    v8 = -[MailScene canPerformAction:withSender:](&v10, "canPerformAction:withSender:", a3, v6);
  }

  return v8;
}

- (void)_composeCommandInvoked:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, int);
  void *v10;
  MailMainScene *v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000E9AA8;
  v10 = &unk_10051D8F8;
  v11 = self;
  v4 = a3;
  v12 = v4;
  v5 = objc_retainBlock(&v7);
  if (-[MailMainScene isComposeWindowActive](self, "isComposeWindowActive", v7, v8, v9, v10, v11))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    objc_msgSend(v6, "dockPresentedViewControllerWithCompletion:", v5);

  }
  else
  {
    ((void (*)(void ***, uint64_t))v5[2])(v5, 1);
  }

}

- (void)_openMailboxQuicklyInvoked:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  if (!-[MailMainScene isOpenMailboxQuicklyViewVisible](self, "isOpenMailboxQuicklyViewVisible", a3))
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v4 = objc_msgSend(v6, "isEditing");

    if (v4)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
      objc_msgSend(v7, "setEditing:animated:", 0, 1);

    }
    -[MailMainScene refreshOpenMailboxQuicklyItems](self, "refreshOpenMailboxQuicklyItems");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene openMailboxQuicklyViewController](self, "openMailboxQuicklyViewController"));
    objc_msgSend(v8, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (BOOL)isOpenMailboxQuicklyViewVisible
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  if (!self->_openMailboxQuicklyViewController)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene openMailboxQuicklyViewController](self, "openMailboxQuicklyViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewIfLoaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = v4 != 0;

  return v5;
}

- (UIViewController)openMailboxQuicklyViewController
{
  UIViewController *openMailboxQuicklyViewController;
  void *v4;
  UIViewController *v5;
  UIViewController *v6;

  openMailboxQuicklyViewController = self->_openMailboxQuicklyViewController;
  if (!openMailboxQuicklyViewController)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
    v5 = (UIViewController *)objc_claimAutoreleasedReturnValue(+[OpenMailboxQuicklyFactory createOpenMailboxQuicklyViewControllerWithFavoritesManager:delegate:](_TtC10MobileMail25OpenMailboxQuicklyFactory, "createOpenMailboxQuicklyViewControllerWithFavoritesManager:delegate:", v4, self));
    v6 = self->_openMailboxQuicklyViewController;
    self->_openMailboxQuicklyViewController = v5;

    openMailboxQuicklyViewController = self->_openMailboxQuicklyViewController;
  }
  return openMailboxQuicklyViewController;
}

- (void)refreshOpenMailboxQuicklyItems
{
  NSMutableArray *v3;
  NSMutableSet *v4;
  void *v5;
  void *v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  void *v16;
  NSArray *openMailboxQuicklyItems;
  MailMainScene *v18;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableSet);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleMailboxCollections"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = v7;
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemsIncludingSubItems"));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemURLString"));
              if (v15 && (-[NSMutableSet containsObject:](v4, "containsObject:", v15) & 1) == 0)
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(+[OpenMailboxQuicklyFactory createOpenMailboxQuicklyItemWithFavoriteItem:](_TtC10MobileMail25OpenMailboxQuicklyFactory, "createOpenMailboxQuicklyItemWithFavoriteItem:", v14));
                if (v16)
                {
                  -[NSMutableArray addObject:](v3, "addObject:", v16);
                  -[NSMutableSet addObject:](v4, "addObject:", v15);
                }

              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

  openMailboxQuicklyItems = v18->_openMailboxQuicklyItems;
  v18->_openMailboxQuicklyItems = &v3->super;

}

- (void)openMailboxQuicklyDidSelectMailboxWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
  v16 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemsMatchingItemURLStrings:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartMailbox"));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[NSObject favoriteItemSelectionTarget](v9, "favoriteItemSelectionTarget"));
      -[NSObject selectCombinedInboxWithSourceType:item:animated:](v11, "selectCombinedInboxWithSourceType:item:animated:", objc_msgSend(v8, "sourceType"), v8, 0);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representingMailbox"));

      if (v12)
      {
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representingMailbox"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject favoriteItemSelectionTarget](v9, "favoriteItemSelectionTarget"));
        objc_msgSend(v13, "selectMailbox:item:animated:", v11, v8, 0);

      }
      else
      {
        v11 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to select mailbox since no mailbox was found for FavoriteItem", v15, 2u);
        }
      }
    }

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to select mailbox since no matching FavoriteItem with identifier was found", v15, 2u);
    }
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)closeOpenMailboxQuicklyViewController
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)composeButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _BYTE location[12];
  __int16 v23;
  int v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6 && objc_msgSend(v6, "modalPresentationStyle") == (id)7)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000EA6FC;
    v19[3] = &unk_10051B9A0;
    objc_copyWeak(&v21, (id *)location);
    v20 = v4;
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v19);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Created invocation to update aliases.", location, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"));
    v10 = +[MFMonitoredInvocation mf_invocationWithSelector:target:](MFMonitoredInvocation, "mf_invocationWithSelector:target:", "updateEmailAliasesForActiveAccounts", objc_opt_class(MailAccount));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "addInvocation:", v11);

    v18 = -86;
    v12 = objc_alloc_init((Class)_MFMailCompositionContext);
    objc_msgSend(v12, "setShowKeyboardImmediately:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeAccountIsDefault:](self, "composeAccountIsDefault:", &v18));
    v14 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ef_publicDescription"));
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v15;
      v23 = 1024;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Compose using account:%@, isDefault: %{BOOL}d.", location, 0x12u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultEmailAddress"));
    v17 = v16;
    if (!v16)
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstEmailAddress"));
    objc_msgSend(v12, "setPreferredSendingEmailAddress:", v17);
    if (!v16)

    objc_msgSend(v12, "setIsUsingDefaultAccount:", v18);
    objc_msgSend(v12, "setPrefersFirstLineSelection:", 1);
    -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v12, 1, 0, 0, 0);

  }
}

- (void)composeButtonLongPressed:(id)a3
{
  id v4;
  PreviousDraftPickerController *v5;
  void *v6;
  void *v7;
  PreviousDraftPickerController *v8;
  void *v9;
  PreviousDraftPickerPopoverPresentationDelegate *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];

  v4 = a3;
  v5 = [PreviousDraftPickerController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageRepository"));
  v8 = -[PreviousDraftPickerController initWithMessageRepository:](v5, "initWithMessageRepository:", v7);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000EA96C;
  v16[3] = &unk_10051E690;
  v16[4] = self;
  -[PreviousDraftPickerController setActionBlock:](v8, "setActionBlock:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene previousDraftPickerPopoverPresentationDelegate](self, "previousDraftPickerPopoverPresentationDelegate"));

  if (!v9)
  {
    v10 = objc_alloc_init(PreviousDraftPickerPopoverPresentationDelegate);
    -[MailMainScene setPreviousDraftPickerPopoverPresentationDelegate:](self, "setPreviousDraftPickerPopoverPresentationDelegate:", v10);

  }
  -[PreviousDraftPickerController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PreviousDraftPickerController popoverPresentationController](v8, "popoverPresentationController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene previousDraftPickerPopoverPresentationDelegate](self, "previousDraftPickerPopoverPresentationDelegate"));
  objc_msgSend(v11, "setDelegate:", v12);

  objc_msgSend(v11, "setPermittedArrowDirections:", 3);
  v13 = objc_opt_class(UIBarButtonItem);
  if ((objc_opt_isKindOfClass(v4, v13) & 1) != 0)
  {
    objc_msgSend(v11, "setBarButtonItem:", v4);
  }
  else
  {
    v14 = v4;
    objc_msgSend(v11, "setSourceView:", v14);
    objc_msgSend(v14, "bounds");
    objc_msgSend(v11, "setSourceRect:");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  objc_msgSend(v15, "presentViewController:animated:completion:", v8, 1, 0);

}

- (void)mailComposeDeliveryControllerWillAttemptToSend:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EAC30;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", a3));
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)mailComposeDeliveryControllerDidAttemptToSend:(id)a3 outgoingMessageDelivery:(id)a4 result:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (((unint64_t)objc_msgSend(v9, "status") & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
    v11 = objc_msgSend(v10, "isDataAvailable");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
      -[MailMainScene displayError:forAccount:mode:](self, "displayError:forAccount:mode:", v12, v13, 2);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"));
  objc_msgSend(v14, "reset");

}

- (void)mailComposeDeliveryControllerDidAttemptToSaveDraft:(id)a3 account:(id)a4 result:(unint64_t)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (!a5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
    v10 = objc_msgSend(v9, "isDataAvailable");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
      -[MailMainScene displayError:forAccount:mode:](self, "displayError:forAccount:mode:", v11, v8, 2);

    }
  }

}

- (void)mailComposeDeliveryController:(id)a3 didMoveCancelledMessageToDrafts:(id)a4 draftMailboxObjectID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a4;
  v7 = a5;
  v8 = objc_alloc((Class)_MFMailCompositionContext);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageRepository"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailboxProvider"));
  v14 = objc_msgSend(v8, "initWithComposeType:objectID:mailboxID:subject:autosaveID:messageRepository:mailboxProvider:", 2, v9, v7, 0, 0, v11, v13);

  -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", v14, 1, 0, 0, 0);
}

- (void)dismissComposeViewController:(id)a3 animated:(BOOL)a4 afterSending:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  MailMainScene *v22;
  unsigned __int8 v23;
  BOOL v24;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
  objc_msgSend(v9, "mf_setActiveDraftIdentifier:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "messageListContainerViewController"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mailboxes"));
  v14 = objc_msgSend(v13, "ef_any:", &stru_10051E6B0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeViewController"));

  if ((objc_msgSend(v8, "isQuickReply") & 1) == 0)
  {
    if ((objc_msgSend(v16, "isEqual:", v10) & 1) != 0)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000EB388;
      v20[3] = &unk_10051E6D8;
      v21 = v10;
      v22 = self;
      v23 = v14;
      v24 = v5;
      v17 = objc_retainBlock(v20);
      if (v6 && v5)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
        objc_msgSend(v18, "dismissViewControllerWithTransition:completion:", 3, v17);
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
        objc_msgSend(v18, "dismissViewControllerAnimated:completion:", v6, v17);
      }

      v19 = v21;
    }
    else
    {
      v19 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100392508((uint64_t)v8, (uint64_t)v16, v19);
    }

  }
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    sub_100392580((uint64_t)v5, v8, (uint64_t)&v9, v7);
  }

}

- (id)activeViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeViewController"));

  return v3;
}

- (_TtC10MobileMail21AppStoreReviewManager)appStoreReviewManager
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl("Mail", "AppStoreReviewPrompt"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appStoreReviewManager"));

  }
  else
  {
    v3 = 0;
  }
  return (_TtC10MobileMail21AppStoreReviewManager *)v3;
}

- (BOOL)_presentInitialSetupControllersIfNecessary
{
  if (-[MailMainScene presentAccountSetupControllerIfNecessary](self, "presentAccountSetupControllerIfNecessary")
    || -[MailMainScene presentOnboardingIfNecessary](self, "presentOnboardingIfNecessary"))
  {
    return 1;
  }
  -[MailMainScene _requestUserNotificationAuthorization](self, "_requestUserNotificationAuthorization");
  return 0;
}

- (void)_cleanUpDeprecatedOnboarding
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", EMUserDefaultPresentedWhatsNewInSydro);

}

- (BOOL)presentOnboardingIfNecessary
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));

  if (!v3)
    return -[MailMainScene presentNextOnboardingIfNecessary](self, "presentNextOnboardingIfNecessary");
  v4 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Onboarding is already in progress. Aborting onboarding.", v6, 2u);
  }

  return 1;
}

- (BOOL)presentNextOnboardingIfNecessary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MailMainScene _shouldPresentOnboarding](self, "_shouldPresentOnboarding");
  if (v3)
  {
    -[MailMainScene _presentOnboarding](self, "_presentOnboarding");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

      -[MailMainScene setOnboardingNavigationController:](self, "setOnboardingNavigationController:", 0);
      -[MailMainScene setMailTrackingProtectionOnboardingViewController:](self, "setMailTrackingProtectionOnboardingViewController:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));
        objc_msgSend(v7, "invoke");

        -[MailMainScene setPostAccountSetupInvocation:](self, "setPostAccountSetupInvocation:", 0);
      }
      -[MailMainScene _requestUserNotificationAuthorization](self, "_requestUserNotificationAuthorization");
      -[MailMainScene _cleanUpDeprecatedOnboarding](self, "_cleanUpDeprecatedOnboarding");
    }
  }
  return v3;
}

- (void)_presentOnboarding
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene _nextOnboardingController](self, "_nextOnboardingController"));
  if (v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));
      objc_msgSend(v4, "pushViewController:animated:", v7, 1);
    }
    else
    {
      v5 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v7);
      -[MailMainScene setOnboardingNavigationController:](self, "setOnboardingNavigationController:", v5);

      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene onboardingNavigationController](self, "onboardingNavigationController"));
      objc_msgSend(v4, "presentViewController:animated:completion:", v6, 1, 0);

    }
  }

}

- (id)_nextOnboardingController
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _nextWelcomeOnboardingController](self, "_nextWelcomeOnboardingController"));
  if (!v3)
  {
    if (-[MailMainScene _shouldPresentMailTrackingProtectionOnboarding](self, "_shouldPresentMailTrackingProtectionOnboarding"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _createMailTrackingProtectionOnboardingController](self, "_createMailTrackingProtectionOnboardingController"));
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)_nextWelcomeOnboardingController
{
  void *v3;
  char *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v4 = (char *)objc_msgSend(v3, "integerForKey:", EMUserDefaultLastWelcomeOnboardingUpdate);

  if (-[MailMainScene _shouldPresentWelcomeOnboarding](self, "_shouldPresentWelcomeOnboarding"))
  {
    while ((uint64_t)v4 < (uint64_t)+[MUIWelcomeOnboarding maxUpdate](MUIWelcomeOnboarding, "maxUpdate"))
    {
      if (-[MailMainScene _shouldPresentWelcomeOnboardingForUpdate:](self, "_shouldPresentWelcomeOnboardingForUpdate:", ++v4))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _welcomeOnboardingControllerForUpdate:](self, "_welcomeOnboardingControllerForUpdate:", v4));
        if (v5)
          return v5;
      }
    }
  }
  v5 = 0;
  return v5;
}

- (id)_welcomeOnboardingControllerForUpdate:(int64_t)a3
{
  return 0;
}

- (BOOL)_shouldPresentWelcomeOnboarding
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v3 = objc_msgSend(v2, "integerForKey:", EMUserDefaultLastWelcomeOnboardingUpdate);
  LOBYTE(v3) = (uint64_t)v3 < (uint64_t)+[MUIWelcomeOnboarding maxUpdate](MUIWelcomeOnboarding, "maxUpdate");

  return (char)v3;
}

- (BOOL)_shouldPresentWelcomeOnboardingForUpdate:(int64_t)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults", a3));
  v4 = objc_msgSend(v3, "integerForKey:", EMUserDefaultLastWelcomeOnboardingUpdate);

  v5 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current EMUserDefaultLastWelcomeOnboardingUpdate: %@", (uint8_t *)&v8, 0xCu);

  }
  return 0;
}

- (BOOL)_shouldPresentMailTrackingProtectionOnboarding
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v10;
  MailMainScene *v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  uint8_t v15[16];
  uint8_t v16[2];
  __int16 v17;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v4 = objc_msgSend(v3, "integerForKey:", EMUserDefaultLoadRemoteContentKey);

  if ((v4 & 2) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tracking prevention onboarding not presented -- blocking remote content", buf, 2u);
    }

    v11 = self;
    v12 = 1;
    goto LABEL_16;
  }
  if ((v4 & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v13 = "Tracking prevention onboarding not presented -- already set by user";
      v14 = (uint8_t *)&v17;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
LABEL_15:

    v11 = self;
    v12 = 0;
LABEL_16:
    -[MailMainScene _sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:](v11, "_sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:", 0, v12);
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v6 = objc_msgSend(v5, "isMailPrivacyProtectionAllowed");

  v7 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) == 0)
  {
    if (v8)
    {
      *(_WORD *)v16 = 0;
      v13 = "Tracking prevention onboarding not presented -- prohibited by MDM";
      v14 = v16;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v8)
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tracking prevention onboarding should be presented", v15, 2u);
  }

  return 1;
}

- (id)_createMailTrackingProtectionOnboardingController
{
  NSObject *v3;
  void *v4;
  void *v5;
  MailTrackingProtectionOnboardingViewController *v6;
  void *v7;
  _BOOL4 v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v3 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailTrackingProtectionOnboardingViewController](self, "mailTrackingProtectionOnboardingViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    v11 = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Create tracking prevention onboarding (onboarding: %{public}@, account setup: %{public}@)", (uint8_t *)&v11, 0x16u);

  }
  v6 = (MailTrackingProtectionOnboardingViewController *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailTrackingProtectionOnboardingViewController](self, "mailTrackingProtectionOnboardingViewController"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    v8 = v7 == 0;

    if (!v8)
      return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailTrackingProtectionOnboardingViewController](self, "mailTrackingProtectionOnboardingViewController"));
    v6 = objc_alloc_init(MailTrackingProtectionOnboardingViewController);
    -[MailMainScene setMailTrackingProtectionOnboardingViewController:](self, "setMailTrackingProtectionOnboardingViewController:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_mailTrackingProtectionViewControllerDidFinish:", CFSTR("MailTrackingProtectionOnboardingViewControllerDidCompleteNotification"), 0);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailTrackingProtectionOnboardingViewController](self, "mailTrackingProtectionOnboardingViewController"));
}

- (void)_mailBlackPearlWelcomeViewControllerDidFinish:(id)a3
{
  void *v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailBlackPearlWelcomeOnboardingViewController](self, "mailBlackPearlWelcomeOnboardingViewController", a3));
  v5 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543618;
    v10 = v8;
    v11 = 2048;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Onboarding did finish", (uint8_t *)&v9, 0x16u);

  }
  if (v4)
    -[MailMainScene presentNextOnboardingIfNecessary](self, "presentNextOnboardingIfNecessary");

}

- (void)_mailTrackingProtectionViewControllerDidFinish:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailTrackingProtectionOnboardingViewController](self, "mailTrackingProtectionOnboardingViewController"));
  v6 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v14 = 138543618;
    v15 = v9;
    v16 = 2048;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Onboarding did finish", (uint8_t *)&v14, 0x16u);

  }
  if (v5)
    -[MailMainScene presentNextOnboardingIfNecessary](self, "presentNextOnboardingIfNecessary");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "removeObserver:name:object:", self, CFSTR("MailTrackingProtectionOnboardingViewControllerDidCompleteNotification"), 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MailTrackingProtectionOnboardingViewControllerUserInfoKeyOptedIn")));
  v13 = v12;
  if (v12)
    -[MailMainScene _sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:](self, "_sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:", 1, 0, objc_msgSend(v12, "BOOLValue"));
  else
    -[MailMainScene _sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:](self, "_sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:", 0, 0);

}

- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  _BOOL8 v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a4;
  v5 = a3;
  if (a4)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
    v9 = objc_msgSend(v8, "integerForKey:", EMUserDefaultLoadRemoteContentKey);

    v7 = (v9 & 8) == 0;
  }
  -[MailMainScene _sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:](self, "_sendOnboardingAnalyticsDidShowOnboarding:wasPreviouslyBlockingRemoteContent:optedIn:", v5, v4, v7);
}

- (void)_sendOnboardingAnalyticsDidShowOnboarding:(BOOL)a3 wasPreviouslyBlockingRemoteContent:(BOOL)a4 optedIn:(BOOL)a5
{
  _QWORD block[4];
  BOOL v6;
  BOOL v7;
  BOOL v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC36C;
  block[3] = &unk_10051E718;
  v6 = a3;
  v7 = a4;
  v8 = a5;
  if (qword_1005A9D60 != -1)
    dispatch_once(&qword_1005A9D60, block);
}

- (void)_resetSelectedAccounts
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  uint8_t v14[16];

  v3 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reset Selected Accounts", v14, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageListContainerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conversationViewController"));

  if (v6)
    objc_msgSend(v6, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", 0, 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene favoritesManager](self, "favoritesManager"));
  objc_msgSend(v7, "setLastSelectedItem:", 0);

  -[MailMainScene selectDefaultMailbox](self, "selectDefaultMailbox");
  if (-[MailMainScene activationState](self, "activationState") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene session](self, "session"));
    objc_msgSend(v8, "requestSceneSessionRefresh:", v9);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));
    if (v10)
    {
      if (-[MailMainScene _isDisplayingAccountSetup](self, "_isDisplayingAccountSetup"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
        v12 = objc_msgSend(v11, "accountSetupInProgress");

        if ((v12 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));
      objc_msgSend(v13, "invoke");

      -[MailMainScene setPostAccountSetupInvocation:](self, "setPostAccountSetupInvocation:", 0);
    }
  }
LABEL_13:

}

- (BOOL)presentAccountSetupControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene _defaultAccountsToSelect](self, "_defaultAccountsToSelect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryMailboxUid"));

  if (!v5)
    -[MailMainScene _presentAccountSetupController](self, "_presentAccountSetupController");

  return v5 == 0;
}

- (void)_presentAccountSetupController
{
  void *v3;
  NSObject *v4;
  AccountSetupController *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (!-[MailMainScene _presentAccountRestrictionAlertIfNecessary](self, "_presentAccountRestrictionAlertIfNecessary"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));

    if (!v3)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Presenting account setup controller", v8, 2u);
      }

      v5 = -[AccountSetupController initWithTitle:identifier:]([AccountSetupController alloc], "initWithTitle:identifier:", 0, CFSTR("NEW_ACCOUNT"));
      -[AccountSetupController setAccountSetupDelegate:](v5, "setAccountSetupDelegate:", self);
      -[AccountSetupController setScene:](v5, "setScene:", self);
      -[AccountSetupController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 0);
      -[MailMainScene setAccountSetupController:](self, "setAccountSetupController:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
      objc_msgSend(v6, "presentViewController:animated:completion:", v7, 0, 0);

    }
  }
}

- (void)_dismissAccountSetupControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing account setup controller", v12, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    objc_msgSend(v9, "setAccountSetupDelegate:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
    objc_msgSend(v10, "setScene:", 0);

    -[MailMainScene setAccountSetupController:](self, "setAccountSetupController:", 0);
    -[MailMainScene setAccountSetupFinished:](self, "setAccountSetupFinished:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", v4, v6);

  }
}

- (BOOL)_isAccountCreationRestricted
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  unsigned __int8 v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  uint8_t buf[4];
  unsigned int v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedAccounts"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "accountsProvider"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "displayedAccounts"));
      *(_DWORD *)buf = 67109120;
      v20 = objc_msgSend(v17, "count");
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Displayed account count is %u.", buf, 8u);

    }
    return 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECF80;
  block[3] = &unk_10051AA98;
  block[4] = self;
  if (qword_1005A9D68 != -1)
    dispatch_once(&qword_1005A9D68, block);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v10 = objc_msgSend(v9, "effectiveBoolValueForSetting:", MCFeatureAccountModificationAllowed);

  if (v10 == 2)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1003926BC();
LABEL_11:
    v8 = 1;
LABEL_17:

    return v8;
  }
  v11 = objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  if (!-[NSObject isMultiUser](v11, "isMultiUser"))
  {
    v8 = 0;
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults em_userDefaults](NSUserDefaults, "em_userDefaults"));
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("MultiUserAllowAccountSetup"));

  if ((v13 & 1) == 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1003926E8();
    goto LABEL_11;
  }
  return 0;
}

- (BOOL)_presentAccountRestrictionAlertIfNecessary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;
  void *i;
  void *v19;
  uint64_t v20;
  _QWORD v22[5];

  v3 = -[MailMainScene _isAccountCreationRestricted](self, "_isAccountCreationRestricted");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));
      -[MailMainScene setAccountSetupController:](self, "setAccountSetupController:", 0);
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

    }
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailMainScene));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_RESTRICTION"), &stru_100531B00, CFSTR("Main")));

    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailMainScene));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ACCOUNT_RESTRICTION_DESCRIPTION")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_100531B00, CFSTR("Main")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v12, 1));
    v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailMainScene));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100531B00, CFSTR("Main")));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000ED2EC;
    v22[3] = &unk_10051D948;
    v22[4] = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v16, 0, v22));
    objc_msgSend(v13, "addAction:", v17);

    for (i = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
          ;
          i = (void *)v20)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "presentedViewController"));

      if (!v19)
        break;
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "presentedViewController"));

    }
    objc_msgSend(i, "presentViewController:animated:completion:", v13, 1, 0);

  }
  return v3;
}

- (void)accountSetupControllerDidChange:(id)a3 finished:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  _BOOL4 v16;

  v4 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log", a3));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account setup controller did change. Finished %{BOOL}d", buf, 8u);
  }

  if (v4)
    -[MailMainScene setAccountSetupFinished:](self, "setAccountSetupFinished:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountsProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayedAccounts"));
  v10 = objc_msgSend(v9, "count") == 0;

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene postAccountSetupInvocation](self, "postAccountSetupInvocation"));
      objc_msgSend(v12, "invoke");

      -[MailMainScene setPostAccountSetupInvocation:](self, "setPostAccountSetupInvocation:", 0);
      -[MailMainScene _requestUserNotificationAuthorization](self, "_requestUserNotificationAuthorization");
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000ED4DC;
      v13[3] = &unk_10051C6A8;
      v14 = v4;
      v13[4] = self;
      -[MailMainScene _dismissAccountSetupControllerAnimated:completion:](self, "_dismissAccountSetupControllerAnimated:completion:", 1, v13);
    }
  }
}

- (id)mailboxPickerControllerForActivityRouter:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController", a3));
}

- (id)splitViewControllerForActivityRouter:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController", a3));
}

- (BOOL)displayMessage:(id)a3 fromUserActivityRouter:(id)a4
{
  id v5;
  uint64_t v6;
  MessageDisplayRequest *v7;
  BOOL v8;

  v5 = a3;
  v6 = objc_opt_class(EMMessage);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = -[MessageDisplayRequest initWithMessage:]([MessageDisplayRequest alloc], "initWithMessage:", v5);
    v8 = -[MailMainScene displayMessage:](self, "displayMessage:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)openURL:(id)a3 fromUserActivityRouter:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFURLRoutingRequest requestWithURL:](MFURLRoutingRequest, "requestWithURL:", a3));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "future"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000ED804;
    v21[3] = &unk_10051E5F0;
    v12 = v7;
    v22 = v12;
    objc_msgSend(v10, "onScheduler:addSuccessBlock:", v11, v21);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "future"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
    v16 = _NSConcreteStackBlock;
    v17 = 3221225472;
    v18 = sub_1000ED814;
    v19 = &unk_10051B000;
    v20 = v12;
    objc_msgSend(v13, "onScheduler:addFailureBlock:", v14, &v16);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene urlRouter](self, "urlRouter", v16, v17, v18, v19));
  objc_msgSend(v15, "routeRequest:", v9);

}

- (void)showComposeWithContext:(id)a3 fromActivityRouter:(id)a4
{
  -[MailMainScene showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:](self, "showComposeWithContext:animated:initialTitle:presentationSource:completionBlock:", a3, 1, 0, 0, 0);
}

- (id)composeControllerForCompositionContext:(id)a3 forActivityRouter:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene composeControllerForCompositionContext:](self, "composeControllerForCompositionContext:", a3, a4));
}

- (void)presentComposeController:(id)a3 forUserActivityRouter:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[MailMainScene _dismissAnyModalViewControllerOrPopoverAnimated:](self, "_dismissAnyModalViewControllerOrPopoverAnimated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  objc_msgSend(v5, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)dismissComposeController:(id)a3 forUserActivityRouter:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  v7 = v9;
  if (v6 == v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    v7 = v9;
  }

}

- (id)messageListViewControllerForActivityRouter:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene messageListContainerViewController](self, "messageListContainerViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageListViewController"));

  return v4;
}

- (id)alertOverlayControllerForActivityRouter:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailScene alertOverlayController](self, "alertOverlayController", a3));
}

- (MessageListContainerViewController)messageListContainerViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "messageListContainerViewController"));

  return (MessageListContainerViewController *)v3;
}

- (void)displayMessageListWithMode:(int64_t)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene splitViewController](self, "splitViewController", a3));
  objc_msgSend(v3, "showMessageListViewController:animated:completion:", 1, 0, 0);

}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  MailMainScene *v14;
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a4;
  v14 = self;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler", _NSConcreteStackBlock, 3221225472, sub_1000EDB78, &unk_10051AB60, v14));
  objc_msgSend(v12, "performSyncBlock:", &v13);

}

- (void)_dismissAnyModalViewControllerOrPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene accountSetupController](self, "accountSetupController"));

  if (v5)
    -[MailMainScene _dismissAccountSetupControllerAnimated:completion:](self, "_dismissAccountSetupControllerAnimated:completion:", v3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer"));
  objc_msgSend(v6, "popToRootViewControllerAnimated:", v3);

}

- (id)composeAccountIsDefault:(BOOL *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v26;
  void *v27;
  int v28;
  uint64_t v29;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene lastSelectedAccountID](self, "lastSelectedAccountID"));

  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene lastSelectedAccountID](self, "lastSelectedAccountID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount accountWithUniqueId:](MailAccount, "accountWithUniqueId:", v6));

  v8 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
    v28 = 138543362;
    v29 = (uint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using lastSelectedAccount: %{public}@ for compose.", (uint8_t *)&v28, 0xCu);

  }
  if (!v7)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene mailboxPickerController](self, "mailboxPickerController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageListContainerViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "conversationViewController"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewIfLoaded"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "targetMessageForBarButtonTriage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mailboxes"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_map:", &stru_10051E810));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ef_filter:", EFIsNotNull));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ef_notEmpty"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v20 = objc_opt_class(MFAccount);
      if ((objc_opt_isKindOfClass(v7, v20) & 1) != 0)
      {
        v21 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
          v28 = 138543362;
          v29 = (uint64_t)v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Using account: %{public}@ from referenceMessage for compose.", (uint8_t *)&v28, 0xCu);

        }
      }
      else
      {
        v21 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v23 = objc_opt_class(v7);
          v28 = 138543362;
          v29 = v23;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Using account type is %{public}@.", (uint8_t *)&v28, 0xCu);
        }
      }

      if (v7)
        goto LABEL_13;
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery"));
    v26 = objc_claimAutoreleasedReturnValue(+[MailMainScene log](MailMainScene, "log"));
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_publicDescription"));
      v28 = 138543362;
      v29 = (uint64_t)v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Using default account: %{public}@ for compose.", (uint8_t *)&v28, 0xCu);

    }
    v24 = 1;
    if (a3)
      goto LABEL_14;
    return v7;
  }
LABEL_13:
  v24 = 0;
  if (a3)
LABEL_14:
    *a3 = v24;
  return v7;
}

- (BOOL)_sheetDropInteraction:(id)a3 canHandleUserActivityOfType:(id)a4
{
  id v5;
  unsigned int v6;

  v5 = a4;
  if (objc_msgSend(v5, "ef_caseInsensitiveIsEqualToString:", MSMailActivityHandoffTypeComposeWithStreams))
    v6 = !-[MailMainScene isComposeWindowActive](self, "isComposeWindowActive");
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (id)_sheetDropInteraction:(id)a3 presentingViewControllerForDroppingUserActivityOfType:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(-[MailMainScene dockContainer](self, "dockContainer", a3, a4));
}

- (id)_sheetDropInteraction:(id)a3 viewControllerForDroppingUserActivityOfType:(id)a4
{
  id v5;
  void *v6;

  v5 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene composeControllerForCompositionContext:](self, "composeControllerForCompositionContext:", v5));

  return v6;
}

- (void)_sheetDropInteraction:(id)a3 handleUserActivity:(id)a4 forPresentedViewController:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffTypeKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyMessageData));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyAutosaveID));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeySubject));
  if (objc_msgSend(v9, "length")
    && objc_msgSend(v8, "isEqualToString:", MSMailActivityHandoffTypeComposeSansStreams))
  {
    v12 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:RFC822Data:", 2, v9);
    if (!v12)
      goto LABEL_10;
LABEL_7:
    v18 = objc_opt_class(ComposeNavigationController);
    if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0)
      objc_msgSend(v19, "_setCompositionContext:", v12);
    goto LABEL_10;
  }
  if (!v10)
  {
    v12 = 0;
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", MSMailActivityHandoffComposeKeyOriginalMessageObjectID));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[EMObjectID objectIDFromSerializedRepresentation:](EMObjectID, "objectIDFromSerializedRepresentation:", v13));
  v15 = objc_alloc((Class)_MFMailCompositionContext);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MailScene daemonInterface](self, "daemonInterface"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "messageRepository"));
  v12 = objc_msgSend(v15, "initRecoveredAutosavedMessageWithIdentifier:draftSubject:messageRepository:originalMessageObjectID:", v10, v11, v17, v14);

  if (v12)
    goto LABEL_7;
LABEL_10:

}

- (MFMailPopoverManager)popoverManager
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if (pthread_main_np() != 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MailMainScene.m"), 2106, CFSTR("Current thread must be main"));

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailMainScene delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MFMailPopoverManager managerForWindow:createIfNeeded:](MFMailPopoverManager, "managerForWindow:createIfNeeded:", v5, 1));
  else
    v6 = 0;

  return (MFMailPopoverManager *)v6;
}

- (id)composeCompletionBlock
{
  return self->composeCompletionBlock;
}

- (void)setComposeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)openMailboxQuicklyItems
{
  return self->_openMailboxQuicklyItems;
}

- (MailNavigationController)masterNavigationController
{
  return self->_masterNavigationController;
}

- (MailDetailNavigationController)detailNavigationController
{
  return self->_detailNavigationController;
}

- (void)setDetailNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_detailNavigationController, a3);
}

- (void)setAccountSetupController:(id)a3
{
  objc_storeStrong((id *)&self->_accountSetupController, a3);
}

- (BOOL)accountSetupFinished
{
  return self->_accountSetupFinished;
}

- (void)setAccountSetupFinished:(BOOL)a3
{
  self->_accountSetupFinished = a3;
}

- (void)setShouldRequestContactAccess:(BOOL)a3
{
  self->_shouldRequestContactAccess = a3;
}

- (void)setShouldDeferUserNotificationAuthorizationRequests:(BOOL)a3
{
  self->_shouldDeferUserNotificationAuthorizationRequests = a3;
}

- (ComposeNavigationController)dummySnapshotComposeViewController
{
  return self->_dummySnapshotComposeViewController;
}

- (void)setDummySnapshotComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_dummySnapshotComposeViewController, a3);
}

- (PreviousDraftPickerPopoverPresentationDelegate)previousDraftPickerPopoverPresentationDelegate
{
  return self->_previousDraftPickerPopoverPresentationDelegate;
}

- (void)setPreviousDraftPickerPopoverPresentationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_previousDraftPickerPopoverPresentationDelegate, a3);
}

- (void)setErrorHandler:(id)a3
{
  objc_storeStrong((id *)&self->_errorHandler, a3);
}

- (NSString)lastSelectedAccountID
{
  return self->_lastSelectedAccountID;
}

- (EFInvocable)postAccountSetupInvocation
{
  return self->_postAccountSetupInvocation;
}

- (void)setPostAccountSetupInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_postAccountSetupInvocation, a3);
}

- (MFUserActivityRouter)userActivityRouter
{
  return self->_userActivityRouter;
}

- (EFFuture)draftRestorationFuture
{
  return self->_draftRestorationFuture;
}

- (void)setDraftRestorationFuture:(id)a3
{
  objc_storeStrong((id *)&self->_draftRestorationFuture, a3);
}

- (MessageDisplayRequest)currentMessageDisplayRequest
{
  return self->_currentMessageDisplayRequest;
}

- (void)setCurrentMessageDisplayRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentMessageDisplayRequest, a3);
}

- (UINavigationController)onboardingNavigationController
{
  return self->_onboardingNavigationController;
}

- (void)setOnboardingNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingNavigationController, a3);
}

- (MailTrackingProtectionOnboardingViewController)mailTrackingProtectionOnboardingViewController
{
  return self->_mailTrackingProtectionOnboardingViewController;
}

- (void)setMailTrackingProtectionOnboardingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mailTrackingProtectionOnboardingViewController, a3);
}

- (_TtC10MobileMail18ComposeUndoHandler)composeUndoHandler
{
  return self->_composeUndoHandler;
}

- (void)setOpenMailboxQuicklyViewController:(id)a3
{
  objc_storeStrong((id *)&self->_openMailboxQuicklyViewController, a3);
}

- (OBWelcomeController)mailBlackPearlWelcomeOnboardingViewController
{
  return self->_mailBlackPearlWelcomeOnboardingViewController;
}

- (void)setMailBlackPearlWelcomeOnboardingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mailBlackPearlWelcomeOnboardingViewController, a3);
}

- (MFMailComposeControllerViewDelegateHandler)composeViewDelegateHandler
{
  return self->_composeViewDelegateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewDelegateHandler, 0);
  objc_storeStrong((id *)&self->_mailBlackPearlWelcomeOnboardingViewController, 0);
  objc_storeStrong((id *)&self->_openMailboxQuicklyViewController, 0);
  objc_storeStrong((id *)&self->_composeUndoHandler, 0);
  objc_storeStrong((id *)&self->_mailTrackingProtectionOnboardingViewController, 0);
  objc_storeStrong((id *)&self->_onboardingNavigationController, 0);
  objc_storeStrong((id *)&self->_currentMessageDisplayRequest, 0);
  objc_storeStrong((id *)&self->_draftRestorationFuture, 0);
  objc_storeStrong((id *)&self->_favoritesManager, 0);
  objc_storeStrong((id *)&self->_userActivityRouter, 0);
  objc_storeStrong((id *)&self->_postAccountSetupInvocation, 0);
  objc_storeStrong((id *)&self->_lastSelectedAccountID, 0);
  objc_storeStrong((id *)&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_previousDraftPickerPopoverPresentationDelegate, 0);
  objc_storeStrong((id *)&self->_dummySnapshotComposeViewController, 0);
  objc_storeStrong((id *)&self->_accountSetupController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_detailNavigationController, 0);
  objc_storeStrong((id *)&self->_mailboxPickerController, 0);
  objc_storeStrong((id *)&self->_masterNavigationController, 0);
  objc_storeStrong((id *)&self->_dockContainer, 0);
  objc_storeStrong((id *)&self->_openMailboxQuicklyItems, 0);
  objc_storeStrong(&self->composeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_selectedAccounts, 0);
}

@end
