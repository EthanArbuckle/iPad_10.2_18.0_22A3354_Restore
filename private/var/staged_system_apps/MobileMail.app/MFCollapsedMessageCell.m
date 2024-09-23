@implementation MFCollapsedMessageCell

- (MFCollapsedMessageCell)initWithFrame:(CGRect)a3
{
  MFCollapsedMessageCell *v3;
  MFCollapsedMessageCell *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFCollapsedMessageCell;
  v3 = -[MFMessageConversationViewCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFCollapsedMessageCell _createPrimaryViews](v3, "_createPrimaryViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

    -[MFMessageConversationViewCell setRoundsCellCorners:](v4, "setRoundsCellCorners:", 1);
  }
  return v4;
}

- (ConversationSearchOverlayView)findOverlayView
{
  ConversationSearchOverlayView *findOverlayView;
  id v4;
  ConversationSearchOverlayView *v5;
  ConversationSearchOverlayView *v6;
  void *v7;

  findOverlayView = self->_findOverlayView;
  if (!findOverlayView)
  {
    v4 = objc_alloc((Class)ConversationSearchOverlayView);
    -[MFCollapsedMessageCell bounds](self, "bounds");
    v5 = (ConversationSearchOverlayView *)objc_msgSend(v4, "initWithFrame:");
    v6 = self->_findOverlayView;
    self->_findOverlayView = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_findOverlayView);

    findOverlayView = self->_findOverlayView;
  }
  return findOverlayView;
}

