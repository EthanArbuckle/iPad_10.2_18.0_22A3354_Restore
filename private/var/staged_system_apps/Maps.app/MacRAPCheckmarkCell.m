@implementation MacRAPCheckmarkCell

- (MacRAPCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MacRAPCheckmarkCell *v4;
  MacRAPCheckmarkCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacRAPCheckmarkCell;
  v4 = -[MacRAPCheckmarkCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MacRAPCheckmarkCell _setupSubviews](v4, "_setupSubviews");
    -[MacRAPCheckmarkCell _setupConstraints](v5, "_setupConstraints");
    -[MacRAPCheckmarkCell _updateCheckmarkButton](v5, "_updateCheckmarkButton");
    -[MacRAPCheckmarkCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
  }
  return v5;
}

- (void)_setupSubviews
{
  UISwitch *v3;
  UISwitch *checkmarkSwitch;
  void *v5;
  UILabel *v6;
  UILabel *checkmarkLabel;
  void *v8;
  void *v9;
  void *v10;

  v3 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  checkmarkSwitch = self->_checkmarkSwitch;
  self->_checkmarkSwitch = v3;

  -[UISwitch addTarget:action:forControlEvents:](self->_checkmarkSwitch, "addTarget:action:forControlEvents:", self, "_checkmarkToggled", 4096);
  -[UISwitch setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkSwitch, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UISwitch setBackgroundColor:](self->_checkmarkSwitch, "setBackgroundColor:", v5);

  -[UISwitch setContentVerticalAlignment:](self->_checkmarkSwitch, "setContentVerticalAlignment:", 3);
  -[UISwitch setContentHorizontalAlignment:](self->_checkmarkSwitch, "setContentHorizontalAlignment:", 3);
  v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  checkmarkLabel = self->_checkmarkLabel;
  self->_checkmarkLabel = v6;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_checkmarkLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFontManager regularTitleFont](RAPFontManager, "regularTitleFont"));
  -[UILabel setFont:](self->_checkmarkLabel, "setFont:", v8);

  -[UILabel setNumberOfLines:](self->_checkmarkLabel, "setNumberOfLines:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  objc_msgSend(v9, "addSubview:", self->_checkmarkSwitch);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_checkmarkLabel);

  -[MacRAPCheckmarkCell _updateCheckmarkButton](self, "_updateCheckmarkButton");
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
  _QWORD v32[8];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch leadingAnchor](self->_checkmarkSwitch, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, 30.0));
  v32[0] = v28;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch centerYAnchor](self->_checkmarkSwitch, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v32[1] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch widthAnchor](self->_checkmarkSwitch, "widthAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 20.0));
  v32[2] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch heightAnchor](self->_checkmarkSwitch, "heightAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch widthAnchor](self->_checkmarkSwitch, "widthAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v32[3] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UISwitch trailingAnchor](self->_checkmarkSwitch, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_checkmarkLabel, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, -7.0));
  v32[4] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_checkmarkLabel, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v13, -15.0));
  v32[5] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_checkmarkLabel, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 25.0));
  v32[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_checkmarkLabel, "lastBaselineAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -12.0));
  v32[7] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setDisplayText:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_displayText != v5)
  {
    objc_storeStrong((id *)&self->_displayText, a3);
    -[UILabel setText:](self->_checkmarkLabel, "setText:", v5);
  }

}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    -[MacRAPCheckmarkCell _updateCheckmarkButton](self, "_updateCheckmarkButton");
  }
}

- (void)_updateCheckmarkButton
{
  -[UISwitch setOn:](self->_checkmarkSwitch, "setOn:", self->_checked);
}

+ (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (void)_checkmarkToggled
{
  id v3;

  -[MacRAPCheckmarkCell setChecked:](self, "setChecked:", !self->_checked);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MacRAPCheckmarkCell delegate](self, "delegate"));
  objc_msgSend(v3, "checkmarkTableViewCell:isSelected:", self, self->_checked);

}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (NSString)displayText
{
  return self->_displayText;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (MacRAPCheckmarkCellDelegate)delegate
{
  return (MacRAPCheckmarkCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_checkmarkLabel, 0);
  objc_storeStrong((id *)&self->_checkmarkSwitch, 0);
}

@end
