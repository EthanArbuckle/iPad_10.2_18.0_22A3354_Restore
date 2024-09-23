@implementation ICSEMainViewController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewDidLoad](&v4, "viewDidLoad");
  -[ICSEMainViewController configureUI](self, "configureUI");
  -[ICSEMainViewController loadAccountsAndAttachments](self, "loadAccountsAndAttachments");
  v3 = objc_alloc_init((Class)ICRegulatoryLogger);
  -[ICSEMainViewController setRegulatoryLogger:](self, "setRegulatoryLogger:", v3);

}

- (void)configureUI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
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
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  double left;
  double bottom;
  double right;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  void *v88;
  void *v89;

  v3 = objc_msgSend(objc_alloc((Class)ICScrollViewKeyboardResizer), "initWithDelegate:", self);
  -[ICSEMainViewController setScrollViewResizer:](self, "setScrollViewResizer:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Notes"), &stru_1000DAF38, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "setForceFullHeightInLandscape:", 1);

  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationController](self, "navigationController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navigationBar"));
    objc_msgSend(v10, "setBackgroundColor:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController view](self, "view"));
    objc_msgSend(v11, "setBackgroundColor:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollView](self, "scrollView"));
    objc_msgSend(v12, "setBackgroundColor:", 0);
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
      v13 = objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
    else
      v13 = objc_claimAutoreleasedReturnValue(+[UIColor ICTintColor](UIColor, "ICTintColor"));
    v12 = (void *)v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationController](self, "navigationController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navigationBar"));
    objc_msgSend(v15, "setTintColor:", v12);

  }
  v16 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v16, "setBackgroundImage:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationItem](self, "navigationItem"));
  v86 = v16;
  objc_msgSend(v17, "setScrollEdgeAppearance:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollView](self, "scrollView"));
  objc_msgSend(v18, "setDelegate:", self);

  -[ICSEMainViewController showPlaceholderText:](self, "showPlaceholderText:", 1);
  v19 = +[ICSENoteTitleView newNoteTitleView](ICSENoteTitleView, "newNoteTitleView");
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "titleViewDidTap:", 64);
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ic_fontWithSingleLineA"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController saveToHeaderLabel](self, "saveToHeaderLabel"));
    objc_msgSend(v22, "setFont:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleFooterLabel](self, "titleFooterLabel"));
    objc_msgSend(v23, "setTextAlignment:", 1);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleFooterViewHeightConstraint](self, "titleFooterViewHeightConstraint"));
    v89 = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleFooterView](self, "titleFooterView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController contentViewTopSeparator](self, "contentViewTopSeparator"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:constant:", v29, -16.0));
    v88 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  objc_msgSend(v32, "ic_applyRoundedCorners");

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  objc_msgSend(v33, "addSubview:", v19);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  objc_msgSend(v35, "setBackgroundColor:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("titleViewContainer"));

  -[ICSEMainViewController updateTitleViewHeightConstraint](self, "updateTitleViewHeightConstraint");
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "layoutMarginsGuide"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, 8.0));
  v87[0] = v81;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "layoutMarginsGuide"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:constant:", v77, -8.0));
  v87[1] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v38));
  v87[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v41 = v19;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v43));
  v87[3] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v87, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

  v46 = v41;
  -[ICSEMainViewController setTitleView:](self, "setTitleView:", v41);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController contentViewContainer](self, "contentViewContainer"));
  objc_msgSend(v47, "ic_applyRoundedCorners");

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController contentViewContainer](self, "contentViewContainer"));
  objc_msgSend(v49, "setBackgroundColor:", v48);

  v50 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  -[ICSEMainViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v50);

  v51 = objc_alloc((Class)UIBarButtonItem);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController activityIndicatorView](self, "activityIndicatorView"));
  v53 = objc_msgSend(v51, "initWithCustomView:", v52);
  -[ICSEMainViewController setActivityIndicatorBarButtonItem:](self, "setActivityIndicatorBarButtonItem:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController saveToNoteBarButtonItem](self, "saveToNoteBarButtonItem"));
  objc_msgSend(v54, "setEnabled:", 0);

  if (!-[ICSEMainViewController layoutType](self, "layoutType"))
    -[ICSEMainViewController setUpForLayoutType:](self, "setUpForLayoutType:", 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  objc_msgSend(v55, "setDelegate:", self);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
  objc_msgSend(v56, "setDelegate:", self);

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) == 0)
  {
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
    objc_msgSend(v60, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "textContainer"));
    objc_msgSend(v62, "setLineFragmentPadding:", 0.0);

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
    objc_msgSend(v63, "setTextContainerInset:", UIEdgeInsetsZero.top, left, bottom, right);

    v64 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "textContainer"));
    objc_msgSend(v65, "setLineFragmentPadding:", 0.0);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextViewMinHeightConstraint](self, "topTextViewMinHeightConstraint"));
  objc_msgSend(v66, "setConstant:", 48.0);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextviewCollapsibleZeroHeightConstraint](self, "bottomTextviewCollapsibleZeroHeightConstraint"));
  objc_msgSend(v67, "setConstant:", 72.0);

  -[ICSEMainViewController updateTextViewsForContentSizeChangeIfNecessary](self, "updateTextViewsForContentSizeChangeIfNecessary");
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("Save"), &stru_1000DAF38, 0));
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:](UIKeyCommand, "ic_keyCommandWithInput:modifierFlags:action:discoverabilityTitle:", CFSTR("\r"), 0x100000, "saveToNote:", v69));
  -[ICSEMainViewController addKeyCommand:](self, "addKeyCommand:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, "tabKeyPressed:"));
  -[ICSEMainViewController addKeyCommand:](self, "addKeyCommand:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, "tabKeyPressed:"));
  -[ICSEMainViewController addKeyCommand:](self, "addKeyCommand:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v73, "addObserver:selector:name:object:", self, "contentSizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v74, "addObserver:selector:name:object:", self, "updateBrickContainerHeightConstraint", ICAttachmentDidChangePreferredSizeNotification, 0);

}

- (void)showActivityIndicator
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController activityIndicatorBarButtonItem](self, "activityIndicatorBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController activityIndicatorView](self, "activityIndicatorView"));
  objc_msgSend(v5, "startAnimating");

}

- (void)showSaveButton
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController saveToNoteBarButtonItem](self, "saveToNoteBarButtonItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setRightBarButtonItem:", v4);

}

