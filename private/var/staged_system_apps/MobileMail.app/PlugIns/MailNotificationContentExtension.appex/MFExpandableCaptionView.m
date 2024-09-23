@implementation MFExpandableCaptionView

- (MFExpandableCaptionView)initWithFrame:(CGRect)a3
{
  MFExpandableCaptionView *v3;
  MFExpandableCaptionView *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFExpandableCaptionView;
  v3 = -[MFExpandableCaptionView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFExpandableCaptionView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MFExpandableCaptionView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[MFExpandableCaptionView setParticipantDictionary:](v4, "setParticipantDictionary:", v6);

    -[MFExpandableCaptionView _createPrimaryViews](v4, "_createPrimaryViews");
    -[MFExpandableCaptionView _initializePrimaryLayoutConstraints](v4, "_initializePrimaryLayoutConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, "contentSizeCategoryDidChangeNotification:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFExpandableCaptionView;
  -[MFExpandableCaptionView dealloc](&v4, "dealloc");
}

- (void)setFont:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
    objc_msgSend(v6, "setFont:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    objc_msgSend(v7, "setFont:", v5);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D768;
    v8[3] = &unk_100038C98;
    v9 = v5;
    -[MFExpandableCaptionView iterateAtomListsWithBlock:](self, "iterateAtomListsWithBlock:", v8);

  }
}

- (void)_createPrimaryViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = objc_alloc_init((Class)MFCaptionLabel);
  -[MFExpandableCaptionView setCaptionLabel:](self, "setCaptionLabel:");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v6, "setDataSource:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v3, "setTextColor:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[MFCaptionLabel defaultFont](MFCaptionLabel, "defaultFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v4, "setFont:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  -[MFExpandableCaptionView addSubview:](self, "addSubview:");

  v11 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MFExpandableCaptionView setLastBaseLineDeceptionLabel:](self, "setLastBaseLineDeceptionLabel:");

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaseLineDeceptionLabel](self, "lastBaseLineDeceptionLabel"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaseLineDeceptionLabel](self, "lastBaseLineDeceptionLabel"));
  -[MFExpandableCaptionView addSubview:](self, "addSubview:");

}

- (void)_initializePrimaryLayoutConstraints
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
  _QWORD v26[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaseLineDeceptionLabel](self, "lastBaseLineDeceptionLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastBaselineAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  -[MFExpandableCaptionView setLastBaselineLabelConstraint:](self, "setLastBaselineLabelConstraint:", v7);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView leadingAnchor](self, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:"));
  v26[0] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView trailingAnchor](self, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:"));
  v26[1] = v18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView topAnchor](self, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v26[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bottomAnchor](self, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaseLineDeceptionLabel](self, "lastBaseLineDeceptionLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v26[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaselineLabelConstraint](self, "lastBaselineLabelConstraint"));
  v26[4] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 5));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);
}

- (void)setListSpacing:(double)a3
{
  if (self->_listSpacing != a3)
  {
    self->_listSpacing = a3;
    -[MFExpandableCaptionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  NSString *v8;
  id v9;
  NSString *v10;
  id v11;

  v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory", a3));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
  objc_msgSend(v9, "setNumberOfLines:", !IsAccessibilityCategory);

  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  v5 = UIContentSizeCategoryIsAccessibilityCategory(v10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
  if (v5)
    v7 = 0;
  else
    v7 = 4;
  v11 = v6;
  objc_msgSend(v6, "setLineBreakMode:", v7);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFExpandableCaptionView;
  -[MFExpandableCaptionView updateConstraints](&v13, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabelTrailingConstraint](self, "captionLabelTrailingConstraint"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView trailingAnchor](self, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, -5.0));
    -[MFExpandableCaptionView setCaptionLabelTrailingConstraint:](self, "setCaptionLabelTrailingConstraint:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabelTrailingConstraint](self, "captionLabelTrailingConstraint"));
    objc_msgSend(v8, "setActive:", 1);

  }
  -[MFExpandableCaptionView listSpacing](self, "listSpacing");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
  objc_msgSend(v11, "setSpacing:", v10);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000DFB0;
  v12[3] = &unk_100038C98;
  v12[4] = self;
  -[MFExpandableCaptionView iterateAtomListsWithBlock:](self, "iterateAtomListsWithBlock:", v12);
}

- (id)viewForFirstBaselineLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewForFirstBaselineLayout"));

  return v3;
}

- (void)setParticipants:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "mutableCopy");
  -[MFExpandableCaptionView setParticipantDictionary:](self, "setParticipantDictionary:", v4);

  -[MFExpandableCaptionView reloadData](self, "reloadData");
}

