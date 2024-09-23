@implementation GuidanceSearchResultCell

- (GuidanceSearchResultCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  GuidanceSearchResultCell *v4;
  GuidanceSearchResultCell *v5;
  void *v6;
  void *v7;
  id v8;
  double y;
  double width;
  double height;
  UILabel *v12;
  UILabel *titleLabel;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *descriptionLabel;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIButton *actionButton;
  void *v23;
  UIButton *v24;
  UIImage *v25;
  UIButton *v26;
  void *v27;
  void *v28;
  UIButton *v29;
  void *v30;
  void *v31;
  UIActivityIndicatorView *v32;
  UIActivityIndicatorView *actionButtonActivityIndicatorView;
  UILayoutGuide *v34;
  void *v35;
  UILayoutGuide *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  void *v61;
  UILayoutGuide *v62;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  objc_super v93;
  _QWORD v94[16];

  v93.receiver = self;
  v93.super_class = (Class)GuidanceSearchResultCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v93, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[GuidanceSearchResultCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    -[GuidanceSearchResultCell setPreservesSuperviewLayoutMargins:](v5, "setPreservesSuperviewLayoutMargins:", 0);
    -[GuidanceSearchResultCell setLayoutMargins:](v5, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[GuidanceSearchResultCell setSeparatorInset:](v5, "setSeparatorInset:", 0.0, 15.0, 0.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v6, "setPreservesSuperviewLayoutMargins:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v7, "setLayoutMargins:", 0.0, 15.0, 0.0, 15.0);

    v8 = objc_alloc((Class)UILabel);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v12 = (UILabel *)objc_msgSend(v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleTitle2, 2));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v15, "addSubview:", v5->_titleLabel);

    v16 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleFootnote, 0));
    -[UILabel setFont:](v5->_descriptionLabel, "setFont:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.419999987, 1.0));
    -[UILabel setTextColor:](v5->_descriptionLabel, "setTextColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v20, "addSubview:", v5->_descriptionLabel);

    v21 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    actionButton = v5->_actionButton;
    v5->_actionButton = (UIButton *)v21;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v5->_actionButton, "layer"));
    objc_msgSend(v23, "setCornerRadius:", 5.0);

    v24 = v5->_actionButton;
    v25 = objc_opt_new(UIImage);
    -[UIButton setBackgroundImage:forState:](v24, "setBackgroundImage:forState:", v25, 0);

    v26 = v5->_actionButton;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("GO_SAR"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v26, "setTitle:forState:", v28, 0);

    v29 = v5->_actionButton;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTitleColor:forState:](v29, "setTitleColor:forState:", v30, 0);

    -[UIButton addTarget:action:forControlEvents:](v5->_actionButton, "addTarget:action:forControlEvents:", v5, "_actionButtonAction:", 64);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v31, "addSubview:", v5->_actionButton);

    v32 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    actionButtonActivityIndicatorView = v5->_actionButtonActivityIndicatorView;
    v5->_actionButtonActivityIndicatorView = v32;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionButtonActivityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addSubview:](v5->_actionButton, "addSubview:", v5->_actionButtonActivityIndicatorView);
    v34 = objc_opt_new(UILayoutGuide);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    objc_msgSend(v35, "addLayoutGuide:", v34);

    v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v34, "leadingAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "layoutMarginsGuide"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "constraintEqualToAnchor:", v89));
    v94[0] = v88;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v34, "trailingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v5->_actionButton, "leadingAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:constant:", v86, -10.0));
    v94[1] = v85;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](v34, "centerYAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "layoutMarginsGuide"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "centerYAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v81));
    v94[2] = v80;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v5->_actionButton, "trailingAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell contentView](v5, "contentView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "layoutMarginsGuide"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "trailingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v76));
    v94[3] = v75;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](v5->_actionButton, "widthAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToConstant:", 60.0));
    v94[4] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v5->_actionButton, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v34, "topAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
    v94[5] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v5->_actionButton, "bottomAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v34, "bottomAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
    v94[6] = v67;
    v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerXAnchor](v5->_actionButtonActivityIndicatorView, "centerXAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v5->_actionButton, "centerXAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v94[7] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIActivityIndicatorView centerYAnchor](v5->_actionButtonActivityIndicatorView, "centerYAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v5->_actionButton, "centerYAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v61));
    v94[8] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v36 = v34;
    v62 = v34;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v34, "leadingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
    v94[9] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v34, "trailingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
    v94[10] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v34, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v94[11] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_descriptionLabel, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v34, "leadingAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
    v94[12] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_descriptionLabel, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v34, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v37));
    v94[13] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_descriptionLabel, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v94[14] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_descriptionLabel, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v36, "bottomAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
    v94[15] = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 16));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v45);

  }
  return v5;
}

- (void)updateTheme
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultCell;
  -[MapsThemeTableViewCell updateTheme](&v6, "updateTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "keyColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell actionButton](self, "actionButton"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setActionButtonLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_actionButtonLoading != a3)
  {
    v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell actionButton](self, "actionButton"));
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      objc_msgSend(v5, "setTitleColor:forState:", v6, 0);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell actionButtonActivityIndicatorView](self, "actionButtonActivityIndicatorView"));
      objc_msgSend(v8, "startAnimating");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      objc_msgSend(v5, "setTitleColor:forState:", v7, 0);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell actionButtonActivityIndicatorView](self, "actionButtonActivityIndicatorView"));
      objc_msgSend(v8, "stopAnimating");
    }

  }
}

- (void)_actionButtonAction:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell actionButton](self, "actionButton"));

  if (v5 == v4)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultCell delegate](self, "delegate"));
    objc_msgSend(v6, "guidanceSearchResultCellDidTapActionButton:", self);

  }
}

- (GuidanceSearchResultCellDelegate)delegate
{
  return (GuidanceSearchResultCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UIActivityIndicatorView)actionButtonActivityIndicatorView
{
  return self->_actionButtonActivityIndicatorView;
}

- (BOOL)isActionButtonLoading
{
  return self->_actionButtonLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonActivityIndicatorView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
