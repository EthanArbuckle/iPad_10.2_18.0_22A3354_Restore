@implementation TextViewTableViewCell

- (TextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TextViewTableViewCell *v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TextViewTableViewCell;
  v4 = -[TextViewTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(UITextView);
    textView = v4->_textView;
    v4->_textView = v5;

    -[UITextView setReturnKeyType:](v4->_textView, "setReturnKeyType:", 9);
    -[UITextView setDelegate:](v4->_textView, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v7, "addSubview:", v4->_textView);

    -[TextViewTableViewCell configureToolbar](v4, "configureToolbar");
    -[TextViewTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6;

  v6 = a3;
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("\n")))
    objc_msgSend(v6, "resignFirstResponder");

  return 1;
}

- (void)doneButtonTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView", a3));
  objc_msgSend(v3, "resignFirstResponder");

}

- (void)configureToolbar
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v3 = objc_alloc_init((Class)UIToolbar);
  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("reservations_done_key"), CFSTR("localized string not found"), 0));
  v7 = objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, "doneButtonTapped:");

  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v3, "setItems:", v8);

  objc_msgSend(v3, "sizeToFit");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView"));
  objc_msgSend(v9, "setInputAccessoryView:", v3);

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
  _QWORD v29[5];

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, 18.0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutMarginsGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leftAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leftAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layoutMarginsGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell textView](self, "textView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewTableViewCell contentView](self, "contentView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "heightAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToConstant:", 200.0));

  v29[0] = v7;
  v29[1] = v13;
  v29[2] = v24;
  v29[3] = v19;
  v29[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