- (void)loadAccountsAndAttachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id location[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount allActiveAccountsInContextSortedByAccountType:](ICAccount, "allActiveAccountsInContextSortedByAccountType:", v4));

  if (v5 && objc_msgSend(v5, "count"))
  {
    -[ICSEMainViewController setAccounts:](self, "setAccounts:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController containerViewController](self, "containerViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableViewController"));
    objc_msgSend(v7, "setAccounts:", v5);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICFolder defaultFolderInContext:](ICFolder, "defaultFolderInContext:", v9));
    v11 = (os_log_t)+[ICNote newEmptyNoteInFolder:](ICNote, "newEmptyNoteInFolder:", v10);

    -[NSObject markForDeletion](v11, "markForDeletion");
    -[ICSEMainViewController setTemporaryNewNote:](self, "setTemporaryNewNote:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastNoteSavedTo"));

    -[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:](self, "setSelectionToNote:folder:prefersSystemPaper:", v13, 0, objc_msgSend(v13, "isSystemPaper"));
    objc_initWeak(location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject account](v11, "account"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
    objc_msgSend(v16, "setAccountId:", v15);

    global_queue = dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100023C70;
    v19[3] = &unk_1000D5CA8;
    objc_copyWeak(&v20, location);
    v19[4] = self;
    dispatch_async(v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(location);

  }
  else
  {
    v11 = os_log_create("com.apple.notes", "SharingExtension");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "No sharing extension accounts.", (uint8_t *)location, 2u);
    }
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int IsAppleAccountBrandingEnabled;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewDidAppear:](&v27, "viewDidAppear:", a3);
  v4 = objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));
  if (!v4
    || (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        v5,
        !v7))
  {
    IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (IsAppleAccountBrandingEnabled)
      v11 = CFSTR("To share to a note, you’ll need to go to Notes and upgrade your Apple Account.");
    else
      v11 = CFSTR("To share to a note, you’ll need to go to Notes and upgrade your iCloud account.");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1000DAF38, 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Upgrade Your Notes"), &stru_1000DAF38, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v24, 1));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000DAF38, 0));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002410C;
    v26[3] = &unk_1000D5C30;
    v26[4] = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 1, v26));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Go to Notes"), &stru_1000DAF38, 0));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100024114;
    v25[3] = &unk_1000D5C30;
    v25[4] = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 0, v25));

    objc_msgSend(v6, "addAction:", v19);
    objc_msgSend(v6, "addAction:", v16);
    -[ICSEMainViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));
  if (v20)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));
    v21 = objc_msgSend(v6, "count") != 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewContainer](self, "titleViewContainer"));
  objc_msgSend(v22, "setUserInteractionEnabled:", v21);

  if (v20)
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "addObserver:selector:name:object:", self, "extensionHostDidBecomeActive:", NSExtensionHostDidBecomeActiveNotification, 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewDidLayoutSubviews](&v8, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

  if (!v4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.view.window) != nil)", "-[ICSEMainViewController viewDidLayoutSubviews]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.view.window");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollViewResizer](self, "scrollViewResizer"));
  v6 = objc_msgSend(v5, "isAutoResizing");

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollViewResizer](self, "scrollViewResizer"));
    objc_msgSend(v7, "startAutoResizing");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewWillDisappear:](&v6, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollViewResizer](self, "scrollViewResizer"));
  objc_msgSend(v4, "stopAutoResizing");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, NSExtensionHostDidBecomeActiveNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  if (!-[ICSEMainViewController isSaving](self, "isSaving"))
  {
    -[ICSEMainViewController cleanupTemporaryNewNoteIfNecesary](self, "cleanupTemporaryNewNoteIfNecesary");
    -[ICSEMainViewController cleanupTemporaryImageFilesIfNecessary](self, "cleanupTemporaryImageFilesIfNecessary");
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)cleanupTemporaryImageFilesIfNecessary
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "deleteTemporaryImageFileIfNecessary");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)cleanupTemporaryNewNoteIfNecesary
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController temporaryNewNote](self, "temporaryNewNote"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100024510;
  v6[3] = &unk_1000D5D10;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v6);

  -[ICSEMainViewController setTemporaryNewNote:](self, "setTemporaryNewNote:", 0);
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSEMainViewController;
  -[ICSEMainViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollViewResizer](self, "scrollViewResizer"));
  objc_msgSend(v3, "reapplyInsets");

}

- (void)updateTitleFooter
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController stringForTitleFooter](self, "stringForTitleFooter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleFooterLabel](self, "titleFooterLabel"));
  objc_msgSend(v3, "setText:", v4);

}

- (id)stringForTitleFooter
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  unsigned int v19;
  void *v20;
  _BOOL4 v21;
  char v22;
  unsigned int v23;
  void *v24;
  id v25;
  unsigned int v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  int v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  int v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  NSString *v76;
  void *v77;
  void *v78;
  __CFString *v80;
  uint64_t v81;
  void *v82;
  __CFString *v83;
  _BOOL4 v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  unint64_t v88;
  __CFString *v89;
  void *v90;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v11 = &stru_1000DAF38;
    goto LABEL_180;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folder"));
  v12 = v10;

  if (v7)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ic_truncatedStringWithMaxLength:truncated:", 35, 0));
    v86 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ic_quotedString"));

    if (objc_msgSend(v7, "isSharedRootObject"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedOwnerName"));
      v16 = v15;
      if (v15)
      {
        v17 = 0;
        v18 = objc_msgSend(v15, "length") != 0;
LABEL_14:
        v19 = v17 & objc_msgSend(v7, "isSharedRootObject");
        goto LABEL_15;
      }
      v18 = 0;
    }
    else
    {
      v18 = 0;
      v16 = 0;
    }
    v17 = 1;
    goto LABEL_14;
  }
  v18 = 0;
  v16 = 0;
  v86 = 0;
  v19 = 0;
LABEL_15:
  v90 = v12;
  v87 = v16;
  v88 = (unint64_t)v6;
  if (!v12 || (objc_msgSend(v12, "isDefaultFolderForAccount") & 1) != 0)
  {
    v20 = 0;
LABEL_18:

    v21 = 0;
    v89 = 0;
    v22 = 0;
    v85 = 0;
    v23 = 0;
    goto LABEL_19;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedTitle"));
  v20 = v36;
  if (!v36 || !objc_msgSend(v36, "length"))
    goto LABEL_18;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ic_truncatedStringWithMaxLength:truncated:", 35, 0));
  v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "ic_quotedString"));

  if (objc_msgSend(v12, "isSharedViaICloud")
    && (v38 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sharedOwnerName"))) != 0)
  {
    v89 = v38;
    v39 = 0;
    v21 = -[__CFString length](v38, "length") != 0;
  }
  else
  {
    v21 = 0;
    v89 = 0;
    v39 = 1;
  }
  v23 = v39 & objc_msgSend(v12, "isSharedViaICloud");
  v22 = 1;
LABEL_19:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));
  v25 = objc_msgSend(v24, "count");

  if ((unint64_t)v25 < 2)
  {
    v30 = 0;
    v31 = &stru_1000DAF38;
    if (!v7)
      goto LABEL_46;
LABEL_23:
    v32 = v7;
    if ((v22 & 1) != 0)
    {
      if (((v21 | v23) & 1) != 0)
      {
        if (v21)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v34 = v33;
          if ((v30 & 1) != 0)
          {
            if (v88 > 1)
              v35 = CFSTR("These attachments will be saved to the note %@ in the folder %@ shared by %@ in your %@ account.");
            else
              v35 = CFSTR("This attachment will be saved to the note %@ in the folder %@ shared by %@ in your %@ account.");
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v35, &stru_1000DAF38, 0));
            v83 = v31;
          }
          else
          {
            if (v88 > 1)
              v66 = CFSTR("These attachments will be saved to the note %@ in the folder %@ shared by %@.");
            else
              v66 = CFSTR("This attachment will be saved to the note %@ in the folder %@ shared by %@.");
            v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", v66, &stru_1000DAF38, 0));
          }
          v82 = v89;
          goto LABEL_173;
        }
        if ((v23 & 1) == 0)
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isOwnedSharedFolder", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, CFSTR("Unexpected case in updateTitleFooter"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = v59;
        v48 = (void *)v86;
        v49 = v87;
        v50 = (void *)v85;
        if ((v30 & 1) != 0)
        {
          if (v88 > 1)
            v60 = CFSTR("These attachments will be saved to the note %@ in your shared folder %@ in your %@ account.");
          else
            v60 = CFSTR("This attachment will be saved to the note %@ in your shared folder %@ in your %@ account.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", v60, &stru_1000DAF38, 0));
          v82 = v31;
        }
        else
        {
          if (v88 > 1)
            v69 = CFSTR("These attachments will be saved to the note %@ in your shared folder %@.");
          else
            v69 = CFSTR("This attachment will be saved to the note %@ in your shared folder %@.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", v69, &stru_1000DAF38, 0));
        }
        v81 = v85;
