@implementation MFConversationItemHeaderBlock

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007388;
  block[3] = &unk_100038A50;
  block[4] = a1;
  if (qword_100044390 != -1)
    dispatch_once(&qword_100044390, block);
  return (OS_os_log *)(id)qword_100044388;
}

- (MFConversationItemHeaderBlock)initWithFrame:(CGRect)a3 contactStore:(id)a4 accountsProvider:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  MFConversationItemHeaderBlock *v13;
  MFConversationItemHeaderBlock *v14;
  MFConversationItemHeaderBlock *v15;
  void *v16;
  MFMessageInfoViewController *messageInfoViewController;
  void *v18;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MFConversationItemHeaderBlock;
  v13 = -[MFConversationItemHeaderBlock initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    -[MFConversationItemHeaderBlock setContactStore:](v13, "setContactStore:", v11);
    objc_storeStrong((id *)&v14->_accountsProvider, a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    byte_100044398 = objc_msgSend(v16, "BOOLForKey:", CFSTR("ShowMessageHeaderDetails"));

    v15->_showDetails = byte_100044398;
    messageInfoViewController = v15->_messageInfoViewController;
    v15->_messageInfoViewController = 0;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v15, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

  }
  -[MFConversationItemHeaderBlock setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewHeaderBlock);

  return v15;
}

