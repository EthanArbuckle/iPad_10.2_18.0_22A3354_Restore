@implementation TopBannerItemView

- (TopBannerItemView)initWithFrame:(CGRect)a3
{
  TopBannerItemView *v3;
  TopBannerItemView *v4;
  TopBannerItemView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TopBannerItemView;
  v3 = -[TopBannerItemView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TopBannerItemView _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (TopBannerItemView)initWithCoder:(id)a3
{
  TopBannerItemView *v3;
  TopBannerItemView *v4;
  TopBannerItemView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TopBannerItemView;
  v3 = -[TopBannerItemView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[TopBannerItemView _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_item)
    -[TopBannerItemView _deregisterObservers](self, "_deregisterObservers");
  v3.receiver = self;
  v3.super_class = (Class)TopBannerItemView;
  -[TopBannerItemView dealloc](&v3, "dealloc");
}

- (void)_customInit
{
  MKArtworkImageView *v3;
  MKArtworkImageView *badgeImageView;
  UILabel *v5;
  UILabel *messageLabel;
  void *v7;
  double v8;
  HairlineView *v9;
  HairlineView *hairlineView;

  v3 = (MKArtworkImageView *)objc_alloc_init((Class)MKArtworkImageView);
  badgeImageView = self->_badgeImageView;
  self->_badgeImageView = v3;

  -[MKArtworkImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_badgeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MKArtworkImageView setContentMode:](self->_badgeImageView, "setContentMode:", 4);
  -[TopBannerItemView addSubview:](self, "addSubview:", self->_badgeImageView);
  v5 = (UILabel *)objc_alloc_init((Class)UILabel);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_messageLabel, "setTextColor:", v7);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_messageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", self->_messageLabel, &stru_1011C5818);
  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 4);
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_messageLabel, "setLineBreakMode:", 4);
  LODWORD(v8) = 0;
  -[UILabel setContentHuggingPriority:forAxis:](self->_messageLabel, "setContentHuggingPriority:forAxis:", 0, v8);
  -[TopBannerItemView addSubview:](self, "addSubview:", self->_messageLabel);
  v9 = -[HairlineView initWithFrame:]([HairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  hairlineView = self->_hairlineView;
  self->_hairlineView = v9;

  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](self->_hairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TopBannerItemView addSubview:](self, "addSubview:", self->_hairlineView);
  -[TopBannerItemView _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *messageLabelToTrailingConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *badgeViewToMessageLabelConstraint;
  NSLayoutConstraint *v18;
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
  NSLayoutConstraint *v30;
  NSLayoutConstraint *badgeViewWidthConstraint;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[11];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  LODWORD(v6) = 1148846080;
  objc_msgSend(v5, "setContentHuggingPriority:forAxis:", 0, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView trailingAnchor](self, "trailingAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -9.0));
  messageLabelToTrailingConstraint = self->_messageLabelToTrailingConstraint;
  self->_messageLabelToTrailingConstraint = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v15, -7.0));
  badgeViewToMessageLabelConstraint = self->_badgeViewToMessageLabelConstraint;
  self->_badgeViewToMessageLabelConstraint = v16;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView leadingAnchor](self, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 9.0));
  v61[0] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView topAnchor](self, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 9.0));
  v61[1] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v18 = self->_badgeViewToMessageLabelConstraint;
  v61[2] = v48;
  v61[3] = v18;
  v61[4] = self->_messageLabelToTrailingConstraint;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](self->_hairlineView, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v61[5] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](self->_hairlineView, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView trailingAnchor](self, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -9.0));
  v61[6] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView topAnchor](self, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v37, &stru_1011C5818, 9.0));
  v61[7] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "firstBaselineAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView topAnchor](self, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v32, &stru_1011C5818, 19.0));
  v61[8] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView bottomAnchor](self, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView messageLabel](self, "messageLabel"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastBaselineAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v22, 11.0));
  v61[9] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](self->_hairlineView, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView bottomAnchor](self, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
  v61[10] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView badgeImageView](self, "badgeImageView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "widthAnchor"));
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 0.0));
  badgeViewWidthConstraint = self->_badgeViewWidthConstraint;
  self->_badgeViewWidthConstraint = v30;

}