- (void)_createPrimaryViews
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  MFAvatarView *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  MessageViewStatusIndicatorManager *v26;
  void *v27;
  MessageViewStatusIndicatorManager *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewCollapsedCellBackgroundColor](UIColor, "mailConversationViewCollapsedCellBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFCollapsedMessageCell setSenderOrSubjectLabel:](self, "setSenderOrSubjectLabel:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFCollapsedMessageCell setSummaryLabel:](self, "setSummaryLabel:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v13, "addSubview:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UIDateLabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[MFCollapsedMessageCell setTimestampLabel:](self, "setTimestampLabel:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v16, "addSubview:", v17);

  -[MFCollapsedMessageCell _updateLabelColor](self, "_updateLabelColor");
  +[MFMessageDisplayMetrics avatarDiameter](MFMessageDisplayMetrics, "avatarDiameter");
  v19 = v18;
  v20 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, v19, v19);
  -[MFCollapsedMessageCell setAvatarView:](self, "setAvatarView:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v21, "setShowsContactOnTap:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v22, "setAlpha:", 0.4);

  v23 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v19, v19);
  -[MFCollapsedMessageCell setAvatarSuperview:](self, "setAvatarSuperview:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarSuperview](self, "avatarSuperview"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v24, "addSubview:", v25);

  -[MFCollapsedMessageCell _updateAvatarSuperview](self, "_updateAvatarSuperview");
  v26 = objc_alloc_init(MessageViewStatusIndicatorManager);
  -[MFCollapsedMessageCell setVerticalStatusIndicatorManager:](self, "setVerticalStatusIndicatorManager:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell verticalStatusIndicatorManager](self, "verticalStatusIndicatorManager"));
  objc_msgSend(v27, "setHidesVIPIndicator:", 1);

  v28 = objc_alloc_init(MessageViewStatusIndicatorManager);
  -[MFCollapsedMessageCell setHorizontalStatusIndicatorManager:](self, "setHorizontalStatusIndicatorManager:", v28);

  -[MFCollapsedMessageCell _updateSummaryNumberOfLines](self, "_updateSummaryNumberOfLines");
  -[MFCollapsedMessageCell _updateFonts](self, "_updateFonts");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFCollapsedMessageCell;
  -[MFMessageConversationViewCell layoutSubviews](&v3, "layoutSubviews");
  -[MFCollapsedMessageCell _layoutSubviews](self, "_layoutSubviews");
}

- (void)_layoutSubviews
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double Width;
  double v28;
  double v29;
  double Height;
  double v31;
  CGFloat v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  id v43;
  id v44;
  _QWORD *v45;
  id v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat rect;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  MFCollapsedMessageCell *v66;
  id v67;
  double v68;
  BOOL v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarSuperview](self, "avatarSuperview"));
  v5 = -[MFCollapsedMessageCell shouldHideAvatarSuperview](self, "shouldHideAvatarSuperview");
  v6 = -[MFCollapsedMessageCell mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v7 = -[MFCollapsedMessageCell shouldShowSubject](self, "shouldShowSubject");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v62, "bounds");
  rect = v11;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[MFCollapsedMessageCell _topToSenderBaselineInConversation](self, "_topToSenderBaselineInConversation");
  v19 = v18;
  -[MFCollapsedMessageCell _baselineToBaselineSpacingInConversation](self, "_baselineToBaselineSpacingInConversation");
  v21 = v20;
  -[MFCollapsedMessageCell _leadingMargin](self, "_leadingMargin");
  v23 = v22;
  objc_msgSend(v10, "avatarDiameterForCurrentContentSize");
  v25 = v24;
  v26 = v23;
  if (v6)
  {
    v70.origin.x = v13;
    v70.origin.y = v15;
    v70.size.width = v17;
    v70.size.height = rect;
    Width = CGRectGetWidth(v70);
    v71.origin.x = 0.0;
    v71.origin.y = 0.0;
    v71.size.width = v25;
    v71.size.height = v25;
    v26 = Width - (v23 + CGRectGetWidth(v71));
  }
  -[MFCollapsedMessageCell _messageTopPaddingInConversation](self, "_messageTopPaddingInConversation", *(_QWORD *)&v17, *(_QWORD *)&v15);
  v29 = v28;
  v72.origin.y = 0.0;
  v72.origin.x = v26;
  v72.size.width = v25;
  v72.size.height = v25;
  Height = CGRectGetHeight(v72);
  v31 = -0.0;
  if (!v5)
    v31 = v21;
  objc_msgSend(v4, "setFrame:", v26, v31 + v19 + v29 - Height, v25, v25);
  v32 = v13;
  v33 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
  objc_msgSend(v33, "frame");
  objc_msgSend(v33, "setFrame:");

  objc_msgSend(v3, "frame");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  if (((v6 | IsAccessibilityCategory) & 1) == 0)
  {
    v41 = v34;
    v73.origin.x = v32;
    v73.size.width = v58;
    v73.origin.y = v59;
    v73.size.height = rect;
    v42 = CGRectGetWidth(v73);
    v74.origin.x = v41;
    v74.origin.y = v36;
    v74.size.width = v38;
    v74.size.height = v40;
    v23 = v42 - CGRectGetWidth(v74) - v23;
  }
  objc_msgSend(v3, "setFrame:", v23, v36, v38, v40);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10014C23C;
  v64[3] = &unk_1005208F8;
  v69 = IsAccessibilityCategory;
  v43 = v61;
  v68 = v21;
  v65 = v43;
  v66 = self;
  v44 = v3;
  v67 = v44;
  v45 = objc_retainBlock(v64);
  if (v7)
  {
    if (IsAccessibilityCategory)
      v46 = 0;
    else
      v46 = v44;
    -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v63, 0, v46, 1, v19);
    -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v44, v63, 0, 0, v19);
    v47 = v19 + v21;
    -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v43, 0, 0, 1, v47);
    goto LABEL_14;
  }
  if (v5)
  {
    -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v63, 0, 0, 1, v19);
    v47 = v19 + v21;
    -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v43, 0, 0, 1, v47);
LABEL_14:
    ((void (*)(_QWORD *, double))v45[2])(v45, v47);
    goto LABEL_16;
  }
  -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v63, v4, v44, 1, v19);
  -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v44, v63, 0, 0, v19);
  -[MFCollapsedMessageCell _layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:](self, "_layoutLabelBetweenViews:leading:trailing:baseline:fillWidth:", v43, v4, 0, 1, v19 + v21);