LABEL_143:
        v76 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, v48, v81, v82, v83);
LABEL_164:
        v65 = (void *)objc_claimAutoreleasedReturnValue(v76);

        goto LABEL_174;
      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = v53;
      if ((v30 & 1) != 0)
      {
        if (v18)
        {
          if (v88 > 1)
            v54 = CFSTR("These attachments will be saved to the note %@ shared by %@ in the folder %@ in your %@ account.");
          else
            v54 = CFSTR("This attachment will be saved to the note %@ shared by %@ in the folder %@ in your %@ account.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v54, &stru_1000DAF38, 0));
          v83 = v31;
LABEL_133:
          v50 = (void *)v85;
          v48 = (void *)v86;
          v49 = v87;
          v81 = (uint64_t)v87;
          v82 = (void *)v85;
          goto LABEL_143;
        }
        if (v19)
        {
          if (v88 > 1)
            v68 = CFSTR("These attachments will be saved to your shared note %@ in the folder %@ in your %@ account.");
          else
            v68 = CFSTR("This attachment will be saved to your shared note %@ in the folder %@ in your %@ account.");
        }
        else if (v88 > 1)
        {
          v68 = CFSTR("These attachments will be saved to the note %@ in the folder %@ in your %@ account.");
        }
        else
        {
          v68 = CFSTR("This attachment will be saved to the note %@ in the folder %@ in your %@ account.");
        }
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v68, &stru_1000DAF38, 0));
        v82 = v31;
      }
      else
      {
        if (v18)
        {
          if (v88 > 1)
            v62 = CFSTR("These attachments will be saved to the note %@ shared by %@ in the folder %@.");
          else
            v62 = CFSTR("This attachment will be saved to the note %@ shared by %@ in the folder %@.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v62, &stru_1000DAF38, 0));
          goto LABEL_133;
        }
        if (v19)
        {
          if (v88 > 1)
            v70 = CFSTR("These attachments will be saved to your shared note %@ in the folder %@.");
          else
            v70 = CFSTR("This attachment will be saved to your shared note %@ in the folder %@.");
        }
        else if (v88 > 1)
        {
          v70 = CFSTR("These attachments will be saved to the note %@ in the folder %@.");
        }
        else
        {
          v70 = CFSTR("This attachment will be saved to the note %@ in the folder %@.");
        }
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v70, &stru_1000DAF38, 0));
      }
LABEL_173:
      v50 = (void *)v85;
      v48 = (void *)v86;
      v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v74, v86, v85, v82, v83));

      v49 = v87;
      goto LABEL_174;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = v40;
    if ((v30 & 1) != 0)
    {
      if (v18)
      {
        if (v88 > 1)
          v41 = CFSTR("These attachments will be saved to the note %@ shared by %@ in your %@ account.");
        else
          v41 = CFSTR("This attachment will be saved to the note %@ shared by %@ in your %@ account.");
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v41, &stru_1000DAF38, 0));
        v82 = v31;
LABEL_105:
        v48 = (void *)v86;
        v49 = v87;
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v67, v86, v87, v82));

LABEL_151:
        v50 = (void *)v85;
LABEL_174:
        v7 = v32;
        goto LABEL_175;
      }
      if (v19)
      {
        if (v88 > 1)
          v61 = CFSTR("These attachments will be saved to your shared note %@ in your %@ account.");
        else
          v61 = CFSTR("This attachment will be saved to your shared note %@ in your %@ account.");
      }
      else if (v88 > 1)
      {
        v61 = CFSTR("These attachments will be saved to the note %@ in your %@ account.");
      }
      else
      {
        v61 = CFSTR("This attachment will be saved to the note %@ in your %@ account.");
      }
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v61, &stru_1000DAF38, 0));
      v80 = v31;
    }
    else
    {
      if (v18)
      {
        if (v88 > 1)
          v55 = CFSTR("These attachments will be saved to the note %@ shared by %@.");
        else
          v55 = CFSTR("This attachment will be saved to the note %@ shared by %@.");
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v55, &stru_1000DAF38, 0));
        goto LABEL_105;
      }
      if (v19)
      {
        if (v88 > 1)
          v63 = CFSTR("These attachments will be saved to your shared note %@.");
        else
          v63 = CFSTR("This attachment will be saved to your shared note %@.");
      }
      else if (v88 > 1)
      {
        v63 = CFSTR("These attachments will be saved to the note %@.");
      }
      else
      {
        v63 = CFSTR("This attachment will be saved to the note %@.");
      }
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", v63, &stru_1000DAF38, 0));
    }
    v48 = (void *)v86;
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v77, v86, v80));

    v49 = v87;
    goto LABEL_151;
  }
  v84 = v21;
  v26 = v19;
  v27 = v18;
  if (v7)
  {
    v28 = v7;
    v29 = v7;
  }
  else
  {
    v28 = 0;
    v29 = v90;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "account"));
  if (!v42)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "managedObjectContext"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v44));

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedName"));
  v46 = v45;
  if (v45 && objc_msgSend(v45, "length"))
  {
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "ic_truncatedStringWithMaxLength:truncated:", 35, 0));
    v30 = 1;
  }
  else
  {
    v31 = 0;
    v30 = 0;
  }

  v7 = v28;
  v18 = v27;
  v19 = v26;
  v21 = v84;
  if (v7)
    goto LABEL_23;
