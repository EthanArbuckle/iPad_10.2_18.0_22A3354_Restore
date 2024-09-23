@implementation MTALabelEditCell

- (void)awakeFromNib
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTALabelEditCell;
  -[MTALabelEditCell awakeFromNib](&v2, "awakeFromNib");
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTALabelEditCell;
  -[MTALabelEditCell setSelected:animated:](&v4, "setSelected:animated:", a3, a4);
}

- (MTALabelEditCell)initWithDelegate:(id)a3 currentTitle:(id)a4 isEmpty:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  MTALabelEditCell *v10;
  MTALabelEditCell *v11;
  void *v12;
  void *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[MTALabelEditCell init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[MTALabelEditCell setDelegate:](v10, "setDelegate:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](v11, "textfield"));
    v13 = v12;
    if (v5)
      objc_msgSend(v12, "setPlaceholder:", v9);
    else
      objc_msgSend(v12, "setText:", v9);

  }
  return v11;
}

- (MTALabelEditCell)init
{
  return -[MTALabelEditCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, off_1000BE688);
}

- (MTALabelEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTALabelEditCell *v4;
  MTALabelEditCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTALabelEditCell;
  v4 = -[MTALabelEditCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
    -[MTALabelEditCell localSetup](v4, "localSetup");
  return v5;
}

- (void)localSetup
{
  -[MTALabelEditCell setupLabel](self, "setupLabel");
  -[MTALabelEditCell setupTextField](self, "setupTextField");
  -[MTALabelEditCell setupLayoutConstraints](self, "setupLayoutConstraints");
}

- (void)setupLabel
{
  UILabel *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;

  v3 = objc_opt_new(UILabel);
  -[MTALabelEditCell setLabel:](self, "setLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_LABEL"), &stru_10009A4D0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  LODWORD(v11) = 1144750080;
  objc_msgSend(v10, "setContentHuggingPriority:forAxis:", 0, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  LODWORD(v13) = 1148846080;
  objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 0, v13);

  v15 = (id)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  objc_msgSend(v15, "addSubview:", v14);

}

- (void)setupTextField
{
  UITextField *v3;
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
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = objc_opt_new(UITextField);
  -[MTALabelEditCell setTextfield:](self, "setTextfield:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v9, "setDelegate:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v10, "setTextAlignment:", 2);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v11, "setReturnKeyType:", 9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v12, "setClearButtonMode:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  LODWORD(v14) = 1144750080;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 0, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "textValueChanged:", UITextFieldTextDidChangeNotification, v16);

  v18 = (id)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v18, "addSubview:", v17);

}

- (void)setupLayoutConstraints
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
  NSMutableArray *v31;

  v31 = objc_opt_new(NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutMarginsGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v7));
  -[NSMutableArray addObject:](v31, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerYAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  -[NSMutableArray addObject:](v31, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 8.0));
  -[NSMutableArray addObject:](v31, "addObject:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layoutMarginsGuide"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v23));
  -[MTALabelEditCell setTextfieldTrailConstraint:](self, "setTextfieldTrailConstraint:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfieldTrailConstraint](self, "textfieldTrailConstraint"));
  -[NSMutableArray addObject:](v31, "addObject:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v29));
  -[NSMutableArray addObject:](v31, "addObject:", v30);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);
}

- (void)activate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MTALabelEditCell;
  -[MTALabelEditCell dealloc](&v4, "dealloc");
}

- (BOOL)showingClearButton
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  if (objc_msgSend(v3, "isFirstResponder"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)adjustClearButtonInset
{
  unsigned int v3;
  void *v4;
  void *v5;
  double v6;

  v3 = -[MTALabelEditCell showingClearButton](self, "showingClearButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfieldTrailConstraint](self, "textfieldTrailConstraint"));
  v5 = v4;
  v6 = 0.0;
  if (v3)
    v6 = 8.0;
  objc_msgSend(v4, "setConstant:", v6);

  -[MTALabelEditCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTALabelEditCell;
  v4 = a3;
  -[MTALabelEditCell setFont:](&v7, "setFont:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell label](self, "label", v7.receiver, v7.super_class));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v6, "setFont:", v4);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5));

  if (!objc_msgSend(v9, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultEditLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
    objc_msgSend(v8, "setPlaceholder:", v7);

  }
  -[MTALabelEditCell adjustClearButtonInset](self, "adjustClearButtonInset");

}

- (void)textValueChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "text"));
  objc_msgSend(v4, "didUpdateWithLabel:sender:", v5, self);

  -[MTALabelEditCell adjustClearButtonInset](self, "adjustClearButtonInset");
}

- (void)setCurrentTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  objc_msgSend(v5, "setText:", v4);

}

- (id)getCurrentLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTALabelEditCell textfield](self, "textfield"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return v3;
}

- (MTALabelEditCellDelegate)delegate
{
  return (MTALabelEditCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UITextField)textfield
{
  return self->_textfield;
}

- (void)setTextfield:(id)a3
{
  objc_storeStrong((id *)&self->_textfield, a3);
}

- (NSLayoutConstraint)textfieldTrailConstraint
{
  return self->_textfieldTrailConstraint;
}

- (void)setTextfieldTrailConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textfieldTrailConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textfieldTrailConstraint, 0);
  objc_storeStrong((id *)&self->_textfield, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
