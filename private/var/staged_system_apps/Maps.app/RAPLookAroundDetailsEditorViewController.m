@implementation RAPLookAroundDetailsEditorViewController

- (RAPLookAroundDetailsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  RAPLookAroundDetailsEditorViewController *v12;
  UITableView *v13;
  UITableView *tableView;
  id v15;
  id completion;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  v12 = -[RAPLookAroundDetailsEditorViewController initWithNibName:bundle:](&v18, "initWithNibName:bundle:", 0, 0);
  if (v12)
  {
    v13 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v12->_tableView;
    v12->_tableView = v13;

    -[UITableView setRowHeight:](v12->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
    -[UITableView setDelegate:](v12->_tableView, "setDelegate:", v12);
    -[UITableView setDataSource:](v12->_tableView, "setDataSource:", v12);
    objc_storeStrong((id *)&v12->_report, a3);
    objc_storeStrong((id *)&v12->_question, a4);
    v15 = objc_msgSend(v11, "copy");
    completion = v12->_completion;
    v12->_completion = v15;

    -[RAPReport updateIfNeeded](v12->_report, "updateIfNeeded");
  }

  return v12;
}

- (void)viewDidLoad
{
  ACAccount *v3;
  ACAccount *account;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  objc_super v39;
  _QWORD v40[3];

  v39.receiver = self;
  v39.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  -[RAPLookAroundDetailsEditorViewController viewDidLoad](&v39, "viewDidLoad");
  v3 = (ACAccount *)objc_claimAutoreleasedReturnValue(+[GEOUserAccountInfo primaryICloudAccount](GEOUserAccountInfo, "primaryICloudAccount"));
  account = self->_account;
  self->_account = v3;

  v38 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion localizedDetailsNavigationTitle](self->_question, "localizedDetailsNavigationTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController _sendButtonItem](self, "_sendButtonItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v10 = sub_100979130(-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setAccessibilityIdentifier:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v13, "addSubview:", v14);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v40[0] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v16));
  v40[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  v40[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 3));
  objc_msgSend(v38, "addObjectsFromArray:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v24, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardDidShowNotification, 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v25, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardDidHideNotification, 0);

  -[RAPLookAroundDetailsEditorViewController _setupTableView](self, "_setupTableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  objc_msgSend(v38, "addObject:", v30);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v38);
}

- (void)_setupTableView
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
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setDataSource:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(RAPMultilineAddressLabelTableViewCell), CFSTR("RAPAddressTableViewCell"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(RAPReportComposerCommentTableViewCell), CFSTR("RAPLookAroundCommentTableViewCell"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(RAPTextTableViewCell), CFSTR("RAPLookAroundEmailTableViewCell"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(RAPDisplayUserContentTableViewCell), CFSTR("RAPUserContentTableViewCell"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v8, "_maps_initializeRAPAppearance");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v9, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(RAPCommentPartHeaderView), CFSTR("CommentHeaderView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v10, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(MacRAPTableViewFooterView), CFSTR("MacRAPTableViewFooterView"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v11, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(TableViewSelectableFooterView), CFSTR("RAPUserContentTableViewFooterView"));

  v13 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setBackgroundColor:", v13);

}

- (void)viewDidAppear:(BOOL)a3
{
  RAPReportComposerCommentTableViewCell *commentCell;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPLookAroundDetailsEditorViewController;
  -[RAPLookAroundDetailsEditorViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  commentCell = self->_commentCell;
  if (commentCell)
    -[RAPReportComposerCommentTableViewCell beginEditingCommentIfPossible](commentCell, "beginEditingCommentIfPossible");
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  objc_msgSend(v14, "convertRect:fromCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v19, "setContentInset:", 0.0, 0.0, v18, 0.0);

}

- (void)keyboardWillHide:(id)a3
{
  double left;
  double bottom;
  double right;
  void *v7;
  id v8;

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView", a3));
  objc_msgSend(v7, "setContentInset:", UIEdgeInsetsZero.top, left, bottom, right);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

}

- (BOOL)_requiresPrivacyElements
{
  return (id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") == (id)5;
}

- (id)_sendButtonItem
{
  UIBarButtonItem *sendButtonItem;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  sendButtonItem = self->_sendButtonItem;
  if (!sendButtonItem)
  {
    v4 = objc_alloc((Class)UIBarButtonItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Submit"), CFSTR("localized string not found"), 0));
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, "_sendRAP");

    -[UIBarButtonItem setEnabled:](v7, "setEnabled:", -[RAPReport canCreateSubmittableProblem](self->_report, "canCreateSubmittableProblem"));
    -[UIBarButtonItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("RAPSubmitButton"));
    -[RAPReport addObserver:changeHandler:](self->_report, "addObserver:changeHandler:", self, &stru_1011BD090);
    v8 = self->_sendButtonItem;
    self->_sendButtonItem = v7;

    sendButtonItem = self->_sendButtonItem;
  }
  return sendButtonItem;
}

- (void)_sendRAP
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController view](self, "view"));
  objc_msgSend(v3, "endEditing:", 1);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005D1C70;
  v7[3] = &unk_1011BD0B8;
  v7[4] = self;
  v4 = objc_retainBlock(v7);
  if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") == (id)5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion emailAddressCorrectableString](self->_question, "emailAddressCorrectableString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
    +[RAPPrivacy performPrivacyCheckWithAppearance:userEnteredEmailAddress:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:userEnteredEmailAddress:completion:", 1, v6, v4);

  }
  else if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    ((void (*)(_QWORD *, uint64_t, _QWORD, _QWORD))v4[2])(v4, 1, 0, 0);
  }
  else
  {
    +[RAPPrivacy performPrivacyCheckWithAppearance:completion:](RAPPrivacy, "performPrivacyCheckWithAppearance:completion:", 1, v4);
  }

}

- (void)valueForCorrectableItemKind:(int64_t)a3 changedTo:(id)a4
{
  RAPLookAroundQuestion *question;
  id v5;
  id v6;

  question = self->_question;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion emailAddressCorrectableString](question, "emailAddressCorrectableString"));
  objc_msgSend(v6, "setValue:", v5);

}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  RAPLookAroundQuestion *question;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (a5)
  {
    question = self->_question;
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion addressCorrectableString](question, "addressCorrectableString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedMapItem"));

    objc_msgSend(v8, "updateFreeformAddressFromMapItem:", v9);
  }
  else
  {
    v10 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchBarText"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion addressCorrectableString](self->_question, "addressCorrectableString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "freeformAddress"));
    objc_msgSend(v11, "setValue:", v8);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion addressCorrectableString](self->_question, "addressCorrectableString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "freeformAddress"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "value"));
  -[RAPMultilineAddressLabelTableViewCell setFreeformAddress:](self->_addressCell, "setFreeformAddress:", v14);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
  objc_msgSend(v15, "_maps_reloadCellHeights");

}