- (void)setHairlineVisible:(BOOL)a3
{
  -[HairlineView setHidden:](self->_hairlineView, "setHidden:", !a3);
}

- (BOOL)isHairlineVisible
{
  return -[HairlineView isHidden](self->_hairlineView, "isHidden") ^ 1;
}

- (void)setItem:(id)a3
{
  TopBannerItem *v5;
  TopBannerItem *item;
  TopBannerItem *v7;

  v5 = (TopBannerItem *)a3;
  item = self->_item;
  if (item != v5)
  {
    v7 = v5;
    if (item)
      -[TopBannerItemView _deregisterObservers](self, "_deregisterObservers");
    objc_storeStrong((id *)&self->_item, a3);
    -[TopBannerItemView _updateUI](self, "_updateUI");
    v5 = v7;
  }

}

- (void)setFirstItemWithIcon:(BOOL)a3
{
  if (self->_firstItemWithIcon != a3)
  {
    self->_firstItemWithIcon = a3;
    -[MKArtworkImageView setHidden:](self->_badgeImageView, "setHidden:", -[TopBannerItemView isFirstItemWithIcon](self, "isFirstItemWithIcon") ^ 1);
  }
}

- (void)_buttonTapped:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView item](self, "item", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonAction"));

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TopBannerItemView item](self, "item"));
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "buttonAction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView item](self, "item"));
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
}

- (void)updateBadgeView
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem artwork](self->_item, "artwork"));
  -[MKArtworkImageView setImageSource:](self->_badgeImageView, "setImageSource:", v3);

  -[MKArtworkImageView setHidden:](self->_badgeImageView, "setHidden:", !self->_firstItemWithIcon);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_badgeImageView, "image"));

  if (v4)
    v5 = -7.0;
  else
    v5 = 0.0;
  -[NSLayoutConstraint setActive:](self->_badgeViewWidthConstraint, "setActive:", v4 == 0);
  -[NSLayoutConstraint setConstant:](self->_badgeViewToMessageLabelConstraint, "setConstant:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKArtworkImageView image](self->_badgeImageView, "image"));
  if (v6)
  {
    v7 = 4;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton superview](self->_button, "superview"));
    if (v8)
      v7 = 4;
    else
      v7 = 1;

  }
  -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", v7);
}