- (void)createPrimaryViews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  double y;
  double width;
  double height;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  MFExpandableCaptionView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  MFAvatarView *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MessageViewStatusIndicatorManager *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  MessageViewStatusIndicatorManager *v45;
  id v46;
  void *v47;
  void *v48;
  objc_super v49;
  void *v50;

  v49.receiver = self;
  v49.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock createPrimaryViews](&v49, "createPrimaryViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView mf_baselineAlignedVerticalStackView](UIStackView, "mf_baselineAlignedVerticalStackView"));
  -[MFConversationItemHeaderBlock setPrimaryStackView:](self, "setPrimaryStackView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  objc_msgSend(v4, "setAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v5);

  v6 = objc_alloc((Class)UIDateLabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFConversationItemHeaderBlock setTimestampLabel:](self, "setTimestampLabel:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v13, "accessibilitySetIdentification:", CFSTR("MessageDateLabel"));

  -[MFConversationItemHeaderBlock _updateLabelColor](self, "_updateLabelColor");
  v14 = objc_alloc((Class)MFModernLabelledAtomList);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FROM_HEADER"), &stru_1000393A0, CFSTR("Main")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("FROM_TITLE"), &stru_1000393A0, CFSTR("Main")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MFAddressBookManager sharedManager](MFAddressBookManager, "sharedManager"));
  v20 = objc_msgSend(v14, "initWithLabel:title:addressBook:", v16, v18, objc_msgSend(v19, "addressBook"));
  -[MFConversationItemHeaderBlock setPrimaryAtomList:](self, "setPrimaryAtomList:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  objc_msgSend(v21, "setPrimary:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  objc_msgSend(v22, "setLabelVisible:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  objc_msgSend(v23, "addArrangedSubview:", v24);

  v25 = -[MFExpandableCaptionView initWithFrame:]([MFExpandableCaptionView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFConversationItemHeaderBlock setCaptionView:](self, "setCaptionView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v26, "setDelegate:", self);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v27, "setShowsTimestampWhenExpanded:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v28, "setShowsBIMIWhenExpanded:", 1);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v29, "addArrangedSubview:", v30);

  if (self && _os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
    -[MFConversationItemHeaderBlock _addMessageInfoButton](self, "_addMessageInfoButton");
  +[MFMessageDisplayMetrics avatarDiameter](MFMessageDisplayMetrics, "avatarDiameter");
  v32 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, v31, v31);
  -[MFConversationItemHeaderBlock setAvatarView:](self, "setAvatarView:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
  objc_msgSend(v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
  objc_msgSend(v34, "setShowsContactOnTap:", 1);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
  objc_msgSend(v35, "setDelegate:", self);

  -[MFConversationItemHeaderBlock _updateAvatarView](self, "_updateAvatarView");
  if (-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
    objc_msgSend(v36, "addArrangedSubview:", v37);
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
    -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v38);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
    v50 = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v39, "setViewsToDodge:", v37);

  }
  v40 = objc_alloc_init(MessageViewStatusIndicatorManager);
  -[MFConversationItemHeaderBlock setStatusIndicatorManager:](self, "setStatusIndicatorManager:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v41, "setHidesVIPIndicator:", 1);

  v42 = objc_alloc_init((Class)UILayoutGuide);
  -[MFConversationItemHeaderBlock setStatusIndicatorLayoutGuide:](self, "setStatusIndicatorLayoutGuide:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuide](self, "statusIndicatorLayoutGuide"));
  -[MFConversationItemHeaderBlock addLayoutGuide:](self, "addLayoutGuide:", v43);

  v44 = objc_alloc_init((Class)UIView);
  objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v44);
  -[MFConversationItemHeaderBlock setHorizontalStatusIndicatorContentView:](self, "setHorizontalStatusIndicatorContentView:", v44);
  v45 = objc_alloc_init(MessageViewStatusIndicatorManager);
  -[MFConversationItemHeaderBlock setHorizontalStatusIndicatorManager:](self, "setHorizontalStatusIndicatorManager:", v45);

  v46 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_tappedHeader:");
  -[MFConversationItemHeaderBlock setTapRecognizer:](self, "setTapRecognizer:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock tapRecognizer](self, "tapRecognizer"));
  objc_msgSend(v47, "setDelegate:", self);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock tapRecognizer](self, "tapRecognizer"));
  -[MFConversationItemHeaderBlock addGestureRecognizer:](self, "addGestureRecognizer:", v48);

  -[MFConversationItemHeaderBlock _updateFonts](self, "_updateFonts");
}

- (void)initializePrimaryLayoutConstraints
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
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
  void *v56;
  objc_super v57;
  _QWORD v58[11];
  _QWORD v59[2];

  v57.receiver = self;
  v57.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock initializePrimaryLayoutConstraints](&v57, "initializePrimaryLayoutConstraints");
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorContentView](self, "horizontalStatusIndicatorContentView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuide](self, "statusIndicatorLayoutGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstBaselineAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topAnchor](self, "topAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v4));
  -[MFConversationItemHeaderBlock setTopConstraint:](self, "setTopConstraint:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomAnchor](self, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[MFConversationItemHeaderBlock setBottomConstraint:](self, "setBottomConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "firstBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v59[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v59[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
  -[MFConversationItemHeaderBlock setTimestampLabelConstraints:](self, "setTimestampLabelConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  -[MFConversationItemHeaderBlock setStatusIndicatorLayoutGuideTrailingConstraint:](self, "setStatusIndicatorLayoutGuideTrailingConstraint:", v19);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topConstraint](self, "topConstraint"));
  v58[0] = v45;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", 7.0));
  v58[1] = v42;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:"));
  v58[2] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", -16.0));
  v58[3] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomConstraint](self, "bottomConstraint"));
  v58[4] = v36;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock leadingAnchor](self, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:"));
  v58[5] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuideTrailingConstraint](self, "statusIndicatorLayoutGuideTrailingConstraint"));
  v58[6] = v33;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topAnchor](self, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:"));
  v58[7] = v31;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstBaselineAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v20));
  v58[8] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v58[9] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "lastBaselineAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v58[10] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 11));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ef_flatten"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)updateConstraints
{
  unsigned int v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
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
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  unsigned int v45;
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
  void *v56;
  void *v57;
  objc_super v58;
  _QWORD v59[5];

  v58.receiver = self;
  v58.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock updateConstraints](&v58, "updateConstraints");
  v3 = -[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "topToSenderBaselineInConversation");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topConstraint](self, "topConstraint"));
    objc_msgSend(v8, "setConstant:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
    objc_msgSend(v9, "recipientBaselineToFirstSeparatorInConversation");
  }
  else
  {
    objc_msgSend(v4, "topToSenderBaseline");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topConstraint](self, "topConstraint"));
    objc_msgSend(v15, "setConstant:", v14);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
    objc_msgSend(v9, "recipientBaselineToFirstSeparator");
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomConstraint](self, "bottomConstraint"));
  objc_msgSend(v12, "setConstant:", v11);

  if (-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuideTrailingConstraint](self, "statusIndicatorLayoutGuideTrailingConstraint"));
    objc_msgSend(v16, "setConstant:", 0.0);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarViewConstraints](self, "avatarViewConstraints"));
    v18 = v17 == 0;

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomAnchor](self, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:", v21));
      -[MFConversationItemHeaderBlock setBottomToAvatarBottomConstraint:](self, "setBottomToAvatarBottomConstraint:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
      -[MFConversationItemHeaderBlock setAvatarTopConstraint:](self, "setAvatarTopConstraint:", v26);

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", -7.0));
      v59[0] = v53;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock trailingAccessoryViewLayoutGuide](self, "trailingAccessoryViewLayoutGuide"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "widthAnchor"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v27));
      v59[1] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "heightAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
      v59[2] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarTopConstraint](self, "avatarTopConstraint"));
      v59[3] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomToAvatarBottomConstraint](self, "bottomToAvatarBottomConstraint"));
      v59[4] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 5));
      -[MFConversationItemHeaderBlock setAvatarViewConstraints:](self, "setAvatarViewConstraints:", v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
      objc_msgSend(v35, "messageBottomPaddingInConversation");
      v37 = v36;
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock bottomToAvatarBottomConstraint](self, "bottomToAvatarBottomConstraint"));
      objc_msgSend(v38, "setConstant:", v37);

    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarViewConstraints](self, "avatarViewConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
    objc_msgSend(v40, "minHorizontalSpacing");
    v42 = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackViewLeadingConstraint](self, "primaryStackViewLeadingConstraint"));
    objc_msgSend(v43, "setConstant:", v42);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuideTrailingConstraint](self, "statusIndicatorLayoutGuideTrailingConstraint"));
    objc_msgSend(v16, "setConstant:", -7.0);
  }

  -[MFConversationItemHeaderBlock _configureTimestampRevealActionsButtonConstraints](self, "_configureTimestampRevealActionsButtonConstraints");
  if (self && _os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    v45 = objc_msgSend(v44, "isExpanded");

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
    v47 = v46;
    if (v45)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v50));
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, -8.0));
    }
    objc_msgSend(v51, "setActive:", 1);

  }
}

- (void)_clearTimestampRevealActionsButtonConstraints
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabelConstraints](self, "timestampLabelConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabelConstraints](self, "timestampLabelConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

  }
  -[MFConversationItemHeaderBlock setActiveTimestampLabelConstraints:](self, "setActiveTimestampLabelConstraints:", 0);
}

- (void)_configureTimestampRevealActionsButtonConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock revealActionsButton](self, "revealActionsButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock revealActionsButton](self, "revealActionsButton"));
    objc_msgSend(v5, "removeFromSuperview");

  }
  if ((-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabelConstraints](self, "timestampLabelConstraints"));
  v8 = (id)v6;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock activeTimestampLabelConstraints](self, "activeTimestampLabelConstraints"));

  if (v8 != v7)
  {
    -[MFConversationItemHeaderBlock _clearTimestampRevealActionsButtonConstraints](self, "_clearTimestampRevealActionsButtonConstraints");
    -[MFConversationItemHeaderBlock setActiveTimestampLabelConstraints:](self, "setActiveTimestampLabelConstraints:", v8);
    if (v8)
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
  }

}

- (void)_revealActionsButtonTapped:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock revealActionsButton](self, "revealActionsButton"));
  objc_msgSend(v5, "conversationItemHeader:didTapRevealActionsButton:", self, v4);

}

- (void)_updateStackViewSpacing
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  unsigned __int8 v7;
  unsigned int v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = -[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
  v10 = v4;
  if (v3)
    objc_msgSend(v4, "baselineToBaselineSpacingInConversation");
  else
    objc_msgSend(v4, "baselineToBaselineSpacing");
  v6 = v5;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  if ((objc_msgSend(v11, "isExpanded") & 1) != 0
    || -[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout"))
  {
    v7 = -[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout");

    if ((v7 & 1) == 0)
    {
      v8 = +[UIDevice mf_isPad](UIDevice, "mf_isPad");
      v9 = 8.0;
      if (v8)
        v9 = 6.0;
      v6 = v6 + v9;
    }
  }
  else
  {

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v12, "setListSpacing:", v6);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  objc_msgSend(v13, "setSpacing:", v6);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  objc_msgSend(v14, "setLineSpacing:", v6);

}

- (void)setDisplayMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock setDisplayMetrics:](&v7, "setDisplayMetrics:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));

  if (v5)
  {
    -[MFConversationItemHeaderBlock _updateStackViewSpacing](self, "_updateStackViewSpacing");
    -[MFConversationItemHeaderBlock _clearAvatarViewConstraints](self, "_clearAvatarViewConstraints");
    -[MFConversationItemHeaderBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[MFConversationItemHeaderBlock updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    objc_msgSend(v6, "layoutIfNeeded");

  }
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock layoutSubviews](&v8, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorLayoutGuide](self, "statusIndicatorLayoutGuide"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
  v5 = objc_msgSend(v4, "effectiveIndicatorOptions");

  if (v5)
  {
    objc_msgSend(v3, "layoutFrame");
    -[MFConversationItemHeaderBlock _layoutStatusIndicatorsInRect:](self, "_layoutStatusIndicatorsInRect:");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager"));
  v7 = objc_msgSend(v6, "effectiveIndicatorOptions");

  if (v7)
  {
    objc_msgSend(v3, "layoutFrame");
    -[MFConversationItemHeaderBlock _layoutHorizontalStatusIndicators:](self, "_layoutHorizontalStatusIndicators:");
  }

}

- (void)setDisplayOptions:(int64_t)a3
{
  id v4;

  if (self->_displayOptions != a3)
  {
    self->_displayOptions = a3;
    -[MFConversationItemHeaderBlock _updateStyle](self, "_updateStyle");
    -[MFConversationItemHeaderBlock _updateSubviewConstraints](self, "_updateSubviewConstraints");
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
    objc_msgSend(v4, "updateImageViews");

  }
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock setInteractivelyResizing:](&v7, "setInteractivelyResizing:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "captionLabel"));
  objc_msgSend(v6, "setPreventAutoUpdatingLabel:", v3);

}

- (void)_updateStyle
{
  unsigned int v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t displayOptions;
  void *v20;
  void *v21;
  void *v22;

  v3 = -[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock tapRecognizer](self, "tapRecognizer"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setEnabled:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _footnoteFont](self, "_footnoteFont"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v8, "setShowsTimestampWhenExpanded:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v9, "setShowsBIMIWhenExpanded:", 1);

    if ((-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout") & 1) != 0)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
    v22 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v12, "setViewsToDodge:", v11);
  }
  else
  {
    objc_msgSend(v4, "setEnabled:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _subheadFont](self, "_subheadFont"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v15, "setShowsTimestampWhenExpanded:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v16, "setShowsBIMIWhenExpanded:", 0);

    if ((-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout") & 1) != 0)
      goto LABEL_7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    v21 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v12, "setViewsToDodge:", v11);
  }

LABEL_7:
  if (-[MFConversationItemHeaderBlock _shouldUseFootnoteFontInCaptionView](self, "_shouldUseFootnoteFontInCaptionView"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _footnoteFont](self, "_footnoteFont"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v18, "setFont:", v17);

  }
  displayOptions = self->_displayOptions;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v20, "setHidesUnreadIndicator:", (displayOptions >> 4) & 1);

}

- (void)_updateSubviewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock revealActionsButton](self, "revealActionsButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackView](self, "primaryStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  v6 = objc_msgSend(v5, "isExpanded");

  v7 = -[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackViewLeadingConstraint](self, "primaryStackViewLeadingConstraint"));
  objc_msgSend(v8, "setActive:", 0);

  -[MFConversationItemHeaderBlock _clearTimestampRevealActionsButtonConstraints](self, "_clearTimestampRevealActionsButtonConstraints");
  objc_msgSend(v3, "removeFromSuperview");
  objc_msgSend(v15, "removeFromSuperview");
  objc_msgSend(v4, "removeArrangedSubview:", v15);
  objc_msgSend(v15, "setAlpha:", 1.0);
  if (-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout"))
  {
    if (((v6 | v7 ^ 1) & 1) == 0)
      objc_msgSend(v4, "addArrangedSubview:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    -[MFConversationItemHeaderBlock setPrimaryStackViewLeadingConstraint:](self, "setPrimaryStackViewLeadingConstraint:", v12);
  }
  else
  {
    -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v15);
    v13 = 1.0;
    if (v6)
      v13 = 0.0;
    objc_msgSend(v15, "setAlpha:", v13);
    -[MFConversationItemHeaderBlock _configureTimestampRevealActionsButtonConstraints](self, "_configureTimestampRevealActionsButtonConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    -[MFConversationItemHeaderBlock setPrimaryStackViewLeadingConstraint:](self, "setPrimaryStackViewLeadingConstraint:", v12);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryStackViewLeadingConstraint](self, "primaryStackViewLeadingConstraint"));
  objc_msgSend(v14, "setActive:", 1);

}

- (void)_addMessageInfoButton
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
  _QWORD v24[5];
  _QWORD v25[3];

  if (self)
  {
    if (_os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleFootnote, UIFontWeightSemibold));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", MFImageGlyphInfo));
      objc_msgSend(v23, "setImage:", v3);

      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      objc_msgSend(v23, "setBaseForegroundColor:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
      objc_msgSend(v23, "setBaseBackgroundColor:", v5);

      objc_msgSend(v23, "setButtonSize:", 2);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100009D9C;
      v24[3] = &unk_100038A78;
      v24[4] = self;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v24));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v23));
      -[MFConversationItemHeaderBlock setMessageInfoButton:](self, "setMessageInfoButton:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
      objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
      -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v8);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 20.0));
      v25[0] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 20.0));
      v25[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock messageInfoButton](self, "messageInfoButton"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock topAnchor](self, "topAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 18.0));
      v25[2] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    }
  }
}