LABEL_46:
  if ((v22 & 1) != 0)
  {
    v32 = v7;
    if (((v21 | v23) & 1) != 0)
    {
      if (v21)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = v47;
        v48 = (void *)v86;
        v49 = v87;
        v50 = (void *)v85;
        if ((v30 & 1) != 0)
        {
          if (v88 > 1)
            v51 = CFSTR("These attachments will be saved in a new note in the folder %@ shared by %@ in your %@ account.");
          else
            v51 = CFSTR("This attachment will be saved in a new note in the folder %@ shared by %@ in your %@ account.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", v51, &stru_1000DAF38, 0));
          v82 = v31;
        }
        else
        {
          if (v88 > 1)
            v71 = CFSTR("These attachments will be saved in a new note in the folder %@ shared by %@.");
          else
            v71 = CFSTR("This attachment will be saved in a new note in the folder %@ shared by %@.");
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", v71, &stru_1000DAF38, 0));
        }
        v80 = v89;
        goto LABEL_163;
      }
      v48 = (void *)v86;
      v49 = v87;
      v50 = (void *)v85;
      if ((v23 & 1) == 0)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "isOwnedSharedFolder", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, CFSTR("Unexpected case in updateTitleFooter"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v30 & 1) != 0)
      {
        if (v88 > 1)
          v56 = CFSTR("These attachments will be saved in a new note in your shared folder %@ in your %@ account.");
        else
          v56 = CFSTR("This attachment will be saved in a new note in your shared folder %@ in your %@ account.");
LABEL_155:
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", v56, &stru_1000DAF38, 0));
        v80 = v31;
LABEL_163:
        v76 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v75, v50, v80, v82, v83);
        goto LABEL_164;
      }
      if (v88 > 1)
        v64 = CFSTR("These attachments will be saved in a new note in your shared folder %@.");
      else
        v64 = CFSTR("This attachment will be saved in a new note in your shared folder %@.");
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if ((v30 & 1) != 0)
      {
        v49 = v87;
        v50 = (void *)v85;
        v48 = (void *)v86;
        if (v88 > 1)
          v56 = CFSTR("These attachments will be saved in a new note in the folder %@ in your %@ account.");
        else
          v56 = CFSTR("This attachment will be saved in a new note in the folder %@ in your %@ account.");
        goto LABEL_155;
      }
      v49 = v87;
      v50 = (void *)v85;
      v48 = (void *)v86;
      if (v88 > 1)
        v64 = CFSTR("These attachments will be saved in a new note in the folder %@.");
      else
        v64 = CFSTR("This attachment will be saved in a new note in the folder %@.");
    }
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", v64, &stru_1000DAF38, 0));
    goto LABEL_163;
  }
  if (((v30 | !-[ICSEMainViewController prefersSystemPaper](self, "prefersSystemPaper")) & 1) == 0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = v57;
    if (v88 > 1)
      v58 = CFSTR("These attachments will be saved in a new note in the Quick Notes folder.");
    else
      v58 = CFSTR("This attachment will be saved in a new note in the Quick Notes folder.");
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", v58, &stru_1000DAF38, 0));
    v48 = (void *)v86;
    v49 = v87;
    v50 = (void *)v85;
    goto LABEL_175;
  }
  if (-[ICSEMainViewController prefersSystemPaper](self, "prefersSystemPaper"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = v87;
    v50 = (void *)v85;
    v48 = (void *)v86;
    if (v88 > 1)
      v52 = CFSTR("These attachments will be saved in a new note in the Quick Notes folder in your %@ account.");
    else
      v52 = CFSTR("This attachment will be saved in a new note in the Quick Notes folder in your %@ account.");
  }
  else
  {
    v48 = (void *)v86;
    v49 = v87;
    v50 = (void *)v85;
    if ((v30 & 1) == 0)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v34 = v72;
      if (v88 > 1)
        v73 = CFSTR("These attachments will be saved in a new note.");
      else
        v73 = CFSTR("This attachment will be saved in a new note.");
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", v73, &stru_1000DAF38, 0));
      goto LABEL_175;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v88 > 1)
      v52 = CFSTR("These attachments will be saved in a new note in your %@ account.");
    else
      v52 = CFSTR("This attachment will be saved in a new note in your %@ account.");
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", v52, &stru_1000DAF38, 0));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v78, v31));

LABEL_175:
  if (!v65)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((titleFooterString) != nil)", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "titleFooterString");
  if (!objc_msgSend(v65, "length"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "titleFooterString.length > 0", "-[ICSEMainViewController stringForTitleFooter]", 1, 0, CFSTR("title footer string is empty"));
  v11 = v65;

LABEL_180:
  return v11;
}

- (BOOL)canShareToNote:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0
    || !objc_msgSend(v3, "isEditable")
    || (objc_msgSend(v3, "isDeletedOrInTrash") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "markedForDeletion") ^ 1;
  }

  return v4;
}

- (BOOL)canShareToFolder:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (!objc_msgSend(v3, "canMoveAddOrDeleteContents")
    || (objc_msgSend(v3, "isDeleted") & 1) != 0
    || (objc_msgSend(v3, "isTrashFolder") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "markedForDeletion") ^ 1;
  }

  return v4;
}

- (BOOL)shouldRetrieveLastSelectedNote
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
  v6 = -[ICSEMainViewController canShareToNote:](self, "canShareToNote:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
  v8 = -[ICSEMainViewController canShareToFolder:](self, "canShareToFolder:", v7);

  if (v3 && !v6)
    return 1;
  if (v4)
    return v8 ^ 1;
  return 0;
}

- (void)setSelectionToNote:(id)a3 folder:(id)a4 prefersSystemPaper:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  if (!-[ICSEMainViewController canShareToNote:](self, "canShareToNote:", v18))
  {

    v18 = 0;
  }
  if (-[ICSEMainViewController canShareToFolder:](self, "canShareToFolder:", v8))
  {
    -[ICSEMainViewController setSelectedNote:](self, "setSelectedNote:", v18);
    v9 = v18;
    if (!v18)
    {
      if (v8)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
  else
  {

    -[ICSEMainViewController setSelectedNote:](self, "setSelectedNote:", v18);
    if (!v18)
    {
LABEL_10:
      v8 = (id)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v11));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultFolder"));

      goto LABEL_11;
    }
    v8 = 0;
    v9 = v18;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folder"));
LABEL_11:

  v8 = (id)v10;
LABEL_12:
  -[ICSEMainViewController setSelectedFolder:](self, "setSelectedFolder:", v8);
  -[ICSEMainViewController setPrefersSystemPaper:](self, "setPrefersSystemPaper:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));

  if (!v13)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.accounts) != nil)", "-[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "self.accounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleView](self, "titleView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController accounts](self, "accounts"));
  objc_msgSend(v14, "setNote:folder:hasMultipleAccounts:", v18, v8, (unint64_t)objc_msgSend(v15, "count") > 1);

  -[ICSEMainViewController updateTitleFooter](self, "updateTitleFooter");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
  -[ICSEMainViewController setLastSelectedNoteIdentifier:](self, "setLastSelectedNoteIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  -[ICSEMainViewController setLastSelectedFolderIdentifier:](self, "setLastSelectedFolderIdentifier:", v17);

}

- (NSAttributedString)textBefore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ICSEMainViewController isShowingPlaceholderText](self, "isShowingPlaceholderText"))
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_trimmedString"));

    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributedText"));

    }
    else
    {
      v3 = 0;
    }

  }
  return (NSAttributedString *)v3;
}

- (NSAttributedString)textAfter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_trimmedString"));

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedText"));

  }
  else
  {
    v7 = 0;
  }

  return (NSAttributedString *)v7;
}

- (void)tabKeyPressed:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  id v9;
  id v10;

  v4 = -[ICSEMainViewController bottomTextViewCollapsed](self, "bottomTextViewCollapsed", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  v6 = objc_msgSend(v5, "ic_isFirstResponder");

  if ((v4 & 1) != 0)
  {
    if ((v6 & 1) != 0)
      return;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
    if (v6)
    {
      v9 = v7;
      v8 = objc_msgSend(v7, "ic_isFirstResponder");

      if (!v8)
        return;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
    }
  }
  v10 = v7;
  objc_msgSend(v7, "ic_becomeFirstResponder");

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v7 = a4;
  if ("saveToNote:" == a3)
  {
    v8 = objc_opt_class(UIKeyCommand, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController containerViewController](self, "containerViewController"));
      if ((objc_msgSend(v9, "isShowingTableContainer") & 1) != 0)
      {
        LOBYTE(self) = 0;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController saveToNoteBarButtonItem](self, "saveToNoteBarButtonItem"));
        LOBYTE(self) = objc_msgSend(v11, "isEnabled");

      }
      goto LABEL_10;
    }
  }
  if ("tabKeyPressed:" == a3)
  {
    v10 = objc_opt_class(UIKeyCommand, v6);
    if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController containerViewController](self, "containerViewController"));
      LODWORD(self) = objc_msgSend(v9, "isShowingTableContainer") ^ 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)ICSEMainViewController;
  LOBYTE(self) = -[ICSEMainViewController canPerformAction:withSender:](&v13, "canPerformAction:withSender:", a3, v7);
LABEL_11:

  return (char)self;
}

