@implementation ContactsSplitViewController

- (void)setupNavigationController
{
  id v3;
  void *v4;
  id v5;
  CNContactNavigationController *v6;
  CNContactNavigationController *v7;
  CNContactNavigationController *contactNavigationController;
  CNContactNavigationController *v9;
  void *v10;
  id v11;

  v3 = objc_msgSend((id)objc_opt_class(self), "prewarmedContactStoreDataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
  if (v11)
  {
    v5 = objc_alloc((Class)CNContactNavigationController);
    v6 = (CNContactNavigationController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contactFormatter"));
    v7 = (CNContactNavigationController *)objc_msgSend(v5, "initWithDataSource:contactFormatter:applyGroupFilterFromPreferences:environment:allowsLargeTitles:", v11, v6, 0, v4, 1);
    contactNavigationController = self->_contactNavigationController;
    self->_contactNavigationController = v7;

  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_class(self), "newContactStoreDataSourceForSplitViewController");
    v9 = (CNContactNavigationController *)objc_msgSend(objc_alloc((Class)CNContactNavigationController), "initWithDataSource:environment:allowsLargeTitles:", v11, v4, 1);
    v6 = self->_contactNavigationController;
    self->_contactNavigationController = v9;
  }

  -[CNContactNavigationController setAllowsCardEditing:](self->_contactNavigationController, "setAllowsCardEditing:", 1);
  -[CNContactNavigationController setAllowsCardDeletion:](self->_contactNavigationController, "setAllowsCardDeletion:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
  objc_msgSend(v10, "setShouldDisplayMeContactBanner:", 1);

  -[CNContactNavigationController setDelegate:](self->_contactNavigationController, "setDelegate:", self);
}

- (CNContactViewController)presentedContactViewController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CNContactViewController *v12;

  v3 = objc_opt_class(CNContactViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController potentiallyPresentedDetailViewController](self, "potentiallyPresentedDetailViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  if (v10)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

+ (id)prewarmedContactStoreDataSource
{
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v11;

  if (byte_100025B78 == 1)
  {
    kdebug_trace(725483564, 0, 0, 0, 0);
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resourcesPrewarmingQueue"));
    dispatch_async_and_wait(v3, &stru_10001C598);

    v4 = objc_msgSend((id)objc_opt_class(a1), "prewarmContactStoreDataSourceSnapshotBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "resourcesPrewarmingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000047F0;
    block[3] = &unk_10001C5C0;
    v11 = v5;
    v7 = v5;
    dispatch_async(v6, block);

    kdebug_trace(725483568, 0, 0, 0, 0);
    v8 = (void *)qword_100025B70;
    qword_100025B70 = 0;

  }
  return (id)qword_100025B68;
}

- (void)setupKeyCommands
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = (id)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("n"), 0x100000, "addContact:"));
  v3 = CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ADD_CONTACT_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v37, "setDiscoverabilityTitle:", v5);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("f"), 0x100000, "beginSearch:"));
  v6 = CNContactsUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("BEGIN_SEARCH_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v36, "setDiscoverabilityTitle:", v8);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000));
  v9 = CNContactsUIBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SELECT_PREVIOUS_CONTACT_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v35, "setDiscoverabilityTitle:", v11);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("]"), 0x100000));
  v12 = CNContactsUIBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SELECT_NEXT_CONTACT_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v34, "setDiscoverabilityTitle:", v14);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("s"), 1310720, "toggleGroupsPanel:"));
  v16 = CNContactsUIBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("TOGGLE_GROUPS_PANEL_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v15, "setDiscoverabilityTitle:", v18);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0x100000, "deleteContact:"));
  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\b"), 0, "deleteContact:"));
  v21 = CNContactsUIBundle();
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("DELETE_SELECTED_CONTACT_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v20, "setDiscoverabilityTitle:", v23);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("L"), 1179648, "mergeUnifyContacts:"));
  v25 = CNContactsUIBundle();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MERGE_UNIFY_SELECTED_CONTACTS_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v24, "setDiscoverabilityTitle:", v27);

  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("V"), 0x100000, "pasteContacts:"));
  v29 = CNContactsUIBundle();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PASTE_CONTACTS_KEYBOARD_DISCOVERY"), &stru_10001CAA0, CFSTR("Localized")));
  objc_msgSend(v28, "setDiscoverabilityTitle:", v31);

  objc_msgSend(v28, "setWantsPriorityOverSystemBehavior:", 1);
  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v28);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputRightArrow, 0, "selectNextContact:"));
  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputLeftArrow, 0, "selectPreviousContact:"));
  -[ContactsSplitViewController addKeyCommand:](self, "addKeyCommand:", v33);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v5 = objc_alloc((Class)CNSharedProfileOnboardingController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController store](self, "store"));
  v7 = objc_msgSend(v5, "initWithContactStore:", v6);

  if (objc_msgSend(v7, "shouldShowOnboarding"))
  {
    objc_msgSend(v7, "presentOnboardingFlowIfNeededForMode:fromViewController:", 1, self);
    -[ContactsSplitViewController setOnboardingController:](self, "setOnboardingController:", v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)ContactsSplitViewController;
  -[ContactsSplitViewController viewDidAppear:](&v8, "viewDidAppear:", v3);

}