LABEL_16:
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  -[MFCollapsedMessageCell _updateVerticalStatusIndicatorsFromViewModel:](self, "_updateVerticalStatusIndicatorsFromViewModel:", v48);
  -[MFCollapsedMessageCell _updateHorizontalStatusIndicatorsFromViewModel:](self, "_updateHorizontalStatusIndicatorsFromViewModel:", v48);
  if (self->_findOverlayView)
  {
    -[MFCollapsedMessageCell bounds](self, "bounds");
    v50 = v49;
    v52 = v51;
    v54 = v53;
    v56 = v55;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell findOverlayView](self, "findOverlayView"));
    objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  }
  -[MFCollapsedMessageCell mf_activateDebugModeIfEnabled](self, "mf_activateDebugModeIfEnabled");

}

- (void)_layoutLabelBetweenViews:(id)a3 leading:(id)a4 trailing:(id)a5 baseline:(double)a6 fillWidth:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  unsigned int v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  double v36;
  uint64_t v37;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  __n128 v44;
  double v45;
  double v46;
  id v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v7 = a7;
  v45 = a6;
  v47 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[MFCollapsedMessageCell mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v14, "minHorizontalSpacing");
  v16 = v15;

  -[MFCollapsedMessageCell _leadingMargin](self, "_leadingMargin");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  objc_msgSend(v19, "layoutMargins");
  v29 = v28;
  if (v13)
    v30 = v12;
  else
    v30 = v11;
  if (v13)
    v31 = v11;
  else
    v31 = v12;
  if (v13)
    v32 = v18;
  else
    v32 = v28;
  v33 = v30;
  v34 = v31;
  v35 = v34;
  if (!v33)
  {
    if (v13)
      v18 = v29;
    if (v34)
      goto LABEL_12;
LABEL_16:
    v50.origin.x = v21;
    v50.origin.y = v23;
    v50.size.width = v25;
    v50.size.height = v27;
    v36 = CGRectGetWidth(v50) - v32;
    goto LABEL_17;
  }
  objc_msgSend(v33, "frame");
  v18 = v16 + CGRectGetMaxX(v48);
  if (!v35)
    goto LABEL_16;
LABEL_12:
  objc_msgSend(v35, "frame", *(_QWORD *)&v45);
  v36 = CGRectGetMinX(v49) - v16;
LABEL_17:
  objc_msgSend(v47, "frame", *(_QWORD *)&v45);
  v41 = v39;
  v42 = v40;
  v43 = v18;
  if (!v33)
  {
    v43 = v18;
    if (!v7)
      v43 = v36 - CGRectGetWidth(*(CGRect *)&v37);
  }
  if (v7)
    v41 = v36 - v18;
  objc_msgSend(v47, "_firstBaselineOffsetFromTop");
  objc_msgSend(v47, "setFrame:", v43, v46 - UIRoundToViewScale(self, v44), v41, v42);

}

- (double)_leadingMargin
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  objc_msgSend(v3, "directionalLayoutMargins");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v6, "minHorizontalSpacing");
  v8 = v7;

  result = v5 + -7.0;
  if (v8 >= v5 + -7.0)
    return v8;
  return result;
}

+ (double)defaultHeightWithDisplayMetrics:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSString *v12;
  _BOOL4 IsAccessibilityCategory;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a3;
  objc_msgSend(v3, "messageTopPaddingInConversation");
  v5 = v4;
  objc_msgSend(v3, "topToSenderBaselineInConversation");
  v7 = v6;
  objc_msgSend(v3, "baselineToBaselineSpacingInConversation");
  v9 = v8;
  objc_msgSend(v3, "messageBottomPaddingInConversation");
  v11 = v10;
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);
  v14 = v5 + v7 + v9 + v11;

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v3, "baselineToBaselineSpacingInConversation");
    v16 = v15;
    objc_msgSend(v3, "messageBottomPaddingInConversation");
    v18 = v17;
    objc_msgSend(v3, "baselineToBaselineSpacingInConversation");
    v14 = v14 + v16 * 2.0 - v18 + v19;
  }

  return v14;
}

