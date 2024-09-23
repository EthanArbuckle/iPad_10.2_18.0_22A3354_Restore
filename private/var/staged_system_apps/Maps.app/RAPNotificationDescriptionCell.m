@implementation RAPNotificationDescriptionCell

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (RAPNotificationDescriptionCell)initWithFrame:(CGRect)a3
{
  RAPNotificationDescriptionCell *v3;
  RAPNotificationDescriptionCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDescriptionCell;
  v3 = -[RAPNotificationDescriptionCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RAPNotificationDescriptionCell _setupViews](v3, "_setupViews");
    -[RAPNotificationDescriptionCell _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UIStackView *v7;
  UIStackView *containerView;
  void *v9;
  UIStackView *v10;
  UIStackView *descriptionTitleContainer;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIStackView *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  Block_layout *v35;
  UIStackView *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIStackView *v44;
  void *v45;

  v3 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerView = self->_containerView;
  self->_containerView = v7;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_containerView);

  v10 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  descriptionTitleContainer = self->_descriptionTitleContainer;
  self->_descriptionTitleContainer = v10;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionTitleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_descriptionTitleContainer, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_descriptionTitleContainer, "setSpacing:", 8.0);
  -[UIStackView setAlignment:](self->_descriptionTitleContainer, "setAlignment:", 3);
  v12 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RAPNotificationDescriptionCell setStatusIconBackground:](self, "setStatusIconBackground:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
  objc_msgSend(v15, "setCornerRadius:", 12.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = self->_descriptionTitleContainer;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  -[UIStackView addArrangedSubview:](v18, "addArrangedSubview:", v19);

  v20 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RAPNotificationDescriptionCell setStatusIcon:](self, "setStatusIcon:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  objc_msgSend(v25, "setTintColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RAPNotificationDescriptionCell setTitleLabel:](self, "setTitleLabel:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v30, "setNumberOfLines:", 0);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
  objc_msgSend(v32, "setTextColor:", v31);

  v33 = sub_1002A8AA0(self);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
  if (v33 == 5)
    v35 = &stru_1011E7BF8;
  else
    v35 = &stru_1011E79F8;
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v34, v35);

  v36 = self->_descriptionTitleContainer;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
  -[UIStackView addArrangedSubview:](v36, "addArrangedSubview:", v37);

  v38 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[RAPNotificationDescriptionCell setDescriptionLabel:](self, "setDescriptionLabel:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v40, "setNumberOfLines:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v42, "setTextColor:", v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v43, &stru_1011E7A38);

  -[UIStackView addArrangedSubview:](self->_containerView, "addArrangedSubview:", self->_descriptionTitleContainer);
  v44 = self->_containerView;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
  -[UIStackView addArrangedSubview:](v44, "addArrangedSubview:", v45);

  -[UIStackView setAxis:](self->_containerView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_containerView, "setSpacing:", 10.0);
  -[UIStackView setAlignment:](self->_containerView, "setAlignment:", 1);
}

- (void)_setupConstraints
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
  _QWORD v46[10];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_containerView, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell contentView](self, "contentView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v43, 16.0));
  v46[0] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_containerView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 16.0));
  v46[1] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_containerView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:constant:", v35, -16.0));
  v46[2] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_containerView, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, -16.0));
  v46[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "widthAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v46[4] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "heightAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 24.0));
  v46[5] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "centerXAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v46[6] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v46[7] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:", v7));
  v46[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 16.0));
  v46[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_setupLinkButtonIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell viewModel](self, "viewModel"));
  v4 = objc_msgSend(v3, "shouldDisplayLink");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell linkButton](self, "linkButton"));
  v11 = v5;
  if (!v4)
  {
    objc_msgSend(v5, "removeFromSuperview");
LABEL_6:

    return;
  }

  if (!v11)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell viewModel](self, "viewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "linkButtonText"));
    objc_msgSend(v11, "setTitle:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 14.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.up.right"), v8));
    objc_msgSend(v11, "setImage:", v9);

    objc_msgSend(v11, "setImagePlacement:", 8);
    objc_msgSend(v11, "setImagePadding:", 3.0);
    objc_msgSend(v11, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    objc_msgSend(v10, "setConfiguration:", v11);
    objc_msgSend(v10, "setPreferredBehavioralStyle:", 1);
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, "_linkButtonClick", 0x2000);
    -[UIStackView addArrangedSubview:](self->_containerView, "addArrangedSubview:", v10);
    -[RAPNotificationDescriptionCell setLinkButton:](self, "setLinkButton:", v10);

    goto LABEL_6;
  }
}

- (void)_linkButtonClick
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell delegate](self, "delegate"));
  objc_msgSend(v3, "descriptionCellLinkButtonClick:", self);

}

- (void)setViewModel:(id)a3
{
  RAPNotificationDescriptionViewModel *v5;
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
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  RAPNotificationDescriptionViewModel *v28;

  v5 = (RAPNotificationDescriptionViewModel *)a3;
  if (self->_viewModel == v5)
    goto LABEL_13;
  v28 = v5;
  objc_storeStrong((id *)&self->_viewModel, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel imageName](v28, "imageName"));
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel imageBackgroundColor](v28, "imageBackgroundColor"));

  if (!v7)
  {
LABEL_6:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
    v15 = v14;
    v16 = 1;
    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel imageName](v28, "imageName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v8, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIcon](self, "statusIcon"));
  objc_msgSend(v11, "setImage:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel imageBackgroundColor](v28, "imageBackgroundColor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell statusIconBackground](self, "statusIconBackground"));
  v15 = v14;
  v16 = 0;
LABEL_7:
  objc_msgSend(v14, "setHidden:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel titleText](v28, "titleText"));
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel titleText](v28, "titleText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell titleLabel](self, "titleLabel"));
    objc_msgSend(v20, "setText:", v19);

  }
  -[UIStackView setHidden:](self->_descriptionTitleContainer, "setHidden:", v18 == 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel descriptionText](v28, "descriptionText"));
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionViewModel descriptionText](v28, "descriptionText"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v24, "setText:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
    v26 = v25;
    v27 = 0;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPNotificationDescriptionCell descriptionLabel](self, "descriptionLabel"));
    v26 = v25;
    v27 = 1;
  }
  objc_msgSend(v25, "setHidden:", v27);

  -[RAPNotificationDescriptionCell _setupLinkButtonIfNeeded](self, "_setupLinkButtonIfNeeded");
  v5 = v28;
LABEL_13:

}

- (RAPNotificationDescriptionCellDelegate)delegate
{
  return (RAPNotificationDescriptionCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RAPNotificationDescriptionViewModel)viewModel
{
  return self->_viewModel;
}

- (UILayoutGuide)cellLayoutGuide
{
  return self->_cellLayoutGuide;
}

- (void)setCellLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_cellLayoutGuide, a3);
}

- (UIImageView)statusIcon
{
  return self->_statusIcon;
}

- (void)setStatusIcon:(id)a3
{
  objc_storeStrong((id *)&self->_statusIcon, a3);
}

- (UIView)statusIconBackground
{
  return self->_statusIconBackground;
}

- (void)setStatusIconBackground:(id)a3
{
  objc_storeStrong((id *)&self->_statusIconBackground, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
  objc_storeStrong((id *)&self->_linkButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_statusIconBackground, 0);
  objc_storeStrong((id *)&self->_statusIcon, 0);
  objc_storeStrong((id *)&self->_cellLayoutGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_descriptionTitleContainer, 0);
}

@end