- (void)setOtherSigners:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("OtherSignersAtomsKey"));

    -[MFExpandableCaptionView reloadData](self, "reloadData");
  }

}

- (void)setBIMIVerified:(BOOL)a3
{
  -[MFExpandableCaptionView setBimiVerified:](self, "setBimiVerified:", a3);
  -[MFExpandableCaptionView reloadData](self, "reloadData");
}

- (void)reloadData
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
  id v26;
  void *v27;

  if (-[MFExpandableCaptionView isOutgoing](self, "isOutgoing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    objc_msgSend(v3, "setToRecipients:", 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FromAtomsKey")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    objc_msgSend(v6, "setFromSenders:", v5);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ToAtomsKey")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    objc_msgSend(v9, "setToRecipients:", v8);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    objc_msgSend(v4, "setFromSenders:", 0);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CcAtomsKey")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v12, "setCcRecipients:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BccAtomsKey")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v15, "setBccRecipients:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("OtherSignersAtomsKey")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v18, "setOtherSigners:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("ReplyToAtomsKey")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v21, "setReplyToSenders:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("FromAtomsKey")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyToSenders"));
  v26 = +[MFAddressAtomStatusManager shouldDecorateAtomListForSender:replyTo:](MFAddressAtomStatusManager, "shouldDecorateAtomListForSender:replyTo:", v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  objc_msgSend(v27, "setHasDifferentReplyToAddress:", v26);

  if (-[MFExpandableCaptionView isExpanded](self, "isExpanded"))
  {
    -[MFExpandableCaptionView _setRecipientDetailsVisible:](self, "_setRecipientDetailsVisible:", 0);
    -[MFExpandableCaptionView _setRecipientDetailsVisible:](self, "_setRecipientDetailsVisible:", 1);
    -[MFExpandableCaptionView _reattachBottomConstraint](self, "_reattachBottomConstraint");
  }
}

- (void)setExpanded:(BOOL)a3
{
  -[MFExpandableCaptionView setExpanded:animated:force:](self, "setExpanded:animated:force:", a3, 0, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;
  _QWORD *v12;
  id v13;
  void ***v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t, uint64_t);
  void *v18;
  MFExpandableCaptionView *v19;
  id v20;
  BOOL v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;

  if (self->_expanded != a3 || a5)
  {
    v6 = a4;
    v7 = a3;
    if (a3)
    {
      -[MFExpandableCaptionView _setRecipientDetailsVisible:](self, "_setRecipientDetailsVisible:", 0, a4, a5);
      -[MFExpandableCaptionView _setRecipientDetailsVisible:](self, "_setRecipientDetailsVisible:", 1);
    }
    v9 = objc_msgSend(objc_alloc((Class)MFSimpleAnimationCoordinator), "initCoordinatorAnimated:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v10, "expandableCaptionView:willBecomeExpanded:withAnimationCoordinator:") & 1) != 0)
      objc_msgSend(v10, "expandableCaptionView:willBecomeExpanded:withAnimationCoordinator:", self, v7, v9);
    if (v7 && v6)
      -[MFExpandableCaptionView layoutIfNeeded](self, "layoutIfNeeded");
    self->_expanded = v7;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000E71C;
    v22[3] = &unk_100038CC0;
    v22[4] = self;
    v24 = v7;
    v11 = v9;
    v23 = v11;
    v12 = objc_retainBlock(v22);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_10000E7C8;
    v18 = &unk_100038CE8;
    v21 = v7;
    v19 = self;
    v13 = v11;
    v20 = v13;
    v14 = objc_retainBlock(&v15);
    -[MFExpandableCaptionView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints", v15, v16, v17, v18, v19);
    if (v6)
    {
      +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v12, v14, 0.349999994, 0.0, 1.0, 0.0);
    }
    else
    {
      ((void (*)(_QWORD *))v12[2])(v12);
      ((void (*)(void ***, uint64_t))v14[2])(v14, 1);
    }

  }
}

- (void)_reattachBottomConstraint
{
  _BOOL4 expanded;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaselineLabelConstraint](self, "lastBaselineLabelConstraint"));
  objc_msgSend(v9, "setActive:", 0);

  expanded = self->_expanded;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaseLineDeceptionLabel](self, "lastBaseLineDeceptionLabel"));
  v10 = v4;
  if (expanded)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastBaselineAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastBaselineAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintGreaterThanOrEqualToAnchor:", v7));
  -[MFExpandableCaptionView setLastBaselineLabelConstraint:](self, "setLastBaselineLabelConstraint:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView lastBaselineLabelConstraint](self, "lastBaselineLabelConstraint"));
  objc_msgSend(v11, "setActive:", 1);

}