- (void)_updateVerticalStatusIndicatorsFromViewModel:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  double Width;
  double MaxX;
  CGFloat v18;
  void *v19;
  CGFloat Height;
  double MinX;
  void *v22;
  double v23;
  double MaxY;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double MidX;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  _QWORD v37[8];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v36 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell verticalStatusIndicatorManager](self, "verticalStatusIndicatorManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  if (-[MFCollapsedMessageCell shouldHideAvatarSuperview](self, "shouldHideAvatarSuperview"))
    v6 = v5;
  else
    v6 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarSuperview](self, "avatarSuperview"));
  v7 = v6;
  v8 = objc_msgSend(v36, "isVIP");
  v9 = objc_msgSend(v36, "isRead");
  v10 = objc_msgSend(v36, "isReplied");
  v11 = objc_msgSend(v36, "isForwarded");
  v12 = 2;
  if (!v8)
    v12 = 0;
  v13 = v12 | v9 ^ 1;
  if (v10)
    v13 |= 8uLL;
  if (v11)
    v14 = v13 | 0x10;
  else
    v14 = v13;
  objc_msgSend(v4, "setIndicatorOptions:", v14);
  objc_msgSend(v4, "pruneIndicatorOptions:", 2);
  if (objc_msgSend(v4, "effectiveIndicatorOptions"))
  {
    v15 = -[MFCollapsedMessageCell mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
    if (v15)
    {
      -[MFCollapsedMessageCell bounds](self, "bounds");
      Width = CGRectGetWidth(v38);
      objc_msgSend(v7, "frame");
      MaxX = CGRectGetMaxX(v39);
      objc_msgSend(v7, "frame");
      v18 = CGRectGetMaxX(v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
      objc_msgSend(v19, "bounds");
      Height = CGRectGetHeight(v41);
      MinX = Width - MaxX;
    }
    else
    {
      objc_msgSend(v7, "frame");
      MinX = CGRectGetMinX(v42);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
      objc_msgSend(v19, "bounds");
      Height = CGRectGetHeight(v43);
      v18 = 0.0;
    }

    objc_msgSend(v4, "updateImageViews");
    -[MFCollapsedMessageCell _baselineToBaselineSpacingInConversation](self, "_baselineToBaselineSpacingInConversation");
    v35 = v23;
    objc_msgSend(v5, "frame");
    MaxY = CGRectGetMaxY(v44);
    objc_msgSend(v5, "_baselineOffsetFromBottom");
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "font"));
    objc_msgSend(v27, "capHeight");
    v29 = v28;

    if (v15)
    {
      v45.origin.x = v18;
      v45.origin.y = 0.0;
      v45.size.width = MinX;
      v45.size.height = Height;
      MidX = CGRectGetMidX(v45);
      v46.origin.x = v18;
      v46.origin.y = 0.0;
      v46.size.width = MinX;
      v46.size.height = Height;
      v31 = CGRectGetMinX(v46) + 14.0;
      if (MidX < v31)
        v31 = MidX;
      v32 = -1.0;
    }
    else
    {
      v47.origin.x = v18;
      v47.origin.y = 0.0;
      v47.size.width = MinX;
      v47.size.height = Height;
      v33 = CGRectGetMidX(v47);
      v48.origin.x = v18;
      v48.origin.y = 0.0;
      v48.size.width = MinX;
      v48.size.height = Height;
      v31 = CGRectGetMaxX(v48) + -14.0;
      if (v33 >= v31)
        v31 = v33;
      v32 = 1.0;
    }
    v34 = v31 + v32;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusIndicatorImageViews"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10014CA0C;
    v37[3] = &unk_100520920;
    v37[4] = self;
    *(double *)&v37[5] = v34;
    *(double *)&v37[6] = MaxY - v26 + v29 * -0.5;
    *(double *)&v37[7] = v35 + 1.0;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v37);
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "statusIndicatorImageViews"));
    objc_msgSend(v22, "makeObjectsPerformSelector:", "removeFromSuperview");
  }

}

