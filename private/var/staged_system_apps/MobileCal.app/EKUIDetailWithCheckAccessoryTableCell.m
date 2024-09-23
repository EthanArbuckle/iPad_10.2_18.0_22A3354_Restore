@implementation EKUIDetailWithCheckAccessoryTableCell

- (EKUIDetailWithCheckAccessoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIDetailWithCheckAccessoryTableCell *v4;
  id v5;
  UILabel *v6;
  UILabel *detailLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  UILabel *v13;
  UILabel *titleLabel;
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
  objc_super v47;
  _QWORD v48[6];

  v47.receiver = self;
  v47.super_class = (Class)EKUIDetailWithCheckAccessoryTableCell;
  v4 = -[EKUIDetailWithCheckAccessoryTableCell initWithStyle:reuseIdentifier:](&v47, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, &stru_1001B67C0);
    objc_msgSend(v5, "setAccessoryType:", 3);
    v6 = objc_opt_new(UILabel);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v6;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
    -[UILabel setFont:](v4->_detailLabel, "setFont:", v9);

    v46 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailTextLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textColor"));
    -[UILabel setTextColor:](v4->_detailLabel, "setTextColor:", v11);

    LODWORD(v12) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v4->_detailLabel, "setContentHuggingPriority:forAxis:", 0, v12);
    -[EKUIDetailWithCheckAccessoryTableCell addSubview:](v4, "addSubview:", v4->_detailLabel);
    v13 = objc_opt_new(UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "font"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell contentView](v4, "contentView"));
    objc_msgSend(v19, "addSubview:", v4->_titleLabel);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell trailingAnchor](v4, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_detailLabel, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 46.0));
    v48[0] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_detailLabel, "firstBaselineAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v4->_titleLabel, "firstBaselineAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
    v48[1] = v40;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell contentView](v4, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "layoutMarginsGuide"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v36));
    v48[2] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_detailLabel, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v33, 1.0));
    v48[3] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell contentView](v4, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layoutMarginsGuide"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v21));
    v48[4] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[EKUIDetailWithCheckAccessoryTableCell contentView](v4, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layoutMarginsGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v26));
    v48[5] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  }
  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