- (void)_setRecipientDetailsVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  double y;
  double width;
  double height;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  UIView *v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSString *v81;
  void *v82;
  NSString *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  id v112;
  id location;
  _QWORD v114[3];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
  v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView mf_baselineAlignedVerticalStackView](UIStackView, "mf_baselineAlignedVerticalStackView"));
      -[MFExpandableCaptionView setAtomListStackView:](self, "setAtomListStackView:", v7);

      if (-[MFExpandableCaptionView isExpanded](self, "isExpanded"))
        v8 = 1.0;
      else
        v8 = 0.0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
      objc_msgSend(v9, "setAlpha:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
      -[MFExpandableCaptionView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v10, v11);

    }
    if (!-[MFExpandableCaptionView isOutgoing](self, "isOutgoing"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ToAtomsKey")));

      if (objc_msgSend(v13, "count"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TO_HEADER"), &stru_1000393A0, CFSTR("Main")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TO_TITLE"), &stru_1000393A0, CFSTR("Main")));
        -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v13, v15, v17, CFSTR("ToAtomsKey"));

      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CcAtomsKey")));

    v109 = v19;
    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CC_HEADER"), &stru_1000393A0, CFSTR("Main")));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CC_TITLE"), &stru_1000393A0, CFSTR("Main")));
      -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v109, v21, v23, CFSTR("CcAtomsKey"));

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("BccAtomsKey")));

    v108 = v25;
    if (objc_msgSend(v25, "count"))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("BCC_HEADER"), &stru_1000393A0, CFSTR("Main")));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("BCC_TITLE"), &stru_1000393A0, CFSTR("Main")));
      -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v108, v27, v29, CFSTR("BccAtomsKey"));

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("OtherSignersAtomsKey")));

    v107 = v31;
    if (objc_msgSend(v31, "count"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("OTHER_SIGNERS_HEADER"), &stru_1000393A0, CFSTR("Main")));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("OTHER_SIGNERS_TITLE"), &stru_1000393A0, CFSTR("Main")));
      -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v107, v33, v35, CFSTR("OtherSignersAtomsKey"));

    }
    if (-[MFExpandableCaptionView isOutgoing](self, "isOutgoing"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("FromAtomsKey")));

      if (objc_msgSend(v37, "count"))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("FROM_HEADER"), &stru_1000393A0, CFSTR("Main")));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("FROM_TITLE"), &stru_1000393A0, CFSTR("Main")));
        -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v37, v39, v41, CFSTR("FromAtomsKey"));

      }
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView participantDictionary](self, "participantDictionary"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ReplyToAtomsKey")));

    v106 = v43;
    if (objc_msgSend(v43, "count"))
    {
      v44 = _EFLocalizedString(CFSTR("Reply To:"), &unk_100043890, &unk_100043898);
      v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v46 = _EFLocalizedString(CFSTR("ReplyTo"), &unk_100043890, &unk_100043898);
      v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
      -[MFExpandableCaptionView _addAtomListForAddresses:label:title:key:](self, "_addAtomListForAddresses:label:title:key:", v106, v45, v47, CFSTR("ReplyToAtomsKey"));

    }
    if (-[MFExpandableCaptionView showsBIMIWhenExpanded](self, "showsBIMIWhenExpanded")
      && -[MFExpandableCaptionView isBIMIVerified](self, "isBIMIVerified"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));

      if (!v48)
      {
        v49 = objc_alloc((Class)UIStackView);
        y = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        height = CGRectZero.size.height;
        v53 = objc_msgSend(v49, "initWithFrame:", CGRectZero.origin.x, y, width, height);
        -[MFExpandableCaptionView setBimiStackView:](self, "setBimiStackView:", v53);

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
        objc_msgSend(v54, "setAlignment:", 2);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
        objc_msgSend(v55, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v56 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView font](self, "font"));
        objc_msgSend(v56, "setFont:", v57);

        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
        objc_msgSend(v56, "setTextColor:", v58);

        v59 = _EFLocalizedString(CFSTR("Verified Logo"), &unk_100043890, &unk_100043898);
        v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
        objc_msgSend(v56, "setText:", v60);

        LODWORD(v61) = 1148846080;
        objc_msgSend(v56, "setContentHuggingPriority:forAxis:", 0, v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
        objc_msgSend(v62, "addArrangedSubview:", v56);

        v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
        objc_msgSend(v63, "setButtonSize:", 2);
        v64 = _EFLocalizedString(CFSTR("Learn More"), &unk_100043890, &unk_100043898);
        v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
        objc_msgSend(v63, "setTitle:", v65);
        location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, self);
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = sub_10000FA08;
        v111[3] = &unk_100038D10;
        objc_copyWeak(&v112, &location);
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v111));
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v63, v66));

        v68 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
        objc_msgSend(v68, "addArrangedSubview:", v67);

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
        v70 = objc_opt_new(UIView);
        objc_msgSend(v69, "addArrangedSubview:", v70);

        objc_destroyWeak(&v112);
        objc_destroyWeak(&location);

      }
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView bimiStackView](self, "bimiStackView"));
      objc_msgSend(v71, "addArrangedSubview:", v72);

    }
    if (-[MFExpandableCaptionView showsTimestampWhenExpanded](self, "showsTimestampWhenExpanded"))
    {
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
      v74 = v73 == 0;

      if (v74)
      {
        v75 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        -[MFExpandableCaptionView setTimestampLabel:](self, "setTimestampLabel:", v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
        objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v77 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView font](self, "font"));
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
        objc_msgSend(v78, "setFont:", v77);

        v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailSubtitleGrayColor](UIColor, "mailSubtitleGrayColor"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
        objc_msgSend(v80, "setTextColor:", v79);

        v81 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
        LODWORD(v80) = UIContentSizeCategoryIsAccessibilityCategory(v81);

        v82 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
        objc_msgSend(v82, "setNumberOfLines:", v80 ^ 1);

        v83 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
        LODWORD(v80) = UIContentSizeCategoryIsAccessibilityCategory(v83);

        v84 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
        v85 = v84;
        if ((_DWORD)v80)
          v86 = 0;
        else
          v86 = 4;
        objc_msgSend(v84, "setLineBreakMode:", v86);

      }
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView dateSent](self, "dateSent"));
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter ef_formatDate:shortStyle:](NSDateFormatter, "ef_formatDate:shortStyle:", v87, 0));

      v89 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
      objc_msgSend(v89, "setText:", v88);

      v90 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
      objc_msgSend(v90, "addArrangedSubview:", v91);

    }
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "firstBaselineAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView captionLabel](self, "captionLabel"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "firstBaselineAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:"));
    v114[0] = v104;
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "leadingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView leadingAnchor](self, "leadingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v94));
    v114[1] = v95;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "trailingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView trailingAnchor](self, "trailingAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:", v98));
    v114[2] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v114, 3));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v100);
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview");

    -[MFExpandableCaptionView setAtomListStackView:](self, "setAtomListStackView:", 0);
  }
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView timestampLabel](self, "timestampLabel"));
  objc_msgSend(v101, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewReceivedDateTime);

}

