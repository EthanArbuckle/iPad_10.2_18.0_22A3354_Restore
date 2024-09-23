@implementation HODiscoverConnectionIssueOverlayView

- (HODiscoverConnectionIssueOverlayView)initWithFrame:(CGRect)a3 withDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  HODiscoverConnectionIssueOverlayView *v10;
  HODiscoverConnectionIssueOverlayView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HODiscoverConnectionIssueOverlayView;
  v10 = -[HODiscoverConnectionIssueOverlayView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    -[HODiscoverConnectionIssueOverlayView _setupCommonViewAppearance](v11, "_setupCommonViewAppearance");
  }

  return v11;
}

- (void)_setupCommonViewAppearance
{
  id v3;
  double y;
  double width;
  double height;
  HUIconView *v7;
  HUIconView *networkIconView;
  void *v9;
  UILabel *v10;
  UILabel *descriptionLabel;
  void *v12;
  void *v13;
  UIButton *v14;
  UIButton *retryButton;
  UIButton *v16;
  __CFString *v17;
  void *v18;
  UIButton *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = objc_alloc((Class)HUIconView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (HUIconView *)objc_msgSend(v3, "initWithFrame:contentMode:", 4, CGRectZero.origin.x, y, width, height);
  networkIconView = self->_networkIconView;
  self->_networkIconView = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[HUIconView setTintColor:](self->_networkIconView, "setTintColor:", v9);

  -[HUIconView setTranslatesAutoresizingMaskIntoConstraints:](self->_networkIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HODiscoverConnectionIssueOverlayView addSubview:](self, "addSubview:", self->_networkIconView);
  v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v12);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setAdjustsFontSizeToFitWidth:](self->_descriptionLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_descriptionLabel, "setLineBreakMode:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v13);

  -[UILabel setAdjustsFontForContentSizeCategory:](self->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
  -[HODiscoverConnectionIssueOverlayView addSubview:](self, "addSubview:", self->_descriptionLabel);
  v14 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  retryButton = self->_retryButton;
  self->_retryButton = v14;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_retryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = self->_retryButton;
  v17 = sub_10000C4D0(CFSTR("HODiscoverConnectionIssueOverlayViewRetryButtonTitle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UIButton setTitle:forState:](v16, "setTitle:forState:", v18, 0);

  v19 = self->_retryButton;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  -[UIButton setTitleColor:forState:](v19, "setTitleColor:forState:", v20, 0);

  -[UIButton sizeToFit](self->_retryButton, "sizeToFit");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_retryButton, "titleLabel"));
  objc_msgSend(v22, "setFont:", v21);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_retryButton, "titleLabel"));
  objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_retryButton, "titleLabel"));
  objc_msgSend(v24, "setAdjustsFontSizeToFitWidth:", 1);

  -[UIButton addTarget:action:forEvents:](self->_retryButton, "addTarget:action:forEvents:", self, "_retryButtonPressed:", 64);
  -[HODiscoverConnectionIssueOverlayView addSubview:](self, "addSubview:", self->_retryButton);
  v25 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[HODiscoverConnectionIssueOverlayView setBackgroundColor:](self, "setBackgroundColor:", v25);

}

- (void)updateConstraints
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
  objc_super v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView layoutConstraints](self, "layoutConstraints"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8, -12.0));
    objc_msgSend(v4, "addObject:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView centerXAnchor](self, "centerXAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    objc_msgSend(v4, "addObject:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "widthAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 50.0));
    objc_msgSend(v4, "addObject:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heightAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToConstant:", 50.0));
    objc_msgSend(v4, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView centerXAnchor](self, "centerXAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    objc_msgSend(v4, "addObject:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerYAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView centerYAnchor](self, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    objc_msgSend(v4, "addObject:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView leadingAnchor](self, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, 20.0));
    objc_msgSend(v4, "addObject:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView trailingAnchor](self, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, -20.0));
    objc_msgSend(v4, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView retryButton](self, "retryButton"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
    objc_msgSend(v4, "addObject:", v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView retryButton](self, "retryButton"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "centerXAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView centerXAnchor](self, "centerXAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
    objc_msgSend(v4, "addObject:", v44);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
    -[HODiscoverConnectionIssueOverlayView setLayoutConstraints:](self, "setLayoutConstraints:", v4);

  }
  v45.receiver = self;
  v45.super_class = (Class)HODiscoverConnectionIssueOverlayView;
  -[HODiscoverConnectionIssueOverlayView updateConstraints](&v45, "updateConstraints");
}

- (void)setConnectionIssueType:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_connectionIssueType != a3)
  {
    self->_connectionIssueType = a3;
    v15 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 50.0));
    if (a3 >= 2)
    {
      if (a3 != 2)
      {
LABEL_9:
        -[HODiscoverConnectionIssueOverlayView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

        return;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
      v10 = objc_msgSend(objc_alloc((Class)HFImageIconDescriptor), "initWithSystemImageNamed:configuration:", CFSTR("exclamationmark.icloud.fill"), v15);
      objc_msgSend(v9, "updateWithIconDescriptor:displayStyle:animated:", v10, 1, 0);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView retryButton](self, "retryButton"));
      objc_msgSend(v11, "setHidden:", 0);

      v8 = CFSTR("HODiscoverConnectionIssueServerUnavailableDescription");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView networkIconView](self, "networkIconView"));
      v6 = objc_msgSend(objc_alloc((Class)HFImageIconDescriptor), "initWithSystemImageNamed:configuration:", CFSTR("wifi.slash"), v15);
      objc_msgSend(v5, "updateWithIconDescriptor:displayStyle:animated:", v6, 1, 0);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView retryButton](self, "retryButton"));
      objc_msgSend(v7, "setHidden:", 1);

      if (+[HFUtilities useWLANInsteadOfWiFi](HFUtilities, "useWLANInsteadOfWiFi"))
        v8 = CFSTR("HODiscoverConnectionIssueNetworkUnavailableDescription_WLAN");
      else
        v8 = CFSTR("HODiscoverConnectionIssueNetworkUnavailableDescription_WIFI");
    }
    v12 = sub_10000C4D0(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v14, "setText:", v13);

    goto LABEL_9;
  }
}

- (void)_retryButtonPressed:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView delegate](self, "delegate", a3));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[HODiscoverConnectionIssueOverlayView delegate](self, "delegate"));
    objc_msgSend(v5, "connectionIssueOverlayRetryButtonPressed");

  }
}

- (unint64_t)connectionIssueType
{
  return self->_connectionIssueType;
}

- (HUIconView)networkIconView
{
  return self->_networkIconView;
}

- (void)setNetworkIconView:(id)a3
{
  objc_storeStrong((id *)&self->_networkIconView, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
  objc_storeStrong((id *)&self->_retryButton, a3);
}

- (HODiscoverConnectionIssueOverlayViewDelegate)delegate
{
  return (HODiscoverConnectionIssueOverlayViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_networkIconView, 0);
}

@end