- (void)updateModeOnSplitViewControllerForDisplayMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  ContactsSplitViewController *v10;
  uint64_t v11;
  id v12;

  if (-[ContactsSplitViewController _isCollapsed](self, "_isCollapsed"))
  {
    -[ContactsSplitViewController setPresentsWithGesture:](self, "setPresentsWithGesture:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    objc_msgSend(v5, "setHideGroupsButton:", 0);

    if (-[ContactsSplitViewController isShowingListView](self, "isShowingListView"))
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contactListViewController"));
      objc_msgSend(v6, "deselectAllSelectedIndexPathsAnimated:", 0);

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    objc_msgSend(v7, "setHideGroupsButton:", 1);

    if (a3 == 2
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController")),
          v9 = objc_msgSend(v8, "shouldShowAccountsAndGroups"),
          v8,
          !v9))
    {
      v10 = self;
      v11 = 0;
    }
    else
    {
      v10 = self;
      v11 = 1;
    }
    -[ContactsSplitViewController setPresentsWithGesture:](v10, "setPresentsWithGesture:", v11);
  }
}

- (CNContactStore)store
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "store"));

  return (CNContactStore *)v3;
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  dispatch_time_t v5;
  _QWORD block[5];

  -[ContactsSplitViewController updateModeOnSplitViewControllerForDisplayMode:](self, "updateModeOnSplitViewControllerForDisplayMode:", a4);
  v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004638;
  block[3] = &unk_10001C488;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  void *v5;

  -[ContactsSplitViewController updateModeOnSplitViewControllerForDisplayMode:](self, "updateModeOnSplitViewControllerForDisplayMode:", objc_msgSend(a3, "displayMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController displayedContact](self, "displayedContact"));

  if (v5)
    return 2;
  else
    return 1;
}

- (void)showDetailTargetDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CNContact *v7;

  if ((-[ContactsSplitViewController isCollapsed](self, "isCollapsed", a3) & 1) == 0)
  {
    v7 = self->_displayedContact;
    if (v7)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
      objc_msgSend(v4, "selectContact:animated:scrollPosition:", v7, 1, 0);
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactContainer](self, "contactContainer"));
      v5 = objc_msgSend(v4, "popToRootViewControllerAnimated:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController detailViewController](self, "detailViewController"));

      if (v6 != v4)
        -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v4, 2);
    }

  }
}

- (void)setup
{
  void *v3;

  if (!-[ContactsSplitViewController isSetupFinished](self, "isSetupFinished"))
  {
    -[ContactsSplitViewController setupNavigationController](self, "setupNavigationController");
    -[ContactsSplitViewController setupContainerController](self, "setupContainerController");
    -[ContactsSplitViewController setupGroupsNavigationController](self, "setupGroupsNavigationController");
    -[ContactsSplitViewController setupKeyCommands](self, "setupKeyCommands");
    -[ContactsSplitViewController setupSplitViewControllerProperties](self, "setupSplitViewControllerProperties");
    -[ContactsSplitViewController setupColumns](self, "setupColumns");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "showDetailTargetDidChange:", UIViewControllerShowDetailTargetDidChangeNotification, self);

    -[ContactsSplitViewController setIsSetupFinished:](self, "setIsSetupFinished:", 1);
  }
}

- (void)setupSplitViewControllerProperties
{
  -[ContactsSplitViewController setDelegate:](self, "setDelegate:", self);
  -[ContactsSplitViewController setRestorationIdentifier:](self, "setRestorationIdentifier:", CFSTR("ContactsSplitViewController"));
  -[ContactsSplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 0);
  -[ContactsSplitViewController setPreferredPrimaryColumnWidth:](self, "setPreferredPrimaryColumnWidth:", 320.0);
}

