@implementation MFVIPSendersListTableViewController

- (MFVIPSendersListTableViewController)initWithStyle:(int64_t)a3
{
  MFVIPSendersListTableViewController *v3;
  MFVIPSendersListTableViewController *v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *allVIPs;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFVIPSendersListTableViewController;
  v3 = -[MFVIPSendersListTableViewController initWithStyle:](&v16, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VIP_EDIT"), &stru_100531B00, CFSTR("Main")));
    -[MFVIPSendersListTableViewController setTitle:](v4, "setTitle:", v7);

    -[MFVIPSendersListTableViewController setHidesBottomBarWhenPushed:](v4, "setHidesBottomBarWhenPushed:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedVIPs"));
    v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
    allVIPs = v4->_allVIPs;
    v4->_allVIPs = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v4, "_updateVIPSendersList:", EMVIPsDidChangeNotification, v13);

    if (-[NSMutableArray count](v4->_allVIPs, "count"))
      v14 = 2;
    else
      v14 = 1;
    -[MFVIPSendersListTableViewController setSectionCount:](v4, "setSectionCount:", v14);
  }
  return v4;
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
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewDidLoad](&v16, "viewDidLoad");
  -[MFVIPSendersListTableViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
  if (-[NSMutableArray count](self->_allVIPs, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController dismissButtonItem](self, "dismissButtonItem"));
    +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:", v3, 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController dismissButtonItem](self, "dismissButtonItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController editButtonItem](self, "editButtonItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "setScrollEnabled:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
    objc_msgSend(v9, "flashScrollIndicators");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setRightBarButtonItem:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "windowScene"));
    v14 = (char *)objc_msgSend(v13, "interfaceOrientation");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
    v9 = v15;
    if ((unint64_t)(v14 - 1) > 1)
    {
      objc_msgSend(v15, "setScrollEnabled:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
      objc_msgSend(v9, "flashScrollIndicators");
    }
    else
    {
      objc_msgSend(v15, "setScrollEnabled:", 0);
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillAppear:](&v6, "viewWillAppear:");
  -[MFVIPSendersListTableViewController focus:](self, "focus:", v3);
  if (-[NSMutableArray count](self->_allVIPs, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController mf_updatePreferredContentSizeBasedOnTableView](self, "mf_updatePreferredContentSizeBasedOnTableView"));
    -[MFVIPSendersListTableViewController setTableViewObserver:](self, "setTableViewObserver:", v5);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  if ((-[MFVIPSendersListTableViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0
    || -[MFVIPSendersListTableViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    -[MFVIPSendersListTableViewController unfocus:](self, "unfocus:", v3);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MFVIPSendersListTableViewController mf_updateTableViewBackgroundColorForPopover](self, "mf_updateTableViewBackgroundColorForPopover");

}

- (BOOL)shouldAutorotate
{
  return +[UIDevice mf_isPad](UIDevice, "mf_isPad") ^ 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  if (self->_sectionCount == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
    objc_msgSend(v8, "setScrollEnabled:", 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFVIPSendersListTableViewController;
  -[MFVIPSendersListTableViewController setEditing:animated:](&v10, "setEditing:animated:");
  if (-[NSMutableArray count](self->_allVIPs, "count"))
  {
    if (v5)
      v7 = 3;
    else
      v7 = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController dismissButtonItem](self, "dismissButtonItem"));
    +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:", v8, v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setHidesBackButton:animated:", v5, v4);

}

- (double)preferredNoContentViewHeight
{
  void *v3;
  NSString *v4;
  NSComparisonResult v5;
  void *v6;
  NSString *v7;
  _BOOL4 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraLarge);

  if (v5 == NSOrderedAscending)
    return 203.5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController traitCollection](self, "traitCollection"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));
  v8 = UIContentSizeCategoryCompareToCategory(v7, UIContentSizeCategoryAccessibilityLarge) == NSOrderedAscending;

  return dbl_1004C9B60[v8];
}