- (void)addressTableViewCell:(id)a3 updatedAddress:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "freeformAddress", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion addressCorrectableString](self->_question, "addressCorrectableString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freeformAddress"));
  objc_msgSend(v6, "setValue:", v7);

}

- (void)userTappedOnAddressTableViewCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion addressCorrectableString](self->_question, "addressCorrectableString", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freeformAddress"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "value"));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteViewController addressAutocompleteViewControllerWithInitialSearchString:](RAPSearchAutocompleteViewController, "addressAutocompleteViewControllerWithInitialSearchString:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Home Address [RAP]"), CFSTR("localized string not found"), 0));
  objc_msgSend(v15, "setTitleText:", v8);

  objc_msgSend(v15, "setDelegate:", self);
  v9 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v15);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  objc_msgSend(v9, "setModalInPresentation:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController navigationController](self, "navigationController"));
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", objc_msgSend(v10, "overrideUserInterfaceStyle"));

  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("RAPHomeAddressAutocompleteView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController navigationController](self, "navigationController"));
  objc_msgSend(v15, "setOverrideUserInterfaceStyle:", objc_msgSend(v11, "overrideUserInterfaceStyle"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController traitCollection](self, "traitCollection"));
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == (id)5)
  {
    objc_msgSend(v15, "setOverrideUserInterfaceStyle:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController navigationController](self, "navigationController"));
    objc_msgSend(v14, "pushViewController:animated:", v15, 1);

  }
  else
  {
    -[RAPLookAroundDetailsEditorViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  unsigned int v4;

  if (self->_account)
    v4 = 3;
  else
    v4 = 2;
  if (MapsFeature_IsEnabled_RAPCommunityID())
  {
    if (!-[RAPLookAroundDetailsEditorViewController _requiresPrivacyElements](self, "_requiresPrivacyElements"))
      return 1;
  }
  else if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") != (id)5)
  {
    if (self->_account)
      return 2;
    else
      return 1;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ACAccount *account;
  void *v13;
  __CFString *v14;

  v6 = a3;
  if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") == (id)5
    || !MapsFeature_IsEnabled_RAPCommunityID()
    && ((account = self->_account, !a4) || !account)
    && (a4 || account))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Address [RAP]"), CFSTR("localized string not found"), 0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Contact Information [Report a Problem]"), CFSTR("localized string not found"), 0));

    if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") == (id)5)
    {
      if (self->_account)
      {
        v11 = v8;
        if (a4 != 1)
        {
          v11 = v10;
          if (a4 != 2)
            goto LABEL_17;
        }
LABEL_16:
        v14 = v11;
LABEL_18:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_maps_groupedHeaderViewWithTitle:", v14));

        goto LABEL_19;
      }
      v11 = v8;
      if (!a4)
        goto LABEL_16;
      if (a4 == 1)
      {
        v11 = v10;
        goto LABEL_16;
      }
    }
LABEL_17:
    v14 = &stru_1011EB268;
    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController commentHeaderView](self, "commentHeaderView"));
