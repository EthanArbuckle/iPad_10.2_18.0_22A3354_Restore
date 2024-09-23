@implementation ExtensionTextInputViewController

- (ExtensionTextInputViewController)initWithTitle:(id)a3 placeholderText:(id)a4 text:(id)a5
{
  id v8;
  id v9;
  id v10;
  ExtensionTextInputViewController *v11;
  ExtensionTextInputViewController *v12;
  NSString *v13;
  NSString *placeholderText;
  NSString *v15;
  NSString *initializedText;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ExtensionTextInputViewController;
  v11 = -[ExtensionTextInputViewController initWithStyle:](&v18, "initWithStyle:", 1);
  v12 = v11;
  if (v11)
  {
    -[ExtensionTextInputViewController setTitle:](v11, "setTitle:", v8);
    v13 = (NSString *)objc_msgSend(v9, "copy");
    placeholderText = v12->_placeholderText;
    v12->_placeholderText = v13;

    v15 = (NSString *)objc_msgSend(v10, "copy");
    initializedText = v12->_initializedText;
    v12->_initializedText = v15;

  }
  return v12;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ExtensionTextInputViewController;
  -[ExtensionTextInputViewController viewDidLoad](&v3, "viewDidLoad");
  -[ExtensionTextInputViewController configureTableView](self, "configureTableView");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ExtensionTextInputViewController;
  -[ExtensionTextInputViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  objc_msgSend(v4, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ExtensionTextInputViewController;
  -[ExtensionTextInputViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController inputDelegate](self, "inputDelegate"));
  objc_msgSend(v4, "extensionTextInputViewControllerDidComplete:", self);

}

- (void)configureTableView
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setTableFooterView:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController tableView](self, "tableView"));
  v6 = objc_opt_class(TextViewTableViewCell);
  v7 = (objc_class *)objc_opt_class(TextViewTableViewCell);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", v6, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setRowHeight:", UITableViewAutomaticDimension);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setScrollEnabled:", 0);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 120.0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (objc_class *)objc_opt_class(TextViewTableViewCell);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textView"));
  -[ExtensionTextInputViewController setTextView:](self, "setTextView:", v10);

  -[ExtensionTextInputViewController configureTextView](self, "configureTextView");
  return v9;
}

- (void)configureTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  objc_msgSend(v6, "setFont:", v5);

  v7 = objc_alloc((Class)NSAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController placeholderText](self, "placeholderText"));
  v9 = objc_msgSend(v7, "initWithString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  objc_msgSend(v10, "setAttributedPlaceholder:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));
  if (objc_msgSend(v12, "length"))
    goto LABEL_4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController initializedText](self, "initializedText"));
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController initializedText](self, "initializedText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
    objc_msgSend(v12, "setText:", v11);
LABEL_4:

  }
  v16 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "textContainer"));
  objc_msgSend(v15, "setLineFragmentPadding:", 0.0);

}

- (void)doneButtonTapped:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController inputDelegate](self, "inputDelegate", a3));
  objc_msgSend(v4, "extensionTextInputViewControllerDidComplete:", self);

}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionTextInputViewController textView](self, "textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (ExtensionTextInputViewControllerDelegate)inputDelegate
{
  return (ExtensionTextInputViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_inputDelegate, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
}

- (NSString)initializedText
{
  return self->_initializedText;
}

- (void)setInitializedText:(id)a3
{
  objc_storeStrong((id *)&self->_initializedText, a3);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_initializedText, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
}

@end