- (void)setSectionCount:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  if (self->_sectionCount != a3)
  {
    self->_sectionCount = a3;
    -[MFVIPSendersListTableViewController preferredContentSize](self, "preferredContentSize");
    v6 = v5;
    v7 = 0.0;
    if (a3 == 1)
    {
      -[MFVIPSendersListTableViewController preferredNoContentViewHeight](self, "preferredNoContentViewHeight");
      v7 = v8;
    }
    -[MFVIPSendersListTableViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v7);
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((id)-[MFVIPSendersListTableViewController sectionCount](self, "sectionCount", a3) != (id)2)
    return 0;
  if (a4)
    return 1;
  return (int64_t)-[NSMutableArray count](self->_allVIPs, "count") + 1;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v5;
  char *v6;

  v5 = a4;
  v6 = (char *)objc_msgSend(v5, "section");
  LOBYTE(self) = (uint64_t)v6 < (uint64_t)((char *)-[MFVIPSendersListTableViewController sectionCount](self, "sectionCount")- 1);

  return (char)self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  MFTableViewCell *v8;
  void *v9;
  id v10;
  id v11;
  MFTableViewCell *v12;
  id v13;
  MFTableViewCell *v14;
  MFTableViewCell *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  MFTableViewCell *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (MFTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Cell")));
  if (!v8)
    v8 = -[MFTableViewCell initWithStyle:reuseIdentifier:]([MFTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("Cell"));
  -[MFTableViewCell setSelectionStyle:](v8, "setSelectionStyle:", 1);
  -[MFTableViewCell setAccessoryType:](v8, "setAccessoryType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleBody, 0x8000, 2));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C7B54;
  v17[3] = &unk_1005233D8;
  objc_copyWeak(&v22, &location);
  v18 = v9;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v20 = v11;
  v12 = v8;
  v21 = v12;
  v13 = v9;
  -[MFTableViewCell mf_updateContentConfigurationWithBlock:](v12, "mf_updateContentConfigurationWithBlock:", v17);
  v14 = v21;
  v15 = v12;

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  NSBundle *v8;
  void *v9;

  v6 = -[MFVIPSendersListTableViewController sectionCount](self, "sectionCount", a3);
  v7 = 0;
  if (a4 == 1 && v6 >= 2)
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("VIP_CUSTOM_ALERT_EXPLANATION"), &stru_100531B00, CFSTR("Main")));

  }
  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  int64_t v5;
  double result;
  double v7;

  v5 = -[MFVIPSendersListTableViewController sectionCount](self, "sectionCount", a3, a4);
  result = 0.0;
  if (v5 == 1)
  {
    -[MFVIPSendersListTableViewController preferredContentSize](self, "preferredContentSize", 0.0);
    return v7;
  }
  return result;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4 == 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_allVIPs, "objectAtIndex:", objc_msgSend(v9, "row")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001C8138;
    v16[3] = &unk_10051A960;
    v16[4] = self;
    v17 = v10;
    v18 = v8;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001C8208;
    v14[3] = &unk_10051A848;
    v15 = v12;
    v13 = v12;
    objc_msgSend(v18, "_performBatchUpdates:completion:", v16, v14);

  }
}

- (void)_dismissIfNeeded
{
  if (!-[NSMutableArray count](self->_allVIPs, "count"))
    -[MFVIPSendersListTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, &stru_1005233F8);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  char *v8;

  v5 = a4;
  if (-[MFVIPSendersListTableViewController sectionCount](self, "sectionCount") < 2
    || objc_msgSend(v5, "section")
    || (v6 = objc_msgSend(v5, "row"), v6 != -[NSMutableArray count](self->_allVIPs, "count")))
  {
    v8 = (char *)objc_msgSend(v5, "section");
    v7 = v8 != (char *)-[MFVIPSendersListTableViewController sectionCount](self, "sectionCount") - 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  const __CFData *v17;
  CFTypeRef v18;
  const void *v19;
  ABMutableMultiValueRef MutableCopy;
  CFTypeRef v21;
  const void *v22;
  const __CFArray *v23;
  CFIndex i;
  const void *ValueAtIndex;
  CFIndex FirstIndexOfValue;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  ABRecordRef record;
  void *v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  if (-[MFVIPSendersListTableViewController sectionCount](self, "sectionCount") < 2)
    goto LABEL_4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFPreferencesURL vipSenderListURL](MFPreferencesURL, "vipSenderListURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v8, 0);

    goto LABEL_5;
  }
  v10 = objc_msgSend(v7, "row");
  if (v10 == -[NSMutableArray count](self->_allVIPs, "count"))
  {
LABEL_4:
    -[MFVIPSendersListTableViewController _addNewVIPSender](self, "_addNewVIPSender");
    goto LABEL_5;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_allVIPs, "objectAtIndex:", objc_msgSend(v7, "row")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MFAddressBookManager sharedManager](MFAddressBookManager, "sharedManager"));
  v13 = objc_msgSend(v11, "existingPersonForVIP:usingAddressBook:", v34, objc_msgSend(v12, "addressBook"));

  v14 = -[MFVIPSendersListTableViewController _copyUnknownPersonForVIP:](self, "_copyUnknownPersonForVIP:", v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "emailAddresses"));
  if (objc_msgSend(v15, "count"))
    v16 = +[MFContactsManager isAuthorizedToUseContacts](MFContactsManager, "isAuthorizedToUseContacts");
  else
    v16 = 0;

  if (v13)
  {
    v17 = ABPersonCopyImageData(v13);
    if (v17)
    {
      ABPersonSetImageData(v14, v17, 0);
      CFRelease(v17);
    }
    v18 = ABRecordCopyValue(v14, kABPersonEmailProperty);
    v19 = v18;
    if (v18)
    {
      MutableCopy = ABMultiValueCreateMutableCopy(v18);
      if (MutableCopy)
      {
        v21 = ABRecordCopyValue(v13, kABPersonEmailProperty);
        v22 = v21;
        record = v14;
        if (v21)
        {
          v23 = ABMultiValueCopyArrayOfAllValues(v21);
          if (v23)
          {
            for (i = 0; i < CFArrayGetCount(v23); ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(v23, i);
              FirstIndexOfValue = ABMultiValueGetFirstIndexOfValue(MutableCopy, ValueAtIndex);
              if (FirstIndexOfValue != -1)
              {
                v27 = ABMultiValueCopyLabelAtIndex(v22, i);
                if (v27)
                {
                  ABMultiValueReplaceLabelAtIndex(MutableCopy, v27, FirstIndexOfValue);
                  CFRelease(v27);
                }
              }
            }
            ABRecordSetValue(record, kABPersonEmailProperty, MutableCopy, 0);
            CFRelease(v23);
          }
          CFRelease(v22);
        }
        CFRelease(MutableCopy);
        v14 = (void *)record;
      }
      CFRelease(v19);
    }
    v16 = 0;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController descriptorForRequiredKeys](CNContactViewController, "descriptorForRequiredKeys"));
  v35 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[CNContact contactFromPerson:keysToFetch:](CNContact, "contactFromPerson:keysToFetch:", v14, v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactViewController viewControllerForUnknownContact:](CNContactViewController, "viewControllerForUnknownContact:", v30));
  objc_msgSend(v31, "setDelegate:", self);
  if ((v16 & 1) == 0)
    objc_msgSend(v31, "setActions:", (unint64_t)objc_msgSend(v31, "actions") & 0xFFFFFFFFFFFFFFDFLL);
  objc_msgSend(v31, "_setDataOwnerForCopy:", 3);
  objc_msgSend(v31, "_setDataOwnerForPaste:", 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationController](self, "navigationController"));
  objc_msgSend(v32, "pushViewController:animated:", v31, 1);

  CFRelease(v14);