LABEL_19:

  return v13;
}

- (id)commentHeaderView
{
  RAPCommentPartHeaderView *v3;
  void *v4;
  RAPCommentPartHeaderView *v5;
  RAPCommentPartHeaderView *commentHeaderView;
  void *v7;
  void *v8;

  if (!self->_commentHeaderView)
  {
    v3 = [RAPCommentPartHeaderView alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion commentQuestion](self->_question, "commentQuestion"));
    v5 = -[RAPCommentPartHeaderView initWithQuestion:reuseIdentifier:](v3, "initWithQuestion:reuseIdentifier:", v4, CFSTR("CommentHeaderView"));
    commentHeaderView = self->_commentHeaderView;
    self->_commentHeaderView = v5;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Details [Report a Problem]"), CFSTR("localized string not found"), 0));
  -[RAPHeaderFooterView setTitleLabelText:](self->_commentHeaderView, "setTitleLabelText:", v8);

  return self->_commentHeaderView;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v5;
  void *v6;
  double v7;

  if (-[RAPLookAroundDetailsEditorViewController _requiresPrivacyElements](self, "_requiresPrivacyElements", a3, a4))
    return UITableViewAutomaticDimension;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController commentHeaderView](self, "commentHeaderView"));
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v5 = v7;

  return v5;
}