- (BOOL)_hasConversationLayout
{
  return ((unint64_t)-[MFConversationItemHeaderBlock displayOptions](self, "displayOptions") >> 1) & 1;
}

- (BOOL)_shouldHideDetailsButton
{
  return ((unint64_t)-[MFConversationItemHeaderBlock displayOptions](self, "displayOptions") >> 2) & 1;
}

- (BOOL)_shouldUseFootnoteFontInCaptionView
{
  return 0;
}

- (BOOL)_shouldSaveHeaderDetailsButtonSettings
{
  unsigned __int8 v3;

  v3 = -[MFConversationItemHeaderBlock _shouldHideDetailsButton](self, "_shouldHideDetailsButton");
  return (-[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout") | v3) ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = -[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout");
  v7.receiver = self;
  v7.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  if (v5 != -[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout"))
  {
    -[MFConversationItemHeaderBlock _updateAvatarView](self, "_updateAvatarView");
    -[MFConversationItemHeaderBlock _updateStyle](self, "_updateStyle");
    -[MFConversationItemHeaderBlock _updateSubviewConstraints](self, "_updateSubviewConstraints");
    -[MFConversationItemHeaderBlock setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[MFConversationItemHeaderBlock updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock superview](self, "superview"));
    objc_msgSend(v6, "layoutIfNeeded");

  }
  -[MFConversationItemHeaderBlock _updateLabelColor](self, "_updateLabelColor");

}

- (void)_updateAvatarView
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = -[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
  v8 = v4;
  if (v3)
  {
    objc_msgSend(v4, "removeFromSuperview");

  }
  else
  {
    -[MFConversationItemHeaderBlock addSubview:](self, "addSubview:", v4);

    -[MFConversationItemHeaderBlock _updateDisplayedContact](self, "_updateDisplayedContact");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v7, "setViewsToDodge:", v6);

  }
}

- (void)_updateLabelColor
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailExpandedConversationViewCellDateLabelColor](UIColor, "mailExpandedConversationViewCellDateLabelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v3, "setTextColor:", v4);

}

- (void)_clearAvatarViewConstraints
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarViewConstraints](self, "avatarViewConstraints"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarViewConstraints](self, "avatarViewConstraints"));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v4);

    -[MFConversationItemHeaderBlock setAvatarViewConstraints:](self, "setAvatarViewConstraints:", 0);
    -[MFConversationItemHeaderBlock setAvatarTopConstraint:](self, "setAvatarTopConstraint:", 0);
    -[MFConversationItemHeaderBlock setBottomToAvatarBottomConstraint:](self, "setBottomToAvatarBottomConstraint:", 0);
  }
}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "atomManager"));
  objc_msgSend(v4, "setAtomProvider:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MFConversationItemHeaderBlock;
  -[MFConversationItemHeaderBlock prepareForReuse](&v5, "prepareForReuse");
}