LABEL_5:
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  v6 = a4;
  objc_msgSend(v6, "mf_updateBackgroundColorForPopover:", -[MFVIPSendersListTableViewController mf_supportsPopoverPresentation](self, "mf_supportsPopoverPresentation"));

}

- (void)_copyUnknownPersonForVIP:(id)a3
{
  id v3;
  ABRecordRef v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ABMutableMultiValueRef Mutable;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = ABPersonCreate();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ec_personNameComponents"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "namePrefix"));
    ABRecordSetValue(v4, kABPersonPrefixProperty, v8, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "givenName"));
    ABRecordSetValue(v4, kABPersonFirstNameProperty, v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "middleName"));
    ABRecordSetValue(v4, kABPersonMiddleNameProperty, v10, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "familyName"));
    ABRecordSetValue(v4, kABPersonLastNameProperty, v11, 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nameSuffix"));
    ABRecordSetValue(v4, kABPersonSuffixProperty, v12, 0);

  }
  Mutable = ABMultiValueCreateMutable(1u);
  if (Mutable)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "emailAddresses", 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v14);
          ABMultiValueAddValueAndLabel(Mutable, *(CFTypeRef *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17), kABOtherLabel, 0);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    ABRecordSetValue(v4, kABPersonEmailProperty, Mutable, 0);
    CFRelease(Mutable);
  }

  return (void *)v4;
}

- (UIBarButtonItem)dismissButtonItem
{
  UIBarButtonItem *dismissButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  dismissButtonItem = self->_dismissButtonItem;
  if (!dismissButtonItem)
  {
    v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:action:](UIBarButtonItem, "mf_newMultiBarButtonItemWithTarget:action:", self, "_dismissButtonTapped:");
    v5 = self->_dismissButtonItem;
    self->_dismissButtonItem = v4;

    dismissButtonItem = self->_dismissButtonItem;
  }
  return dismissButtonItem;
}

- (void)_addNewVIPSender
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init((Class)CNContactPickerViewController);
  objc_msgSend(v6, "setDelegate:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allVIPEmailAddresses"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("emailAddresses.@count > 0 AND NONE emailAddresses.value IN %@"), v4));
  objc_msgSend(v6, "setPredicateForEnablingContact:", v5);

  -[MFVIPSendersListTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  NSBundle *v6;
  void *v7;
  void *v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  if (-[NSMutableArray count](self->_allVIPs, "count", a3))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
    v6 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VIP_MAILBOX"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v5, "setText:", v8);

    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VIP_FIRST_PART_EXPLANATION"), &stru_100531B00, CFSTR("Main")));
    objc_msgSend(v5, "setSecondaryText:", v11);

    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("VIP_ADD_PERSON"), &stru_100531B00, CFSTR("Main")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "button"));
    objc_msgSend(v15, "setTitle:", v14);

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_1001C8F80;
    v21 = &unk_10051D178;
    objc_copyWeak(&v22, &location);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v18));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "buttonProperties", v18, v19, v20, v21));
    objc_msgSend(v17, "setPrimaryAction:", v16);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v4 = v5;
  }
  -[MFVIPSendersListTableViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);

}