- (void)saveToNote:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  void *v22;
  id v23;
  char *v24;
  void *v25;
  id v26;
  id v27;
  char v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  unsigned int v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  int v56;
  int v57;
  char *v58;
  void *v59;
  char *v60;
  BOOL v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  _QWORD *v68;
  void *v69;
  _BYTE *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _BYTE *v74;
  void *v75;
  void *v76;
  int64_t v77;
  void *v78;
  void *v79;
  NSString *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  id v105;
  _QWORD v106[4];
  _QWORD *v107;
  _QWORD v108[5];
  NSObject *v109;
  id v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];

  v4 = objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
    v7 = objc_msgSend(v6, "isEditable");

    if ((v7 & 1) == 0)
    {
      v37 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_10009EFBC(v37, v38, v39, v40, v41, v42, v43, v44);
      goto LABEL_59;
    }
  }
  v8 = objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
    v11 = objc_msgSend(v10, "canMoveAddOrDeleteContents");

    if ((v11 & 1) == 0)
    {
      v37 = os_log_create("com.apple.notes", "SharingExtension");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_10009EF88(v37, v45, v46, v47, v48, v49, v50, v51);
      goto LABEL_59;
    }
  }
  -[ICSEMainViewController setIsSaving:](self, "setIsSaving:", 1);
  -[ICSEMainViewController showActivityIndicator](self, "showActivityIndicator");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController textBefore](self, "textBefore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController textAfter](self, "textAfter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));

  if (!v14)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
    v53 = objc_msgSend(v52, "count");
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    v55 = objc_msgSend(v54, "maxAttachmentsPerNote");

    if (v53 <= v55)
    {
      v58 = (char *)objc_msgSend(v12, "length");
      v59 = v12;
      v60 = &v58[(_QWORD)objc_msgSend(v13, "length")];
      v61 = v60 >= +[ICNote maxNoteTextLength](ICNote, "maxNoteTextLength");
      v12 = v59;
      if (!v61)
        goto LABEL_8;
LABEL_31:
      v57 = 0;
      v28 = 0;
      v56 = 1;
      goto LABEL_34;
    }
LABEL_28:
    v56 = 0;
    v28 = 0;
    v57 = 1;
    goto LABEL_34;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v17 = objc_msgSend(v15, "canAddAttachments:", objc_msgSend(v16, "count"));

  if (!v17)
    goto LABEL_28;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "textStorage"));
  v21 = (char *)objc_msgSend(v20, "length");
  v22 = v13;
  v23 = objc_msgSend(v12, "length");
  v24 = (char *)objc_msgSend(v22, "length") + (_QWORD)v23;
  v13 = v22;
  LOBYTE(v21) = objc_msgSend(v18, "allowsNewTextLength:", &v21[(_QWORD)v24]);

  if ((v21 & 1) == 0)
    goto LABEL_31;
LABEL_8:
  v103 = v13;
  v104 = v12;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  if (!v26)
  {
    v28 = 0;
    goto LABEL_33;
  }
  v27 = v26;
  v28 = 0;
  v29 = *(_QWORD *)v114;
  do
  {
    for (i = 0; i != v27; i = (char *)i + 1)
    {
      if (*(_QWORD *)v114 != v29)
        objc_enumerationMutation(v25);
      v31 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mediaData"));
      v33 = objc_msgSend(v32, "length");

      if (v33)
      {
LABEL_14:
        v34 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
        LOBYTE(v33) = objc_msgSend(v34, "attachmentExceedsMaxSizeAllowed:", v33);
LABEL_19:

        goto LABEL_20;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mediaURL"));
      v112 = 0;
      v36 = objc_msgSend(v35, "getResourceValue:forKey:error:", &v112, NSURLFileSizeKey, 0);
      v34 = v112;

      if (!v36)
      {
        LOBYTE(v33) = 0;
        goto LABEL_19;
      }
      v33 = objc_msgSend(v34, "unsignedLongLongValue");

      if (v33)
        goto LABEL_14;
LABEL_20:
      v28 |= v33;
    }
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
  }
  while (v27);
LABEL_33:

  v57 = 0;
  v56 = 0;
  v13 = v103;
  v12 = v104;
LABEL_34:
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
  v63 = v62;
  if (v62)
  {
    v64 = v62;
  }
  else
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController temporaryNewNote](self, "temporaryNewNote"));
    v64 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "folder"));

  }
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_1000262AC;
  v108[3] = &unk_1000D66E0;
  v108[4] = self;
  v37 = v12;
  v109 = v37;
  v66 = v13;
  v110 = v66;
  v67 = v64;
  v111 = v67;
  v68 = objc_retainBlock(v108);
  if (v57)
  {
    v105 = v66;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    v70 = objc_msgSend(v69, "maxAttachmentsPerNote");

    v71 = objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
    if (!v71
      || (v72 = (void *)v71,
          v73 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote")),
          v74 = objc_msgSend(v73, "visibleTopLevelAttachmentsCount"),
          v73,
          v72,
          v74 < v70))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));

      if (v75)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
        v77 = v70 - (_BYTE *)objc_msgSend(v76, "visibleTopLevelAttachmentsCount");

        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("At most %lu more attachments can be added."), &stru_1000DAF38, 0));
        v80 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v79, v77);
      }
      else
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("At most %lu attachments can be added."), &stru_1000DAF38, 0));
        v80 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v79, v70);
      }
      v95 = (void *)objc_claimAutoreleasedReturnValue(v80);

      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("Too many attachments."), &stru_1000DAF38, 0));
      goto LABEL_54;
    }
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v82 = v81;
    v83 = CFSTR("Maximum attachments reached.");
LABEL_48:
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "localizedStringForKey:value:table:", v83, &stru_1000DAF38, 0));
    v95 = 0;
    goto LABEL_54;
  }
  if (v56)
  {
    v105 = v66;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v82 = v81;
    v83 = CFSTR("Maximum note length reached.");
    goto LABEL_48;
  }
  if ((v28 & 1) != 0)
  {
    v105 = v66;
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "maximumAttachmentSizeMB"));
    v86 = (_QWORD)objc_msgSend(v85, "unsignedLongLongValue") << 20;

    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v86, 3));
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
    v88 = objc_msgSend(v87, "count");

    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v90 = v89;
    if (v88 == (id)1)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Large Attachment."), &stru_1000DAF38, 0));

      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v93 = v92;
      v94 = CFSTR("To add this attachment to your note, you’ll need to make it smaller than %@.");
    }
    else
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Large Attachments"), &stru_1000DAF38, 0));

      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v93 = v92;
      v94 = CFSTR("Some of these attachments are too large. Each attachment must be smaller than %@.");
    }
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "localizedStringForKey:value:table:", v94, &stru_1000DAF38, 0));
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v96, v82));

LABEL_54:
    if (v91)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v91, v95, 1));
      v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1000DAF38, 0));
      v106[0] = _NSConcreteStackBlock;
      v106[1] = 3221225472;
      v106[2] = sub_1000265F0;
      v106[3] = &unk_1000D6708;
      v107 = v68;
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v99, 0, v106));
      objc_msgSend(v97, "addAction:", v100);

      -[ICSEMainViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v97, 1, 0);
      v66 = v105;
      goto LABEL_58;
    }
    v66 = v105;
  }
  else
  {
    v95 = 0;
  }
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[ICBackgroundTaskScheduler sharedScheduler](ICBackgroundTaskScheduler, "sharedScheduler"));
  objc_msgSend(v101, "scheduleTask:completion:", objc_opt_class(ICCloudSyncBackgroundTask, v102), &stru_1000D6728);

  v91 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v91, "dismissWithCompletion:", v68);
LABEL_58:

LABEL_59:
}

- (void)titleViewDidTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!-[ICSEMainViewController titleViewTapped](self, "titleViewTapped", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController rootViewController](self, "rootViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedNote](self, "selectedNote"));
    objc_msgSend(v5, "pushFolderViewForNote:", v6);

    -[ICSEMainViewController setTitleViewTapped:](self, "setTitleViewTapped:", 1);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  objc_msgSend(v7, "resignFirstResponder");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
  objc_msgSend(v8, "resignFirstResponder");

  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v9, "setIsShowingSearchResults:animated:", 1, 1);

}

- (void)cancel:(id)a3
{
  -[ICSEMainViewController purgeAttachments](self, "purgeAttachments", a3);
  -[ICSEMainViewController dismissRootViewController](self, "dismissRootViewController");
}

- (void)purgeAttachments
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "deleteTemporaryImageFileIfNecessary");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attachment"));
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "purgeAttachmentPreviewImages");
          +[ICAttachment purgeAttachment:](ICAttachment, "purgeAttachment:", v10);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  -[ICSEMainViewController setAttachments:](self, "setAttachments:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICNoteContext sharedContext](ICNoteContext, "sharedContext"));
  objc_msgSend(v11, "save");

}

- (void)dismissRootViewController
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController rootViewController](self, "rootViewController"));
  objc_msgSend(v3, "setDidCancel:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController rootViewController](self, "rootViewController"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026938;
  v5[3] = &unk_1000D5D10;
  v5[4] = self;
  objc_msgSend(v4, "dismissWithCompletion:", v5);

}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  if (v4 == v6)
  {
    v5 = -[ICSEMainViewController isShowingPlaceholderText](self, "isShowingPlaceholderText");

    if (v5)
      -[ICSEMainViewController showPlaceholderText:](self, "showPlaceholderText:", 0);
  }
  else
  {

  }
  -[ICSEMainViewController scrollTextToVisibleForTextView:](self, "scrollTextToVisibleForTextView:", v6);
  objc_msgSend(v6, "becomeFirstResponder");

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));

  if (v5 == v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100026AD4;
    v6[3] = &unk_1000D5D10;
    v6[4] = self;
    dispatchMainAfterDelay(v6, 0.0);
  }
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)extensionHostDidBecomeActive:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (-[ICSEMainViewController shouldRetrieveLastSelectedNote](self, "shouldRetrieveLastSelectedNote", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICSharingExtensionAttachmentsManager sharedManager](ICSharingExtensionAttachmentsManager, "sharedManager"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastNoteSavedTo"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController selectedFolder](self, "selectedFolder"));
    -[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:](self, "setSelectionToNote:folder:prefersSystemPaper:", v6, v5, objc_msgSend(v6, "isSystemPaper"));

  }
}

- (void)tableController:(id)a3 didSelectNote:(id)a4 folder:(id)a5 prefersSystemPaper:(BOOL)a6
{
  -[ICSEMainViewController setSelectionToNote:folder:prefersSystemPaper:](self, "setSelectionToNote:folder:prefersSystemPaper:", a4, a5, a6);
}

- (void)scrollTextToVisibleForTextView:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedTextRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "start"));
  objc_msgSend(v4, "caretRectForPosition:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollView](self, "scrollView"));
  objc_msgSend(v14, "convertRect:fromView:", v4, v7, v9, v11, v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v20;
  v27.size.height = v22;
  if (!CGRectIsInfinite(v27))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollView](self, "scrollView"));
    objc_msgSend(v23, "bounds");
    v29.origin.x = v16;
    v29.origin.y = v18;
    v29.size.width = v20;
    v29.size.height = v22;
    v24 = CGRectContainsRect(v28, v29);

    if (!v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController scrollView](self, "scrollView"));
      objc_msgSend(v25, "scrollRectToVisible:animated:", 1, v16, v18, v20, v22);

    }
  }

}

- (void)attachmentsAvailable
{
  void *v2;
  id v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  ICSEMainViewController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  -[ICSEMainViewController showSaveButton](self, "showSaveButton");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v2 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributedContentText"));
        v10 = objc_msgSend(v3, "length");

        if (v10)
        {
          -[ICSEMainViewController showPlaceholderText:](self, "showPlaceholderText:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "attributedContentText"));
          v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "string"));
          v3 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
          objc_msgSend(v3, "setText:", v2);

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attachment"));
  if (v14)
  {
    -[ICSEMainViewController setLayoutType:](self, "setLayoutType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attachment"));
    -[ICSEMainViewController installBrickForAttachmentInfo:](self, "installBrickForAttachmentInfo:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attachmentModel"));
    v17 = objc_msgSend(v16, "needToGeneratePreviews");

    if (v17)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v19 = objc_claimAutoreleasedReturnValue(global_queue);
      v24 = _NSConcreteStackBlock;
      v25 = 3221225472;
      v26 = sub_1000270F0;
      v27 = &unk_1000D5D38;
      v28 = v15;
      v29 = self;
      dispatch_async(v19, &v24);

    }
    goto LABEL_27;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributedContentText"));
  if (!objc_msgSend(v20, "length"))
  {

LABEL_18:
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaUTI"));
    if (v21)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaUTI"));
      v3 = (id)objc_claimAutoreleasedReturnValue(+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v2));
      if ((objc_msgSend(v3, "conformsToType:", UTTypeImage) & 1) != 0)
        goto LABEL_22;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaUTI"));
    if ((+[ICAttachment typeUTIIsPlayableMovie:](ICAttachment, "typeUTIIsPlayableMovie:", v22) & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image"));

      if (v21)
      {

      }
      if (!v23)
      {
        -[ICSEMainViewController setLayoutType:](self, "setLayoutType:", 1);
        -[ICSEMainViewController installBrickForAttachmentInfo:](self, "installBrickForAttachmentInfo:", v13);
        goto LABEL_28;
      }
      goto LABEL_26;
    }

    if (v21)
    {
LABEL_22:

    }
LABEL_26:
    -[ICSEMainViewController setLayoutType:](self, "setLayoutType:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
    -[ICSEMainViewController installImagesViewForAttachments:](self, "installImagesViewForAttachments:", v15);
LABEL_27:

    goto LABEL_28;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachments](self, "attachments"));
  v3 = objc_msgSend(v2, "count");

  if (v3 != (id)1)
    goto LABEL_18;
  -[ICSEMainViewController setLayoutType:](self, "setLayoutType:", 4);
LABEL_28:
  -[ICSEMainViewController updateTitleFooter](self, "updateTitleFooter", v24, v25, v26, v27);

}