- (void)displayMessageUsingViewModel:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
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
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  _QWORD v36[5];
  _QWORD v37[5];

  v35.receiver = self;
  v35.super_class = (Class)MFConversationItemHeaderBlock;
  v30 = a3;
  -[MFConversationItemHeaderBlock displayMessageUsingViewModel:](&v35, "displayMessageUsingViewModel:", v30);
  -[MFConversationItemHeaderBlock _updateDisplayedContact](self, "_updateDisplayedContact");
  -[MFConversationItemHeaderBlock _updateTimestampLabels](self, "_updateTimestampLabels");
  -[MFConversationItemHeaderBlock _updateStatusIndicators:](self, "_updateStatusIndicators:", v30);
  -[MFConversationItemHeaderBlock _updateHorizontalStatusIndicators:](self, "_updateHorizontalStatusIndicators:", v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock observableCancelable](self, "observableCancelable"));
  objc_msgSend(v4, "cancel");

  v36[0] = CFSTR("FromAtomsKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "senderList"));
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &__NSArray0__struct;
  v37[0] = v7;
  v36[1] = CFSTR("ReplyToAtomsKey");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyToList"));
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = &__NSArray0__struct;
  v37[1] = v10;
  v36[2] = CFSTR("ToAtomsKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toList"));
  v13 = (void *)v12;
  if (v12)
    v14 = (void *)v12;
  else
    v14 = &__NSArray0__struct;
  v37[2] = v14;
  v36[3] = CFSTR("CcAtomsKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ccList"));
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = &__NSArray0__struct;
  v37[3] = v18;
  v36[4] = CFSTR("BccAtomsKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bccList"));
  v21 = (void *)v20;
  if (v20)
    v22 = (void *)v20;
  else
    v22 = &__NSArray0__struct;
  v37[4] = v22;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 5));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v23, "setParticipants:", v31);
  if (v30)
  {
    objc_msgSend(v23, "setHideDetailsButton:", -[MFConversationItemHeaderBlock _shouldHideDetailsButton](self, "_shouldHideDetailsButton"));
    objc_msgSend(v23, "setExpanded:animated:force:", objc_msgSend(v23, "isExpanded"), 0, 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "modelObservable"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000A664;
    v32[3] = &unk_100038AA0;
    objc_copyWeak(&v33, &location);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subscribeWithResultBlock:", v32));
    -[MFConversationItemHeaderBlock setObservableCancelable:](self, "setObservableCancelable:", v25);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "atomManager"));
  objc_msgSend(v27, "setAtomProvider:", self);

}

- (void)_updateDisplayedContact
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderList"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  if ((-[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "brandIndicatorFuture"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock contactStore](self, "contactStore"));
    v10 = objc_msgSend(v6, "displayPersonForEmailAddress:brandIndicatorFuture:usingContactStore:", v5, v8, v9);

  }
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "brandIndicatorFuture"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000A958;
  v16[3] = &unk_100038AF0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v12, "addSuccessBlock:", v16);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000AA90;
  v14[3] = &unk_100038B18;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v13, "setAddresses:withCompletion:", v4, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_updateTimestampLabels
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateSent"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v4, "setDate:", v6);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v5, "setDateSent:", v6);

}

- (void)_updateStatusIndicators:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
  v5 = objc_msgSend(v13, "isReplied");
  v6 = objc_msgSend(v13, "isForwarded");
  v7 = objc_msgSend(v13, "isRead");
  v8 = objc_msgSend(v13, "isVIP");
  v9 = 8;
  if (!v5)
    v9 = 0;
  if (v6)
    v9 |= 0x10uLL;
  v10 = v9 | v7 ^ 1;
  if (v8)
    v11 = v10 | 2;
  else
    v11 = v10;
  objc_msgSend(v4, "setIndicatorOptions:", v11);
  if (objc_msgSend(v4, "effectiveIndicatorOptions"))
  {
    -[MFConversationItemHeaderBlock setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusIndicatorImageViews"));
    objc_msgSend(v12, "makeObjectsPerformSelector:", "removeFromSuperview");

  }
}

- (void)_updateHorizontalStatusIndicators:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager"));
  v5 = objc_msgSend(v13, "isFlagged");
  v6 = objc_msgSend(v13, "hasAttachments");
  v7 = objc_msgSend(v13, "isNotify");
  v8 = objc_msgSend(v13, "isMute");
  v9 = objc_msgSend(v13, "isBlockedSender");
  v10 = 4;
  if (!v5)
    v10 = 0;
  if (v6)
    v10 |= 0x20uLL;
  if (v7)
    v10 |= 0x40uLL;
  if (v8)
    v10 |= 0x80uLL;
  if (v9)
    v11 = v10 | 0x100;
  else
    v11 = v10;
  objc_msgSend(v4, "setIndicatorOptions:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "flagColors"));
  objc_msgSend(v4, "setFlagColors:", v12);

  if (objc_msgSend(v4, "effectiveIndicatorOptions"))
    -[MFConversationItemHeaderBlock setNeedsLayout](self, "setNeedsLayout");
  else
    -[MFConversationItemHeaderBlock _resetHorizontalStatusIndicatorContentViewIfNeeded](self, "_resetHorizontalStatusIndicatorContentViewIfNeeded");

}