- (void)setupPrimaryColumnViewController
{
  void *v3;
  unsigned int v4;
  UINavigationController *groupsNavigationController;
  UINavigationController *v6;
  UINavigationController *v7;

  v7 = (UINavigationController *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v4 = objc_msgSend(v3, "shouldShowAccountsAndGroups");
  groupsNavigationController = 0;
  if (v4)
    groupsNavigationController = self->_groupsNavigationController;
  v6 = groupsNavigationController;

  if (v7 != v6)
    -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v6, 0);

}

- (void)setupGroupsNavigationController
{
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  UINavigationController *v8;
  UINavigationController *groupsNavigationController;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v4 = objc_msgSend(v3, "shouldShowAccountsAndGroups");

  if (v4)
  {
    v5 = objc_alloc((Class)UINavigationController);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountsAndGroupsViewController"));
    v8 = (UINavigationController *)objc_msgSend(v5, "initWithRootViewController:", v7);
    groupsNavigationController = self->_groupsNavigationController;
    self->_groupsNavigationController = v8;

    v10 = (id)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](self->_groupsNavigationController, "navigationBar"));
    objc_msgSend(v10, "setPrefersLargeTitles:", 1);

  }
}

- (void)setupContainerController
{
  ContactsCardNavigationController *v3;
  ContactsCardNavigationController *v4;
  ContactsCardNavigationController *contactContainer;
  id v6;

  v3 = [ContactsCardNavigationController alloc];
  v6 = objc_alloc_init((Class)UIViewController);
  v4 = -[ContactsCardNavigationController initWithRootViewController:](v3, "initWithRootViewController:", v6);
  contactContainer = self->_contactContainer;
  self->_contactContainer = v4;

}

- (void)setupColumns
{
  -[ContactsSplitViewController setupPrimaryColumnViewController](self, "setupPrimaryColumnViewController");
  -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_contactNavigationController, 1);
  -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_contactContainer, 2);
  -[ContactsSplitViewController setPreferredSupplementaryColumnWidth:](self, "setPreferredSupplementaryColumnWidth:", 375.0);
}

- (void)setIsSetupFinished:(BOOL)a3
{
  self->_isSetupFinished = a3;
}

- (UINavigationController)potentiallyPresentedDetailViewController
{
  return self->_potentiallyPresentedDetailViewController;
}

- (BOOL)isShowingListView
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
  if (objc_msgSend(v3, "isViewLoaded"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isSetupFinished
{
  return self->_isSetupFinished;
}

- (ContactsSplitViewController)initWithStyle:(int64_t)a3
{
  ContactsSplitViewController *v5;
  ContactsSplitViewController *v6;
  ContactsSplitViewController *v7;
  objc_super v9;

  objc_msgSend((id)objc_opt_class(self), "disableCompatiblityWorkaround");
  v9.receiver = self;
  v9.super_class = (Class)ContactsSplitViewController;
  v5 = -[ContactsSplitViewController initWithStyle:](&v9, "initWithStyle:", a3);
  v6 = v5;
  if (v5)
  {
    -[ContactsSplitViewController setup](v5, "setup");
    v7 = v6;
  }

  return v6;
}

- (CNContact)displayedContact
{
  CNContact *v3;
  void *v4;

  v3 = self->_displayedContact;
  if (-[ContactsSplitViewController _isCollapsed](self, "_isCollapsed"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController"));

    if (!v4)
    {

      v3 = 0;
    }
  }
  return v3;
}

- (CNContactStoreDataSource)dataSource
{
  return (CNContactStoreDataSource *)-[CNContactNavigationController dataSource](self->_contactNavigationController, "dataSource");
}

- (CNContactListCollectionView)contactsList
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));

  return (CNContactListCollectionView *)v3;
}

- (CNContactNavigationController)contactNavigationController
{
  return self->_contactNavigationController;
}

- (BOOL)contactNavigationControllerShouldManageGroupsController:(id)a3
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

+ (id)resourcesPrewarmingQueue
{
  void *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;

  v2 = (void *)qword_100025B70;
  if (!qword_100025B70)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.Contacts.ResourcesPrewarming", v4);
    v6 = (void *)qword_100025B70;
    qword_100025B70 = (uint64_t)v5;

    v2 = (void *)qword_100025B70;
  }
  return v2;
}

