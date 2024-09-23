@implementation PHContactsTableViewController

- (PHContactsTableViewController)initWithContactArray:(id)a3 contactHandles:(id)a4
{
  id v7;
  id v8;
  PHContactsTableViewController *v9;
  PHContactsTableViewController *v10;
  id v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHContactsTableViewController;
  v9 = -[PHContactsTableViewController init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactArray, a3);
    objc_storeStrong((id *)&v10->_contactHandles, a4);
    v11 = objc_alloc_init((Class)CNContactFormatter);
    -[PHContactsTableViewController setContactFormatter:](v10, "setContactFormatter:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactFormatter](v10, "contactFormatter"));
    objc_msgSend(v12, "setStyle:", 0);

  }
  return v10;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHContactsTableViewController;
  -[PHTableViewController viewDidLoad](&v3, "viewDidLoad");
  -[PHContactsTableViewController setUpTableView](self, "setUpTableView");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactArray](self, "contactArray", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHTableViewCell reuseIdentifier](PHContactsTableViewCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactAtIndex:](self, "contactAtIndex:", objc_msgSend(v6, "row")));
  v11 = objc_msgSend(v6, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController handleAtIndex:](self, "handleAtIndex:", v11));
  if (v10)
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "avatarViewController"));
    if (!v13)
    {
      v14 = objc_alloc((Class)CNAvatarViewController);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController avatarViewControllerSettings](self, "avatarViewControllerSettings"));
      v13 = objc_msgSend(v14, "initWithSettings:", v15);

      objc_msgSend(v13, "setObjectViewControllerDelegate:", self);
      objc_msgSend(v9, "setAvatarViewController:", v13);
    }
    v26 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "avatarViewController"));
    objc_msgSend(v17, "setContacts:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactFormatter](self, "contactFormatter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringFromContact:", v10));

    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "value"));
      if (!v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_CALLER"), &stru_10008B240, CFSTR("PHRecents")));

      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
    objc_msgSend(v22, "setText:", v20);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
    objc_msgSend(v23, "setNumberOfLines:", 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
    objc_msgSend(v24, "setLineBreakMode:", 4);

  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, double, double, double, double);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v6 = a4;
  if ((-[PHContactsTableViewController isEditing](self, "isEditing") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactAtIndex:](self, "contactAtIndex:", objc_msgSend(v6, "row")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController customInfoButtonAction](self, "customInfoButtonAction"));

    if (v8)
    {
      objc_msgSend(v27, "rectForRowAtIndexPath:", v6);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController view](self, "view"));
      objc_msgSend(v17, "convertPoint:toView:", 0, v10, v12);
      v19 = v18;
      v21 = v20;

      v22 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController customInfoButtonAction](self, "customInfoButtonAction"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController view](self, "view"));
      ((void (**)(_QWORD, void *, void *, double, double, double, double))v22)[2](v22, v7, v23, v19, v21, v14, v16);
    }
    else
    {
      v22 = (void (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController handleAtIndex:](self, "handleAtIndex:", objc_msgSend(v6, "row")));
      if (objc_msgSend(v7, "hasBeenPersisted"))
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHContactViewController viewControllerForContact:](PHContactViewController, "viewControllerForContact:", v7));
      else
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHContactViewController viewControllerForUnknownContact:](PHContactViewController, "viewControllerForUnknownContact:", v7));
      v23 = v24;
      if (v24)
      {
        objc_msgSend(v24, "setHandle:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController navigationController](self, "navigationController"));
        objc_msgSend(v25, "pushViewController:animated:", v23, 1);

        objc_msgSend(v23, "setAllowsEditing:", 1);
        objc_msgSend(v23, "setAllowsActions:", 1);
        objc_msgSend(v23, "setActions:", (unint64_t)objc_msgSend(v23, "actions") | 0x80);
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactStore suggestedContactStore](CNContactStore, "suggestedContactStore"));
        objc_msgSend(v23, "setContactStore:", v26);

      }
      objc_msgSend(v27, "deselectRowAtIndexPath:animated:", v6, 0);
    }

  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  -[PHContactsTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", a3, a4);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)contactAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactArray](self, "contactArray"));
  v5 = v4;
  if (a3 < 0 || (unint64_t)objc_msgSend(v4, "count") <= a3)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  return v6;
}

- (id)handleAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactHandles](self, "contactHandles"));
  if (a3 < 0
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController contactHandles](self, "contactHandles")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        (unint64_t)v7 <= a3))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  }

  return v8;
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  CNAvatarViewControllerSettings *avatarViewControllerSettings;
  CNAvatarViewControllerSettings *v4;
  CNAvatarViewControllerSettings *v5;

  avatarViewControllerSettings = self->_avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    v4 = (CNAvatarViewControllerSettings *)objc_claimAutoreleasedReturnValue(+[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings"));
    v5 = self->_avatarViewControllerSettings;
    self->_avatarViewControllerSettings = v4;

    avatarViewControllerSettings = self->_avatarViewControllerSettings;
  }
  return avatarViewControllerSettings;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "type");
  v8 = sub_10000E6C4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == (id)2)
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
      v17 = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v17, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    v13 = TUFormattedPhoneNumber(v12, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  }
  else
  {
    if (v10)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
      v17 = 138412290;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v17, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  }

  return v14;
}

- (void)setUpTableView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController tableView](self, "tableView"));
  v4 = objc_opt_class(PHContactsTableViewCell);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHTableViewCell reuseIdentifier](PHContactsTableViewCell, "reuseIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v4, v5);

  v6 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setTableFooterView:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));
  +[PHContactTableViewCell separatorInsetForContentSizeCategory:](PHContactsTableViewCell, "separatorInsetForContentSizeCategory:", v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactsTableViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setSeparatorInset:", v11, v13, v15, v17);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D664;
  block[3] = &unk_1000898B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)contactForContact:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  void *v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIFavoritesEntryPicker descriptorForRequiredKeys](CNUIFavoritesEntryPicker, "descriptorForRequiredKeys"));
  v24 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));

  if (objc_msgSend(v5, "areKeysAvailable:", v8))
  {
    v9 = v5;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "availableKeyDescriptor"));
    if (v11)
      objc_msgSend(v10, "addObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v17 = 0;
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unifiedContactWithIdentifier:keysToFetch:error:", v12, v10, &v17));
    v13 = v17;

    if (!v9)
    {
      v14 = sub_10000E6C4();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v19 = v5;
        v20 = 2112;
        v21 = v6;
        v22 = 2112;
        v23 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not retrieve a compatible contact using contact (%@) and contact store (%@) due to an error (%@).", buf, 0x20u);
      }

    }
  }

  return v9;
}

- (NSArray)contactArray
{
  return self->_contactArray;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (id)customInfoButtonAction
{
  return self->_customInfoButtonAction;
}

- (void)setCustomInfoButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setAvatarViewControllerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewControllerSettings, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_avatarViewControllerSettings, 0);
  objc_storeStrong(&self->_customInfoButtonAction, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_contactArray, 0);
}

@end