- (void)_layoutStatusIndicatorsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double MaxY;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double MidX;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[8];
  _BYTE v38[128];
  CGRect v39;
  CGRect v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
    objc_msgSend(v8, "updateImageViews");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock displayMetrics](self, "displayMetrics"));
    objc_msgSend(v9, "baselineToBaselineSpacing");
    v11 = v10;

    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MaxY = CGRectGetMaxY(v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "label"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "font"));
    objc_msgSend(v15, "capHeight");
    v17 = v16;

    LODWORD(v15) = -[MFConversationItemHeaderBlock mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MidX = CGRectGetMidX(v40);
    v19 = x;
    v20 = y;
    v21 = width;
    v22 = height;
    if ((_DWORD)v15)
    {
      v23 = CGRectGetMinX(*(CGRect *)&v19) + 14.0;
      if (MidX < v23)
        v23 = MidX;
      v24 = -1.0;
    }
    else
    {
      v23 = CGRectGetMaxX(*(CGRect *)&v19) + -14.0;
      if (MidX >= v23)
        v23 = MidX;
      v24 = 1.0;
    }
    v30 = v23 + v24;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "statusIndicatorImageViews"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000B170;
    v37[3] = &unk_100038B40;
    v37[4] = self;
    *(double *)&v37[5] = v30;
    *(double *)&v37[6] = MaxY + v17 * -0.5;
    *(double *)&v37[7] = v11 + 1.0;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", v37);

  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock statusIndicatorManager](self, "statusIndicatorManager", 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "statusIndicatorImageViews"));

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v34;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v29), "removeFromSuperview");
          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v27);
    }

  }
}

- (void)_layoutHorizontalStatusIndicators:(CGRect)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  if (-[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout"))
  {
    objc_msgSend(v12, "updateImageViews");
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "statusIndicatorImageViews"));
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorContentView](self, "horizontalStatusIndicatorContentView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subviews"));
      objc_msgSend(v6, "makeObjectsPerformSelector:", "removeFromSuperview");

      v7 = objc_msgSend(v5, "mf_prefersRightToLeftInterfaceLayout");
      objc_msgSend(v12, "midXToMidXSpacing");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_reverse"));
      if (v7)
        v9 = -v9;

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000B448;
      v13[3] = &unk_100038B68;
      v11 = v5;
      v14 = v11;
      v4 = v10;
      v15 = v4;
      v16 = v9;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
      objc_msgSend(v11, "setNeedsUpdateConstraints");
      objc_msgSend(v11, "layoutIfNeeded");

    }
    else
    {
      -[MFConversationItemHeaderBlock _resetHorizontalStatusIndicatorContentViewIfNeeded](self, "_resetHorizontalStatusIndicatorContentViewIfNeeded");
    }

  }
  else
  {
    -[MFConversationItemHeaderBlock _resetHorizontalStatusIndicatorContentViewIfNeeded](self, "_resetHorizontalStatusIndicatorContentViewIfNeeded");
  }

}

- (void)_resetHorizontalStatusIndicatorContentViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock horizontalStatusIndicatorContentView](self, "horizontalStatusIndicatorContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock placeHolderView](self, "placeHolderView"));
  if (!v4 || objc_msgSend(v3, "count") != (id)1 || (objc_msgSend(v3, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v3, "makeObjectsPerformSelector:", "removeFromSuperview");
    if (!v4)
    {
      v5 = objc_alloc_init((Class)UIView);
      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v4 = v5;
      -[MFConversationItemHeaderBlock setPlaceHolderView:](self, "setPlaceHolderView:", v5);
    }
    objc_msgSend(v15, "addSubview:", v4);
    v6 = objc_opt_new(NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
    -[NSMutableArray addObject:](v6, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    -[NSMutableArray addObject:](v6, "addObject:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 0.0));
    -[NSMutableArray addObject:](v6, "addObject:", v14);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v6);
  }

}

- (void)_showMessageInfo
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  MFMessageInfoViewController *v12;
  void *v13;
  void *v14;
  MFMessageInfoViewController *v15;
  void *v16;
  void *v17;
  double v18;
  _QWORD block[4];
  id v20;
  MFConversationItemHeaderBlock *v21;
  uint64_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[4];
  NSObject *v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_10000BDA0;
  v45 = sub_10000BDB0;
  v46 = 0;
  if (_os_feature_enabled_impl("Mail", "AttachmentsSharedWithYou"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "conversationAttachmentURLsForConversationItemHeaderBlock:", self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "richLinksInConversationForConversationItemHeaderBlock:", self));
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = sub_10000BDA0;
    v39[4] = sub_10000BDB0;
    v40 = (id)0xAAAAAAAAAAAAAAAALL;
    v40 = objc_alloc_init((Class)NSMutableArray);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_10000BDA0;
    v37[4] = sub_10000BDB0;
    v38 = (id)0xAAAAAAAAAAAAAAAALL;
    v38 = objc_alloc_init((Class)NSMutableArray);
    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000BDB8;
    v34[3] = &unk_100038B90;
    v36 = v39;
    v7 = v6;
    v35 = v7;
    objc_msgSend(v4, "addSuccessBlock:", v34);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000BE04;
    v31[3] = &unk_100038BB8;
    v33 = v39;
    v8 = v7;
    v32 = v8;
    objc_msgSend(v4, "addFailureBlock:", v31);
    dispatch_group_enter(v8);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000BE74;
    v28[3] = &unk_100038B90;
    v30 = v37;
    v9 = v8;
    v29 = v9;
    objc_msgSend(v5, "addSuccessBlock:", v28);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000BEC0;
    v25[3] = &unk_100038BB8;
    v27 = v37;
    v10 = v9;
    v26 = v10;
    objc_msgSend(v5, "addFailureBlock:", v25);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BFD0;
    block[3] = &unk_100038BE0;
    v20 = WeakRetained;
    v21 = self;
    v22 = &v41;
    v23 = v39;
    v24 = v37;
    v11 = WeakRetained;
    dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v37, 8);
    _Block_object_dispose(v39, 8);

  }
  else
  {
    v12 = [MFMessageInfoViewController alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock contactStore](self, "contactStore"));
    v15 = -[MFMessageInfoViewController initWithViewModel:contactsStore:](v12, "initWithViewModel:contactsStore:", v13, v14);
    v16 = (void *)v42[5];
    v42[5] = (uint64_t)v15;

    -[MFConversationItemHeaderBlock setMessageInfoViewController:](self, "setMessageInfoViewController:", v42[5]);
    objc_msgSend((id)v42[5], "setDelegate:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v42[5], "view"));
    objc_msgSend(v17, "frame");
    objc_msgSend((id)v42[5], "setPreferredContentSize:", 320.0, v18);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate"));
    objc_msgSend(v4, "conversationItemHeader:presentViewController:", self, v42[5]);
  }

  _Block_object_dispose(&v41, 8);
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForPresentationsFromConversationItemHeader:", self));

  return v5;
}