- (void)installBrickForAttachmentInfo:(id)a3
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
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  id v35;

  v35 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "mediaURL"));
  if (v4)
  {

LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subviews"));
    objc_msgSend(v7, "makeObjectsPerformSelector:", "removeFromSuperview");

    +[ICAttachmentBrickView defaultBrickSize](ICAttachmentBrickView, "defaultBrickSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    objc_msgSend(v8, "bounds");

    v9 = objc_msgSend(objc_alloc((Class)ICAttachmentBrickView), "initWithType:", 3);
    -[ICSEMainViewController setAttachmentBrickView:](self, "setAttachmentBrickView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachmentBrickView](self, "attachmentBrickView"));
    objc_msgSend(v10, "setShareExtensionAttachmentInfo:", v35);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachmentBrickView](self, "attachmentBrickView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    objc_msgSend(v12, "addSubview:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    objc_msgSend(v16, "setActive:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    objc_msgSend(v20, "setActive:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    objc_msgSend(v24, "setActive:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "widthAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:multiplier:", v27, 1.0));

    LODWORD(v29) = 1148829696;
    objc_msgSend(v28, "setPriority:", v29);
    objc_msgSend(v28, "setActive:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));

    LODWORD(v34) = 1148682240;
    objc_msgSend(v33, "setPriority:", v34);
    objc_msgSend(v33, "setActive:", 1);
    -[ICSEMainViewController updateBrickContainerHeightConstraint](self, "updateBrickContainerHeightConstraint");

    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "attachment"));

  if (v5)
    goto LABEL_4;
LABEL_5:

}

- (void)contentSizeCategoryChanged:(id)a3
{
  -[ICSEMainViewController updateTextViewsForContentSizeChangeIfNecessary](self, "updateTextViewsForContentSizeChangeIfNecessary", a3);
  -[ICSEMainViewController updateTitleViewHeightConstraint](self, "updateTitleViewHeightConstraint");
  -[ICSEMainViewController updateBrickContainerHeightConstraint](self, "updateBrickContainerHeightConstraint");
}

- (void)updateTitleViewHeightConstraint
{
  double v3;
  id v4;

  if ((ICAccessibilityAccessibilityLargerTextSizesEnabled(self, a2) & 1) != 0)
    v3 = 88.0;
  else
    v3 = sub_1000062FC();
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController titleViewMinHeightConstraint](self, "titleViewMinHeightConstraint"));
  objc_msgSend(v4, "setConstant:", v3);

}

- (void)updateBrickContainerHeightConstraint
{
  double v3;
  double v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController attachmentBrickView](self, "attachmentBrickView"));
  objc_msgSend(v6, "computedSize");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainerHeightConstraint](self, "brickContainerHeightConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

}

- (void)setLayoutType:(unint64_t)a3
{
  if (self->_layoutType != a3)
  {
    self->_layoutType = a3;
    -[ICSEMainViewController setUpForLayoutType:](self, "setUpForLayoutType:");
  }
}

- (void)setUpForLayoutType:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  id v7;

  if (a3 - 3 < 2)
  {
    v5 = 1;
    v6 = 64.0;
    v4 = 1;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    v5 = 0;
    v4 = 1;
LABEL_8:
    v6 = 48.0;
    goto LABEL_9;
  }
  if (a3 != 2)
  {
    v5 = 0;
    v4 = 0;
    goto LABEL_8;
  }
  v4 = 0;
  v5 = 1;
  v6 = 175.0;
LABEL_9:
  -[ICSEMainViewController setBrickViewCollapsed:](self, "setBrickViewCollapsed:", v5);
  -[ICSEMainViewController setBottomTextViewCollapsed:](self, "setBottomTextViewCollapsed:", v5);
  -[ICSEMainViewController setImageViewCollapsed:](self, "setImageViewCollapsed:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextViewMinHeightConstraint](self, "topTextViewMinHeightConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

}

- (void)setImageViewCollapsed:(BOOL)a3
{
  float v4;
  void *v5;
  double v6;
  _BOOL8 imageViewCollapsed;
  id v8;

  self->_imageViewCollapsed = a3;
  if (a3)
    v4 = 999.0;
  else
    v4 = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController imageCollapsibleZeroWidthConstraint](self, "imageCollapsibleZeroWidthConstraint"));
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setPriority:", v6);

  imageViewCollapsed = self->_imageViewCollapsed;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController imagesView](self, "imagesView"));
  objc_msgSend(v8, "setHidden:", imageViewCollapsed);

}

- (void)setBrickViewCollapsed:(BOOL)a3
{
  float v4;
  void *v5;
  double v6;
  _BOOL8 brickViewCollapsed;
  id v8;

  self->_brickViewCollapsed = a3;
  if (a3)
    v4 = 999.0;
  else
    v4 = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickCollapsibleZeroHeightConstraint](self, "brickCollapsibleZeroHeightConstraint"));
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setPriority:", v6);

  brickViewCollapsed = self->_brickViewCollapsed;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController brickContainer](self, "brickContainer"));
  objc_msgSend(v8, "setHidden:", brickViewCollapsed);

}

- (void)setBottomTextViewCollapsed:(BOOL)a3
{
  float v4;
  void *v5;
  double v6;
  _BOOL8 bottomTextViewCollapsed;
  id v8;

  self->_bottomTextViewCollapsed = a3;
  if (a3)
    v4 = 999.0;
  else
    v4 = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextviewCollapsibleZeroHeightConstraint](self, "bottomTextviewCollapsibleZeroHeightConstraint"));
  *(float *)&v6 = v4;
  objc_msgSend(v5, "setPriority:", v6);

  bottomTextViewCollapsed = self->_bottomTextViewCollapsed;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
  objc_msgSend(v8, "setHidden:", bottomTextViewCollapsed);

}

- (ICSERootViewController)rootViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  return (ICSERootViewController *)v3;
}

- (void)showPlaceholderText:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (-[ICSEMainViewController isShowingPlaceholderText](self, "isShowingPlaceholderText") != a3)
  {
    -[ICSEMainViewController setShowingPlaceholderText:](self, "setShowingPlaceholderText:", v3);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    if (-[ICSEMainViewController isShowingPlaceholderText](self, "isShowingPlaceholderText"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add text to your note…"), &stru_1000DAF38, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
      objc_msgSend(v7, "setText:", v6);

      if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      else
        v8 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
      v9 = v11;
      v11 = (id)v8;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
      objc_msgSend(v9, "setText:", &stru_1000DAF38);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
    objc_msgSend(v10, "setTextColor:", v11);

  }
}

- (void)updateTextViewsForContentSizeChangeIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_fontWithSingleLineA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController topTextView](self, "topTextView"));
  objc_msgSend(v5, "setFont:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_fontWithSingleLineA"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController bottomTextView](self, "bottomTextView"));
  objc_msgSend(v7, "setFont:", v6);

}

- (void)installImagesViewForAttachments:(id)a3
{
  id v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  global_queue = dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027B50;
  v8[3] = &unk_1000D5D38;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (double)consumedBottomAreaForResizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController view](self, "view", a3));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  return v5;
}

- (double)topInsetForResizer:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEMainViewController view](self, "view", a3));
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  return v5;
}

- (BOOL)keyboardResizerAutoscrollAboveKeyboard
{
  return 1;
}

- (ICSEContainerViewController)containerViewController
{
  return (ICSEContainerViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (UITextView)topTextView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_topTextView);
}

- (void)setTopTextView:(id)a3
{
  objc_storeWeak((id *)&self->_topTextView, a3);
}

- (UITextView)bottomTextView
{
  return (UITextView *)objc_loadWeakRetained((id *)&self->_bottomTextView);
}

- (void)setBottomTextView:(id)a3
{
  objc_storeWeak((id *)&self->_bottomTextView, a3);
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (ICNote)selectedNote
{
  return self->_selectedNote;
}

- (void)setSelectedNote:(id)a3
{
  objc_storeStrong((id *)&self->_selectedNote, a3);
}

- (ICFolder)selectedFolder
{
  return self->_selectedFolder;
}

- (void)setSelectedFolder:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFolder, a3);
}

- (ICNote)temporaryNewNote
{
  return self->_temporaryNewNote;
}

- (void)setTemporaryNewNote:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryNewNote, a3);
}

- (BOOL)prefersSystemPaper
{
  return self->_prefersSystemPaper;
}

- (void)setPrefersSystemPaper:(BOOL)a3
{
  self->_prefersSystemPaper = a3;
}