- (BOOL)_shouldShowPrivacyFooterForSection:(int64_t)a3
{
  ACAccount *account;
  BOOL v6;
  unsigned __int8 v7;
  BOOL v8;

  account = self->_account;
  if (!a3 && account)
  {
    v6 = 1;
LABEL_8:
    v7 = -[RAPLookAroundDetailsEditorViewController _requiresPrivacyElements](self, "_requiresPrivacyElements");
    if (a3)
      v8 = 0;
    else
      v8 = v7;
    goto LABEL_12;
  }
  v6 = 0;
  if (!a3 && !account)
  {
    v6 = (id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") != (id)5;
    account = self->_account;
  }
  if (account)
    goto LABEL_8;
  v8 = 0;
LABEL_12:
  if (MapsFeature_IsEnabled_RAPCommunityID())
    return v8;
  else
    return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  ACAccount *account;
  uint64_t v6;
  void *v7;
  __CFString *v8;

  account = self->_account;
  if ((id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType", a3) != (id)5)
    goto LABEL_6;
  v6 = 1;
  if (account)
    v6 = 2;
  if (v6 == a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Email Disclosure [Report a Problem]"), CFSTR("localized string not found"), 0));

  }
  else
  {
LABEL_6:
    v8 = &stru_1011EB268;
  }
  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;
  TableViewSelectableFooterView *v7;
  TableViewSelectableFooterView *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TableViewFooterOptions defaultRAPUserContentOptions](TableViewFooterOptions, "defaultRAPUserContentOptions", a3));
  v7 = -[TableViewSelectableFooterView initWithReuseIdentifier:options:]([TableViewSelectableFooterView alloc], "initWithReuseIdentifier:options:", CFSTR("RAPUserContentTableViewFooterView"), v6);
  -[TableViewSelectableFooterView setTarget:action:](v7, "setTarget:action:", self, "_presentPrivacyView");
  if (-[RAPLookAroundDetailsEditorViewController _shouldShowPrivacyFooterForSection:](self, "_shouldShowPrivacyFooterForSection:", a4))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightforFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;
  unint64_t v7;

  if (a4)
    return 2.22507386e-308;
  v7 = -[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType", a3, v4, v5);
  result = UITableViewAutomaticDimension;
  if (v7 == 5)
    return 2.22507386e-308;
  return result;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = (id)-[RAPLookAroundQuestion selectedQuestionType](self->_question, "selectedQuestionType") != (id)5
    || !self->_account
    || objc_msgSend(v5, "section");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  RAPLookAroundQuestion *question;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  question = self->_question;
  v7 = a4;
  v8 = a3;
  if ((id)-[RAPLookAroundQuestion selectedQuestionType](question, "selectedQuestionType") == (id)5)
    v9 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView:resolveHomeImageryCellForIndexPath:](self, "tableView:resolveHomeImageryCellForIndexPath:", v8, v7));
  else
    v9 = objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView:resolveSimpleFeedbackCellForIndexPath:](self, "tableView:resolveSimpleFeedbackCellForIndexPath:", v8, v7));
  v10 = (void *)v9;

  return v10;
}

- (id)tableView:(id)a3 resolveHomeImageryCellForIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RAPMultilineAddressLabelTableViewCell *addressCell;
  RAPMultilineAddressLabelTableViewCell *v10;
  RAPMultilineAddressLabelTableViewCell *v11;
  RAPMultilineAddressLabelTableViewCell *v12;
  void *v13;
  void *v14;
  RAPMultilineAddressLabelTableViewCell *v15;
  RAPMultilineAddressLabelTableViewCell *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_account)
  {
    if (objc_msgSend(v7, "section"))
    {
      if (objc_msgSend(v8, "section") != (id)1)
      {
        v16 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPLookAroundEmailTableViewCell"), v8));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Email Address [Report a Problem]"), CFSTR("localized string not found"), 0));
        -[RAPMultilineAddressLabelTableViewCell setPlaceholder:](v16, "setPlaceholder:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion emailAddressCorrectableString](self->_question, "emailAddressCorrectableString"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "value"));
        -[RAPMultilineAddressLabelTableViewCell setValue:](v16, "setValue:", v21);

        -[RAPMultilineAddressLabelTableViewCell setPreferredKeyboardType:](v16, "setPreferredKeyboardType:", 7);
        -[RAPMultilineAddressLabelTableViewCell setAccessibilityIdentifier:](v16, "setAccessibilityIdentifier:", CFSTR("RAPLookAroundEmailCell"));
        -[RAPMultilineAddressLabelTableViewCell setDelegate:](v16, "setDelegate:", self);
        goto LABEL_10;
      }
      addressCell = self->_addressCell;
      if (!addressCell)
      {
        v10 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPAddressTableViewCell"), v8));
        v11 = self->_addressCell;
        self->_addressCell = v10;
        v12 = v10;

        -[RAPMultilineAddressLabelTableViewCell setDelegate:](self->_addressCell, "setDelegate:", self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[RAPAddressLayoutOptions allFieldsDisabledOptions](RAPAddressLayoutOptions, "allFieldsDisabledOptions"));
        -[RAPMultilineAddressLabelTableViewCell setLayoutOptions:](self->_addressCell, "setLayoutOptions:", v13);

        -[RAPMultilineAddressLabelTableViewCell setEditableAndTappable:](self->_addressCell, "setEditableAndTappable:", 1);
        -[RAPMultilineAddressLabelTableViewCell setAccessibilityIdentifier:](self->_addressCell, "setAccessibilityIdentifier:", CFSTR("RAPLookAroundAddressCell"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
        -[RAPMultilineAddressLabelTableViewCell setParentTableView:](self->_addressCell, "setParentTableView:", v14);

        addressCell = self->_addressCell;
      }
      v15 = addressCell;
    }
    else
    {
      v15 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController _userInfoCell](self, "_userInfoCell"));
    }
  }
  else
  {
    v15 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView:resolveHomeImageryCellWithNoAccountForIndexPath:](self, "tableView:resolveHomeImageryCellWithNoAccountForIndexPath:", v6, v7));
  }
  v16 = v15;
