@implementation MTAAlarmEditableTextCell

- (MTAAlarmEditableTextCell)initWithText:(id)a3 autoCapsType:(int64_t)a4
{
  id v6;
  MTAAlarmEditableTextCell *v7;
  MTAAlarmEditableTextCell *v8;
  UITextField *v9;
  UITextField *textField;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MTAAlarmEditableTextCell *v20;
  objc_super v22;

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTAAlarmEditableTextCell;
  v7 = -[MTAAlarmEditableTextCell init](&v22, "init");
  v8 = v7;
  if (v7)
  {
    -[MTAAlarmEditableTextCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    v9 = (UITextField *)objc_msgSend(objc_alloc((Class)UITextField), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    textField = v8->_textField;
    v8->_textField = v9;

    -[UITextField _setForcesClearButtonHighContrastAppearance:](v8->_textField, "_setForcesClearButtonHighContrastAppearance:", 1);
    -[UITextField setText:](v8->_textField, "setText:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_primaryTextColor](UIColor, "mtui_primaryTextColor"));
    -[UITextField setTextColor:](v8->_textField, "setTextColor:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_tintColor](UIColor, "mtui_tintColor"));
    -[UITextField setTintColor:](v8->_textField, "setTintColor:", v12);

    -[UITextField setAutocapitalizationType:](v8->_textField, "setAutocapitalizationType:", a4);
    -[UITextField setBorderStyle:](v8->_textField, "setBorderStyle:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    -[UITextField setFont:](v8->_textField, "setFont:", v13);

    -[UITextField setAdjustsFontForContentSizeCategory:](v8->_textField, "setAdjustsFontForContentSizeCategory:", 1);
    -[UITextField setAdjustsFontSizeToFitWidth:](v8->_textField, "setAdjustsFontSizeToFitWidth:", 1);
    -[UITextField setReturnKeyType:](v8->_textField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v8->_textField, "setClearButtonMode:", 3);
    -[UITextField setDelegate:](v8->_textField, "setDelegate:", v8);
    -[UITextField setEnablesReturnKeyAutomatically:](v8->_textField, "setEnablesReturnKeyAutomatically:", 1);
    -[UITextField setKeyboardAppearance:](v8->_textField, "setKeyboardAppearance:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _clearButton](v8->_textField, "_clearButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageForState:", 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mtui_imageWithTintColor:", v16));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField _clearButton](v8->_textField, "_clearButton"));
    objc_msgSend(v18, "setImage:forState:", v17, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditableTextCell contentView](v8, "contentView"));
    objc_msgSend(v19, "addSubview:", v8->_textField);

    -[MTAAlarmEditableTextCell setNeedsLayout](v8, "setNeedsLayout");
    v20 = v8;

  }
  return v8;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTAAlarmEditableTextCell;
  -[MTAAlarmEditableTextCell layoutSubviews](&v13, "layoutSubviews");
  if (-[UITextField isUserInteractionEnabled](self->_textField, "isUserInteractionEnabled"))
    v3 = 18.0;
  else
    v3 = 22.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAlarmEditableTextCell contentView](self, "contentView"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  UIRectCenteredYInRect(9.0, 0.0, v10 - v3, v12, v6, v8, v10, v12);
  -[UITextField setFrame:](self->_textField, "setFrame:");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("kMTAEditAlarmTitleFinishedNotification"), 0);

  }
  return v4 != 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[MTAAlarmEditableTextCell isUserInteractionEnabled](self, "isUserInteractionEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmEditableTextCell;
    -[MTAAlarmEditableTextCell setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:", v3);
    -[UITextField setUserInteractionEnabled:](self->_textField, "setUserInteractionEnabled:", v3);
    -[MTAAlarmEditableTextCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
