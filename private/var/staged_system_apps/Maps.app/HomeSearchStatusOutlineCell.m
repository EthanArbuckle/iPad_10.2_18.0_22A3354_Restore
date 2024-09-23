@implementation HomeSearchStatusOutlineCell

- (HomeSearchStatusOutlineCell)initWithFrame:(CGRect)a3
{
  HomeSearchStatusOutlineCell *v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
  id v7;
  double y;
  double width;
  double height;
  UILabel *v11;
  UILabel *errorLabel;
  void *v13;
  void *v14;
  UIActivityIndicatorView *v15;
  UIActivityIndicatorView *loadingIndicator;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *rapButton;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  _QWORD v58[8];

  v57.receiver = self;
  v57.super_class = (Class)HomeSearchStatusOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v57, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v6, "addSubview:", v3->_stackView);

    v7 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UILabel *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    errorLabel = v3->_errorLabel;
    v3->_errorLabel = v11;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_errorLabel, "setNumberOfLines:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    -[UILabel setFont:](v3->_errorLabel, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v3->_errorLabel, "setTextColor:", v14);

    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_errorLabel);
    v15 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = v15;

    -[UIActivityIndicatorView setActivityIndicatorViewStyle:](v3->_loadingIndicator, "setActivityIndicatorViewStyle:", 100);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v3->_loadingIndicator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UIActivityIndicatorView setColor:](v3->_loadingIndicator, "setColor:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v18, "addSubview:", v3->_loadingIndicator);

    -[UIActivityIndicatorView setHidesWhenStopped:](v3->_loadingIndicator, "setHidesWhenStopped:", 0);
    -[UIActivityIndicatorView startAnimating](v3->_loadingIndicator, "startAnimating");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Add a Missing Place"), CFSTR("localized string not found"), 0));
    v56 = v19;
    objc_msgSend(v19, "setTitle:", v21);

    v22 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    rapButton = v3->_rapButton;
    v3->_rapButton = (UIButton *)v22;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_rapButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v3->_rapButton, "addTarget:action:forControlEvents:", v3, "_didTapOnRAPButton", 64);
    -[UIButton setConfiguration:](v3->_rapButton, "setConfiguration:", v19);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_stackView, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 16.0));
    v58[0] = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layoutMarginsGuide"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v48));
    v58[1] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layoutMarginsGuide"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v43));
    v58[2] = v42;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](v3, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, -16.0));
    v58[3] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView leadingAnchor](v3->_loadingIndicator, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
    v58[4] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView trailingAnchor](v3->_loadingIndicator, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v24));
    v58[5] = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView topAnchor](v3->_loadingIndicator, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_stackView, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    v58[6] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView bottomAnchor](v3->_loadingIndicator, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintLessThanOrEqualToAnchor:", v30));
    v58[7] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

  }
  return v3;
}

- (void)setCellModel:(id)a3
{
  HomeSearchStatusOutlineCellModel *v5;
  HomeSearchStatusOutlineCellModel *v6;
  unsigned __int8 v7;
  HomeSearchStatusOutlineCellModel *v8;

  v5 = (HomeSearchStatusOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[HomeSearchStatusOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[HomeSearchStatusOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  id v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unsigned int v14;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel errorString](self->_cellModel, "errorString"));
    v6 = -[HomeSearchStatusOutlineCellModel enableStructuredRAPAffordance](self->_cellModel, "enableStructuredRAPAffordance");
    v11 = 138412546;
    v12 = v5;
    v13 = 1024;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Loading started for search %@ enableStructuredRAPAffordance %d", (uint8_t *)&v11, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel errorString](self->_cellModel, "errorString"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel errorString](self->_cellModel, "errorString"));
    -[UILabel setText:](self->_errorLabel, "setText:", v9);

    -[UIActivityIndicatorView setHidden:](self->_loadingIndicator, "setHidden:", 1);
    -[UILabel setHidden:](self->_errorLabel, "setHidden:", 0);
    if (-[HomeSearchStatusOutlineCellModel enableStructuredRAPAffordance](self->_cellModel, "enableStructuredRAPAffordance"))
    {
      -[HomeSearchStatusOutlineCell _addRAPButton](self, "_addRAPButton");
    }
    else
    {
      -[HomeSearchStatusOutlineCell _removeRAPButton](self, "_removeRAPButton");
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCell contentView](self, "contentView"));
    objc_msgSend(v10, "invalidateIntrinsicContentSize");

  }
  else
  {
    -[UIActivityIndicatorView setHidden:](self->_loadingIndicator, "setHidden:", 0);
    -[UILabel setHidden:](self->_errorLabel, "setHidden:", 1);
    -[HomeSearchStatusOutlineCell _removeRAPButton](self, "_removeRAPButton");
  }
}

- (void)_addRAPButton
{
  -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", self->_rapButton);
}

- (void)_removeRAPButton
{
  -[UIStackView removeArrangedSubview:](self->_stackView, "removeArrangedSubview:", self->_rapButton);
  -[UIButton removeFromSuperview](self->_rapButton, "removeFromSuperview");
}

- (void)_didTapOnRAPButton
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel delegate](self->_cellModel, "delegate"));
  objc_msgSend(v2, "didTapOnReportAnIssue");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeSearchStatusOutlineCell;
  -[HomeSearchStatusOutlineCell prepareForReuse](&v3, "prepareForReuse");
  -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
}

- (HomeSearchStatusOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_bottomAnchorContraint, 0);
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end