- (void)_refreshVIPSendersList
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *allVIPs;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortedVIPs"));
  v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  allVIPs = self->_allVIPs;
  self->_allVIPs = v5;

  -[MFVIPSendersListTableViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (void)_updateVIPSendersList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v4 = -[NSMutableArray count](self->_allVIPs, "count", a3);
  -[MFVIPSendersListTableViewController _refreshVIPSendersList](self, "_refreshVIPSendersList");
  if (!v4 && -[NSMutableArray count](self->_allVIPs, "count"))
    -[MFVIPSendersListTableViewController setSectionCount:](self, "setSectionCount:", 2);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "reloadData");

  if (-[NSMutableArray count](self->_allVIPs, "count"))
  {
    -[MFVIPSendersListTableViewController isEditing](self, "isEditing");
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController dismissButtonItem](self, "dismissButtonItem"));
    +[UIBarButtonItem mf_configureMultiBarButtonItem:usingStyle:](UIBarButtonItem, "mf_configureMultiBarButtonItem:usingStyle:");

    v9 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController dismissButtonItem](self, "dismissButtonItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v5, "setRightBarButtonItem:", v9);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController editButtonItem](self, "editButtonItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v6, "setLeftBarButtonItem:", v10);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController tableView](self, "tableView"));
    objc_msgSend(v11, "setScrollEnabled:", 1);

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v12, "setRightBarButtonItem:", 0);

    -[MFVIPSendersListTableViewController setEditing:](self, "setEditing:", 0);
  }
}

- (id)_labelWithPreferenceStyleFormattingForString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v4, "setText:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline2));
  objc_msgSend(v4, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
  objc_msgSend(v4, "setTextColor:", v6);

  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setNumberOfLines:", 0);

  return v4;
}

- (void)_dismissButtonTapped:(id)a3
{
  -[MFVIPSendersListTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissContactPicker:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(v5, "setDelegate:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController presentedViewController](self, "presentedViewController"));

    if (v4)
      -[MFVIPSendersListTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  id v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFIndex Count;
  CFIndex v13;
  const void *ValueAtIndex;
  CFTypeRef v15;
  const void *v16;
  CFArrayRef v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v21 = a4;
  v6 = objc_alloc_init((Class)CNContactStore);
  v7 = objc_msgSend(v6, "personFromContact:", v21);
  v8 = (__CFString *)ABRecordCopyCompositeName(v7);
  v9 = objc_alloc_init((Class)NSMutableArray);
  v10 = ABPersonCopyArrayOfAllLinkedPeople(v7);
  v11 = v10;
  if (v10)
  {
    Count = CFArrayGetCount(v10);
    if (Count >= 1)
    {
      v13 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v11, v13);
        v15 = ABRecordCopyValue(ValueAtIndex, kABPersonEmailProperty);
        v16 = v15;
        if (v15)
        {
          v17 = ABMultiValueCopyArrayOfAllValues(v15);
          objc_msgSend(v9, "addObjectsFromArray:", v17, v21);
          CFRelease(v16);

        }
        ++v13;
      }
      while (Count != v13);
    }
    CFRelease(v11);
  }
  v18 = objc_msgSend(objc_alloc((Class)EAEmailAddressSet), "initWithArray:", v9);
  v19 = objc_msgSend(objc_alloc((Class)EMVIP), "initWithIdentifier:name:emailAddresses:", 0, v8, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[VIPManager defaultInstance](VIPManager, "defaultInstance"));
  objc_msgSend(v20, "saveVIP:", v19);

  -[MFVIPSendersListTableViewController dismissContactPicker:](self, "dismissContactPicker:", v22);
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFVIPSendersListTableViewController navigationController](self, "navigationController", a3, a4));
  v4 = objc_msgSend(v5, "popViewControllerAnimated:", 0);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 0;
}

- (EFCancelable)tableViewObserver
{
  return self->_tableViewObserver;
}

- (void)setTableViewObserver:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewObserver, a3);
}

- (int64_t)sectionCount
{
  return self->_sectionCount;
}

- (void)setDismissButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButtonItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewObserver, 0);
  objc_storeStrong((id *)&self->_allVIPs, 0);
}

@end