- (void)setShowsHeaderDetails:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v6, "setExpanded:animated:force:", v5, v4, 0);

}

- (id)expandableCaptionView:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conversationItemHeader:displayNameForEmailAddress:abbreviated:", self, v7, v5));

  return v9;
}

- (id)popoverManagerForExpandableCaptionView:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverManagerForForConversationItemHeader:", self));

  return v5;
}

- (void)expandableCaptionView:(id)a3 willBecomeExpanded:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  BOOL v26;
  void *v27;
  void *v28;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock viewModel](self, "viewModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "atomManager"));
    objc_msgSend(v11, "updateTrustForDisplayedAtoms");

  }
  v12 = -[MFConversationItemHeaderBlock usingLargeTextLayout](self, "usingLargeTextLayout");
  v13 = v12;
  if (v6)
  {
    if ((v12 & 1) != 0)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock avatarView](self, "avatarView"));
    v28 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v20, "setViewsToDodge:", v19);
    v14 = 1;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "addressAtoms"));
    v17 = (unint64_t)objc_msgSend(v16, "count") < 2;

    v14 = (2 * v17);
    if ((v13 & 1) != 0)
      goto LABEL_10;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
    v27 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v20, "setViewsToDodge:", v19);
  }

LABEL_10:
  if (objc_msgSend(v9, "isAnimated"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v21, "crossFadeLabelVisibility:atomSeparatorStyle:withAnimationCoordinator:", v6, v14, v9);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v22, "setLabelVisible:", v6);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
    objc_msgSend(v21, "setAddressAtomSeparatorStyle:", v14);
  }

  -[MFConversationItemHeaderBlock setClipsToBounds:](self, "setClipsToBounds:", 1);
  v24[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000C640;
  v25[3] = &unk_100038C08;
  v25[4] = self;
  v26 = v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000C794;
  v24[3] = &unk_100038C30;
  objc_msgSend(v9, "animateAlongsideAnimations:completion:", v25, v24);
  if (self->_showDetails != v6)
  {
    if (-[MFConversationItemHeaderBlock _shouldSaveHeaderDetailsButtonSettings](self, "_shouldSaveHeaderDetailsButtonSettings"))
    {
      self->_showDetails = v6;
      if (byte_100044398 != v6)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v23, "setBool:forKey:", self->_showDetails, CFSTR("ShowMessageHeaderDetails"));

        byte_100044398 = self->_showDetails;
      }
    }
  }

}

- (void)expandableCaptionView:(id)a3 didTapAtom:(id)a4 forAtomType:(unint64_t)a5
{
  id WeakRetained;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "conversationItemHeader:didSelectAddressAtom:forAtomType:") & 1) != 0)
    objc_msgSend(WeakRetained, "conversationItemHeader:didSelectAddressAtom:forAtomType:", self, v8, a5);

}

- (void)expandableCaptionViewDidTapBIMILearnMore:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock delegate](self, "delegate", a3));
  objc_msgSend(v4, "conversationItemHeaderDidTapBIMILearnMore:", self);

}

- (void)_primaryAddressAtomWasTapped:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "conversationItemHeader:didSelectAddressAtom:forAtomType:") & 1) != 0)
    objc_msgSend(WeakRetained, "conversationItemHeader:didSelectAddressAtom:forAtomType:", self, v5, 1);

}

- (void)iterateDisplayedAtomListsWithBlock:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  v6[2](v6, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  objc_msgSend(v5, "iterateAtomListsWithBlock:", v6);

}

- (BOOL)shouldDecorateAtomListWithSMIMEStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  LOBYTE(self) = v5 == v4;

  return (char)self;
}

- (void)setOtherSigners:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ef_map:", &stru_100038C70));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  if (v6)
    v5 = v6;
  else
    v5 = &__NSArray0__struct;
  objc_msgSend(v4, "setOtherSigners:", v5);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
  v6 = objc_msgSend(v5, "isExpanded");

  if (v6)
  {
    objc_msgSend(v4, "locationInView:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock hitTest:withEvent:](self, "hitTest:withEvent:", 0));
    v8 = objc_opt_class(MFModernAddressAtom);
    v9 = objc_opt_isKindOfClass(v7, v8) ^ 1;

  }
  else
  {
    v9 = 1;
  }

  return v9 & 1;
}