- (id)captionLabel:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a5;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expandableCaptionView:displayNameForEmailAddress:abbreviated:", self, v7, v5));

  return v9;
}

- (void)iterateAtomListsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void (**)(id, _QWORD))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrangedSubviews"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(MFModernLabelledAtomList);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          v4[2](v4, v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_addAtomListForAddresses:(id)a3 label:(id)a4 title:(id)a5 key:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MFExpandableCaptionView *v21;

  v18 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc((Class)MFModernLabelledAtomList);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFAddressBookManager sharedManager](MFAddressBookManager, "sharedManager"));
  v15 = objc_msgSend(v13, "initWithLabel:title:addressBook:", v10, v11, objc_msgSend(v14, "addressBook"));

  -[MFExpandableCaptionView listSpacing](self, "listSpacing");
  objc_msgSend(v15, "setLineSpacing:");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000FDD8;
  v19[3] = &unk_100038D38;
  v16 = v12;
  v20 = v16;
  v21 = self;
  objc_msgSend(v15, "setAddresses:withCompletion:", v18, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView atomListStackView](self, "atomListStackView"));
  objc_msgSend(v17, "addArrangedSubview:", v15);

}

- (void)_recipientAtomPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "expandableCaptionView:didTapAtom:forAtomType:") & 1) != 0)
    objc_msgSend(v4, "expandableCaptionView:didTapAtom:forAtomType:", self, v5, 0);

}