- (void)_updateHorizontalStatusIndicatorsFromViewModel:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  double Width;
  double v20;
  double MinX;
  CGFloat MinY;
  CGFloat Height;
  void *v24;
  void *v25;
  void *v26;
  double MaxX;
  void *v28;
  double MaxY;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double MidX;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  __int128 v47;
  _QWORD v48[9];
  uint64_t v49;
  double *v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
    v8 = objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  else
    v8 = objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  v9 = (void *)v8;
  v10 = objc_msgSend(v4, "isFlagged");
  v11 = objc_msgSend(v4, "hasAttachments");
  v12 = objc_msgSend(v4, "isNotify");
  v13 = objc_msgSend(v4, "isMute");
  v14 = objc_msgSend(v4, "isBlockedSender");
  v15 = 4;
  if (!v10)
    v15 = 0;
  if (v11)
    v15 |= 0x20uLL;
  if (v12)
    v15 |= 0x40uLL;
  if (v13)
    v15 |= 0x80uLL;
  if (v14)
    v16 = v15 | 0x100;
  else
    v16 = v15;
  objc_msgSend(v5, "setIndicatorOptions:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "flagColors"));
  objc_msgSend(v5, "setFlagColors:", v17);

  objc_msgSend(v5, "pruneIndicatorOptions:", 2);
  if (objc_msgSend(v5, "effectiveIndicatorOptions"))
  {
    v18 = -[MFCollapsedMessageCell mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout");
    -[MFCollapsedMessageCell bounds](self, "bounds");
    Width = CGRectGetWidth(v55);
    objc_msgSend(v9, "frame");
    v20 = Width - CGRectGetMaxX(v56);
    if (v18)
    {
      objc_msgSend(v9, "frame");
      MinX = CGRectGetMinX(v57);
      objc_msgSend(v9, "bounds");
      MinY = CGRectGetMinY(v58);
      objc_msgSend(v9, "bounds");
      Height = CGRectGetHeight(v59);
    }
    else
    {
      if (IsAccessibilityCategory)
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
      else
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
      v26 = v25;
      objc_msgSend(v25, "frame");
      MaxX = CGRectGetMaxX(v60);
      objc_msgSend(v9, "bounds");
      MinY = CGRectGetMinY(v61);
      objc_msgSend(v9, "bounds");
      Height = CGRectGetHeight(v62);
      MinX = MaxX - v20;

    }
    objc_msgSend(v5, "updateImageViews");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusIndicatorImageViews"));
    objc_msgSend(v9, "frame");
    MaxY = CGRectGetMaxY(v63);
    objc_msgSend(v9, "_baselineOffsetFromBottom");
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "font"));
    objc_msgSend(v32, "capHeight");
    v34 = v33;

    if (v18)
    {
      v64.origin.x = MinX;
      v64.origin.y = MinY;
      v64.size.width = v20;
      v64.size.height = Height;
      v35 = CGRectGetMinX(v64);
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
      objc_msgSend(v36, "frame");
      v37 = CGRectGetWidth(v65);

      objc_msgSend(v5, "midXToMidXSpacing");
      v39 = v35 + v37 * 0.5;
    }
    else
    {
      v66.origin.x = MinX;
      v66.origin.y = MinY;
      v66.size.width = v20;
      v66.size.height = Height;
      MidX = CGRectGetMidX(v66);
      v67.origin.x = MinX;
      v67.origin.y = MinY;
      v67.size.width = v20;
      v67.size.height = Height;
      v41 = CGRectGetMaxX(v67);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
      objc_msgSend(v42, "frame");
      v43 = CGRectGetWidth(v68);

      objc_msgSend(v5, "midXToMidXSpacing");
      v45 = v41 + v43 * -0.5;
      if (MidX >= v45)
        v45 = MidX;
      v46 = 0.0;
      if (IsAccessibilityCategory)
        v46 = -1.0;
      v39 = v46 + v45;
      v38 = -v44;
    }
    v49 = 0;
    v50 = (double *)&v49;
    v51 = 0x4010000000;
    v52 = &unk_1004B402D;
    *(_QWORD *)&v47 = -1;
    *((_QWORD *)&v47 + 1) = -1;
    v53 = v47;
    v54 = v47;
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10014D014;
    v48[3] = &unk_100520948;
    *(double *)&v48[6] = v39;
    *(double *)&v48[7] = v38;
    v48[4] = self;
    v48[5] = &v49;
    *(double *)&v48[8] = MaxY - v31 + v34 * -0.5;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v48);
    -[MFCollapsedMessageCell _updateLabelFrameAfterHorizontalStatusIndicators:label:](self, "_updateLabelFrameAfterHorizontalStatusIndicators:label:", v9, v50[4], v50[5], v50[6], v50[7]);
    _Block_object_dispose(&v49, 8);

  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusIndicatorImageViews"));
    objc_msgSend(v24, "makeObjectsPerformSelector:", "removeFromSuperview");

  }
}