- (void)_updateUI
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  UIButton *button;
  void *v10;
  _BOOL8 v11;
  UIButton *v12;
  UIButton *v13;
  double v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *messageLabelToButtonConstraint;
  void *v35;
  void *v36;
  NSLayoutConstraint *v37;
  UIButton *v38;
  void *v39;
  TopBannerItem *item;
  NSString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem buttonText](self->_item, "buttonText"));
  if (objc_msgSend(v3, "length"))
    v4 = -[TopBannerItem maxNumberOfLines](self->_item, "maxNumberOfLines");
  else
    v4 = 0;
  -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem attributedText](self->_item, "attributedText"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem attributedText](self->_item, "attributedText"));
    -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", v6);

  }
  else
  {
    -[UILabel setAttributedText:](self->_messageLabel, "setAttributedText:", 0);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem buttonText](self->_item, "buttonText"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    button = self->_button;
    if (!button)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView traitCollection](self, "traitCollection"));
      v11 = objc_msgSend(v10, "userInterfaceIdiom") != (id)5;

      v12 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", v11));
      v13 = self->_button;
      self->_button = v12;

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:", self, "_buttonTapped:", 64);
      LODWORD(v14) = 1148829696;
      -[UIButton setContentHuggingPriority:forAxis:](self->_button, "setContentHuggingPriority:forAxis:", 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_button, "titleLabel"));
      +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v15, &stru_1011E7A78);

      button = self->_button;
    }
    if ((-[UIButton isDescendantOfView:](button, "isDescendantOfView:", self) & 1) == 0)
      -[TopBannerItemView addSubview:](self, "addSubview:", self->_button);
    v16 = -[TopBannerItem layout](self->_item, "layout");
    if (v16 == 1)
    {
      if (!self->_messageLabelToButtonConstraint)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_messageLabel, "lastBaselineAnchor"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton firstBaselineAnchor](self->_button, "firstBaselineAnchor"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
        v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v32, &stru_1011C5818, -19.0));
        messageLabelToButtonConstraint = self->_messageLabelToButtonConstraint;
        self->_messageLabelToButtonConstraint = v33;

      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_messageLabel, "leadingAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:"));
      v48[0] = v46;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_messageLabel, "trailingAnchor"));
      v43 = objc_claimAutoreleasedReturnValue(-[TopBannerItemView trailingAnchor](self, "trailingAnchor"));
      v45 = v35;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v43, 7.0));
      v48[1] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView bottomAnchor](self, "bottomAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](self->_button, "lastBaselineAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:", v26));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v27, &stru_1011C5818, 11.0));
      v37 = self->_messageLabelToButtonConstraint;
      v23 = (void *)v43;
      v48[2] = v36;
      v48[3] = v37;
      v48[4] = self->_messageLabelToTrailingConstraint;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 5));

      v21 = v44;
    }
    else
    {
      if (v16)
      {
LABEL_22:
        v38 = self->_button;
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem buttonText](self->_item, "buttonText"));
        -[UIButton setTitle:forState:](v38, "setTitle:forState:", v39, 0);

        goto LABEL_23;
      }
      if (!self->_messageLabelToButtonConstraint)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_messageLabel, "trailingAnchor"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_button, "leadingAnchor"));
        v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -7.0));
        v20 = self->_messageLabelToButtonConstraint;
        self->_messageLabelToButtonConstraint = v19;

      }
      -[NSLayoutConstraint setActive:](self->_messageLabelToTrailingConstraint, "setActive:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_button, "trailingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView trailingAnchor](self, "trailingAnchor"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", -9.0));
      v49[0] = v46;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton firstBaselineAnchor](self->_button, "firstBaselineAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_messageLabel, "firstBaselineAnchor"));
      v45 = v22;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
      v49[1] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItemView bottomAnchor](self, "bottomAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](self->_button, "lastBaselineAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintGreaterThanOrEqualToAnchor:constant:", v26, 11.0));
      v28 = self->_messageLabelToButtonConstraint;
      v49[2] = v27;
      v49[3] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 4));
    }

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);
    goto LABEL_22;
  }
  -[NSLayoutConstraint setActive:](self->_messageLabelToTrailingConstraint, "setActive:", 1);
  -[UIButton removeFromSuperview](self->_button, "removeFromSuperview");
LABEL_23:
  item = self->_item;
  v41 = NSStringFromSelector("artwork");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  -[TopBannerItem addObserver:forKeyPath:options:context:](item, "addObserver:forKeyPath:options:context:", self, v42, 0, off_1014B5C20);

  -[TopBannerItemView updateBadgeView](self, "updateBadgeView");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  NSString *v9;
  void *v10;
  id v12;

  v8 = a3;
  v9 = NSStringFromSelector("artwork");
  v12 = (id)objc_claimAutoreleasedReturnValue(v9);
  v10 = off_1014B5C20;

  if (v10 == a6 && v12 == v8)
    -[TopBannerItemView updateBadgeView](self, "updateBadgeView");

}

- (void)_deregisterObservers
{
  NSString *v3;
  id v4;

  v3 = NSStringFromSelector("artwork");
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  -[TopBannerItem removeObserver:forKeyPath:context:](self->_item, "removeObserver:forKeyPath:context:", self, v4, off_1014B5C20);

}

- (BOOL)isFirstItemWithIcon
{
  return self->_firstItemWithIcon;
}

- (TopBannerItem)item
{
  return self->_item;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (MKArtworkImageView)badgeImageView
{
  return self->_badgeImageView;
}

- (void)setBadgeImageView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImageView, a3);
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_messageLabelToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_badgeViewToMessageLabelConstraint, 0);
  objc_storeStrong((id *)&self->_badgeViewWidthConstraint, 0);
}

@end