- (void)_senderAtomPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "expandableCaptionView:didTapAtom:forAtomType:") & 1) != 0)
    objc_msgSend(v4, "expandableCaptionView:didTapAtom:forAtomType:", self, v5, 1);

}

- (void)_replyToAtomPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "expandableCaptionView:didTapAtom:forAtomType:") & 1) != 0)
    objc_msgSend(v4, "expandableCaptionView:didTapAtom:forAtomType:", self, v5, 2);

}

- (void)_bimiLearnMorePressed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFExpandableCaptionView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "expandableCaptionViewDidTapBIMILearnMore:") & 1) != 0)
    objc_msgSend(v3, "expandableCaptionViewDidTapBIMILearnMore:", self);

}

- (MFExpandableCaptionViewDelegate)delegate
{
  return (MFExpandableCaptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)listSpacing
{
  return self->_listSpacing;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (MFCaptionLabel)captionLabel
{
  return self->_captionLabel;
}

- (void)setCaptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabel, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)hideDetailsButton
{
  return self->_hideDetailsButton;
}

- (void)setHideDetailsButton:(BOOL)a3
{
  self->_hideDetailsButton = a3;
}

- (BOOL)showsBIMIWhenExpanded
{
  return self->_showsBIMIWhenExpanded;
}

- (void)setShowsBIMIWhenExpanded:(BOOL)a3
{
  self->_showsBIMIWhenExpanded = a3;
}

- (BOOL)showsTimestampWhenExpanded
{
  return self->_showsTimestampWhenExpanded;
}

- (void)setShowsTimestampWhenExpanded:(BOOL)a3
{
  self->_showsTimestampWhenExpanded = a3;
}

- (UIStackView)atomListStackView
{
  return self->_atomListStackView;
}

- (void)setAtomListStackView:(id)a3
{
  objc_storeStrong((id *)&self->_atomListStackView, a3);
}

- (UILabel)lastBaseLineDeceptionLabel
{
  return self->_lastBaseLineDeceptionLabel;
}

- (void)setLastBaseLineDeceptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lastBaseLineDeceptionLabel, a3);
}

- (UILabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
  objc_storeStrong((id *)&self->_timestampLabel, a3);
}

- (UIStackView)bimiStackView
{
  return self->_bimiStackView;
}

- (void)setBimiStackView:(id)a3
{
  objc_storeStrong((id *)&self->_bimiStackView, a3);
}

- (NSLayoutConstraint)captionLabelTrailingConstraint
{
  return self->_captionLabelTrailingConstraint;
}

- (void)setCaptionLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_captionLabelTrailingConstraint, a3);
}

- (NSLayoutConstraint)lastBaselineLabelConstraint
{
  return self->_lastBaselineLabelConstraint;
}

- (void)setLastBaselineLabelConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lastBaselineLabelConstraint, a3);
}

- (NSMutableDictionary)participantDictionary
{
  return self->_participantDictionary;
}

- (void)setParticipantDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_participantDictionary, a3);
}

- (BOOL)isBIMIVerified
{
  return self->_bimiVerified;
}

- (void)setBimiVerified:(BOOL)a3
{
  self->_bimiVerified = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantDictionary, 0);
  objc_storeStrong((id *)&self->_lastBaselineLabelConstraint, 0);
  objc_storeStrong((id *)&self->_captionLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bimiStackView, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_lastBaseLineDeceptionLabel, 0);
  objc_storeStrong((id *)&self->_atomListStackView, 0);
  objc_storeStrong((id *)&self->_captionLabel, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