+ (id)prewarmContactStoreDataSourceSnapshotBlock
{
  return &stru_10001C578;
}

+ (id)prewarmContactStoreDataSourceBlock
{
  _QWORD v3[5];

  byte_100025B78 = 1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004708;
  v3[3] = &unk_10001C558;
  v3[4] = a1;
  return objc_retainBlock(v3);
}

+ (id)newContactStoreDataSourceForSplitViewController
{
  id v2;
  id v3;
  id v4;

  v2 = objc_alloc_init((Class)CNContactStoreConfiguration);
  if (+[CNContact suggestionsEnabled](CNContact, "suggestionsEnabled"))
  {
    objc_msgSend(v2, "setIncludeLocalContacts:", 1);
    objc_msgSend(v2, "setIncludeSuggestedContacts:", 1);
    objc_msgSend(v2, "setIncludeDonatedContacts:", 1);
  }
  objc_msgSend(v2, "setUseInProcessMapperExclusively:", 1);
  v3 = objc_msgSend(objc_alloc((Class)CNContactStore), "initWithConfiguration:", v2);
  v4 = objc_msgSend(objc_alloc((Class)CNContactStoreDataSource), "initWithStore:", v3);

  return v4;
}

+ (void)disableCompatiblityWorkaround
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "registerDefaults:", &off_10001D198);

}

- (ContactsSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  ContactsSplitViewController *v8;
  ContactsSplitViewController *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(self), "disableCompatiblityWorkaround");
  v11.receiver = self;
  v11.super_class = (Class)ContactsSplitViewController;
  v8 = -[ContactsSplitViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, v6);

  if (v8)
  {
    -[ContactsSplitViewController setup](v8, "setup");
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIViewControllerShowDetailTargetDidChangeNotification, self);

  v4.receiver = self;
  v4.super_class = (Class)ContactsSplitViewController;
  -[ContactsSplitViewController dealloc](&v4, "dealloc");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  LOBYTE(a3) = objc_msgSend(v7, "canPerformAction:withSender:", a3, v6);

  return (char)a3;
}

- (void)removeContactViewController
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  -[ContactsSplitViewController setDisplayedContact:](self, "setDisplayedContact:", 0);
  if (-[ContactsSplitViewController isCollapsed](self, "isCollapsed"))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 2));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationController"));
    v4 = objc_msgSend(v3, "popViewControllerAnimated:", 1);

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactContainer](self, "contactContainer"));
    v6 = objc_msgSend(v5, "popToRootViewControllerAnimated:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController detailViewController](self, "detailViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactContainer](self, "contactContainer"));

    if (v7 != v8)
      -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_contactContainer, 2);
  }
}

- (void)resetContactViewController
{
  -[ContactsSplitViewController setDisplayedContact:](self, "setDisplayedContact:", 0);
  -[ContactsSplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", self->_contactContainer, 2);
}

- (void)showCardForContact:(id)a3 fallbackToFirstContact:(BOOL)a4
{
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self->_contactNavigationController, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", a3, 0, 1, a4, 1, 0);
}

- (void)showEditingCardForContact:(id)a3
{
  -[CNContactNavigationController showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:](self->_contactNavigationController, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:", a3, 0, 1, 0, 1, 0);
  -[CNContactNavigationController startEditingPresentedContact](self->_contactNavigationController, "startEditingPresentedContact");
}

- (void)createNewContact
{
  if ((-[CNContactNavigationController isDisplayingAddNewContactViewController](self->_contactNavigationController, "isDisplayingAddNewContactViewController") & 1) == 0)
  {
    if (-[ContactsSplitViewController isShowingGroups](self, "isShowingGroups"))
      -[ContactsSplitViewController showContactList](self, "showContactList");
    -[CNContactNavigationController addContact:animated:](self->_contactNavigationController, "addContact:animated:", 0, 0);
  }
}

- (void)_cancelOutstandingSearch
{
  void *v3;
  unsigned int v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
  v4 = objc_msgSend(v3, "isSearching");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CNContactNavigationController contactListViewController](self->_contactNavigationController, "contactListViewController"));
    objc_msgSend(v5, "cancelSearch:", 0);

  }
}

- (CNContact)unsavedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentViewController"));
    objc_msgSend(v5, "saveModelChangesToContact");

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contact"));
  }
  else
  {
    v6 = 0;
  }
  return (CNContact *)v6;
}