- (NSString)lastSelectedNoteIdentifier
{
  return self->_lastSelectedNoteIdentifier;
}

- (void)setLastSelectedNoteIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedNoteIdentifier, a3);
}

- (NSString)lastSelectedFolderIdentifier
{
  return self->_lastSelectedFolderIdentifier;
}

- (void)setLastSelectedFolderIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedFolderIdentifier, a3);
}

- (UILabel)saveToHeaderLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_saveToHeaderLabel);
}

- (void)setSaveToHeaderLabel:(id)a3
{
  objc_storeWeak((id *)&self->_saveToHeaderLabel, a3);
}

- (UIView)brickContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_brickContainer);
}

- (void)setBrickContainer:(id)a3
{
  objc_storeWeak((id *)&self->_brickContainer, a3);
}

- (UIView)titleHeaderView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleHeaderView);
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_titleHeaderView, a3);
}

- (UIView)titleViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleViewContainer);
}

- (void)setTitleViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_titleViewContainer, a3);
}

- (UIView)titleFooterView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_titleFooterView);
}

- (void)setTitleFooterView:(id)a3
{
  objc_storeWeak((id *)&self->_titleFooterView, a3);
}

- (UIView)contentViewTopSeparator
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentViewTopSeparator);
}

- (void)setContentViewTopSeparator:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewTopSeparator, a3);
}

- (UIView)contentViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentViewContainer);
}

- (void)setContentViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_contentViewContainer, a3);
}

- (UILabel)titleFooterLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleFooterLabel);
}

- (void)setTitleFooterLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleFooterLabel, a3);
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentBrickView, a3);
}

- (ICSEImagesView)imagesView
{
  return (ICSEImagesView *)objc_loadWeakRetained((id *)&self->_imagesView);
}

- (void)setImagesView:(id)a3
{
  objc_storeWeak((id *)&self->_imagesView, a3);
}

- (ICSENoteTitleView)titleView
{
  return (ICSENoteTitleView *)objc_loadWeakRetained((id *)&self->_titleView);
}

- (void)setTitleView:(id)a3
{
  objc_storeWeak((id *)&self->_titleView, a3);
}

- (BOOL)titleViewTapped
{
  return self->_titleViewTapped;
}

- (void)setTitleViewTapped:(BOOL)a3
{
  self->_titleViewTapped = a3;
}

- (BOOL)isSaving
{
  return self->_isSaving;
}

- (void)setIsSaving:(BOOL)a3
{
  self->_isSaving = a3;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UIBarButtonItem)activityIndicatorBarButtonItem
{
  return self->_activityIndicatorBarButtonItem;
}

- (void)setActivityIndicatorBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, a3);
}

- (UIBarButtonItem)saveToNoteBarButtonItem
{
  return self->_saveToNoteBarButtonItem;
}

- (void)setSaveToNoteBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_saveToNoteBarButtonItem, a3);
}

- (BOOL)isShowingPlaceholderText
{
  return self->_showingPlaceholderText;
}

- (void)setShowingPlaceholderText:(BOOL)a3
{
  self->_showingPlaceholderText = a3;
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)brickViewCollapsed
{
  return self->_brickViewCollapsed;
}

- (BOOL)imageViewCollapsed
{
  return self->_imageViewCollapsed;
}

- (BOOL)bottomTextViewCollapsed
{
  return self->_bottomTextViewCollapsed;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (NSLayoutConstraint)brickCollapsibleZeroHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_brickCollapsibleZeroHeightConstraint);
}

- (void)setBrickCollapsibleZeroHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_brickCollapsibleZeroHeightConstraint, a3);
}

- (NSLayoutConstraint)imageCollapsibleZeroWidthConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_imageCollapsibleZeroWidthConstraint);
}

- (void)setImageCollapsibleZeroWidthConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_imageCollapsibleZeroWidthConstraint, a3);
}

- (NSLayoutConstraint)bottomTextviewCollapsibleZeroHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomTextviewCollapsibleZeroHeightConstraint);
}

- (void)setBottomTextviewCollapsibleZeroHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomTextviewCollapsibleZeroHeightConstraint, a3);
}

- (NSLayoutConstraint)topTextViewTopConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topTextViewTopConstraint);
}

- (void)setTopTextViewTopConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_topTextViewTopConstraint, a3);
}

- (NSLayoutConstraint)topTextViewMinHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topTextViewMinHeightConstraint);
}

- (void)setTopTextViewMinHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_topTextViewMinHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomTextViewMinHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomTextViewMinHeightConstraint);
}

- (void)setBottomTextViewMinHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomTextViewMinHeightConstraint, a3);
}

- (NSLayoutConstraint)bottomTextViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomTextViewBottomConstraint);
}

- (void)setBottomTextViewBottomConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomTextViewBottomConstraint, a3);
}

- (NSLayoutConstraint)brickContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_brickContainerHeightConstraint);
}

- (void)setBrickContainerHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_brickContainerHeightConstraint, a3);
}

- (NSLayoutConstraint)titleViewMinHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_titleViewMinHeightConstraint);
}

- (void)setTitleViewMinHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_titleViewMinHeightConstraint, a3);
}

- (NSLayoutConstraint)titleFooterViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_titleFooterViewHeightConstraint);
}

- (void)setTitleFooterViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_titleFooterViewHeightConstraint, a3);
}

- (ICScrollViewKeyboardResizer)scrollViewResizer
{
  return self->_scrollViewResizer;
}

- (void)setScrollViewResizer:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewResizer, a3);
}

- (ICRegulatoryLogger)regulatoryLogger
{
  return self->_regulatoryLogger;
}

- (void)setRegulatoryLogger:(id)a3
{
  objc_storeStrong((id *)&self->_regulatoryLogger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_scrollViewResizer, 0);
  objc_destroyWeak((id *)&self->_titleFooterViewHeightConstraint);
  objc_destroyWeak((id *)&self->_titleViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_brickContainerHeightConstraint);
  objc_destroyWeak((id *)&self->_bottomTextViewBottomConstraint);
  objc_destroyWeak((id *)&self->_bottomTextViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_topTextViewMinHeightConstraint);
  objc_destroyWeak((id *)&self->_topTextViewTopConstraint);
  objc_destroyWeak((id *)&self->_bottomTextviewCollapsibleZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_imageCollapsibleZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_brickCollapsibleZeroHeightConstraint);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_saveToNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_destroyWeak((id *)&self->_titleView);
  objc_destroyWeak((id *)&self->_imagesView);
  objc_storeStrong((id *)&self->_attachmentBrickView, 0);
  objc_destroyWeak((id *)&self->_titleFooterLabel);
  objc_destroyWeak((id *)&self->_contentViewContainer);
  objc_destroyWeak((id *)&self->_contentViewTopSeparator);
  objc_destroyWeak((id *)&self->_titleFooterView);
  objc_destroyWeak((id *)&self->_titleViewContainer);
  objc_destroyWeak((id *)&self->_titleHeaderView);
  objc_destroyWeak((id *)&self->_brickContainer);
  objc_destroyWeak((id *)&self->_saveToHeaderLabel);
  objc_storeStrong((id *)&self->_lastSelectedFolderIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSelectedNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_temporaryNewNote, 0);
  objc_storeStrong((id *)&self->_selectedFolder, 0);
  objc_storeStrong((id *)&self->_selectedNote, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_destroyWeak((id *)&self->_bottomTextView);
  objc_destroyWeak((id *)&self->_topTextView);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_containerViewController);
}

@end