- (void)_updateLabelFrameAfterHorizontalStatusIndicators:(CGRect)a3 label:(id)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxX;
  CGFloat rect;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  rect = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19 = a4;
  objc_msgSend(v19, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (-[MFCollapsedMessageCell mf_prefersRightToLeftInterfaceLayout](self, "mf_prefersRightToLeftInterfaceLayout"))
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = rect;
    v16 = CGRectGetMaxX(v20) + 16.0;
    v9 = v9 + v16;
  }
  else
  {
    v21.origin.x = v9;
    v21.origin.y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    MaxX = CGRectGetMaxX(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = rect;
    v16 = MaxX - CGRectGetMinX(v22) + 16.0;
  }
  objc_msgSend(v19, "setFrame:", v9, v11, v13 - v16, v15, *(_QWORD *)&rect);

}

- (void)_fontMetricCacheDidInvalidate:(id)a3
{
  -[MFCollapsedMessageCell _updateFonts](self, "_updateFonts", a3);
  -[MFCollapsedMessageCell _updateSummaryNumberOfLines](self, "_updateSummaryNumberOfLines");
  -[MFCollapsedMessageCell _sizeToFitLabels](self, "_sizeToFitLabels");
  -[MFCollapsedMessageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_sizeToFitLabels
{
  id v3;
  id v4;
  id v5;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v3, "sizeToFit");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v4, "sizeToFit");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v5, "sizeToFit");

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderSenderLabelFont](UIFont, "mf_messageHeaderSenderLabelFont"));
  sub_10014D468((uint64_t)v3, v6, v3);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderSummaryLabelFont](UIFont, "mf_messageHeaderSummaryLabelFont"));
  sub_10014D468((uint64_t)v4, v7, v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont mf_messageHeaderTimestampLabelFont](UIFont, "mf_messageHeaderTimestampLabelFont"));
  sub_10014D468((uint64_t)v5, v8, v5);

}

- (void)_updateSummaryNumberOfLines
{
  _BOOL4 IsAccessibilityCategory;
  uint64_t v4;
  NSString *v5;
  id v6;

  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
    v4 = 2;
  else
    v4 = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "setNumberOfLines:", v4);

}

- (void)setViewModel:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)MFCollapsedMessageCell;
    -[MFConversationViewCell setViewModel:](&v6, "setViewModel:", v4);
    -[MFCollapsedMessageCell _updateForViewModelChange](self, "_updateForViewModelChange");
  }

}

