@implementation ReservationActionButtonTableViewCell

- (ReservationActionButtonTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReservationActionButtonTableViewCell *v4;
  UILabel *v5;
  UILabel *titleLabel;
  void *v7;
  UILabel *v8;
  UILabel *accessoryTitleLabel;
  void *v10;
  UIButton *v11;
  UIButton *actionButton;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ReservationActionButtonTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v22, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v7);

    v8 = objc_opt_new(UILabel);
    accessoryTitleLabel = v4->_accessoryTitleLabel;
    v4->_accessoryTitleLabel = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v4->_accessoryTitleLabel, "setTextColor:", v10);

    v11 = +[OverridenBackgroundColorButton newChromeBlueButton](OverridenBackgroundColorButton, "newChromeBlueButton");
    actionButton = v4->_actionButton;
    v4->_actionButton = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightMedium));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 14.0, UIFontWeightRegular));
    -[UILabel setFont:](v4->_accessoryTitleLabel, "setFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](v4, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](v4, "titleLabel"));
    objc_msgSend(v15, "addSubview:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](v4, "contentView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](v4, "accessoryTitleLabel"));
    objc_msgSend(v17, "addSubview:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](v4, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell actionButton](v4, "actionButton"));
    objc_msgSend(v19, "addSubview:", v20);

    -[ReservationActionButtonTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)setupConstraints
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
  id v54;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell actionButton](self, "actionButton"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](self, "accessoryTitleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutMarginsGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v54 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutMarginsGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstBaselineAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 32.5));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](self, "accessoryTitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](self, "accessoryTitleLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layoutMarginsGuide"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v29));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](self, "accessoryTitleLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "firstBaselineAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstBaselineAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, 18.0));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell actionButton](self, "actionButton"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layoutMarginsGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v40));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell actionButton](self, "actionButton"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 17.5));

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell actionButton](self, "actionButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell contentView](self, "contentView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v50, -17.5));

  objc_msgSend(v54, "setActive:", 1);
  objc_msgSend(v53, "setActive:", 1);
  objc_msgSend(v52, "setActive:", 1);
  objc_msgSend(v24, "setActive:", 1);
  objc_msgSend(v30, "setActive:", 1);
  objc_msgSend(v35, "setActive:", 1);
  objc_msgSend(v41, "setActive:", 1);
  objc_msgSend(v46, "setActive:", 1);
  objc_msgSend(v51, "setActive:", 1);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ReservationActionButtonTableViewCell;
  -[ReservationActionButtonTableViewCell layoutSubviews](&v7, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setText:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitle](self, "accessoryTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationActionButtonTableViewCell accessoryTitleLabel](self, "accessoryTitleLabel"));
  objc_msgSend(v6, "setText:", v5);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ReservationActionButtonTableViewCell;
  -[ReservationActionButtonTableViewCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)accessoryTitle
{
  return self->_accessoryTitle;
}

- (void)setAccessoryTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)accessoryTitleLabel
{
  return self->_accessoryTitleLabel;
}

- (void)setAccessoryTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_accessoryTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