- (void)_tappedHeader:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView", a3));
  objc_msgSend(v3, "setExpanded:animated:force:", 1, 1, 0);

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _footnoteFont](self, "_footnoteFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock timestampLabel](self, "timestampLabel"));
  objc_msgSend(v3, "setFont:", v6);

  if (-[MFConversationItemHeaderBlock _hasConversationLayout](self, "_hasConversationLayout")
    || -[MFConversationItemHeaderBlock _shouldUseFootnoteFontInCaptionView](self, "_shouldUseFootnoteFontInCaptionView"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _footnoteFont](self, "_footnoteFont"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v4, "setFont:", v7);
  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock _subheadFont](self, "_subheadFont"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock captionView](self, "captionView"));
    objc_msgSend(v4, "setFont:", v7);
  }

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationItemHeaderBlock primaryAtomList](self, "primaryAtomList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderSenderLabelFont](UIFont, "mf_messageHeaderSenderLabelFont"));
  objc_msgSend(v8, "setOverrideFont:", v5);

}

- (id)_subheadFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedPreferredFontForStyle:", UIFontTextStyleSubheadline));

  return v3;
}

- (id)_footnoteFont
{
  return +[UIFont mf_messageHeaderSummaryLabelFont](UIFont, "mf_messageHeaderSummaryLabelFont");
}

- (void)messageInfoViewController:(id)a3 didSelectAddress:(id)a4 forAtomType:(unint64_t)a5
{
  id WeakRetained;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "conversationItemHeader:didSelectAddress:forAtomType:") & 1) != 0)
    objc_msgSend(WeakRetained, "conversationItemHeader:didSelectAddress:forAtomType:", self, v8, a5);

}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountsProvider, a3);
}

- (MFConversationItemHeaderBlockDelegate)delegate
{
  return (MFConversationItemHeaderBlockDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)displayOptions
{
  return self->_displayOptions;
}

- (MFModernLabelledAtomList)primaryAtomList
{
  return self->_primaryAtomList;
}

- (void)setPrimaryAtomList:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAtomList, a3);
}

- (UIDateLabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabel, a3);
}

- (UIButton)revealActionsButton
{
  return self->_revealActionsButton;
}

- (void)setRevealActionsButton:(id)a3
{
  objc_storeStrong((id *)&self->_revealActionsButton, a3);
}

- (UIStackView)primaryStackView
{
  return self->_primaryStackView;
}

- (void)setPrimaryStackView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStackView, a3);
}

- (UIView)horizontalStatusIndicatorContentView
{
  return self->_horizontalStatusIndicatorContentView;
}

- (void)setHorizontalStatusIndicatorContentView:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorContentView, a3);
}

- (UIView)placeHolderView
{
  return self->_placeHolderView;
}

- (void)setPlaceHolderView:(id)a3
{
  objc_storeStrong((id *)&self->_placeHolderView, a3);
}

- (MFExpandableCaptionView)captionView
{
  return self->_captionView;
}

- (void)setCaptionView:(id)a3
{
  objc_storeStrong((id *)&self->_captionView, a3);
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (UILayoutGuide)statusIndicatorLayoutGuide
{
  return self->_statusIndicatorLayoutGuide;
}

- (void)setStatusIndicatorLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuide, a3);
}

- (MessageViewStatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorManager, a3);
}

- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager
{
  return self->_horizontalStatusIndicatorManager;
}

- (void)setHorizontalStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, a3);
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraint, a3);
}

- (NSLayoutConstraint)bottomToAvatarBottomConstraint
{
  return self->_bottomToAvatarBottomConstraint;
}

- (void)setBottomToAvatarBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomToAvatarBottomConstraint, a3);
}

- (NSLayoutConstraint)primaryStackViewLeadingConstraint
{
  return self->_primaryStackViewLeadingConstraint;
}

- (void)setPrimaryStackViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryStackViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)avatarTopConstraint
{
  return self->_avatarTopConstraint;
}

- (void)setAvatarTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_avatarTopConstraint, a3);
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraint, a3);
}

- (NSLayoutConstraint)statusIndicatorLayoutGuideTrailingConstraint
{
  return self->_statusIndicatorLayoutGuideTrailingConstraint;
}

- (void)setStatusIndicatorLayoutGuideTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuideTrailingConstraint, a3);
}

- (NSArray)timestampLabelConstraints
{
  return self->_timestampLabelConstraints;
}

- (void)setTimestampLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabelConstraints, a3);
}

- (NSArray)activeTimestampLabelConstraints
{
  return self->_activeTimestampLabelConstraints;
}

- (void)setActiveTimestampLabelConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_activeTimestampLabelConstraints, a3);
}

- (NSArray)avatarViewConstraints
{
  return self->_avatarViewConstraints;
}

- (void)setAvatarViewConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewConstraints, a3);
}

- (MFMessageInfoViewController)messageInfoViewController
{
  return self->_messageInfoViewController;
}

- (void)setMessageInfoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageInfoViewController, a3);
}

- (UIButton)messageInfoButton
{
  return self->_messageInfoButton;
}

- (void)setMessageInfoButton:(id)a3
{
  objc_storeStrong((id *)&self->_messageInfoButton, a3);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (EFCancelable)observableCancelable
{
  return self->_observableCancelable;
}

- (void)setObservableCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_observableCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableCancelable, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_messageInfoButton, 0);
  objc_storeStrong((id *)&self->_messageInfoViewController, 0);
  objc_storeStrong((id *)&self->_avatarViewConstraints, 0);
  objc_storeStrong((id *)&self->_activeTimestampLabelConstraints, 0);
  objc_storeStrong((id *)&self->_timestampLabelConstraints, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_avatarTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryStackViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToAvatarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_statusIndicatorLayoutGuide, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorContentView, 0);
  objc_storeStrong((id *)&self->_primaryStackView, 0);
  objc_storeStrong((id *)&self->_revealActionsButton, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_primaryAtomList, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