- (BOOL)isShowingGroups
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsAndGroupsViewController"));
  if (objc_msgSend(v4, "isViewLoaded"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountsAndGroupsViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setRestoredContact:(id)a3
{
  CNContact **p_restoredContact;
  CNContact *restoredContact;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CNContact *v11;
  CNContact *v12;
  id v13;

  v13 = a3;
  p_restoredContact = &self->_restoredContact;
  objc_storeStrong((id *)&self->_restoredContact, a3);
  restoredContact = self->_restoredContact;
  if (restoredContact)
    goto LABEL_7;
  if ((-[ContactsSplitViewController _isCollapsed](self, "_isCollapsed") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));

    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      v11 = *p_restoredContact;
      *p_restoredContact = (CNContact *)v10;

    }
  }
  restoredContact = *p_restoredContact;
  if (*p_restoredContact)
  {
LABEL_7:
    -[ContactsSplitViewController showCardForContact:fallbackToFirstContact:](self, "showCardForContact:fallbackToFirstContact:", restoredContact, 0);
    v12 = *p_restoredContact;
  }
  else
  {
    v12 = 0;
  }
  *p_restoredContact = 0;

}

- (void)presentAddContactViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "setModalPresentationStyle:", 1);
  -[ContactsSplitViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, v4, 0);

}

- (void)onboardingControllerDidFinishSetup:(id)a3
{
  -[ContactsSplitViewController setOnboardingController:](self, "setOnboardingController:", 0);
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController", a3));

  if (v6)
    v7 = 0;
  else
    v7 = a4 == 1;
  if (v7)
    a4 = 3;
  if (a4 == 3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactListViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));
    v11 = objc_msgSend(v9, "isValidIndexPath:", v10);

    if ((v11 & 1) == 0)
      -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));
      objc_msgSend(v13, "selectItemAtIndexPath:animated:scrollPosition:", v14, 1, 2);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathsForSelectedItems"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
      objc_msgSend(v13, "deselectItemAtIndexPath:animated:", v16, 1);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController"));

  if (!v17)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000901C;
    v19[3] = &unk_10001C488;
    v19[4] = self;
    -[ContactsSplitViewController _allowingMutationsInDelegateCallback:](self, "_allowingMutationsInDelegateCallback:", v19);
  }
  return a4;
}

- (void)showContactDetailViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = a6;
  v7 = a5;
  v15 = a3;
  v10 = a4;
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "presentedViewController"));
    -[ContactsSplitViewController saveEditingViewControllersAndDismissViewController:](self, "saveEditingViewControllersAndDismissViewController:", v12);

  }
  v13 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v15);
  -[ContactsSplitViewController setPotentiallyPresentedDetailViewController:](self, "setPotentiallyPresentedDetailViewController:", v13);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController potentiallyPresentedDetailViewController](self, "potentiallyPresentedDetailViewController"));
    -[ContactsSplitViewController showDetailViewController:sender:](self, "showDetailViewController:sender:", v14, v10);

  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000091C0;
    v16[3] = &unk_10001C538;
    v16[4] = self;
    v17 = v10;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);

  }
}

- (void)saveEditingViewControllersAndDismissViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childViewControllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_cn_flatMap:", &stru_10001C600));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_cn_filter:", &stru_10001C640));
  objc_msgSend(v5, "_cn_each:", &stru_10001C680);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  return -[ContactsSplitViewController contactNavigationController:presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:](self, "contactNavigationController:presentViewController:animated:dismissingPresentedController:shouldHideContactListIfNeeded:", a3, a4, a5, 1, 1);
}