- (void)_updateForViewModelChange
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v3 = -[MFCollapsedMessageCell shouldShowSubject](self, "shouldShowSubject");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v5 = v4;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subjectString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
    objc_msgSend(v8, "setText:", v7);
    v21 = v5;
  }
  else
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderList"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarView](self, "avatarView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "brandIndicatorFuture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageConversationViewCell contactStore](self, "contactStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "cnStore"));
    v14 = objc_msgSend(v9, "displayPersonForEmailAddress:brandIndicatorFuture:usingContactStore:", v6, v11, v13);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageConversationViewCell contactStore](self, "contactStore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayNameForEmailAddress:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
    objc_msgSend(v15, "setText:", v8);

  }
  v22 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v22, "sizeToFit");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "summary"));

  -[MFCollapsedMessageCell _updateSummary:didComplete:](self, "_updateSummary:didComplete:");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "date"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v19, "setDate:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v20, "sizeToFit");

  -[MFCollapsedMessageCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShouldShowSubject:(BOOL)a3
{
  if (self->_shouldShowSubject != a3)
  {
    self->_shouldShowSubject = a3;
    -[MFCollapsedMessageCell _updateAvatarSuperview](self, "_updateAvatarSuperview");
    -[MFCollapsedMessageCell _updateForViewModelChange](self, "_updateForViewModelChange");
    -[MFCollapsedMessageCell _updateLabelColor](self, "_updateLabelColor");
  }
}

- (void)_updateSummary:(id)a3 didComplete:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSBundle *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MFCollapsedMessageCell *v25;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MailAppController));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (v4)
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_BODY"), &stru_100531B00, CFSTR("Main")));
    else
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_100531B00, CFSTR("Main")));
    v11 = (void *)v10;

    v7 = v11;
  }
  if (+[EMInternalPreferences preferenceEnabled:](EMInternalPreferences, "preferenceEnabled:", 7))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell viewModel](self, "viewModel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell _messageFromViewModel:](self, "_messageFromViewModel:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemID"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v14, v7));

    v7 = (void *)v15;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v16, "setText:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "text"));
  v18 = objc_msgSend(v17, "_isNaturallyRTL");

  if (v18)
    v19 = 2;
  else
    v19 = 0;
  objc_msgSend(v16, "setTextAlignment:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10014DC18;
  v23[3] = &unk_10051AA30;
  v21 = v16;
  v24 = v21;
  v25 = self;
  objc_msgSend(v20, "cachedFloat:forKey:", v23, CFSTR("conversationView.collapsedMessageCell.summary.height"));

  -[MFCollapsedMessageCell bounds](self, "bounds");
  v22 = v21;
  objc_msgSend(v22, "frame");
  objc_msgSend(v22, "setFrame:");

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFCollapsedMessageCell;
  -[MFCollapsedMessageCell setHighlighted:](&v8, "setHighlighted:");
  if (v3)
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewCollapsedCellHighlightedBackgroundColor](UIColor, "mailConversationViewCollapsedCellHighlightedBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewCollapsedCellBackgroundColor](UIColor, "mailConversationViewCollapsedCellBackgroundColor"));
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (id)_messageFromViewModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageContentRequest"));

  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageContentRequest"));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "messageLoadingContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "message"));

  return v6;
}

- (double)_topToSenderBaselineInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "topToSenderBaselineInConversation");
  v4 = v3;

  return v4;
}

- (double)_baselineToBaselineSpacingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "baselineToBaselineSpacingInConversation");
  v4 = v3;

  return v4;
}

- (double)_messageBottomPaddingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "messageBottomPaddingInConversation");
  v4 = v3;

  return v4;
}

- (double)_messageTopPaddingInConversation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCell displayMetrics](self, "displayMetrics"));
  objc_msgSend(v2, "messageTopPaddingInConversation");
  v4 = v3;

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFCollapsedMessageCell;
  -[MFCollapsedMessageCell traitCollectionDidChange:](&v5, "traitCollectionDidChange:", v4);
  -[MFCollapsedMessageCell _updateAvatarSuperview](self, "_updateAvatarSuperview");
  -[MFCollapsedMessageCell _updateLabelColor](self, "_updateLabelColor");

}

- (void)_updateAvatarSuperview
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell avatarSuperview](self, "avatarSuperview"));
  if (-[MFCollapsedMessageCell shouldHideAvatarSuperview](self, "shouldHideAvatarSuperview"))
  {
    objc_msgSend(v4, "removeFromSuperview");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell contentView](self, "contentView"));
    objc_msgSend(v3, "addSubview:", v4);

  }
}

