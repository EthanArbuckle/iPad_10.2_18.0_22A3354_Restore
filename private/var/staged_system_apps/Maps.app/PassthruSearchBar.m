@implementation PassthruSearchBar

- (PassthruSearchBar)init
{
  return -[PassthruSearchBar initWithStyle:](self, "initWithStyle:", 0);
}

- (PassthruSearchBar)initWithStyle:(int64_t)a3
{
  PassthruSearchBar *v4;
  PassthruSearchBar *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  double *v9;
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
  id v21;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[4];
  void *v46;

  v44.receiver = self;
  v44.super_class = (Class)PassthruSearchBar;
  v4 = -[PassthruSearchBar initWithFrame:](&v44, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (!v4)
    return v5;
  -[PassthruSearchBar setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("MapsSearchBar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchField](v5, "searchField"));
  objc_msgSend(v6, "setDelegate:", v5);

  -[PassthruSearchBar setTranslucent:](v5, "setTranslucent:", 1);
  -[PassthruSearchBar setOpaque:](v5, "setOpaque:", 0);
  v7 = objc_opt_new(UIImage);
  -[PassthruSearchBar setBackgroundImage:](v5, "setBackgroundImage:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PassthruSearchBar setBackgroundColor:](v5, "setBackgroundColor:", v8);

  -[PassthruSearchBar _setBackdropStyle:](v5, "_setBackdropStyle:", 2005);
  -[PassthruSearchBar _setAutoDisableCancelButton:](v5, "_setAutoDisableCancelButton:", 0);
  -[PassthruSearchBar setCenterPlaceholder:](v5, "setCenterPlaceholder:", 0);
  if (!a3)
  {
    v9 = (double *)&qword_100E39438;
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v9 = (double *)&qword_100E39440;
LABEL_6:
    -[PassthruSearchBar setContentInset:](v5, "setContentInset:", *v9, 16.0, *v9, 16.0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v10, "_setRoundedRectBackgroundCornerRadius:", 10.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v11, "setBecomesFirstResponderOnClearButtonTap:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v12, "setAutocorrectionType:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v13, "setSpellCheckingType:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v14, "setTextLoupeVisibility:", 3);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v15, "setReturnKeyType:", 6);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v16, "setEnablesReturnKeyAutomatically:", 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v17, "setEnablesReturnKeyOnNonWhiteSpaceContent:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v18, "setClipsToBounds:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("MapsSearchTextField"));

  if (sub_1002A8AA0(v5) != 5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
    objc_msgSend(v20, "setClearButtonMode:", 1);

  }
  v21 = objc_alloc_init((Class)UIFocusGuide);
  -[PassthruSearchBar setFocusGuide:](v5, "setFocusGuide:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](v5, "searchTextField"));
  v46 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  objc_msgSend(v24, "setPreferredFocusEnvironments:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  -[PassthruSearchBar addLayoutGuide:](v5, "addLayoutGuide:", v25);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar topAnchor](v5, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v41));
  v45[0] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar bottomAnchor](v5, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v45[1] = v36;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar leadingAnchor](v5, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v45[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar focusGuide](v5, "focusGuide"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar trailingAnchor](v5, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v45[3] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  return v5;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGSize result;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchTextField](self, "searchTextField"));
    objc_msgSend(v3, "intrinsicContentSize");
    v5 = v4;

    -[PassthruSearchBar contentInset](self, "contentInset");
    v7 = v5 + v6;
    -[PassthruSearchBar contentInset](self, "contentInset");
    v9 = v7 + v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PassthruSearchBar;
    -[PassthruSearchBar intrinsicContentSize](&v11, "intrinsicContentSize");
  }
  v10 = UIViewNoIntrinsicMetric;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PassthruSearchBar;
  -[PassthruSearchBar setContentInset:](&v4, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
  -[PassthruSearchBar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PassthruSearchBar;
  v4 = a3;
  -[PassthruSearchBar traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[PassthruSearchBar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setTextColor:(id)a3
{
  void *v5;
  UIColor *v6;

  v6 = (UIColor *)a3;
  if (self->_textColor != v6)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchField](self, "searchField"));
    objc_msgSend(v5, "setTextColor:", v6);

  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "textFieldShouldReturn:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v8 = objc_msgSend(v7, "textFieldShouldReturn:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  unsigned __int8 v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v12 = objc_opt_respondsToSelector(v11, "textField:shouldChangeCharactersInRange:replacementString:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v14 = objc_msgSend(v13, "textField:shouldChangeCharactersInRange:replacementString:", v9, location, length, v10);

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "textFieldShouldClear:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v8 = objc_msgSend(v7, "textFieldShouldClear:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v5 = sub_100B3A5D4();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneInsights"));
  objc_msgSend((id)v7, "preload");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  LOBYTE(v7) = objc_opt_respondsToSelector(v8, "textFieldShouldBeginEditing:");

  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v10 = objc_msgSend(v9, "textFieldShouldBeginEditing:", v4);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "textFieldDidBeginEditing:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    objc_msgSend(v6, "textFieldDidBeginEditing:", v7);

  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "textFieldShouldEndEditing:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v8 = objc_msgSend(v7, "textFieldShouldEndEditing:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "textFieldDidEndEditing:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    objc_msgSend(v6, "textFieldDidEndEditing:", v7);

  }
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "keyboardInputShouldDelete:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar textFieldDelegate](self, "textFieldDelegate"));
    v8 = objc_msgSend(v7, "keyboardInputShouldDelete:", v4);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3));
  v5 = objc_msgSend(v4, "isRunningTest");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PassthruSearchBar searchField](self, "searchField"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PPTShouldSendTextChangeNotification"), v7);

  }
  return 1;
}

- (UITextFieldDelegate)textFieldDelegate
{
  return (UITextFieldDelegate *)objc_loadWeakRetained((id *)&self->_textFieldDelegate);
}

- (void)setTextFieldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textFieldDelegate, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_textFieldDelegate);
}

@end