- (BOOL)contactNavigationController:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 dismissingPresentedController:(BOOL)a6 shouldHideContactListIfNeeded:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  id v15;
  unsigned int v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  _BOOL4 v30;
  _BOOL4 v31;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController presentedContactViewController](self, "presentedContactViewController"));
  v15 = v14;
  v30 = v8;
  v31 = v7;
  v29 = v9;
  if (v14)
  {
    v16 = objc_msgSend(v14, "isEditing");
    v17 = v15 == v13;
    if (v15 != v13 && v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentViewController"));
      objc_msgSend(v18, "saveChanges");

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentViewController"));
      objc_msgSend(v19, "setEditing:animated:", 0, 0);

      v17 = 0;
    }
  }
  else
  {
    v17 = v13 == 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contact"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contactListViewController"));

  v23 = objc_msgSend(v22, "shouldDisplayListHeaderView");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController dataSource](self, "dataSource"));
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "indexPathForContact:", v20));
  v26 = (void *)v25;
  if (v23)
  {

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", objc_msgSend(v26, "item"), (char *)objc_msgSend(v26, "section") + 1));
  }
  else
  {
    v27 = (void *)v25;
    v26 = v24;
  }
  -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v27);

  if (!v17)
  {
    -[ContactsSplitViewController removeContactViewController](self, "removeContactViewController");
    -[ContactsSplitViewController showContactDetailViewController:sender:animated:dismissingPresentedController:](self, "showContactDetailViewController:sender:animated:dismissingPresentedController:", v13, v12, v29, v30);
  }
  -[ContactsSplitViewController setDisplayedContact:](self, "setDisplayedContact:", v20);
  if (-[ContactsSplitViewController contactViewIsCovered](self, "contactViewIsCovered") && v31)
    -[ContactsSplitViewController hideColumn:](self, "hideColumn:", 1);

  return 1;
}

- (BOOL)contactViewIsCovered
{
  return -[ContactsSplitViewController displayMode](self, "displayMode") == (id)3
      || -[ContactsSplitViewController displayMode](self, "displayMode") == (id)5
      || -[ContactsSplitViewController displayMode](self, "displayMode") == (id)6;
}

- (void)showContactList
{
  -[ContactsSplitViewController showColumn:](self, "showColumn:", 1);
}

- (BOOL)groupsPanelIsHidden
{
  id v3;

  v3 = -[ContactsSplitViewController displayMode](self, "displayMode");
  if (v3 != (id)1)
    LOBYTE(v3) = -[ContactsSplitViewController displayMode](self, "displayMode") == (id)2
              || -[ContactsSplitViewController displayMode](self, "displayMode") == (id)3;
  return (char)v3;
}

- (void)toggleGroupsPanel
{
  if ((-[ContactsSplitViewController isCollapsed](self, "isCollapsed") & 1) == 0)
  {
    if (-[ContactsSplitViewController groupsPanelIsHidden](self, "groupsPanelIsHidden"))
      -[ContactsSplitViewController showColumn:](self, "showColumn:", 0);
    else
      -[ContactsSplitViewController hideColumn:](self, "hideColumn:", 0);
  }
}

- (void)showGroupsAnimated:(BOOL)a3
{
  if (-[ContactsSplitViewController groupsPanelIsHidden](self, "groupsPanelIsHidden", a3))
    -[ContactsSplitViewController showColumn:](self, "showColumn:", 0);
}

- (void)contactNavigationControllerClearContactSelection:(id)a3
{
  -[ContactsSplitViewController deselectContactAndSelectNext:](self, "deselectContactAndSelectNext:", 0);
}

- (void)contactNavigationController:(id)a3 didDeleteContact:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController displayedContact](self, "displayedContact"));
  if (v5 == v8)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController displayedContact](self, "displayedContact"));
    v7 = objc_msgSend(v8, "isEqual:", v6);

    if (!v7)
      goto LABEL_6;
  }
  -[ContactsSplitViewController setDisplayedContact:](self, "setDisplayedContact:", 0);
LABEL_6:
  -[ContactsSplitViewController deselectContactAndSelectNext:](self, "deselectContactAndSelectNext:", 1);

}

- (void)deselectContactAndSelectNext:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
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

  v3 = a3;
  if (-[ContactsSplitViewController isCollapsed](self, "isCollapsed"))
  {
    -[ContactsSplitViewController removeContactViewController](self, "removeContactViewController");
    -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
  }
  else if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
    v7 = objc_msgSend(v6, "globalIndexForItemAtIndexPath:", v5);

    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, (char *)objc_msgSend(v5, "section") + 1));
    -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));
    v7 = objc_msgSend(v9, "globalIndexForItemAtIndexPath:", v10);

    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
    if ((uint64_t)objc_msgSend(v5, "row") < 1)
      goto LABEL_8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v5, "row") - 1, objc_msgSend(v5, "section")));
    -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactsList](self, "contactsList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController selectedIndexPath](self, "selectedIndexPath"));
    v7 = objc_msgSend(v12, "globalIndexForItemAtIndexPath:", v13);

    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
      -[ContactsSplitViewController removeContactViewController](self, "removeContactViewController");
    }
    else
    {
LABEL_10:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController dataSource](self, "dataSource"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contacts"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v7));
      -[ContactsSplitViewController showCardForContact:fallbackToFirstContact:](self, "showCardForContact:fallbackToFirstContact:", v18, 1);

    }
  }
  else
  {
    -[ContactsSplitViewController setDisplayedContact:](self, "setDisplayedContact:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactListViewController"));
    objc_msgSend(v15, "deselectAllSelectedIndexPathsAnimated:", 1);

    -[ContactsSplitViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0);
    -[ContactsSplitViewController removeContactViewController](self, "removeContactViewController");
  }
  if ((-[ContactsSplitViewController isCollapsed](self, "isCollapsed") & 1) == 0)
    -[ContactsSplitViewController showColumn:](self, "showColumn:", 1);
}