LABEL_10:

  return v16;
}

- (id)tableView:(id)a3 resolveHomeImageryCellWithNoAccountForIndexPath:(id)a4
{
  id v6;
  id v7;
  RAPMultilineAddressLabelTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RAPMultilineAddressLabelTableViewCell *addressCell;
  RAPMultilineAddressLabelTableViewCell *v14;
  RAPMultilineAddressLabelTableViewCell *v15;
  RAPMultilineAddressLabelTableViewCell *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v8 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPLookAroundEmailTableViewCell"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Email Address [Report a Problem]"), CFSTR("localized string not found"), 0));
    -[RAPMultilineAddressLabelTableViewCell setPlaceholder:](v8, "setPlaceholder:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion emailAddressCorrectableString](self->_question, "emailAddressCorrectableString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "value"));
    -[RAPMultilineAddressLabelTableViewCell setValue:](v8, "setValue:", v12);

    -[RAPMultilineAddressLabelTableViewCell setPreferredKeyboardType:](v8, "setPreferredKeyboardType:", 7);
    -[RAPMultilineAddressLabelTableViewCell setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", CFSTR("RAPLookAroundEmailCell"));
    -[RAPMultilineAddressLabelTableViewCell setDelegate:](v8, "setDelegate:", self);
  }
  else
  {
    addressCell = self->_addressCell;
    if (!addressCell)
    {
      v14 = (RAPMultilineAddressLabelTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPAddressTableViewCell"), v7));
      v15 = self->_addressCell;
      self->_addressCell = v14;
      v16 = v14;

      -[RAPMultilineAddressLabelTableViewCell setDelegate:](self->_addressCell, "setDelegate:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPAddressLayoutOptions allFieldsDisabledOptions](RAPAddressLayoutOptions, "allFieldsDisabledOptions"));
      -[RAPMultilineAddressLabelTableViewCell setLayoutOptions:](self->_addressCell, "setLayoutOptions:", v17);

      -[RAPMultilineAddressLabelTableViewCell setEditableAndTappable:](self->_addressCell, "setEditableAndTappable:", 1);
      -[RAPMultilineAddressLabelTableViewCell setAccessibilityIdentifier:](self->_addressCell, "setAccessibilityIdentifier:", CFSTR("RAPLookAroundAddressCell"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController tableView](self, "tableView"));
      -[RAPMultilineAddressLabelTableViewCell setParentTableView:](self->_addressCell, "setParentTableView:", v18);

      addressCell = self->_addressCell;
    }
    v8 = addressCell;
  }

  return v8;
}

- (id)tableView:(id)a3 resolveSimpleFeedbackCellForIndexPath:(id)a4
{
  id v6;
  id v7;
  RAPReportComposerCommentTableViewCell **p_commentCell;
  RAPReportComposerCommentTableViewCell *commentCell;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  RAPReportComposerCommentTableViewCell *v17;
  RAPReportComposerCommentTableViewCell *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  if (self->_account)
  {
    if ((MapsFeature_IsEnabled_RAPCommunityID() & 1) == 0 && !objc_msgSend(v7, "section"))
    {
      v17 = (RAPReportComposerCommentTableViewCell *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundDetailsEditorViewController _userInfoCell](self, "_userInfoCell"));
      goto LABEL_10;
    }
    p_commentCell = &self->_commentCell;
    commentCell = self->_commentCell;
    if (!commentCell)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPLookAroundCommentTableViewCell"), v7));
      objc_storeStrong((id *)&self->_commentCell, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion localizedDescription](self->_question, "localizedDescription"));
      -[RAPReportComposerCommentTableViewCell setPlaceholderText:](*p_commentCell, "setPlaceholderText:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion commentQuestion](self->_question, "commentQuestion"));
      objc_initWeak(&location, self);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1005D2D78;
      v23[3] = &unk_1011BD0E0;
      v13 = v12;
      v24 = v13;
      objc_copyWeak(&v25, &location);
      -[RAPReportComposerCommentTableViewCell setTextDidChange:](*p_commentCell, "setTextDidChange:", v23);
      objc_destroyWeak(&v25);
      v14 = v24;
LABEL_8:

      objc_destroyWeak(&location);
      commentCell = *p_commentCell;
    }
  }
  else
  {
    p_commentCell = &self->_commentCell;
    commentCell = self->_commentCell;
    if (!commentCell)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("RAPLookAroundCommentTableViewCell"), v7));
      objc_storeStrong((id *)&self->_commentCell, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion localizedDescription](self->_question, "localizedDescription"));
      -[RAPReportComposerCommentTableViewCell setPlaceholderText:](*p_commentCell, "setPlaceholderText:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLookAroundQuestion commentQuestion](self->_question, "commentQuestion"));
      objc_initWeak(&location, self);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1005D2DD0;
      v20[3] = &unk_1011BD0E0;
      v13 = v16;
      v21 = v13;
      objc_copyWeak(&v22, &location);
      -[RAPReportComposerCommentTableViewCell setTextDidChange:](*p_commentCell, "setTextDidChange:", v20);
      objc_destroyWeak(&v22);
      v14 = v21;
      goto LABEL_8;
    }
  }
  v17 = commentCell;
LABEL_10:
  v18 = v17;

  return v18;
}

- (id)_userInfoCell
{
  RAPDisplayUserContentTableViewCell *v3;
  RAPDisplayUserContentTableViewCell *userInfoCell;
  void *v5;

  if (!self->_userInfoCell)
  {
    v3 = -[RAPDisplayUserContentTableViewCell initWithStyle:reuseIdentifier:]([RAPDisplayUserContentTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    userInfoCell = self->_userInfoCell;
    self->_userInfoCell = v3;

    if (sub_1002A8AA0(self) == 5)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      -[RAPDisplayUserContentTableViewCell setBackgroundColor:](self->_userInfoCell, "setBackgroundColor:", v5);

    }
  }
  return self->_userInfoCell;
}

- (void)_presentPrivacyView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.mapsrap")));
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

}

- (int)analyticTarget
{
  return -[RAPLookAroundQuestion analyticTarget](self->_question, "analyticTarget");
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  -[RAPLookAroundDetailsEditorViewController _sendRAP](self, "_sendRAP", a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_userContentFooterView, 0);
  objc_storeStrong((id *)&self->_userInfoCell, 0);
  objc_storeStrong((id *)&self->_commentHeaderView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_commentCell, 0);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

@end