- (BOOL)shouldHideAvatarSuperview
{
  BOOL IsAccessibilityCategory;
  NSString *v3;

  if (-[MFCollapsedMessageCell shouldShowSubject](self, "shouldShowSubject"))
    return 1;
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (BOOL)shouldApplySystemLighterMaterial
{
  return 1;
}

- (void)_updateLabelColor
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewCollapsedCellLabelColor](UIColor, "mailConversationViewCollapsedCellLabelColor"));
  if (-[MFCollapsedMessageCell shouldShowSubject](self, "shouldShowSubject"))
    v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailConversationViewCollapsedCellSubjectLabelColor](UIColor, "mailConversationViewCollapsedCellSubjectLabelColor"));
  else
    v3 = v8;
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v5, "setTextColor:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v6, "setTextColor:", v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v7, "setTextColor:", v8);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFCollapsedMessageCell;
  -[MFMessageConversationViewCell prepareForReuse](&v10, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell senderOrSubjectLabel](self, "senderOrSubjectLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell summaryLabel](self, "summaryLabel"));
  objc_msgSend(v4, "setText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell timestampLabel](self, "timestampLabel"));
  objc_msgSend(v5, "setDate:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager"));
  objc_msgSend(v6, "setIndicatorOptions:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell horizontalStatusIndicatorManager](self, "horizontalStatusIndicatorManager"));
  objc_msgSend(v7, "updateImageViews");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell verticalStatusIndicatorManager](self, "verticalStatusIndicatorManager"));
  objc_msgSend(v8, "setIndicatorOptions:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell verticalStatusIndicatorManager](self, "verticalStatusIndicatorManager"));
  objc_msgSend(v9, "updateImageViews");

  -[MFCollapsedMessageCell removeConversationSearchOverlay](self, "removeConversationSearchOverlay");
}

- (void)addConversationSearchOverlay
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell findOverlayView](self, "findOverlayView"));
  -[MFCollapsedMessageCell bringSubviewToFront:](self, "bringSubviewToFront:");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell findOverlayView](self, "findOverlayView"));
  objc_msgSend(v4, "show");

}

- (void)removeConversationSearchOverlay
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell findOverlayView](self, "findOverlayView"));
  objc_msgSend(v3, "hide");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MFCollapsedMessageCell findOverlayView](self, "findOverlayView"));
  -[MFCollapsedMessageCell sendSubviewToBack:](self, "sendSubviewToBack:");

}

- (UIDateLabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabel, a3);
}

- (MessageViewStatusIndicatorManager)verticalStatusIndicatorManager
{
  return self->_verticalStatusIndicatorManager;
}

- (void)setVerticalStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_verticalStatusIndicatorManager, a3);
}

- (MessageViewStatusIndicatorManager)horizontalStatusIndicatorManager
{
  return self->_horizontalStatusIndicatorManager;
}

- (void)setHorizontalStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, a3);
}

- (void)setFindOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_findOverlayView, a3);
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (UILabel)senderOrSubjectLabel
{
  return self->_senderOrSubjectLabel;
}

- (void)setSenderOrSubjectLabel:(id)a3
{
  objc_storeStrong((id *)&self->_senderOrSubjectLabel, a3);
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (void)setSummaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_summaryLabel, a3);
}

- (UIImageView)avatarSuperview
{
  return self->_avatarSuperview;
}

- (void)setAvatarSuperview:(id)a3
{
  objc_storeStrong((id *)&self->_avatarSuperview, a3);
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (BOOL)isActionCardHeader
{
  return self->_isActionCardHeader;
}

- (void)setIsActionCardHeader:(BOOL)a3
{
  self->_isActionCardHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_avatarSuperview, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_senderOrSubjectLabel, 0);
  objc_storeStrong((id *)&self->_findOverlayView, 0);
  objc_storeStrong((id *)&self->_horizontalStatusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_verticalStatusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
}

@end