- (void)searchForString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ContactsSplitViewController showContactList](self, "showContactList");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "searchForString:", v4);

}

- (void)cancelSearch
{
  -[ContactsSplitViewController _cancelOutstandingSearch](self, "_cancelOutstandingSearch");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContactsSplitViewController;
  -[ContactsSplitViewController touchesBegan:withEvent:](&v6, "touchesBegan:withEvent:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController view](self, "view"));
  objc_msgSend(v5, "endEditing:", 1);

}

- (void)beginSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "beginSearch:", v4);

}

- (void)addContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "addContact:", v4);

}

- (void)deleteContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "deleteContact:", v4);

}

- (void)selectNextContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "selectNextContact:", v4);

}

- (void)selectPreviousContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  objc_msgSend(v5, "selectPreviousContact:", v4);

}

- (void)toggleGroupsPanel:(id)a3
{
  -[ContactsSplitViewController toggleGroupsPanel](self, "toggleGroupsPanel", a3);
}

- (id)navigationControllerForPPT
{
  uint64_t v3;
  ContactsSplitViewController *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!-[ContactsSplitViewController _isCollapsed](self, "_isCollapsed"))
  {
    v4 = self;
    v5 = 2;
    goto LABEL_5;
  }
  v3 = objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController viewControllerForColumn:](self, "viewControllerForColumn:", 0));
  if (!v3)
  {
    v4 = self;
    v5 = 1;
LABEL_5:
    v3 = objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController viewControllerForColumn:](v4, "viewControllerForColumn:", v5));
  }
  v6 = (void *)v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController navigationControllerForPotentiallyWrappedViewController:](self, "navigationControllerForPotentiallyWrappedViewController:", v3));

  return v7;
}

- (id)navigationControllerForPotentiallyWrappedViewController:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_opt_class(UINavigationController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "navigationController"));
  v6 = v5;

  return v6;
}

- (id)_multitaskingDragExclusionRects
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v34[4];
  void *v35;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountsAndGroupsViewController"));
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  v6 = -[ContactsSplitViewController groupsPanelIsHidden](self, "groupsPanelIsHidden");

  if ((v6 & 1) != 0)
  {
LABEL_5:
    v32 = &__NSArray0__struct;
    return v32;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountsAndGroupsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "multitaskingDragExclusionRects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  objc_msgSend(v10, "CGRectValue");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContactsSplitViewController contactNavigationController](self, "contactNavigationController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "accountsAndGroupsViewController"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));
  objc_msgSend(v19, "convertRect:fromView:", v22, v12, v14, v16, v18);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v34[0] = v24;
  v34[1] = v26;
  v34[2] = v28;
  v34[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v34, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
  v35 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));

  return v32;
}

- (void)setContactNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_contactNavigationController, a3);
}

- (void)setDisplayedContact:(id)a3
{
  objc_storeStrong((id *)&self->_displayedContact, a3);
}

- (CNContact)restoredContact
{
  return self->_restoredContact;
}

- (ContactsCardNavigationController)contactContainer
{
  return self->_contactContainer;
}

- (UINavigationController)groupsNavigationController
{
  return self->_groupsNavigationController;
}

- (void)setGroupsNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_groupsNavigationController, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void)setPotentiallyPresentedDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_potentiallyPresentedDetailViewController, a3);
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_potentiallyPresentedDetailViewController, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_groupsNavigationController, 0);
  objc_storeStrong((id *)&self->_contactContainer, 0);
  objc_storeStrong((id *)&self->_restoredContact, 0);
  objc_storeStrong((id *)&self->_displayedContact, 0);
  objc_storeStrong((id *)&self->_contactNavigationController, 0);
}

@end
